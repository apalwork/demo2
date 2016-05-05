ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 1.



                              1 ;--------------------------------------------------------
                              2 ; File Created by SDCC : free open source ANSI-C Compiler
                              3 ; Version 3.3.0 #8604 (Oct 17 2015) (MSVC)
                              4 ; This file was generated Fri Nov 20 23:10:37 2015
                              5 ;--------------------------------------------------------
                              6 ; MST port for the MS322 series simple CPU
                              7 ;--------------------------------------------------------
                              8 ;	.file	"demo212.c"
                              9 	.module demo212
                             10 	;.list	p=MS311
                             11 	;.radix dec
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 2.



                             12 	.include "ms311sfr.def"
                              1 	.area ms322sfr (SFR,OVR)
                              2 .globl _IOR  	
                              3 .globl _IODIR	
                              4 .globl _IO	
                              5 .globl _IOWK	
                              6 .globl _IOWKDR 
                              7 .globl _TIMERC 
                              8 .globl _THRLD	
                              9 .globl _RAMP0L 
                             10 .globl _RAMP0LH
                             11 .globl _RAMP0H 
                             12 .globl _RAMP1L 
                             13 .globl _RAMP1LH
                             14 .globl _RAMP1H 
                             15 .globl _PTRCL	
                             16 .globl _PTRCH	
                             17 .globl _ROMPL 	
                             18 .globl _ROMPLH
                             19 .globl _ROMPH 	
                             20 .globl _BEEPC 	
                             21 .globl _FILTERG 	
                             22 .globl _ULAWC 	
                             23 .globl _STACKL 
                             24 .globl _STACKH 
                             25 .globl _ADCON	
                             26 .globl _DACON  
                             27 .globl _SYSC 	
                             28 .globl _SPIM	
                             29 .globl _SPIMH
                             30 .globl _SPIH	
                             31 .globl _SPIOP	
                             32 .globl _SPI_BANK
                             33 .globl _ADP_IND
                             34 .globl _ADP_VPL
                             35 .globl _ADP_VPH
                             36 .globl _ADP_VPLH
                             37 .globl _ADL	
                             38 .globl _ADH	
                             39 .globl _ZC	
                             40 .globl _ADCG	
                             41 .globl _DAC_PL	
                             42 .globl _DAC_PH 
                             43 .globl _PAG	
                             44 .globl _DMAL	
                             45 .globl _DMAH	
                             46 .globl _DMAHL
                             47 .globl _SPIL	
                             48 .globl _IOMASK 
                             49 .globl _IOCMP  
                             50 .globl _IOCNT  
                             51 .globl _LVDCON 
                             52 .globl _LVRCON 
                             53 .globl _OFFSETL
                             54 .globl _OFFSETLH
                             55 .globl _OFFSETH
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 3.



                             56 .globl _RCCON  
                             57 .globl _BGCON  
                             58 .globl _PWRL	
                             59 .globl _PWRHL	
                             60 .globl _CRYPT  
                             61 .globl _PWRH	
                             62 .globl _IROMDL 
                             63 .globl _IROMDH 
                             64 .globl _IROMDLH 
                             65 .globl _RECMUTE
                             66 .globl _SPKC
                             67 .globl _DCLAMP
                             68 .globl _SSPIC
                             69 .globl _SSPIL
                             70 .globl _SSPIM
                             71 .globl _SSPIH
                             72 ; fake registers below
                             73 .globl _RAMP0UW
                             74 .globl _RAMP1UW
                             75 .globl _ROMPUW
                             76 .globl _RAMP0	
                             77 .globl _RAMP0INC
                             78 .globl _RAMP1  
                             79 .globl _RAMP1INC
                             80 .globl _RAMP1INC2
                             81 .globl _ROMP	
                             82 .globl _ROMPINC
                             83 .globl _ROMPINC2
                             84 .globl _ACC	
                             85 .globl _ICE0
                             86 .globl _ICE1
                             87 .globl _ICE2
                             88 .globl _ICE3
                             89 .globl _ICE4
                             90 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 4.



                             13 ;--------------------------------------------------------
                             14 ; overlayable items in internal ram 
                             15 ;--------------------------------------------------------
                             16 ;	udata_ovr
                             17 	;***Area-order define***
                             18 	.area sharebank (DATA,OVR)
                             19 	.area DSEG (DATA)
                             20 	.area ISEG (DATA)
                             21 	.area XSEG (DATA)
                             22 	.area XISEG (DATA)
                             23 	.area SSEG (DATA,OVR)
                             24 ;--------------------------------------------------------
                             25 ; reset vector 
                             26 ;--------------------------------------------------------
                             27 .area STARTUP_CSEG	 (CODE)	
                             28 	.globl __ms311_cstartup
   0000 F7 F9         [ 2]   29 	jmp __ms311_cstartup
                             30 ;--------------------------------------------------------
                             31 ; code
                             32 ;--------------------------------------------------------
                             33 ;***
                             34 ;  pBlock Stats: dbName = M
                             35 ;***
                             36 ;entry:  _main:	;Function start
                             37 ; 0 exit points
                             38 ;highest stack level is: 0
                             39 ;functions called:
                             40 ;   _init
                             41 ;   _timer_routine
                             42 ;   _enter_idle_mode
                             43 ;   _enter_rec_mode
                             44 ;   _enter_play_mode
                             45 ;   _enter_amp_mode
                             46 ;   _sys_rec
                             47 ;   _sys_amp
                             48 ;   _sys_play
                             49 ;   _api_enter_dsleep_mode
                             50 ;   _api_enter_stdby_mode
                             51 ;   _key_machine
                             52 ;; Starting pCode block
   0002                      53 _main:	;Function start
                             54 ; 0 exit points
                             55 ;	.line	410; "demo212.c"	API_USE_ERC;
   0002 00 98         [ 2]   56 	LDA	#0x98
   0004 72 2F         [ 2]   57 	AND	_RCCON
   0006 60 03         [ 2]   58 	ORA	#0x03
   0008 12 2F         [ 2]   59 	STA	_RCCON
                             60 ;	.line	411; "demo212.c"	ULAWC=ULAWC_DEFAULT;
   000A 00 18         [ 2]   61 	LDA	#0x18
   000C 12 10         [ 2]   62 	STA	_ULAWC
                             63 ;	.line	412; "demo212.c"	OFFSETL=2;
   000E 00 02         [ 2]   64 	LDA	#0x02
   0010 12 2D         [ 2]   65 	STA	_OFFSETL
                             66 ;	.line	413; "demo212.c"	init();
   0012 B4 C2         [ 3]   67 	CALL	_init
                             68 ;	.line	414; "demo212.c"	if(!(init_io_state&IO_CAP) )
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 5.



   0014 00 08         [ 2]   69 	LDA	#0x08
   0016 73 00         [ 2]   70 	AND	_init_io_state
   0018 E4 0A         [ 2]   71 	JNZ	_00382_DS_
                             72 ;	.line	417; "demo212.c"	API_SPI_ERASE((USHORT)R2_STARTPAGE); // first time we erase!!
   001A B4 F9         [ 3]   73 	CALL	__COMMON_000CM_
   001C 00 01         [ 2]   74 	LDA	#0x01
   001E 12 18         [ 2]   75 	STA	_SPIOP
   0020 00 02         [ 2]   76 	LDA	#0x02
   0022 12 18         [ 2]   77 	STA	_SPIOP
   0024                      78 _00382_DS_:
                             79 ;	.line	419; "demo212.c"	IODIR=0xf0;
   0024 00 F0         [ 2]   80 	LDA	#0xf0
   0026 12 01         [ 2]   81 	STA	_IODIR
   0028                      82 _00416_DS_:
                             83 ;	.line	422; "demo212.c"	timer_routine();
   0028 B4 66         [ 3]   84 	CALL	_timer_routine
                             85 ;	.line	423; "demo212.c"	IO^=0x80;
   002A 00 80         [ 2]   86 	LDA	#0x80
   002C 82 02         [ 2]   87 	XOR	_IO
   002E 12 02         [ 2]   88 	STA	_IO
                             89 ;	.line	424; "demo212.c"	if(key_code)
   0030 03 07         [ 2]   90 	LDA	_key_code
   0032 E6 62         [ 2]   91 	JZ	_00394_DS_
                             92 ;	.line	426; "demo212.c"	if(sys_state!=SYS_IDLE)
   0034 03 05         [ 2]   93 	LDA	_sys_state
   0036 E6 04         [ 2]   94 	JZ	_00391_DS_
                             95 ;	.line	427; "demo212.c"	enter_idle_mode();
   0038 B3 3B         [ 3]   96 	CALL	_enter_idle_mode
   003A F0 93         [ 2]   97 	JMP	_00392_DS_
   003C                      98 _00391_DS_:
                             99 ;	.line	429; "demo212.c"	switch(key_code)
   003C 03 07         [ 2]  100 	LDA	_key_code
   003E E6 53         [ 2]  101 	JZ	_00392_DS_
   0040 2F            [ 2]  102 	SETB	_C
   0041 00 03         [ 2]  103 	LDA	#0x03
   0043 4B 07         [ 2]  104 	SUBB	_key_code
   0045 E0 4C         [ 2]  105 	JNC	_00392_DS_
   0047 03 07         [ 2]  106 	LDA	_key_code
   0049 CD            [ 1]  107 	DECA	
   004A B0 4C         [ 3]  108 	CALL	_00465_DS_
   004C                     109 _00465_DS_:
   004C 90            [ 1]  110 	SHL	
   004D 50 57         [ 2]  111 	ADD	#_00466_DS_
   004F 12 11         [ 2]  112 	STA	_STACKL
   0051 CE            [ 1]  113 	CLRA	
   0052 40 00         [ 2]  114 	ADDC	#>(_00466_DS_)
   0054 12 12         [ 2]  115 	STA	_STACKH
   0056 C0            [ 1]  116 	RET	
   0057                     117 _00466_DS_:
   0057 F0 61         [ 2]  118 	JMP	_00384_DS_
   0059 F0 5D         [ 2]  119 	JMP	_00383_DS_
   005B F0 91         [ 2]  120 	JMP	_00388_DS_
   005D                     121 _00383_DS_:
                            122 ;	.line	432; "demo212.c"	enter_rec_mode();
   005D B3 74         [ 3]  123 	CALL	_enter_rec_mode
                            124 ;	.line	433; "demo212.c"	break;
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 6.



   005F F0 93         [ 2]  125 	JMP	_00392_DS_
   0061                     126 _00384_DS_:
                            127 ;	.line	436; "demo212.c"	API_SPI_READ_PAGE((USHORT)R2_STARTPAGE, 1);// read prev data to 0x100
   0061 B4 F9         [ 3]  128 	CALL	__COMMON_000CM_
   0063 00 48         [ 2]  129 	LDA	#0x48
   0065 12 18         [ 2]  130 	STA	_SPIOP
                            131 ;	.line	437; "demo212.c"	if(TAG==0xff)
   0067 CE            [ 1]  132 	CLRA	
   0068 12 0D         [ 2]  133 	STA	_ROMPL
   006A 00 81         [ 2]  134 	LDA	#0x81
   006C 12 0E         [ 2]  135 	STA	_ROMPH
   006E 0E            [ 2]  136 	LDA	@_ROMPINC
   006F 80 FF         [ 2]  137 	XOR	#0xff
   0071 E4 18         [ 2]  138 	JNZ	_00386_DS_
                            139 ;	.line	439; "demo212.c"	TAG=0;
   0073 00 81         [ 2]  140 	LDA	#0x81
   0075 12 0E         [ 2]  141 	STA	_ROMPH
   0077 CE            [ 1]  142 	CLRA	
   0078 12 0D         [ 2]  143 	STA	_ROMPL
   007A 1E            [ 2]  144 	STA	@_ROMPINC
                            145 ;	.line	440; "demo212.c"	API_SPI_WRITE_PAGE((USHORT)R2_STARTPAGE,1); // write it
   007B B4 F9         [ 3]  146 	CALL	__COMMON_000CM_
   007D 00 01         [ 2]  147 	LDA	#0x01
   007F 12 18         [ 2]  148 	STA	_SPIOP
   0081 00 44         [ 2]  149 	LDA	#0x44
   0083 12 18         [ 2]  150 	STA	_SPIOP
                            151 ;	.line	441; "demo212.c"	enter_play_mode(0);
   0085 CE            [ 1]  152 	CLRA	
   0086 1C            [ 2]  153 	PUSH	
   0087 B3 F6         [ 3]  154 	CALL	_enter_play_mode
   0089 F0 93         [ 2]  155 	JMP	_00392_DS_
   008B                     156 _00386_DS_:
                            157 ;	.line	444; "demo212.c"	enter_play_mode(1);
   008B B5 04         [ 3]  158 	CALL	__COMMON_001CM_
   008D B3 F6         [ 3]  159 	CALL	_enter_play_mode
                            160 ;	.line	447; "demo212.c"	break;
   008F F0 93         [ 2]  161 	JMP	_00392_DS_
   0091                     162 _00388_DS_:
                            163 ;	.line	449; "demo212.c"	enter_amp_mode();
   0091 B0 FC         [ 3]  164 	CALL	_enter_amp_mode
   0093                     165 _00392_DS_:
                            166 ;	.line	452; "demo212.c"	key_code=0;
   0093 CE            [ 1]  167 	CLRA	
   0094 13 07         [ 2]  168 	STA	_key_code
   0096                     169 _00394_DS_:
                            170 ;	.line	455; "demo212.c"	if(sys_state==SYS_REC)
   0096 03 05         [ 2]  171 	LDA	_sys_state
   0098 80 02         [ 2]  172 	XOR	#0x02
   009A E4 0B         [ 2]  173 	JNZ	_00413_DS_
                            174 ;	.line	457; "demo212.c"	if(!sys_rec())
   009C B1 20         [ 3]  175 	CALL	_sys_rec
   009E E5 88         [ 2]  176 	JNZ	_00416_DS_
                            177 ;	.line	459; "demo212.c"	enter_play_mode(2);
   00A0 00 02         [ 2]  178 	LDA	#0x02
   00A2 1C            [ 2]  179 	PUSH	
   00A3 B3 F6         [ 3]  180 	CALL	_enter_play_mode
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 7.



   00A5 F0 28         [ 2]  181 	JMP	_00416_DS_
   00A7                     182 _00413_DS_:
                            183 ;	.line	462; "demo212.c"	else if(sys_state==SYS_AMP)
   00A7 03 05         [ 2]  184 	LDA	_sys_state
   00A9 80 03         [ 2]  185 	XOR	#0x03
   00AB E4 04         [ 2]  186 	JNZ	_00410_DS_
                            187 ;	.line	464; "demo212.c"	sys_amp();
   00AD B0 DC         [ 3]  188 	CALL	_sys_amp
   00AF F0 28         [ 2]  189 	JMP	_00416_DS_
   00B1                     190 _00410_DS_:
                            191 ;	.line	466; "demo212.c"	else if(sys_state==SYS_PLAY)
   00B1 03 05         [ 2]  192 	LDA	_sys_state
   00B3 80 01         [ 2]  193 	XOR	#0x01
   00B5 E4 04         [ 2]  194 	JNZ	_00407_DS_
                            195 ;	.line	467; "demo212.c"	sys_play();
   00B7 B3 1D         [ 3]  196 	CALL	_sys_play
   00B9 F0 28         [ 2]  197 	JMP	_00416_DS_
   00BB                     198 _00407_DS_:
                            199 ;	.line	468; "demo212.c"	else if(!sleep_timer && key_state==KEYS_NOKEY)
   00BB 03 0B         [ 2]  200 	LDA	_sleep_timer
   00BD E4 08         [ 2]  201 	JNZ	_00403_DS_
   00BF 03 04         [ 2]  202 	LDA	_key_state
   00C1 E4 04         [ 2]  203 	JNZ	_00403_DS_
                            204 ;	.line	469; "demo212.c"	api_enter_dsleep_mode();
   00C3 BB C0         [ 3]  205 	CALL	_api_enter_dsleep_mode
   00C5 F0 28         [ 2]  206 	JMP	_00416_DS_
   00C7                     207 _00403_DS_:
                            208 ;	.line	473; "demo212.c"	if(key_state)
   00C7 03 04         [ 2]  209 	LDA	_key_state
   00C9 E6 06         [ 2]  210 	JZ	_00398_DS_
                            211 ;	.line	474; "demo212.c"	api_enter_stdby_mode(0 ,0,0); // use tmr wk
   00CB B5 08         [ 3]  212 	CALL	__COMMON_002CM_
   00CD BB 48         [ 3]  213 	CALL	_api_enter_stdby_mode
   00CF F0 D5         [ 2]  214 	JMP	_00399_DS_
   00D1                     215 _00398_DS_:
                            216 ;	.line	476; "demo212.c"	api_enter_stdby_mode(IO_KEY_ALL,0,0); //use tmr+io wk
   00D1 B5 0D         [ 3]  217 	CALL	__COMMON_003CM_
   00D3 BB 48         [ 3]  218 	CALL	_api_enter_stdby_mode
   00D5                     219 _00399_DS_:
                            220 ;	.line	477; "demo212.c"	if(!TOV)
   00D5 DC            [ 1]  221 	LDC	_TOV
   00D6 E3 50         [ 2]  222 	JC	_00416_DS_
                            223 ;	.line	478; "demo212.c"	key_machine(); // wake up by IO, we get keycode first
   00D8 B4 7B         [ 3]  224 	CALL	_key_machine
   00DA F0 28         [ 2]  225 	JMP	_00416_DS_
                            226 
                            227 ;***
                            228 ;  pBlock Stats: dbName = C
                            229 ;***
                            230 ;entry:  _sys_amp:	;Function start
                            231 ; 0 exit points
                            232 ;highest stack level is: 1
                            233 ;functions called:
                            234 ;   _api_amp_start
                            235 ;   _api_enter_stdby_mode
                            236 ;; Starting pCode block
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 8.



   00DC                     237 _sys_amp:	;Function start
                            238 ; 0 exit points
                            239 ;	.line	396; "demo212.c"	if(rec_stage==0 && !beep_timer)
   00DC 03 0A         [ 2]  240 	LDA	_rec_stage
   00DE E4 0A         [ 2]  241 	JNZ	_00370_DS_
   00E0 03 09         [ 2]  242 	LDA	_beep_timer
   00E2 E4 06         [ 2]  243 	JNZ	_00370_DS_
                            244 ;	.line	398; "demo212.c"	rec_stage=1;
   00E4 00 01         [ 2]  245 	LDA	#0x01
   00E6 13 0A         [ 2]  246 	STA	_rec_stage
                            247 ;	.line	399; "demo212.c"	api_amp_start();
   00E8 B6 AB         [ 3]  248 	CALL	_api_amp_start
   00EA                     249 _00370_DS_:
                            250 ;	.line	401; "demo212.c"	if(key_state || beep_timer)
   00EA 03 04         [ 2]  251 	LDA	_key_state
   00EC E4 04         [ 2]  252 	JNZ	_00372_DS_
   00EE 03 09         [ 2]  253 	LDA	_beep_timer
   00F0 E6 04         [ 2]  254 	JZ	_00373_DS_
   00F2                     255 _00372_DS_:
                            256 ;	.line	402; "demo212.c"	api_enter_stdby_mode(0 ,0,0); // use tmr wk
   00F2 B5 08         [ 3]  257 	CALL	__COMMON_002CM_
   00F4 FB 48         [ 2]  258 	JMP	_api_enter_stdby_mode
   00F6                     259 _00373_DS_:
                            260 ;	.line	404; "demo212.c"	api_enter_stdby_mode(IO_KEY_ALL,0,1); //use IO wk
   00F6 B5 04         [ 3]  261 	CALL	__COMMON_001CM_
   00F8 B5 14         [ 3]  262 	CALL	__COMMON_004CM_
   00FA FB 48         [ 2]  263 	JMP	_api_enter_stdby_mode
                            264 
                            265 ;***
                            266 ;  pBlock Stats: dbName = C
                            267 ;***
                            268 ;entry:  _enter_amp_mode:	;Function start
                            269 ; 0 exit points
                            270 ;highest stack level is: 1
                            271 ;functions called:
                            272 ;   _api_set_vol
                            273 ;   _api_amp_prepare
                            274 ;; Starting pCode block
   00FC                     275 _enter_amp_mode:	;Function start
                            276 ; 0 exit points
                            277 ;	.line	388; "demo212.c"	api_set_vol(API_PAGV_DEFAULT,API_PLAYG_DEFAULT);
   00FC B5 1A         [ 3]  278 	CALL	__COMMON_005CM_
   00FE BB A8         [ 3]  279 	CALL	_api_set_vol
                            280 ;	.line	389; "demo212.c"	api_amp_prepare(0x3f, 0x80, 0x60, API_EN5K_ON, 0,6,callbackchk) ; // analog mode
   0100 B5 21         [ 3]  281 	CALL	__COMMON_006CM_
   0102 00 06         [ 2]  282 	LDA	#0x06
   0104 B5 28         [ 3]  283 	CALL	__COMMON_007CM_
   0106 00 10         [ 2]  284 	LDA	#0x10
   0108 1C            [ 2]  285 	PUSH	
   0109 00 60         [ 2]  286 	LDA	#0x60
   010B 1C            [ 2]  287 	PUSH	
   010C 00 80         [ 2]  288 	LDA	#0x80
   010E 1C            [ 2]  289 	PUSH	
   010F 00 3F         [ 2]  290 	LDA	#0x3f
   0111 1C            [ 2]  291 	PUSH	
   0112 B6 B0         [ 3]  292 	CALL	_api_amp_prepare
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 9.



                            293 ;	.line	390; "demo212.c"	sys_state=SYS_AMP;
   0114 00 03         [ 2]  294 	LDA	#0x03
   0116 13 05         [ 2]  295 	STA	_sys_state
                            296 ;	.line	391; "demo212.c"	rec_stage=0;
   0118 CE            [ 1]  297 	CLRA	
   0119 13 0A         [ 2]  298 	STA	_rec_stage
                            299 ;	.line	392; "demo212.c"	beep_timer=50;
   011B 00 32         [ 2]  300 	LDA	#0x32
   011D 13 09         [ 2]  301 	STA	_beep_timer
   011F C0            [ 1]  302 	RET	
                            303 
                            304 ;***
                            305 ;  pBlock Stats: dbName = C
                            306 ;***
                            307 ;entry:  _sys_rec:	;Function start
                            308 ; 2 exit points
                            309 ;highest stack level is: 1
                            310 ;has an exit
                            311 ;functions called:
                            312 ;   _enter_idle_mode
                            313 ;   _api_rec_job_no_write
                            314 ;   _api_rec_write_prev
                            315 ;   _api_rec_job_do_write
                            316 ;   _simple_speech_check
                            317 ;   _api_rec_stop
                            318 ;   _api_enter_stdby_mode
                            319 ;   _key_machine
                            320 ;; Starting pCode block
   0120                     321 _sys_rec:	;Function start
                            322 ; 2 exit points
                            323 ;	.line	300; "demo212.c"	BYTE sys_rec(void)
   0120 B5 2C         [ 3]  324 	CALL	__COMMON_008CM_
   0122 00 06         [ 2]  325 	LDA	#0x06
   0124 BC 62         [ 3]  326 	CALL	__sp_inc
                            327 ;	.line	304; "demo212.c"	if(key_code)
   0126 03 07         [ 2]  328 	LDA	_key_code
   0128 E6 06         [ 2]  329 	JZ	_00269_DS_
                            330 ;	.line	306; "demo212.c"	enter_idle_mode();
   012A B3 3B         [ 3]  331 	CALL	_enter_idle_mode
                            332 ;	.line	307; "demo212.c"	return 2; // key stop
   012C 00 02         [ 2]  333 	LDA	#0x02
   012E F2 AC         [ 2]  334 	JMP	_00298_DS_
   0130                     335 _00269_DS_:
                            336 ;	.line	309; "demo212.c"	if(rec_stage<4) // stage=0 means noise calibration
   0130 03 0A         [ 2]  337 	LDA	_rec_stage
   0132 50 FC         [ 2]  338 	ADD	#0xfc
                            339 ;	.line	312; "demo212.c"	if(api_rec_job_no_write(&the_state, &oldpwr[rindex])!=0)
   0134 E2 29         [ 2]  340 	JC	_00273_DS_
   0136 B5 31         [ 3]  341 	CALL	__COMMON_009CM_
   0138 11 03         [ 2]  342 	STA	@P1,3
   013A CE            [ 1]  343 	CLRA	
   013B 91            [ 1]  344 	ROL	
   013C 11 01         [ 2]  345 	STA	@P1,1
   013E 00 18         [ 2]  346 	LDA	#(_oldpwr + 0)
   0140 51 03         [ 2]  347 	ADD	@P1,3
   0142 11 02         [ 2]  348 	STA	@P1,2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 10.



   0144 00 80         [ 2]  349 	LDA	#> (_oldpwr + 0)
   0146 41 01         [ 2]  350 	ADDC	@P1,1
   0148 15            [ 2]  351 	STA	@_RAMP1
   0149 01 02         [ 2]  352 	LDA	@P1,2
   014B 1C            [ 2]  353 	PUSH	
   014C 05            [ 2]  354 	LDA	@_RAMP1
   014D B5 35         [ 3]  355 	CALL	__COMMON_010CM_
   014F B9 FB         [ 3]  356 	CALL	_api_rec_job_no_write
                            357 ;	.line	314; "demo212.c"	oldindex[rindex]=the_state.index;
   0151 E7 42         [ 2]  358 	JZ	_00292_DS_
   0153                     359 _00001_DS_:
   0153 B5 3D         [ 3]  360 	CALL	__COMMON_011CM_
                            361 ;	.line	315; "demo212.c"	oldpredict[rindex]=the_state.predict;
   0155 B5 31         [ 3]  362 	CALL	__COMMON_009CM_
   0157 B5 50         [ 3]  363 	CALL	__COMMON_012CM_
                            364 ;	.line	316; "demo212.c"	rec_stage++;
   0159 B5 6B         [ 3]  365 	CALL	__COMMON_013CM_
                            366 ;	.line	317; "demo212.c"	rindex++;
   015B B5 71         [ 3]  367 	CALL	__COMMON_014CM_
                            368 ;	.line	320; "demo212.c"	goto halt_rec;
   015D F2 95         [ 2]  369 	JMP	_00292_DS_
   015F                     370 _00273_DS_:
                            371 ;	.line	322; "demo212.c"	if(rec_stage==4) // compare
   015F 03 0A         [ 2]  372 	LDA	_rec_stage
   0161 80 04         [ 2]  373 	XOR	#0x04
   0163 E6 02         [ 2]  374 	JZ	_00002_DS_
   0165 F2 33         [ 2]  375 	JMP	_00279_DS_
   0167                     376 _00002_DS_:
                            377 ;	.line	324; "demo212.c"	if(api_rec_job_no_write(&the_state, &newpwr)!=0)		
   0167 00 21         [ 2]  378 	LDA	#(_newpwr + 0)
   0169 1C            [ 2]  379 	PUSH	
   016A 00 80         [ 2]  380 	LDA	#> (_newpwr + 0)
   016C B5 35         [ 3]  381 	CALL	__COMMON_010CM_
   016E B9 FB         [ 3]  382 	CALL	_api_rec_job_no_write
                            383 ;	.line	326; "demo212.c"	oldindex[rindex]=the_state.index;
   0170 E7 23         [ 2]  384 	JZ	_00292_DS_
   0172                     385 _00003_DS_:
   0172 B5 3D         [ 3]  386 	CALL	__COMMON_011CM_
                            387 ;	.line	327; "demo212.c"	oldpredict[rindex]=the_state.predict;
   0174 B5 31         [ 3]  388 	CALL	__COMMON_009CM_
   0176 B5 50         [ 3]  389 	CALL	__COMMON_012CM_
                            390 ;	.line	328; "demo212.c"	pwravg = (oldpwr[0]>>2)+(oldpwr[1]>>2)+(oldpwr[2]>>2)+(oldpwr[3]>>2);
   0178 03 19         [ 2]  391 	LDA	(_oldpwr + 1)
   017A 92            [ 1]  392 	SHR	
   017B 15            [ 2]  393 	STA	@_RAMP1
   017C 03 18         [ 2]  394 	LDA	_oldpwr
   017E 93            [ 1]  395 	ROR	
   017F 11 02         [ 2]  396 	STA	@P1,2
   0181 05            [ 2]  397 	LDA	@_RAMP1
   0182 92            [ 1]  398 	SHR	
   0183 15            [ 2]  399 	STA	@_RAMP1
   0184 01 02         [ 2]  400 	LDA	@P1,2
   0186 93            [ 1]  401 	ROR	
   0187 11 02         [ 2]  402 	STA	@P1,2
   0189 03 1B         [ 2]  403 	LDA	(_oldpwr + 3)
   018B B5 7B         [ 3]  404 	CALL	__COMMON_015CM_
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 11.



   018D 03 1A         [ 2]  405 	LDA	(_oldpwr + 2)
   018F B5 7F         [ 3]  406 	CALL	__COMMON_016CM_
   0191 B5 7B         [ 3]  407 	CALL	__COMMON_015CM_
   0193 B5 85         [ 3]  408 	CALL	__COMMON_017CM_
   0195 03 1D         [ 2]  409 	LDA	(_oldpwr + 5)
   0197 B5 7B         [ 3]  410 	CALL	__COMMON_015CM_
   0199 03 1C         [ 2]  411 	LDA	(_oldpwr + 4)
   019B B5 7F         [ 3]  412 	CALL	__COMMON_016CM_
   019D B5 7B         [ 3]  413 	CALL	__COMMON_015CM_
   019F B5 85         [ 3]  414 	CALL	__COMMON_017CM_
   01A1 03 1F         [ 2]  415 	LDA	(_oldpwr + 7)
   01A3 B5 7B         [ 3]  416 	CALL	__COMMON_015CM_
   01A5 03 1E         [ 2]  417 	LDA	(_oldpwr + 6)
   01A7 B5 7F         [ 3]  418 	CALL	__COMMON_016CM_
   01A9 B5 7B         [ 3]  419 	CALL	__COMMON_015CM_
   01AB 01 03         [ 2]  420 	LDA	@P1,3
   01AD 93            [ 1]  421 	ROR	
   01AE 51 02         [ 2]  422 	ADD	@P1,2
   01B0 13 23         [ 2]  423 	STA	_pwravg
   01B2 05            [ 2]  424 	LDA	@_RAMP1
   01B3 41 01         [ 2]  425 	ADDC	@P1,1
   01B5 13 24         [ 2]  426 	STA	(_pwravg + 1)
                            427 ;	.line	329; "demo212.c"	oldpwr[rindex]=newpwr;
   01B7 B5 31         [ 3]  428 	CALL	__COMMON_009CM_
   01B9 11 02         [ 2]  429 	STA	@P1,2
   01BB CE            [ 1]  430 	CLRA	
   01BC 91            [ 1]  431 	ROL	
   01BD 15            [ 2]  432 	STA	@_RAMP1
   01BE 00 18         [ 2]  433 	LDA	#(_oldpwr + 0)
   01C0 51 02         [ 2]  434 	ADD	@P1,2
   01C2 11 04         [ 2]  435 	STA	@P1,4
   01C4 00 80         [ 2]  436 	LDA	#> (_oldpwr + 0)
   01C6 45            [ 2]  437 	ADDC	@_RAMP1
   01C7 12 0E         [ 2]  438 	STA	_ROMPH
   01C9 01 04         [ 2]  439 	LDA	@P1,4
   01CB B5 91         [ 3]  440 	CALL	__COMMON_018CM_
                            441 ;	.line	337; "demo212.c"	rindex++;
   01CD B5 71         [ 3]  442 	CALL	__COMMON_014CM_
                            443 ;	.line	339; "demo212.c"	if(newpwr>=((pwravg<<1)+20))
   01CF 03 23         [ 2]  444 	LDA	_pwravg
   01D1 90            [ 1]  445 	SHL	
   01D2 11 04         [ 2]  446 	STA	@P1,4
   01D4 03 24         [ 2]  447 	LDA	(_pwravg + 1)
   01D6 91            [ 1]  448 	ROL	
   01D7 11 05         [ 2]  449 	STA	@P1,5
   01D9 00 14         [ 2]  450 	LDA	#0x14
   01DB 51 04         [ 2]  451 	ADD	@P1,4
   01DD 11 04         [ 2]  452 	STA	@P1,4
   01DF CE            [ 1]  453 	CLRA	
   01E0 41 05         [ 2]  454 	ADDC	@P1,5
   01E2 11 05         [ 2]  455 	STA	@P1,5
   01E4 2F            [ 2]  456 	SETB	_C
   01E5 03 21         [ 2]  457 	LDA	_newpwr
   01E7 49 04         [ 2]  458 	SUBB	@P1,4
   01E9 03 22         [ 2]  459 	LDA	(_newpwr + 1)
   01EB 49 05         [ 2]  460 	SUBB	@P1,5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 12.



   01ED E0 A6         [ 2]  461 	JNC	_00292_DS_
                            462 ;	.line	342; "demo212.c"	api_rec_write_prev(1); // 1 means previous 1 frame installed
   01EF B5 04         [ 3]  463 	CALL	__COMMON_001CM_
   01F1 B9 BC         [ 3]  464 	CALL	_api_rec_write_prev
                            465 ;	.line	343; "demo212.c"	k=rindex-2;
   01F3 00 FE         [ 2]  466 	LDA	#0xfe
   01F5 53 20         [ 2]  467 	ADD	_rindex
   01F7 70 03         [ 2]  468 	AND	#0x03
                            469 ;	.line	345; "demo212.c"	the_state.index=oldindex[k]; // the state for playing
   01F9 11 04         [ 2]  470 	STA	@P1,4
   01FB 50 0C         [ 2]  471 	ADD	#(_oldindex + 0)
   01FD 11 05         [ 2]  472 	STA	@P1,5
   01FF CE            [ 1]  473 	CLRA	
   0200 40 80         [ 2]  474 	ADDC	#> (_oldindex + 0)
   0202 B5 9A         [ 3]  475 	CALL	__COMMON_019CM_
   0204 13 2C         [ 2]  476 	STA	(_the_state + 2)
                            477 ;	.line	346; "demo212.c"	the_state.predict=oldpredict[k];
   0206 01 04         [ 2]  478 	LDA	@P1,4
   0208 90            [ 1]  479 	SHL	
   0209 11 04         [ 2]  480 	STA	@P1,4
   020B CE            [ 1]  481 	CLRA	
   020C 91            [ 1]  482 	ROL	
   020D 15            [ 2]  483 	STA	@_RAMP1
   020E 00 10         [ 2]  484 	LDA	#(_oldpredict + 0)
   0210 51 04         [ 2]  485 	ADD	@P1,4
   0212 11 05         [ 2]  486 	STA	@P1,5
   0214 00 80         [ 2]  487 	LDA	#> (_oldpredict + 0)
   0216 45            [ 2]  488 	ADDC	@_RAMP1
   0217 B5 9A         [ 3]  489 	CALL	__COMMON_019CM_
   0219 11 04         [ 2]  490 	STA	@P1,4
   021B 0E            [ 2]  491 	LDA	@_ROMPINC
   021C 15            [ 2]  492 	STA	@_RAMP1
   021D 01 04         [ 2]  493 	LDA	@P1,4
   021F 13 2A         [ 2]  494 	STA	_the_state
   0221 05            [ 2]  495 	LDA	@_RAMP1
   0222 13 2B         [ 2]  496 	STA	(_the_state + 1)
                            497 ;	.line	347; "demo212.c"	rec_stage++;
   0224 B5 6B         [ 3]  498 	CALL	__COMMON_013CM_
                            499 ;	.line	348; "demo212.c"	pwravg+=5; //  a shift
   0226 00 05         [ 2]  500 	LDA	#0x05
   0228 53 23         [ 2]  501 	ADD	_pwravg
   022A 13 23         [ 2]  502 	STA	_pwravg
   022C CE            [ 1]  503 	CLRA	
   022D 43 24         [ 2]  504 	ADDC	(_pwravg + 1)
   022F 13 24         [ 2]  505 	STA	(_pwravg + 1)
                            506 ;	.line	351; "demo212.c"	goto halt_rec;
   0231 F2 95         [ 2]  507 	JMP	_00292_DS_
   0233                     508 _00279_DS_:
                            509 ;	.line	354; "demo212.c"	i= api_rec_job_do_write(&newpwr,&new_end_page);
   0233 00 28         [ 2]  510 	LDA	#(_new_end_page + 0)
   0235 1C            [ 2]  511 	PUSH	
   0236 00 80         [ 2]  512 	LDA	#> (_new_end_page + 0)
   0238 1C            [ 2]  513 	PUSH	
   0239 00 21         [ 2]  514 	LDA	#(_newpwr + 0)
   023B 1C            [ 2]  515 	PUSH	
   023C 00 80         [ 2]  516 	LDA	#> (_newpwr + 0)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 13.



   023E 1C            [ 2]  517 	PUSH	
   023F B9 23         [ 3]  518 	CALL	_api_rec_job_do_write
                            519 ;	.line	355; "demo212.c"	if(i==1)
   0241 11 04         [ 2]  520 	STA	@P1,4
   0243 80 01         [ 2]  521 	XOR	#0x01
                            522 ;	.line	358; "demo212.c"	oldpwr[rindex]=newpwr;
   0245 E6 4E         [ 2]  523 	JZ	_00292_DS_
   0247 B5 31         [ 3]  524 	CALL	__COMMON_009CM_
   0249 15            [ 2]  525 	STA	@_RAMP1
   024A CE            [ 1]  526 	CLRA	
   024B 91            [ 1]  527 	ROL	
   024C 11 03         [ 2]  528 	STA	@P1,3
   024E 00 18         [ 2]  529 	LDA	#(_oldpwr + 0)
   0250 55            [ 2]  530 	ADD	@_RAMP1
   0251 11 05         [ 2]  531 	STA	@P1,5
   0253 00 80         [ 2]  532 	LDA	#> (_oldpwr + 0)
   0255 41 03         [ 2]  533 	ADDC	@P1,3
   0257 12 0E         [ 2]  534 	STA	_ROMPH
   0259 01 05         [ 2]  535 	LDA	@P1,5
   025B B5 91         [ 3]  536 	CALL	__COMMON_018CM_
                            537 ;	.line	359; "demo212.c"	rindex++;
   025D B5 71         [ 3]  538 	CALL	__COMMON_014CM_
                            539 ;	.line	362; "demo212.c"	if(rec_stage<9)
   025F 03 0A         [ 2]  540 	LDA	_rec_stage
   0261 50 F7         [ 2]  541 	ADD	#0xf7
                            542 ;	.line	363; "demo212.c"	rec_stage++;
   0263 E2 04         [ 2]  543 	JC	_00290_DS_
   0265 B5 6B         [ 3]  544 	CALL	__COMMON_013CM_
   0267 F2 95         [ 2]  545 	JMP	_00292_DS_
   0269                     546 _00290_DS_:
                            547 ;	.line	364; "demo212.c"	else if( i==0 || (i==2 && rec_stage==9 && simple_speech_check()==0))
   0269 01 04         [ 2]  548 	LDA	@P1,4
   026B E6 0E         [ 2]  549 	JZ	_00284_DS_
   026D 80 02         [ 2]  550 	XOR	#0x02
   026F E4 24         [ 2]  551 	JNZ	_00292_DS_
   0271 03 0A         [ 2]  552 	LDA	_rec_stage
   0273 80 09         [ 2]  553 	XOR	#0x09
   0275 E4 1E         [ 2]  554 	JNZ	_00292_DS_
   0277 B2 B7         [ 3]  555 	CALL	_simple_speech_check
   0279 E4 1A         [ 2]  556 	JNZ	_00292_DS_
   027B                     557 _00284_DS_:
                            558 ;	.line	366; "demo212.c"	if(i==2)
   027B 01 04         [ 2]  559 	LDA	@P1,4
   027D 80 02         [ 2]  560 	XOR	#0x02
   027F E4 0B         [ 2]  561 	JNZ	_00283_DS_
                            562 ;	.line	367; "demo212.c"	new_end_page--; // sub1 is generally OK
   0281 03 28         [ 2]  563 	LDA	_new_end_page
   0283 CD            [ 1]  564 	DECA	
   0284 13 28         [ 2]  565 	STA	_new_end_page
   0286 00 FF         [ 2]  566 	LDA	#0xff
   0288 43 29         [ 2]  567 	ADDC	(_new_end_page + 1)
   028A 13 29         [ 2]  568 	STA	(_new_end_page + 1)
   028C                     569 _00283_DS_:
                            570 ;	.line	368; "demo212.c"	api_rec_stop(0);
   028C CE            [ 1]  571 	CLRA	
   028D 1C            [ 2]  572 	PUSH	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 14.



   028E B5 B3         [ 3]  573 	CALL	_api_rec_stop
                            574 ;	.line	369; "demo212.c"	sys_state=SYS_IDLE;
   0290 CE            [ 1]  575 	CLRA	
                            576 ;	.line	370; "demo212.c"	return 0; // 0 means finish;
   0291 13 05         [ 2]  577 	STA	_sys_state
   0293 F2 AC         [ 2]  578 	JMP	_00298_DS_
   0295                     579 _00292_DS_:
                            580 ;	.line	374; "demo212.c"	if(!key_state)
   0295 03 04         [ 2]  581 	LDA	_key_state
   0297 E4 08         [ 2]  582 	JNZ	_00294_DS_
                            583 ;	.line	375; "demo212.c"	api_enter_stdby_mode(IO_KEY_ALL,0,1);
   0299 B5 04         [ 3]  584 	CALL	__COMMON_001CM_
   029B B5 14         [ 3]  585 	CALL	__COMMON_004CM_
   029D BB 48         [ 3]  586 	CALL	_api_enter_stdby_mode
   029F F2 A5         [ 2]  587 	JMP	_00295_DS_
   02A1                     588 _00294_DS_:
                            589 ;	.line	377; "demo212.c"	api_enter_stdby_mode(0,0,0);
   02A1 B5 08         [ 3]  590 	CALL	__COMMON_002CM_
   02A3 BB 48         [ 3]  591 	CALL	_api_enter_stdby_mode
   02A5                     592 _00295_DS_:
                            593 ;	.line	378; "demo212.c"	if(!TOV)
   02A5 DC            [ 1]  594 	LDC	_TOV
   02A6 E2 02         [ 2]  595 	JC	_00297_DS_
                            596 ;	.line	379; "demo212.c"	key_machine();
   02A8 B4 7B         [ 3]  597 	CALL	_key_machine
   02AA                     598 _00297_DS_:
                            599 ;	.line	380; "demo212.c"	return 1;
   02AA 00 01         [ 2]  600 	LDA	#0x01
   02AC                     601 _00298_DS_:
   02AC 12 0B         [ 2]  602 	STA	_PTRCL
   02AE 00 FA         [ 2]  603 	LDA	#0xFA
   02B0 BB 9B         [ 3]  604 	CALL	__sp_dec
   02B2 B5 A6         [ 3]  605 	CALL	__COMMON_020CM_
   02B4 02 0B         [ 2]  606 	LDA	_PTRCL
   02B6 C0            [ 1]  607 	RET	
                            608 ;; end of function sys_rec
                            609 ; exit point of _sys_rec
                            610 
                            611 ;***
                            612 ;  pBlock Stats: dbName = C
                            613 ;***
                            614 ;entry:  _simple_speech_check:	;Function start
                            615 ; 2 exit points
                            616 ;highest stack level is: 2
                            617 ;has an exit
                            618 ;; Starting pCode block
   02B7                     619 _simple_speech_check:	;Function start
                            620 ; 2 exit points
                            621 ;	.line	287; "demo212.c"	BYTE simple_speech_check(void) // if 4 frame power no change (lot)
   02B7 B5 2C         [ 3]  622 	CALL	__COMMON_008CM_
   02B9 00 05         [ 2]  623 	LDA	#0x05
   02BB BC 62         [ 3]  624 	CALL	__sp_inc
                            625 ;	.line	292; "demo212.c"	for(i=0;i<4;i++)
   02BD CE            [ 1]  626 	CLRA	
   02BE 11 03         [ 2]  627 	STA	@P1,3
   02C0                     628 _00244_DS_:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 15.



                            629 ;	.line	294; "demo212.c"	j=oldpwr[i];
   02C0 01 03         [ 2]  630 	LDA	@P1,3
   02C2 90            [ 1]  631 	SHL	
   02C3 11 01         [ 2]  632 	STA	@P1,1
   02C5 CE            [ 1]  633 	CLRA	
   02C6 91            [ 1]  634 	ROL	
   02C7 11 02         [ 2]  635 	STA	@P1,2
   02C9 00 18         [ 2]  636 	LDA	#(_oldpwr + 0)
   02CB 51 01         [ 2]  637 	ADD	@P1,1
   02CD 15            [ 2]  638 	STA	@_RAMP1
   02CE 00 80         [ 2]  639 	LDA	#> (_oldpwr + 0)
   02D0 41 02         [ 2]  640 	ADDC	@P1,2
   02D2 11 04         [ 2]  641 	STA	@P1,4
   02D4 05            [ 2]  642 	LDA	@_RAMP1
   02D5 12 0D         [ 2]  643 	STA	_ROMPL
   02D7 01 04         [ 2]  644 	LDA	@P1,4
   02D9 12 0E         [ 2]  645 	STA	_ROMPH
   02DB 0E            [ 2]  646 	LDA	@_ROMPINC
   02DC 11 01         [ 2]  647 	STA	@P1,1
   02DE 0E            [ 2]  648 	LDA	@_ROMPINC
                            649 ;	.line	295; "demo212.c"	if((j-(j>>3))>pwravg) // here must use > not >=, incase 0
   02DF 11 02         [ 2]  650 	STA	@P1,2
   02E1 92            [ 1]  651 	SHR	
   02E2 11 04         [ 2]  652 	STA	@P1,4
   02E4 01 01         [ 2]  653 	LDA	@P1,1
   02E6 B5 AA         [ 3]  654 	CALL	__COMMON_021CM_
   02E8 B5 AA         [ 3]  655 	CALL	__COMMON_021CM_
   02EA 93            [ 1]  656 	ROR	
   02EB 15            [ 2]  657 	STA	@_RAMP1
   02EC 2F            [ 2]  658 	SETB	_C
   02ED 01 01         [ 2]  659 	LDA	@P1,1
   02EF 49 00         [ 2]  660 	SUBB	@P1,0
   02F1 11 01         [ 2]  661 	STA	@P1,1
   02F3 01 02         [ 2]  662 	LDA	@P1,2
   02F5 49 04         [ 2]  663 	SUBB	@P1,4
   02F7 11 02         [ 2]  664 	STA	@P1,2
   02F9 2F            [ 2]  665 	SETB	_C
   02FA 03 23         [ 2]  666 	LDA	_pwravg
   02FC 49 01         [ 2]  667 	SUBB	@P1,1
   02FE 03 24         [ 2]  668 	LDA	(_pwravg + 1)
   0300 49 02         [ 2]  669 	SUBB	@P1,2
                            670 ;	.line	296; "demo212.c"	return 1;
   0302 E2 04         [ 2]  671 	JC	_00245_DS_
   0304 00 01         [ 2]  672 	LDA	#0x01
   0306 F3 12         [ 2]  673 	JMP	_00246_DS_
   0308                     674 _00245_DS_:
                            675 ;	.line	292; "demo212.c"	for(i=0;i<4;i++)
   0308 01 03         [ 2]  676 	LDA	@P1,3
   030A CC            [ 1]  677 	INCA	
   030B 11 03         [ 2]  678 	STA	@P1,3
   030D 50 FC         [ 2]  679 	ADD	#0xfc
   030F E1 AF         [ 2]  680 	JNC	_00244_DS_
                            681 ;	.line	298; "demo212.c"	return 0;
   0311 CE            [ 1]  682 	CLRA	
   0312                     683 _00246_DS_:
   0312 12 0B         [ 2]  684 	STA	_PTRCL
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 16.



   0314 00 FB         [ 2]  685 	LDA	#0xFB
   0316 BB 9B         [ 3]  686 	CALL	__sp_dec
   0318 B5 A6         [ 3]  687 	CALL	__COMMON_020CM_
   031A 02 0B         [ 2]  688 	LDA	_PTRCL
   031C C0            [ 1]  689 	RET	
                            690 ;; end of function simple_speech_check
                            691 ; exit point of _simple_speech_check
                            692 
                            693 ;***
                            694 ;  pBlock Stats: dbName = C
                            695 ;***
                            696 ;entry:  _sys_play:	;Function start
                            697 ; 0 exit points
                            698 ;highest stack level is: 1
                            699 ;functions called:
                            700 ;   _api_play_job
                            701 ;   _api_play_stop
                            702 ;   _enter_rec_mode
                            703 ;   _enter_idle_mode
                            704 ;   _api_enter_stdby_mode
                            705 ;; Starting pCode block
   031D                     706 _sys_play:	;Function start
                            707 ; 0 exit points
                            708 ;	.line	260; "demo212.c"	if(!api_play_job())
   031D BA 58         [ 3]  709 	CALL	_api_play_job
   031F E4 0C         [ 2]  710 	JNZ	_00234_DS_
                            711 ;	.line	263; "demo212.c"	if(playing_seg==2)
   0321 03 2D         [ 2]  712 	LDA	_playing_seg
   0323 80 02         [ 2]  713 	XOR	#0x02
   0325 E4 04         [ 2]  714 	JNZ	_00228_DS_
                            715 ;	.line	265; "demo212.c"	api_play_stop();
   0327 BB 2E         [ 3]  716 	CALL	_api_play_stop
                            717 ;	.line	266; "demo212.c"	enter_rec_mode();
   0329 F3 74         [ 2]  718 	JMP	_enter_rec_mode
   032B                     719 _00228_DS_:
                            720 ;	.line	269; "demo212.c"	enter_idle_mode();
   032B F3 3B         [ 2]  721 	JMP	_enter_idle_mode
   032D                     722 _00234_DS_:
                            723 ;	.line	273; "demo212.c"	if(key_state==KEYS_NOKEY)
   032D 03 04         [ 2]  724 	LDA	_key_state
   032F E4 06         [ 2]  725 	JNZ	_00231_DS_
                            726 ;	.line	276; "demo212.c"	api_enter_stdby_mode(IO_KEY_ALL, 0, 1);
   0331 B5 04         [ 3]  727 	CALL	__COMMON_001CM_
   0333 B5 14         [ 3]  728 	CALL	__COMMON_004CM_
   0335 FB 48         [ 2]  729 	JMP	_api_enter_stdby_mode
   0337                     730 _00231_DS_:
                            731 ;	.line	279; "demo212.c"	api_enter_stdby_mode(0,0,0);
   0337 B5 08         [ 3]  732 	CALL	__COMMON_002CM_
   0339 FB 48         [ 2]  733 	JMP	_api_enter_stdby_mode
                            734 
                            735 ;***
                            736 ;  pBlock Stats: dbName = C
                            737 ;***
                            738 ;entry:  _enter_idle_mode:	;Function start
                            739 ; 0 exit points
                            740 ;highest stack level is: 2
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 17.



                            741 ;functions called:
                            742 ;   _api_amp_stop
                            743 ;   _api_play_stop
                            744 ;   _api_rec_stop
                            745 ;   _api_beep_start
                            746 ;   _wait_beep
                            747 ;   _api_beep_stop
                            748 ;; Starting pCode block
   033B                     749 _enter_idle_mode:	;Function start
                            750 ; 0 exit points
                            751 ;	.line	238; "demo212.c"	if(sys_state==SYS_AMP)
   033B 03 05         [ 2]  752 	LDA	_sys_state
   033D 80 03         [ 2]  753 	XOR	#0x03
   033F E4 02         [ 2]  754 	JNZ	_00220_DS_
                            755 ;	.line	239; "demo212.c"	api_amp_stop();
   0341 B6 A5         [ 3]  756 	CALL	_api_amp_stop
   0343                     757 _00220_DS_:
                            758 ;	.line	240; "demo212.c"	api_play_stop();
   0343 BB 2E         [ 3]  759 	CALL	_api_play_stop
                            760 ;	.line	242; "demo212.c"	if(sys_state==SYS_REC) // stop from recording
   0345 03 05         [ 2]  761 	LDA	_sys_state
   0347 80 02         [ 2]  762 	XOR	#0x02
   0349 E4 21         [ 2]  763 	JNZ	_00222_DS_
                            764 ;	.line	244; "demo212.c"	api_rec_stop(1); // it will add endcode here
   034B B5 04         [ 3]  765 	CALL	__COMMON_001CM_
   034D B5 B3         [ 3]  766 	CALL	_api_rec_stop
                            767 ;	.line	246; "demo212.c"	api_beep_start(NORMAL_BEEP);
   034F 00 14         [ 2]  768 	LDA	#0x14
   0351 1C            [ 2]  769 	PUSH	
   0352 BB 7A         [ 3]  770 	CALL	_api_beep_start
                            771 ;	.line	247; "demo212.c"	wait_beep(BEEP_TIME2);
   0354 00 20         [ 2]  772 	LDA	#0x20
   0356 1C            [ 2]  773 	PUSH	
   0357 B3 D6         [ 3]  774 	CALL	_wait_beep
                            775 ;	.line	248; "demo212.c"	api_beep_stop();
   0359 BB 74         [ 3]  776 	CALL	_api_beep_stop
                            777 ;	.line	249; "demo212.c"	wait_beep(BEEP_TIME2);
   035B 00 20         [ 2]  778 	LDA	#0x20
   035D 1C            [ 2]  779 	PUSH	
   035E B3 D6         [ 3]  780 	CALL	_wait_beep
                            781 ;	.line	250; "demo212.c"	api_beep_start(NORMAL_BEEP);
   0360 00 14         [ 2]  782 	LDA	#0x14
   0362 1C            [ 2]  783 	PUSH	
   0363 BB 7A         [ 3]  784 	CALL	_api_beep_start
                            785 ;	.line	251; "demo212.c"	wait_beep(BEEP_TIME2);
   0365 00 20         [ 2]  786 	LDA	#0x20
   0367 1C            [ 2]  787 	PUSH	
   0368 B3 D6         [ 3]  788 	CALL	_wait_beep
                            789 ;	.line	252; "demo212.c"	api_beep_stop();
   036A BB 74         [ 3]  790 	CALL	_api_beep_stop
   036C                     791 _00222_DS_:
                            792 ;	.line	254; "demo212.c"	sys_state=SYS_IDLE;
   036C CE            [ 1]  793 	CLRA	
   036D 13 05         [ 2]  794 	STA	_sys_state
                            795 ;	.line	255; "demo212.c"	sleep_timer=KEY_WAIT;
   036F 00 05         [ 2]  796 	LDA	#0x05
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 18.



   0371 13 0B         [ 2]  797 	STA	_sleep_timer
   0373 C0            [ 1]  798 	RET	
                            799 
                            800 ;***
                            801 ;  pBlock Stats: dbName = C
                            802 ;***
                            803 ;entry:  _enter_rec_mode:	;Function start
                            804 ; 0 exit points
                            805 ;highest stack level is: 2
                            806 ;functions called:
                            807 ;   _api_rec_prepare
                            808 ;   _wait_beep
                            809 ;   _api_rec_stop
                            810 ;   _api_rec_start
                            811 ;; Starting pCode block
   0374                     812 _enter_rec_mode:	;Function start
                            813 ; 0 exit points
                            814 ;	.line	201; "demo212.c"	key_code=0;
   0374 CE            [ 1]  815 	CLRA	
                            816 ;	.line	213; "demo212.c"	API_EN5K_OFF
   0375 13 07         [ 2]  817 	STA	_key_code
   0377 1C            [ 2]  818 	PUSH	
   0378 00 F2         [ 2]  819 	LDA	#0xf2
   037A B5 28         [ 3]  820 	CALL	__COMMON_007CM_
   037C B6 6B         [ 3]  821 	CALL	_api_rec_prepare
                            822 ;	.line	215; "demo212.c"	THRLD=0; // slower clock
   037E CE            [ 1]  823 	CLRA	
   037F 12 06         [ 2]  824 	STA	_THRLD
                            825 ;	.line	216; "demo212.c"	wait_beep(REC_WAIT_TIME);
   0381 00 07         [ 2]  826 	LDA	#0x07
   0383 1C            [ 2]  827 	PUSH	
   0384 B3 D6         [ 3]  828 	CALL	_wait_beep
                            829 ;	.line	217; "demo212.c"	THRLD=TMR_RLD;
   0386 00 E0         [ 2]  830 	LDA	#0xe0
   0388 12 06         [ 2]  831 	STA	_THRLD
                            832 ;	.line	218; "demo212.c"	if(key_code)
   038A 03 07         [ 2]  833 	LDA	_key_code
   038C E6 04         [ 2]  834 	JZ	_00211_DS_
                            835 ;	.line	220; "demo212.c"	api_rec_stop(0);
   038E CE            [ 1]  836 	CLRA	
   038F 1C            [ 2]  837 	PUSH	
                            838 ;	.line	221; "demo212.c"	return;	
   0390 F5 B3         [ 2]  839 	JMP	_api_rec_stop
   0392                     840 _00211_DS_:
                            841 ;	.line	225; "demo212.c"	R3_STARTPAGE,R3_ENDPAGE,callbackchk))
   0392 B5 21         [ 3]  842 	CALL	__COMMON_006CM_
   0394 CE            [ 1]  843 	CLRA	
   0395 1C            [ 2]  844 	PUSH	
   0396 00 02         [ 2]  845 	LDA	#0x02
   0398 1C            [ 2]  846 	PUSH	
   0399 00 90         [ 2]  847 	LDA	#0x90
   039B B5 28         [ 3]  848 	CALL	__COMMON_007CM_
   039D 1C            [ 2]  849 	PUSH	
   039E 00 D0         [ 2]  850 	LDA	#0xd0
   03A0 1C            [ 2]  851 	PUSH	
   03A1 00 FF         [ 2]  852 	LDA	#0xff
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 19.



   03A3 1C            [ 2]  853 	PUSH	
   03A4 B5 ED         [ 3]  854 	CALL	_api_rec_start
   03A6 E4 04         [ 2]  855 	JNZ	_00213_DS_
                            856 ;	.line	227; "demo212.c"	api_rec_stop(0);
   03A8 CE            [ 1]  857 	CLRA	
   03A9 1C            [ 2]  858 	PUSH	
                            859 ;	.line	228; "demo212.c"	return;		
   03AA F5 B3         [ 2]  860 	JMP	_api_rec_stop
   03AC                     861 _00213_DS_:
                            862 ;	.line	230; "demo212.c"	sys_state=SYS_REC;
   03AC 00 02         [ 2]  863 	LDA	#0x02
   03AE 13 05         [ 2]  864 	STA	_sys_state
                            865 ;	.line	231; "demo212.c"	rec_stage=0;
   03B0 CE            [ 1]  866 	CLRA	
                            867 ;	.line	232; "demo212.c"	rindex=0;
   03B1 13 0A         [ 2]  868 	STA	_rec_stage
   03B3 13 20         [ 2]  869 	STA	_rindex
   03B5 C0            [ 1]  870 	RET	
                            871 
                            872 ;***
                            873 ;  pBlock Stats: dbName = C
                            874 ;***
                            875 ;entry:  _callbackchk:	;Function start
                            876 ; 2 exit points
                            877 ;highest stack level is: 0
                            878 ;has an exit
                            879 ;functions called:
                            880 ;   _api_enter_stdby_mode
                            881 ;   _key_machine
                            882 ;   _timer_routine
                            883 ;; Starting pCode block
   03B6                     884 _callbackchk:	;Function start
                            885 ; 2 exit points
                            886 ;	.line	186; "demo212.c"	if(!key_state)
   03B6 03 04         [ 2]  887 	LDA	_key_state
   03B8 E4 08         [ 2]  888 	JNZ	_00199_DS_
                            889 ;	.line	187; "demo212.c"	api_enter_stdby_mode(IO_KEY_ALL,0,1);
   03BA B5 04         [ 3]  890 	CALL	__COMMON_001CM_
   03BC B5 14         [ 3]  891 	CALL	__COMMON_004CM_
   03BE BB 48         [ 3]  892 	CALL	_api_enter_stdby_mode
   03C0 F3 C6         [ 2]  893 	JMP	_00200_DS_
   03C2                     894 _00199_DS_:
                            895 ;	.line	189; "demo212.c"	api_enter_stdby_mode(0,0,0);
   03C2 B5 08         [ 3]  896 	CALL	__COMMON_002CM_
   03C4 BB 48         [ 3]  897 	CALL	_api_enter_stdby_mode
   03C6                     898 _00200_DS_:
                            899 ;	.line	190; "demo212.c"	if(!TOV)
   03C6 DC            [ 1]  900 	LDC	_TOV
   03C7 E2 02         [ 2]  901 	JC	_00202_DS_
                            902 ;	.line	191; "demo212.c"	key_machine();
   03C9 B4 7B         [ 3]  903 	CALL	_key_machine
   03CB                     904 _00202_DS_:
                            905 ;	.line	192; "demo212.c"	timer_routine();
   03CB B4 66         [ 3]  906 	CALL	_timer_routine
                            907 ;	.line	193; "demo212.c"	if(key_code)
   03CD 03 07         [ 2]  908 	LDA	_key_code
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 20.



   03CF E6 03         [ 2]  909 	JZ	_00204_DS_
                            910 ;	.line	194; "demo212.c"	return 1;
   03D1 00 01         [ 2]  911 	LDA	#0x01
   03D3 C0            [ 1]  912 	RET	
   03D4                     913 _00204_DS_:
                            914 ;	.line	195; "demo212.c"	return 0;
   03D4 CE            [ 1]  915 	CLRA	
   03D5 C0            [ 1]  916 	RET	
                            917 
                            918 ;***
                            919 ;  pBlock Stats: dbName = C
                            920 ;***
                            921 ;entry:  _wait_beep:	;Function start
                            922 ; 0 exit points
                            923 ;highest stack level is: 3
                            924 ;functions called:
                            925 ;   _timer_routine
                            926 ;   _api_enter_stdby_mode
                            927 ;; Starting pCode block
   03D6                     928 _wait_beep:	;Function start
                            929 ; 0 exit points
                            930 ;	.line	167; "demo212.c"	void wait_beep(BYTE count)
   03D6 B5 2C         [ 3]  931 	CALL	__COMMON_008CM_
   03D8 01 FE         [ 2]  932 	LDA	@P1,-2
   03DA 13 09         [ 2]  933 	STA	_beep_timer
   03DC                     934 _00190_DS_:
                            935 ;	.line	170; "demo212.c"	while(beep_timer)
   03DC 03 09         [ 2]  936 	LDA	_beep_timer
   03DE E6 12         [ 2]  937 	JZ	_00193_DS_
                            938 ;	.line	172; "demo212.c"	timer_routine();
   03E0 B4 66         [ 3]  939 	CALL	_timer_routine
                            940 ;	.line	173; "demo212.c"	if(key_state)
   03E2 03 04         [ 2]  941 	LDA	_key_state
   03E4 E6 06         [ 2]  942 	JZ	_00188_DS_
                            943 ;	.line	174; "demo212.c"	api_enter_stdby_mode(0 ,0,0); // use tmr wk
   03E6 B5 08         [ 3]  944 	CALL	__COMMON_002CM_
   03E8 BB 48         [ 3]  945 	CALL	_api_enter_stdby_mode
   03EA F3 DC         [ 2]  946 	JMP	_00190_DS_
   03EC                     947 _00188_DS_:
                            948 ;	.line	176; "demo212.c"	api_enter_stdby_mode(IO_KEY_ALL,0,0); //use tmr+io wk
   03EC B5 0D         [ 3]  949 	CALL	__COMMON_003CM_
   03EE BB 48         [ 3]  950 	CALL	_api_enter_stdby_mode
   03F0 F3 DC         [ 2]  951 	JMP	_00190_DS_
   03F2                     952 _00193_DS_:
   03F2 B5 A6         [ 3]  953 	CALL	__COMMON_020CM_
   03F4 C4            [ 1]  954 	POP	
   03F5 C0            [ 1]  955 	RET	
                            956 
                            957 ;***
                            958 ;  pBlock Stats: dbName = C
                            959 ;***
                            960 ;entry:  _enter_play_mode:	;Function start
                            961 ; 2 exit points
                            962 ;highest stack level is: 1
                            963 ;has an exit
                            964 ;functions called:
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 21.



                            965 ;   _api_set_vol
                            966 ;   _api_play_start
                            967 ;   _api_play_start_with_state
                            968 ;; Starting pCode block
   03F6                     969 _enter_play_mode:	;Function start
                            970 ; 2 exit points
                            971 ;	.line	140; "demo212.c"	BYTE enter_play_mode(BYTE seg)
   03F6 B5 2C         [ 3]  972 	CALL	__COMMON_008CM_
   03F8 1C            [ 2]  973 	PUSH	
                            974 ;	.line	143; "demo212.c"	api_set_vol(API_PAGV_DEFAULT,API_PLAYG_DEFAULT);
   03F9 B5 1A         [ 3]  975 	CALL	__COMMON_005CM_
   03FB BB A8         [ 3]  976 	CALL	_api_set_vol
                            977 ;	.line	159; "demo212.c"	if(seg==0) try_play=API_PSTARTH(P0);
   03FD 01 FE         [ 2]  978 	LDA	@P1,-2
   03FF E4 17         [ 2]  979 	JNZ	_00179_DS_
   0401 00 04         [ 2]  980 	LDA	#0x04
   0403 B5 28         [ 3]  981 	CALL	__COMMON_007CM_
   0405 00 70         [ 2]  982 	LDA	#0x70
   0407 1C            [ 2]  983 	PUSH	
   0408 00 02         [ 2]  984 	LDA	#0x02
   040A 1C            [ 2]  985 	PUSH	
   040B 00 1D         [ 2]  986 	LDA	#0x1d
   040D B5 28         [ 3]  987 	CALL	__COMMON_007CM_
   040F 00 10         [ 2]  988 	LDA	#0x10
   0411 B5 28         [ 3]  989 	CALL	__COMMON_007CM_
   0413 BC 6E         [ 3]  990 	CALL	_api_play_start
   0415 15            [ 2]  991 	STA	@_RAMP1
   0416 F4 51         [ 2]  992 	JMP	_00180_DS_
   0418                     993 _00179_DS_:
                            994 ;	.line	160; "demo212.c"	else if(seg==1) try_play=API_PSTARTH(P1);
   0418 01 FE         [ 2]  995 	LDA	@P1,-2
   041A 80 01         [ 2]  996 	XOR	#0x01
   041C E4 17         [ 2]  997 	JNZ	_00176_DS_
   041E 00 04         [ 2]  998 	LDA	#0x04
   0420 1C            [ 2]  999 	PUSH	
   0421 B5 04         [ 3] 1000 	CALL	__COMMON_001CM_
   0423 00 C4         [ 2] 1001 	LDA	#0xc4
   0425 1C            [ 2] 1002 	PUSH	
   0426 B5 04         [ 3] 1003 	CALL	__COMMON_001CM_
   0428 00 76         [ 2] 1004 	LDA	#0x76
   042A B5 28         [ 3] 1005 	CALL	__COMMON_007CM_
   042C 00 1D         [ 2] 1006 	LDA	#0x1d
   042E B5 28         [ 3] 1007 	CALL	__COMMON_007CM_
   0430 BC 6E         [ 3] 1008 	CALL	_api_play_start
   0432 15            [ 2] 1009 	STA	@_RAMP1
   0433 F4 51         [ 2] 1010 	JMP	_00180_DS_
   0435                    1011 _00176_DS_:
                           1012 ;	.line	161; "demo212.c"	else try_play=api_play_start_with_state(R3_STARTPAGE, new_end_page, 0x17f, R3_ULAW, API_DAOSR_HIGH, &the_state);
   0435 00 2A         [ 2] 1013 	LDA	#(_the_state + 0)
   0437 1C            [ 2] 1014 	PUSH	
   0438 00 80         [ 2] 1015 	LDA	#> (_the_state + 0)
   043A 1C            [ 2] 1016 	PUSH	
   043B 00 04         [ 2] 1017 	LDA	#0x04
   043D B5 28         [ 3] 1018 	CALL	__COMMON_007CM_
   043F 00 7F         [ 2] 1019 	LDA	#0x7f
   0441 1C            [ 2] 1020 	PUSH	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 22.



   0442 B5 04         [ 3] 1021 	CALL	__COMMON_001CM_
   0444 03 28         [ 2] 1022 	LDA	_new_end_page
   0446 1C            [ 2] 1023 	PUSH	
   0447 03 29         [ 2] 1024 	LDA	(_new_end_page + 1)
   0449 1C            [ 2] 1025 	PUSH	
   044A 00 90         [ 2] 1026 	LDA	#0x90
   044C B5 28         [ 3] 1027 	CALL	__COMMON_007CM_
   044E B8 4E         [ 3] 1028 	CALL	_api_play_start_with_state
   0450 15            [ 2] 1029 	STA	@_RAMP1
   0451                    1030 _00180_DS_:
                           1031 ;	.line	162; "demo212.c"	if(try_play)
   0451 05            [ 2] 1032 	LDA	@_RAMP1
   0452 E6 04         [ 2] 1033 	JZ	_00182_DS_
                           1034 ;	.line	163; "demo212.c"	sys_state=SYS_PLAY;
   0454 00 01         [ 2] 1035 	LDA	#0x01
   0456 13 05         [ 2] 1036 	STA	_sys_state
   0458                    1037 _00182_DS_:
                           1038 ;	.line	164; "demo212.c"	playing_seg=seg;
   0458 01 FE         [ 2] 1039 	LDA	@P1,-2
   045A 13 2D         [ 2] 1040 	STA	_playing_seg
                           1041 ;	.line	165; "demo212.c"	return try_play; // return the result
   045C 05            [ 2] 1042 	LDA	@_RAMP1
   045D 12 0B         [ 2] 1043 	STA	_PTRCL
   045F C4            [ 1] 1044 	POP	
   0460 B5 A6         [ 3] 1045 	CALL	__COMMON_020CM_
   0462 C4            [ 1] 1046 	POP	
   0463 02 0B         [ 2] 1047 	LDA	_PTRCL
   0465 C0            [ 1] 1048 	RET	
                           1049 ;; end of function enter_play_mode
                           1050 ; exit point of _enter_play_mode
                           1051 
                           1052 ;***
                           1053 ;  pBlock Stats: dbName = C
                           1054 ;***
                           1055 ;entry:  _timer_routine:	;Function start
                           1056 ; 0 exit points
                           1057 ;highest stack level is: 4
                           1058 ;functions called:
                           1059 ;   _key_machine
                           1060 ;; Starting pCode block
   0466                    1061 _timer_routine:	;Function start
                           1062 ; 0 exit points
                           1063 ;	.line	128; "demo212.c"	if(!TOV)
   0466 DC            [ 1] 1064 	LDC	_TOV
                           1065 ;	.line	129; "demo212.c"	return ;
   0467 E0 11         [ 2] 1066 	JNC	_00170_DS_
                           1067 ;	.line	130; "demo212.c"	TOV=0;
   0469 3C            [ 2] 1068 	CLRB	_TOV
                           1069 ;	.line	131; "demo212.c"	if(sleep_timer)
   046A 03 0B         [ 2] 1070 	LDA	_sleep_timer
                           1071 ;	.line	132; "demo212.c"	sleep_timer--;
   046C E6 03         [ 2] 1072 	JZ	_00167_DS_
   046E CD            [ 1] 1073 	DECA	
   046F 13 0B         [ 2] 1074 	STA	_sleep_timer
   0471                    1075 _00167_DS_:
                           1076 ;	.line	133; "demo212.c"	if(beep_timer)
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 23.



   0471 03 09         [ 2] 1077 	LDA	_beep_timer
                           1078 ;	.line	134; "demo212.c"	beep_timer--;
   0473 E6 03         [ 2] 1079 	JZ	_00169_DS_
   0475 CD            [ 1] 1080 	DECA	
   0476 13 09         [ 2] 1081 	STA	_beep_timer
   0478                    1082 _00169_DS_:
                           1083 ;	.line	136; "demo212.c"	key_machine();
   0478 B4 7B         [ 3] 1084 	CALL	_key_machine
   047A                    1085 _00170_DS_:
   047A C0            [ 1] 1086 	RET	
                           1087 
                           1088 ;***
                           1089 ;  pBlock Stats: dbName = C
                           1090 ;***
                           1091 ;entry:  _key_machine:	;Function start
                           1092 ; 0 exit points
                           1093 ;highest stack level is: 5
                           1094 ;functions called:
                           1095 ;   _get_key
                           1096 ;; Starting pCode block
   047B                    1097 _key_machine:	;Function start
                           1098 ; 0 exit points
                           1099 ;	.line	91; "demo212.c"	void key_machine(void)
   047B B5 2C         [ 3] 1100 	CALL	__COMMON_008CM_
   047D 1C            [ 2] 1101 	PUSH	
                           1102 ;	.line	94; "demo212.c"	k=get_key();
   047E B4 DD         [ 3] 1103 	CALL	_get_key
   0480 15            [ 2] 1104 	STA	@_RAMP1
                           1105 ;	.line	97; "demo212.c"	if(key_state== KEYS_NOKEY)
   0481 03 04         [ 2] 1106 	LDA	_key_state
   0483 E4 13         [ 2] 1107 	JNZ	_00134_DS_
                           1108 ;	.line	99; "demo212.c"	if(!key_code && k)
   0485 03 07         [ 2] 1109 	LDA	_key_code
   0487 E4 36         [ 2] 1110 	JNZ	_00136_DS_
                           1111 ;	.line	101; "demo212.c"	last_stroke=k;
   0489 05            [ 2] 1112 	LDA	@_RAMP1
   048A E6 33         [ 2] 1113 	JZ	_00136_DS_
   048C 13 06         [ 2] 1114 	STA	_last_stroke
                           1115 ;	.line	102; "demo212.c"	key_state=KEYS_DEB;
   048E 00 01         [ 2] 1116 	LDA	#0x01
   0490 13 04         [ 2] 1117 	STA	_key_state
                           1118 ;	.line	103; "demo212.c"	key_timer=KEY_WAIT;
   0492 00 05         [ 2] 1119 	LDA	#0x05
   0494 13 08         [ 2] 1120 	STA	_key_timer
   0496 F4 BF         [ 2] 1121 	JMP	_00136_DS_
   0498                    1122 _00134_DS_:
                           1123 ;	.line	105; "demo212.c"	}else if(key_state==KEYS_DEB)
   0498 03 04         [ 2] 1124 	LDA	_key_state
   049A 80 01         [ 2] 1125 	XOR	#0x01
   049C E4 1B         [ 2] 1126 	JNZ	_00131_DS_
                           1127 ;	.line	107; "demo212.c"	if(k!=last_stroke)
   049E 03 06         [ 2] 1128 	LDA	_last_stroke
   04A0 85            [ 2] 1129 	XOR	@_RAMP1
                           1130 ;	.line	109; "demo212.c"	key_state=KEYS_NOKEY;
   04A1 E6 05         [ 2] 1131 	JZ	_00126_DS_
   04A3 CE            [ 1] 1132 	CLRA	
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 24.



   04A4 13 04         [ 2] 1133 	STA	_key_state
   04A6 F4 BF         [ 2] 1134 	JMP	_00136_DS_
   04A8                    1135 _00126_DS_:
                           1136 ;	.line	112; "demo212.c"	if(!--key_timer)
   04A8 03 08         [ 2] 1137 	LDA	_key_timer
   04AA CD            [ 1] 1138 	DECA	
   04AB 13 08         [ 2] 1139 	STA	_key_timer
   04AD E4 10         [ 2] 1140 	JNZ	_00136_DS_
                           1141 ;	.line	114; "demo212.c"	key_code=last_stroke;
   04AF 03 06         [ 2] 1142 	LDA	_last_stroke
   04B1 13 07         [ 2] 1143 	STA	_key_code
                           1144 ;	.line	115; "demo212.c"	key_state=KEYS_WAITRELEASE;
   04B3 00 02         [ 2] 1145 	LDA	#0x02
   04B5 13 04         [ 2] 1146 	STA	_key_state
   04B7 F4 BF         [ 2] 1147 	JMP	_00136_DS_
   04B9                    1148 _00131_DS_:
                           1149 ;	.line	119; "demo212.c"	if(!k)
   04B9 05            [ 2] 1150 	LDA	@_RAMP1
   04BA E4 03         [ 2] 1151 	JNZ	_00136_DS_
                           1152 ;	.line	120; "demo212.c"	key_state=KEYS_NOKEY;
   04BC CE            [ 1] 1153 	CLRA	
   04BD 13 04         [ 2] 1154 	STA	_key_state
   04BF                    1155 _00136_DS_:
   04BF C4            [ 1] 1156 	POP	
   04C0 F5 A6         [ 2] 1157 	JMP	__COMMON_020CM_
                           1158 
                           1159 ;***
                           1160 ;  pBlock Stats: dbName = C
                           1161 ;***
                           1162 ;entry:  _init:	;Function start
                           1163 ; 0 exit points
                           1164 ;highest stack level is: 1
                           1165 ;functions called:
                           1166 ;   _api_timer_on
                           1167 ;; Starting pCode block
   04C2                    1168 _init:	;Function start
                           1169 ; 0 exit points
                           1170 ;	.line	82; "demo212.c"	IODIR=0xc0;
   04C2 00 C0         [ 2] 1171 	LDA	#0xc0
   04C4 12 01         [ 2] 1172 	STA	_IODIR
                           1173 ;	.line	83; "demo212.c"	IO=0xFF; // all high
   04C6 00 FF         [ 2] 1174 	LDA	#0xff
   04C8 12 02         [ 2] 1175 	STA	_IO
                           1176 ;	.line	84; "demo212.c"	IOWK=0; // deep sleep mode no use wk
   04CA CE            [ 1] 1177 	CLRA	
   04CB 12 03         [ 2] 1178 	STA	_IOWK
                           1179 ;	.line	85; "demo212.c"	sleep_timer=KEY_WAIT;
   04CD 00 05         [ 2] 1180 	LDA	#0x05
   04CF 13 0B         [ 2] 1181 	STA	_sleep_timer
                           1182 ;	.line	86; "demo212.c"	new_end_page=R3_ENDPAGE;
   04D1 CE            [ 1] 1183 	CLRA	
   04D2 13 28         [ 2] 1184 	STA	_new_end_page
   04D4 00 02         [ 2] 1185 	LDA	#0x02
   04D6 13 29         [ 2] 1186 	STA	(_new_end_page + 1)
                           1187 ;	.line	88; "demo212.c"	api_timer_on(TMR_RLD);
   04D8 00 E0         [ 2] 1188 	LDA	#0xe0
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 25.



   04DA 1C            [ 2] 1189 	PUSH	
   04DB FB 37         [ 2] 1190 	JMP	_api_timer_on
                           1191 
                           1192 ;***
                           1193 ;  pBlock Stats: dbName = C
                           1194 ;***
                           1195 ;entry:  _get_key:	;Function start
                           1196 ; 2 exit points
                           1197 ;highest stack level is: 6
                           1198 ;has an exit
                           1199 ;; Starting pCode block
   04DD                    1200 _get_key:	;Function start
                           1201 ; 2 exit points
                           1202 ;	.line	70; "demo212.c"	if(!(IO&IO_PLAY))
   04DD 00 02         [ 2] 1203 	LDA	#0x02
   04DF 72 02         [ 2] 1204 	AND	_IO
   04E1 E4 03         [ 2] 1205 	JNZ	_00106_DS_
                           1206 ;	.line	71; "demo212.c"	return KEY_CODE_PLAY;
   04E3 00 01         [ 2] 1207 	LDA	#0x01
   04E5 C0            [ 1] 1208 	RET	
   04E6                    1209 _00106_DS_:
                           1210 ;	.line	72; "demo212.c"	if(!(IO&IO_AMP))
   04E6 00 04         [ 2] 1211 	LDA	#0x04
   04E8 72 02         [ 2] 1212 	AND	_IO
   04EA E4 03         [ 2] 1213 	JNZ	_00108_DS_
                           1214 ;	.line	73; "demo212.c"	return KEY_CODE_AMP;
   04EC 00 03         [ 2] 1215 	LDA	#0x03
   04EE C0            [ 1] 1216 	RET	
   04EF                    1217 _00108_DS_:
                           1218 ;	.line	74; "demo212.c"	if(!(IO&IO_REC))
   04EF 02 02         [ 2] 1219 	LDA	_IO
   04F1 92            [ 1] 1220 	SHR	
   04F2 E2 03         [ 2] 1221 	JC	_00110_DS_
                           1222 ;	.line	75; "demo212.c"	return KEY_CODE_REC;
   04F4 00 02         [ 2] 1223 	LDA	#0x02
   04F6 C0            [ 1] 1224 	RET	
   04F7                    1225 _00110_DS_:
                           1226 ;	.line	76; "demo212.c"	return 0;
   04F7 CE            [ 1] 1227 	CLRA	
   04F8 C0            [ 1] 1228 	RET	
                           1229 
                           1230 ;***
                           1231 ;  pBlock Stats: dbName = C
                           1232 ;***
                           1233 ;highest stack level is: 8
                           1234 ;;common code id 0
   04F9                    1235 __COMMON_000CM_::	;Function start
                           1236 ; 0 exit points
   04F9 CE            [ 1] 1237 	CLRA	
   04FA 12 17         [ 2] 1238 	STA	_SPIH
   04FC 00 80         [ 2] 1239 	LDA	#0x80
   04FE 12 16         [ 2] 1240 	STA	_SPIM
   0500 CE            [ 1] 1241 	CLRA	
   0501 12 26         [ 2] 1242 	STA	_SPIL
   0503 C0            [ 1] 1243 	RET	
                           1244 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 26.



                           1245 ;***
                           1246 ;  pBlock Stats: dbName = C
                           1247 ;***
                           1248 ;highest stack level is: 8
                           1249 ;;common code id 1
   0504                    1250 __COMMON_001CM_::	;Function start
                           1251 ; 0 exit points
   0504 00 01         [ 2] 1252 	LDA	#0x01
   0506 1C            [ 2] 1253 	PUSH	
   0507 C0            [ 1] 1254 	RET	
                           1255 
                           1256 ;***
                           1257 ;  pBlock Stats: dbName = C
                           1258 ;***
                           1259 ;highest stack level is: 8
                           1260 ;;common code id 2
   0508                    1261 __COMMON_002CM_::	;Function start
                           1262 ; 0 exit points
   0508 CE            [ 1] 1263 	CLRA	
   0509 1C            [ 2] 1264 	PUSH	
   050A 1C            [ 2] 1265 	PUSH	
   050B 1C            [ 2] 1266 	PUSH	
   050C C0            [ 1] 1267 	RET	
                           1268 
                           1269 ;***
                           1270 ;  pBlock Stats: dbName = C
                           1271 ;***
                           1272 ;highest stack level is: 8
                           1273 ;;common code id 3
   050D                    1274 __COMMON_003CM_::	;Function start
                           1275 ; 0 exit points
   050D CE            [ 1] 1276 	CLRA	
   050E 1C            [ 2] 1277 	PUSH	
   050F 1C            [ 2] 1278 	PUSH	
   0510 00 07         [ 2] 1279 	LDA	#0x07
   0512 1C            [ 2] 1280 	PUSH	
   0513 C0            [ 1] 1281 	RET	
                           1282 
                           1283 ;***
                           1284 ;  pBlock Stats: dbName = C
                           1285 ;***
                           1286 ;highest stack level is: 8
                           1287 ;;common code id 4
   0514                    1288 __COMMON_004CM_::	;Function start
                           1289 ; 0 exit points
   0514 CE            [ 1] 1290 	CLRA	
   0515 1C            [ 2] 1291 	PUSH	
   0516 00 07         [ 2] 1292 	LDA	#0x07
   0518 1C            [ 2] 1293 	PUSH	
   0519 C0            [ 1] 1294 	RET	
                           1295 
                           1296 ;***
                           1297 ;  pBlock Stats: dbName = C
                           1298 ;***
                           1299 ;highest stack level is: 8
                           1300 ;;common code id 5
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 27.



   051A                    1301 __COMMON_005CM_::	;Function start
                           1302 ; 0 exit points
   051A 00 78         [ 2] 1303 	LDA	#0x78
   051C 1C            [ 2] 1304 	PUSH	
   051D 00 3F         [ 2] 1305 	LDA	#0x3f
   051F 1C            [ 2] 1306 	PUSH	
   0520 C0            [ 1] 1307 	RET	
                           1308 
                           1309 ;***
                           1310 ;  pBlock Stats: dbName = C
                           1311 ;***
                           1312 ;highest stack level is: 8
                           1313 ;;common code id 6
   0521                    1314 __COMMON_006CM_::	;Function start
                           1315 ; 0 exit points
   0521 00 B6         [ 2] 1316 	LDA	#(_callbackchk+0)
   0523 1C            [ 2] 1317 	PUSH	
   0524 00 03         [ 2] 1318 	LDA	#>(_callbackchk+0)
   0526 1C            [ 2] 1319 	PUSH	
   0527 C0            [ 1] 1320 	RET	
                           1321 
                           1322 ;***
                           1323 ;  pBlock Stats: dbName = C
                           1324 ;***
                           1325 ;highest stack level is: 8
                           1326 ;;common code id 7
   0528                    1327 __COMMON_007CM_::	;Function start
                           1328 ; 0 exit points
   0528 1C            [ 2] 1329 	PUSH	
   0529 CE            [ 1] 1330 	CLRA	
   052A 1C            [ 2] 1331 	PUSH	
   052B C0            [ 1] 1332 	RET	
                           1333 
                           1334 ;***
                           1335 ;  pBlock Stats: dbName = C
                           1336 ;***
                           1337 ;highest stack level is: 8
                           1338 ;;common code id 8
   052C                    1339 __COMMON_008CM_::	;Function start
                           1340 ; 0 exit points
   052C 02 09         [ 2] 1341 	LDA	_RAMP1L
   052E 1C            [ 2] 1342 	PUSH	
   052F C8            [ 1] 1343 	P02P1	
   0530 C0            [ 1] 1344 	RET	
                           1345 
                           1346 ;***
                           1347 ;  pBlock Stats: dbName = C
                           1348 ;***
                           1349 ;highest stack level is: 8
                           1350 ;;common code id 9
   0531                    1351 __COMMON_009CM_::	;Function start
                           1352 ; 0 exit points
   0531 03 20         [ 2] 1353 	LDA	_rindex
   0533 90            [ 1] 1354 	SHL	
   0534 C0            [ 1] 1355 	RET	
                           1356 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 28.



                           1357 ;***
                           1358 ;  pBlock Stats: dbName = C
                           1359 ;***
                           1360 ;highest stack level is: 8
                           1361 ;;common code id 10
   0535                    1362 __COMMON_010CM_::	;Function start
                           1363 ; 0 exit points
   0535 1C            [ 2] 1364 	PUSH	
   0536 00 2A         [ 2] 1365 	LDA	#(_the_state + 0)
   0538 1C            [ 2] 1366 	PUSH	
   0539 00 80         [ 2] 1367 	LDA	#> (_the_state + 0)
   053B 1C            [ 2] 1368 	PUSH	
   053C C0            [ 1] 1369 	RET	
                           1370 
                           1371 ;***
                           1372 ;  pBlock Stats: dbName = C
                           1373 ;***
                           1374 ;highest stack level is: 8
                           1375 ;;common code id 11
   053D                    1376 __COMMON_011CM_::	;Function start
                           1377 ; 0 exit points
   053D 03 20         [ 2] 1378 	LDA	_rindex
   053F 50 0C         [ 2] 1379 	ADD	#(_oldindex + 0)
   0541 11 04         [ 2] 1380 	STA	@P1,4
   0543 CE            [ 1] 1381 	CLRA	
   0544 40 80         [ 2] 1382 	ADDC	#> (_oldindex + 0)
   0546 12 0E         [ 2] 1383 	STA	_ROMPH
   0548 01 04         [ 2] 1384 	LDA	@P1,4
   054A 12 0D         [ 2] 1385 	STA	_ROMPL
   054C 03 2C         [ 2] 1386 	LDA	(_the_state + 2)
   054E 1E            [ 2] 1387 	STA	@_ROMPINC
   054F C0            [ 1] 1388 	RET	
                           1389 
                           1390 ;***
                           1391 ;  pBlock Stats: dbName = C
                           1392 ;***
                           1393 ;highest stack level is: 8
                           1394 ;;common code id 12
   0550                    1395 __COMMON_012CM_::	;Function start
                           1396 ; 0 exit points
   0550 11 02         [ 2] 1397 	STA	@P1,2
   0552 CE            [ 1] 1398 	CLRA	
   0553 91            [ 1] 1399 	ROL	
   0554 15            [ 2] 1400 	STA	@_RAMP1
   0555 00 10         [ 2] 1401 	LDA	#(_oldpredict + 0)
   0557 51 02         [ 2] 1402 	ADD	@P1,2
   0559 11 04         [ 2] 1403 	STA	@P1,4
   055B 00 80         [ 2] 1404 	LDA	#> (_oldpredict + 0)
   055D 45            [ 2] 1405 	ADDC	@_RAMP1
   055E 12 0E         [ 2] 1406 	STA	_ROMPH
   0560 01 04         [ 2] 1407 	LDA	@P1,4
   0562 12 0D         [ 2] 1408 	STA	_ROMPL
   0564 03 2A         [ 2] 1409 	LDA	_the_state
   0566 1E            [ 2] 1410 	STA	@_ROMPINC
   0567 03 2B         [ 2] 1411 	LDA	(_the_state + 1)
   0569 1E            [ 2] 1412 	STA	@_ROMPINC
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 29.



   056A C0            [ 1] 1413 	RET	
                           1414 
                           1415 ;***
                           1416 ;  pBlock Stats: dbName = C
                           1417 ;***
                           1418 ;highest stack level is: 8
                           1419 ;;common code id 13
   056B                    1420 __COMMON_013CM_::	;Function start
                           1421 ; 0 exit points
   056B 03 0A         [ 2] 1422 	LDA	_rec_stage
   056D CC            [ 1] 1423 	INCA	
   056E 13 0A         [ 2] 1424 	STA	_rec_stage
   0570 C0            [ 1] 1425 	RET	
                           1426 
                           1427 ;***
                           1428 ;  pBlock Stats: dbName = C
                           1429 ;***
                           1430 ;highest stack level is: 8
                           1431 ;;common code id 14
   0571                    1432 __COMMON_014CM_::	;Function start
                           1433 ; 0 exit points
   0571 03 20         [ 2] 1434 	LDA	_rindex
   0573 CC            [ 1] 1435 	INCA	
                           1436 ;	.line	318; "demo212.c"	rindex&=3;
   0574 13 20         [ 2] 1437 	STA	_rindex
   0576 70 03         [ 2] 1438 	AND	#0x03
   0578 13 20         [ 2] 1439 	STA	_rindex
   057A C0            [ 1] 1440 	RET	
                           1441 
                           1442 ;***
                           1443 ;  pBlock Stats: dbName = C
                           1444 ;***
                           1445 ;highest stack level is: 8
                           1446 ;;common code id 15
   057B                    1447 __COMMON_015CM_::	;Function start
                           1448 ; 0 exit points
   057B 92            [ 1] 1449 	SHR	
   057C 11 01         [ 2] 1450 	STA	@P1,1
   057E C0            [ 1] 1451 	RET	
                           1452 
                           1453 ;***
                           1454 ;  pBlock Stats: dbName = C
                           1455 ;***
                           1456 ;highest stack level is: 8
                           1457 ;;common code id 16
   057F                    1458 __COMMON_016CM_::	;Function start
                           1459 ; 0 exit points
   057F 93            [ 1] 1460 	ROR	
   0580 11 03         [ 2] 1461 	STA	@P1,3
   0582 01 01         [ 2] 1462 	LDA	@P1,1
   0584 C0            [ 1] 1463 	RET	
                           1464 
                           1465 ;***
                           1466 ;  pBlock Stats: dbName = C
                           1467 ;***
                           1468 ;highest stack level is: 8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 30.



                           1469 ;;common code id 17
   0585                    1470 __COMMON_017CM_::	;Function start
                           1471 ; 0 exit points
   0585 01 03         [ 2] 1472 	LDA	@P1,3
   0587 93            [ 1] 1473 	ROR	
   0588 51 02         [ 2] 1474 	ADD	@P1,2
   058A 11 02         [ 2] 1475 	STA	@P1,2
   058C 05            [ 2] 1476 	LDA	@_RAMP1
   058D 41 01         [ 2] 1477 	ADDC	@P1,1
   058F 15            [ 2] 1478 	STA	@_RAMP1
   0590 C0            [ 1] 1479 	RET	
                           1480 
                           1481 ;***
                           1482 ;  pBlock Stats: dbName = C
                           1483 ;***
                           1484 ;highest stack level is: 8
                           1485 ;;common code id 18
   0591                    1486 __COMMON_018CM_::	;Function start
                           1487 ; 0 exit points
   0591 12 0D         [ 2] 1488 	STA	_ROMPL
   0593 03 21         [ 2] 1489 	LDA	_newpwr
   0595 1E            [ 2] 1490 	STA	@_ROMPINC
   0596 03 22         [ 2] 1491 	LDA	(_newpwr + 1)
   0598 1E            [ 2] 1492 	STA	@_ROMPINC
   0599 C0            [ 1] 1493 	RET	
                           1494 
                           1495 ;***
                           1496 ;  pBlock Stats: dbName = C
                           1497 ;***
                           1498 ;highest stack level is: 8
                           1499 ;;common code id 19
   059A                    1500 __COMMON_019CM_::	;Function start
                           1501 ; 0 exit points
   059A 11 02         [ 2] 1502 	STA	@P1,2
   059C 01 05         [ 2] 1503 	LDA	@P1,5
   059E 12 0D         [ 2] 1504 	STA	_ROMPL
   05A0 01 02         [ 2] 1505 	LDA	@P1,2
   05A2 12 0E         [ 2] 1506 	STA	_ROMPH
   05A4 0E            [ 2] 1507 	LDA	@_ROMPINC
   05A5 C0            [ 1] 1508 	RET	
                           1509 
                           1510 ;***
                           1511 ;  pBlock Stats: dbName = C
                           1512 ;***
                           1513 ;highest stack level is: 8
                           1514 ;;common code id 20
   05A6                    1515 __COMMON_020CM_::	;Function start
                           1516 ; 0 exit points
   05A6 C4            [ 1] 1517 	POP	
   05A7 12 09         [ 2] 1518 	STA	_RAMP1L
   05A9 C0            [ 1] 1519 	RET	
                           1520 
                           1521 ;***
                           1522 ;  pBlock Stats: dbName = C
                           1523 ;***
                           1524 ;highest stack level is: 8
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 31.



                           1525 ;;common code id 21
   05AA                    1526 __COMMON_021CM_::	;Function start
                           1527 ; 0 exit points
   05AA 93            [ 1] 1528 	ROR	
   05AB 15            [ 2] 1529 	STA	@_RAMP1
   05AC 01 04         [ 2] 1530 	LDA	@P1,4
   05AE 92            [ 1] 1531 	SHR	
   05AF 11 04         [ 2] 1532 	STA	@P1,4
   05B1 05            [ 2] 1533 	LDA	@_RAMP1
   05B2 C0            [ 1] 1534 	RET	
                           1535 
                           1536 
                           1537 ;	code size estimation:
                           1538 ;	  841+  616 =  1457 instructions ( 1457 byte)
                           1539 
                           1540 ;--------------------------------------------------------
                           1541 ; compiler-defined variables
                           1542 ;--------------------------------------------------------
                           1543 ;--------------------------------------------------------
                           1544 ; initialized data - shadow
                           1545 ;--------------------------------------------------------
                           1546 ;--------------------------------------------------------
                           1547 ; initialized data
                           1548 ;--------------------------------------------------------
                           1549 	.globl __PARA_STK
                           1550 	.area SSEG (DATA,OVR)
   8039                    1551 __PARA_STK:	.ds 1
                           1552 ;--------------------------------------------------------
                           1553 ; external declarations
                           1554 ;--------------------------------------------------------
                           1555 	.globl	_api_rec_prepare
                           1556 	.globl	_api_rec_start
                           1557 	.globl	_api_rec_stop
                           1558 	.globl	_api_set_vol
                           1559 	.globl	_api_play_start
                           1560 	.globl	_api_play_job
                           1561 	.globl	_api_play_stop
                           1562 	.globl	_api_rec_job_no_write
                           1563 	.globl	_api_rec_write_prev
                           1564 	.globl	_api_rec_job_do_write
                           1565 	.globl	_api_play_start_with_state
                           1566 	.globl	_api_beep_start
                           1567 	.globl	_api_beep_stop
                           1568 	.globl	_api_timer_on
                           1569 	.globl	_api_enter_stdby_mode
                           1570 	.globl	_api_enter_dsleep_mode
                           1571 	.globl	_api_amp_prepare
                           1572 	.globl	_api_amp_start
                           1573 	.globl	_api_amp_stop
                           1574 	.globl	_IOR
                           1575 	.globl	_IODIR
                           1576 	.globl	_IO
                           1577 	.globl	_IOWK
                           1578 	.globl	_IOWKDR
                           1579 	.globl	_TIMERC
                           1580 	.globl	_THRLD
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 32.



                           1581 	.globl	_RAMP0L
                           1582 	.globl	_RAMP0H
                           1583 	.globl	_RAMP1L
                           1584 	.globl	_RAMP1H
                           1585 	.globl	_PTRCL
                           1586 	.globl	_PTRCH
                           1587 	.globl	_ROMPL
                           1588 	.globl	_ROMPH
                           1589 	.globl	_BEEPC
                           1590 	.globl	_FILTERG
                           1591 	.globl	_ULAWC
                           1592 	.globl	_STACKL
                           1593 	.globl	_STACKH
                           1594 	.globl	_ADCON
                           1595 	.globl	_DACON
                           1596 	.globl	_SYSC
                           1597 	.globl	_SPIM
                           1598 	.globl	_SPIH
                           1599 	.globl	_SPIOP
                           1600 	.globl	_SPI_BANK
                           1601 	.globl	_ADP_IND
                           1602 	.globl	_ADP_VPL
                           1603 	.globl	_ADP_VPH
                           1604 	.globl	_ADL
                           1605 	.globl	_ADH
                           1606 	.globl	_ZC
                           1607 	.globl	_ADCG
                           1608 	.globl	_DAC_PL
                           1609 	.globl	_DAC_PH
                           1610 	.globl	_PAG
                           1611 	.globl	_DMAL
                           1612 	.globl	_DMAH
                           1613 	.globl	_SPIL
                           1614 	.globl	_IOMASK
                           1615 	.globl	_IOCMP
                           1616 	.globl	_IOCNT
                           1617 	.globl	_LVDCON
                           1618 	.globl	_LVRCON
                           1619 	.globl	_OFFSETL
                           1620 	.globl	_OFFSETH
                           1621 	.globl	_RCCON
                           1622 	.globl	_BGCON
                           1623 	.globl	_PWRL
                           1624 	.globl	_CRYPT
                           1625 	.globl	_PWRH
                           1626 	.globl	_PWRHL
                           1627 	.globl	_IROMDL
                           1628 	.globl	_IROMDH
                           1629 	.globl	_IROMDLH
                           1630 	.globl	_RECMUTE
                           1631 	.globl	_SPKC
                           1632 	.globl	_DCLAMP
                           1633 	.globl	_SSPIC
                           1634 	.globl	_SSPIL
                           1635 	.globl	_SSPIM
                           1636 	.globl	_SSPIH
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 33.



                           1637 	.globl	_RAMP0
                           1638 	.globl	_RAMP0LH
                           1639 	.globl	_RAMP1LH
                           1640 	.globl	_RAMP0INC
                           1641 	.globl	_RAMP1
                           1642 	.globl	_DMAHL
                           1643 	.globl	_RAMP1INC
                           1644 	.globl	_RAMP1INC2
                           1645 	.globl	_ROMP
                           1646 	.globl	_ROMPINC
                           1647 	.globl	_ROMPLH
                           1648 	.globl	_ROMPINC2
                           1649 	.globl	_ACC
                           1650 	.globl	_RAMP0UW
                           1651 	.globl	_RAMP1UW
                           1652 	.globl	_ROMPUW
                           1653 	.globl	_SPIMH
                           1654 	.globl	_OFFSETLH
                           1655 	.globl	_ADP_VPLH
                           1656 	.globl	_ICE0
                           1657 	.globl	_ICE1
                           1658 	.globl	_ICE2
                           1659 	.globl	_ICE3
                           1660 	.globl	_ICE4
                           1661 	.globl	_TOV
                           1662 	.globl	_init_io_state
                           1663 ;--------------------------------------------------------
                           1664 ; global -1 declarations
                           1665 ;--------------------------------------------------------
                           1666 	.globl	_get_key
                           1667 	.globl	_init
                           1668 	.globl	_key_machine
                           1669 	.globl	_timer_routine
                           1670 	.globl	_enter_play_mode
                           1671 	.globl	_wait_beep
                           1672 	.globl	_callbackchk
                           1673 	.globl	_enter_rec_mode
                           1674 	.globl	_enter_idle_mode
                           1675 	.globl	_sys_play
                           1676 	.globl	_simple_speech_check
                           1677 	.globl	_sys_rec
                           1678 	.globl	_enter_amp_mode
                           1679 	.globl	_sys_amp
                           1680 	.globl	_main
                           1681 	.globl	_key_state
                           1682 	.globl	_sys_state
                           1683 	.globl	_last_stroke
                           1684 	.globl	_key_code
                           1685 	.globl	_key_timer
                           1686 	.globl	_beep_timer
                           1687 	.globl	_rec_stage
                           1688 	.globl	_sleep_timer
                           1689 	.globl	_oldindex
                           1690 	.globl	_oldpredict
                           1691 	.globl	_oldpwr
                           1692 	.globl	_rindex
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 34.



                           1693 	.globl	_newpwr
                           1694 	.globl	_pwravg
                           1695 	.globl	_the_pred
                           1696 	.globl	_the_index
                           1697 	.globl	_new_end_page
                           1698 	.globl	_the_state
                           1699 	.globl	_playing_seg
                           1700 	.globl	__sp_inc
                           1701 	.globl	__sp_dec
                           1702 
                           1703 	.globl STK02
                           1704 	.globl STK01
                           1705 	.globl STK00
                           1706 	.globl _init_io_state
                           1707 	 .area sharebank (DATA,OVR)
   8000                    1708 _init_io_state:	.ds 1
   8001                    1709 STK02:	.ds 1
   8002                    1710 STK01:	.ds 1
   8003                    1711 STK00:	.ds 1
                           1712 
                           1713 ;--------------------------------------------------------
                           1714 ; global -2 definitions
                           1715 ;--------------------------------------------------------
                           1716 	.area DSEG(data)
   8004                    1717 _key_state:	.ds	1
                           1718 
                           1719 	.area DSEG(data)
   8005                    1720 _sys_state:	.ds	1
                           1721 
                           1722 	.area DSEG(data)
   8006                    1723 _last_stroke:	.ds	1
                           1724 
                           1725 	.area DSEG(data)
   8007                    1726 _key_code:	.ds	1
                           1727 
                           1728 	.area DSEG(data)
   8008                    1729 _key_timer:	.ds	1
                           1730 
                           1731 	.area DSEG(data)
   8009                    1732 _beep_timer:	.ds	1
                           1733 
                           1734 	.area DSEG(data)
   800A                    1735 _rec_stage:	.ds	1
                           1736 
                           1737 	.area DSEG(data)
   800B                    1738 _sleep_timer:	.ds	1
                           1739 
                           1740 	.area DSEG(data)
   800C                    1741 _oldindex:	.ds	4
                           1742 
                           1743 	.area DSEG(data)
   8010                    1744 _oldpredict:	.ds	8
                           1745 
                           1746 	.area DSEG(data)
   8018                    1747 _oldpwr:	.ds	8
                           1748 
ASxxxx Assembler V02.00 + NoICE + SDCC mods  (MS311 Series), page 35.



                           1749 	.area DSEG(data)
   8020                    1750 _rindex:	.ds	1
                           1751 
                           1752 	.area DSEG(data)
   8021                    1753 _newpwr:	.ds	2
                           1754 
                           1755 	.area DSEG(data)
   8023                    1756 _pwravg:	.ds	2
                           1757 
                           1758 	.area DSEG(data)
   8025                    1759 _the_pred:	.ds	2
                           1760 
                           1761 	.area DSEG(data)
   8027                    1762 _the_index:	.ds	1
                           1763 
                           1764 	.area DSEG(data)
   8028                    1765 _new_end_page:	.ds	2
                           1766 
                           1767 	.area DSEG(data)
   802A                    1768 _the_state:	.ds	3
                           1769 
                           1770 	.area DSEG(data)
   802D                    1771 _playing_seg:	.ds	1
                           1772 
                           1773 ;--------------------------------------------------------
                           1774 ; absolute symbol definitions
                           1775 ;--------------------------------------------------------
                           1776 	;end
