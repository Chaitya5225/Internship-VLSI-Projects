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
	FNCALL	_main,_UART_Init
	FNCALL	_main,_I2C_Init
	FNCALL	_main,_UART_Write_Text
	FNCALL	_main,_I2C_Start
	FNCALL	_main,_I2C_Write
	FNCALL	_main,_I2C_Stop
	FNCALL	_main,_sprintf
	FNCALL	_sprintf,_isdigit
	FNCALL	_sprintf,___wmul
	FNCALL	_sprintf,___lwdiv
	FNCALL	_I2C_Write,_I2C_Wait
	FNCALL	_I2C_Stop,_I2C_Wait
	FNCALL	_I2C_Start,_I2C_Wait
	FNCALL	_UART_Write_Text,_UART_Write
	FNCALL	_UART_Init,___aldiv
	FNROOT	_main
	global	_hexpowers
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
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
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
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

	global	_hexpowers
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_TXREG
_TXREG	set	25
	global	_CARRY
_CARRY	set	24
	global	_CREN
_CREN	set	196
	global	_GIE
_GIE	set	95
	global	_SPEN
_SPEN	set	199
	global	_SSPIF
_SSPIF	set	99
	global	_TXIF
_TXIF	set	100
	global	_SPBRG
_SPBRG	set	153
	global	_SSPADD
_SSPADD	set	147
	global	_SSPCON2
_SSPCON2	set	145
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_ACKDT
_ACKDT	set	1165
	global	_ACKEN
_ACKEN	set	1164
	global	_BRGH
_BRGH	set	1218
	global	_PEN
_PEN	set	1162
	global	_RCEN
_RCEN	set	1163
	global	_RSEN
_RSEN	set	1161
	global	_SEN
_SEN	set	1160
	global	_SYNC
_SYNC	set	1220
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_TRISC6
_TRISC6	set	1086
	global	_TRISC7
_TRISC7	set	1087
	global	_TXEN
_TXEN	set	1221
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
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
	retlw	73	;'I'
	retlw	50	;'2'
	retlw	67	;'C'
	retlw	32	;' '
	retlw	87	;'W'
	retlw	114	;'r'
	retlw	105	;'i'
	retlw	116	;'t'
	retlw	101	;'e'
	retlw	32	;' '
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	115	;'s'
	retlw	116	;'t'
	retlw	32	;' '
	retlw	83	;'S'
	retlw	116	;'t'
	retlw	97	;'a'
	retlw	114	;'r'
	retlw	116	;'t'
	retlw	13
	retlw	10
	retlw	0
psect	strings
	
STR_5:	
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
psect	strings
	
STR_2:	
	retlw	83	;'S'
	retlw	101	;'e'
	retlw	110	;'n'
	retlw	116	;'t'
	retlw	58	;':'
	retlw	32	;' '
	retlw	48	;'0'
	retlw	120	;'x'
	retlw	0
psect	strings
	
STR_3:	
	retlw	37	;'%'
	retlw	48	;'0'
	retlw	50	;'2'
	retlw	88	;'X'
	retlw	0
psect	strings
STR_4	equ	STR_1+20
	file	"BitBanging.as"
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
	global	?_UART_Write
?_UART_Write:	; 0 bytes @ 0x0
	global	??_UART_Write
??_UART_Write:	; 0 bytes @ 0x0
	global	?_I2C_Init
?_I2C_Init:	; 0 bytes @ 0x0
	global	??_I2C_Init
??_I2C_Init:	; 0 bytes @ 0x0
	global	?_I2C_Wait
?_I2C_Wait:	; 0 bytes @ 0x0
	global	??_I2C_Wait
??_I2C_Wait:	; 0 bytes @ 0x0
	global	?_I2C_Start
?_I2C_Start:	; 0 bytes @ 0x0
	global	??_I2C_Start
??_I2C_Start:	; 0 bytes @ 0x0
	global	?_I2C_Stop
?_I2C_Stop:	; 0 bytes @ 0x0
	global	??_I2C_Stop
??_I2C_Stop:	; 0 bytes @ 0x0
	global	?_I2C_Write
?_I2C_Write:	; 0 bytes @ 0x0
	global	??_I2C_Write
??_I2C_Write:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___wmul
?___wmul:	; 2 bytes @ 0x0
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___aldiv
?___aldiv:	; 4 bytes @ 0x0
	global	UART_Write@data
UART_Write@data:	; 1 bytes @ 0x0
	global	I2C_Write@data
I2C_Write@data:	; 1 bytes @ 0x0
	global	_isdigit$2245
_isdigit$2245:	; 1 bytes @ 0x0
	global	___wmul@multiplier
___wmul@multiplier:	; 2 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___aldiv@divisor
___aldiv@divisor:	; 4 bytes @ 0x0
	ds	1
	global	?_UART_Write_Text
?_UART_Write_Text:	; 0 bytes @ 0x1
	global	isdigit@c
isdigit@c:	; 1 bytes @ 0x1
	global	UART_Write_Text@text
UART_Write_Text@text:	; 2 bytes @ 0x1
	ds	1
	global	___wmul@multiplicand
___wmul@multiplicand:	; 2 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_UART_Write_Text
??_UART_Write_Text:	; 0 bytes @ 0x3
	ds	1
	global	??___wmul
??___wmul:	; 0 bytes @ 0x4
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	___wmul@product
___wmul@product:	; 2 bytes @ 0x4
	global	___aldiv@dividend
___aldiv@dividend:	; 4 bytes @ 0x4
	ds	1
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	2
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	ds	1
	global	??___aldiv
??___aldiv:	; 0 bytes @ 0x8
	global	?_sprintf
?_sprintf:	; 2 bytes @ 0x8
	global	sprintf@f
sprintf@f:	; 1 bytes @ 0x8
	ds	1
	global	UART_Init@x
UART_Init@x:	; 2 bytes @ 0x9
	ds	2
	global	??_sprintf
??_sprintf:	; 0 bytes @ 0xB
	ds	3
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	sprintf@ap
sprintf@ap:	; 1 bytes @ 0x0
	global	___aldiv@counter
___aldiv@counter:	; 1 bytes @ 0x0
	ds	1
	global	sprintf@flag
sprintf@flag:	; 1 bytes @ 0x1
	global	___aldiv@sign
___aldiv@sign:	; 1 bytes @ 0x1
	ds	1
	global	sprintf@_val
sprintf@_val:	; 4 bytes @ 0x2
	global	___aldiv@quotient
___aldiv@quotient:	; 4 bytes @ 0x2
	ds	4
	global	?_UART_Init
?_UART_Init:	; 0 bytes @ 0x6
	global	sprintf@prec
sprintf@prec:	; 1 bytes @ 0x6
	global	UART_Init@baud
UART_Init@baud:	; 4 bytes @ 0x6
	ds	1
	global	sprintf@sp
sprintf@sp:	; 1 bytes @ 0x7
	ds	1
	global	sprintf@width
sprintf@width:	; 2 bytes @ 0x8
	ds	2
	global	??_UART_Init
??_UART_Init:	; 0 bytes @ 0xA
	global	sprintf@c
sprintf@c:	; 1 bytes @ 0xA
	ds	12
	global	??_main
??_main:	; 0 bytes @ 0x16
	ds	3
	global	main@buf
main@buf:	; 5 bytes @ 0x19
	ds	5
	global	main@data_sent
main@data_sent:	; 1 bytes @ 0x1E
	ds	1
;;Data sizes: Strings 54, constant 8, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     31      31
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___wmul	unsigned int  size(1) Largest target is 0
;;
;; ?___aldiv	long  size(1) Largest target is 0
;;
;; sprintf@f	PTR const unsigned char  size(1) Largest target is 5
;;		 -> STR_3(CODE[5]), 
;;
;; sprintf@sp	PTR unsigned char  size(1) Largest target is 5
;;		 -> main@buf(BANK0[5]), 
;;
;; ?_sprintf	int  size(1) Largest target is 0
;;
;; sprintf@ap	PTR void [1] size(1) Largest target is 2
;;		 -> ?_sprintf(COMMON[2]), 
;;
;; S1753$_cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; _val._str._cp	PTR const unsigned char  size(1) Largest target is 0
;;
;; UART_Write_Text@text	PTR const unsigned char  size(2) Largest target is 23
;;		 -> STR_4(CODE[3]), main@buf(BANK0[5]), STR_2(CODE[9]), STR_1(CODE[23]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_sprintf
;;   _sprintf->___lwdiv
;;   _UART_Write_Text->_UART_Write
;;   _UART_Init->___aldiv
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_UART_Init
;;   _UART_Init->___aldiv
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 9     9      0    1694
;;                                             22 BANK0      9     9      0
;;                          _UART_Init
;;                           _I2C_Init
;;                    _UART_Write_Text
;;                          _I2C_Start
;;                          _I2C_Write
;;                           _I2C_Stop
;;                            _sprintf
;; ---------------------------------------------------------------------------------
;; (1) _sprintf                                             17    14      3    1048
;;                                              8 COMMON     6     3      3
;;                                              0 BANK0     11    11      0
;;                            _isdigit
;;                             ___wmul
;;                            ___lwdiv
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Write                                            1     1      0      22
;;                                              0 COMMON     1     1      0
;;                           _I2C_Wait
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Stop                                             0     0      0       0
;;                           _I2C_Wait
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Start                                            0     0      0       0
;;                           _I2C_Wait
;; ---------------------------------------------------------------------------------
;; (1) _UART_Write_Text                                      2     0      2      67
;;                                              1 COMMON     2     0      2
;;                         _UART_Write
;; ---------------------------------------------------------------------------------
;; (1) _UART_Init                                           18    14      4     456
;;                                              9 COMMON     2     2      0
;;                                              6 BANK0     16    12      4
;;                            ___aldiv
;; ---------------------------------------------------------------------------------
;; (2) ___aldiv                                             15     7      8     300
;;                                              0 COMMON     9     1      8
;;                                              0 BANK0      6     6      0
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
;; (2) _I2C_Wait                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _I2C_Init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _UART_Write                                           1     1      0      22
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _UART_Init
;;     ___aldiv
;;   _I2C_Init
;;   _UART_Write_Text
;;     _UART_Write
;;   _I2C_Start
;;     _I2C_Wait
;;   _I2C_Write
;;     _I2C_Wait
;;   _I2C_Stop
;;     _I2C_Wait
;;   _sprintf
;;     _isdigit
;;     ___wmul
;;     ___lwdiv
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
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     1F      1F       5       38.8%
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
;;		line 69 in file "C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  buf             5   25[BANK0 ] unsigned char [5]
;;  data_sent       1   30[BANK0 ] unsigned char 
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
;;      Locals:         0       6       0       0       0
;;      Temps:          0       3       0       0       0
;;      Totals:         0       9       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_UART_Init
;;		_I2C_Init
;;		_UART_Write_Text
;;		_I2C_Start
;;		_I2C_Write
;;		_I2C_Stop
;;		_sprintf
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
	line	69
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	70
	
l3771:	
;bitbang.c: 70: unsigned char data_sent = 0x55;
	movlw	(055h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(main@data_sent)
	line	72
	
l3773:	
;bitbang.c: 72: UART_Init(9600);
	movlw	0
	movwf	(?_UART_Init+3)
	movlw	0
	movwf	(?_UART_Init+2)
	movlw	025h
	movwf	(?_UART_Init+1)
	movlw	080h
	movwf	(?_UART_Init)

	fcall	_UART_Init
	line	73
	
l3775:	
;bitbang.c: 73: I2C_Init();
	fcall	_I2C_Init
	line	74
	
l3777:	
;bitbang.c: 74: UART_Write_Text("I2C Write Test Start\r\n");
	movlw	low((STR_1-__stringbase))
	movwf	(?_UART_Write_Text)
	movlw	80h
	movwf	(?_UART_Write_Text+1)
	fcall	_UART_Write_Text
	goto	l3779
	line	75
;bitbang.c: 75: while (1) {
	
l1015:	
	line	77
	
l3779:	
;bitbang.c: 77: I2C_Start();
	fcall	_I2C_Start
	line	78
	
l3781:	
;bitbang.c: 78: I2C_Write(0xA0);
	movlw	(0A0h)
	fcall	_I2C_Write
	line	79
	
l3783:	
;bitbang.c: 79: I2C_Write(0x10);
	movlw	(010h)
	fcall	_I2C_Write
	line	80
	
l3785:	
;bitbang.c: 80: I2C_Write(data_sent);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@data_sent),w
	fcall	_I2C_Write
	line	81
	
l3787:	
;bitbang.c: 81: I2C_Stop();
	fcall	_I2C_Stop
	line	83
	
l3789:	
;bitbang.c: 83: UART_Write_Text("Sent: 0x");
	movlw	low((STR_2-__stringbase))
	movwf	(?_UART_Write_Text)
	movlw	80h
	movwf	(?_UART_Write_Text+1)
	fcall	_UART_Write_Text
	line	85
	
l3791:	
;bitbang.c: 84: char buf[5];
;bitbang.c: 85: sprintf(buf, "%02X", data_sent);
	movlw	((STR_3-__stringbase))&0ffh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	movwf	(?_sprintf)
	movf	(main@data_sent),w
	movwf	(??_main+1)+0
	clrf	(??_main+1)+0+1
	movf	0+(??_main+1)+0,w
	movwf	0+(?_sprintf)+01h
	movf	1+(??_main+1)+0,w
	movwf	1+(?_sprintf)+01h
	movlw	(main@buf)&0ffh
	fcall	_sprintf
	line	86
	
l3793:	
;bitbang.c: 86: UART_Write_Text(buf);
	movlw	(main@buf&0ffh)
	movwf	(?_UART_Write_Text)
	movlw	(0x0/2)
	movwf	(?_UART_Write_Text+1)
	fcall	_UART_Write_Text
	line	87
	
l3795:	
;bitbang.c: 87: UART_Write_Text("\r\n");
	movlw	low((STR_4-__stringbase))
	movwf	(?_UART_Write_Text)
	movlw	80h
	movwf	(?_UART_Write_Text+1)
	fcall	_UART_Write_Text
	line	88
	
l3797:	
;bitbang.c: 88: _delay((unsigned long)((1000)*(3570000/4000.0)));
	opt asmopt_off
movlw  5
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+2),f
movlw	136
movwf	((??_main+0)+0+1),f
	movlw	20
movwf	((??_main+0)+0),f
u3057:
	decfsz	((??_main+0)+0),f
	goto	u3057
	decfsz	((??_main+0)+0+1),f
	goto	u3057
	decfsz	((??_main+0)+0+2),f
	goto	u3057
	nop2
opt asmopt_on

	goto	l3779
	line	89
	
l1016:	
	line	75
	goto	l3779
	
l1017:	
	line	90
	
l1018:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_sprintf
psect	text352,local,class=CODE,delta=2
global __ptext352
__ptext352:

;; *************** function _sprintf *****************
;; Defined at:
;;		line 488 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\lib\doprnt.c"
;; Parameters:    Size  Location     Type
;;  sp              1    wreg     PTR unsigned char 
;;		 -> main@buf(5), 
;;  f               1    8[COMMON] PTR const unsigned char 
;;		 -> STR_3(5), 
;; Auto vars:     Size  Location     Type
;;  sp              1    7[BANK0 ] PTR unsigned char 
;;		 -> main@buf(5), 
;;  _val            4    2[BANK0 ] struct .
;;  width           2    8[BANK0 ] int 
;;  c               1   10[BANK0 ] char 
;;  prec            1    6[BANK0 ] char 
;;  flag            1    1[BANK0 ] unsigned char 
;;  ap              1    0[BANK0 ] PTR void [1]
;;		 -> ?_sprintf(2), 
;; Return value:  Size  Location     Type
;;                  2    8[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0      11       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         6      11       0       0       0
;;Total ram usage:       17 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_isdigit
;;		___wmul
;;		___lwdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text352
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\doprnt.c"
	line	488
	global	__size_of_sprintf
	__size_of_sprintf	equ	__end_of_sprintf-_sprintf
	
_sprintf:	
	opt	stack 6
; Regs used in _sprintf: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
;sprintf@sp stored from wreg
	line	537
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sprintf@sp)
	
l3681:	
	movlw	(?_sprintf+01h)&0ffh
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@ap)
	line	540
	goto	l3765
	
l1030:	
	line	542
	
l3683:	
	movf	(sprintf@c),w
	xorlw	025h
	skipnz
	goto	u2911
	goto	u2910
u2911:
	goto	l3689
u2910:
	line	545
	
l3685:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3687:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	546
	goto	l3765
	line	547
	
l1031:	
	line	550
	
l3689:	
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	line	552
	
l3691:	
	clrf	(sprintf@flag)
	goto	l3697
	line	554
	
l1032:	
	line	555
	goto	l3697
	line	583
	
l1034:	
	line	584
	bsf	(sprintf@flag)+(2/8),(2)&7
	line	585
	
l3693:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@f),f
	line	586
	goto	l3697
	line	588
	
l3695:	
	goto	l3699
	line	555
	
l1033:	
	
l3697:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
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
	goto	l1034
	goto	l3699
	opt asmopt_on

	line	588
	
l1036:	
	line	589
	goto	l3699
	line	590
	
l1035:	
	goto	l3697
	
l1037:	
	line	601
	
l3699:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfss	status,0
	goto	u2921
	goto	u2920
u2921:
	goto	l3711
u2920:
	line	602
	
l3701:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l3703
	line	603
	
l1039:	
	line	604
	
l3703:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@width+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(sprintf@width),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	movlw	low(0Ah)
	movwf	0+(?___wmul)+02h
	movlw	high(0Ah)
	movwf	(0+(?___wmul)+02h)+1
	fcall	___wmul
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	addwf	(0+(?___wmul)),w
	movwf	(??_sprintf+0)+0
	movlw	0
	skipnc
	movlw	1
	addwf	(1+(?___wmul)),w
	movwf	1+(??_sprintf+0)+0
	movf	0+(??_sprintf+0)+0,w
	addlw	low(0FFD0h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sprintf@width)
	movf	1+(??_sprintf+0)+0,w
	skipnc
	addlw	1
	addlw	high(0FFD0h)
	movwf	1+(sprintf@width)
	
l3705:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@f),f
	line	605
	
l3707:	
	movf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	fcall	_isdigit
	btfsc	status,0
	goto	u2931
	goto	u2930
u2931:
	goto	l3703
u2930:
	goto	l3711
	
l1040:	
	goto	l3711
	line	611
	
l1038:	
	line	638
	goto	l3711
	line	640
	
l1042:	
	line	641
	goto	l3767
	line	715
	
l1044:	
	goto	l3713
	line	721
	
l1045:	
	line	726
	goto	l3713
	line	805
	
l1047:	
	line	816
	goto	l3765
	line	825
	
l3709:	
	goto	l3713
	line	638
	
l1041:	
	
l3711:	
	movlw	01h
	addwf	(sprintf@f),f
	movlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sprintf@c)
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 120
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; jumptable            260     6 (fixed)
; rangetable           125     6 (fixed)
; spacedrange          248     9 (fixed)
; locatedrange         121     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3767
	xorlw	88^0	; case 88
	skipnz
	goto	l3713
	xorlw	120^88	; case 120
	skipnz
	goto	l3713
	goto	l3765
	opt asmopt_on

	line	825
	
l1046:	
	line	1281
	
l3713:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@ap),w
	movwf	fsr0
	movf	indf,w
	movwf	(sprintf@_val)
	incf	fsr0,f
	movf	indf,w
	movwf	(sprintf@_val+1)
	
l3715:	
	movlw	(02h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@ap),f
	line	1311
	
l3717:	
	clrf	(sprintf@c)
	bsf	status,0
	rlf	(sprintf@c),f
	
l3719:	
	movf	(sprintf@c),w
	xorlw	04h
	skipz
	goto	u2941
	goto	u2940
u2941:
	goto	l3723
u2940:
	goto	l3731
	
l3721:	
	goto	l3731
	line	1312
	
l1048:	
	
l3723:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((_hexpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+1)+0
	fcall	stringdir
	movwf	(??_sprintf+1)+0+1
	movf	1+(??_sprintf+1)+0,w
	subwf	(sprintf@_val+1),w
	skipz
	goto	u2955
	movf	0+(??_sprintf+1)+0,w
	subwf	(sprintf@_val),w
u2955:
	skipnc
	goto	u2951
	goto	u2950
u2951:
	goto	l3727
u2950:
	goto	l3731
	line	1313
	
l3725:	
	goto	l3731
	
l1050:	
	line	1311
	
l3727:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@c),f
	
l3729:	
	movf	(sprintf@c),w
	xorlw	04h
	skipz
	goto	u2961
	goto	u2960
u2961:
	goto	l3723
u2960:
	goto	l3731
	
l1049:	
	line	1376
	
l3731:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	clrf	(??_sprintf+0)+0+1
	btfsc	(??_sprintf+0)+0,7
	decf	(??_sprintf+0)+0+1,f
	movf	1+(??_sprintf+0)+0,w
	xorlw	80h
	movwf	(??_sprintf+2)+0
	movf	(sprintf@width+1),w
	xorlw	80h
	subwf	(??_sprintf+2)+0,w
	skipz
	goto	u2975
	movf	(sprintf@width),w
	subwf	0+(??_sprintf+0)+0,w
u2975:

	skipnc
	goto	u2971
	goto	u2970
u2971:
	goto	l3735
u2970:
	line	1377
	
l3733:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	clrf	(??_sprintf+0)+0+1
	btfsc	(??_sprintf+0)+0,7
	decf	(??_sprintf+0)+0+1,f
	movf	0+(??_sprintf+0)+0,w
	subwf	(sprintf@width),f
	movf	1+(??_sprintf+0)+0,w
	skipc
	decf	(sprintf@width+1),f
	subwf	(sprintf@width+1),f
	goto	l3737
	line	1378
	
l1051:	
	line	1379
	
l3735:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(sprintf@width)
	clrf	(sprintf@width+1)
	goto	l3737
	
l1052:	
	line	1382
	
l3737:	
	btfss	(sprintf@flag),(2)&7
	goto	u2981
	goto	u2980
u2981:
	goto	l3747
u2980:
	line	1410
	
l3739:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u2991
	goto	u2990
u2991:
	goto	l3755
u2990:
	goto	l3741
	line	1411
	
l1055:	
	line	1412
	
l3741:	
	movlw	(030h)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3743:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	1413
	
l3745:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	movf	(((sprintf@width+1))),w
	iorwf	(((sprintf@width))),w
	skipz
	goto	u3001
	goto	u3000
u3001:
	goto	l3741
u3000:
	goto	l3755
	
l1056:	
	goto	l3755
	
l1054:	
	line	1415
	goto	l3755
	
l1053:	
	line	1423
	
l3747:	
	movf	(sprintf@width+1),w
	iorwf	(sprintf@width),w
	skipnz
	goto	u3011
	goto	u3010
u3011:
	goto	l3755
u3010:
	goto	l3749
	line	1424
	
l1059:	
	line	1425
	
l3749:	
	movlw	(020h)
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3751:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	line	1426
	
l3753:	
	movlw	low(-1)
	addwf	(sprintf@width),f
	skipnc
	incf	(sprintf@width+1),f
	movlw	high(-1)
	addwf	(sprintf@width+1),f
	movf	(((sprintf@width+1))),w
	iorwf	(((sprintf@width))),w
	skipz
	goto	u3021
	goto	u3020
u3021:
	goto	l3749
u3020:
	goto	l3755
	
l1060:	
	goto	l3755
	
l1058:	
	goto	l3755
	line	1464
	
l1057:	
	line	1467
	
l3755:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	movwf	(sprintf@prec)
	line	1469
	goto	l3763
	
l1062:	
	line	1497
	
l3757:	
	movf	(sprintf@prec),w
	movwf	(??_sprintf+0)+0
	addwf	(??_sprintf+0)+0,w
	addlw	low((_hexpowers-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(?___lwdiv)
	fcall	stringdir
	movwf	(?___lwdiv+1)
	movf	(sprintf@_val+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(sprintf@_val),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(0+(?___lwdiv)),w
	andlw	0Fh
	addlw	low((STR_5-__stringbase))
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+1)+0
	movf	(??_sprintf+1)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sprintf@c)
	line	1516
	
l3759:	
	movf	(sprintf@c),w
	movwf	(??_sprintf+0)+0
	movf	(sprintf@sp),w
	movwf	fsr0
	movf	(??_sprintf+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	
l3761:	
	movlw	(01h)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@sp),f
	goto	l3763
	line	1517
	
l1061:	
	line	1469
	
l3763:	
	movlw	(-1)
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	addwf	(sprintf@prec),f
	movf	((sprintf@prec)),w
	xorlw	-1
	skipz
	goto	u3031
	goto	u3030
u3031:
	goto	l3757
u3030:
	goto	l3765
	
l1063:	
	goto	l3765
	line	1525
	
l1029:	
	line	540
	
l3765:	
	movlw	01h
	addwf	(sprintf@f),f
	movlw	-01h
	addwf	(sprintf@f),w
	movwf	fsr0
	fcall	stringdir
	movwf	(??_sprintf+0)+0
	movf	(??_sprintf+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(sprintf@c)
	movf	((sprintf@c)),f
	skipz
	goto	u3041
	goto	u3040
u3041:
	goto	l3683
u3040:
	goto	l3767
	
l1064:	
	goto	l3767
	line	1527
	
l1043:	
	line	1530
	
l3767:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(sprintf@sp),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	goto	l1065
	line	1532
	
l3769:	
	line	1533
;	Return value of _sprintf is never used
	
l1065:	
	return
	opt stack 0
GLOBAL	__end_of_sprintf
	__end_of_sprintf:
;; =============== function _sprintf ends ============

	signat	_sprintf,4698
	global	_I2C_Write
psect	text353,local,class=CODE,delta=2
global __ptext353
__ptext353:

;; *************** function _I2C_Write *****************
;; Defined at:
;;		line 51 in file "C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
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
;;		_I2C_Wait
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text353
	file	"C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
	line	51
	global	__size_of_I2C_Write
	__size_of_I2C_Write	equ	__end_of_I2C_Write-_I2C_Write
	
_I2C_Write:	
	opt	stack 6
; Regs used in _I2C_Write: [wreg+status,2+status,0+pclath+cstack]
;I2C_Write@data stored from wreg
	movwf	(I2C_Write@data)
	line	52
	
l3677:	
;bitbang.c: 52: I2C_Wait();
	fcall	_I2C_Wait
	line	53
	
l3679:	
;bitbang.c: 53: SSPBUF = data;
	movf	(I2C_Write@data),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(19)	;volatile
	line	54
;bitbang.c: 54: while(!SSPIF);
	goto	l1006
	
l1007:	
	
l1006:	
	btfss	(99/8),(99)&7
	goto	u2901
	goto	u2900
u2901:
	goto	l1006
u2900:
	
l1008:	
	line	55
;bitbang.c: 55: SSPIF = 0;
	bcf	(99/8),(99)&7
	line	56
	
l1009:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Write
	__end_of_I2C_Write:
;; =============== function _I2C_Write ends ============

	signat	_I2C_Write,4216
	global	_I2C_Stop
psect	text354,local,class=CODE,delta=2
global __ptext354
__ptext354:

;; *************** function _I2C_Stop *****************
;; Defined at:
;;		line 43 in file "C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Wait
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text354
	file	"C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
	line	43
	global	__size_of_I2C_Stop
	__size_of_I2C_Stop	equ	__end_of_I2C_Stop-_I2C_Stop
	
_I2C_Stop:	
	opt	stack 6
; Regs used in _I2C_Stop: [wreg+status,2+status,0+pclath+cstack]
	line	44
	
l3673:	
;bitbang.c: 44: I2C_Wait();
	fcall	_I2C_Wait
	line	45
	
l3675:	
;bitbang.c: 45: PEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	46
	
l1000:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Stop
	__end_of_I2C_Stop:
;; =============== function _I2C_Stop ends ============

	signat	_I2C_Stop,88
	global	_I2C_Start
psect	text355,local,class=CODE,delta=2
global __ptext355
__ptext355:

;; *************** function _I2C_Start *****************
;; Defined at:
;;		line 39 in file "C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_I2C_Wait
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text355
	file	"C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
	line	39
	global	__size_of_I2C_Start
	__size_of_I2C_Start	equ	__end_of_I2C_Start-_I2C_Start
	
_I2C_Start:	
	opt	stack 6
; Regs used in _I2C_Start: [wreg+status,2+status,0+pclath+cstack]
	line	40
	
l3669:	
;bitbang.c: 40: I2C_Wait();
	fcall	_I2C_Wait
	line	41
	
l3671:	
;bitbang.c: 41: SEN = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	42
	
l997:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Start
	__end_of_I2C_Start:
;; =============== function _I2C_Start ends ============

	signat	_I2C_Start,88
	global	_UART_Write_Text
psect	text356,local,class=CODE,delta=2
global __ptext356
__ptext356:

;; *************** function _UART_Write_Text *****************
;; Defined at:
;;		line 24 in file "C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
;; Parameters:    Size  Location     Type
;;  text            2    1[COMMON] PTR const unsigned char 
;;		 -> STR_4(3), main@buf(5), STR_2(9), STR_1(23), 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_UART_Write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text356
	file	"C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
	line	24
	global	__size_of_UART_Write_Text
	__size_of_UART_Write_Text	equ	__end_of_UART_Write_Text-_UART_Write_Text
	
_UART_Write_Text:	
	opt	stack 6
; Regs used in _UART_Write_Text: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	25
	
l3661:	
;bitbang.c: 25: while(*text) UART_Write(*text++);
	goto	l3667
	
l983:	
	
l3663:	
	movf	(UART_Write_Text@text+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(UART_Write_Text@text),w
	movwf	fsr0
	fcall	stringtab
	fcall	_UART_Write
	
l3665:	
	movlw	low(01h)
	addwf	(UART_Write_Text@text),f
	skipnc
	incf	(UART_Write_Text@text+1),f
	movlw	high(01h)
	addwf	(UART_Write_Text@text+1),f
	goto	l3667
	
l982:	
	
l3667:	
	movf	(UART_Write_Text@text+1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(UART_Write_Text@text),w
	movwf	fsr0
	fcall	stringtab
	iorlw	0
	skipz
	goto	u2891
	goto	u2890
u2891:
	goto	l3663
u2890:
	goto	l985
	
l984:	
	line	26
	
l985:	
	return
	opt stack 0
GLOBAL	__end_of_UART_Write_Text
	__end_of_UART_Write_Text:
;; =============== function _UART_Write_Text ends ============

	signat	_UART_Write_Text,4216
	global	_UART_Init
psect	text357,local,class=CODE,delta=2
global __ptext357
__ptext357:

;; *************** function _UART_Init *****************
;; Defined at:
;;		line 5 in file "C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
;; Parameters:    Size  Location     Type
;;  baud            4    6[BANK0 ] long 
;; Auto vars:     Size  Location     Type
;;  x               2    9[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       4       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0      12       0       0       0
;;      Totals:         2      16       0       0       0
;;Total ram usage:       18 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___aldiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text357
	file	"C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
	line	5
	global	__size_of_UART_Init
	__size_of_UART_Init	equ	__end_of_UART_Init-_UART_Init
	
_UART_Init:	
	opt	stack 6
; Regs used in _UART_Init: [wreg+status,2+status,0+pclath+cstack]
	line	7
	
l3637:	
;bitbang.c: 6: unsigned int x;
;bitbang.c: 7: x = (3570000 - baud*64)/(baud*64);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(UART_Init@baud),w
	movwf	(??_UART_Init+0)+0
	movf	(UART_Init@baud+1),w
	movwf	((??_UART_Init+0)+0+1)
	movf	(UART_Init@baud+2),w
	movwf	((??_UART_Init+0)+0+2)
	movf	(UART_Init@baud+3),w
	movwf	((??_UART_Init+0)+0+3)
	movlw	06h
u2815:
	clrc
	rlf	(??_UART_Init+0)+0,f
	rlf	(??_UART_Init+0)+1,f
	rlf	(??_UART_Init+0)+2,f
	rlf	(??_UART_Init+0)+3,f
u2810:
	addlw	-1
	skipz
	goto	u2815
	movf	3+(??_UART_Init+0)+0,w
	movwf	(?___aldiv+3)
	movf	2+(??_UART_Init+0)+0,w
	movwf	(?___aldiv+2)
	movf	1+(??_UART_Init+0)+0,w
	movwf	(?___aldiv+1)
	movf	0+(??_UART_Init+0)+0,w
	movwf	(?___aldiv)

	movlw	050h
	movwf	((??_UART_Init+4)+0)
	movlw	079h
	movwf	((??_UART_Init+4)+0+1)
	movlw	036h
	movwf	((??_UART_Init+4)+0+2)
	movlw	0
	movwf	((??_UART_Init+4)+0+3)
	movf	(UART_Init@baud),w
	movwf	(??_UART_Init+8)+0
	movf	(UART_Init@baud+1),w
	movwf	((??_UART_Init+8)+0+1)
	movf	(UART_Init@baud+2),w
	movwf	((??_UART_Init+8)+0+2)
	movf	(UART_Init@baud+3),w
	movwf	((??_UART_Init+8)+0+3)
	movlw	06h
u2825:
	clrc
	rlf	(??_UART_Init+8)+0,f
	rlf	(??_UART_Init+8)+1,f
	rlf	(??_UART_Init+8)+2,f
	rlf	(??_UART_Init+8)+3,f
u2820:
	addlw	-1
	skipz
	goto	u2825
	comf	(??_UART_Init+8)+0,f
	comf	(??_UART_Init+8)+1,f
	comf	(??_UART_Init+8)+2,f
	comf	(??_UART_Init+8)+3,f
	incf	(??_UART_Init+8)+0,f
	skipnz
	incf	(??_UART_Init+8)+1,f
	skipnz
	incf	(??_UART_Init+8)+2,f
	skipnz
	incf	(??_UART_Init+8)+3,f
	movf	0+(??_UART_Init+8)+0,w
	addwf	(??_UART_Init+4)+0,f
	movf	1+(??_UART_Init+8)+0,w
	skipnc
	incfsz	1+(??_UART_Init+8)+0,w
	goto	u2830
	goto	u2831
u2830:
	addwf	(??_UART_Init+4)+1,f
u2831:
	movf	2+(??_UART_Init+8)+0,w
	skipnc
	incfsz	2+(??_UART_Init+8)+0,w
	goto	u2832
	goto	u2833
u2832:
	addwf	(??_UART_Init+4)+2,f
u2833:
	movf	3+(??_UART_Init+8)+0,w
	skipnc
	incf	3+(??_UART_Init+8)+0,w
	addwf	(??_UART_Init+4)+3,f
	movf	3+(??_UART_Init+4)+0,w
	movwf	3+(?___aldiv)+04h
	movf	2+(??_UART_Init+4)+0,w
	movwf	2+(?___aldiv)+04h
	movf	1+(??_UART_Init+4)+0,w
	movwf	1+(?___aldiv)+04h
	movf	0+(??_UART_Init+4)+0,w
	movwf	0+(?___aldiv)+04h

	fcall	___aldiv
	movf	1+(((0+(?___aldiv)))),w
	clrf	(UART_Init@x+1)
	addwf	(UART_Init@x+1)
	movf	0+(((0+(?___aldiv)))),w
	clrf	(UART_Init@x)
	addwf	(UART_Init@x)

	line	8
	
l3639:	
;bitbang.c: 8: if (x > 255) {
	movlw	high(0100h)
	subwf	(UART_Init@x+1),w
	movlw	low(0100h)
	skipnz
	subwf	(UART_Init@x),w
	skipc
	goto	u2841
	goto	u2840
u2841:
	goto	l3645
u2840:
	line	9
	
l3641:	
;bitbang.c: 9: x = (3570000 - baud*16)/(baud*16);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(UART_Init@baud),w
	movwf	(??_UART_Init+0)+0
	movf	(UART_Init@baud+1),w
	movwf	((??_UART_Init+0)+0+1)
	movf	(UART_Init@baud+2),w
	movwf	((??_UART_Init+0)+0+2)
	movf	(UART_Init@baud+3),w
	movwf	((??_UART_Init+0)+0+3)
	movlw	04h
u2855:
	clrc
	rlf	(??_UART_Init+0)+0,f
	rlf	(??_UART_Init+0)+1,f
	rlf	(??_UART_Init+0)+2,f
	rlf	(??_UART_Init+0)+3,f
u2850:
	addlw	-1
	skipz
	goto	u2855
	movf	3+(??_UART_Init+0)+0,w
	movwf	(?___aldiv+3)
	movf	2+(??_UART_Init+0)+0,w
	movwf	(?___aldiv+2)
	movf	1+(??_UART_Init+0)+0,w
	movwf	(?___aldiv+1)
	movf	0+(??_UART_Init+0)+0,w
	movwf	(?___aldiv)

	movlw	050h
	movwf	((??_UART_Init+4)+0)
	movlw	079h
	movwf	((??_UART_Init+4)+0+1)
	movlw	036h
	movwf	((??_UART_Init+4)+0+2)
	movlw	0
	movwf	((??_UART_Init+4)+0+3)
	movf	(UART_Init@baud),w
	movwf	(??_UART_Init+8)+0
	movf	(UART_Init@baud+1),w
	movwf	((??_UART_Init+8)+0+1)
	movf	(UART_Init@baud+2),w
	movwf	((??_UART_Init+8)+0+2)
	movf	(UART_Init@baud+3),w
	movwf	((??_UART_Init+8)+0+3)
	movlw	04h
u2865:
	clrc
	rlf	(??_UART_Init+8)+0,f
	rlf	(??_UART_Init+8)+1,f
	rlf	(??_UART_Init+8)+2,f
	rlf	(??_UART_Init+8)+3,f
u2860:
	addlw	-1
	skipz
	goto	u2865
	comf	(??_UART_Init+8)+0,f
	comf	(??_UART_Init+8)+1,f
	comf	(??_UART_Init+8)+2,f
	comf	(??_UART_Init+8)+3,f
	incf	(??_UART_Init+8)+0,f
	skipnz
	incf	(??_UART_Init+8)+1,f
	skipnz
	incf	(??_UART_Init+8)+2,f
	skipnz
	incf	(??_UART_Init+8)+3,f
	movf	0+(??_UART_Init+8)+0,w
	addwf	(??_UART_Init+4)+0,f
	movf	1+(??_UART_Init+8)+0,w
	skipnc
	incfsz	1+(??_UART_Init+8)+0,w
	goto	u2870
	goto	u2871
u2870:
	addwf	(??_UART_Init+4)+1,f
u2871:
	movf	2+(??_UART_Init+8)+0,w
	skipnc
	incfsz	2+(??_UART_Init+8)+0,w
	goto	u2872
	goto	u2873
u2872:
	addwf	(??_UART_Init+4)+2,f
u2873:
	movf	3+(??_UART_Init+8)+0,w
	skipnc
	incf	3+(??_UART_Init+8)+0,w
	addwf	(??_UART_Init+4)+3,f
	movf	3+(??_UART_Init+4)+0,w
	movwf	3+(?___aldiv)+04h
	movf	2+(??_UART_Init+4)+0,w
	movwf	2+(?___aldiv)+04h
	movf	1+(??_UART_Init+4)+0,w
	movwf	1+(?___aldiv)+04h
	movf	0+(??_UART_Init+4)+0,w
	movwf	0+(?___aldiv)+04h

	fcall	___aldiv
	movf	1+(((0+(?___aldiv)))),w
	clrf	(UART_Init@x+1)
	addwf	(UART_Init@x+1)
	movf	0+(((0+(?___aldiv)))),w
	clrf	(UART_Init@x)
	addwf	(UART_Init@x)

	line	10
	
l3643:	
;bitbang.c: 10: BRGH = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1218/8)^080h,(1218)&7
	goto	l3645
	line	11
	
l971:	
	line	12
	
l3645:	
;bitbang.c: 11: }
;bitbang.c: 12: if (x < 256) SPBRG = x;
	movlw	high(0100h)
	subwf	(UART_Init@x+1),w
	movlw	low(0100h)
	skipnz
	subwf	(UART_Init@x),w
	skipnc
	goto	u2881
	goto	u2880
u2881:
	goto	l3649
u2880:
	
l3647:	
	movf	(UART_Init@x),w
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(153)^080h	;volatile
	goto	l3649
	
l972:	
	line	13
	
l3649:	
;bitbang.c: 13: SYNC = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1220/8)^080h,(1220)&7
	line	14
	
l3651:	
;bitbang.c: 14: SPEN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(199/8),(199)&7
	line	15
	
l3653:	
;bitbang.c: 15: TRISC6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1086/8)^080h,(1086)&7
	line	16
	
l3655:	
;bitbang.c: 16: TRISC7 = 1;
	bsf	(1087/8)^080h,(1087)&7
	line	17
	
l3657:	
;bitbang.c: 17: TXEN = 1;
	bsf	(1221/8)^080h,(1221)&7
	line	18
	
l3659:	
;bitbang.c: 18: CREN = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(196/8),(196)&7
	line	19
	
l973:	
	return
	opt stack 0
GLOBAL	__end_of_UART_Init
	__end_of_UART_Init:
;; =============== function _UART_Init ends ============

	signat	_UART_Init,4216
	global	___aldiv
psect	text358,local,class=CODE,delta=2
global __ptext358
__ptext358:

;; *************** function ___aldiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\aldiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         4    0[COMMON] long 
;;  dividend        4    4[COMMON] long 
;; Auto vars:     Size  Location     Type
;;  quotient        4    2[BANK0 ] long 
;;  sign            1    1[BANK0 ] unsigned char 
;;  counter         1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    0[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         8       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       6       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_UART_Init
;; This function uses a non-reentrant model
;;
psect	text358
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\aldiv.c"
	line	5
	global	__size_of___aldiv
	__size_of___aldiv	equ	__end_of___aldiv-___aldiv
	
___aldiv:	
	opt	stack 6
; Regs used in ___aldiv: [wreg+status,2+status,0]
	line	9
	
l3595:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___aldiv@sign)
	line	10
	btfss	(___aldiv@divisor+3),7
	goto	u2711
	goto	u2710
u2711:
	goto	l3601
u2710:
	line	11
	
l3597:	
	comf	(___aldiv@divisor),f
	comf	(___aldiv@divisor+1),f
	comf	(___aldiv@divisor+2),f
	comf	(___aldiv@divisor+3),f
	incf	(___aldiv@divisor),f
	skipnz
	incf	(___aldiv@divisor+1),f
	skipnz
	incf	(___aldiv@divisor+2),f
	skipnz
	incf	(___aldiv@divisor+3),f
	line	12
	
l3599:	
	clrf	(___aldiv@sign)
	bsf	status,0
	rlf	(___aldiv@sign),f
	goto	l3601
	line	13
	
l2200:	
	line	14
	
l3601:	
	btfss	(___aldiv@dividend+3),7
	goto	u2721
	goto	u2720
u2721:
	goto	l3607
u2720:
	line	15
	
l3603:	
	comf	(___aldiv@dividend),f
	comf	(___aldiv@dividend+1),f
	comf	(___aldiv@dividend+2),f
	comf	(___aldiv@dividend+3),f
	incf	(___aldiv@dividend),f
	skipnz
	incf	(___aldiv@dividend+1),f
	skipnz
	incf	(___aldiv@dividend+2),f
	skipnz
	incf	(___aldiv@dividend+3),f
	line	16
	
l3605:	
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	xorwf	(___aldiv@sign),f
	goto	l3607
	line	17
	
l2201:	
	line	18
	
l3607:	
	movlw	0
	movwf	(___aldiv@quotient+3)
	movlw	0
	movwf	(___aldiv@quotient+2)
	movlw	0
	movwf	(___aldiv@quotient+1)
	movlw	0
	movwf	(___aldiv@quotient)

	line	19
	
l3609:	
	movf	(___aldiv@divisor+3),w
	iorwf	(___aldiv@divisor+2),w
	iorwf	(___aldiv@divisor+1),w
	iorwf	(___aldiv@divisor),w
	skipnz
	goto	u2731
	goto	u2730
u2731:
	goto	l3629
u2730:
	line	20
	
l3611:	
	clrf	(___aldiv@counter)
	bsf	status,0
	rlf	(___aldiv@counter),f
	line	21
	goto	l3615
	
l2204:	
	line	22
	
l3613:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2745:
	clrc
	rlf	(___aldiv@divisor),f
	rlf	(___aldiv@divisor+1),f
	rlf	(___aldiv@divisor+2),f
	rlf	(___aldiv@divisor+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2745
	line	23
	movlw	(01h)
	movwf	(??___aldiv+0)+0
	movf	(??___aldiv+0)+0,w
	addwf	(___aldiv@counter),f
	goto	l3615
	line	24
	
l2203:	
	line	21
	
l3615:	
	btfss	(___aldiv@divisor+3),(31)&7
	goto	u2751
	goto	u2750
u2751:
	goto	l3613
u2750:
	goto	l3617
	
l2205:	
	goto	l3617
	line	25
	
l2206:	
	line	26
	
l3617:	
	movlw	01h
	movwf	(??___aldiv+0)+0
u2765:
	clrc
	rlf	(___aldiv@quotient),f
	rlf	(___aldiv@quotient+1),f
	rlf	(___aldiv@quotient+2),f
	rlf	(___aldiv@quotient+3),f
	decfsz	(??___aldiv+0)+0
	goto	u2765
	line	27
	
l3619:	
	movf	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),w
	skipz
	goto	u2775
	movf	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),w
	skipz
	goto	u2775
	movf	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),w
	skipz
	goto	u2775
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),w
u2775:
	skipc
	goto	u2771
	goto	u2770
u2771:
	goto	l3625
u2770:
	line	28
	
l3621:	
	movf	(___aldiv@divisor),w
	subwf	(___aldiv@dividend),f
	movf	(___aldiv@divisor+1),w
	skipc
	incfsz	(___aldiv@divisor+1),w
	subwf	(___aldiv@dividend+1),f
	movf	(___aldiv@divisor+2),w
	skipc
	incfsz	(___aldiv@divisor+2),w
	subwf	(___aldiv@dividend+2),f
	movf	(___aldiv@divisor+3),w
	skipc
	incfsz	(___aldiv@divisor+3),w
	subwf	(___aldiv@dividend+3),f
	line	29
	
l3623:	
	bsf	(___aldiv@quotient)+(0/8),(0)&7
	goto	l3625
	line	30
	
l2207:	
	line	31
	
l3625:	
	movlw	01h
u2785:
	clrc
	rrf	(___aldiv@divisor+3),f
	rrf	(___aldiv@divisor+2),f
	rrf	(___aldiv@divisor+1),f
	rrf	(___aldiv@divisor),f
	addlw	-1
	skipz
	goto	u2785

	line	32
	
l3627:	
	movlw	low(01h)
	subwf	(___aldiv@counter),f
	btfss	status,2
	goto	u2791
	goto	u2790
u2791:
	goto	l3617
u2790:
	goto	l3629
	
l2208:	
	goto	l3629
	line	33
	
l2202:	
	line	34
	
l3629:	
	movf	(___aldiv@sign),w
	skipz
	goto	u2800
	goto	l3633
u2800:
	line	35
	
l3631:	
	comf	(___aldiv@quotient),f
	comf	(___aldiv@quotient+1),f
	comf	(___aldiv@quotient+2),f
	comf	(___aldiv@quotient+3),f
	incf	(___aldiv@quotient),f
	skipnz
	incf	(___aldiv@quotient+1),f
	skipnz
	incf	(___aldiv@quotient+2),f
	skipnz
	incf	(___aldiv@quotient+3),f
	goto	l3633
	
l2209:	
	line	36
	
l3633:	
	movf	(___aldiv@quotient+3),w
	movwf	(?___aldiv+3)
	movf	(___aldiv@quotient+2),w
	movwf	(?___aldiv+2)
	movf	(___aldiv@quotient+1),w
	movwf	(?___aldiv+1)
	movf	(___aldiv@quotient),w
	movwf	(?___aldiv)

	goto	l2210
	
l3635:	
	line	37
	
l2210:	
	return
	opt stack 0
GLOBAL	__end_of___aldiv
	__end_of___aldiv:
;; =============== function ___aldiv ends ============

	signat	___aldiv,8316
	global	___lwdiv
psect	text359,local,class=CODE,delta=2
global __ptext359
__ptext359:

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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text359
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 6
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l3569:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l3571:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2641
	goto	u2640
u2641:
	goto	l3591
u2640:
	line	11
	
l3573:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l3579
	
l2013:	
	line	13
	
l3575:	
	movlw	01h
	
u2655:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2655
	line	14
	
l3577:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l3579
	line	15
	
l2012:	
	line	12
	
l3579:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2661
	goto	u2660
u2661:
	goto	l3575
u2660:
	goto	l3581
	
l2014:	
	goto	l3581
	line	16
	
l2015:	
	line	17
	
l3581:	
	movlw	01h
	
u2675:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2675
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2685
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2685:
	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l3587
u2680:
	line	19
	
l3583:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l3585:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l3587
	line	21
	
l2016:	
	line	22
	
l3587:	
	movlw	01h
	
u2695:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2695
	line	23
	
l3589:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2701
	goto	u2700
u2701:
	goto	l3581
u2700:
	goto	l3591
	
l2017:	
	goto	l3591
	line	24
	
l2011:	
	line	25
	
l3591:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l2018
	
l3593:	
	line	26
	
l2018:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	___wmul
psect	text360,local,class=CODE,delta=2
global __ptext360
__ptext360:

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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text360
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\wmul.c"
	line	3
	global	__size_of___wmul
	__size_of___wmul	equ	__end_of___wmul-___wmul
	
___wmul:	
	opt	stack 6
; Regs used in ___wmul: [wreg+status,2+status,0]
	line	4
	
l3557:	
	clrf	(___wmul@product)
	clrf	(___wmul@product+1)
	goto	l3559
	line	6
	
l2005:	
	line	7
	
l3559:	
	btfss	(___wmul@multiplier),(0)&7
	goto	u2601
	goto	u2600
u2601:
	goto	l2006
u2600:
	line	8
	
l3561:	
	movf	(___wmul@multiplicand),w
	addwf	(___wmul@product),f
	skipnc
	incf	(___wmul@product+1),f
	movf	(___wmul@multiplicand+1),w
	addwf	(___wmul@product+1),f
	
l2006:	
	line	9
	movlw	01h
	
u2615:
	clrc
	rlf	(___wmul@multiplicand),f
	rlf	(___wmul@multiplicand+1),f
	addlw	-1
	skipz
	goto	u2615
	line	10
	
l3563:	
	movlw	01h
	
u2625:
	clrc
	rrf	(___wmul@multiplier+1),f
	rrf	(___wmul@multiplier),f
	addlw	-1
	skipz
	goto	u2625
	line	11
	movf	((___wmul@multiplier+1)),w
	iorwf	((___wmul@multiplier)),w
	skipz
	goto	u2631
	goto	u2630
u2631:
	goto	l3559
u2630:
	goto	l3565
	
l2007:	
	line	12
	
l3565:	
	movf	(___wmul@product+1),w
	clrf	(?___wmul+1)
	addwf	(?___wmul+1)
	movf	(___wmul@product),w
	clrf	(?___wmul)
	addwf	(?___wmul)

	goto	l2008
	
l3567:	
	line	13
	
l2008:	
	return
	opt stack 0
GLOBAL	__end_of___wmul
	__end_of___wmul:
;; =============== function ___wmul ends ============

	signat	___wmul,8314
	global	_isdigit
psect	text361,local,class=CODE,delta=2
global __ptext361
__ptext361:

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
;;		_sprintf
;; This function uses a non-reentrant model
;;
psect	text361
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.83\sources\isdigit.c"
	global	__size_of_isdigit
	__size_of_isdigit	equ	__end_of_isdigit-_isdigit
	
_isdigit:	
	opt	stack 6
; Regs used in _isdigit: [wreg+status,2+status,0]
;isdigit@c stored from wreg
	movwf	(isdigit@c)
	line	14
	
l3545:	
	clrf	(_isdigit$2245)
	
l3547:	
	movlw	(03Ah)
	subwf	(isdigit@c),w
	skipnc
	goto	u2581
	goto	u2580
u2581:
	goto	l3553
u2580:
	
l3549:	
	movlw	(030h)
	subwf	(isdigit@c),w
	skipc
	goto	u2591
	goto	u2590
u2591:
	goto	l3553
u2590:
	
l3551:	
	clrf	(_isdigit$2245)
	bsf	status,0
	rlf	(_isdigit$2245),f
	goto	l3553
	
l1995:	
	
l3553:	
	rrf	(_isdigit$2245),w
	
	goto	l1996
	
l3555:	
	line	15
	
l1996:	
	return
	opt stack 0
GLOBAL	__end_of_isdigit
	__end_of_isdigit:
;; =============== function _isdigit ends ============

	signat	_isdigit,4216
	global	_I2C_Wait
psect	text362,local,class=CODE,delta=2
global __ptext362
__ptext362:

;; *************** function _I2C_Wait *****************
;; Defined at:
;;		line 36 in file "C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
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
;;		_I2C_Start
;;		_I2C_Stop
;;		_I2C_Write
;;		_I2C_Restart
;;		_I2C_Read
;; This function uses a non-reentrant model
;;
psect	text362
	file	"C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
	line	36
	global	__size_of_I2C_Wait
	__size_of_I2C_Wait	equ	__end_of_I2C_Wait-_I2C_Wait
	
_I2C_Wait:	
	opt	stack 6
; Regs used in _I2C_Wait: [wreg+status,2]
	line	37
	
l3521:	
;bitbang.c: 37: while ((SSPCON2 & 0x1F) || (SSPSTAT & 0x04));
	goto	l3523
	
l992:	
	goto	l3523
	
l991:	
	
l3523:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(145)^080h,w
	andlw	01Fh
	btfss	status,2
	goto	u2541
	goto	u2540
u2541:
	goto	l3523
u2540:
	
l3525:	
	btfsc	(148)^080h,(2)&7
	goto	u2551
	goto	u2550
u2551:
	goto	l3523
u2550:
	goto	l994
	
l993:	
	line	38
	
l994:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Wait
	__end_of_I2C_Wait:
;; =============== function _I2C_Wait ends ============

	signat	_I2C_Wait,88
	global	_I2C_Init
psect	text363,local,class=CODE,delta=2
global __ptext363
__ptext363:

;; *************** function _I2C_Init *****************
;; Defined at:
;;		line 28 in file "C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
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
psect	text363
	file	"C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
	line	28
	global	__size_of_I2C_Init
	__size_of_I2C_Init	equ	__end_of_I2C_Init-_I2C_Init
	
_I2C_Init:	
	opt	stack 7
; Regs used in _I2C_Init: [wreg+status,2]
	line	29
	
l3515:	
;bitbang.c: 29: TRISC3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	30
;bitbang.c: 30: TRISC4 = 1;
	bsf	(1084/8)^080h,(1084)&7
	line	31
	
l3517:	
;bitbang.c: 31: SSPADD = 9;
	movlw	(09h)
	movwf	(147)^080h	;volatile
	line	32
;bitbang.c: 32: SSPSTAT = 0x80;
	movlw	(080h)
	movwf	(148)^080h	;volatile
	line	33
;bitbang.c: 33: SSPCON = 0x28;
	movlw	(028h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	34
	
l3519:	
;bitbang.c: 34: SSPCON2 = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(145)^080h	;volatile
	line	35
	
l988:	
	return
	opt stack 0
GLOBAL	__end_of_I2C_Init
	__end_of_I2C_Init:
;; =============== function _I2C_Init ends ============

	signat	_I2C_Init,88
	global	_UART_Write
psect	text364,local,class=CODE,delta=2
global __ptext364
__ptext364:

;; *************** function _UART_Write *****************
;; Defined at:
;;		line 20 in file "C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
;; Parameters:    Size  Location     Type
;;  data            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  data            1    0[COMMON] unsigned char 
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
;;		_UART_Write_Text
;; This function uses a non-reentrant model
;;
psect	text364
	file	"C:\Users\chait\Desktop\Project\Hardware I2C\bitbang.c"
	line	20
	global	__size_of_UART_Write
	__size_of_UART_Write	equ	__end_of_UART_Write-_UART_Write
	
_UART_Write:	
	opt	stack 6
; Regs used in _UART_Write: [wreg]
;UART_Write@data stored from wreg
	movwf	(UART_Write@data)
	line	21
	
l3511:	
;bitbang.c: 21: while(!TXIF);
	goto	l976
	
l977:	
	
l976:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(100/8),(100)&7
	goto	u2531
	goto	u2530
u2531:
	goto	l976
u2530:
	goto	l3513
	
l978:	
	line	22
	
l3513:	
;bitbang.c: 22: TXREG = data;
	movf	(UART_Write@data),w
	movwf	(25)	;volatile
	line	23
	
l979:	
	return
	opt stack 0
GLOBAL	__end_of_UART_Write
	__end_of_UART_Write:
;; =============== function _UART_Write ends ============

	signat	_UART_Write,4216
psect	text365,local,class=CODE,delta=2
global __ptext365
__ptext365:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
