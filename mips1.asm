.data
	x: .asciiz "\n x = \n"
	y: .asciiz "\n y = \n"
	z: .asciiz "\n z = \n"
	quotient: .asciiz "\n quotient of ( 4x +5 ) / y is "
	remainder: .asciiz "\n remainder ( 4x +5 ) / y is "
.text
	#in thong bao nhap x
	li $v0, 4
	la $a0, x
	syscall
	
	#nhap x
	li $v0, 5
	syscall
	
	#luu x vao thanh ghi t0
	move $t0,$v0
	
	#tinh 5x va luu vao thanh ghi s0
	addi $t1, $zero, 4
	mult $t0, $t1
	mflo $s0
	
	#tinh 4x + 5 va luu vao thanh ghi s0
	add $s0, $s0, 5
	
	#thong bao nhap y
	li $v0, 4
	la $a0, y
	syscall
	
	#nhap y
	li $v0, 5
	syscall
	
	#luu gia tri y vao thanh ghi t0
	move $t0,$v0
	
	#tinh (4x+5)/y
	div $s0, $t0
	mflo $s0
	mfhi $t2
	
	#thong bao hien thi ket qua 
	li $v0, 4
	la $a0, quotient
	syscall
	
	#ket qua
	li $v0, 1
	add $a0, $zero, $s0
	syscall
	
	#thong bao hien thi so du
	li $v0, 4
	la $a0, remainder
	syscall
	
	#so du
	li $v0, 1
	add $a0, $zero, $t2
	syscall
