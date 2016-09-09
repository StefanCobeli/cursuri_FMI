.data
 x:.word 3
 y:.word 2
 z:.word 1
.text
main:
 lw $t0,x
 lw $t1,y
 bge $t0,$t1,et1        #caz x<y<z
 lw $t0,z 
 bge $t1,$t0,et2
 j sfarsit
 
 et1:                   #caz x<y<z
 sw $t1,x
 lw $t1,z
 bge $t0,$t1,et3 
 sw $t0,z
 sw $t1,x
 j sfarsit
 
 et2:                   #caz x>z>y
 lw $t2,y
 lw $t1,x
 sw $t2,x
 bge $t1,$t0,et5
 
 sw $t1,z
 sw $t0,y
 j sfarsit

 et3:                   #caz y<z<x
 sw $t0,x
 lw $t0,y
 bge $t0,$t1,sfarsit    #caz z<y<x
 sw $t0,z
 sw $t1,y
 j sfarsit

# et4:                   #caz z<y<x
# sw $t1,x
# j sfarsit
 
 et5:                  #caz x>z>y
 sw $t0,z
 sw $t1,y
 sw $t0,x
 
 sfarsit: 
 li $v0,10
 syscall
