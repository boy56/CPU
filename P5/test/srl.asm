ori $1, 0x1234
addu $2, $2, $1
srl $3, $2, 4 #ǰ��r��ָ��

srl $4, $3, 4 #ǰ��srl
ori $1, 0x2345
srl $5, $1, 4 #ǰ��ori

jal next
srl $6, $ra, 8
next:
add $2, $2, $6
sub $3, $6, $2
srl $7, $2, 4 #W��r��

jal next2
sw $7, 2($7)
next2:
srl $8, $ra, 4
sw $7, 1($8)
lw $9, 1($8)
srl $10, $9, 4
srl $11, $9, 4	#����

addu $12, $11, $11	
sub $12, $11, $9
srl $13, $12, 4

