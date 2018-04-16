.text
init_1:j init_41
	lui $0, 17877
init_2:j init_57
	ori $4, 37445
init_3:j init_15
	lui $20, 60835
init_4:nop
j init_37
	ori $3, 45126
init_5:j init_12
	lui $29, 9220
init_6:j init_61
	lui $9, 50759
init_7:nop
j init_28
	ori $11, 19763
init_8:j init_53
	lui $1, 6014
init_9:j init_36
	lui $18, 28029
init_10:j init_48
	ori $30, 44020
init_11:j init_38
	ori $12, 47183
init_12:nop
j init_59
	ori $29, 38844
init_13:j init_14
	lui $10, 20926
init_14:j init_35
	ori $10, 2255
init_15:j init_34
	ori $20, 2700
init_16:j init_63
	lui $26, 9017
init_17:j init_19
	lui $7, 24244
init_18:nop
j init_43
	ori $13, 13310
init_19:nop
j init_44
	ori $7, 32360
init_20:j init_22
	lui $16, 16975
init_21:nop
j init_42
	ori $21, 43435
init_22:j init_55
	ori $16, 34648
init_23:j init_51
	lui $6, 42566
init_24:j init_47
	lui $24, 54406
init_25:nop
j init_16
	ori $25, 39006
init_26:nop
j init_23
	ori $5, 28756
init_27:j init_33
	lui $27, 1395
init_28:j init_11
	lui $12, 29071
init_29:nop
j init_9
	ori $17, 18925
init_30:j init_54
	ori $2, 8472
init_31:j init_6
	ori $8, 18722
init_32:nop
j init_20
	ori $15, 27194
init_33:nop
j init_58
	ori $27, 40926
init_34:j init_21
	lui $21, 57707
init_35:j init_7
	lui $11, 8558
init_36:j init_52
	ori $18, 27021
init_37:j init_2
	lui $4, 59173
init_38:j init_18
	lui $13, 65470
init_39:j begin
	ori $31, 47711
init_40:nop
j init_3
	ori $19, 46503
init_41:j init_8
	ori $0, 8471
init_42:j init_60
	lui $22, 25137
init_43:j init_50
	lui $14, 54495
init_44:j init_31
	lui $8, 4314
init_45:j init_32
	lui $15, 60532
init_46:j init_25
	lui $25, 46975
init_47:j init_46
	ori $24, 32704
init_48:j init_39
	lui $31, 15005
init_49:nop
j init_24
	ori $23, 3687
init_50:j init_45
	ori $14, 18457
init_51:j init_17
	ori $6, 28866
init_52:j init_40
	lui $19, 4234
init_53:nop
j init_64
	ori $1, 39805
init_54:j init_4
	lui $3, 26378
init_55:j init_29
	lui $17, 64904
init_56:j init_49
	lui $23, 20334
init_57:j init_26
	lui $5, 49328
init_58:j init_62
	lui $28, 33557
init_59:j init_10
	lui $30, 46239
init_60:j init_56
	ori $22, 62515
init_61:nop
j init_13
	ori $9, 11363
init_62:j init_5
	ori $28, 55188
init_63:j init_27
	ori $26, 38522
init_64:j init_30
	lui $2, 15597
begin:
	sw $0, 0($0)
	sw $1, 4($0)
	sw $2, 8($0)
	sw $3, 12($0)
	sw $4, 16($0)
	sw $5, 20($0)
	sw $6, 24($0)
	sw $7, 28($0)
	sw $8, 32($0)
	sw $9, 36($0)
	sw $10, 40($0)
	sw $11, 44($0)
	sw $12, 48($0)
	sw $13, 52($0)
	sw $14, 56($0)
	sw $15, 60($0)
	sw $16, 64($0)
	sw $17, 68($0)
	sw $18, 72($0)
	sw $19, 76($0)
	sw $20, 80($0)
	sw $21, 84($0)
	sw $22, 88($0)
	sw $23, 92($0)
	sw $24, 96($0)
	sw $25, 100($0)
	sw $26, 104($0)
	sw $27, 108($0)
	sw $28, 112($0)
	sw $29, 116($0)
	sw $30, 120($0)
	sw $31, 124($0)
	srl $0, $0, 13
	srl $1, $1, 11
	sll $2, $2, 27
	srl $3, $3, 15
	srl $4, $4, 3
	srl $5, $5, 6
	srl $6, $6, 11
	srl $7, $7, 22
	sll $8, $8, 1
	sll $9, $9, 9
	srl $10, $10, 4
	sll $11, $11, 18
	srl $12, $12, 5
	sll $13, $13, 20
	sll $14, $14, 15
	srl $15, $15, 31
	srl $16, $16, 5
	sll $17, $17, 28
	sll $18, $18, 11
	srl $19, $19, 11
	sll $20, $20, 8
	sll $21, $21, 10
	sll $22, $22, 11
	srl $23, $23, 25
	srl $24, $24, 11
	srl $25, $25, 29
	sll $26, $26, 19
	sll $27, $27, 2
	srl $28, $28, 30
	sll $29, $29, 4
	sll $30, $30, 31
	srl $31, $31, 15
	or $5, $5, $2
	sw $5, 128($0)
	ori $19, $19, 62106
	nop
	sw $19, 132($0)
	or $25, $25, $17
	nop
	nop
	sw $25, 136($0)
	ori $9, $9, 31617
	sw $9, 140($0)
	ori $18, $18, 41453
	nop
	sw $18, 144($0)
	addiu $2, $2, -17017
	nop
	nop
	sw $2, 148($0)
	addiu $28, $28, 3643
	sw $28, 152($0)
	addiu $15, $15, 10855
	nop
	sw $15, 156($0)
	ori $0, $0, 60350
	nop
	nop
	sw $0, 160($0)
	or $22, $22, $22
	sw $22, 164($0)
	and $7, $7, $9
	nop
	sw $7, 168($0)
	or $4, $4, $14
	nop
	nop
	sw $4, 172($0)
	xor $27, $27, $29
	sw $27, 176($0)
	or $21, $21, $15
	nop
	sw $21, 180($0)
	or $20, $20, $9
	nop
	nop
	sw $20, 184($0)
	ori $25, $25, 53680
	sw $25, 188($0)
	addu $25, $25, $6
	nop
	sw $25, 192($0)
	or $31, $31, $30
	nop
	nop
	sw $31, 196($0)
	addiu $30, $30, -23271
	sw $30, 200($0)
	ori $3, $3, 20579
	nop
	sw $3, 204($0)
	addiu $16, $16, -17422
	nop
	nop
	sw $16, 208($0)
	xor $22, $22, $12
	sw $22, 212($0)
	ori $23, $23, 29974
	nop
	sw $23, 216($0)
	xor $18, $18, $12
	nop
	nop
	sw $18, 220($0)
	addiu $5, $5, 16899
	sw $5, 224($0)
	addiu $28, $28, -29244
	nop
	sw $28, 228($0)
	xor $30, $30, $14
	nop
	nop
	sw $30, 232($0)
	addiu $30, $30, -23042
	sw $30, 236($0)
	subu $30, $30, $1
	nop
	sw $30, 240($0)
	or $21, $21, $1
	nop
	nop
	sw $21, 244($0)
	addu $31, $31, $10
	sw $31, 248($0)
	subu $29, $29, $15
	nop
	sw $29, 252($0)
	addiu $27, $27, -7776
	nop
	nop
	sw $27, 256($0)
	subu $4, $4, $30
	sw $4, 260($0)
	and $22, $22, $10
	nop
	sw $22, 264($0)
	or $22, $22, $21
	nop
	nop
	sw $22, 268($0)
	addiu $19, $19, -28451
	sw $19, 272($0)
	addiu $6, $6, -27300
	nop
	sw $6, 276($0)
	addiu $28, $28, 20823
	nop
	nop
	sw $28, 280($0)
	addiu $27, $27, 29458
	sw $27, 284($0)
	addiu $7, $7, -12668
	nop
	sw $7, 288($0)
	addiu $20, $20, -22650
	nop
	nop
	sw $20, 292($0)
	addiu $24, $24, 16117
	sw $24, 296($0)
	ori $13, $13, 60351
	nop
	sw $13, 300($0)
	ori $8, $8, 44524
	nop
	nop
	sw $8, 304($0)
	ori $27, $27, 49837
	sw $27, 308($0)
	addiu $18, $18, -31839
	nop
	sw $18, 312($0)
	ori $1, $1, 30633
	nop
	nop
	sw $1, 316($0)
	addiu $19, $19, -20007
	sw $19, 320($0)
	ori $28, $28, 60593
	nop
	sw $28, 324($0)
	addiu $31, $31, 27610
	nop
	nop
	sw $31, 328($0)
	addiu $24, $24, 24827
	sw $24, 332($0)
	ori $30, $30, 10473
	nop
	sw $30, 336($0)
	addiu $15, $15, -10504
	nop
	nop
	sw $15, 340($0)
	addiu $9, $9, -25326
	sw $9, 344($0)
	addiu $29, $29, 17241
	nop
	sw $29, 348($0)
	addiu $0, $0, 29913
	nop
	nop
	sw $0, 352($0)
	ori $20, $20, 54536
	sw $20, 356($0)
	ori $18, $18, 5162
	nop
	sw $18, 360($0)
	ori $19, $19, 4310
	nop
	nop
	sw $19, 364($0)
	addiu $15, $15, -32173
	sw $15, 368($0)
	addiu $8, $8, -13895
	nop
	sw $8, 372($0)
	addiu $24, $24, 10366
	nop
	nop
	sw $24, 376($0)
	addiu $14, $14, -11943
	sw $14, 380($0)
	ori $10, $10, 14638
	nop
	sw $10, 384($0)
	addiu $28, $28, 13015
	nop
	nop
	sw $28, 388($0)
	ori $26, $26, 39795
	sw $26, 392($0)
	addiu $5, $5, -31617
	nop
	sw $5, 396($0)
	ori $24, $24, 11578
	nop
	nop
	sw $24, 400($0)
	addiu $2, $2, -1204
	sw $2, 404($0)
	sw $sp, 408($0)
	sw $ra, 412($0)
	sw $at, 416($0)
	addiu $sp, $0, 4060
	jal foo1
	nop
	lui $1, 0
	ori $1, 0
	beq $1, $0, skip_manual1
	nop
	j dl
	nop
skip_manual1:
	lui $1, 22846
	lui $2, 22846
	beq $1, $2, skip_manual2
	nop
	j dl
	nop
skip_manual2:
	lui $3, 22847
	nop
	nop
	beq $1, $3, dl
	addu $4, $4, $3
	lui $1, 0x6183
	addu $2, $2, $1
	lui $5, 0x8124
	addu $4, $5, $1
	subu $6, $6, $5
	jal skip_manual3
	nop
	sw $0, 4($0)
skip_manual3:
	sw $7, -0x3000($ra)
	lw $ra, -0x3000($ra)
	ori $ra, $0, 0
	jal skip_manual4
	nop
	sw $0, 8($0)
skip_manual4:
	beq $ra, $0, dl
	nop
	ori $ra, $0, 0
	jal skip_manual5
	nop
	sw $0, 12($0)
skip_manual5:
	nop
	beq $ra, $0, dl
	nop
	ori $4, $0, 4
	ori $5, $0, 5
	ori $1, $0, 1
	addu $4, $4, $1
	nop
	nop
	beq $4, $5, skip_manual6
	nop
	sw $0, 16($0)
skip_manual6:
	ori $1, $0, 1
	ori $2, $0, 2
	ori $3, $0, 3
	ori $4, $0, 4
	ori $5, $0, 6
	ori $6, $0, 5
	subu $5, $5, $1
	addu $6, $2, $1
	beq $5, $6, dl
	nop
	jal skip_manual8
	nop
skip_manual8:
	addu $3, $3, $ra
	subu $4, $4, $ra
	jal foo
	nop
	jal fooo
	nop
	lui $1, 0x8000
	sw $0, 420($0)
	sw $1, 424($0)
	sw $2, 428($0)
	sw $3, 432($0)
	sw $4, 436($0)
	sw $5, 440($0)
	sw $6, 444($0)
	sw $7, 448($0)
	sw $8, 452($0)
	sw $9, 456($0)
	sw $10, 460($0)
	sw $11, 464($0)
	sw $12, 468($0)
	sw $13, 472($0)
	sw $14, 476($0)
	sw $15, 480($0)
	sw $16, 484($0)
	sw $17, 488($0)
	sw $18, 492($0)
	sw $19, 496($0)
	sw $20, 500($0)
	sw $21, 504($0)
	sw $22, 508($0)
	sw $23, 512($0)
	sw $24, 516($0)
	sw $25, 520($0)
	sw $26, 524($0)
	sw $27, 528($0)
	sw $28, 532($0)
	sw $29, 536($0)
	sw $30, 540($0)
	sw $31, 544($0)
	j p53_begin
	or $v0, $0, $0
p53_query:
	add $t2, $0, $0
p53_query_loop_begin:
	sll $t0, $a0, 2
	lw $t1, 0($t0)
	addu $t2, $t2, $t1
	subu $t3, $0, $a0
	and $t3, $t3, $a0
	subu $a0, $a0, $t3
	bne $a0, $0, p53_query_loop_begin
	nop
	jr $ra
	xor $v0, $v0, $t2
p53_begin:
	jal p53_query
	li $a0, 233
	jal p53_query
	li $a0, 195
	jal p53_query
	li $a0, 68
	jal p53_query
	li $a0, 417
	jal p53_query
	li $a0, 36
	jal p53_query
	li $a0, 196
	jal p53_query
	li $a0, 325
	jal p53_query
	li $a0, 152
	jal p53_query
	li $a0, 2
	jal p53_query
	li $a0, 295
	sw $v0, 548($0)
	ori $4, $0, 12
	jal skip_manual7
	nop
skip_manual7:
	addu $ra, $ra, $4
	jr $ra
	ori $4, $0, 8
	addu $ra, $ra, $4
	nop
	jr $ra
	nop
dl:lui $18, 0xffff
	beq $0, $0, dl
	nop
foo:	jr $ra
	ori $ra, $ra, 0xff
fooo:	ori $6, $ra, 0xa
	jr $ra
	nop
foooo:	jr $ra
	ori $t8, $ra, 0xff
fooooo:	ori $t9, $ra, 0xa
	jr $ra
	nop
foo1:
	sw $a0, 0($sp)
	sw $ra, 16($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 480
	ori $s2, $0, 455
	lw $t0, -72($s1)
	lw $t1, -367($s2)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 50453
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 12033
	ori $a2, $a1, 0xf0
	nop
	beq $a2, $a1, skip1
	nop
	jal foo12
	addi $sp, $sp, -32
skip1:	lw $a3, 16($sp)
	addi $sp, $sp, 32
	nop
	jr $a3
	nop
foo2:
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $ra, 16($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 339
	ori $s2, $0, 318
	lw $t1, -162($s2)
	lw $t0, 133($s1)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 53693
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 23050
	ori $a2, $a1, 0xf0
	beq $a2, $a1, skip2
	nop
	jal foo6
	addi $sp, $sp, -32
skip2:	lw $a3, 16($sp)
	jr $a3
	addi $sp, $sp, 32
foo3:
	sw $ra, 16($sp)
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 475
	ori $s2, $0, 253
	lw $t0, -115($s1)
	lw $t1, 267($s2)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 25402
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 54285
	ori $a2, $a1, 0xf0
	nop
	beq $a2, $a1, skip3
	nop
	jal foo9
	addi $sp, $sp, -32
skip3:	lw $a3, 16($sp)
	addi $sp, $sp, 32
	jr $a3
	nop
foo4:
	sw $a0, 0($sp)
	sw $ra, 16($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 291
	ori $s2, $0, 526
	lw $t1, -258($s2)
	lw $t0, -59($s1)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 40681
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 26117
	ori $a2, $a1, 0xf0
	beq $a2, $a1, skip4
	nop
	jal foo10
	addi $sp, $sp, -32
skip4:	lw $a3, 16($sp)
	addi $sp, $sp, 32
	nop
	jr $a3
	nop
foo5:
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $ra, 16($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 278
	ori $s2, $0, 157
	lw $t0, 150($s1)
	lw $t1, -53($s2)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 44555
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 15881
	ori $a2, $a1, 0xf0
	nop
	beq $a2, $a1, skip5
	nop
	jal foo1
	addi $sp, $sp, -32
skip5:	lw $a3, 16($sp)
	jr $a3
	addi $sp, $sp, 32
foo6:
	sw $ra, 16($sp)
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 47
	ori $s2, $0, 354
	lw $t1, -170($s2)
	lw $t0, 405($s1)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 54990
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 53000
	ori $a2, $a1, 0xf0
	beq $a2, $a1, skip6
	nop
	jal foo14
	addi $sp, $sp, -32
skip6:	lw $a3, 16($sp)
	addi $sp, $sp, 32
	jr $a3
	nop
foo7:
	sw $a0, 0($sp)
	sw $ra, 16($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 489
	ori $s2, $0, 354
	lw $t0, -17($s1)
	lw $t1, -210($s2)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 13641
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 19719
	ori $a2, $a1, 0xf0
	nop
	beq $a2, $a1, skip7
	nop
	jal foo3
	addi $sp, $sp, -32
skip7:	lw $a3, 16($sp)
	addi $sp, $sp, 32
	nop
	jr $a3
	nop
foo8:
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $ra, 16($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 217
	ori $s2, $0, 262
	lw $t1, -150($s2)
	lw $t0, 139($s1)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 5236
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 55046
	ori $a2, $a1, 0xf0
	beq $a2, $a1, skip8
	nop
	jal foo4
	addi $sp, $sp, -32
skip8:	lw $a3, 16($sp)
	jr $a3
	addi $sp, $sp, 32
foo9:
	sw $ra, 16($sp)
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 143
	ori $s2, $0, 315
	lw $t0, 389($s1)
	lw $t1, 225($s2)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 59189
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 12296
	ori $a2, $a1, 0xf0
	nop
	beq $a2, $a1, skip9
	nop
	jal foo2
	addi $sp, $sp, -32
skip9:	lw $a3, 16($sp)
	addi $sp, $sp, 32
	jr $a3
	nop
foo10:
	sw $a0, 0($sp)
	sw $ra, 16($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 536
	ori $s2, $0, 72
	lw $t1, 104($s2)
	lw $t0, -380($s1)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 57688
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 9472
	ori $a2, $a1, 0xf0
	beq $a2, $a1, skip10
	nop
	jal foo5
	addi $sp, $sp, -32
skip10:	lw $a3, 16($sp)
	addi $sp, $sp, 32
	nop
	jr $a3
	nop
foo11:
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $ra, 16($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 199
	ori $s2, $0, 251
	lw $t0, -187($s1)
	lw $t1, 201($s2)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 12432
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 35328
	ori $a2, $a1, 0xf0
	nop
	beq $a2, $a1, skip11
	nop
	jal foo15
	addi $sp, $sp, -32
skip11:	lw $a3, 16($sp)
	jr $a3
	addi $sp, $sp, 32
foo12:
	sw $ra, 16($sp)
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 151
	ori $s2, $0, 324
	lw $t1, 224($s2)
	lw $t0, -47($s1)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 54655
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 57355
	ori $a2, $a1, 0xf0
	beq $a2, $a1, skip12
	nop
	jal foo11
	addi $sp, $sp, -32
skip12:	lw $a3, 16($sp)
	addi $sp, $sp, 32
	jr $a3
	nop
foo13:
	sw $a0, 0($sp)
	sw $ra, 16($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 114
	ori $s2, $0, 16
	lw $t0, 350($s1)
	lw $t1, 292($s2)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 7328
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 37122
	ori $a2, $a1, 0xf0
	nop
	beq $a2, $a1, skip13
	nop
	jal foo8
	addi $sp, $sp, -32
skip13:	lw $a3, 16($sp)
	addi $sp, $sp, 32
	nop
	jr $a3
	nop
foo14:
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $ra, 16($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 406
	ori $s2, $0, 176
	lw $t1, -100($s2)
	lw $t0, -150($s1)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 46951
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 54277
	ori $a2, $a1, 0xf0
	beq $a2, $a1, skip14
	nop
	jal foo13
	addi $sp, $sp, -32
skip14:	lw $a3, 16($sp)
	jr $a3
	addi $sp, $sp, 32
foo15:
	sw $ra, 16($sp)
	sw $a0, 0($sp)
	sw $a1, 4($sp)
	sw $a2, 8($sp)
	sw $a3, 12($sp)
	sw $t0, 20($sp)
	sw $t1, 24($sp)
	sw $t2, 28($sp)
	ori $s1, $0, 83
	ori $s2, $0, 319
	lw $t0, 373($s1)
	lw $t1, -67($s2)
	addu $a3, $t0, $t1
	addu $a0, $a0, $t0
	addu $a1, $a1, $t1
	addu $t2, $a0, $a1
	ori $a0, $t2, 29988
	addu $t2, $t2, $t2
	addu $t2, $t2, $t2
	ori $a1, $t2, 11274
	ori $a2, $a1, 0xf0
	nop
	beq $a2, $a1, skip15
	nop
	jal foo7
	addi $sp, $sp, -32
skip15:	lw $a3, 16($sp)
	addi $sp, $sp, 32
	jr $a3
	nop