# signal.h

<https://www.techonthenet.com/c_language/standard_library_functions/signal_h/signal.php>

```c
/* Example using signal by TechOnTheNet.com */

#include <stdio.h>
#include <stdlib.h>
#include <signal.h>

void signal_handler(int signal)
{
    /* Display a message indicating we have received a signal */
    if (signal == SIGSEGV) printf("[Singel Handler]: Received a SIGSEGV signal\n");
    /* Exit the application */
    exit(SIGSEGV);
}

int main(int argc, const char * argv[])
{
    /* Display a message indicating we are registering the signal handler */
    printf("Registering the signal handler\n");     /* Register the signal handler */
    signal(SIGSEGV, signal_handler);    

    /* Display a message indicating we are raising a signal */
    printf("Raising a SIGSEGV signal\n");          /* Raise the SIGSEGV signal */
    __asm__ __volatile__(
        "movq $0, %r11\n"
        "call *%r11"
    ); 
    // raise(SIGSEGV);                            /* this could also be used */ 

    /* Display a message indicating we are leaving main */
    printf("((main)) Done! No Error. \n");
    return 0;
}
```