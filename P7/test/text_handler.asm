
	addi $s3, $s3, 1
	lw $t0, 0($0) 		#��ʱ$t0ָ����timer0��Ctrl�Ĵ���
	sw $s1, 0($t0)	
	sw $s2, 4($t0)
	nop
	nop
	eret
	nop