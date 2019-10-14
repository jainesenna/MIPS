.data
	Hello: .asciiz "Hello World" 

.test 
	li $w0, 4
	la $a0, Hello
	syscall 