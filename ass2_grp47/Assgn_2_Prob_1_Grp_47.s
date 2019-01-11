#Assignment 2
#Problem no.1
#Semester 5
#Group no. 47
#Group members: P.V.S.L. Hari Chandana(16CS30026), P.Anusha(16CS30027)
####################### Data segment5
 ######################################
 .data
msg_input:   .asciiz "Enter the value of array: "
msg_input1:   .asciiz "give the number to find in array: "
msg_result1:   .asciiz "number found at index : "
msg_result2:  .asciiz "number not found"
newline:   .asciiz "\n"
msg_err:	.asciiz "\n It is not ascending number"
.align 2
array : .space 32
####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main
     main:
     la $a0, msg_input	    # message string in $a0, "enter the first number"
     li $v0, 4              # Prepare to print the message
     syscall                # print the message

     addi $t0, $zero, 0     #t0<--0
     addi $t1, $zero, 32    #t1<--8*4
     la $a0, array          #a0<-- address of array
    
	form_array:
			beq $t0, $t1 , check_ascending	#if t0==32 check if ascending
			li $v0, 5                       #read int
			syscall
			move $s0, $v0
			sw $s0, 0($a0)
			addiu $a0, $a0,4                #store in array
			addi $t0, $t0, 4						
			j form_array

	check_ascending:
		la $a0, array                       #loads address in a0
		addi $t0, $zero ,0
		label:                              
			beq $t0, 8, bin_search          #if t0==8 performs binary search
			lw $t0, ($a0)                   #t0=i
			lw $t1, 4($a0)                  #t1=a[i+1] 
			bgt $t0, $t1, Error             #if a[i]>a[i+1] error
			addi $t0, $t0, 1
			addi $a0, $a0, 4
			j label                         #iterative jump

	bin_search:
		la $a0, msg_input1	
   	  	li $v0, 4
    	syscall
    	li $v0, 5                      # for read_int to search number
        syscall
    	move $t0, $v0                  #store input int==k in t0
    	addi $t2, $zero, 0             #t2-->l
    	addi $t3, $zero, 7             #t3-->r
    	addi $t6,$zero,2
    	loop:
    		bgt $t2, $t3, notfound     #if l>r return not found 
            add $t4,$t3,$t2
            div $t4,$t6
            mflo $t4
    		# add $t4, $t4, $t2
    		# div $t4, $t6              #t4=(l+r)/2
    		
    		sll $t1,$t4,2             #t1 = t4*4
    		lw $t5, array($t1)        #t5 = a[i]
    		
    		beq $t5, $t0, eqcon       #if a[i]==k goto equal condition
    		blt $t5, $t0, ifcon       #if a[i]<k goto ifcon - right half
    		bgt $t5, $t0, elsecon     #if a[i]>k goto elsecon
    		ifcon:
    			move $t2, $t4        #l=mid +1
    			addi $t2, $t2, 1
                j loop
    		elsecon:
    			move $t3, $t4        #r=mid-1
    			addi $t3, $t3, -1
                j loop
    		eqcon:
    			move $v0,$t4         #v0 = t4 index at which number is found
                j result
            notfound:
    	       addi $v0, $zero , -1  #sets v0 to -1 if not found
    	       j result
    result:
        addi $t0,$zero,-1
        beq $v0,$t0,not_found
        move $t1,$v0
        la $a0, msg_result1       # result message string in $a0
        li $v0, 4                  # Prepare to print the message
        syscall
        move $a0,$t1
        li $v0,1
        syscall 
        j Exit

    not_found:
        la $a0, msg_result2       # result message string in $a0
        li $v0, 4                  # Prepare to print the message
        syscall
        j Exit

	Error:                         #error message if array is not in ascending order
		la $a0, msg_err
     	li $v0, 4
     	syscall
				
	Exit:                          #exit from system
		li $v0, 10
		syscall



