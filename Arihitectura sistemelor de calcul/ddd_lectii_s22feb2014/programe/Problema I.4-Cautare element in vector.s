.data
 v:.word 2
 n:.word 1
 x:.word 2
 gasit:.word 0
 
.text
main:
 li $t0,0
 lw $t1,n
 lw $t2,x
 add $t1,$t1,$t1
 add $t1,$t1,$t1
 addi $t1,$t1,-4 

ciclu:
 blt $t1,$t0,sfarsit
 lw $t3,v($t1)
 beq $t3,$t2,bun
 addi $t1,$t1,-4
 j ciclu
 

bun:
 li $t0,1
 sw $t0,gasit


sfarsit:
li $v0,10
syscall

