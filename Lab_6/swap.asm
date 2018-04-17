# switch the contents of two registers
.text        #text section
.globl main  #call main by SPIM

main:
  la $t0, value  #load address of variables
  lw $t1, 0($t0) #load initial values into registers
  lw $t2, 4($t0)
  
  xor $t0, $zero, $t1 #temp holding register
  xor $t1, $zero, $t2
  xor $t2, $zero, $t0
  
.data #data section
value: .word 10, 20, 0