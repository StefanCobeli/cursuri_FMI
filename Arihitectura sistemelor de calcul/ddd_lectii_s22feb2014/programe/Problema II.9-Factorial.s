.data
 n:.word 4
 fact:.word 1
.text
main:
 li $t0,2
 lw $t1,n
# addi $t1,$t1,1
 lw $t2,fact
 li $t3,1


ciclu:
 ble $t1,$t3,sfarsit
 mul $t2,$t2,$t0
 addi $t0,$t0,1
 addi $t1,$t1,-1
 
j ciclu


sfarsit:
 sw $t2,fact
 li $v0,10
 syscall

 