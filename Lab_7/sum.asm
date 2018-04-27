# sum up to n
.text        #text section
.globl main  #call main by SPIM

main:
  la $t0, n      #load address of n
  lw $t1, 0($t0) #number of sums
  la $t0, value  #load address of first variable
  
  and $t2, $zero, $t2 #zero out register
  and $t3, $zero, $t3 #zero out register
  
  j loop
  
loop:
  blez $t1, done    #branch if n is 0
  lw $t2, 0($t0)    #load number-to-sum
  add $t3, $t3, $t2 #sum
  addi $t1, $t1, -1 #decrement n
  addi $t0, $t0, 4  #move to next memory location
  j loop
  
done:

.data #data section
n: .word 5
value: .word 1, 2, 3, 4, 5