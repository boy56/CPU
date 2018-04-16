	ori $3, $0, 8
	addu $4, $0, $3
	subu $5, $4, $0
	beq $5, $4, loop
	lw  $5, 0($0) 
loop:
	lui $6, 4 
	sw  $6, 4($0)