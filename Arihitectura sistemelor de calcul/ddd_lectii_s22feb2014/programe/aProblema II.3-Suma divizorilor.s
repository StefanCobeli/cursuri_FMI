.data
  #n: .word 3
  #x: .space 4
.text
main:
 li $v0,5
 syscall
  subu $sp,4 # incarcam in stiva parametrul actual
  sw $v0,0($sp)
  jal suma
  
  lw $t0,0($sp)
  addu $sp,4 # am convenit ca fct. sa ret. prin stiva si descarcam val. ret.
  sw $t0,x   # acum x contine 6
li $v0,10
syscall
suma:
  subu $sp,8
  sw $ra,4($sp)
  sw $fp,0($sp)
  addiu $fp,$sp,4 # $sp:($fp v)$fp:($ra v)(n)...
  lw $t0,4($fp)
  li $t1,10
  beqz $t0,et  # test n>1
    sw $t1,4($fp) # daca n<=1 plasez val. ret. 1 (din $t1) in stiva si inchei
    b sf
  et:
    subu $t0,1    # $t0 inca contine n
    subu $sp,4
    sw $t0,0($sp) 
      # $sp:(n-1)($fp v)$fp:($ra v)(n)...
    jal fact
      # $sp:((n-1)!)($fp v)$fp:($ra v)(n)...
    lw $t0,0($sp)
    addu $sp,4      # $t0=(n-1)!, $sp:($fp v)$fp:($ra v)(n)...
    lw $t1,4($fp)   # $t1=n
    mul $t1,$t1,$t0 # $t1=n!
    sw $t1,4($fp)   # plasez val. ret. in stiva
  sf: # indiferent cum ajung aici avem $sp:($fp v)$fp:($ra v)(n!)...
  lw $ra,0($fp)
  lw $fp,-4($fp)
  addu $sp,8
jr $ra