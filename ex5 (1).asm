

.global _start

.section .text
_start:

xor %rax,%rax
xor %rbx,%rbx
xor %rcx,%rcx
xor %rdx,%rdx
xor %rsi,%rsi
xor %rdi,%rdi
xor %rsp,%rsp
xor %rbp,%rbp
xor %r8,%r8

movq (head),%rax
leaq head,%rdi 
leaq head,%r8



.L1:
movq  (%rax),%rbx
cmpq %rbx,(src)
je .L2
cmpq %rbx,(dst)
je .L3
movq %rax,%rdi
movq 8(%rax),%rax
jmp .L1

.L2 :
movq %rdi,%rsp
movq %rax,%rdx
movq $1,%r9
movq 8(%rax),%rbp
movq %rax,%rdi
movq 8(%rax),%rax
cmpq %rsp,%r8
je .update_rcx
jmp .L1


.update_rcx:
movq $1,%rcx
jmp .L1


.L3:
cmpq $1,%rcx
je .with_head 
jmp .without_head


.without_head :
cmpq $1,%r9
jne .EXIT
xor %rbx,%rbx
xor %rsi,%rsi
movq %rax,8(%rsp)
movq 8(%rax),%rbx
movq %rbx,8(%rdx)
movq %rbp,8(%rax)
movq %rdx,8(%rbp)
jmp .EXIT


.with_head:
cmpq $1,%r9
jne .EXIT
xor %rbx,%rbx
xor %rsi,%rsi
movq %rax,(%rsp)
movq 8(%rax),%rbx
movq %rbx,8(%rdx)
movq %rbp,8(%rax)
movq %rdx,8(%rbp)
jmp .EXIT

.EXIT: