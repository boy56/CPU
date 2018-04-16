addi $1, $1, 1
xor $16, $1, $0

sw $1, 0($0)
lw $2, 0($0)
xor $17, $2, $0

addu $3, $1, $2
xor $18, $3, $1

jal next1
xor $19, $3, $ra
addi $19, $19, 1       #doesn't execute
next1:

bne $1, $2, next2    #doesn't branch
xor $20, $3, $0
next2:

#---------------------------------------------

addi $4, $1, 1
nop
xor $21, $0, $4

lw $5, 0($0)
nop
xor $22, $1, $5

addu $6, $1, $4
nop
xor $23, $3, $6

jal next3
nop
next3:
xor $24, $4, $ra

bne $0, $1, next4    #branch
nop
xor $20, $3, $0
next4:
