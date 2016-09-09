.data
 x:.space 4
 y:.space 4
.text
main:
 li $t0,1
 sw $t0,x
 li $t0,2
 sw $t0,y
# de aici e ca inainte
 lw $t0,x
 lw $t1,y
 sw $t0,y
 sw $t1,x
li $v0,10
syscall