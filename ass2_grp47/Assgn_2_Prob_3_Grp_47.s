#Assignment 2 
#Problem no.3
#Semester 5
#Group no. 47
#Group members: P.V.S.L. Hari Chandana(16CS30026), P.Anusha(16CS30027)
####################### Data segment5######################################
 .data
msg_input:   .asciiz "Enter the value of array: "
msg_arg:   .asciiz "The argument is: "
msg_result:   .asciiz "The sorted array is: "
newline:   .asciiz "\n"
msg_err:	.asciiz "\n It is not ascending number"
space: .asciiz " "
.align 2
array : .space 32
.align 2
array1 : .space 32
####################### Data segment ######################################

####################### Text segment ######################################
.text
.globl main
     main:
     	la $a0, msg_input	
     	li $v0, 4
     	syscall

     	addi $t0, $zero, 0
     	addi $t1, $zero, 32
     	la $a0, array
    	# move $a0 , -4($a0)
		form_array:
			beq $t0, $t1 , Label	
			li $v0, 5
			syscall
			move $s0, $v0
			sw $s0, 0($a0)
			addiu $a0, $a0,4 
			addi $t0, $t0, 4						
			j form_array
		Label:
			#t7 , s7, s2 are constants			
			addi $a1,$zero,0 # left index
			addi $a2,$zero,7 # right index
			addi $t7,$zero,1 
			addi $s7,$zero,2
			addi $s2,$zero,8
			jal merge_sort
			j Exit

		#a1 = lower value , a2=higher value
		merge_sort:
			sub $t8 ,$a2,$a1
			add $t8,$t8,$t7		# t8 = n
			addi $sp,$sp,-16	#create space for local variables
			sw $ra, 8($sp)		#sp-16 -->ra
			sw $a1, 4($sp)		#sp-4 -->a1= L
			sw $a2, 0($sp)		#sp --> a2 = R
			
			add $t0,$a1,$a2		#a1+a2 = t0 , 
			div $t0,$s7			#t0 = t0/2
			mflo $t0			#t0 = quotient of t0/2 = mid
			sw $t0, 12($sp) 	# MID

			sgt $t9,$t8,$t7 	# n>1
			beq $t9,$zero,exit_merge # if n==1, jump to exit_merge 

			move $a2,$t0		# a1 =l, a2 = mid	- 1st half call	
			jal merge_sort

			lw $t0, 12($sp)
			addi $t1,$t0,1		#t1 = mid-index+1
			lw $a2,0($sp) 		# a2 = r
			move $a1,$t1  		# a1 = mid+1
			jal merge_sort	# 2nd hall call

			#LOAD a1=l1 ,a2=r1 ,a3=l2 a0=r2
			lw $a1, 4($sp) 
			lw $a2, 12($sp) 
			lw $a0 , 0($sp)
			addi $a3 , $a2, 1			

			jal merge

			lw $t9, 4($sp) # t9 = l

			jal Copy # copy from array1(temp array) to array

			lw $ra, 8($sp)
			lw $a1, 4($sp)
			lw $a2, 0($sp)
			addi $sp,$sp,16 #pop stack
			jr $ra 

		Copy:
			sgt $s3,$t9,$a0  #i = t9 initialised to l , a0 = r
			beq $s3,$zero,copy1 # l <= r , go to copy1
			jr $ra

		copy1:
			sll $t6,$t9,2  # t9 = 4*i
			lw $t5,array1($t6) # load and copy to temp array1
			sw $t5,array($t6)
			addi $t9,$t9,1 # i =i +1
			j Copy 

		exit_merge:
			lw $ra, 8($sp)
			lw $a3,4($sp)
			lw $a0,0($sp)
			addi $sp,$sp,16 # pop stack
			jr $ra
#a1=l1 ,a2=r1 ,a3=l2 a0=r2

		merge:
			

			add $t0,$a1,$zero #t0= i*4 inisialized to l1
			sll $t0,$t0,2

			add $t1,$a3,$zero	# t1=j*4 initialized  to l2
			sll $t1,$t1,2

			add $t2,$a2,$zero	# t2=r1*4 address of last index of first column
			sll $t2,$t2,2

			add $t3,$a0,$zero 	#t3=r1*4 address of last index of first column
			sll $t3,$t3,2

			addi $t4,$t0,0	#initialising k = l1 *4

			
		Loop1:	
			sle $t5,$t0,$t2  	#if i>r1, t5=1
			sle $t6,$t1,$t3		#if j>r2, t6=1			
			and $t8,$t6,$t5

			beq $t8,$t7, while0	#if t8==1 go to while
			
			ble $t0, $t2,Loop2 # copy rest of array if i <= r1
			ble $t1, $t3,Loop3 # copy rest of array if j <= r2

		Loop2:
			ble $t0, $t2,while1
			jr $ra

		Loop3:
			ble $t1, $t3,while2
			jr $ra

		while0:
			lw $t5, array($t0)	#load a[i] in t5
			lw $t6, array($t1) #load a[j] in t6

			blt $t5,$t6,ifloop	#if a[i]<a[j] goto ifloop
			sw $t6,array1($t4)	#b[k]=a[j]
			
			addi $t4,$t4,4		#k++
			addi $t1,$t1,4		#j++
			j Loop1

		ifloop:
			sw $t5,array1($t4)	#b[k]=a[i]
			addi $t4,$t4,4		#--> k++
			addi $t0,$t0,4		#t0 = t0+4--> i++
			j Loop1

		while1:
			lw $t5,array($t0)
			sw $t5,array1($t4)	#b[k]=a[i]
			addi $t4,$t4,4		#t3 = t3+4 --> k++
			addi $t0,$t0,4		#t0 = t0+4--> i++
			j Loop2

		while2:
			lw $t5,array($t1)
			sw $t5,array1($t4)	#b[k]=a[i]
			addi $t4,$t4,4		#t3 = t3+4 --> k++
			addi $t1,$t1,4		#t0 = t0+4--> i++
			j Loop3

		Exit:
			sll $s2,$s2,2		# s2= n * 4
			addi $t1,$zero,0 	# initialise i = t1=0
			
			la $a0, msg_result 	# Print message string
     		li $v0, 4
     		syscall
			
			jal print 			# prints elements in loop
			li $v0,10 			# EXIT
			syscall

		print:
			slt $s6, $t1, $s2 	# if t1=i*4 < s2=n*4
			beq $s6,$zero, exit_print # when t1 == s2 , jump to exit_print
			lw $t2,array($t1) 	# load number into t2

			move $a0,$t2 # print number
			li $v0,1
			syscall

			la $a0, space # print one space
     		li $v0, 4
     		syscall

			addi $t1,$t1,4 # increase i by 4
			j print 

		exit_print:
			jr $ra 

		


