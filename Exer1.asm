.data
	divisor: .word "Informe o primeiro numero: "
	dividendo: .word "Informe o segundo numero: "
.text 
	li $v0,4 # Impressão de String
	la $t0,divisor # Carrega no registrador t0 = divisor
	syscall # Executa a instrução
	
	li $v0,5 # Lê um número inteiro do teclado
	syscall
	
	sw $v0,divisor
	
	li $v1,4 # Impressão de String
	la $t0,dividendo #
	syscall
	
	li $v1,5 # Lê um número inteiro do teclado
	syscall
	
	sw $v1,dividendo
	
	
	
