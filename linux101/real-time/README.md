# Tuning a real-time kernel 

by Edoardo Barbieri on 19 June 2023

https://ubuntu.com/blog/real-time-kernel-tuning

Tags: Industrial , real-time Linux


This blog expands our  [technical deep-dive into a real-time kernel](https://ubuntu.com/blog/real-time-kernel-technical).  You will need to be familiar with a real-time kernel to understand the tuning concepts in this blog. If you are starting from scratch and need to revisit the basics of preemption and a real-time system, watch this [introductory webinar](https://ubuntu.com/engage/an-introduction-to-real-time-linux-part-i). If you are interested in the primary test suites for real-time Ubuntu, an explanation of the components and processes involved, head over to [the first part](https://ubuntu.com/blog/real-time-kernel-technical) of this mini-series. Alternatively, keep reading to learn the three primary metrics to monitor when tuning a real-time kernel, some key configs set at compile time, and a tuning example.

Before tuning, let’s launch the real-time Ubuntu kernel.

## Launching the real-time kernel

Canonical’s real-time kernel can be accessed through Ubuntu Pro, an extensive enterprise security and compliance subscription (free for personal and small-scale commercial use on up to 5 machines). With an Ubuntu Pro subscription, launching the kernel becomes a simple process:

```
pro attach <token>
pro enable realtime-kernel
```

Moreover, Canonical offers specialised versions of the real-time kernel. [Optimised real-time Ubuntu](https://ubuntu.com/download/iot/intel-iot) on 12th Gen Intel® Core™ processors, currently in beta, delivers low latency for time-sensitive workloads in industrial settings.

To access real-time Ubuntu on Intel SoCs, Ubuntu Pro is also the way to go:

```
pro attach <token>
pro enable realtime-kernel --variant intel-iotg
```

## Considerations before tuning


Once you launch a real-time kernel, you can start tuning.  Tuning a real-time kernel is a complex endeavour, as [each layer of a real-time stack](https://ubuntu.com/blog/real-time-kernel-technical) must support deterministic processing. From the hardware to the kernel, and finally through to the application, every level can be a source of latency. A real-time kernel on its own will not necessarily make a system real-time, as even the most efficient Real Time Operating System (RTOS) can be useless in the presence of other latency sinks. Specific tuning for each use case is required, and an optimal combination of tuning configs for one particular hardware platform may still lead to poor results in a different environment. Real-time Ubuntu does not guarantee a maximum latency as performance strictly depends on the system at hand. From networking to cache partitioning, every shared resource can affect cycle times and be a source of jitter. Setting up a real-time configuration to meet stringent low-latency requirements takes careful understanding and tuning.

What follows are considerations that may prove helpful in some real-time environments. Rather than recommended configurations leading to optimal performance, they are intended as starting points for a subsequent, iterative tuning process. Only the engineering team developing a real-time stack controls the deployment environment and can decide on the best tuning configuration options. The real-time developers architecting the overall hardware and software system are responsible for end-application tuning and optimisation of individual drivers for specific workloads.

![](2023-09-28-23-15-57.png)

Each layer must prioritise real-time workloads and allocate resources to deliver the low-latencies and tight time synchronisation needed to support deterministic workloads.

## Metrics and tools for tuning

The three primary metrics to monitor when tuning a real-time kernel are jitter, average latency and max latency.

The maximum latency is the key metric, and it is fundamental to know its value before running in production. A preemptive kernel aims to provide a deterministic response time to service events, with system failure in case of missed deadlines regardless of the system load. For instance, if the maximum latency for an airbag is 10 μs, any reaction time higher than the specified upper boundary results in system failure. When tuning, one must ensure the real-time system can process threads and processes within the maximum latency measured during each task period or the real-time application lifetime. Jitter is the difference between average and max latency over time. 

Typical tools to capture system resource statistics which are useful for tuning are [ps](https://www.man7.org/linux/man-pages/man1/ps.1.html), [perf](https://www.man7.org/linux/man-pages/man1/perf.1.html), [irqtop](https://www.man7.org/linux/man-pages/man1/irqtop.1.html), [stress-ng](https://github.com/ColinIanKing/stress-ng), [Cyclictest](https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/cyclictest/start), irqstat, dstat, and watch_interupts. One can monitor by, for instance,  watching the interrupts at /proc/interrupts via the watch command as per:

```
watch -n1 -d "cat /proc/interrupts"
```

Similarly, the ps command can help determine information like the processors on which a task is running on and its priority level via:

```
ps -eo psr,tid,pid,comm,%cpu,priority,nice -T | sort -g | grep irq
```

TuneD, RTLA and ftrace are alternative tools that may assist when tuning. TuneD is a userspace tool to set parameters and tuning profiles without manually modifying the grub configuration file. It helps isolate CPUs and set iirqs. The [real-time Linux Analysis (RTLA)](https://docs.kernel.org/tools/rtla/index.html) tool, [merged into upstream 5.17](https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4d66020dcef83314092f2c8c89152a8d122627e2), can trace kernel latencies. It is not available in Ubuntu 22.04 but can be backported; it requires libtracefs v1.3.0. Finally, [ftrace](https://www.kernel.org/doc/Documentation/trace/ftrace.txt) to profile applications is also worthy of mention, and it helps assess latencies and performance issues occurring outside of user-space.


## BIOS options

Whereas the previous paragraphs mentioned jitter, average latency and max latency as the primary metrics to monitor, this section lists some BIOS options to look for when tuning a real-time kernel.

In a real-time system, the kernel is not the only possible source of latency. The applications, the hardware, firmware and BIOS for the hardware can also influence this. In addition to tuning parameters and applications, a real-time developer needs to review and consider these BIOS options when setting up a low-latency environment: 

- SMIs 
- C state
- Intel speed step
- Turbo mode 
- VTx 
- VTd 
- Hyperthreading

Identifying and tweaking kernel config options are arguably the most time-consuming, iterative activities to reduce latency when tuning. The following paragraphs will highlight and explain key tuning parameters and boot options. Starting with `CONFIG_NO_HZ_FULL` to omit scheduling-clock ticks and `CONFIG_RCU_NOCB_CPU` to enable callback offloading. We will cover relevant boot parameters, followed by an overview of kthread_cpus, to specify which CPU to use for kernel threads. Finally, we will provide reference code snippets for assigning real-time threads and processes to specific cores at runtime, as well as an example of adding config options `/etc/default/grub`.

## Config options

This section highlights some tuning configs set at compile time when using a real-time kernel.


### Scheduling-clock ticks

As `nohz=on` for tickless CPUs disables the timer tick on the specified CPUs, the `CONFIG_NO_HZ_FULL` config option indicates how the system will generate clock checks and will cause the kernel to avoid sending scheduling-clock interrupts to CPUs with a single runnable task or are idle.

`nohz_full=<list of isolated cpus>` reduces the number of scheduling-clock interrupts, improving energy efficiency and reducing OS jitter. 

When tuning a real-time system, it is customary to assign one task per CPU. By setting `CONFIG_NO_HZ_FULL= y` it will omit scheduling-clock ticks on CPUs that are either idle or that have only one runnable task. 
Please note the boot CPU cannot run in `nohz_full` mode, as at least one CPU needs to continue to receive interrupts and do the necessary housekeeping. Further information can be found in the [kernel.org documentation](https://www.kernel.org/doc/Documentation/timers/NO_HZ.txt).


### RCU callbacks

Another config option is [Read-copy-update (RCU)](https://www.kernel.org/doc/html/latest/RCU/) with no callbacks: `CONFIG_RCU_NOCB_CPU = y`. RCU carries out significant processing in [Softirqs](https://github.com/torvalds/linux/blob/master/kernel/softirq.c) contexts, during which preemption is disabled, causing unbounded latencies. These callbacks often free memory with memory allocators imposing large latencies when taking slow paths. For example, `rcu_nocbs=1,3-4` would enable callback offloading on CPUs 1, 3, and 4.

The real-time Ubuntu kernel sets it to all, as per `CONFIG_RCU_NOCB_CPU_ALL = y`

`rcu_nocb_poll` makes kthreads poll for callbacks instead of explicitly awakening the corresponding kthreads. The RCU offload threads will be periodically raised by a timer to check if there are callbacks to run. In this way, `rcu_nocb_poll` helps improve the real-time response for the offloaded CPUs by relieving them of the need to wake up the corresponding kthread.  

The above tuning configs are done at compile time. Once set,  they can’t be changed unless the kernel is recompiled. Preemptiveness can, on the other hand, be dynamically changed at run time. 
The discussion so far exposed parameters for scheduling clock ticks and RCU config options. The remainder of this section will introduce further boot parameters, like `timer_migration` and `sched_rt_runtime`, as well as common approaches to handle IRQ interrupts.


### Boot parameters

This section lists a few additional parameters worth monitoring when tuning a real-time Linux system with PREEMPT_RT, like `kthread_cpus`, `domain`, `isolcpus`, `timer_migration` and `sched_rt_runtime`. For a more thorough discussion, please refer to the [kernel’s documentation](https://www.kernel.org/doc/html/v5.15/admin-guide/kernel-parameters.html).

Kernel threads like ksoftirqd, kworker and migration need to run on every CPU regardless of isolation, and  `kthread_cpus` to define CPUs for kernel threads, can be particularly handy.

`domain` removes the CPUs from the scheduling algorithm. `isolcpus` is used specifically for userspace or real-time processing. It isolates CPUs so they only run specific tasks, and will have a limited number of kernel threads to run. This way, housekeeping threads won’t run on these CPUs and prevents them from being targeted by managed interrupts.

In a real-time system with multiple sockets, it helps to turn the `timer_migration` parameter off so as to prevent the timer from migrating between them. By setting `timer_migration = 0` in a multi socket machine, the time will stay assigned to a core. 

The `echo 0 > /proc/sys/kernel/timer_migration` command will set the relevant information.

`sched_rt_runtime` is an important kernel parameter to specify the number of μs during which a real-time process can dominate a  CPU. When running tasks on `isolcpus`, setting `kernel.sched_rt_runtime_us = -1` turns off throttling, allowing a process or real-time task to dominate the CPU indefinitely. Setting it to -1 via:

```
echo -1 > /proc/sys/kernel/sched_rt_runtime_us  
```

is often desired when tuning a system as all real-time processes or threads will be on cores 1-95 (and can thus be allowed to dominate the CPU). Please note limiting the execution time of real-time tasks per period can be dangerous on a generic system without isolated CPUs and is only advised on a real-time kernel.



### IRQ Affinity

[IRQ interrupts](https://www.kernel.org/doc/html/latest/power/suspend-and-interrupts.html), often originating from device drivers, can cause issues with the tuning of real-time processes. For instance, pushing a button on a keyboard or moving the mouse can cause interrupts which have to be processed by the CPU.

Common parameters to handle IRQ interrupts are `kthread_cpus`, to specify which CPU to use for all kernel threads, `irqaffinity` and `isolcpus`. 

Every IRQ can be seen in `/proc/interrupts` and `irqaffinity=<list of non-isolated cpus>` assigns all IRQs to the specified core. 

`/etc/systemd/system.conf` defines the IRQ affinity, which can be set as `CPUAffinity=0`. Checking the current IRQ affinity per interrupt is easy via a for loop through the IRQs listed in  `/proc/irq`, followed by the `$i` IRQ number:

```bash 
for i in {1..54} ; do cat /proc/irq/$i/smp_affinity; done  
```

The file `smp_affinity` will then clarify on which core or CPU the IRQs are assigned to (0 in this case).

### Assigning threads to cores

This section provides examples of assigning real-time threads and processes to specific cores at runtime.

The `taskset` and `cset` commands, the POSIX function calls, or other software using the CPU affinity syscalls specify which CPUs to run drivers and real-time applications.  Otherwise tasks will be assigned to any of the CPUs defined by `isolcpus`. 

At runtime you can use the taskset command to pin a process to a specific CPU by specifying the `CPU_NUM` (cpu number) and PID as:

```bash 
taskset -pc CPU_NUM[s] PID
```

The below example code snippet exemplifies how to assign CPU 0 to 7 to a specific `cpuset`:

```bash
/* Set affinity mask to include CPUs 0 to 7. */
           CPU_ZERO(&cpuset);
           for (int j = 0; j < 8; j++)
               CPU_SET(j, &cpuset);
```

Communicating existing threads to only run on CPUs 0 to 7 can be done by setting the affinity as per:

```bash 
s = pthread_setaffinity_np(thread, sizeof(cpuset), &cpuset);
/* Sets the CPU affinity mask for the given thread to the given set of CPUs*/
```

### Adding params to grub

As an example to shed some further light, the tuning parameters discussed so far can be set by adding the following line to `/etc/default/grub`:

```bash 
GRUB_CMDLINE_LINUX_DEFAULT="console=tty0 console=ttyS0,115200 skew_tick=1 rcu_nocb_poll rcu_nocbs=1-95 nohz=on nohz_full=1-95 kthread_cpus=0 irqaffinity=0 isolcpus=managed_irq,domain,1-95 intel_pstate=disable nosoftlockup tsc=nowatchdog"
```

The above refers to a 96-cores machine, where CPU core 0 is for housekeeping and kernel work, and will handle all IRQs. 1-95 is the list of CPUs where the isolation options are applied for real-time userspace applications. Furthermore, `nohz` disables the timer tick on the specified CPUs and `domain` removes the CPUs from the scheduling algorithms. 


## Tuning example

A generic Linux kernel will often lead to spikes in latency. Similarly, while the average latency will decrease, an out-of-the-box real-time kernel with no tuning can have maximum latency values higher than desired.

Performance strictly depends on the system at hand. However, a good rule of thumb for the maximum latency of a real-time Linux system is around 100 μs. On the other hand, real-time Ubuntu with a few changes to boot parameters can result in an average latency of 2-3 μs and max latency dropping considerably, with all values well under 100 μs.

The easiest way to get a feel for the improved results is to compare a generic Linux kernel with the non-tuned, default real-time Ubuntu and a tuned version.

Start by creating pre-defined grub files in which to put boot parameters. Those strictly depend on the specific use case – for instance, after a bit of tuning, 2 housekeeping CPUs may be the most effective. A real-time developer must figure this out on their system.

Assuming the below example combination leads to optimal results, add these boot parameters:


```
rcu_nocb_poll rcu_nocbs=2-95 nohz=on nohz_full=2-95 kthread_cpus=0,1 irqaffinity=0,1 isolcpus=managed_irq,domain,2-95
```


Then, set the IRQ affinity in `/etc/systemd/system.conf` and disable throttling as per:


```bash 
sudo sysctl kernel.sched_rt_runtime_us=-1
echo -1 > /proc/sys/kernel/sched_rt_runtime_us
```


You can now disable timer migration via:

```bash 
sudo sysctl kernel.timer_migration=0
echo 0 > /proc/sys/kernel/timer_migration
```


Finally, update grub and reboot. At this point, you can run Cyclictest to get baseline values for average and max latency:

```
sudo cyclictest --mlockall --smp --priority=80 --interval=30 --distance=0
```

## Considerations after tuning

Tuning is an iterative process, and it is advisable to tweak one parameter at a time while measuring the results. Depending on the environment and how stringent the latency requirements are, tuning and testing a real-time system to evaluate and check its performance can take multiple days and potentially weeks. Despite the effort, tuning can bring beneficial effects and tangible improvements in latency results.


## Further reading

When building your real-time applications, the below material from the Linux Foundation may also be helpful: 

- [HOWTO build a simple RT application](https://wiki.linuxfoundation.org/realtime/documentation/howto/applications/application_base)
- [HOWTO build a basic cyclic application](https://wiki.linuxfoundation.org/realtime/documentation/howto/applications/cyclic)
- [Memory for Real-time Applications](https://wiki.linuxfoundation.org/realtime/documentation/howto/applications/memory)
- [CPU idle power saving methods for real-time workloads](https://wiki.linuxfoundation.org/realtime/documentation/howto/applications/cpuidle)
- [HOWTO: RT latency debugging](https://wiki.linuxfoundation.org/realtime/documentation/howto/debugging/start)
- [HOWTO: RT tools and utilities](https://wiki.linuxfoundation.org/realtime/documentation/howto/tools/start)

