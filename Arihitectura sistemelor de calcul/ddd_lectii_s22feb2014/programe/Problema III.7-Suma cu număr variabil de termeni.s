.data
#n:.space 4
#s:.word 0
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
 
 subu $sp,4
 sw $v0,0($sp)
 
 li $v0,4
 la $a0,elemente
 syscall   # Afi?eaz� "Elementele sumei sunt: " 

 lw $t0,0($sp)
 li $t1,0  
 
jal functie

 subu $sp,4 	#stiva nu e ca la inceput
 sw $t1,0($sp)  #stiva e $sp:suma,n
 
 li $v0,4
 la $a0,suma
 syscall       # Afi?eaz� "Suma este: "    


 li $v0,1
 lw $a0,0($sp)
 syscall
addu $sp, 8  
 
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
 


