lui $9, 0x0001
ori $9, $9, 1
# $9 = 0x00010001

addu $10, $9, $0
ori $9, $10, 0x0010
# $10 = 0x00010001 $9 = 0x00010011

jal next 
ori $9, $31, 0x0100 # line 6
next:
# $9 = 0x00003118  $31 = 0x00003018

lw $9, 0($0)
ori $9, 0x0100
# $9 = 0x00000100

lw $9, 4($0)
nop
ori $9, 0x1000
# $9 = 0x00001000

lui $8, 0x0001
addu $10, $8, $9
# $8 = 0x00010000 $10 = 0x00011000

subu $8, $10, $8
addu $10, $8, $9
# $8 = 0x00001000 $10 = 0x00002000

jal next2
addu $10, $31, $0 # line 17
next2:
# $10 = 0x00003044 $31 = 0x00003044

lw $10, 0($0)
addu $8, $10, $8
# $10 = 0x00000000 $8 = 0x00001000

sw $8, 0($0)
lw $10, 0($0)
nop
addu $8, $10, $8
# $10 = 0x00001000 $8 = 0x00002000

lui $8, 0x0001
addu $10, $9, $8
# $8 = 0x00010000 $10 = 0x00011000

subu $8, $10, $8
addu $10, $9, $8
# $8 = 0x00001000 $10 = 0x00002000

jal next100
addu $10, $0, $31 # line 29
next100:
# $10 = 0x00003074 $31 = 0x00003074

lw $10, 4($0)
addu $8, $8, $10
# $10 = 0x00000000 $8 = 0x00001000

lw $10, 0($0)
nop
addu $8, $10, $8
# $10 = 0x00001000 $8 = 0x00002000

#ori $10, $10, 0x00003098
#jal next3 # line 36
#beq $31, $10, next3
#nop
#nop
#next3:
#nop
# $10 = 0x00003090 $31 = 0x00003090

addu $9, $8, $0
addu $8, $8, $0
beq $8, $9, next4
nop
nop
next4:
# $9 = 0x00002000 $8 = 0x00002000

lui $9, 0x0001
lui $8, 0x0001
beq $8, $9, next5
nop
next5:
# $9 = 0x00010000 $8 = 0x00010000

ori $9, $9, 0x1000
subu $9, $9, $8
lw $8, 0($0)
beq $8, $9, next6
nop
nop
next6:
# $9 = 0x00001000 $8 = 0x00001000

ori $9, $9, 1
addu $8, $9, $0
beq $9, $8, next7
nop
nop
next7:
# $9 = 0x00001001 $8 = 0x00001001

ori $9, $9, 1
addu $8, $9, $0
nop
beq $8, $9, next8
nop
nop
next8:
# $9 = 0x00001002 $8 = 0x00001002

ori $9, $9, 0x2000
subu $9, $9, $8
lw $8, 0($0)
nop
beq $8, $9, next9
nop
nop
next9:
# $9 = 0x00001000 $8 = 0x00001000

ori $10, $10, 0x3134
jal next10 #line 75
nop
next10: beq $31, $10, next11
nop
nop
next11:
nop
# $10 = 0x00003134 $31 = 0x00003134