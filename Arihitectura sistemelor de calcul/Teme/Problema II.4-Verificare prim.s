.data
 n:.word 961
 i:.word 2
 x:.byte 1

.text
main:
#cazurile pentru n e mai mic sau egal cu trei
li $t0,3
lw $t1,n
beq $t1,$t0,sfarsit
lw $t2,i
beq $t1,$t2,sfarsit
ble $t1,$t2,neprim
div $t3,$t1,$t2

#cazul general

bucla: 
blt $t3,$t2,bun
rem $t4,$t1,$t2
li $t5,0

beq $t5,$t4,neprim
li $t5,1
add $t2,$t2,$t5

j bucla

bun:
sw $t5,x
j sfarsit
neprim:
li $t5,0
sw $t5,x
j sfarsit

sfarsit:
li $v0,10
syscall
