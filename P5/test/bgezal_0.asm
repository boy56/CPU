lui $1, 0xffff
ori $1, $1, 0xffff
addi $1, $1, 100
bgezal $1, next1
nop
nop
nop
next1:
lui $1, 0xffff
ori $1, $1, 0xffff
bgezal $1, next2
nop
nop
addi $1, $1, 0
nop
next2: