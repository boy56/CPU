	ori     $t0, $t0, 8
	ori		$t4, $t4, 4 	#��Ϊ��ȡ���ݵĻ���ַʹ��	
	lui     $t1, 9 
	addu    $t2, $t0, $t1	#t2 = 0x00090008
	subu    $t3, $t1, $t0
	sw      $t0, 4($t4)
	lw      $t5, 4($t4)
	jal     jal_one
	subu    $t0, $t0, $t5
	beq     $t0, $0, loop	#����0��ʱ����ת
jal_one:
	ori     $t1, $t1, 1
	addu    $t2, $t1, $t1	#t2 = 0x00120002
	jr      $ra
loop:
	nop
	nop
	beq     $t1, $zero, loop