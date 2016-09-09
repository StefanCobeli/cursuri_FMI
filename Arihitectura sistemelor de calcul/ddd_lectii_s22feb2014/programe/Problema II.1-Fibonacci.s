.data
 
 a:.word -1
 c:.word 1
 n:.word 5
 z:.space 4
 
 .text
 main:
 
 li $t0,0
 lw $t1,n
 sw $t0,z
 
 inceput:
 blt $t1,$t0,sfarsit
 lw $t2,a
 lw $t3,c
 
 add $t2,$t2,$t3
 sw $t2,c
 sw $t3,a
 sw $t2,z
 addi $t1,$t1,-1
 j inceput

 sfarsit:
 li $v0,10
 syscall
