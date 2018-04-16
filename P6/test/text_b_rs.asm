	ori $1, $0, 0x0020
	subu $4, $0, $1  
	bltz $4, bltz_loop
	ori $2, $0, 0x3018
	ori $25, $0, 0xfff0     #$25出现则说明跳转异常，通过25的赋值定位错误
bltz_loop:
	blez $4, blez_loop
	ori  $3, $0, 0x1111
	ori  $25, $0, 0xfff1
blez_loop:
    blez $0, blez_zero_loop
    subu  $5, $0, $2
    ori $25, $0, 0xfff2
 blez_zero_loop:
 	blez  $2, exit
 	subu  $6, $0, $3
    bgez  $6, exit
    ori   $7, $0, 0x0011 
    bgez  $7, bgez_loop 
    sw    $7, 0($0)
    ori   $25, $0, 0xfff3 
bgez_loop:
	lw    $8, 0($0)
	bgtz  $8, bgtz_loop
	nop
	ori   $25, $0, 0xfff4 
bgtz_loop:		
	bgtz  $0, exit
	nop
	bgez  $0, bgez_zero_loop
	nop
	ori   $25, $0, 0xfff5
bgez_zero_loop:
	lui   $9, 1
exit: