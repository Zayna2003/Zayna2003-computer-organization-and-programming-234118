.global _start

.section .text
_start:

xor %rax,%rax #sum
xor %rcx,%rcx #counter
xor %rsi,%rsi

.L1:
movl arr(,%rcx,4),%esi
add %rsi,%rax
cmp $0,%esi
je .L2
inc %rcx 
jmp .L1 

.L2:
cmp $0,%rcx 
je .L3
div %rcx
xor %rdx,%rdx
movl %eax,(avg)

.L3:
