.data
	num1: .asciiz "Informe o primeiro numero: "
	num2: .asciiz "Informe o segundo numero: "
	resultado: .asciiz "O resultado da divisão é: "
.text 
	li $v0,4
	la $a0,num1
	syscall
	
	li $v0,5
	syscall
	
	move $t0, $v0
	
	li $v0,4
	la $a0,num2
	syscall
	
	li $v0,5
	syscall
	
	move $t1, $v0
	
	div $t0, $t1
	
	mflo $s3
	
	li $v0,4
	la $a0,resultado
	syscall
	
	li $v0,1
	move $a0,$s3
	syscall