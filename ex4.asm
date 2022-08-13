.global _start


.section .text
_start:
xor %rax,%rax #temp_element
xor %rbx,%rbx #temp_len
xor %rcx,%rcx
xor %rdx,%rdx #temp_begin
xor %rsi,%rsi


#updating_the_first_element
movl  arr(,%ecx,4),%eax
movl  %ecx,(begin)
incl %ebx
jmp .update_len_begin

.L1:
incl %ecx
cmpl (n),%ecx
je .EXIT
movl arr(,%ecx,4),%esi
cmpl %eax,%esi
jg .greater
jmp .updates

.updates:
movl %esi,%eax
incl %ebx
cmpl (len),%ebx
jg .update_len_begin
jmp .L1


.greater:
movl %ecx,%edx
movl $0,%ebx
jmp .updates

.update_len_begin:
movl %ebx, (len)
movl %edx,(begin)
jmp .L1
.EXIT:
