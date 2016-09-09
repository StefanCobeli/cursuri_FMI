# Suma a doi intregi cu citire/afisare interactiva
# Se ruleaza cu F5
.data
  dpi:  .asciiz "Dati primul intreg: "
  dadi: .asciiz "Dati al doilea intreg: "
  se:   .asciiz "Suma este: "
  nl:   .asciiz "\n"
 .align 2   # ne asiguram ca x,y,z au adrese multiplu de 4 ca sa putem scrie/citi word-uri acolo
  x: .space 4
  y: .space 4
  z: .space 4
.text
main:
  li $v0,4
  la $a0,dpi
  syscall    # afisaza: "Dati primul intreg: "
  li $v0,5
  syscall
  sw $v0,x   # citeste x
  li $v0,4
  la $a0,dadi
  syscall    # afisaza: "Dati al doilea intreg: "
  li $v0,5
  syscall
  sw $v0,y   # citeste y
  lw $t0,x
  lw $t1,y
  add $t2,$t0,$t1
  sw $t2,z   # calculeaza z:=x+y
  li $v0,4
  la $a0,se
  syscall    # afisaza: "Suma este: "
  li $v0,1
  lw $a0,z
  syscall    # afisaza: z
  li $v0,4
  la $a0,nl
  syscall    # trece la linie noua
li $v0,10
syscall
