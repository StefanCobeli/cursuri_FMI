.data
n:.space 4
s:.word 0
numar:     .asciiz "Num�rul elementelor din sum� este: "
elemente:  .asciiz "Elementele sumei sunt: "  
suma:      .asciiz "Suma este: "
n1:        .asciiz "\n"


.text
main:
 li $v0,4
 la $a0,numar
 syscall  # Afi?eaz� "Num�rul elementelor din sum� este: "
 
 li $v0,5
 syscall  # Cite?te num�rul elementelor 
 sw $v0,n
 
 li $v0,4
 la $a0,elemente
 syscall   # Afi?eaz� "Elementele sumei sunt: " 

 lw $t0,n
 lw $t1,s  
 
jal functie
   
 sw $t1,s

 li $v0,4
 la $a0,suma
 syscall       # Afi?eaz� "Suma este: "    


 li $v0,1
 lw $a0,s
 syscall

 li $v0,10
 syscall




functie:

 bne $t0,$zero,merge
 jr $ra   
merge:
 li $v0,5
 syscall      # Cite?te elementele
 add $t1,$t1,$v0
 addiu $t0,$t0,-1
 j functie
 


  