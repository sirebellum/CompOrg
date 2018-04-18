# reverse the contents of a register
.text        #text section
.globl main  #call main by SPIM

main:
  li $v0, 4      #code 4 == print string
  
  la $a0, salutation #My name is
  syscall
  la $a0, last #Herrera
  syscall
  la $a0, comma #,
  syscall
  la $a0, first #Josh
  syscall
  la $a0, last #Herrera
  syscall
  la $a0, period #.
  syscall
               
.data
first: .asciiz "Josh "
last: .asciiz "Herrera"
comma: .asciiz ", "
period: .asciiz "."
salutation: .asciiz "My name is "