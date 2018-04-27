# factorial of n
.text        #text section
.globl main  #call main by SPIM

main:
  la $t0, n         #load address of n
  lw $t1, 0($t0)    #number of factorial
  
  and $t2, $zero, $t2 #zero out low register
  and $t3, $zero, $t3 #zero out high register
  and $t4, $zero, $t4 #zero out result register
  addi $t3, $t3, 1    #avoid multiply by 0
  
  j loop
  
loop:
  blez $t1, done     #branch if n is 0
  mult $t3, $t1      #n*(n-1)

  mfhi $t3 #retrieve multiplied values
  mflo $t2
  xor $t3, $zero, $t2

  addi $t1, $t1, -1  #n-1
  j loop
  
done:

.data #data section
n: .word 16