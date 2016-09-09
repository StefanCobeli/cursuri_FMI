.data
#asciiz:.
x: .space 4
.text
   main:
 li $v0,5
 syscall
 jal sign
 
 li $v0,10
 syscall
 

sign:
 beqz $v0,et1
 li $t0,0
 blt $t0,$v0,et2
 li $v0,1
 li $a0,-1
 syscall 
j sf 

et2:
 li $v0,1
 li $a0,1
 syscall 

j sf

et1:
 li $v0,1
 li $a0,0
 syscall 


sf:
jr $ra
   