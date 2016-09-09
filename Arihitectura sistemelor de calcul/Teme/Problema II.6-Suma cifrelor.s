.data
 n:.word 91000201
 i:.word 1
 suma:.word 0

.text
main:
li $t0,10
lw $t1,n

#dacã n are o singurã cifrã
blt $t1,$t0,final

#dacã n are mai mult de o cifrã
bucla:
lw $t2,suma
blt $t1,$t0,final
rem $t3,$t1,$t0
add $t2,$t2,$t3
sw $t2,suma
mflo $t1

j bucla

final:
add $t1,$t2,$t1
sw $t1,suma

sfarsit:
li $v0,10
syscall
