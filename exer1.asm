.data # declaração de dados

	dividendo: .asciiz "Digite o número do dividendo: "
	divisor: .asciiz "\nDigite o número do divisor: "
	quociente: .asciiz "\nQuociente = "
	resto: .asciiz "\nResto = "
.text
	li $v0, 4 # Imprime uma string
	la $a0, dividendo # Carrega a string
	syscall	# Executa
	
	li $v0, 5 # Ler um número inteiro
	syscall	# Executa
	
	move $s0, $v0 # Salva no registrador $s0
	
	li $v0, 4 # Imprime uma string
	la $a0, divisor # Carrega a string
	syscall	# Executa
	
	li $v0, 5 # Ler um número inteiro
	syscall # Executa 
	
	move $s1, $v0 # Salva no registrador $s1
	
	move $s2, $s0 # resto = quociente 
	li $s3, 0  # quociente = 0
	
	WHILE: 
		slt $t0, $s2, $s1 # $t0 é setado se $s2 < $s1
		bne $t0, $zero, EXIT # vá para EXIT, se $t0 != 0 , ou seja a < b
		sub $s2, $s2, $s1 #resto = resto - divisor
		addi $s3, $s3,1 # quociente = quociente + 1
		j WHILE # volta para o WHILE
	
	EXIT:
	
	li $v0, 4 # Imprime uma string
	la $a0, quociente # Carrega a string
	syscall	# Executa
	
	li $v0, 1 # Imprime um número inteiro especifico
	move $a0,$s3 
	syscall	
		
	li $v0, 4 # Imprime uma string
	la $a0, resto # Carrega a string
	syscall # Executa
	
	li $v0, 1 # Imprime um número inteiro especifico
	move $a0, $s2
	syscall # Executa
