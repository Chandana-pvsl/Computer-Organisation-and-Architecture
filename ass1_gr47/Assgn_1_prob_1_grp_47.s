#Assignment 1 
#Problem no.1
#Semester 5
#Group no. 47
#Group members: P.V.S.L. Hari Chandana(16CS30026), P.Anusha(16CS30027)
####################### Data segment ######################################
 .data
msg_input:   .asciiz "Enter the argument (positive number): "
msg_arg:   .asciiz "The argument is: "
msg_result:   .asciiz "The sum is: "
newline:   .asciiz "\n"
msg_err:	.asciiz "\n It is not a non-negative number"
####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main
     main:
          la $a0, msg_input # message string in $a0, pseudoinstruction
          li $v0, 4 # Prepare to print the message
          syscall  # print the message

          li $v0, 5 # for read_int
          syscall # argument in $v0
          move $a0, $v0 # argument in $a0
		  
           
          # Print argument to make sure....debug step
          move $t0, $a0 # temporary register $t0 contains the argument   
          li  $v0, 4 # for print_str
          la  $a0, msg_arg  # preparing to print the message
          syscall  # print the string
          li  $v0, 1 # for print_int
          move $a0, $t0 # get argument back in $a0
          syscall  # print the argument
		  
		  bltz $t0, Error #checking number
		  
		  #initialising variables
		  addi $t2,$zero,10
		  addi $t3,$zero,0
		  
		  
		  Loop:
		  rem $t1,$t0,$t2
		  add $t3,$t3,$t1
		  sub $t0,$t0,$t1
		  div $t0,$t0,$t2
		  bgtz $t0,Loop
		  
          
          # Print a newline
          li  $v0, 4 # for print_str
          la  $a0, newline # preparing to print the newline
          syscall  # print the newline
          
          # Print result
          li  $v0, 4 # for print_str
          la  $a0, msg_result  # preparing to print the message 
          syscall  # print the string
      
              
          move $a0, $t3 # get result in $a0
          li  $v0, 1 # for print_int
          syscall  # print the result
     Exit:
          li $v0, 10
          syscall # exit
	 Error:
		  la $a0,msg_err
		  li $v0,4
		  syscall
		  j Exit
		  
           
####################### Text segment ######################################