	ori 	$1, $1, 2
	addiu 	$2, $2, 3
	bne		$2, $0, loop	#bne与addi暂停
	sw		$2, 0($0)
	add		$3, $1, $2
loop:
	addi    $3, $3, 6
	and     $2, $2, $0
	lui		$2, 1
	beq		$2, $0, Exit    #beq与lui暂停
	ori		$3, $2, 0
	bne		$3, $2, Exit    #bne与ori暂停
	lw		$3, 0($0)
	beq		$2, $3, Exit	#bne与load_E暂停
	lw		$4, 0($0)
	nop
	bne		$3, $4, Exit	#bne与load_M暂停	
	or		$5, $4, $0
	bne 	$5, $4, Exit	#bne与cal_r_E暂停
	lw		$6, 0($0)
	xor		$7, $6, $0		#xor与load_E暂停
	jal     loop2
	add     $8, $6, $7
	j		Exit
	nop
loop2:
	sw		$8, 6($8)
	lw      $7, 6($8)
	sll		$9, $7, 2
	srl		$10, $9, 1
	jr		$ra
	nop
Exit:
	lw		$9, 6($8)
	addi	$9, $9, 1	#addiu 与 load_E暂停
	lw		$10, 6($8)
	lw		$11, 6($10) #load_D与 load_E暂停
	sw		$9,  6($11) #sw_D与load_E暂停
	

	ori $17, $17, 1
	
	sw $17, 0($0)
	sw $17, 4($0)
	sw $17, 8($0)
	sw $17, 12($0)
	sw $17, 16($0)
	sw $17, 20($0)
	sw $17, 24($0)

#lw与cal_r类型暂停
	lw $12, 0($0)
	or $13, $13, $12
	bne $13, $12, End		#lw_M与b类型暂停
	lw $14, 4($0)
	add $14, $14, $0
	lw $15, 8($0)
	sub $15, $15, $14
	lw $16, 12($0)
	and $16, $16, $14
	lw  $18, 16($0)
	sll $18, $18, 3
	lw  $19, 20($0)
	srl $20, $20, 2 
	
#lw 与 cal_i类型暂停
	lw  $21, 24($0)
	ori $22, $21, 4
	lw  $23, 28($0)
	lui $23, 9
	 	
End:
	
