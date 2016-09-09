.data
msg1:.asciiz "Numãrul este: "
.text
.globl main

# Ideea recursiei: s(0) = 0, altfel s(n) = n mod 10 + s(n div 10).

main:

li $v0,4
la $a0,msg1
syscall #print msg
li $v0,5
syscall #read an int
add $t0,$v0,$zero #move to $a0
 
li $t1,10
jal suma #call suma

add $t0,$v0,$zero
li $v0,1
syscall

li $v0,10
syscall

suma:
#a0=y
#if (y==0) return 0;
#return( n mod 10 + suma(n div 10) );
subu $sp,4
sw $t0,0($sp)

beqz $t0,return0

rem $t0,$t0,$t1
add $t2,$t2,$t0
mflo $t0
return0 :     
li $v0,0
 j exit
