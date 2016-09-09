.data
#n:.space 4
#s:.word 0
numar:     .asciiz "Numãrul elementelor din sumã este: "
elemente:  .asciiz "Elementele sumei sunt: "  
suma:      .asciiz "Suma este: "
n1:        .asciiz "\n"


.text
main:
 li $v0,4
 la $a0,numar
 syscall  # Afi?eazã "Numãrul elementelor din sumã este: "
 
 li $v0,5
 syscall  # Cite?te numãrul elementelor 
 
 subu $sp,4
 sw $v0,0($sp)
 
 li $v0,4
 la $a0,elemente
 syscall   # Afi?eazã "Elementele sumei sunt: " 

 lw $t0,0($sp)
 li $t1,0  
 
jal functie

 subu $sp,4 	#stiva nu e ca la inceput
 sw $t1,0($sp)  #stiva e $sp:suma,n
 
 li $v0,4
 la $a0,suma
 syscall       # Afi?eazã "Suma este: "    


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
 


