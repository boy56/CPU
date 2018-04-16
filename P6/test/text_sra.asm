	lui $1,0xffff
	ori $24, $0, 3
	ori $25, $0, 6
	sllv $2, $1, $24
	srlv $3, $2, $25
	sra  $4, $1, 16
	ori $23, $0, 16
	srav $5, $1, $23
	jal loop1
	nop
	ori $6, $0, 6
	addi $20, $20, 4
	jr $20
	nop
loop1:
	jalr $20, $ra
	nop
	ori $26, $0, 0xffff
	ori $7, $0, 7
	