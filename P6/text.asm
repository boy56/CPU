ori $1, $1, 3
ori $2, $2, 4
nor  $3, $2, $1
andi $4, $1, 2
xori $5, $4, 7
lui  $6, 0x0000ffff
slt  $7, $1, $6
sltu $8, $1, $6
slti $9, $8, 128
sltiu $10, $8, 128
