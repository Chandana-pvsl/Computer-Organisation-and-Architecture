#Assignment 2 
#Problem no.2
#Semester 5
#Group no. 47
#Group members: P.V.S.L. Hari Chandana(16CS30026), P.Anusha(16CS30027)
####################### Data segment ######################################
 .data
msg_input:   .asciiz "Enter the first number: "
msg_input1: .asciiz "Enter the second number: "
msg_result:   .asciiz "The GCD is: "
newline:   .asciiz "\n"
msg_err:	.asciiz "\n One/Both Numbers are not positive "
.align 2
array : .space 32
####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main
     main:
     	    la $a0, msg_input     # message string in $a0, "enter the first number"
          li $v0, 4             # Prepare to print the message
          syscall               # print the message

          li $v0, 5             # for read_int
          syscall               # argument in $v0
          move $t0, $v0         # argument in $a0

          la $a0, msg_input1    # message string in $a0, "enter the second number"
          li $v0, 4             # Prepare to print the message
          syscall               # print the message

          li $v0, 5             # for read_int
          syscall               # argument in $v0
          move $a0,$t0          # first number in $a0
          move $a1, $v0         # second number in $a1
          jal check_positive_values     #jump and link to function which 
                                            #checks whether given numbers are positive or not
          #checking a0,a1 such that a0 > a1
          blt $a0,$a1,arrange_numbers       #if a0<a1 branch to arrange numbers
          bgt $a0,$a1,loop1                 #if a0>a1 continue
          arrange_numbers:                  #swaps a0 and a1 if a0<a1
              move $t0,$a0                  
              move $a0,$a1
              move $a0,$t0
          loop1:
              jal find_gcd
              move $a0, $v0                 # get argument back in $a0
              li  $v0, 1                    # for print_int
              syscall                       # print the gcd
              j Exit                        # exits from the whole program
     
    
          check_positive_values:        #checks if both the inputs are positive
              move $t0,$a0
              ble $a0,$zero,Error           #prints error_msg if a0<0
              ble $a1,$zero,Error           #prints error_msg if a1<0
              move $a0,$t0
              jr $ra                        #jumps back to line below check_positive_values function call

          find_gcd:                         #finding gcd
              addi $sp,$sp,-4               #allots space to store ra in stack
              sw $ra,0($sp)                 #stores ra in stack
              beq $a1,$zero,exit            #a1==0 exit
              addi $t0,$zero,0              # t0<--0
              div $a0,$a1                   # a0 = a0/a1
    	        move $a0, $a1                 # a0<--a1
    	        mfhi $a1                      #quotient in a1
              jal find_gcd                  
              lw $ra,0($sp)                 #return address is loaded
              addi $sp,$sp,4                
              jr $ra                        
          exit:              
              move $v0,$a0                  #v0<--a0
              jr $ra                        

          Error:                            #prints error msg
              li $v0, 4              
              la $a0,msg_err
              syscall


          Exit:                             #exits from the program
              li $v0, 10
              syscall # exit

