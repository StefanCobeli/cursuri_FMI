.data
 a:.word 1
 c:.word 1
 n:.word 7
 z:.space 4
.text
main:
 lw $t0,n
 li $t1,2
 #dacã n=1 sau n=2
 ble $t0,$t1,sfarsit
 addi $t0,$t0,-1
 inceput:
 
 addi $t0,$t0,-1
 sw $t0,n
 lw $t0,a
 lw $t1,c
 add $t2,$t0,$t1 
 lw $t0,c
 sw $t2,c
 sw $t0,a
  
 #dacã n=0
 lw $t0,n
 li $t1,0 
 beq $t1,$t0,sfarsit
 sw $t2,z
 j inceput

sfarsit:
li $v0,10
syscall
