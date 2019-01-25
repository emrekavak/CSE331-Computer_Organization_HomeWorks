# 151044085 EMRE KAVAK HW1
.data	
	one : .asciiz "one"
 	two : .asciiz "two"
	three : .asciiz "three"
 	four : .asciiz "four"
 	five : .asciiz "five"
 	six: .asciiz "six"
 	seven : .asciiz "seven"
 	eight : .asciiz "eight"
 	nine : .asciiz "nine"
		
	one1 : .asciiz "One"
 	two1 : .asciiz "Two"
	three1 : .asciiz "Three"
 	four1 : .asciiz "Four"
 	five1 : .asciiz "Five"
 	six1: .asciiz "Six"
 	seven1 : .asciiz "Seven"
 	eight1 : .asciiz "Eight"
 	nine1 : .asciiz "Nine"
 	fileName :.asciiz "input_hw1.txt"  # file name description
 	fileSpace : .space 256		# space
.text
	li $v0,13 	#open file syscall code
	la $a0,fileName # get the file name
	li $a1,0 	# file flag = 0 for read
	syscall
	
	move $s0,$v0 	# save the open file syscall code
	li $v0,14	# read file syscall code
	move $a0,$s0  	# file descriptor
	la $a1,fileSpace # space area adress load
	la $a2,fileSpace	
	li $t0,0 	# counter for per sentence for upper-case letter
	li $t4,0	# for use like flag for after end of sentence print Upper-case latter
	syscall
	
loop:	
	beqz $a0,Exit # for end of sentence
	li $v0, 11    # for print char
	lb $a0,0($a1) #load adress $a1 into $a0
	addi $t0,$t0,1
	li $t4,0 # according to situation t4 will be 0 or 1, if 1, it will present digit is after sentence 
	beq $a0,'1' checkAfter # if byte is digit, after byte will check by checkAfter
	beq $a0,'2' checkAfter
	beq $a0,'3' checkAfter
	beq $a0,'4' checkAfter
	beq $a0,'5' checkAfter
	beq $a0,'6' checkAfter
	beq $a0,'7' checkAfter
	beq $a0,'8' checkAfter
	beq $a0,'9' checkAfter
	jal procedure # procedure call
	syscall
	j loop
	
procedure:
	addi $a1,$a1,1 # increment adress
	jr $ra
	
checkSentenceEnd: # for print upper-case Later
	lb $t3,-2($a1)
	beq $t3,'.' afterSpacePrint  # checking -2 byte for '.', if '.' true, will be print upper-case later
	j allPrint

allPrint: 
	beq $a0,'1' print1
	beq $a0,'2' print2
	beq $a0,'3' print3
	beq $a0,'4' print4
	beq $a0,'5' print5
	beq $a0,'6' print6
	beq $a0,'7' print7
	beq $a0,'8' print8
	beq $a0,'9' print9
	syscall
	
checkAfterPoint: # checking end of file, or space, if check is true, it will be print upper-case latter 
	lb $t5,2($a1)
	beqz $t5,checkBefore
	beq $t5,' ',allPrint
	j addOne
	 	
checkAfter : #+1 eleman kontorlü
	#jal checkLast # check last element
	lb $t1,1($a1)
	beq $t1,'.' checkAfterPoint # for print upper-case latter
	beq $t1,'1' addOne
	beq $t1,'2' addOne
	beq $t1,'3' addOne
	beq $t1,'4' addOne
	beq $t1,'5' addOne
	beq $t1,'6' addOne
	beq $t1,'7' addOne
	beq $t1,'8' addOne
	beq $t1,'9' addOne
	bgt $t1,1,checkBefore # if I am in after first char,I will check before latters for dont print 3.14 with string
	j allPrint
	
checkBefore: # -1 elements check
	lb $t1,-1($a1) # load byte adress
	beq $t1,'.' addOne
	beq $t1,' ' checkSentenceEnd
	beq $t1,'1' addOne
	beq $t1,'2' addOne
	beq $t1,'3' addOne
	beq $t1,'4' addOne
	beq $t1,'5' addOne
	beq $t1,'6' addOne
	beq $t1,'7' addOne
	beq $t1,'8' addOne
	beq $t1,'9' addOne	
	j allPrint
	
afterSpacePrint:
	addi $t4,$t4,1 # counter
	j allPrint
		
print1 :
	li $v0,4
	beq $t0,1,upper1 # if first element a digit,for print element upper-case latter	
	beq $t4,1,upper1 # another upper case latter print condition
	la $a0,one
	j addOne	# for increase $a1 adress to next char
upper1: la $a0,one1
	j addOne				
#all another digits print condition are same		
print2 :
	li $v0,4
	beq $t0,1,upper2
	beq $t4,1,upper2
	la $a0,two
	j addOne	
upper2: la $a0,two1
	j addOne

print3 : li $v0,4
	beq $t0,1,upper3
	beq $t4,1,upper3
	la $a0,three
	j addOne
upper3: la $a0,three1
	j addOne
		
print4: li $v0,4
	beq $t0,1,upper4
	beq $t4,1,upper4
	la $a0,four
	j addOne
upper4: la $a0,four1
	j addOne
		
print5 : li $v0,4
	beq $t0,1,upper5
	beq $t4,1,upper5
	la $a0,five
	j addOne
upper5: la $a0,five1
	j addOne
	
print6 : li $v0,4
	beq $t0,1,upper6
	beq $t4,1,upper6
	la $a0,six
	j addOne
upper6: la $a0,six1
	addi $t4,$t4,-1
	j addOne
		
print7 :li $v0,4
	beq $t0,1,upper7
	beq $t4,1,upper7
	la $a0,seven
	j addOne
upper7: la $a0,seven1
	j addOne
	
print8 : li $v0,4
	beq $t0,1,upper8
	beq $t4,1,upper8
	la $a0,eight
	j addOne
upper8: la $a0,eight1
	j addOne
	
print9: li $v0,4
	beq $t0,1,upper9
	beq $t4,1,upper9
	la $a0,nine
	j addOne
upper9: la $a0,nine1
	j addOne
		
addOne:	addi $a1,$a1,1 # for increase adress $a1 for next char
	syscall
	j loop
	
Exit:	li $v0,10 # exit syscall code
	move $a0,$s0 # description to close	
	syscall