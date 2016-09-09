.data
 sum:.space 4           # suma elementelor din vector 
v:.word 10, 1, 3, 2, -3  #vectorul
 n:.word 5              # nr. de elemente ale vectorului
 i:.space 4             # indice 

.text
main:
#initializari
 
 lw $t0,n
 li $t1,0
 sw $t1,sum
 beq $t0,$t1,iesire

 li $t0,0
 sw $t0,i    # i:=0
 
 lw $t0,v
 sw $t0,sum  # sum:=v[0]

intrare:
 lw $t0,i
 addi $t0,$t0,1
 sw $t0,i            # i:=i+1
 lw $t1,n
 bge $t0,$t1,iesire  # daca i>=n iesim din ciclu
 
 add $t0,$t0,$t0
 add $t0,$t0,$t0     

 lw $t0,v($t0)       # $t0:=v[i]
 lw $t1,sum
 add $t0,$t1,$t0
 sw $t0,sum
 j intrare
iesire:
li $v0,10
syscall
