# Algoritmul lui Euclid cu diferente
# Se ruleaza cu F10
.data
 x: .word 6
 y: .word 9
 z: .space 4
.text
main:
  lw $t0,x
  lw $t1,y
  inceput:
  beq $t0,$t1,egal
    bltu $t0,$t1,maimic
      subu $t0,$t0,$t1
      b inceput
    maimic:
      subu $t1,$t1,$t0
      b inceput
  egal:
  sw $t0,z
li $v0,10
syscall
