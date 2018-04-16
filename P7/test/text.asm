	ori $t0, $0, 0x7f00
	sw $t0, 0($0)		#timer0的初地址
	ori $t1, $0, 0x7f10
	sw $t1, 4($0)		#timer1的初地址
	
	ori $t0,$0,0x0401
	mtc0 $t0,$12		# set SR中im[15:10] = 6'b000001, exl, ie全局中断使能
	
	ori $s1, $0, 9		#ctrl的值，只是将Enable位置为1，位于模式0, Ctrl[3]=1,允许中断
	ori $s2, $0, 10		#preset的值
	
	lw $t0, 0($0) 		#此时$t0指的是timer0的Ctrl寄存器
	sw $s1, 0($t0)	
	sw $s2, 4($t0)
	
loop:

	addi $s7, $s7, 1
	addi $s6, $s6, 1
	addi $s5, $s5, 1
	addi $s4, $s4, 1
	
	j loop
	nop
