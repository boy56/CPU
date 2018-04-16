
	addi $s3, $s3, 1
	lw $t0, 0($0) 		#此时$t0指的是timer0的Ctrl寄存器
	sw $s1, 0($t0)	
	sw $s2, 4($t0)
	nop
	nop
	eret
	nop