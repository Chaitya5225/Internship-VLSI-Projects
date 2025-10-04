opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F886
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_uart_init
	FNCALL	_main,_printf
	FNCALL	_main,_eeprom_write_byte
	FNCALL	_main,_eeprom_read_byte
	FNCALL	_eeprom_read_byte,_i2c_start
	FNCALL	_eeprom_read_byte,_i2c_write_byte
	FNCALL	_eeprom_read_byte,_i2c_read_byte
	FNCALL	_eeprom_read_byte,_i2c_stop
	FNCALL	_eeprom_write_byte,_i2c_start
	FNCALL	_eeprom_write_byte,_i2c_write_byte
	FNCALL	_eeprom_write_byte,_i2c_stop
	FNCALL	_i2c_read_byte,_i2c_wait
	FNCALL	_i2c_read_byte,_i2c_send_ack
	FNCALL	_i2c_write_byte,_i2c_wait
	FNCALL	_i2c_write_byte,_i2c_read_ack
	FNCALL	_i2c_send_ack,_i2c_wait
	FNCALL	_i2c_read_ack,_i2c_wait
	FNCALL	_i2c_stop,_i2c_wait
	FNCALL	_i2c_start,_i2c_wait
	FNCALL	_printf,_putch
	FNCALL	_printf,_isdigit
	FNCALL	_printf,___wmul
	FNCALL	_printf,___lwdiv
	FNCALL	_printf,___lwmod
	FNROOT	_main
	global	_dpowers
psect	stringtext,class=STRCODE,delta=2,reloc=256
global __pstringtext
__pstringtext:
;	global	stringtab,__stringbase
stringtab:
;	String table - string pointers are 2 bytes each
	btfsc	(btemp+1),7
	ljmp	stringcode
	bcf	status,7
	btfsc	(btemp+1),0
	bsf	status,7
	movf	indf,w
	incf fsr
skipnz
incf btemp+1
	return
stringcode:
	movf btemp+1,w
andlw 7Fh
movwf	pclath
	movf	fsr,w
incf fsr
skipnz
incf btemp+1
	movwf pc
__stringbase:
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\lib\doprnt.c"
	line	350
_dpowers:
	retlw	01h
	retlw	0

	retlw	0Ah
	retlw	0

	retlw	064h
	retlw	0

	retlw	0E8h
	retlw	03h

	retlw	010h
	retlw	027h

	global	_hexpowers
psect	stringtext
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\lib\doprnt.c"
	line	358
_hexpowers:
	retlw	01h
	retlw	0

	retlw	010h
	retlw	0

	retlw	0
	retlw	01h

	retlw	0
	retlw	010h

	global	_dpowers
	global	_hexpowers
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_RB3
_RB3	set	51
	global	_RB4
_RB4	set	52
	global	_SPEN
_SPEN	set	199
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_BRGH
_BRGH	set	1218
	global	_SYNC
_SYNC	set	1220
	global	_TRISB3
_TRISB3	set	1075
	global	_TRISB4
_TRISB4	set	1076
	global	_TXEN
_TXEN	set	1221
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_ANSEL
_ANSEL	set	392
	global	_ANSELH
_ANSELH	set	393
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	
STR_1:	
	retlw	13
	retlw	10
	retlw	61	;'='
	retlw	61	;'='
	retlw	32	;' '
	retlw	69	;'E'
	retlw	69	;'E'
	retlw	80	;'P'
	retlw	82	;'R'
	retlw	79	;'O'
	retlw	77	;'M'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	64	;'@'
	retlw	32	;' '
	retlw	82	;'R'
	retlw	66	;'B'
	retlw	51	;'3'
	retlw	40	;'('
	retlw	83	;'S'
	retlw	68	;'D'
	retlw	65	;'A'
	retlw	41	;')'
	retlw	44	;','
	retlw	32	;' '
	retlw	82	;'R'
	retlw	66	;'B'
	retlw	52	;'4'
	retlw	40	;'('
	retlw	83	;'S'
	retlw	67	;'C'
	retlw	76	;'L'
	retlw	41	;')'
	retlw	32	;' '
	retlw	61	;'='
	retlw	61	;'='
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_2:	
	retlw	87	;'W'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	32	;' '
	retlw	65	;'A'
	retlw	-106
	retlw	74	;'J'
	retlw	32	;' '
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	32	;' '
	retlw	48	;'0'
	retlw	120	;'x'
	retlw	48	;'0'
	retlw	48	;'0'
	retlw	48	;'0'
	retlw	48	;'0'
	retlw	-106
	retlw	48	;'0'
	retlw	120	;'x'
	retlw	48	;'0'
	retlw	48	;'0'
	retlw	48	;'0'
	retlw	57	;'9'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_12:	
	retlw	13
	retlw	10
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	67	;'C'
	retlw	111	;'o'
	retlw	109	;'m'
	retlw	112	;'p'
	retlw	108	;'l'
	retlw	101	;'e'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	46	;'.'
	retlw	32	;' '
	retlw	69	;'E'
	retlw	114	;'r'
	retlw	114	;'r'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	115	;'s'
	retlw	58	;':'
	retlw	32	;' '
	retlw	37	;'%'
	retlw	117	;'u'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_3:	
	retlw	87	;'W'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	32	;' '
	retlw	39	;'''
	retlw	37	;'%'
	retlw	99	;'c'
	retlw	39	;'''
	retlw	32	;' '
	retlw	116	;'t'
	retlw	111	;'o'
	retlw	32	;' '
	retlw	48	;'0'
	retlw	120	;'x'
	retlw	37	;'%'
	retlw	48	;'0'
	retlw	52	;'4'
	retlw	88	;'X'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	32	;' '
	retlw	0
psect	stringtext
	
STR_6:	
	retlw	13
	retlw	10
	retlw	86	;'V'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	102	;'f'
	retlw	121	;'y'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	32	;' '
	retlw	100	;'d'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	97	;'a'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_7:	
	retlw	82	;'R'
	retlw	101	;'e'
	retlw	97	;'a'
	retlw	100	;'d'
	retlw	105	;'i'
	retlw	110	;'n'
	retlw	103	;'g'
	retlw	32	;' '
	retlw	48	;'0'
	retlw	120	;'x'
	retlw	37	;'%'
	retlw	48	;'0'
	retlw	52	;'4'
	retlw	88	;'X'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	32	;' '
	retlw	0
psect	stringtext
	
STR_14:	
	retlw	48	;'0'
	retlw	49	;'1'
	retlw	50	;'2'
	retlw	51	;'3'
	retlw	52	;'4'
	retlw	53	;'5'
	retlw	54	;'6'
	retlw	55	;'7'
	retlw	56	;'8'
	retlw	57	;'9'
	retlw	65	;'A'
	retlw	66	;'B'
	retlw	67	;'C'
	retlw	68	;'D'
	retlw	69	;'E'
	retlw	70	;'F'
	retlw	0
psect	stringtext
	
STR_8:	
	retlw	71	;'G'
	retlw	111	;'o'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	39	;'''
	retlw	37	;'%'
	retlw	99	;'c'
	retlw	39	;'''
	retlw	32	;' '
	retlw	-106
	retlw	32	;' '
	retlw	37	;'%'
	retlw	115	;'s'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_11:	
	retlw	82	;'R'
	retlw	101	;'e'
	retlw	97	;'a'
	retlw	100	;'d'
	retlw	32	;' '
	retlw	70	;'F'
	retlw	97	;'a'
	retlw	105	;'i'
	retlw	108	;'l'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_10:	
	retlw	77	;'M'
	retlw	105	;'i'
	retlw	115	;'s'
	retlw	109	;'m'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	99	;'c'
	retlw	104	;'h'
	retlw	33	;'!'
	retlw	0
psect	stringtext
	
STR_13:	
	retlw	40	;'('
	retlw	110	;'n'
	retlw	117	;'u'
	retlw	108	;'l'
	retlw	108	;'l'
	retlw	41	;')'
	retlw	0
psect	stringtext
	
STR_5:	
	retlw	70	;'F'
	retlw	65	;'A'
	retlw	73	;'I'
	retlw	76	;'L'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	
STR_9:	
	retlw	77	;'M'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	99	;'c'
	retlw	104	;'h'
	retlw	0
psect	stringtext
	
STR_4:	
	retlw	79	;'O'
	retlw	75	;'K'
	retlw	13
	retlw	10
	retlw	0
psect	stringtext
	file	"uart_check.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_isdigit
?_isdigit:	; 1 bit 
	global	??_isdigit
??_isdigit:	; 0 bytes @ 0x0
	global	?_uart_init
?_uart_init:	; 0 bytes @ 0x0
	global	??_uart_init
??_uart_init:	; 0 bytes @ 0x0
	global	?_putch
?_putch:	; 0 bytes @ 0x0
	global	??_putch
??_putch:	; 0 bytes @ 0x0
	global	?_i2c_wait
?_i2c_wait:	; 0 bytes @ 0x0
	global	??_i2c_wait
??_i2c_wait:	; 0 bytes @ 0x0
	global	?_i2c_start
?_i2c_start:	; 0 bytes @ 0x0
	global	??_i2c_start
??_i2c_start:	; 0 bytes @ 0x0
	global	?_i2c_stop
?_i2c_stop:	; 0 bytes @ 0x0
	global	??_i2c_stop
??_i2c_stop:	; 0 bytes @ 0x0
	global	??_i2c_read_ack
??_i2c_read_ack:	; 0 bytes @ 0x0
	global	?_i2c_send_ack
?_i2c_send_ack:	; 0 bytes @ 0x0
	global	??_i2c_send_ack
??_i2c_send_ack:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_i2c_read_ack
?_i2c_read_ack:	; 1 bytes @ 0x0
	global	?_i2c_write_byte
?_i2c_write_byte:	; 1 bytes @ 0x0
	global	?_i2c_read_byte
?_i2c_read_byte:	; 1 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	putch@c
putch@c:	; 1 bytes @ 0x0
	global	i2c_send_ack@ack
i2c_send_ack@ack:	; 1 bytes @ 0x0
	global	_isdigit$2270
_isdigit$2270:	; 1 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	ds	1
	global	??_i2c_read_byte
??_i2c_read_byte:	; 0 bytes @ 0x1
	global	i2c_read_ack@ack
i2c_read_ack@ack:	; 1 bytes @ 0x1
	global	isdigit@c
isdigit@c:	; 1 bytes @ 0x1
	ds	1
	global	??_i2c_write_byte
??_i2c_write_byte:	; 0 bytes @ 0x2
	global	i2c_read_byte@ack
i2c_read_byte@ack:	; 1 bytes @ 0x2
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	i2c_write_byte@data
i2c_write_byte@data:	; 1 bytes @ 0x3
	global	i2c_read_byte@data
i2c_read_byte@data:	; 1 bytes @ 0x3
	ds	1
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	i2c_write_byte@i
i2c_write_byte@i:	; 1 bytes @ 0x4
	global	i2c_read_byte@i
i2c_read_byte@i:	; 1 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	ds	1
	global	?_eeprom_write_byte
?_eeprom_write_byte:	; 1 bytes @ 0x5
	global	?_eeprom_read_byte
?_eeprom_read_byte:	; 1 bytes @ 0x5
	global	eeprom_write_byte@addr
eeprom_write_byte@addr:	; 2 bytes @ 0x5
	global	eeprom_read_byte@addr
eeprom_read_byte@addr:	; 2 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	2
	global	eeprom_write_byte@data
eeprom_write_byte@data:	; 1 bytes @ 0x7
	global	eeprom_read_byte@data
eeprom_read_byte@data:	; 1 bytes @ 0x7
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	ds	1
	global	??_eeprom_write_byte
??_eeprom_write_byte:	; 0 bytes @ 0x8
	global	??_eeprom_read_byte
??_eeprom_read_byte:	; 0 bytes @ 0x8
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x8
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x8
	ds	2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0xA
	ds	2
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0xC
	ds	1
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_printf
?_printf:	; 2 bytes @ 0x0
	global	printf@f
printf@f:	; 2 bytes @ 0x0
	ds	6
	global	??_printf
??_printf:	; 0 bytes @ 0x6
	ds	3
	global	printf@prec
printf@prec:	; 1 bytes @ 0x9
	ds	1
	global	printf@ap
printf@ap:	; 1 bytes @ 0xA
	ds	1
	global	printf@flag
printf@flag:	; 1 bytes @ 0xB
	ds	1
	global	printf@width
printf@width:	; 2 bytes @ 0xC
	ds	2
	global	printf@c
printf@c:	; 1 bytes @ 0xE
	ds	1
	global	printf@_val
printf@_val:	; 4 bytes @ 0xF
	ds	4
	global	??_main
??_main:	; 0 bytes @ 0x13
	ds	2
	global	_main$1747
_main$1747:	; 2 bytes @ 0x15
	ds	2
	global	main@err
main@err:	; 1 bytes @ 0x17
	ds	1
	global	main@addr
main@addr:	; 2 bytes @ 0x18
	ds	2
	global	main@addr_1741
main@addr_1741:	; 2 bytes @ 0x1A
	ds	2
	global	main@val
main@val:	; 1 bytes @ 0x1C
	ds	1
	global	main@expected
main@expected:	; 1 bytes @ 0x1D
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x1E
	ds	1
	global	main@i_1739
main@i_1739:	; 1 bytes @ 0x1F
	ds	1
	global	main@val_1740
main@val_1740:	; 1 bytes @ 0x20
	ds	1
;;Data sizes: Strings 255, constant 18, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     33      33
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(2) Largest target is 10
;;		 -> STR_10(CODE[10]), STR_9(CODE[6]), 
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; printf@_val._cp	PTR const unsigned char  size(2) Largest target is 10
;;		 -> STR_13(CODE[7]), printf@c(BANK0[1]), STR_10(CODE[10]), STR_9(CODE[6]), 
;;
;; printf@f	PTR const unsigned char  size(2) Largest target is 43
;;		 -> STR_12(CODE[30]), STR_11(CODE[12]), STR_8(CODE[16]), STR_7(CODE[19]), 
;;		 -> STR_6(CODE[22]), STR_5(CODE[7]), STR_4(CODE[5]), STR_3(CODE[27]), 
;;		 -> STR_2(CODE[34]), STR_1(CODE[43]), 
;;
;; ?_printf	int  size(2) Largest target is 10
;;		 -> STR_10(CODE[10]), STR_9(CODE[6]), 
;;
;; printf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_printf(BANK0[2]), 
;;
;; S1774$_cp	PTR const unsigned char  size(2) Largest target is 10
;;		 -> STR_13(CODE[7]), printf@c(BANK0[1]), STR_10(CODE[10]), STR_9(CODE[6]), 
;;
;; _val._str._cp	PTR const unsigned char  size(2) Largest target is 10
;;		 -> STR_13(CODE[7]), printf@c(BANK0[1]), STR_10(CODE[10]), STR_9(CODE[6]), 
;;
;; main$1747	PTR const unsigned char  size(2) Largest target is 10
;;		 -> STR_10(CODE[10]), STR_9(CODE[6]), 
;;
;; eeprom_read_byte@data	PTR unsigned char  size(1) Largest target is 1
;;		 -> main@val_1740(BANK0[1]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _eeprom_read_byte->_i2c_write_byte
;;   _eeprom_read_byte->_i2c_read_byte
;;   _eeprom_write_byte->_i2c_write_byte
;;   _i2c_read_byte->_i2c_send_ack
;;   _i2c_write_byte->_i2c_read_ack
;;   _printf->___lwmod
;;   ___lwmod->___lwdiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_printf
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                14    14      0    2578
;;                                             19 BANK0     14    14      0
;;                          _uart_init
;;                             _printf
;;                  _eeprom_write_byte
;;                   _eeprom_read_byte
;; ---------------------------------------------------------------------------------
;; (1) _eeprom_read_byte                                     4     1      3     273
;;                                              5 COMMON     4     1      3
;;                          _i2c_start
;;                     _i2c_write_byte
;;                      _i2c_read_byte
;;                           _i2c_stop
;; ---------------------------------------------------------------------------------
;; (1) _eeprom_write_byte                                    5     2      3     158
;;                                              5 COMMON     5     2      3
;;                          _i2c_start
;;                     _i2c_write_byte
;;                           _i2c_stop
;; ---------------------------------------------------------------------------------
;; (2) _i2c_read_byte                                        4     4      0     115
;;                                              1 COMMON     4     4      0
;;                           _i2c_wait
;;                       _i2c_send_ack
;; ---------------------------------------------------------------------------------
;; (2) _i2c_write_byte                                       3     3      0      92
;;                                              2 COMMON     3     3      0
;;                           _i2c_wait
;;                       _i2c_read_ack
;; ---------------------------------------------------------------------------------
;; (3) _i2c_send_ack                                         1     1      0      22
;;                                              0 COMMON     1     1      0
;;                           _i2c_wait
;; ---------------------------------------------------------------------------------
;; (3) _i2c_read_ack                                         2     2      0      23
;;                                              0 COMMON     2     2      0
;;                           _i2c_wait
;; ---------------------------------------------------------------------------------
;; (2) _i2c_stop                                             0     0      0       0
;;                           _i2c_wait
;; ---------------------------------------------------------------------------------
;; (2) _i2c_start                                            0     0      0       0
;;                           _i2c_wait
;; ---------------------------------------------------------------------------------
;; (1) _printf                                              19    13      6    1648
;;                                              0 BANK0     19    13      6
;;                              _putch
;;                            _isdigit
;;                             ___wmul
;;                            ___lwdiv
;;                            ___lwmod
;; ---------------------------------------------------------------------------------
;; (3) _i2c_wait                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) ___lwmod                                              6     2      4     159
;;                                              8 COMMON     6     2      4
;;                            ___lwdiv (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (2) ___wmul                                               6     2      4      92
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (2) _isdigit                                              2     2      0      68
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; (2) _putch                                                1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _uart_init                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _uart_init
;;   _printf
;;     _putch
;;     _isdigit
;;     ___wmul
;;     ___lwdiv
;;     ___lwmod
;;       ___lwdiv (ARG)
;;   _eeprom_write_byte
;;     _i2c_start
;;       _i2c_wait
;;     _i2c_write_byte
;;       _i2c_wait
;;       _i2c_read_ack
;;         _i2c_wait
;;     _i2c_stop
;;       _i2c_wait
;;   _eeprom_read_byte
;;     _i2c_start
;;       _i2c_wait
;;     _i2c_write_byte
;;       _i2c_wait
;;       _i2c_read_ack
;;         _i2c_wait
;;     _i2c_read_byte
;;       _i2c_wait
;;       _i2c_send_ack
;;         _i2c_wait
;;     _i2c_stop
;;       _i2c_wait
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       4       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     21      21       5       41.3%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 145 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  addr            2   26[BANK0 ] unsigned int 
;;  val             1   32[BANK0 ] unsigned char 
;;  expected        1   29[BANK0 ] unsigned char 
;;  addr            2   24[BANK0 ] unsigned int 
;;  val             1   28[BANK0 ] unsigned char 
;;  i               1   31[BANK0 ] unsigned char 
;;  i               1   30[BANK0 ] unsigned char 
;;  err             1   23[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      12       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0      14       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_uart_init
;;		_printf
;;		_eeprom_write_byte
;;		_eeprom_read_byte
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	145
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	146
	
l4132:	
;uart_check.c: 146: ANSEL = 0x00;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(392)^0180h	;volatile
	line	147
;uart_check.c: 147: ANSELH = 0x00;
	clrf	(393)^0180h	;volatile
	line	148
	
l4134:	
;uart_check.c: 148: TRISB3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1075/8)^080h,(1075)&7
	line	149
	
l4136:	
;uart_check.c: 149: TRISB4 = 0;
	bcf	(1076/8)^080h,(1076)&7
	line	150
	
l4138:	
;uart_check.c: 150: uart_init();
	fcall	_uart_init
	line	152
	
l4140:	
;uart_check.c: 152: printf("\r\n== EEPROM Test @ RB3(SDA), RB4(SCL) ==\r\n");
	movlw	low(STR_1|8000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_printf)
	movlw	high(STR_1|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	line	155
	
l4142:	
;uart_check.c: 155: printf("Writing A–J to 0x0000–0x0009...\r\n");
	movlw	low(STR_2|8000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_printf)
	movlw	high(STR_2|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	line	156
	
l4144:	
;uart_check.c: 156: for (char i = 0; i < 10; i++) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@i)
	
l4146:	
	movlw	(0Ah)
	subwf	(main@i),w
	skipc
	goto	u3311
	goto	u3310
u3311:
	goto	l4150
u3310:
	goto	l4166
	
l4148:	
	goto	l4166
	
l1022:	
	line	157
	
l4150:	
;uart_check.c: 157: unsigned int addr = i;
	movf	(main@i),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(main@addr)
	movf	1+(??_main+0)+0,w
	movwf	(main@addr+1)
	line	158
	
l4152:	
;uart_check.c: 158: char val = 'A' + i;
	movf	(main@i),w
	addlw	041h
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@val)
	line	159
	
l4154:	
;uart_check.c: 159: printf("Writing '%c' to 0x%04X... ", val, addr);
	movlw	low(STR_3|8000h)
	movwf	(?_printf)
	movlw	high(STR_3|8000h)
	movwf	((?_printf))+1
	movf	(main@val),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?_printf)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?_printf)+02h
	movf	(main@addr+1),w
	clrf	1+(?_printf)+04h
	addwf	1+(?_printf)+04h
	movf	(main@addr),w
	clrf	0+(?_printf)+04h
	addwf	0+(?_printf)+04h

	fcall	_printf
	line	160
	
l4156:	
;uart_check.c: 160: if (eeprom_write_byte(addr, val) == 0)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@addr+1),w
	clrf	(?_eeprom_write_byte+1)
	addwf	(?_eeprom_write_byte+1)
	movf	(main@addr),w
	clrf	(?_eeprom_write_byte)
	addwf	(?_eeprom_write_byte)

	movf	(main@val),w
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_eeprom_write_byte)+02h
	fcall	_eeprom_write_byte
	iorlw	0
	skipz
	goto	u3321
	goto	u3320
u3321:
	goto	l4160
u3320:
	line	161
	
l4158:	
;uart_check.c: 161: printf("OK\r\n");
	movlw	low(STR_4|8000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_printf)
	movlw	high(STR_4|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	goto	l4162
	line	162
	
l1024:	
	line	163
	
l4160:	
;uart_check.c: 162: else
;uart_check.c: 163: printf("FAIL\r\n");
	movlw	low(STR_5|8000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_printf)
	movlw	high(STR_5|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	goto	l4162
	
l1025:	
	line	156
	
l4162:	
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l4164:	
	movlw	(0Ah)
	subwf	(main@i),w
	skipc
	goto	u3331
	goto	u3330
u3331:
	goto	l4150
u3330:
	goto	l4166
	
l1023:	
	line	167
	
l4166:	
;uart_check.c: 164: }
;uart_check.c: 167: printf("\r\nVerifying data...\r\n");
	movlw	low(STR_6|8000h)
	movwf	(?_printf)
	movlw	high(STR_6|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	line	168
	
l4168:	
;uart_check.c: 168: unsigned char err = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@err)
	line	169
	
l4170:	
;uart_check.c: 169: for (char i = 0; i < 10; i++) {
	clrf	(main@i_1739)
	
l4172:	
	movlw	(0Ah)
	subwf	(main@i_1739),w
	skipc
	goto	u3341
	goto	u3340
u3341:
	goto	l4176
u3340:
	goto	l4204
	
l4174:	
	goto	l4204
	
l1026:	
	line	171
	
l4176:	
;uart_check.c: 170: unsigned char val;
;uart_check.c: 171: unsigned int addr = i;
	movf	(main@i_1739),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	(main@addr_1741)
	movf	1+(??_main+0)+0,w
	movwf	(main@addr_1741+1)
	line	172
	
l4178:	
;uart_check.c: 172: char expected = 'A' + i;
	movf	(main@i_1739),w
	addlw	041h
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@expected)
	line	173
	
l4180:	
;uart_check.c: 173: printf("Reading 0x%04X... ", addr);
	movlw	low(STR_7|8000h)
	movwf	(?_printf)
	movlw	high(STR_7|8000h)
	movwf	((?_printf))+1
	movf	(main@addr_1741+1),w
	clrf	1+(?_printf)+02h
	addwf	1+(?_printf)+02h
	movf	(main@addr_1741),w
	clrf	0+(?_printf)+02h
	addwf	0+(?_printf)+02h

	fcall	_printf
	line	174
	
l4182:	
;uart_check.c: 174: if (eeprom_read_byte(addr, &val) == 0) {
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@addr_1741+1),w
	clrf	(?_eeprom_read_byte+1)
	addwf	(?_eeprom_read_byte+1)
	movf	(main@addr_1741),w
	clrf	(?_eeprom_read_byte)
	addwf	(?_eeprom_read_byte)

	movlw	(main@val_1740)&0ffh
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	0+(?_eeprom_read_byte)+02h
	fcall	_eeprom_read_byte
	iorlw	0
	skipz
	goto	u3351
	goto	u3350
u3351:
	goto	l4196
u3350:
	line	175
	
l4184:	
;uart_check.c: 175: printf("Got '%c' – %s\r\n", val, (val == expected) ? "Match" : "Mismatch!");
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@val_1740),w
	xorwf	(main@expected),w
	skipnz
	goto	u3361
	goto	u3360
u3361:
	goto	l4188
u3360:
	
l4186:	
	movlw	low(STR_10|8000h)
	movwf	(_main$1747)
	movlw	high(STR_10|8000h)
	movwf	((_main$1747))+1
	goto	l4190
	
l1030:	
	
l4188:	
	movlw	low(STR_9|8000h)
	movwf	(_main$1747)
	movlw	high(STR_9|8000h)
	movwf	((_main$1747))+1
	goto	l4190
	
l1032:	
	
l4190:	
	movlw	low(STR_8|8000h)
	movwf	(?_printf)
	movlw	high(STR_8|8000h)
	movwf	((?_printf))+1
	movf	(main@val_1740),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?_printf)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?_printf)+02h
	movf	(_main$1747+1),w
	clrf	(1+?_printf+04h)
	addwf	(1+?_printf+04h)
	movf	(_main$1747),w
	clrf	(0+?_printf+04h)
	addwf	(0+?_printf+04h)

	fcall	_printf
	line	176
	
l4192:	
;uart_check.c: 176: if (val != expected) err++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@val_1740),w
	xorwf	(main@expected),w
	skipnz
	goto	u3371
	goto	u3370
u3371:
	goto	l4200
u3370:
	
l4194:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@err),f
	goto	l4200
	
l1033:	
	line	177
;uart_check.c: 177: } else {
	goto	l4200
	
l1028:	
	line	178
	
l4196:	
;uart_check.c: 178: printf("Read Fail\r\n");
	movlw	low(STR_11|8000h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_printf)
	movlw	high(STR_11|8000h)
	movwf	((?_printf))+1
	fcall	_printf
	line	179
	
l4198:	
;uart_check.c: 179: err++;
	movlw	(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@err),f
	goto	l4200
	line	180
	
l1034:	
	line	169
	
l4200:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i_1739),f
	
l4202:	
	movlw	(0Ah)
	subwf	(main@i_1739),w
	skipc
	goto	u3381
	goto	u3380
u3381:
	goto	l4176
u3380:
	goto	l4204
	
l1027:	
	line	184
	
l4204:	
;uart_check.c: 180: }
;uart_check.c: 181: }
;uart_check.c: 184: printf("\r\nTest Complete. Errors: %u\r\n", err);
	movlw	low(STR_12|8000h)
	movwf	(?_printf)
	movlw	high(STR_12|8000h)
	movwf	((?_printf))+1
	movf	(main@err),w
	movwf	(??_main+0)+0
	clrf	(??_main+0)+0+1
	movf	0+(??_main+0)+0,w
	movwf	0+(?_printf)+02h
	movf	1+(??_main+0)+0,w
	movwf	1+(?_printf)+02h
	fcall	_printf
	goto	l1036
	line	186
;uart_check.c: 186: while(1);
	
l1035:	
	
l1036:	
	goto	l1036
	
l1037:	
	line	187
	
l1038:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_eeprom_read_byte
psect	text386,local,class=CODE,delta=2
global __ptext386
__ptext386:

;; *************** function _eeprom_read_byte *****************
;; Defined at:
;;		line 124 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;  addr            2    5[COMMON] unsigned int 
;;  data            1    7[COMMON] PTR unsigned char 
;;		 -> main@val_1740(1), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_i2c_start
;;		_i2c_write_byte
;;		_i2c_read_byte
;;		_i2c_stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text386
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	124
	global	__size_of_eeprom_read_byte
	__size_of_eeprom_read_byte	equ	__end_of_eeprom_read_byte-_eeprom_read_byte
	
_eeprom_read_byte:	
	opt	stack 4
; Regs used in _eeprom_read_byte: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	125
	
l4098:	
;uart_check.c: 125: i2c_start();
	fcall	_i2c_start
	line	126
	
l4100:	
;uart_check.c: 126: if (i2c_write_byte(0xA0 | 0x00)) goto fail;
	movlw	(0A0h)
	fcall	_i2c_write_byte
	xorlw	0
	skipnz
	goto	u3271
	goto	u3270
u3271:
	goto	l4104
u3270:
	goto	l4126
	
l4102:	
	goto	l4126
	
l1014:	
	line	127
	
l4104:	
;uart_check.c: 127: if (i2c_write_byte((addr >> 8) & 0xFF)) goto fail;
	movf	(eeprom_read_byte@addr+1),w
	fcall	_i2c_write_byte
	xorlw	0
	skipnz
	goto	u3281
	goto	u3280
u3281:
	goto	l4108
u3280:
	goto	l4126
	
l4106:	
	goto	l4126
	
l1016:	
	line	128
	
l4108:	
;uart_check.c: 128: if (i2c_write_byte(addr & 0xFF)) goto fail;
	movf	(eeprom_read_byte@addr),w
	fcall	_i2c_write_byte
	xorlw	0
	skipnz
	goto	u3291
	goto	u3290
u3291:
	goto	l4112
u3290:
	goto	l4126
	
l4110:	
	goto	l4126
	
l1017:	
	line	130
	
l4112:	
;uart_check.c: 130: i2c_start();
	fcall	_i2c_start
	line	131
	
l4114:	
;uart_check.c: 131: if (i2c_write_byte(0xA0 | 0x01)) goto fail;
	movlw	(0A1h)
	fcall	_i2c_write_byte
	xorlw	0
	skipnz
	goto	u3301
	goto	u3300
u3301:
	goto	l4118
u3300:
	goto	l4126
	
l4116:	
	goto	l4126
	
l1018:	
	line	133
	
l4118:	
;uart_check.c: 133: *data = i2c_read_byte(1);
	movlw	(01h)
	fcall	_i2c_read_byte
	movwf	(??_eeprom_read_byte+0)+0
	movf	(eeprom_read_byte@data),w
	movwf	fsr0
	movf	(??_eeprom_read_byte+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	line	134
	
l4120:	
;uart_check.c: 134: i2c_stop();
	fcall	_i2c_stop
	line	135
	
l4122:	
;uart_check.c: 135: return 0;
	movlw	(0)
	goto	l1019
	
l4124:	
	goto	l1019
	line	136
;uart_check.c: 136: fail:
	
l1015:	
	line	137
	
l4126:	
;uart_check.c: 137: i2c_stop();
	fcall	_i2c_stop
	line	138
	
l4128:	
;uart_check.c: 138: return 1;
	movlw	(01h)
	goto	l1019
	
l4130:	
	line	139
	
l1019:	
	return
	opt stack 0
GLOBAL	__end_of_eeprom_read_byte
	__end_of_eeprom_read_byte:
;; =============== function _eeprom_read_byte ends ============

	signat	_eeprom_read_byte,8313
	global	_eeprom_write_byte
psect	text387,local,class=CODE,delta=2
global __ptext387
__ptext387:

;; *************** function _eeprom_write_byte *****************
;; Defined at:
;;		line 110 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;  addr            2    5[COMMON] unsigned int 
;;  data            1    7[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_i2c_start
;;		_i2c_write_byte
;;		_i2c_stop
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text387
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	110
	global	__size_of_eeprom_write_byte
	__size_of_eeprom_write_byte	equ	__end_of_eeprom_write_byte-_eeprom_write_byte
	
_eeprom_write_byte:	
	opt	stack 4
; Regs used in _eeprom_write_byte: [wreg+status,2+status,0+pclath+cstack]
	line	111
	
l4066:	
;uart_check.c: 111: i2c_start();
	fcall	_i2c_start
	line	112
	
l4068:	
;uart_check.c: 112: if (i2c_write_byte(0xA0 | 0x00)) goto fail;
	movlw	(0A0h)
	fcall	_i2c_write_byte
	xorlw	0
	skipnz
	goto	u3231
	goto	u3230
u3231:
	goto	l4072
u3230:
	goto	l4092
	
l4070:	
	goto	l4092
	
l1006:	
	line	113
	
l4072:	
;uart_check.c: 113: if (i2c_write_byte((addr >> 8) & 0xFF)) goto fail;
	movf	(eeprom_write_byte@addr+1),w
	fcall	_i2c_write_byte
	xorlw	0
	skipnz
	goto	u3241
	goto	u3240
u3241:
	goto	l4076
u3240:
	goto	l4092
	
l4074:	
	goto	l4092
	
l1008:	
	line	114
	
l4076:	
;uart_check.c: 114: if (i2c_write_byte(addr & 0xFF)) goto fail;
	movf	(eeprom_write_byte@addr),w
	fcall	_i2c_write_byte
	xorlw	0
	skipnz
	goto	u3251
	goto	u3250
u3251:
	goto	l4080
u3250:
	goto	l4092
	
l4078:	
	goto	l4092
	
l1009:	
	line	115
	
l4080:	
;uart_check.c: 115: if (i2c_write_byte(data)) goto fail;
	movf	(eeprom_write_byte@data),w
	fcall	_i2c_write_byte
	xorlw	0
	skipnz
	goto	u3261
	goto	u3260
u3261:
	goto	l4084
u3260:
	goto	l4092
	
l4082:	
	goto	l4092
	
l1010:	
	line	116
	
l4084:	
;uart_check.c: 116: i2c_stop();
	fcall	_i2c_stop
	line	117
	
l4086:	
;uart_check.c: 117: _delay((unsigned long)((5)*(3570000/4000.0)));
	opt asmopt_off
movlw	6
movwf	((??_eeprom_write_byte+0)+0+1),f
	movlw	202
movwf	((??_eeprom_write_byte+0)+0),f
u3397:
	decfsz	((??_eeprom_write_byte+0)+0),f
	goto	u3397
	decfsz	((??_eeprom_write_byte+0)+0+1),f
	goto	u3397
	clrwdt
opt asmopt_on

	line	118
	
l4088:	
;uart_check.c: 118: return 0;
	movlw	(0)
	goto	l1011
	
l4090:	
	goto	l1011
	line	119
;uart_check.c: 119: fail:
	
l1007:	
	line	120
	
l4092:	
;uart_check.c: 120: i2c_stop();
	fcall	_i2c_stop
	line	121
	
l4094:	
;uart_check.c: 121: return 1;
	movlw	(01h)
	goto	l1011
	
l4096:	
	line	122
	
l1011:	
	return
	opt stack 0
GLOBAL	__end_of_eeprom_write_byte
	__end_of_eeprom_write_byte:
;; =============== function _eeprom_write_byte ends ============

	signat	_eeprom_write_byte,8313
	global	_i2c_read_byte
psect	text388,local,class=CODE,delta=2
global __ptext388
__ptext388:

;; *************** function _i2c_read_byte *****************
;; Defined at:
;;		line 93 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;  ack             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ack             1    2[COMMON] unsigned char 
;;  i               1    4[COMMON] unsigned char 
;;  data            1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_i2c_wait
;;		_i2c_send_ack
;; This function is called by:
;;		_eeprom_read_byte
;; This function uses a non-reentrant model
;;
psect	text388
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	93
	global	__size_of_i2c_read_byte
	__size_of_i2c_read_byte	equ	__end_of_i2c_read_byte-_i2c_read_byte
	
_i2c_read_byte:	
	opt	stack 4
; Regs used in _i2c_read_byte: [wreg+status,2+status,0+pclath+cstack]
;i2c_read_byte@ack stored from wreg
	movwf	(i2c_read_byte@ack)
	line	94
	
l4038:	
;uart_check.c: 94: unsigned char data = 0;
	clrf	(i2c_read_byte@data)
	line	95
;uart_check.c: 95: { TRISB3 = 1; };
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	96
;uart_check.c: 96: for (char i = 0; i < 8; i++) {
	clrf	(i2c_read_byte@i)
	
l4040:	
	movlw	(08h)
	subwf	(i2c_read_byte@i),w
	skipc
	goto	u3201
	goto	u3200
u3201:
	goto	l4044
u3200:
	goto	l4060
	
l4042:	
	goto	l4060
	
l1000:	
	line	97
	
l4044:	
;uart_check.c: 97: data <<= 1;
	clrc
	rlf	(i2c_read_byte@data),f

	line	98
	
l4046:	
;uart_check.c: 98: { RB4 = 1; i2c_wait(); };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	
l4048:	
	fcall	_i2c_wait
	line	99
	
l4050:	
;uart_check.c: 99: if ((RB3)) data |= 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(51/8),(51)&7
	goto	u3211
	goto	u3210
u3211:
	goto	l1002
u3210:
	
l4052:	
	bsf	(i2c_read_byte@data)+(0/8),(0)&7
	
l1002:	
	line	100
;uart_check.c: 100: { RB4 = 0; i2c_wait(); };
	bcf	(52/8),(52)&7
	
l4054:	
	fcall	_i2c_wait
	line	96
	
l4056:	
	movlw	(01h)
	movwf	(??_i2c_read_byte+0)+0
	movf	(??_i2c_read_byte+0)+0,w
	addwf	(i2c_read_byte@i),f
	
l4058:	
	movlw	(08h)
	subwf	(i2c_read_byte@i),w
	skipc
	goto	u3221
	goto	u3220
u3221:
	goto	l4044
u3220:
	goto	l4060
	
l1001:	
	line	102
	
l4060:	
;uart_check.c: 101: }
;uart_check.c: 102: i2c_send_ack(ack);
	movf	(i2c_read_byte@ack),w
	fcall	_i2c_send_ack
	line	103
	
l4062:	
;uart_check.c: 103: return data;
	movf	(i2c_read_byte@data),w
	goto	l1003
	
l4064:	
	line	104
	
l1003:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_read_byte
	__end_of_i2c_read_byte:
;; =============== function _i2c_read_byte ends ============

	signat	_i2c_read_byte,4217
	global	_i2c_write_byte
psect	text389,local,class=CODE,delta=2
global __ptext389
__ptext389:

;; *************** function _i2c_write_byte *****************
;; Defined at:
;;		line 83 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    3[COMMON] unsigned char 
;;  i               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_i2c_wait
;;		_i2c_read_ack
;; This function is called by:
;;		_eeprom_write_byte
;;		_eeprom_read_byte
;; This function uses a non-reentrant model
;;
psect	text389
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	83
	global	__size_of_i2c_write_byte
	__size_of_i2c_write_byte	equ	__end_of_i2c_write_byte-_i2c_write_byte
	
_i2c_write_byte:	
	opt	stack 4
; Regs used in _i2c_write_byte: [wreg+status,2+status,0+pclath+cstack]
;i2c_write_byte@data stored from wreg
	movwf	(i2c_write_byte@data)
	line	84
	
l4018:	
;uart_check.c: 84: for (char i = 0; i < 8; i++) {
	clrf	(i2c_write_byte@i)
	
l4020:	
	movlw	(08h)
	subwf	(i2c_write_byte@i),w
	skipc
	goto	u3161
	goto	u3160
u3161:
	goto	l995
u3160:
	goto	l4034
	
l4022:	
	goto	l4034
	
l995:	
	line	85
;uart_check.c: 85: { TRISB3 = 0; RB3 = (data & 0x80) ? 1 : 0; };
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1075/8)^080h,(1075)&7
	btfsc	(i2c_write_byte@data),(7)&7
	goto	u3171
	goto	u3170
	
u3171:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(51/8),(51)&7
	goto	u3184
u3170:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(51/8),(51)&7
u3184:
	line	86
;uart_check.c: 86: { RB4 = 1; i2c_wait(); };
	bsf	(52/8),(52)&7
	
l4024:	
	fcall	_i2c_wait
	line	87
	
l4026:	
;uart_check.c: 87: { RB4 = 0; i2c_wait(); };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	fcall	_i2c_wait
	line	88
	
l4028:	
;uart_check.c: 88: data <<= 1;
	clrc
	rlf	(i2c_write_byte@data),f

	line	84
	
l4030:	
	movlw	(01h)
	movwf	(??_i2c_write_byte+0)+0
	movf	(??_i2c_write_byte+0)+0,w
	addwf	(i2c_write_byte@i),f
	
l4032:	
	movlw	(08h)
	subwf	(i2c_write_byte@i),w
	skipc
	goto	u3191
	goto	u3190
u3191:
	goto	l995
u3190:
	goto	l4034
	
l996:	
	line	90
	
l4034:	
;uart_check.c: 89: }
;uart_check.c: 90: return i2c_read_ack();
	fcall	_i2c_read_ack
	goto	l997
	
l4036:	
	line	91
	
l997:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_write_byte
	__end_of_i2c_write_byte:
;; =============== function _i2c_write_byte ends ============

	signat	_i2c_write_byte,4217
	global	_i2c_send_ack
psect	text390,local,class=CODE,delta=2
global __ptext390
__ptext390:

;; *************** function _i2c_send_ack *****************
;; Defined at:
;;		line 77 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;  ack             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ack             1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_i2c_wait
;; This function is called by:
;;		_i2c_read_byte
;; This function uses a non-reentrant model
;;
psect	text390
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	77
	global	__size_of_i2c_send_ack
	__size_of_i2c_send_ack	equ	__end_of_i2c_send_ack-_i2c_send_ack
	
_i2c_send_ack:	
	opt	stack 4
; Regs used in _i2c_send_ack: [wreg+status,2+status,0+pclath+cstack]
;i2c_send_ack@ack stored from wreg
	movwf	(i2c_send_ack@ack)
	line	78
	
l4012:	
;uart_check.c: 78: { TRISB3 = 0; RB3 = ack; };
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1075/8)^080h,(1075)&7
	btfsc	(i2c_send_ack@ack),0
	goto	u3141
	goto	u3140
	
u3141:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(51/8),(51)&7
	goto	u3154
u3140:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(51/8),(51)&7
u3154:
	line	79
;uart_check.c: 79: { RB4 = 1; i2c_wait(); };
	bsf	(52/8),(52)&7
	
l4014:	
	fcall	_i2c_wait
	line	80
	
l4016:	
;uart_check.c: 80: { RB4 = 0; i2c_wait(); };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	fcall	_i2c_wait
	line	81
	
l992:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_send_ack
	__end_of_i2c_send_ack:
;; =============== function _i2c_send_ack ends ============

	signat	_i2c_send_ack,4216
	global	_i2c_read_ack
psect	text391,local,class=CODE,delta=2
global __ptext391
__ptext391:

;; *************** function _i2c_read_ack *****************
;; Defined at:
;;		line 68 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ack             1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_i2c_wait
;; This function is called by:
;;		_i2c_write_byte
;; This function uses a non-reentrant model
;;
psect	text391
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	68
	global	__size_of_i2c_read_ack
	__size_of_i2c_read_ack	equ	__end_of_i2c_read_ack-_i2c_read_ack
	
_i2c_read_ack:	
	opt	stack 4
; Regs used in _i2c_read_ack: [wreg+status,2+status,0+pclath+cstack]
	line	70
	
l4000:	
;uart_check.c: 69: unsigned char ack;
;uart_check.c: 70: { TRISB3 = 1; };
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	71
;uart_check.c: 71: { RB4 = 1; i2c_wait(); };
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	
l4002:	
	fcall	_i2c_wait
	line	72
	
l4004:	
;uart_check.c: 72: ack = (RB3);
	movlw	0
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfsc	(51/8),(51)&7
	movlw	1
	movwf	(??_i2c_read_ack+0)+0
	movf	(??_i2c_read_ack+0)+0,w
	movwf	(i2c_read_ack@ack)
	line	73
	
l4006:	
;uart_check.c: 73: { RB4 = 0; i2c_wait(); };
	bcf	(52/8),(52)&7
	
l4008:	
	fcall	_i2c_wait
	line	74
;uart_check.c: 74: return ack;
	movf	(i2c_read_ack@ack),w
	goto	l989
	
l4010:	
	line	75
	
l989:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_read_ack
	__end_of_i2c_read_ack:
;; =============== function _i2c_read_ack ends ============

	signat	_i2c_read_ack,89
	global	_i2c_stop
psect	text392,local,class=CODE,delta=2
global __ptext392
__ptext392:

;; *************** function _i2c_stop *****************
;; Defined at:
;;		line 61 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_i2c_wait
;; This function is called by:
;;		_eeprom_write_byte
;;		_eeprom_read_byte
;; This function uses a non-reentrant model
;;
psect	text392
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	61
	global	__size_of_i2c_stop
	__size_of_i2c_stop	equ	__end_of_i2c_stop-_i2c_stop
	
_i2c_stop:	
	opt	stack 5
; Regs used in _i2c_stop: [status,2+status,0+pclath+cstack]
	line	62
	
l3992:	
;uart_check.c: 62: { TRISB3 = 0; RB3 = 0; };
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1075/8)^080h,(1075)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(51/8),(51)&7
	line	63
;uart_check.c: 63: { RB4 = 1; i2c_wait(); };
	bsf	(52/8),(52)&7
	
l3994:	
	fcall	_i2c_wait
	line	64
	
l3996:	
;uart_check.c: 64: { TRISB3 = 0; RB3 = 1; };
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1075/8)^080h,(1075)&7
	
l3998:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(51/8),(51)&7
	line	65
;uart_check.c: 65: i2c_wait();
	fcall	_i2c_wait
	line	66
	
l986:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_stop
	__end_of_i2c_stop:
;; =============== function _i2c_stop ends ============

	signat	_i2c_stop,88
	global	_i2c_start
psect	text393,local,class=CODE,delta=2
global __ptext393
__ptext393:

;; *************** function _i2c_start *****************
;; Defined at:
;;		line 54 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_i2c_wait
;; This function is called by:
;;		_eeprom_write_byte
;;		_eeprom_read_byte
;; This function uses a non-reentrant model
;;
psect	text393
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	54
	global	__size_of_i2c_start
	__size_of_i2c_start	equ	__end_of_i2c_start-_i2c_start
	
_i2c_start:	
	opt	stack 5
; Regs used in _i2c_start: [status,2+status,0+pclath+cstack]
	line	55
	
l3982:	
;uart_check.c: 55: { TRISB3 = 0; RB3 = 1; };
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1075/8)^080h,(1075)&7
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(51/8),(51)&7
	line	56
;uart_check.c: 56: { RB4 = 1; i2c_wait(); };
	bsf	(52/8),(52)&7
	
l3984:	
	fcall	_i2c_wait
	line	57
	
l3986:	
;uart_check.c: 57: { TRISB3 = 0; RB3 = 0; };
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1075/8)^080h,(1075)&7
	
l3988:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(51/8),(51)&7
	line	58
	
l3990:	
;uart_check.c: 58: { RB4 = 0; i2c_wait(); };
	bcf	(52/8),(52)&7
	fcall	_i2c_wait
	line	59
	
l983:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_start
	__end_of_i2c_start:
;; =============== function _i2c_start ends ============

	signat	_i2c_start,88
	global	_printf
psect	text394,local,class=CODE,delta=2
global __ptext394
__ptext394:

;; *************** function _printf *****************
;; Defined at:
;;		line 461 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  f               2    0[BANK0 ] PTR const unsigned char 
;;		 -> STR_12(30), STR_11(12), STR_8(16), STR_7(19), 
;;		 -> STR_6(22), STR_5(7), STR_4(5), STR_3(27), 
;;		 -> STR_2(34), STR_1(43), 
;; Auto vars:     Size  Location     Type
;;  _val            4   15[BANK0 ] struct .
;;  width           2   12[BANK0 ] int 
;;  c               1   14[BANK0 ] char 
;;  flag            1   11[BANK0 ] unsigned char 
;;  ap              1   10[BANK0 ] PTR void [1]
;;		 -> ?_printf(2), 
;;  prec            1    9[BANK0 ] char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0      10       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0      19       0       0       0
;;Total ram usage:       19 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_putch
;;		_isdigit
;;		___wmul
;;		___lwdiv
;;		___lwmod
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text394
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\doprnt.c"
	line	461
	global	__size_of_printf
	__size_of_printf	equ	__end_of_printf-_printf
	
_printf:	
	opt	stack 6
; Regs used in _printf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	537
	
l3840:	
	movlw	(?_printf+02h)&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	movwf	(printf@ap)
	line	540
	goto	l3980
	
l1054:	
	line	542
	
l3842:	
	movf	(printf@c),w
	xorlw	025h
	skipnz
	goto	u2921
	goto	u2920
u2921:
	goto	l3846
u2920:
	line	545
	
l3844:	
	movf	(printf@c),w
	fcall	_putch
	line	546
	goto	l3980
	line	547
	
l1055:	
	line	550
	
l3846:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(printf@width)
	clrf	(printf@width+1)
	line	552
	
l3848:	
	clrf	(printf@flag)
	goto	l3854
	line	554
	
l1056:	
	line	555
	goto	l3854
	line	583
	
l1058:	
	line	584
	bsf	(printf@flag)+(2/8),(2)&7
	line	585
	
l3850:	
	movlw	low(01h)
	addwf	(printf@f),f
	skipnc
	incf	(printf@f+1),f
	movlw	high(01h)
	addwf	(printf@f+1),f
	line	586
	goto	l3854
	line	588
	
l3852:	
	goto	l3856
	line	555
	
l1057:	
	
l3854:	
	movf	(printf@f+1),w
	movwf	btemp+1
	movf	(printf@f),w
	movwf	fsr0
	fcall	stringtab
	; Switch size 1, requested type "space"
; Number of cases is 1, Range of values is 48 to 48
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            4     3 (average)
; direct_byte           14    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	48^0	; case 48
	skipnz
	goto	l1058
	goto	l3856
	opt asmopt_on

	line	588
	
l1060:	
	line	589
	goto	l3856
	line	590
	
l1059:	
	goto	l3854
	
l1061:	
	line	601
	
l3856:	
	movf	(printf@f+1),w
	movwf	btemp+1
	movf	(printf@f),w
	movwf	fsr0
	fcall	stringtab
	fcall	_isdigit
	btfss	status,0
	goto	u2931
	goto	u2930
u2931:
	goto	l3908
u2930:
	line	602
	
l3858:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(printf@width)
	clrf	(printf@width+1)
	goto	l3860
	line	603
	
l1063:	
	line	604
	
l3860:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(printf@width+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(printf@width),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(printf@f+1),w
	movwf	btemp+1
	movf	(printf@f),w
	movwf	fsr0
	fcall	stringtab
	addwf	(0+(?___wmul)),w
	movwf	(??_printf+0)+0
	movlw	0
	skipnc
	movlw	1
	addwf	(1+(?___wmul)),w
	movwf	1+(??_printf+0)+0
	movf	0+(??_printf+0)+0,w
	addlw	low(0FFD0h)
	movwf	(printf@width)
	movf	1+(??_printf+0)+0,w
	skipnc
	addlw	1
	addlw	high(0FFD0h)
	movwf	1+(printf@width)
	
l3862:	
	movlw	low(01h)
	addwf	(printf@f),f
	skipnc
	incf	(printf@f+1),f
	movlw	high(01h)
	addwf	(printf@f+1),f
	line	605
	
l3864:	
	movf	(printf@f+1),w
	movwf	btemp+1
	movf	(printf@f),w
	movwf	fsr0
	fcall	stringtab
	fcall	_isdigit
	btfsc	status,0
	goto	u2941
	goto	u2940
u2941:
	goto	l3860
u2940:
	goto	l3908
	
l1064:	
	goto	l3908
	line	611
	
l1062:	
	line	638
	goto	l3908
	line	640
	
l1066:	
	line	641
	goto	l1116
	line	715
	
l1068:	
	line	721
	
l1069:	
	line	724
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(printf@flag)+(7/8),(7)&7
	line	726
	goto	l3910
	line	731
	
l1071:	
	line	737
	
l3866:	
	movf	(printf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(printf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(printf@_val+1)
	
l3868:	
	movlw	(02h)
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	addwf	(printf@ap),f
	line	743
	
l3870:	
	movf	((printf@_val+1)),w
	iorwf	((printf@_val)),w
	skipz
	goto	u2951
	goto	u2950
u2951:
	goto	l3874
u2950:
	line	744
	
l3872:	
	movlw	low(STR_13|8000h)
	movwf	(printf@_val)
	movlw	high(STR_13|8000h)
	movwf	((printf@_val))+1
	goto	l3874
	
l1072:	
	line	748
	
l3874:	
	clrf	0+(printf@_val)+02h
	clrf	1+(printf@_val)+02h
	line	749
	goto	l3878
	
l1074:	
	line	750
	
l3876:	
	movlw	low(01h)
	addwf	0+(printf@_val)+02h,f
	skipnc
	incf	1+(printf@_val)+02h,f
	movlw	high(01h)
	addwf	1+(printf@_val)+02h,f
	goto	l3878
	
l1073:	
	line	749
	
l3878:	
	movf	0+(printf@_val)+02h,w
	addwf	(printf@_val),w
	movwf	fsr0
	movf	(printf@_val+1),w
	skipnc
	incf	(printf@_val+1),w
	movwf	btemp+1
	fcall	stringtab
	iorlw	0
	skipz
	goto	u2961
	goto	u2960
u2961:
	goto	l3876
u2960:
	goto	l3880
	
l1075:	
	goto	l3880
	line	753
	
l1076:	
	line	760
	
l3880:	
	movf	(printf@width+1),w
	subwf	1+(printf@_val)+02h,w
	skipz
	goto	u2975
	movf	(printf@width),w
	subwf	0+(printf@_val)+02h,w
u2975:
	skipnc
	goto	u2971
	goto	u2970
u2971:
	goto	l3884
u2970:
	line	761
	
l3882:	
	movf	0+(printf@_val)+02h,w
	subwf	(printf@width),f
	movf	1+(printf@_val)+02h,w
	skipc
	decf	(printf@width+1),f
	subwf	(printf@width+1),f
	goto	l3888
	line	762
	
l1077:	
	line	763
	
l3884:	
	clrf	(printf@width)
	clrf	(printf@width+1)
	goto	l3888
	
l1078:	
	line	767
	goto	l3888
	
l1080:	
	line	768
	
l3886:	
	movlw	(020h)
	fcall	_putch
	goto	l3888
	
l1079:	
	line	767
	
l3888:	
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(printf@width),f
	skipnc
	incf	(printf@width+1),f
	movlw	high(-1)
	addwf	(printf@width+1),f
	movlw	high(-1)
	xorwf	((printf@width+1)),w
	skipz
	goto	u2985
	movlw	low(-1)
	xorwf	((printf@width)),w
u2985:

	skipz
	goto	u2981
	goto	u2980
u2981:
	goto	l3886
u2980:
	goto	l3894
	
l1081:	
	line	770
	goto	l3894
	
l1083:	
	line	771
	
l3890:	
	movf	(printf@_val+1),w
	movwf	btemp+1
	movf	(printf@_val),w
	movwf	fsr0
	fcall	stringtab
	fcall	_putch
	
l3892:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(printf@_val),f
	skipnc
	incf	(printf@_val+1),f
	movlw	high(01h)
	addwf	(printf@_val+1),f
	goto	l3894
	
l1082:	
	line	770
	
l3894:	
	movlw	low(01h)
	subwf	0+(printf@_val)+02h,f
	movlw	high(01h)
	skipc
	decf	1+(printf@_val)+02h,f
	subwf	1+(printf@_val)+02h,f
	movlw	high(0FFFFh)
	xorwf	(1+(printf@_val)+02h),w
	skipz
	goto	u2995
	movlw	low(0FFFFh)
	xorwf	(0+(printf@_val)+02h),w
u2995:

	skipz
	goto	u2991
	goto	u2990
u2991:
	goto	l3890
u2990:
	goto	l3980
	
l1084:	
	line	777
	goto	l3980
	line	787
	
l1085:	
	line	802
	
l3896:	
	movf	(printf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	movwf	(printf@c)
	
l3898:	
	movlw	(02h)
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	addwf	(printf@ap),f
	goto	l3900
	line	805
	
l1086:	
	line	808
	
l3900:	
	movlw	(printf@c&0ffh)
	movwf	(printf@_val)
	movlw	(0x0/2)
	movwf	(printf@_val+1)
	line	809
	
l3902:	
	movlw	low(01h)
	movwf	0+(printf@_val)+02h
	movlw	high(01h)
	movwf	(0+(printf@_val)+02h)+1
	line	810
	goto	l3880
	line	820
	
l1087:	
	line	821
	
l3904:	
	movlw	(0C0h)
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	iorwf	(printf@flag),f
	line	822
	goto	l3910
	line	825
	
l3906:	
	goto	l3910
	line	638
	
l1065:	
	
l3908:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(printf@f+1),w
	movwf	(??_printf+0)+0+1
	movf	(printf@f),w
	movwf	(??_printf+0)+0
	movlw	(01h)
	addwf	(printf@f),f
	skipnc
	incf	(printf@f+1),f
	movf	1+(??_printf+0)+0,w
	movwf	btemp+1
	movf	0+(??_printf+0)+0,w
	movwf	fsr0
	fcall	stringtab
	movwf	(printf@c)
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 120
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           19    10 (average)
; jumptable            260     6 (fixed)
; rangetable           125     6 (fixed)
; spacedrange          248     9 (fixed)
; locatedrange         121     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l1116
	xorlw	88^0	; case 88
	skipnz
	goto	l1069
	xorlw	99^88	; case 99
	skipnz
	goto	l3896
	xorlw	115^99	; case 115
	skipnz
	goto	l3866
	xorlw	117^115	; case 117
	skipnz
	goto	l3904
	xorlw	120^117	; case 120
	skipnz
	goto	l1069
	goto	l3900
	opt asmopt_on

	line	825
	
l1070:	
	line	1281
	
l3910:	
	movf	(printf@ap),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(printf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(printf@_val+1)
	
l3912:	
	movlw	(02h)
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	addwf	(printf@ap),f
	line	1289
	goto	l3944
	line	1297
	
l1089:	
	line	1300
	
l3914:	
	clrf	(printf@c)
	bsf	status,0
	rlf	(printf@c),f
	
l3916:	
	movf	(printf@c),w
	xorlw	05h
	skipz
	goto	u3001
	goto	u3000
u3001:
	goto	l3920
u3000:
	goto	l3946
	
l3918:	
	goto	l3946
	line	1301
	
l1090:	
	
l3920:	
	movf	(printf@c),w
	movwf	(??_printf+0)+0
	addwf	(??_printf+0)+0,w
	addlw	low(_dpowers|8000h)
	movwf	fsr0
	movlw	high(_dpowers|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(??_printf+1)+0
	fcall	stringtab
	movwf	(??_printf+1)+0+1
	movf	1+(??_printf+1)+0,w
	subwf	(printf@_val+1),w
	skipz
	goto	u3015
	movf	0+(??_printf+1)+0,w
	subwf	(printf@_val),w
u3015:
	skipnc
	goto	u3011
	goto	u3010
u3011:
	goto	l3924
u3010:
	goto	l3946
	line	1302
	
l3922:	
	goto	l3946
	
l1092:	
	line	1300
	
l3924:	
	movlw	(01h)
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	addwf	(printf@c),f
	
l3926:	
	movf	(printf@c),w
	xorlw	05h
	skipz
	goto	u3021
	goto	u3020
u3021:
	goto	l3920
u3020:
	goto	l3946
	
l1091:	
	line	1304
	goto	l3946
	line	1309
	
l1094:	
	line	1311
	
l3928:	
	clrf	(printf@c)
	bsf	status,0
	rlf	(printf@c),f
	
l3930:	
	movf	(printf@c),w
	xorlw	04h
	skipz
	goto	u3031
	goto	u3030
u3031:
	goto	l3934
u3030:
	goto	l3946
	
l3932:	
	goto	l3946
	line	1312
	
l1095:	
	
l3934:	
	movf	(printf@c),w
	movwf	(??_printf+0)+0
	addwf	(??_printf+0)+0,w
	addlw	low(_hexpowers|8000h)
	movwf	fsr0
	movlw	high(_hexpowers|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(??_printf+1)+0
	fcall	stringtab
	movwf	(??_printf+1)+0+1
	movf	1+(??_printf+1)+0,w
	subwf	(printf@_val+1),w
	skipz
	goto	u3045
	movf	0+(??_printf+1)+0,w
	subwf	(printf@_val),w
u3045:
	skipnc
	goto	u3041
	goto	u3040
u3041:
	goto	l3938
u3040:
	goto	l3946
	line	1313
	
l3936:	
	goto	l3946
	
l1097:	
	line	1311
	
l3938:	
	movlw	(01h)
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	addwf	(printf@c),f
	
l3940:	
	movf	(printf@c),w
	xorlw	04h
	skipz
	goto	u3051
	goto	u3050
u3051:
	goto	l3934
u3050:
	goto	l3946
	
l1096:	
	line	1315
	goto	l3946
	line	1331
	
l3942:	
	goto	l3946
	line	1289
	
l1088:	
	
l3944:	
	movf	(printf@flag),w
	andlw	0C0h
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 128 to 192
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte          206    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	128^0	; case 128
	skipnz
	goto	l3928
	xorlw	192^128	; case 192
	skipnz
	goto	l3914
	goto	l3946
	opt asmopt_on

	line	1331
	
l1093:	
	line	1376
	
l3946:	
	movf	(printf@c),w
	movwf	(??_printf+0)+0
	clrf	(??_printf+0)+0+1
	btfsc	(??_printf+0)+0,7
	decf	(??_printf+0)+0+1,f
	movf	1+(??_printf+0)+0,w
	xorlw	80h
	movwf	(??_printf+2)+0
	movf	(printf@width+1),w
	xorlw	80h
	subwf	(??_printf+2)+0,w
	skipz
	goto	u3065
	movf	(printf@width),w
	subwf	0+(??_printf+0)+0,w
u3065:

	skipnc
	goto	u3061
	goto	u3060
u3061:
	goto	l3950
u3060:
	line	1377
	
l3948:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(printf@c),w
	movwf	(??_printf+0)+0
	clrf	(??_printf+0)+0+1
	btfsc	(??_printf+0)+0,7
	decf	(??_printf+0)+0+1,f
	movf	0+(??_printf+0)+0,w
	subwf	(printf@width),f
	movf	1+(??_printf+0)+0,w
	skipc
	decf	(printf@width+1),f
	subwf	(printf@width+1),f
	goto	l3952
	line	1378
	
l1098:	
	line	1379
	
l3950:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(printf@width)
	clrf	(printf@width+1)
	goto	l3952
	
l1099:	
	line	1382
	
l3952:	
	btfss	(printf@flag),(2)&7
	goto	u3071
	goto	u3070
u3071:
	goto	l3960
u3070:
	line	1410
	
l3954:	
	movf	(printf@width+1),w
	iorwf	(printf@width),w
	skipnz
	goto	u3081
	goto	u3080
u3081:
	goto	l3966
u3080:
	goto	l3956
	line	1411
	
l1102:	
	line	1412
	
l3956:	
	movlw	(030h)
	fcall	_putch
	line	1413
	
l3958:	
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(printf@width),f
	skipnc
	incf	(printf@width+1),f
	movlw	high(-1)
	addwf	(printf@width+1),f
	movf	(((printf@width+1))),w
	iorwf	(((printf@width))),w
	skipz
	goto	u3091
	goto	u3090
u3091:
	goto	l3956
u3090:
	goto	l3966
	
l1103:	
	goto	l3966
	
l1101:	
	line	1415
	goto	l3966
	
l1100:	
	line	1423
	
l3960:	
	movf	(printf@width+1),w
	iorwf	(printf@width),w
	skipnz
	goto	u3101
	goto	u3100
u3101:
	goto	l3966
u3100:
	goto	l3962
	line	1424
	
l1106:	
	line	1425
	
l3962:	
	movlw	(020h)
	fcall	_putch
	line	1426
	
l3964:	
	movlw	low(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(printf@width),f
	skipnc
	incf	(printf@width+1),f
	movlw	high(-1)
	addwf	(printf@width+1),f
	movf	(((printf@width+1))),w
	iorwf	(((printf@width))),w
	skipz
	goto	u3111
	goto	u3110
u3111:
	goto	l3962
u3110:
	goto	l3966
	
l1107:	
	goto	l3966
	
l1105:	
	goto	l3966
	line	1464
	
l1104:	
	line	1467
	
l3966:	
	movf	(printf@c),w
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	movwf	(printf@prec)
	line	1469
	goto	l3978
	
l1109:	
	line	1471
	goto	l3974
	line	1481
	
l1111:	
	line	1484
	
l3968:	
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(printf@prec),w
	movwf	(??_printf+0)+0
	addwf	(??_printf+0)+0,w
	addlw	low(_dpowers|8000h)
	movwf	fsr0
	movlw	high(_dpowers|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(?___lwdiv)
	fcall	stringtab
	movwf	(?___lwdiv+1)
	movf	(printf@_val+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(printf@_val),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(0+(?___lwdiv)),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(0+(?___lwmod)),w
	addlw	030h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_printf+1)+0
	movf	(??_printf+1)+0,w
	movwf	(printf@c)
	line	1486
	goto	l3976
	line	1492
	
l1113:	
	line	1497
	
l3970:	
	movf	(printf@prec),w
	movwf	(??_printf+0)+0
	addwf	(??_printf+0)+0,w
	addlw	low(_hexpowers|8000h)
	movwf	fsr0
	movlw	high(_hexpowers|8000h)
	skipnc
	addlw	1
	movwf	btemp+1
	fcall	stringtab
	movwf	(?___lwdiv)
	fcall	stringtab
	movwf	(?___lwdiv+1)
	movf	(printf@_val+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(printf@_val),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	andlw	0Fh
	addlw	low(STR_14|8000h)
	movwf	fsr0
	movlw	high(STR_14|8000h)
	skipnc
	addlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	fcall	stringtab
	movwf	(??_printf+1)+0
	movf	(??_printf+1)+0,w
	movwf	(printf@c)
	line	1502
	goto	l3976
	line	1515
	
l3972:	
	goto	l3976
	line	1471
	
l1110:	
	
l3974:	
	movf	(printf@flag),w
	andlw	0C0h
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 128 to 192
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte          206    11 (fixed)
; jumptable            263     9 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	128^0	; case 128
	skipnz
	goto	l3970
	xorlw	192^128	; case 192
	skipnz
	goto	l3968
	goto	l3976
	opt asmopt_on

	line	1515
	
l1112:	
	line	1516
	
l3976:	
	movf	(printf@c),w
	fcall	_putch
	goto	l3978
	line	1517
	
l1108:	
	line	1469
	
l3978:	
	movlw	(-1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_printf+0)+0
	movf	(??_printf+0)+0,w
	addwf	(printf@prec),f
	movf	((printf@prec)),w
	xorlw	-1
	skipz
	goto	u3121
	goto	u3120
u3121:
	goto	l3974
u3120:
	goto	l3980
	
l1114:	
	goto	l3980
	line	1525
	
l1053:	
	line	540
	
l3980:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(printf@f+1),w
	movwf	(??_printf+0)+0+1
	movf	(printf@f),w
	movwf	(??_printf+0)+0
	movlw	(01h)
	addwf	(printf@f),f
	skipnc
	incf	(printf@f+1),f
	movf	1+(??_printf+0)+0,w
	movwf	btemp+1
	movf	0+(??_printf+0)+0,w
	movwf	fsr0
	fcall	stringtab
	movwf	(??_printf+2)+0
	movf	(??_printf+2)+0,w
	movwf	(printf@c)
	movf	((printf@c)),f
	skipz
	goto	u3131
	goto	u3130
u3131:
	goto	l3842
u3130:
	goto	l1116
	
l1115:	
	goto	l1116
	line	1527
	
l1067:	
	line	1533
;	Return value of _printf is never used
	
l1116:	
	return
	opt stack 0
GLOBAL	__end_of_printf
	__end_of_printf:
;; =============== function _printf ends ============

	signat	_printf,602
	global	_i2c_wait
psect	text395,local,class=CODE,delta=2
global __ptext395
__ptext395:

;; *************** function _i2c_wait *****************
;; Defined at:
;;		line 50 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_i2c_start
;;		_i2c_stop
;;		_i2c_read_ack
;;		_i2c_send_ack
;;		_i2c_write_byte
;;		_i2c_read_byte
;; This function uses a non-reentrant model
;;
psect	text395
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	50
	global	__size_of_i2c_wait
	__size_of_i2c_wait	equ	__end_of_i2c_wait-_i2c_wait
	
_i2c_wait:	
	opt	stack 5
; Regs used in _i2c_wait: []
	line	51
	
l3838:	
;uart_check.c: 51: _delay((unsigned long)((5)*(3570000/4000000.0)));
		opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on
	opt asmopt_off
	nop2	;2 cycle nop
	opt asmopt_on

	line	52
	
l980:	
	return
	opt stack 0
GLOBAL	__end_of_i2c_wait
	__end_of_i2c_wait:
;; =============== function _i2c_wait ends ============

	signat	_i2c_wait,88
	global	___lwmod
psect	text396,local,class=CODE,delta=2
global __ptext396
__ptext396:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    8[COMMON] unsigned int 
;;  dividend        2   10[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1   13[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    8[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text396
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 6
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l3816:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2861
	goto	u2860
u2861:
	goto	l3834
u2860:
	line	9
	
l3818:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l3824
	
l2074:	
	line	11
	
l3820:	
	movlw	01h
	
u2875:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2875
	line	12
	
l3822:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l3824
	line	13
	
l2073:	
	line	10
	
l3824:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2881
	goto	u2880
u2881:
	goto	l3820
u2880:
	goto	l3826
	
l2075:	
	goto	l3826
	line	14
	
l2076:	
	line	15
	
l3826:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2895
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2895:
	skipc
	goto	u2891
	goto	u2890
u2891:
	goto	l3830
u2890:
	line	16
	
l3828:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l3830
	
l2077:	
	line	17
	
l3830:	
	movlw	01h
	
u2905:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2905
	line	18
	
l3832:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2911
	goto	u2910
u2911:
	goto	l3826
u2910:
	goto	l3834
	
l2078:	
	goto	l3834
	line	19
	
l2072:	
	line	20
	
l3834:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l2079
	
l3836:	
	line	21
	
l2079:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text397,local,class=CODE,delta=2
global __ptext397
__ptext397:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text397
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 6
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l3790:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l3792:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2791
	goto	u2790
u2791:
	goto	l3812
u2790:
	line	11
	
l3794:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l3800
	
l2064:	
	line	13
	
l3796:	
	movlw	01h
	
u2805:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2805
	line	14
	
l3798:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l3800
	line	15
	
l2063:	
	line	12
	
l3800:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2811
	goto	u2810
u2811:
	goto	l3796
u2810:
	goto	l3802
	
l2065:	
	goto	l3802
	line	16
	
l2066:	
	line	17
	
l3802:	
	movlw	01h
	
u2825:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2825
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2835
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2835:
	skipc
	goto	u2831
	goto	u2830
u2831:
	goto	l3808
u2830:
	line	19
	
l3804:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l3806:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l3808
	line	21
	
l2067:	
	line	22
	
l3808:	
	movlw	01h
	
u2845:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2845
	line	23
	
l3810:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2851
	goto	u2850
u2851:
	goto	l3802
u2850:
	goto	l3812
	
l2068:	
	goto	l3812
	line	24
	
l2062:	
	line	25
	
l3812:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l2069
	
l3814:	
	line	26
	
l2069:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text398,local,class=CODE,delta=2
global __ptext398
__ptext398:

;; *************** function ___wmul *****************
;; Defined at:
;;		line 3 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
;; Parameters:    Size  Location     Type
;;  multiplier      2    0[COMMON] unsigned int 
;;  multiplicand    2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  product         2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text398
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 6
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l3778:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l3780
	line	6
	
l2056:	
	line	7
	
l3780:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2751
	goto	u2750
u2751:
	goto	l2057
u2750:
	line	8
	
l3782:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l2057:	
	line	9
	movlw	01h
	
u2765:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u2765
	line	10
	
l3784:	
	movlw	01h
	
u2775:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u2775
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2781
	goto	u2780
u2781:
	goto	l3780
u2780:
	goto	l3786
	
l2058:	
	line	12
	
l3786:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l2059
	
l3788:	
	line	13
	
l2059:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_isdigit
psect	text399,local,class=CODE,delta=2
global __ptext399
__ptext399:

;; *************** function _isdigit *****************
;; Defined at:
;;		line 13 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\isdigit.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text399
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\isdigit.c"
	global	__size_of_isdigit
	__size_of_isdigit	equ	__end_of_isdigit-_isdigit
	
_isdigit:	
	opt	stack 6
; Regs used in _isdigit: [wreg+status,2+status,0]
;isdigit@c stored from wreg
	movwf	(isdigit@c)
	line	14
	
l3766:	
	clrf	(_isdigit$2270)
	
l3768:	
	movlw	(03Ah)
	subwf	(isdigit@c),w
	skipnc
	goto	u2731
	goto	u2730
u2731:
	goto	l3774
u2730:
	
l3770:	
	movlw	(030h)
	subwf	(isdigit@c),w
	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l3774
u2740:
	
l3772:	
	clrf	(_isdigit$2270)
	bsf	status,0
	rlf	(_isdigit$2270),f
	goto	l3774
	
l2046:	
	
l3774:	
	rrf	(_isdigit$2270),w
	
	goto	l2047
	
l3776:	
	line	15
	
l2047:	
	return
	opt stack 0
GLOBAL	__end_of_isdigit
	__end_of_isdigit:
;; =============== function _isdigit ends ============

	signat	_isdigit,4216
	global	_putch
psect	text400,local,class=CODE,delta=2
global __ptext400
__ptext400:

;; *************** function _putch *****************
;; Defined at:
;;		line 41 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_printf
;; This function uses a non-reentrant model
;;
psect	text400
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	41
	global	__size_of_putch
	__size_of_putch	equ	__end_of_putch-_putch
	
_putch:	
	opt	stack 6
; Regs used in _putch: [wreg]
;putch@c stored from wreg
	movwf	(putch@c)
	line	42
	
l3762:	
;uart_check.c: 42: while (!TXIF);
	goto	l974
	
l975:	
	
l974:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u2721
	goto	u2720
u2721:
	goto	l974
u2720:
	goto	l3764
	
l976:	
	line	43
	
l3764:	
;uart_check.c: 43: TXREG = c;
	movf	(putch@c),w
	movwf	(25)	;volatile
	line	44
	
l977:	
	return
	opt stack 0
GLOBAL	__end_of_putch
	__end_of_putch:
;; =============== function _putch ends ============

	signat	_putch,4216
	global	_uart_init
psect	text401,local,class=CODE,delta=2
global __ptext401
__ptext401:

;; *************** function _uart_init *****************
;; Defined at:
;;		line 32 in file "C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text401
	file	"C:\Users\chait\Desktop\Project\BitBanging GPIO\uart_check.c"
	line	32
	global	__size_of_uart_init
	__size_of_uart_init	equ	__end_of_uart_init-_uart_init
	
_uart_init:	
	opt	stack 7
; Regs used in _uart_init: [wreg]
	line	33
	
l3750:	
;uart_check.c: 33: SPBRG = 46;
	movlw	(02Eh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	line	34
	
l3752:	
;uart_check.c: 34: BRGH = 1;
	bsf	(1218/8)^080h,(1218)&7
	line	35
	
l3754:	
;uart_check.c: 35: SYNC = 0;
	bcf	(1220/8)^080h,(1220)&7
	line	36
	
l3756:	
;uart_check.c: 36: SPEN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	37
	
l3758:	
;uart_check.c: 37: TXEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1221/8)^080h,(1221)&7
	line	38
	
l3760:	
;uart_check.c: 38: CREN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(196/8),(196)&7
	line	39
	
l971:	
	return
	opt stack 0
GLOBAL	__end_of_uart_init
	__end_of_uart_init:
;; =============== function _uart_init ends ============

	signat	_uart_init,88
psect	text402,local,class=CODE,delta=2
global __ptext402
__ptext402:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
