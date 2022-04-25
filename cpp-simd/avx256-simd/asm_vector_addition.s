# The GNU Assembler Standard  
#   https://linux.die.net/man/1/x86_64-linux-gnu-as
#   http://www-ug.eecg.toronto.edu/msl/assembler.html
#   https://blog.csdn.net/gavin_liang/article/details/23782301
# 
# GNU Assembler Examples
#   https://cs.lmu.edu/~ray/notes/gasexamples/


.text
#                     x        y        z 
# int maxofthree(int rdi, int rsi, int rdx)  
# ------------------------------------------------------------------
# .globl  _maxofthree
# _maxofthree:
#    mov     %rdi, %rax              # result (rax) initially holds x
#    cmp     %rsi, %rax              # is x less than y?
#    cmovl   %rsi, %rax              # if so, set result to y
#    cmp     %rdx, %rax              # is max(x,y) less than z?
#    cmovl   %rdx, %rax              # if so, set result to z
#    ret                             # the max will be in eax



# The parameters: https://cs61.seas.harvard.edu/site/2021/Asm/
# AVX Registers: https://en.wikipedia.org/wiki/Advanced_Vector_Extensions
#                        C            A            B
# void avx256Add(double* rdi, double* rsi, double* rdx)  
# -----------------------------------------------------------------
.globl  _avx256Add 
_avx256Add: 
    vmovupd (%rsi), %ymm0
    vaddpd	(%rdx), %ymm0, %ymm0
    vmovupd %ymm0, (%rdi) 
    ret
.end


