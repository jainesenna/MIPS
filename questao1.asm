.data		# Declaração das variáveis

msg1:		.asciiz "Digite o primeiro número inteiro positivo correspondente ao dividendo\n"	#'.asciiz' para strings no formato ASCII.
dividendo:	.word 1
msg2:		.asciiz "Digite o segundo número inteiro positivo correspondente ao divisor\n"		#'.word' para inteiros
divisor:	.word 1
resto:		.word 1
quociente:	.word 1
msgQuociente: 	.asciiz "O quociente é = "
msgResto: 	.asciiz "\nO resto é = "

.text		# representa a parte do programa onde estará o código a ser executado

main:	
	li $v0,	4	# 'li' significa "Load Immediate" e o código '4' se refere a imprimir uma string no console.
	la $a0,	msg1	# O'la'significa "Load Adress" e está passando p/ o REG o argumento '$a0' o END de memória onde está armazenado o 'msg1'
	syscall		# O syscall interpreta que é para imprimir uma mensagem no console e recebe como argumento a 'msg1'.

	li $v0, 5	# O 'li' passa a instrução p/ o 'syscall' pelo registrador $v0, o código '5' se refere à leitura de um inteiro, o 'syscall' executa a leitura.
	syscall	
	
	move $s1, $v0
	sw $s1, dividendo	# O registrador $v0 guarda o valor da variavel dividendo
	
	li $v0, 4	# 'li' significa "Load Immediate" e o código '4' se refere a imprimir uma string no console.
	la $a0,msg2 	# O'la'significa "Load Adress" e está passando p/ o REG o argumento '$a0' o END de memória onde está armazenado o 'msg2'
	syscall		# O syscall interpreta que é para imprimir uma mensagem no console e recebe como argumento a 'msg2'.
	
	li $v0, 5	# O 'li' passa a instrução p/ o 'syscall', o código '5' se refere à leitura de um inteiro, o 'syscall' executa a leitura.
	syscall
	
	move $s0, $v0
	sw $s0, divisor		# O registrador $v0 guarda o valor da variavel divisor
	
	lw $t0, dividendo 	# O Load Word carrega o conteudo do dividendo em $t0
	sw $t0, resto		# O Store Word carrega o conteudo que esta na variavel resto para o registrador $t0, ou seja, resto = dividendo
	
	move $t1, $s1		# resto = dividendo
	
	addi  $t2, $zero, 0	# quociente($t1) = 0
	
	LOOP:	slt $t3, $t1, $s0	# $t3 = resto < divisor
		bne $t3, $zero, EXIT	# 
	    	sub $t1, $t1, $s0	# $t1 = resto - divisor
	    	addi $t2, $t2, 1	# quociente++
	    	j LOOP
	EXIT:
	
	#imprime a mensagem msgQuociente
	li $v0, 4	# 'li' significa "Load Immediate" e o código '4' se refere a imprimir uma string no console.
	la $a0,msgQuociente 
	syscall

	#imprime o resultado do quociente
	li $v0, 1	# O código '1' se refere à impressão de um inteiro no console.	
	move $a0, $t2	#O comando 'move' move o valor de $t2 para $a0
	syscall
	
	#imprime a mensagem msgQuociente
	li $v0, 4	# 'li' significa "Load Immediate" e o código '4' se refere a imprimir uma string no console.
	la $a0,msgResto 
	syscall

	#imprime o resultado do quociente
	li $v0, 1	# O código '1' se refere à impressão de um inteiro no console.	
	move $a0, $t3	#O comando 'move' move o valor de $t2 para $a0
	syscall
	
	
	
	
