	lw $1, 8188($0)
	li $2, -261615258
	addu $2, $1, $2
	li $3, -1914856826
	li $4, -1245131645
	jal beg0
	mthi $31
	beq $0, $0, skip0
	nop
beg0:	mfhi $25
	jr $25
	nop
	sw $25, 0($0)
skip0:	la $12, beg1
	jalr $22, $12
	nop
	beq $0, $0, skip1
	nop
beg1:	mthi $22
	mfhi $12
	jr $12
	nop
	sw $12, 4($0)
skip1:	la $10, beg2
	jalr $21, $10
	nop
	beq $0, $0, skip2
	nop
beg2:	nop
	mthi $21
	mfhi $10
	jr $10
	nop
	sw $10, 8($0)
skip2:	la $7, beg3
	jalr $27, $7
	mthi $27
	beq $0, $0, skip3
	nop
beg3:	mfhi $7
	nop
	jr $7
	nop
	sw $7, 12($0)
skip3:	jal beg4
	nop
	beq $0, $0, skip4
	nop
beg4:	mthi $31
	mfhi $20
	nop
	jr $20
	nop
	sw $20, 16($0)
skip4:	la $13, beg5
	jalr $20, $13
	nop
	beq $0, $0, skip5
	nop
beg5:	nop
	mthi $20
	mfhi $13
	nop
	jr $13
	nop
	sw $13, 20($0)
skip5:	la $23, beg6
	jalr $29, $23
	mthi $29
	beq $0, $0, skip6
	nop
beg6:	mfhi $23
	nop
	nop
	jr $23
	nop
	sw $23, 24($0)
skip6:	jal beg7
	nop
	beq $0, $0, skip7
	nop
beg7:	mthi $31
	mfhi $24
	nop
	nop
	jr $24
	nop
	sw $24, 28($0)
skip7:	jal beg8
	nop
	beq $0, $0, skip8
	nop
beg8:	nop
	mtlo $31
	mflo $7
	nop
	nop
	jr $7
	nop
	sw $7, 32($0)
skip8:	jal beg9
	sh $31, 36($0)
	beq $0, $0, skip9
	nop
beg9:	lhu $13, 36($0)
	jr $13
	nop
	sw $2, 36($0)
skip9:	jal beg10
	nop
	beq $0, $0, skip10
	nop
beg10:	sh $31, 40($0)
	lh $8, 40($0)
	jr $8
	nop
	sw $2, 40($0)
skip10:	la $27, beg11
	jalr $22, $27
	nop
	beq $0, $0, skip11
	nop
beg11:	nop
	sh $22, 44($0)
	lhu $27, 44($0)
	jr $27
	nop
	sw $2, 44($0)
skip11:	la $30, beg12
	jalr $10, $30
	sh $10, 48($0)
	beq $0, $0, skip12
	nop
beg12:	lw $30, 48($0)
	nop
	jr $30
	nop
	sw $2, 48($0)
skip12:	la $19, beg13
	jalr $29, $19
	nop
	beq $0, $0, skip13
	nop
beg13:	sw $29, 52($0)
	lw $19, 52($0)
	nop
	jr $19
	nop
	sw $2, 52($0)
skip13:	la $12, beg14
	jalr $11, $12
	nop
	beq $0, $0, skip14
	nop
beg14:	nop
	sw $11, 56($0)
	lhu $12, 56($0)
	nop
	jr $12
	nop
	sw $2, 56($0)
skip14:	jal beg15
	sw $31, 60($0)
	beq $0, $0, skip15
	nop
beg15:	lw $23, 60($0)
	nop
	nop
	jr $23
	nop
	sw $2, 60($0)
skip15:	la $23, beg16
	jalr $16, $23
	nop
	beq $0, $0, skip16
	nop
beg16:	sw $16, 64($0)
	lhu $23, 64($0)
	nop
	nop
	jr $23
	nop
	sw $2, 64($0)
skip16:	jal beg17
	nop
	beq $0, $0, skip17
	nop
beg17:	nop
	sh $31, 68($0)
	lhu $20, 68($0)
	nop
	nop
	jr $20
	nop
	sw $2, 68($0)
skip17:	li $24, 372907529
	la $19, skip18
	jalr $24, $19
	lhu $19, -0x3000($24)
skip18:	xori $19, 30602
	sh $19, -0x3000($24)
	li $ra, 1765961846
	jal skip19
	nop
skip19:	lh $10, -0x3000($31)
	xori $10, 6830
	sh $10, -0x3000($31)
	li $8, -1443747069
	la $24, skip20
	jalr $8, $24
	nop
skip20:	nop
	lb $24, -0x3000($8)
	xori $24, 29274
	sb $24, -0x3000($8)
	li $27, -1348354667
	la $22, skip21
	jalr $27, $22
	lw $22, -0x3000($27)
skip21:	xori $22, 8668
	sw $22, -0x3000($27)
	li $9, 1932112775
	la $30, skip22
	jalr $9, $30
	nop
skip22:	lh $30, -0x3000($9)
	xori $30, 1420
	sh $30, -0x3000($9)
	li $11, 531740115
	la $15, skip23
	nop
	nop
	jalr $11, $15
	nop
skip23:	nop
	lhu $15, -0x3000($11)
	xori $15, 5527
	sh $15, -0x3000($11)
	li $12, 754851634
	la $30, skip24
	nop
	nop
	jalr $12, $30
	lh $30, -0x3000($12)
skip24:	xori $30, 28874
	sh $30, -0x3000($12)
	li $25, 1110343246
	la $28, skip25
	nop
	jalr $25, $28
	nop
skip25:	lbu $28, -0x3000($25)
	xori $28, 9641
	sb $28, -0x3000($25)
	li $ra, 1772721763
	jal skip26
	nop
skip26:	nop
	lh $18, -0x3000($31)
	xori $18, 31526
	sh $18, -0x3000($31)
	ori $ra, $0, 0
	la $13, foo
	jalr $12, $13
	nop
	ori $ra, $0, 0
	jal fooo
	nop
	j jal_jr_manual_end
	nop
	foo: jr $12
	nop
	fooo: nop
	jr $ra
	nop
	jal_jr_manual_end:
	multu $2, $3
	la $13, beg27
	jalr $10, $13
	nop
	nop
beg27:	beq $13, $10, skip27
	nop
	addu $2, $2, $ra
skip27:	sw $2, 72($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $13, beg28
	jal beg28
	nop
	nop
beg28:	beq $13, $31, skip28
	nop
	addu $2, $2, $ra
skip28:	sw $2, 76($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $18, beg29
	jal beg29
	nop
beg29:	bne $18, $31, skip29
	nop
	addu $2, $2, $ra
skip29:	sw $2, 80($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $21, beg30
	jalr $7, $21
	nop
beg30:	beq $21, $7, skip30
	nop
	addu $2, $2, $ra
skip30:	sw $2, 84($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $7, beg31
	jalr $28, $7
	nop
beg31:	bgez $7, skip31
	nop
	addiu $2, $2, 9392
skip31:	sw $2, 88($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	jal beg32
	nop
beg32:	nop
	bgez $24, skip32
	nop
	addiu $2, $2, 3919
skip32:	sw $2, 92($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	jal beg33
	nop
beg33:	bgez $18, skip33
	nop
	addiu $2, $2, 22137
skip33:	sw $2, 96($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	jal beg34
	nop
beg34:	nop
	bgez $13, skip34
	nop
	addiu $2, $2, 10375
skip34:	sw $2, 100($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	jal beg35
	nop
beg35:	bgez $11, skip35
	nop
	addiu $2, $2, 17362
skip35:	sw $2, 104($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $27, beg36
	jalr $13, $27
	nop
beg36:	nop
	bgez $27, skip36
	nop
	addiu $2, $2, 7692
skip36:	sw $2, 108($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	jal beg37
	nop
beg37:	bgez $27, skip37
	nop
	addiu $2, $2, 29639
skip37:	sw $2, 112($0)
	mflo $2
	addu $2, $2, $4
	multu $2, $3
	la $25, beg38
	jalr $7, $25
	nop
beg38:	nop
	bgez $25, skip38
	nop
	addiu $2, $2, 17478
skip38:	sw $2, 116($0)
	mflo $2
	addu $2, $2, $4
	la $7, skip39
	jalr $28, $7
	divu $2, $28
skip39:	mflo $7
	sw $7, 120($0)
	la $21, skip40
	jalr $26, $21
	nop
skip40:	divu $2, $26
	mflo $21
	sw $21, 124($0)
	jal skip41
	nop
skip41:	nop
	mult $2, $31
	mflo $12
	sw $12, 128($0)
	jal skip42
	div $2, $31
skip42:	mflo $7
	sw $7, 132($0)
	la $25, skip43
	jalr $19, $25
	nop
skip43:	div $2, $19
	mflo $25
	sw $25, 136($0)
	la $18, skip44
	jalr $27, $18
	nop
skip44:	nop
	mult $2, $27
	mflo $18
	sw $18, 140($0)
	jal skip45
	div $2, $31
skip45:	mflo $29
	sw $29, 144($0)
	la $23, skip46
	jalr $11, $23
	nop
skip46:	mult $2, $11
	mflo $23
	sw $23, 148($0)
	la $10, skip47
	jalr $29, $10
	nop
skip47:	nop
	multu $2, $29
	mflo $10
	sw $10, 152($0)
	multu $2, $3
	li $11, 246
	li $16, 292
	sw $2, -90($11)
	mflo $2
	addu $2, $2, $4
	sw $2, -132($16)
	lw $11, -90($11)
	lw $16, -132($16)
	addu $5, $11, $16
dl:	j dl
	nop
