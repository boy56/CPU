	ori $t0, $0, 0x7f00
	sw $t0, 0($0)		#timer0�ĳ���ַ
	ori $t1, $0, 0x7f10
	sw $t1, 4($0)		#timer1�ĳ���ַ
	
	ori $t0,$0,0x0401
	mtc0 $t0,$12		# set SR��im[15:10] = 6'b000001, exl, ieȫ���ж�ʹ��
	
	ori $s1, $0, 9		#ctrl��ֵ��ֻ�ǽ�Enableλ��Ϊ1��λ��ģʽ0, Ctrl[3]=1,�����ж�
	ori $s2, $0, 10		#preset��ֵ
	
	lw $t0, 0($0) 		#��ʱ$t0ָ����timer0��Ctrl�Ĵ���
	sw $s1, 0($t0)	
	sw $s2, 4($t0)
	
loop:

	addi $s7, $s7, 1
	addi $s6, $s6, 1
	addi $s5, $s5, 1
	addi $s4, $s4, 1
	
	j loop
	nop
