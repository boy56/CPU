ori $25, $0, 0xffff2500
ori $2, $0, 0x12345678
mult $25, $2
mfhi $3
mflo $4
multu $25, $2
mfhi $5
mflo $6
#ori $7, $0, 13
#ori $8, $0, 3
div $25, $2
mfhi $9 
mflo $10
mthi $25
mtlo $2
mfhi $11
mflo $12
divu $25, $2
mfhi $13
mflo $14