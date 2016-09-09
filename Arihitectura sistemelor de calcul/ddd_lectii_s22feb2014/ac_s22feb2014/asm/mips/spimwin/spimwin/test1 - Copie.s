.data
 x:.word 2
.text
main:
 li $t0,2
 lw $t1,x
 beq $t1,$t0,egal
 nop
 j sfarsit
 egal:
 nop
 sfarsit:
li $v0,10
syscall
