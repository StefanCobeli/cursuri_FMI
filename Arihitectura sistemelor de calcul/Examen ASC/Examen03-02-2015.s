
.data
 vector: .space 5
.text
main:
li $v0,5
syscall
li $v0,0x0a0b0c0d
subu $sp,20
sw $v0,0($sp)
li $t1,0
la $t0,vector($t1)
sw $t0,4($sp)
li $t1,1
la $t0,vector($t1)
sw $t0,8($sp)
li $t1,2
la $t0,vector($t1)
sw $t0,12($sp)
li $t1,3
la $t0,vector($t1)
sw $t0,16($sp)
jal procedura
addu $sp,20
li $t2,4
sb $zero,vector($t2)
li $v0 4
la $a0 vector
syscall


li $v0,10
syscall


procedura:

subu $sp,12
sw $fp,0($sp)
sw $s0,4($sp)
sw $s1,8($sp)
addiu $fp,$sp,0

lb $s0,12($fp)
lw $s1,16($fp)
sb $s0,0($s1)

lb $s0,13($fp)
lw $s1,20($fp)
sb $s0,0($s1)

lb $s0,14($fp)
lw $s1,24($fp)
sb $s0,0($s1)

lb $s0,15($fp)
lw $s1,28($fp)
sb $s0,0($s1)



lw $s0,4($fp)    
lw $s1,8($fp)
lw $fp,0($fp)
addu $sp,12
jr $ra

