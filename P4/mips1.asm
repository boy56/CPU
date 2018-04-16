	ori     $t0, $t0, 8
	ori		$s1, $s1, -8
	ori		$t4, $t4, 4 	#作为存取数据的基地址使用	
	lui     $t1, 9 
	addu    $t2, $t0, $t1	#t2 = 0x00090008
	subu    $t3, $t1, $t0
	sw      $t0, 4($t4)
	sw		$t0, 8($t4)
	swl		$s1, 10($t4)
	lw      $t5, 4($t4)
	jal     jal_one
	subu    $t0, $t0, $t5
	beq     $t0, $0, loop	#等于0的时候跳转
jal_one:
	ori     $t1, $t1, 1
	addu    $t2, $t1, $t1	#t2 = 0x00120002
	jr      $ra
loop:
	nop
	nop
	bgez	$s1,  loop_two
	bgez     $t1,  loop

loop_two:
	addu $s7, $t5, $t5