#Assignment 1 
#Problem no.2
#Semester 5
#Group no. 47
#Group members: P.V.S.L. Hari Chandana(16CS30026), P. Anusha(16CS30027)
  
####################### Data segment ######################################
 .data
msg_input:   .asciiz "Enter the argument (positive number): "
msg_arg:   .asciiz "The argument is: "
msg_result:   .asciiz "The fibonocci value is: "
newline:   .asciiz "\n"
msg_err:	.asciiz "\n it is not a positive number"
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
		 
		  #initialising variables
		  addi $t2,$zero,1 # sum is in $t2
		  addi $t1, $zero,0 
		  addi $t3,$zero,1  
		  
		  #checks if the number is non-negative
		  slt $t5,$t0,$t2 
		  beq $t5, $t2,Error 
		  
		  #calculating Fibonacci values
		  beq $t0,$t2,Label1
		 
		  bgt $t0,1,Loop
		  Loop:
		  sub $t0,$t0,1
		  add $t4,$zero,$t2
		  add $t2,$t2,$t1
		  add $t1,$zero,$t4
		  bne $t0,$t3,Loop
		  
	Result:
          
          # Print a newline
          li  $v0, 4 # for print_str
          la  $a0, newline # preparing to print the newline
          syscall  # print the newline
          
          # Print result
          li  $v0, 4 # for print_str
          la  $a0, msg_result  # preparing to print the message 
          syscall  # print the string
      
              
          move $a0, $t2 # get result in $a0
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

	Label1:
		  addi $t2,$zero,1
		  j Result
		  
		  
		  
           
####################### Text segment ######################################