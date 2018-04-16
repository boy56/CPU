ori $1, 0x1234
addu $2, $2, $1
or $3, $2, $1 #前序r型指令

or $4, $3, $2 #前序srl
ori $1, 0x2345
or $5, $1, $4 #前序ori

jal next
or $6, $ra, $5
next:
add $2, $2, $6
sub $3, $6, $2
or $7, $2, $3 #W级r型
ori $14, 0x4
or $14, $14, $14

jal next2
sw $7, ($14)
next2:
or $8, $ra, $7
sw $8, 0($14)
lw $9, 0($14)
or $10, $9, $8
or $11, $9, $8	#后序

addi $11, $11, -1	
sub $12, $11, $9
or $13, $12, $12

