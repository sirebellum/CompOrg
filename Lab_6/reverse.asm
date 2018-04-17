# reverse the contents of a register
.text        #text section
.globl main  #call main by SPIM

main:
  la $t0, value  #load address of variables
  lw $t1, 4($t0) #decision variable
  lw $t2, 8($t0) #bit selection variable
  lw $t3, 0($t0) #load initial value into registers
  lw $t4, 4($t0) #result variable
  lw $t5, 8($t0) #constant (1000000000000000)
  
  j loop
  
loop:
  blez $t2, done    #branch if bit selection is 0
  and $t1, $t3, $t2 #bit selection
  srl $t4, $t4, 1   #shift result register for next bit
  srl $t2, $t2, 1   #shift bit selection to next bit
  bgtz $t1, shiftin #shift in a 1 if there was a 1 for bit selection
  j loop
  
shiftin:
  add $t4, $t4, $t5
  j loop
  

done:
  
.data #data section
value: .word 49153, 0, 32768