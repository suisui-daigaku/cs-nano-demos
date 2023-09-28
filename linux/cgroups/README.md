# Cgroups 

[【中期考核答辩】Rust agent 支持 systemd cgroup_哔哩哔哩_bilibili](https://www.bilibili.com/video/BV1BB4y1G7K7/?spm_id_from=333.337.search-card.all.click&vd_source=eefa19ed1149679e6ec8d83a6f2eebcc)

[[add] systemd cgroup -5f7da2706b-袁卓/kata-containers (gitlink.org.cn)](https://www.gitlink.org.cn/realsnoopy/kata-containers/commits/5f7da2706b)


根据袁卓大佬的调研，cgoups 可以由 (1)subssystem 目录控制 (2) systemmd 命令控制。

k8s 比较推荐 systemmd，但需要两个都了解一下 (手动实现一个 docker)
