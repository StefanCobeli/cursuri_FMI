.data
 x:.word 1
 y:.word 2
 t:.word 3
 z:.space 4
.text
main:
 lw $t0,x
 lw $t1,y
 sw $t1,z
 blt $t0,$t1,et1  #compar primele doua numere
 lw $t1,t
 blt $t0,$t1,et2
 sw $t0,z
 j sfarsit
  
 et1:
 lw $t0,t
 blt $t0,$t1,sfarsit
 sw $t0,z
 j sfarsit
  
 et2:
 sw $t1,z
 
 

sfarsit:
li $v0,10
syscall
