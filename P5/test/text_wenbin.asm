ori $1, $0, 0x0020
ori $2, $0, 0x3018
ori $3, $0, 0x0004

addu $1, $2, $3
jr $1
nop
addu $4, $0, $2
addu $5, $1, $2
addu $6, $1, $1
addu $0, $0, $2
addu $7, $0, $2



ori $2, $0, 0x3018
ori $1, $0, 0x3048
nop
jr $1
nop
addu $8, $0, $2
subu $9, $2, $0
addu $10, $3, $2



ori $2, $0, 0x303c
ori $3, $0, 0x0030
addu $1, $2, $3
nop
nop
jr $1
nop
addu $11, $3, $3
subu $12, $3, $0
addu $13, $2, $1



ori $14, 0x308c
sw $14, 0($0)
lw $15, 0($0)
jr $15
nop
addu $16, $5, $14
subu $17, $3, $0
addu $18, $0, $15


ori $19, 0x30b0
sw $19, 4($0)
lw $20, 4($0)
nop
jr $20 #a4
nop
lui $21, 0x6578
addu $22, $17, $0
subu $23, $22, $21




ori $24, 0x30dc
sw $24, 8($0)
lw $25, 8($0)
nop
nop
jr $25 #d0
nop
ori $26, 0x3684
addu $26, $26, $15
subu $26, $26, $10



ori $3, $0, 0x0010
jal LOOP
nop
addu $31, $31, $3
LOOP:
jr $31 
nop
addu $27, $31, $2
addu $0, $26, $6
subu $28, $27, $0

jal L
addu $31, $31, $3
addu $31, $31, $3
L:
jr $31
ori $30, $0, 0x9143
addu $30, $31, $25
subu $30, $30, $3
addu $30, $30, $7
ori $30, $30, 0x7356
