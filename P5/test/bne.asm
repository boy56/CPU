ori $1, $1, 2
bne $1, $0, next1  # does branch
nop
addi $1, $1, 1     # doesn't execute
next1:

addu $2, $1, $1
bne $2, $0, next2  # does branch
nop
sub $2, $2, $1   # doesn't execute
next2:

sw $2, 0($0)
lw $3, 0($0)
bne $3, $2, next3  # doesn't branch
nop
addi $3, $3, 1
next3:

jal next4
nop
next4:
bne $ra, $0, next5  # does branch
nop
addi $3, $3, 1  # doesn't execute
next5:

#------------------------------------------------
ori $4, $1, 2
bne $0, $4, next6  # does branch
nop
addi $1, $1, 1     #doesn't execute
next6:

addu $5, $4, $3
bne $0, $5, next7  # does branch
nop
sub $2, $2, $1   # doesn't execute
next7:

lw $6, 0($0)
nop
bne $6, $2, next8  # doesn't branch
nop
addi $3, $3, 1
next8: