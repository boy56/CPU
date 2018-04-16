.ktext 0x00004180
_int_entry:
	# 0x2E00 ~ 0x02FFC(512-Bytes) coulde be used to save context only k0 & k1 could be used before interrupt enable again
	# save sp to system stack top
	ori $k0, $0, 0x1000
	sw $sp, -4($k0)
	# save SR to stack
	mfc0 $k1, $12
	sw $k1, -8($k0)
	
	# sp point to stack bottom with  absolutely safety(half of system stack)
	addiu $k0, $k0, -256
	move $sp, $k0
	
	# save context
	j _save_context
	nop
	
_int_entry_save_context:
	# usually we must check bit of IP&IM to get which one of handler souces deserve a handle
	#	but in this test file, only Timer 0 can produce Interrupt, so no need to check.
	# jump the timer 0 handler
	jal hw_int_handler
	nop
	
	# restore context
	j _restore_context
	nop
	
_int_entry_restore_context:
	# restore sp
	li $k0, 0x1000
	lw $sp, -4($k0)
	# restore CP0.SR and enable interrupt
	mfc0 $k1, $12
	ori $k1, $k1, 0x1
	mtc0 $k1, $12
	
	mfc0    $k0, $14                # get original PC where exception happened
    mtc0    $k0, $14                # write to EPC
	# return from interrupt
	eret
	nop								# also a delay slot 

	
hw_int_handler:
	sw		$ra, 0($sp)
	addiu	$sp, $sp, -16
	mfc0	$v0, $12				# read sr
	sw		$v0, 0($sp)
	mfc0	$v0, $13				# read cause
	sw		$v0, 4($sp)
	
	
	# check INT[3]
	lw		$v0, 0($sp)
	lw		$v1, 4($sp)
	and		$v0, $v1, $v0
	andi	$v0, $v0, 0x800
	bne		$v0, $0, timer1_handler
	nop
	
	
	# check INT[2]
	lw		$v0, 0($sp)
	lw		$v1, 4($sp)
	and		$v0, $v1, $v0
	andi	$v0, $v0, 0x400
	bne		$v0, $0, timer0_handler
	nop
	
	
_hw_int_handler_ret:
	addiu $sp, $sp, 16
	lw	$ra, 0($sp)
	jr $ra
	nop
	
	
timer0_handler:
	# first we load the global variable cnt0:
	# ++cnt0, then save to global variable cnt0
	li $fp, 0x8
	lw $t0, 0($fp)				# get cnt0
	addiu $t0, $t0, 1			# add cnt0
	sw $t0, 0($fp)				# update cnt0
	li $fp, 0x10
	sw $s0, 0($fp)				# update cnt0_double
	jal	restart_timer
	nop
	
	# mask INT[2]
	mfc0 $t0, $12
	andi $t0, $t0, 0x03ff
	ori $t0, $t0, 0x800
	mtc0 $t0, $12
	
	j	_hw_int_handler_ret
	nop
	
timer1_handler:
	# first we load the global variable cnt1:
	# ++cnt1, then save to global variable cnt1
	li $fp, 0xc
	lw $t0, 0($fp)				# get cnt1
	addiu $t0, $t0, 1			# add cnt1
	sw $t0, 0($fp)				# update cnt1
	li $fp, 0x14
	sw $s0, 0($fp)				# update cnt1_double
	jal	restart_timer
	nop
	
	# mask INT[3]
	mfc0 $t0, $12
	andi $t0, $t0, 0x03ff
	ori $t0, $t0, 0x400
	mtc0 $t0, $12
	
	j	_hw_int_handler_ret
	nop
	
restart_timer:
	# restart Timer 0
	li $t1, 0x0
	lw $t1, 0($t1)
	lw $t0, 0($t1)				# $t0 is the CTRL Reg of Timer 0
	sw $0, 0($t1)				# disable Timer 0
	ori $v0, $0, 0x100
	sw $v0, 4($t1)				# refill the count number
	addiu $t0, $0, 9	# set Timer0.CTRL
	sw $t0, 0($t1)				# Timer 0 restart count
	
	# restart Timer 1
	li $t1, 0x4
	lw $t1, 0($t1)
	lw $t0, 0($t1)				# $t0 is the CTRL Reg of Timer 1
	sw $0, 0($t1)				# disable Timer 1
	ori $v0, $0, 0x100
	sw $v0, 4($t1)				# refill the count number
	addiu $t0, $0, 9
	sw $t0, 0($t1)				# Timer 1 restart count
	
	jr $ra
	nop
	
_save_context:
	sw $1,4($sp)
    sw  $2, 8($sp)    
    sw  $3, 12($sp)    
    sw  $4, 16($sp)    
    sw  $5, 20($sp)    
    sw  $6, 24($sp)    
    sw  $7, 28($sp)    
    sw  $8, 32($sp)    
    sw  $9, 36($sp)    
    sw  $10, 40($sp)    
    sw  $11, 44($sp)    
    sw  $12, 48($sp)    
    sw  $13, 52($sp)    
    sw  $14, 56($sp)    
    sw  $15, 60($sp)    
    sw  $16, 64($sp)    
    sw  $17, 68($sp)    
    sw  $18, 72($sp)    
    sw  $19, 76($sp)    
    sw  $20, 80($sp)    
    sw  $21, 84($sp)    
    sw  $22, 88($sp)    
    sw  $23, 92($sp)    
    sw  $24, 96($sp)    
    sw  $25, 100($sp)    
    sw  $26, 104($sp)    
    sw  $27, 108($sp)    
    sw  $28, 112($sp)    
    sw  $29, 116($sp)    
    sw  $30, 120($sp)    
    sw  $31, 124($sp)
	mfhi $k0
	sw $k0, 128($sp)
	mflo $k0
	sw $k0, 132($sp)
	j _int_entry_save_context
	nop
	
_restore_context:
	lw $1,4($sp)
    lw  $2, 8($sp)    
    lw  $3, 12($sp)    
    lw  $4, 16($sp)    
    lw  $5, 20($sp)    
    lw  $6, 24($sp)    
    lw  $7, 28($sp)    
    lw  $8, 32($sp)    
    lw  $9, 36($sp)    
    lw  $10, 40($sp)    
    lw  $11, 44($sp)    
    lw  $12, 48($sp)    
    lw  $13, 52($sp)    
    lw  $14, 56($sp)    
    lw  $15, 60($sp)    
    lw  $16, 64($sp)    
    lw  $17, 68($sp)    
    lw  $18, 72($sp)    
    lw  $19, 76($sp)    
    lw  $20, 80($sp)    
    lw  $21, 84($sp)    
    lw  $22, 88($sp)    
    lw  $23, 92($sp)    
    lw  $24, 96($sp)    
    lw  $25, 100($sp)    
    lw  $26, 104($sp)    
    lw  $27, 108($sp)    
    lw  $28, 112($sp)    
    lw  $29, 116($sp)    
    lw  $30, 120($sp)    
    lw  $31, 124($sp)    
	lw $k0, 128($sp)
	mthi $k0
	lw $k0, 132($sp)
	mtlo $k0
    j _int_entry_restore_context	
	nop