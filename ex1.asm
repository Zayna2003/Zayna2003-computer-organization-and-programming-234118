.global _start

.section .text
_start:

movq (num), %rax
jmp .L1

.L2:

.L1:
shr $1,%rax
jc .L2
cmpq $0,%rax
jne .L1