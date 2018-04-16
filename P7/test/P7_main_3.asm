# 1. set all GPR to 0
# 2. set SR, enable IE.EXL, but only SR.IM2 enable(Timer0)
# 3. start Timer1 CTRL, PRESET = 4, (short time)
# 4. start Timer0 CTRL, PRESET = 8, (short time)
# 5. execute exception_handler, it will ++cnt (address at 0) and restart Timer0 PRESET = 0x200 (long time)
# 6. never stop
.data
.globl TC0_BASE TC1_BASE cnt0 cnt1 cnt0_double cnt1_double
TC0_BASE: .word 0x7f00
TC1_BASE: .word 0x7f10
cnt0: .word 0
cnt1: .word 0
cnt0_double: .word 0
cnt1_double: .word 0
.text
	move $1,$0
	move $2,$0
	move $3,$0
	move $4,$0
	move $5,$0
	move $6,$0
	move $7,$0
	move $8,$0
	move $9,$0
	move $10,$0
	move $11,$0
	move $12,$0
	move $13,$0
	move $14,$0
	move $15,$0
	move $16,$0
	move $17,$0
	move $18,$0
	move $19,$0
	move $20,$0
	move $21,$0
	move $22,$0
	move $23,$0
	move $24,$0
	move $25,$0
	move $26,$0
	move $27,$0
	move $28,$0
	move $29,$0
	move $30,$0
	move $31,$0
	
	ori $t0, $0, 0x7f00
	sw $t0, 0($0)
	ori $t1, $0, 0x7f10
	sw $t1, 4($0)
	
	ori $t0,$0,0x0401
	mtc0 $t0,$12		# set SR, included IM, IE, EXL
	
	la $t1, TC1_BASE
	lw $t1, 0($t1)
	sw $0, 0($t1)		# disable Timer1.CTRL
	
	addiu $t0,$0,4		# set Timer1.PRESET
	sw $t0, 4($t1)
	addiu $t0, $0, 9	# set Timer1.CTRL
	sw $t0, 0($t1)
	
	la $t1, TC0_BASE
	lw $t1, 0($t1)
	sw $0, 0($t1)		# disable Timer0.CTRL
	
	addiu $t0,$0,8		# set Timer0.PRESET
	sw $t0, 4($t1)
	addiu $t0, $0, 9	# set Timer0.CTRL
	sw $t0, 0($t1)
	
	bgez $t0, deadLoop
	addiu $v0,$v0,1
	
deadLoop:
	addiu $v1,$v1,1
	li $s1, 2
	multu $v1, $s1
	mflo $s0
	beq $0,$0,deadLoop
	nop
	
