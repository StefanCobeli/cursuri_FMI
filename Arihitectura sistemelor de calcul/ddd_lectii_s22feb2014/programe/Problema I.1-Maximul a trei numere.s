.data
 x:.word 2
 y:.word 2
 t:.word 1
 z:.space 4
.text
main:
 lw $t0,x
 lw $t1,y
 blt $t0,$t1,alt
 lw $t1,t
 blt $t0,$t1,et2
  j et1
alt:
lw $t0,t
 blt $t0,$t1,et2
 
 et1:
 sw $t0,z
 j sfarsit
 
 et2:
 sw $t1,z
sfarsit:
li $v0,10
syscall