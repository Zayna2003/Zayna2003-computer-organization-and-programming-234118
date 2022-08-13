.global _start

.section .text
_start:

movl (num),%eax
#cdq
#cmpl $0,%edx
#jne .L1

test %eax,%eax
js .EXIT

xor %rcx,%rcx
lea source, %rbx
lea destination, %rdx

.L2:
movl (num),%eax
cmp %eax,%ecx
je .EXIT
movb   (%rbx), %al    
movb    %al, (%rdx)
lea  1(%rbx),%rbx
lea  1(%rdx),%rdx  
incl %ecx 
jmp .L2

.EXIT:

