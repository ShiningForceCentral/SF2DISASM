	cpu z80
	listing off
	phase	0

;constants
SFX_BANK equ 08h
SFX_BANK_OFFSET equ 0B000h			
DAC_BANK_1 equ 03Ch
DAC_BANK_2 equ 03Dh
MUSIC_BANK_1 equ 03Fh				
MUSIC_BANK_2 equ 03Eh
YM_INSTRUMENTS_BANK equ 03Dh
YM_INSTRUMENTS_BANK_OFFSET equ 0B000h		

;offsets
STACK_START equ 1FE0h

SAVED_MUSIC_BANK 	equ 1FE0h
MUSIC_BANK 		equ 1FF0h	
PREVIOUS_MUSIC 		equ 1FE1h
CURRENT_MUSIC 		equ 1FF1h
SAVED_YM_TIMER_VALUE 	equ 1FE2h
YM_TIMER_VALUE 		equ 1FF2h
SAVED_MUSIC_DOESNT_USE_SAMPLES equ 1FE3h
MUSIC_DOESNT_USE_SAMPLES equ 1FF3h
	
NEW_SAMPLE_TO_LOAD 	equ 1FE4h
DAC_BANK		equ 1FF4h
DAC_LAST_OFFSET 	equ 1FE5h
DAC_REMAINING_LENGTH 	equ 1FF5h
		
RESUMING_DEACTIVATED	equ 1FE8h

FADE_OUT_LENGTH		equ 1FEBh
FADE_OUT_TIMER		equ 1FECh
FADE_OUT_COUNTER	equ 1FEDh
CURRENTLY_FADING_OUT	equ 1FEEh

FADE_IN_TIMER		equ 1FFBh
FADE_IN_PARAMETERS 	equ 1FFCh	
MUSIC_LEVEL 		equ 1FFDh

LAST_COMMAND 		equ 1FFEh	
COMMANDS_COUNTER 	equ 1FEFh
NEW_OPERATION 		equ 1FFFh
					

;registers
YM1_REGISTER equ 4000h
YM1_DATA equ 4001h
YM2_REGISTER equ 4002h
YM2_DATA equ 4003h
BANK_REGISTER equ 6000h
PSG_PORT equ 7F11h


; =============== S U B	R O U T	I N E =======================================


init:
		di			; disable interrupts : synchronisation is just based on	YM Timer
		ld	sp, STACK_START	; initialize stack pointer
		ld	a, 0Fh
		ld	(MUSIC_LEVEL), a ; init	music level at max value
		ld	a, 0FFh
		ld	(YM_TIMER_VALUE), a ; init timer value without sending it to YM
		ld	a, 0Fh
		ld	(FADE_IN_PARAMETERS), a	; init fade in parameters : no fade in	 
		call	DeactivateResuming
		;call	ActivateResuming
		ld	a, 20h ; ' '    ; load music $20, which is void
		call	Main		; process new operation	$20 to initialize YM and PSG with void data
		ld	a, (DAC_BANK)
		call	LoadAnyBank	; init loaded bank, and	enter the driver's main loop !
; End of function init


; =============== S U B	R O U T	I N E =======================================


Main_Loop:				
					; Update_YM_Instruments+6j  <---- still need to figure out the exact purpose of this way to return to main loop

		; This part updates sequential sound at each YM Timer overflow
					
		ld	a, (YM1_REGISTER) 
		and	2		
		jr	z, Dac_Loop	; jump as long as there	is no timer overflow
		ld	a, d
		ld	(DAC_REMAINING_LENGTH), a
		ld	a, e
		ld	(DAC_REMAINING_LENGTH+1), a		
		ld	a, h
		ld	(DAC_LAST_OFFSET), a
		ld	a, l
		ld	(DAC_LAST_OFFSET+1), a
		call	UpdateSound	; This is the entry point to the big sound update process, which causes a large plateau in DAC sound.
		ld	a, (DAC_LAST_OFFSET)
		ld	h, a		
		ld	a, (DAC_LAST_OFFSET+1)
		ld	l, a	
		ld	a, (DAC_REMAINING_LENGTH)
		ld	d, a		
		ld	a, (DAC_REMAINING_LENGTH+1)
		ld	e, a	
		jp	loc_34

		; This part loops a number of times varying according to DAC rate
Dac_Loop:				
		ld	b, 5		; loop parameter is dynamically	changed	to adjust time period of a DAC sound
loc_32:			
		djnz	$		; loop b times before checking things to do

		; This part checks for a new command to process 
loc_34:					
		ld	a, (NEW_OPERATION)
		or	a		
		call	nz, Main ; This is the entry point to load a new command

		; This part checks for a new DAC sample to load
		
		ld	a, (NEW_SAMPLE_TO_LOAD)
		or	a		
		call	nz, LoadDacSound
		
		; This part checks if there is DAC data to send to YM
		
		ld	a, d		; check	remaining sound	length
		or	e
		jr	z, Main_Loop	; if remaining length =	0, then	it's end of DAC sample, or it's because sample $FE has been loaded at initialization
		
		; This part transmits DAC Data
		
		ld	b, 2Ah ; '*'    ; YM Register : DAC data
		ld	c, (hl)		; get next DAC sample byte. It's 8-bit PCM
		inc	hl

loc_4A:					
		ld	a, (YM1_REGISTER)
		and	80h ; 'Ä'
		jr	nz, loc_4A	; loop as long as YM busy
		ld	a, b
		ld	(YM1_REGISTER),	a
		ld	a, c
		ld	(YM1_DATA), a	; transmit DAC Data
		dec	de		; decrement remaining sound length to play
		jp	Main_Loop	; End of the driver's main loop !
; End of function Main_Loop


; =============== S U B	R O U T	I N E =======================================


Pause_Sound:				; CODE XREF: Main+8j
		push	hl		; mutes	sound at reception of operation	$FF
		push	de
		xor	a
		ld	(CURRENTLY_MANAGING_SFX), a ; clear
		ld	(CALL_YM2_INSTEAD_OF_YM1), a ; set to $01 when managing	YM4,5,6	channels, to call part 2 of YM
		ld	bc, 407Fh	; set Total Level to smallest amplitude
		ld	d, 4		; 4 loops, one for each	operator of the	3 channels

loc_6B:					; CODE XREF: Pause_Sound+1Cj

					; Conditional input to implement here !

		call	YM_Input
		inc	b
		call	YM_Input
		inc	b
		call	YM_Input
		inc	b
		inc	b
		dec	d
		jr	nz, loc_6B
		ld	a, 1
		ld	(CALL_YM2_INSTEAD_OF_YM1), a ; set to $01 when managing	YM4,5,6	channels, to call part 2 of YM
		ld	bc, 407Fh	; set Total Level to smallest amplitude
		ld	d, 4		; 4 loops, one for each	operator of 3 channels

loc_85:					; CODE XREF: Pause_Sound+36j
		call	YM2_Input
		inc	b
		call	YM2_Input
		inc	b
		call	YM2_Input
		inc	b
		inc	b
		dec	d
		jr	nz, loc_85
		ld	hl, PSG_PORT
		ld	a, 9Fh ; 'ü'
		ld	(hl), a		; set PSG channel 1 volume to 0
		ld	a, 0BFh	; 'ø'
		ld	(hl), a		; set PSG channel 2 volume to 0
		ld	a, 0DFh	; 'ﬂ'
		ld	(hl), a		; set PSG channel 3 volume to 0
		ld	a, 0FFh
		ld	(hl), a		; set PSG noise	channel	volume to 0

loc_A4:					; CODE XREF: Pause_Sound+4Bj
		ld	a, (NEW_OPERATION) ; new operation to process (play music/sfx, fade out	...), sent from	68k
		or	a
		jr	z, loc_A4	; loop as long as there	is no new operation to process
		cp	0FFh
		jr	nz, Update_YM_Instruments ; if next sent operation is not to mute the sound, go	process	it in the main loop
		xor	a		; if next sent operation is to mute the	sound, then ignore it, and also	go back	to main	loop !
		ld	(NEW_OPERATION), a ; new operation to process (play music/sfx, fade out	...), sent from	68k
; End of function Pause_Sound


; =============== S U B	R O U T	I N E =======================================


Update_YM_Instruments:			; CODE XREF: Pause_Sound+4Fj
					; Update_YM_Level+9j
		call	YM_UpdateInstrumentsLevels
		pop	de
		pop	hl
		pop	af
		jp	Main_Loop	; go back to main loop
; End of function Update_YM_Instruments


; =============== S U B	R O U T	I N E =======================================


YM_UpdateInstrumentsLevels:		; CODE XREF: Update_YM_Instrumentsp
					; UpdateSound+33p
					
					; new workflow yet to implement :
					; for each of the 10 channels, update SFX channel instrument in priority over music instrument
					; 
					
		ld	iy, CURRENT_CHANNEL ; indicates	the channel to process,	from a relative	point of view :	YM1, YM2, PSG or SFX channels
		xor	a
		ld	(CALL_YM2_INSTEAD_OF_YM1), a ; set to $01 when managing	YM4,5,6	channels, to call part 2 of YM
		ld	(iy+0),	a
		ld	ix, MUSIC_CHANNEL_YM1 ;	get channel data area
		ld	a, (ix+4)	; get channel level
		call	YM1_LoadInstrument ; reload instrument to load the new level
		inc	(iy+0)
		ld	ix, MUSIC_CHANNEL_YM2
		ld	a, (ix+4)
		call	YM1_LoadInstrument
		inc	(iy+0)
		ld	ix, MUSIC_CHANNEL_YM3
		ld	a, (ix+4)
		call	YM1_LoadInstrument
		xor	a
		ld	(iy+0),	a
		ld	a, 1
		ld	(CALL_YM2_INSTEAD_OF_YM1), a ; set to $01 when managing	YM4,5,6	channels, to call part 2 of YM
		ld	ix, MUSIC_CHANNEL_YM4
		ld	a, (ix+4)
		call	YM2_LoadInstrument
		inc	(iy+0)
		ld	ix, MUSIC_CHANNEL_YM5
		ld	a, (ix+4)
		call	YM2_LoadInstrument
		ld	ix, MUSIC_CHANNEL_YM6
		ld	a, (ix+4)
		call	YM2_LoadInstrument
		xor	a
		ret
; End of function YM_UpdateInstrumentsLevels


; =============== S U B	R O U T	I N E =======================================


Update_YM_Level:			; CODE XREF: Main+17j
		push	hl
		push	de
		ld	hl, MUSIC_LEVEL	; general output level for music and SFX type 1, sent from 68k
		ld	a, (hl)
		and	0Fh
		ld	(hl), a
		jp	Update_YM_Instruments
		ld	a, (DAC_BANK)
		jp	LoadAnyBank
; End of function Update_YM_Level


; =============== S U B	R O U T	I N E =======================================


LoadAnyBank:			
		push	hl
		ld	hl, BANK_REGISTER 
		ld	(hl), a
		rra
		ld	(hl), a
		rra
		ld	(hl), a
		rra
		ld	(hl), a
		rra
		ld	(hl), a
		rra
		ld	(hl), a
		rra
		ld	(hl), a
		ld	(hl), l
		ld	(hl), l
		pop	hl
		ret
; End of function LoadAnyBank


; =============== S U B	R O U T	I N E =======================================


LoadDacSound:				; CODE XREF: Main_Loop+1Cp
		cp	0FEh ; '˛'
		jr	nz, loc_1A0	; if a != FE
		ld	hl, 0C000h	; if a = FE, play nothing
		ld	de, 0		; 0 remaining length, so just stay in the main loop
		ret
; ---------------------------------------------------------------------------

loc_1A0:				; CODE XREF: LoadDacSound+2j
		dec	a		; a is DAC sound index,	starting at 1, so decrement it
		ld	h, 0
		ld	l, a
		add	hl, hl
		add	hl, hl
		add	hl, hl		; hl = 8 * a, so each DAC sound	entry uses 8 bytes
		ld	bc, t_SAMPLE_LOAD_DATA
		add	hl, bc		; hl now points	to the right entry
		ld	a, (hl)		; get byte 0 : time period used
		inc	hl		; ignore byte 1	!
		inc	hl		; point	to byte	2 : bank to load
		ld	(Dac_Loop+1), a	; change loop number to	change DAC play	time period
		ld	a, (hl)		; get byte 2
		ld	(DAC_BANK), a ; save byte 2
		inc	hl		; ignore byte 3	!
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)		; de = bytes 5-4 : sound length
		inc	hl
		ld	a, (hl)		; 7th byte
		inc	hl
		ld	h, (hl)		; 8th byte
		ld	l, a		; hl = bytes 7-6 : sound data pointer
		xor	a
		ld	(NEW_SAMPLE_TO_LOAD), a	; clear	to say that DAC	sound is now loaded
		ld	a, (DAC_BANK)
		call	LoadAnyBank	; loads	bank 0x1E0000 or 0x1E8000
		ret
; End of function LoadDacSound


; =============== S U B	R O U T	I N E =======================================


Main:					
		push	af		; main handles any new operation sent by 68K (or Z80 itself)
		xor	a
		ld	(NEW_OPERATION), a ; clear 0x1FFF (its value is	already	in pushed a)
		ld	a, (COMMANDS_COUNTER)
		add	a, 1
		ld	(COMMANDS_COUNTER), a		
		pop	af
		ld	(LAST_COMMAND), a 
		cp	0FFh
		jp	z, Pause_Sound	; if a = FFh : mute sound
		cp	0FEh ; '˛'
		jp	z, StopMusic	; if a = FEh : stop music by muting PSG	and releasing YM keys
		cp	0FDh ; '˝'
		jp	z, Fade_Out	; if a = FDh : fade out
		cp	0FCh 
		jp	z, Save_Music	; if a = FCh : save current music
		cp	0FBh 
		jp	z, Resume_Music	; if a = FBh : resume saved music	
		cp	0FAh 
		jp	z, ActivateResuming	; if a = FAh : activate resuming		
		cp	0F9h 
		jp	z, DeactivateResuming	; if a = F9h : deactivate resuming				
		cp	0F0h ; ''
		jp	z, Update_YM_Level ; if	a = F0h
		cp	0F1h ; 'Ò'
		jp	z, YM_SetTimer	; if a = F1h
		cp	41h ; 'A'
		jp	nc, Load_SFX	; if a > 41h, then play	an SFX (already	stored in ram along with the code)
		
		ld	ix, PREVIOUS_MUSIC
		cp	(ix)
		jp	z, Resume_Previous_Music
		jp	Not_Previous_Music
		
Resume_Previous_Music:
		; if saved music was finished, just load it again
		push	af
		ld	a, (SAVED_MUSIC_CHANNEL_YM1_NOT_IN_USE)		
		cp	01h
		jp	nz, Test_Resuming
		pop	af
		jp	Not_Previous_Music
Test_Resuming:
		ld	a, (RESUMING_DEACTIVATED)		
		cp	0FFh
		jp	nz, Resume_Indeed
		pop	af
		jp	Not_Previous_Music
Resume_Indeed:		
		ld	a, (CURRENT_MUSIC)
		ld	(PREVIOUS_MUSIC), a	
		pop	af
		ld	(CURRENT_MUSIC), a
		jp	Resume_Music		

Not_Previous_Music:		
		push	hl		; else,	play a music !
		push	de
		push	af
		ld	a, (MUSIC_BANK)
		ld	(SAVED_MUSIC_BANK), a	
		pop	af
		push	af
		cp	21h ; '!'
		jr	nc, loc_201	; if a > 21h, then play	music from chunk 0x1F0000
		ld	a, MUSIC_BANK_1		; otherwise play music from 0x1F8000
		ld	(MUSIC_BANK), a	; load 01h to 0x152D
		call	LoadAnyBank	; load rom chunk 0x1F8000 to bank
		ld	a, (CURRENT_MUSIC)	
		ld	(PREVIOUS_MUSIC), a
		pop	af
		ld	(CURRENT_MUSIC), a
		ld	de, 8000h
		jp	Load_Music	; decrement music/sound	index (no $00 entry)
; ---------------------------------------------------------------------------

loc_201:				; CODE XREF: Main+29j
		ld	a, MUSIC_BANK_2	
		ld	(MUSIC_BANK), a
		call	LoadAnyBank	; load rom chunk 0x1F0000 to bank
		ld	a, (CURRENT_MUSIC)	
		ld	(PREVIOUS_MUSIC), a
		pop	af
		ld	(CURRENT_MUSIC), a
		ld	de, 8000h
		sub	20h ; ' '

Load_Music:				; CODE XREF: Main+37j
		dec	a		; decrement music/sound	index (no $00 entry)
		add	a, a		; double index because the pointer table to reach has 2	bytes per entry
		ld	h, 0
		ld	l, a
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a		; now hl contains pointer to music/sound data
		ld	a, (hl)		; get byte 0
		or	a		; check	if a = 0 with z	flag
		jp	nz, Load_SFX	; if byte 0 of music data != 0,	actually load it as an SFX instead
		ld	a, (FADE_IN_PARAMETERS)	; fade in parameter applied from 68k when a music is loaded. nibble 1 :	fade in	speed. nibble 2	: fade in start	level.
		and	0Fh
		ld	(MUSIC_LEVEL), a ; general output level	for music and SFX type 1, sent from 68k
		xor	a
		ld	(FADE_IN_TIMER), a ; reset fade	in timer
		
		call	Save_Music
		
		call	StopMusic	; stop currently playing music if there	was one
		inc	hl
		ld	a, (hl)		; get music data byte 1	: indicates if music uses DAC Samples
		inc	hl		; so music byte	2 is useless ? I guess it was intended to use YM Timer A first,	which needs two	data bytes
		inc	hl		; point	to byte	3 : YM Timer B value
		ld	(MUSIC_DOESNT_USE_SAMPLES), a ;	indicates if music uses	DAC Samples
		ld	a, (hl)
		ld	(YM_TIMER_VALUE), a
		call	YM_SetTimer
		xor	a
		ld	(CURRENTLY_FADING_OUT),	a ; clear fade out bytes
		ld	(FADE_OUT_COUNTER), a ;	Counts how many	times the fade out timer reached 0. Fade out stops at value $0C.
		ld	a, 63h ; 'c'
		ld	(FADE_OUT_TIMER), a ; Starts with fade out length value, decrements at each YM Timer overflow. set to $63 while	loading	music
		inc	hl		; hl now points	to the first of	the ten	pointers
		ld	b, 0Ah		; number of loops
		ld	ix, MUSIC_CHANNEL_YM1 ;	start of the data to store

Load_Music_Channels:			; CODE XREF: Main+C8j
		ld	e, (hl)		; this part initializes	each channel ram data
		inc	hl
		ld	d, (hl)		; de = channel data pointer
		inc	hl		; point	to first byte of next pointer
		ld	(ix+0),	e
		ld	(ix+1),	d	; init data pointer
		xor	a		; and let me present to	you ...
		ld	(ix+2),	a	; time counter for note/sample length
		ld	(ix+3),	a	; "channel not in use" indicator
		ld	(ix+6),	a	; key release time (release key	when time counter 02 reaches this value)
		ld	(ix+8),	a	; set to $80 when there	is no key release
		ld	(ix+13h), a
		ld	(ix+14h), a	; loop A start pointer
		ld	(ix+1Ch), a	; note shift value
		ld	(ix+1Dh), a	; frequency shift value
		ld	(ix+1Fh), a	; slide	speed
		ld	a, 1
		ld	(ix+1Eh), a	; stereo setting
		ld	d, (ix+1)
		ld	e, (ix+0)
		ld	a, (de)		; get first pointed data byte
		cp	0FFh
		jr	nz, loc_28A
		ld	a, 1		; if first byte	of channel data	= FF, then there is no data for	this channel
		ld	(ix+3),	a	; "channel not in use"

loc_28A:				; CODE XREF: Main+BCj
		ld	de, 30h	; ' '
		add	ix, de
		djnz	Load_Music_Channels ; actual loop instruction based on register	b
		ld	b, 2		; loop two times

Activate_Stereo_Outputs:		; CODE XREF: Main+E1j
		push	bc
		ld	a, b
		dec	a
		ld	(CALL_YM2_INSTEAD_OF_YM1), a ; set to $01 when managing	YM4,5,6	channels, to call part 2 of YM
		ld	bc, 0B4C0h	; activate left	and right sound	outputs	for each channel
		call	YM_Input	; first	channel	of called YM part
		inc	b
		call	YM_Input	; second channel
		inc	b
		call	YM_Input	; third	channel
		pop	bc
		djnz	Activate_Stereo_Outputs
		
		ld	a, 0C0h	; '¿'   ; set C0h for byte 1E of YM channels
		ld	(MUSIC_CHANNEL_YM1_STEREO), a
		ld	(MUSIC_CHANNEL_YM2_STEREO), a
		ld	(MUSIC_CHANNEL_YM3_STEREO), a		
		ld	(MUSIC_CHANNEL_YM4_STEREO), a
		ld	(MUSIC_CHANNEL_YM5_STEREO), a
		ld	(MUSIC_CHANNEL_YM6_STEREO), a
		ld	a, 0FEh	; '˛'   ; put value FE as DAC Sound sample to load ... which loads nothing. Why such a thing then ?
		ld	(NEW_SAMPLE_TO_LOAD), a	; stores the index of a	new DAC	sample to play
		call	YM_LoadTimerB

Load_End:				; CODE XREF: Main+12Aj	Main+134j
					; Main+166j
		pop	de		; end of the loadSFX and loadMusic chunks
		pop	hl
		ld	a, (DAC_BANK)
		jp	LoadAnyBank
; ---------------------------------------------------------------------------

Load_SFX:				; CODE XREF: Main+21j Main+53j
		push	hl		; looks	like the part to play SFX
		push	de
		sub	41h ; 'A'
		ld	h, 0
		ld	l, a
		ld	a, SFX_BANK
		call	LoadAnyBank		
		add	hl, hl		; a is an index, and you double	it to access to	a pointer table
		ld	de, SFX_BANK_OFFSET	; SFX in ROM Bank		
		add	hl, de	
		ld	a, (hl)
		inc	hl
		ld	h, (hl)		; get the proper pointer
		ld	l, a
		
		; hl now points to original sfx offset, with sfx data starting at 0x162D
		; now sfx data starts at 0xB070 so 0xB070 - 0x162D = 9A43h to add
		push	bc
		ld	b, 9Ah
		ld	c, 43h
		add	hl, bc
		pop	bc
		
		ld	a, h
		ld	(DAC_LAST_OFFSET), a
		ld	a, l	
		ld	(DAC_LAST_OFFSET+1), a						
		ld	a, (hl)		
		inc	hl		; hl points to byte 1 of sfx data
		cp	1
		jr	nz, Load_SFX_Type_2 ; if a != 1	(then a	= 2, which means the sound just	concerns 3 channels)
		ld	b, 0Ah		; loop 10 times
		ld	ix, SFX_CHANNEL_YM1

Load_SFX_Channels:			; CODE XREF: Main+128j
		ld	e, (hl)		; part to get next channel data
		inc	hl
		ld	d, (hl)		; de = bytes 2-3 of sound data = pointer
		inc	hl
		
		; add 9A43h to sfx data offset since it's been moved from driver to bank
		push	hl		
		ld	hl, 09A43h
		adc	hl, de
		ex	hl, de
		pop	hl
		
		ld	a, (de)		; a = first byte of current channel
		cp	0FFh		; if first byte	= FF, there is no data to setup, so skip subroutine call
		jr	z, loc_2EA
		call	InitChannelDataForSFX

loc_2EA:				; CODE XREF: Main+11Ej
		ld	de, 30h	; ' '
		add	ix, de		; go to	next channel data
		djnz	Load_SFX_Channels ; loop
		jr	Load_End	
; ---------------------------------------------------------------------------

Load_SFX_Type_2:			; CODE XREF: Main+10Fj
		ld	bc, 304h	; loop 3 times13/12/2008 17:14:41
		ld	ix, SFX_CHANNEL_YM4 ;	the 3 channel SFX are stored in	dedicated temp channel data, in	order not to overwrite current music data

loc_309:				; CODE XREF: Main+164j
		push	bc
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl		; hl points to next pointer
		
		; add 9A43h to sfx data offset since it's been moved from driver to bank
		push	hl		
		ld	hl, 09A43h
		adc	hl, de
		ex	hl, de
		pop	hl
		
		ld	a, (de)		; a = first byte of current channel
		cp	0FFh
		jr	z, loc_324	; if a = FF, ignore this channel
		call	InitChannelDataForSFX ;	otherwise, init	channel	data
		ld	b, 28h ; '('    ; YM register : Key on/off
		call	YM1_Input	; input	"key off" for YM channel 4, 5, 6 respectively for channel 1,2,3 of the sound
		ld	c, a		; a = c	= current YM channel to	use
		add	a, 0B0h	; '∞'   ; a = YM register to activate left and right stereo outputs
		ld	b, a
		ld	c, 0C0h	; '¿'   ; sets stereo left and right on
		call	YM2_Input

loc_324:				; CODE XREF: Main+14Aj
		ld	de, 30h	; ' '
		add	ix, de		; point	next channel destination slot
		pop	bc
		inc	c		; next channel number
		djnz	loc_309		; loop
		jp	Load_End	; end of the loadSFX and loadMusic chunks
; End of function Main


; =============== S U B	R O U T	I N E =======================================


InitChannelDataForSFX:			; CODE XREF: Main+120p	Main+14Cp
		ld	(ix+0),	e
		ld	(ix+1),	d	; bytes	0-1 = ed = offset of channel data source
		ld	a, 0C0h	; '¿'
		ld	(ix+1Eh), a	; byte 1E = C0
		xor	a		; clear	a
		ld	(ix+2),	a	; clear	all those bytes
		ld	(ix+3),	a
		ld	(ix+6),	a
		ld	(ix+8),	a
		ld	(ix+13h), a
		ld	(ix+14h), a
		ld	(ix+1Ch), a
		ld	(ix+1Dh), a
		ld	(ix+1Fh), a
		ld	a, 1
		ld	(ix+1Eh), a	; byte 1E = 1 ... er ... why is	it set to $CO first and	then to	1 at the end ?
		ret			; Definitely need to watch stereo stuff !
; End of function InitChannelDataForSFX


; =============== S U B	R O U T	I N E =======================================


StopMusic:				; CODE XREF: Main+Dj Main+65p
					; UpdateSound+56p
		push	hl		; the subroutine sets key off /	mutes channels playing music
		ld	iy, CURRENT_CHANNEL ; indicates	the channel to process,	from a relative	point of view :	YM1, YM2, PSG or SFX channels
		xor	a
		ld	(CALL_YM2_INSTEAD_OF_YM1), a ; set to $01 when managing	YM4,5,6	channels, to call part 2 of YM
		ld	(iy+0),	a
		ld	ix, MUSIC_CHANNEL_YM1
		call	YM1_LoadInstrument
		ld	bc, 2800h	; YM register :	Key on/off
		call	YM1_ConditionnalInput	; set Key OFF
		inc	(iy+0)
		xor	a
		ld	ix, MUSIC_CHANNEL_YM2
		call	YM1_LoadInstrument
		ld	bc, 2801h	; YM register :	Key on/off
		call	YM1_ConditionnalInput	; set Key OFF
		inc	(iy+0)
		xor	a
		ld	ix, MUSIC_CHANNEL_YM3
		call	YM1_LoadInstrument
		ld	bc, 2802h	; YM register :	Key on/off
		call	YM1_ConditionnalInput	; set Key OFF
		ld	a, 1
		ld	(CALL_YM2_INSTEAD_OF_YM1), a ; set to $01 when managing	YM4,5,6	channels, to call part 2 of YM
		xor	a
		ld	(iy+0),	a
		ld	a, (SFX_CHANNEL_YM4_NOT_IN_USE)
		or	a
		jr	z, loc_3B5
		xor	a
		ld	ix, MUSIC_CHANNEL_YM4
		call	YM2_LoadInstrument
		ld	bc, 2804h	; YM register :	Key on/off
		call	YM1_ConditionnalInput

loc_3B5:				; CODE XREF: StopMusic+48j
		inc	(iy+0)
		ld	a, (SFX_CHANNEL_YM5_NOT_IN_USE)
		or	a
		jr	z, loc_3CC
		xor	a
		ld	ix, MUSIC_CHANNEL_YM5
		call	YM2_LoadInstrument
		ld	bc, 2805h	; YM register :	Key on/off
		call	YM1_ConditionnalInput

loc_3CC:				; CODE XREF: StopMusic+5Fj
		inc	(iy+0)
		ld	a, (SFX_CHANNEL_YM6_NOT_IN_USE)
		or	a
		jr	z, loc_3E3
		xor	a
		ld	ix, MUSIC_CHANNEL_YM6
		call	YM2_LoadInstrument
		ld	bc, 2806h	; YM register :	Key on/off
		call	YM1_ConditionnalInput
		jr	loc_3E3
		
StopMusic_DAC:				
		xor	a
		ld	(DAC_REMAINING_LENGTH), a
		inc	a
		ld	(DAC_REMAINING_LENGTH+1), a	

loc_3E3:				; CODE XREF: StopMusic+76j

					; doubt : stop SFX or use conditionnal input ?

		ld	hl, PSG_PORT
		ld	a, 9Fh ; 'ü'
		ld	(hl), a		; set PSG channel 1 volume to 0
		ld	a, 0BFh	; 'ø'
		ld	(hl), a		; set PSG channel 2 volume to 0
		ld	a, 0DFh	; 'ﬂ'
		ld	(hl), a		; set PSG channel 3 volume to 0
		ld	a, 0FFh
		ld	(hl), a		; set PSG noise	channel	volume to 0
		ld	hl, MUSIC_CHANNEL_YM1_NOT_IN_USE ; also pointed once	from 68k, to know if music/sfx is currently being played, I guess
		ld	de, 30h	; ' '   ; value to add to pointer to go to next channel in ram
		ld	b, 0Ah		; loop ten times
		ld	a, 1

loc_3FC:				; CODE XREF: StopMusic+A1j
		ld	(hl), a		; set "Channel not in use" byte
		add	hl, de		; go to	next channel
		djnz	loc_3FC		; loop until PSG Noise Channel.	SFX extra channels are not concerned.
		pop	hl
		ld	de, 0
		xor	a
		ld	(CURRENTLY_FADING_OUT),	a ; set	to 01 when a fade out operation	is being executed
		ld	(FADE_OUT_COUNTER), a ;	Counts how many	times the fade out timer reached 0. Fade out stops at value $0C.
		ld	a, 63h ; 'c'
		ld	(FADE_OUT_TIMER), a ; Starts with fade out length value, decrements at each YM Timer overflow. set to $63 while	loading	music
		ret
; End of function StopMusic


; =============== S U B	R O U T	I N E =======================================


UpdateSound:				; CODE XREF: Main_Loop+7p
		push	bc		; this is THE subroutine that updates every channel at each YM Timer overflow. Quite important !
		push	de
		push	hl
		
		; This part activates/deactivates DAC on YM6
		
		ld	bc, 2B80h	; bc = enable DAC
		ld	a, (MUSIC_DOESNT_USE_SAMPLES)
		or	a
		jr	z, loc_42B	; if music uses	DAC samples, enable DAC
		ld	a, (SFX_CHANNEL_YM6_NOT_IN_USE)
		or	a
		jr	z, loc_42B	; else,	if (0x1503) = 0, then a	DAC sample is played as	an SFX,	so enable DAC
		ld	bc, 2B00h	; else,	disable	DAC

loc_42B:				; CODE XREF: UpdateSound+Aj
					; UpdateSound+10j
		call	YM1_Input	; enable/disable DAC
		
		; This part updates music level with possible fade in parameters
		
		ld	hl, FADE_IN_TIMER ; incremented	at each	YM Timer overflow. When	it corresponds to fade in parameter, increment YM instruments level until max level
		inc	(hl)		; increment counter
		ld	a, (FADE_IN_PARAMETERS)	; fade in parameter applied from 68k when a music is loaded. nibble 1 :	fade in	speed. nibble 2	: fade in start	level.
		rrca			; two circular right rotates
		rrca
		and	3Ch ; '<'       ; just keep nibble 1 * 4
		jr	z, loc_44C
		cp	(hl)
		jr	nz, loc_44C
		xor	a		; if MusicCounter = Nibble 1 * 4 and !=	0
		ld	(hl), a		; clear	MusicCounter
		ld	hl, MUSIC_LEVEL	; general output level for music and SFX type 1, sent from 68k
		ld	a, (hl)
		cp	0Fh
		jr	z, loc_44C
		inc	(hl)		; if music level not 0F, increment it and update YM instruments	levels
		ld	a, (hl)
		cp	0Fh
		jr	z, update_level
		inc	(hl)
		ld	a, (hl)
		cp	0Fh
		jr	z, update_level
		inc	(hl)
		ld	a, (hl)
		cp	0Fh
		jr	z, update_level
		inc	(hl)
update_level:		
		call	YM_UpdateInstrumentsLevels

loc_44C:				; CODE XREF: UpdateSound+23j
					; UpdateSound+26j UpdateSound+30j			
		
		; This part manages fade out and stops music at fade out end
		
		ld	a, (CURRENTLY_FADING_OUT) ; set	to 01 when a fade out operation	is being executed
		or	a
		jr	z, loc_475	; jump unless currently	executing a fade out
		ld	a, (FADE_OUT_TIMER) ; Starts with fade out length value, decrements at each YM Timer overflow. set to $63 while	loading	music
		or	a
		jr	nz, loc_471
		ld	a, (FADE_OUT_LENGTH) ; number of YM Timer overflows to handle before incrementing the fade out counter
		ld	(FADE_OUT_TIMER), a ; Starts with fade out length value, decrements at each YM Timer overflow. set to $63 while	loading	music
		ld	a, (FADE_OUT_COUNTER) ;	Counts how many	times the fade out timer reached 0. Fade out stops at value $0C.
		inc	a
		ld	(FADE_OUT_COUNTER), a ;	increment fade out counter if fade out timer has reached 0
		cp	0Ch
		jr	nz, loc_475	; reload timer B
		call	StopMusic	; if FadeOutCounter = 0Ch, then	stop music because it's the end of a fade out operation
		jp	loc_4DE
; ---------------------------------------------------------------------------

loc_471:				; CODE XREF: UpdateSound+43j
		dec	a
		ld	(FADE_OUT_TIMER), a ; decrement	fade out timer

loc_475:				; CODE XREF: UpdateSound+3Dj
					; UpdateSound+54j
				
		ld	a, (MUSIC_BANK)
		call	LoadAnyBank				
					
		; Start of Music Update	
					
		call	YM_LoadTimerB	; reload timer B
		ld	iy, CURRENT_CHANNEL ; indicates	the channel to process,	from a relative	point of view :	YM1, YM2, PSG or SFX channels
		xor	a
		ld	(CURRENTLY_MANAGING_SFX), a
		ld	(CALL_YM2_INSTEAD_OF_YM1), a ; taking care of YM 1,2,3
		ld	(iy+0),	a
		call	YM1_ParseData
		
		; DAC Byte intermediate transmission
		call	SendDacByte
		
		inc	(iy+0)
		call	YM1_ParseData
		
		; DAC Byte intermediate transmission
		call	SendDacByte
		
		inc	(iy+0)
		call	YM1_ParseData
		
		; DAC Byte intermediate transmission
		call	SendDacByte
		
		ld	a, 1
		ld	(CALL_YM2_INSTEAD_OF_YM1), a ; taking care of YM 4,5,6
		xor	a
		ld	(iy+0),	a
		call	YM2_ParseData
		
		; DAC Byte intermediate transmission
		call	SendDacByte
		
		inc	(iy+0)
		call	YM2_ParseData
		
		; DAC Byte intermediate transmission
		call	SendDacByte
		
		inc	(iy+0)
		call	YM2_ParseChannel6Data
		
		; DAC Byte intermediate transmission
		call	SendDacByte
		
		xor	a
		ld	(iy+0),	a
		call	PSG_ParseToneData
		
		; DAC Byte intermediate transmission
		call	SendDacByte
		
		inc	(iy+0)
		call	PSG_ParseToneData
		
		; DAC Byte intermediate transmission
		call	SendDacByte
			
		inc	(iy+0)
		call	PSG_ParseToneData
		
		; DAC Byte intermediate transmission
		call	SendDacByte
		
		inc	(iy+0)
		call	PSG_ParseNoiseData
		
		; DAC Byte intermediate transmission
		call	SendDacByte
		
		
		; Start of SFX Update
		
		ld	a, SFX_BANK
		call	LoadAnyBank		
		ld	a, 1
		ld	(CURRENTLY_MANAGING_SFX), a
		xor	a
		ld	(CALL_YM2_INSTEAD_OF_YM1), a ; taking care of YM 1,2,3
		ld	(iy+0),	a
		call	YM1_ParseData
		inc	(iy+0)
		call	YM1_ParseData
		inc	(iy+0)
		call	YM1_ParseData
		ld	a, 1
		ld	(CALL_YM2_INSTEAD_OF_YM1), a ; taking care of YM 4,5,6
		xor	a
		ld	(iy+0),	a
		call	YM2_ParseData
		inc	(iy+0)
		call	YM2_ParseData
		inc	(iy+0)
		call	YM2_ParseChannel6Data
		xor	a
		ld	(iy+0),	a
		call	PSG_ParseToneData
		inc	(iy+0)
		call	PSG_ParseToneData		
		inc	(iy+0)
		call	PSG_ParseToneData
		inc	(iy+0)
		call	PSG_ParseNoiseData		
		
		ld	a, 0
		ld	(CURRENTLY_MANAGING_SFX), a

loc_4DE:				; CODE XREF: UpdateSound+59j
		ld	a, (DAC_BANK)
		call	LoadAnyBank
		pop	hl
		pop	de
		pop	bc
		ret
; End of function UpdateSound


; =============== S U B	R O U T	I N E =======================================


YM_LoadTimerB:				; CODE XREF: Main+F3p
					; UpdateSound:loc_475p
		ld	bc, 273Ah	; reset	timers A and B,	enable and load	B
		jr	YM1_Input
; End of function YM_LoadTimerB


; =============== S U B	R O U T	I N E =======================================


YM1_ConditionnalInput:			; CODE XREF: YM2_ParseData+45p
					; YM2_ParseData+154p
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	nz, YM1_Input	; if currently managing	SFX channel data, then just send data to YM1
		exx
		push	ix		; otherwise, check if an SFX is	being played on	YM4,5,6
		pop	hl
		ld	bc, 01E3h ; '„'
		add	hl, bc
		ld	a, (hl)		; get "channel not in use" byte for SFX Channel 1
		exx
		or	a
		jr	nz, YM1_Input	; don't send data to YM if an SFX is being played, as it has priority over music
		ret
; End of function YM1_ConditionnalInput


; =============== S U B	R O U T	I N E =======================================


YM_Input:				; CODE XREF: Pause_Sound:loc_6Bp
					; Pause_Sound+12p Pause_Sound+16p
					; Main+D5p Main+D9p Main+DDp
		ld	a, (CALL_YM2_INSTEAD_OF_YM1) ; set to $01 when managing	YM4,5,6	channels, to call part 2 of YM
		or	a
		jr	nz, YM2_ConditionalInput ; if CallYm2InsteadOfYm1 set
		jp	YM1_ConditionnalInput
; End of function YM_Input


; =============== S U B	R O U T	I N E =======================================


YM1_Input:				; CODE XREF: Main+72p Main+151p
					; StopMusic+16p StopMusic+27p
					; StopMusic+38p StopMusic+55p
					; StopMusic+6Cp StopMusic+83p
					; UpdateSound:loc_42Bp
					; YM_LoadTimerB+3j
					; YM1_ConditionnalInput+4j
					; YM1_ConditionnalInput+11j
					; YM1_Input+5j	YM1_ParseData+38p
					; YM1_ParseData:loc_668p
					; YM1_ParseData:loc_680p
					; YM1_ParseData+124p
					; YM1_ParseData+213p
					; YM1_ParseData+21Cp
					; YM1_LoadInstrument+46p
					; YM1_LoadInstrument:loc_A79p
					; YM1_LoadInstrument+92p
					; YM1_LoadInstrument+A0p
					; PSG_ParseToneData+7Dp
					; YM1_SetStereo+11j YM_SetTimer+7p
		ld	a, (YM1_REGISTER) ; the	subroutine sends value c in register b of YM1
		and	80h ; 'Ä'
		jr	nz, YM1_Input	; loop as long as YM2612 busy
		ld	a, b
		ld	(YM1_REGISTER),	a ; write address to part I
		ld	a, c
		ld	(YM1_DATA), a	; write	data to	part I
		ret
; End of function YM1_Input


; =============== S U B	R O U T	I N E =======================================


YM2_ConditionalInput:			; CODE XREF: YM_Input+4j
					; YM2_ParseData:loc_8C0p
					; YM2_ParseData:loc_8D8p
					; YM2_ParseData+243p
					; YM2_ParseData+24Cp
					; YM2_LoadInstrument+51p
					; YM2_LoadInstrument:loc_B32p
					; YM2_LoadInstrument+9Dp
					; YM2_LoadInstrument+ABp
					; YM2_SetStereo+10j
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	nz, YM2_Input	; if currently managing	SFX channel ram	data, just send	byte to	YM
		exx
		push	ix		; otherwise, first check if an SFX is being played with	YM4,5,6	channels
		pop	hl
		ld	bc, 01E3h ; '„'
		add	hl, bc
		ld	a, (hl)		; get "channel not in use" byte of SFX channel 1
		exx
		or	a		; if SFX currently being played, then don't send data to YM2, as SFX has priority
		ret	z
; End of function YM2_ConditionalInput


; =============== S U B	R O U T	I N E =======================================


YM2_Input:				; CODE XREF: Pause_Sound:loc_85p
					; Pause_Sound+2Cp Pause_Sound+30p
					; Main+15Ap YM2_ConditionalInput+4j
					; YM2_Input+5j	YM2_ParseData+94p
					; YM2_ParseChannel6Data+78p
		ld	a, (YM2_REGISTER)
		and	80h ; 'Ä'
		jr	nz, YM2_Input	; loop as long as YM2612 busy
		ld	a, b
		ld	(YM2_REGISTER),	a ; write address to YM2
		ld	a, c
		ld	(YM2_DATA), a	; write	data to	YM2
		ret
; End of function YM2_Input

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR PSG_ParseToneData

PSG_SetChannelAttenuation:		; CODE XREF: PSG_ParseToneData+4Fj
					; PSG_ParseNoiseData+41j
		and	0Fh		; just keep attenuation	parameter
		ld	h, a		; save it
		ld	a, (CURRENT_PSG_CHANNEL) ; get concerned channel
		or	h		; load attenuation value
		or	90h ; 'ê'       ; load attenuation command bits
		ld	(PSG_PORT), a	; send message
		ret
; END OF FUNCTION CHUNK	FOR PSG_ParseToneData

; =============== S U B	R O U T	I N E =======================================


DAC_SetNewSample:			; CODE XREF: YM2_ParseChannel6Data+2Dp
					; YM2_ParseChannel6Data+B7p
		ld	b, a
		ld	a, (CURRENTLY_MANAGING_SFX) ; indicates if an SFX type 2	is being processed, because these ones use extra channel ram areas, to keep current music data for when	SFX is finished
		or	a
		jr	nz, loc_562	; if currently managing	SFX channel ram	data, just set new sample to load
		exx
		push	ix		; otherwise, check if an SFX is	being played, since it has priority
		pop	hl
		ld	bc, 01E3h ; '„'
		add	hl, bc
		ld	a, (hl)		; get "channel not in use" byte for SFX Channel 1
		exx
		or	a
		ret	z		; if SFX Channel 1 in use, return
		ld	a, (FADE_OUT_COUNTER) ;	Counts how many	times the fade out timer reached 0. Fade out stops at value $0C.
		cp	3		; if fade out counter >	3, don't play sample, it would be too loud compared to the other channels
		ret	nc
		ld	a, (MUSIC_LEVEL) ; general output level	for music and SFX type 1, sent from 68k
		cp	0Fh		; if general sound level not at	its max, then don't play sample
		ret	nz

loc_562:				; CODE XREF: DAC_SetNewSample+5j
		ld	a, b
		ld	(NEW_SAMPLE_TO_LOAD), a	; stores the index of a	new DAC	sample to play
		ret
; End of function DAC_SetNewSample


; =============== S U B	R O U T	I N E =======================================


YM1_ParseData:				; CODE XREF: UpdateSound+70p
					; UpdateSound+76p UpdateSound+7Cp
		ld	a, (iy+0)	; iy : channel to process
		ld	ix, MUSIC_CHANNEL_YM1
		push	af
		add	a, a		; THIS PART just inits iy, ix, and frequency registers
		add	a, a
		add	a, a
		add	a, a		; a = 10h * a
		ld	d, a		; d = 10h * a
		add	a, a		; a = 20h * a
		add	a, d		; a = 30h * a
		ld	d, 0
		ld	e, a
		add	ix, de		; point	to appropriate channel ram data
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	z, loc_nimp
		ld	de, 01E0h ; '‡'  ; point to the right SFX channel data
		add	ix, de
loc_nimp:				
		pop	af
		ld	c, 0A0h	; '†'
		add	a, c		; A0 + channel number :	first input address of frequency  register
		ld	(loc_77D+1), a	; parameter directly moved to code in ram !
		ld	c, 4
		add	a, c		; (0x77E) + 4 :	second input address of	frequency register
		ld	(loc_774+1), a	; parameter directly moved to code in ram !

loc_586:				; CODE XREF: YM1_ParseData+140j
		ld	a, (ix+3)	; THIS PART checks if the channel actually has to be used or not
		or	a
		ret	nz		; if byte 3 = 1, do nothing with this channel
		ld	a, (ix+6)	; THIS PART seems to check if it's time to release key or not yet
		cp	(ix+2)
		jr	nz, loc_5A2	; if bytes 2 !=	byte 6,	then it's not yet the end of note
		ld	a, (ix+8)	; if byte 2 = byte 6, end of note counter, check byte 8
		or	a
		jr	nz, loc_5A2	; if byte 8 != 0
		ld	b, 28h ; '('    ; so if (byte 2 = byte 6) and (byte 8 = 0), set key off
		ld	a, (iy+0)	; concerned channel
		ld	c, a
		call	YM1_ConditionnalInput	; set key OFF

loc_5A2:				; CODE XREF: YM1_ParseData+2Aj
					; YM1_ParseData+30j
		ld	a, (ix+2)	; THIS PART checks if it's time to parse new music data or not yet (I think)
		or	a
		jp	nz, loc_6AA	; if byte 2 != 0
		ld	d, (ix+1)
		ld	e, (ix+0)	; get ROM offset of next byte to parse

Parsing_Start:				; CODE XREF: YM1_ParseData+7Aj
					; YM1_ParseData+86j YM1_ParseData+95j
					; YM1_ParseData+9Fj YM1_ParseData+A9j
					; YM1_ParseData+B3j YM1_ParseData+BDj
					; YM1_ParseData+C7j YM1_ParseData+CCj
		xor	a		; THIS PART checks if parsed byte is a command or a parameter
		ld	(ix+0Dh), a	; clear	vibrato	relative pointer
		ld	a, (ix+9)
		ld	(ix+0Ah), a	; load time counter before vibrato
		ld	a, (de)		; get pointed byte in rom
		and	0F8h ; '¯'      ; keep only bits 7-3
		cp	0F8h ; '¯'
		jp	nz, loc_636	; if kept bits of pointed byte != F8, so if data byte is not a command
		ld	a, (de)		; else,	value of pointed rom byte is a command
		cp	0FFh
		jp	nz, Set_Instrument ; if	pointed	byte !=	FF, go test other possible command values
		inc	de		; if pointed rom byte =	FF, then get next two bytes
		ld	a, (de)		; THIS PART handles an FF command
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		or	a
		jr	nz, YM1_Parse_At_New_Offset ; if second	byte !=	0, we have FF xx xx, so	go parse from new offset xxxx
		ld	a, l
		or	a
		jr	z, loc_5D7	; if we	have FF	00 00, then mute channel because there is nothing else to do
		ld	(NEW_OPERATION), a ; else, we have FF xx 00, so	put first byte in 0x1FFF to process operation xx

loc_5D7:				; CODE XREF: YM1_ParseData+6Bj
		ld	a, 1		; THIS PART mutes the channel because it has nothing to	play
		ld	(ix+3),	a	; channel data byte 3 =	1
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	z, loc_nimp2
		ld	bc, 0FE20h	; if an	SFX was	being managed, go back to corresponding	music channel
		add	ix, bc
		ld	a, 0B4h	; '¥'   ; YM Register : Stereo / LFO Sensitivity
		add	a, (iy+0)
		ld	b, a
		ld	c, (ix+1Eh)	; load corresponding music channel stereo setting
		call	YM1_Input
		ld	a, (ix+3)
		or	a
		jr	nz, loc_nimp2
		ld	a, (ix+4)	; if corresponding music channel in use, load its instrument, and return
		jp	YM1_LoadInstrument	
		
		
			
loc_nimp2:		
		xor	a
		jp	YM1_LoadInstrument ; set channel level to minimum and leave subroutine
; ---------------------------------------------------------------------------

YM1_Parse_At_New_Offset:		; CODE XREF: YM1_ParseData+67j
		ex	de, hl		; THIS PART puts in de the new offset from which to parse data
		jr	Parsing_Start
; ---------------------------------------------------------------------------

Set_Instrument:				; CODE XREF: YM1_ParseData+5Dj
		cp	0FEh ; '˛'      ; FE xx : set new instrument xx
		jr	nz, Load_Note	; FD xx	: play note at level xx. It's followed by other parameters handled at next parsing loop
		inc	de
		ld	a, (de)
		call	YM1_SetChannelInstrument
		inc	de
		jp	Parsing_Start
; ---------------------------------------------------------------------------

Load_Note:				; CODE XREF: YM1_ParseData+7Ej
		cp	0FDh ; '˝'      ; FD xx : play note at level xx. It's followed by other parameters handled at next parsing loop
		jr	nz, Set_Slide_Or_Key_Release
		inc	de
		ld	a, (de)		; get note level
		and	0Fh		
		call	YM1_LoadInstrument
		inc	de
		jp	Parsing_Start
; ---------------------------------------------------------------------------

Set_Slide_Or_Key_Release:		; CODE XREF: YM1_ParseData+8Bj
		cp	0FCh ; '¸'
		jr	nz, Load_Vibrato
		call	YM_SetSlideOrKeyRelease
		jp	Parsing_Start
; ---------------------------------------------------------------------------

Load_Vibrato:				; CODE XREF: YM1_ParseData+9Aj
		cp	0FBh ; '˚'
		jr	nz, Set_Stereo
		call	LoadVibrato
		jp	Parsing_Start
; ---------------------------------------------------------------------------

Set_Stereo:				; CODE XREF: YM1_ParseData+A4j
		cp	0FAh ; '˙'
		jr	nz, Load_Note_Shift
		call	YM1_SetStereo
		jp	Parsing_Start
; ---------------------------------------------------------------------------

Load_Note_Shift:			; CODE XREF: YM1_ParseData+AEj
		cp	0F9h ; '˘'
		jr	nz, Loop_Command
		call	LoadNoteShift
		jp	Parsing_Start
; ---------------------------------------------------------------------------

Loop_Command:				; CODE XREF: YM1_ParseData+B8j
		cp	0F8h ; '¯'
		jr	nz, Theoretically_Unreachable
		call	ParseLoopCommand
		jp	Parsing_Start
; ---------------------------------------------------------------------------

Theoretically_Unreachable:		; CODE XREF: YM1_ParseData+C2j
		inc	de		; if none of the commands from above are found,
		inc	de		; then ignore and start	process	again two bytes	forward. Theoretically,	it can't happen ...
		jp	Parsing_Start
; ---------------------------------------------------------------------------

loc_636:				; CODE XREF: YM1_ParseData+57j
		ld	a, (de)		; we are here because a	< F8, so a can still be	F0, 70,	or a new note frequency	to play
		and	7Fh ; ''
		cp	70h ; 'p'
		jp	z, loc_68E	; if a = F0 or 70. Else, a is a	note frequency byte
		add	a, (ix+1Ch)	; 1C affects note index	up or down. It's set by command F9
		ld	l, a
		ld	h, 0
		ld	bc, t_YM_FREQUENCIES ; load table of YM	frequencies
		add	hl, hl
		add	hl, bc		; now hl points	to the YM frequency value corresponding	to the note's frequency
		ld	a, (hl)
		dec	hl
		ld	l, (hl)		; l = byte to put in YM	Register Frequency 2
		ld	h, a		; h = byte to put in YM	Register Frequency 1
		ld	b, 0
		ld	c, (ix+1Dh)	; byte 1D affects frequency up.	It's set by command F9. Is it used ? I'll look in SF2 musics
		add	hl, bc
		ld	a, (loc_774+1)
		ld	b, a		; YM Register :	Frequency 2
		ld	c, h		; input	value
		ld	(ix+12h), c
		ld	a, (ix+1Fh)	; if channel byte 1F !=	0, then	pitch slide is activated
		or	a		; so keep final	value to reach in channel byte 12
		jr	nz, loc_668	; then jump
		ld	(ix+0Fh), c	; else,	put it directly	in channel byte	0F
		xor	a
		ld	(ix+12h), a

loc_668:				; CODE XREF: YM1_ParseData+F8j
		call	YM1_ConditionnalInput
		ld	a, (loc_77D+1)	; dynamically changed :	1st frequency register to use corresponding to current channel
		ld	b, a		; YM register :	Frequency 1
		ld	c, l		; input	value
		ld	(ix+11h), c
		ld	a, (ix+1Fh)	; if channel byte 1F !=	0, pitch slide is activated
		or	a		; so keep value	in channel byte	11
		jr	nz, loc_680	; then jump
		ld	(ix+0Eh), c	; else,	put it directly	in channel byte	0E
		xor	a
		ld	(ix+11h), a

loc_680:				; CODE XREF: YM1_ParseData+110j
		call	YM1_ConditionnalInput
		ld	b, 28h ; '('    ; YM Register : Key on/off
		ld	a, (iy+0)
		or	0F0h ; ''      ; set key ON
		ld	c, a
		call	YM1_ConditionnalInput

loc_68E:				; CODE XREF: YM1_ParseData+D4j
		ld	a, (de)		; get full byte	again
		bit	7, a
		jr	nz, Command_F0	; if bit 7 set,	then it's command F0 or it's new note to play needing new note length
		ld	a, (ix+7)	; else use existing time period
		jr	loc_69D
; ---------------------------------------------------------------------------

Command_F0:				; CODE XREF: YM1_ParseData+12Aj
		inc	de		; if a's bit 7 is set, then it's F0
		ld	a, (de)		; set a	new time period	with next byte
		ld	(ix+7),	a

loc_69D:				; CODE XREF: YM1_ParseData+12Fj
		ld	(ix+2),	a	; also put time	period in channel byte 2, which	is the time counter
		inc	de
		ld	(ix+1),	d	; point	to next	channel	rom byte
		ld	(ix+0),	e
		jp	loc_586
; ---------------------------------------------------------------------------

loc_6AA:				; CODE XREF: YM1_ParseData+3Fj
		dec	(ix+2)		; decrement channel time counter
		ld	b, (ix+12h)
		ld	c, (ix+11h)
		ld	a, b
		or	c
		jr	z, loc_72E	; if bc	= 0, then there	is no pitch slide
		ld	a, (ix+0Fh)	; else,	pitch slide !
		ld	h, a
		ld	a, (ix+0Eh)
		ld	l, a		; hl = current frequency ; bc =	frequency to reach
		push	bc
		push	hl
		or	a
		sbc	hl, bc		; get frequency	difference
		ld	a, h
		ld	(TEMP_FREQUENCY), a ; save first frequency byte	... why	?
		jr	nc, loc_6D2	; if bc	<= hl, so if frequency value to	reach is lower
		ld	b, 0
		ld	c, (ix+1Fh)	; frequency to reach is	higher,	so get slide up	value
		jp	loc_6DA
; ---------------------------------------------------------------------------

loc_6D2:				; CODE XREF: YM1_ParseData+161j
		ld	b, 0FFh		; frequency to reach is	lower, so get slide down value
		ld	a, (ix+1Fh)
		neg			; get negative value of	pitch slide speed in order to slide down
		ld	c, a

loc_6DA:				; CODE XREF: YM1_ParseData+168j
		pop	hl
		add	hl, bc		; apply	slide on frequency
		pop	bc
		push	hl
		or	a
		sbc	hl, bc		; get new frequency difference
		ld	a, (TEMP_FREQUENCY) ; xor old h	and new	h
		xor	h
		bit	7, a
		pop	hl
		jr	nz, loc_721	; jump if bit 7	of xor result =	1, go put final	pitch as current frequency, but	how can	it happen ?
		push	hl
		ld	a, h
		and	7		; leave	octave bits, just keep frequency bits
		ld	h, a
		ld	(TEMP_FREQUENCY), hl ; save new	frequency
		ld	bc, 4D4h
		or	a
		sbc	hl, bc
		jr	c, loc_700	; if hl	frequency (without octave) < $4D4
		ld	bc, 596h	; hl > $4D4, so	add $596
		jp	loc_714
; ---------------------------------------------------------------------------

loc_700:				; CODE XREF: YM1_ParseData+191j
		ld	hl, (TEMP_FREQUENCY) ; temp space to store frequency values when YM data is parsed
		ld	bc, 26Ah	; 2 * $26A = $4D4
		or	a
		sbc	hl, bc
		jr	nc, loc_711	; if hl	frequency (without octave) >= 26A
		ld	bc, 0FA6Ah	; hl < $26A, so	sub $596
		jp	loc_714
; ---------------------------------------------------------------------------

loc_711:				; CODE XREF: YM1_ParseData+1A2j
		ld	bc, 0		; hl between $26A and $4D4, so do nothing

loc_714:				; CODE XREF: YM1_ParseData+196j
					; YM1_ParseData+1A7j
		pop	hl
		add	hl, bc
		ld	a, h
		ld	(ix+0Fh), a	; set new frequency... but why do they have to add/sub $596 O___o ?!
		ld	a, l
		ld	(ix+0Eh), a
		jp	loc_72E
; ---------------------------------------------------------------------------

loc_721:				; CODE XREF: YM1_ParseData+181j
		ld	(ix+0Fh), b	; current frequency = final slide pitch
		ld	(ix+0Eh), c
		xor	a
		ld	(ix+11h), a	; end of slide
		ld	(ix+12h), a

loc_72E:				; CODE XREF: YM1_ParseData+14Ej
					; YM1_ParseData+1B7j
		ld	a, (ix+0Ah)
		or	a
		jr	z, loc_73A	; if channel byte 0A = 0 ... then start	vibrato	?
		dec	(ix+0Ah)	; decrement channel byte 0A : I	think this is a	time counter before note vibrato
		xor	a
		jr	EndPart
; ---------------------------------------------------------------------------

loc_73A:				; CODE XREF: YM1_ParseData+1CBj
					; YM1_ParseData+1F9j
		ld	a, (ix+0Ch)
		ld	h, a
		ld	a, (ix+0Bh)
		ld	l, a		; hl = vibrato pointer
		ld	a, (ix+0Dh)	; get vibrato relative pointer
		ld	b, 0
		ld	c, a
		inc	(ix+0Dh)
		add	hl, bc		; point	to next	vibrato	byte
		ld	a, (hl)
		cp	81h ; 'Å'
		jr	nz, loc_757
		dec	(ix+0Dh)	; if byte = 81,	point previous byte and	do nothing ? O_o
		xor	a		; anyway, there's no $81 in the data -_- ...
		jr	EndPart
; ---------------------------------------------------------------------------

loc_757:				; CODE XREF: YM1_ParseData+1E8j
		cp	80h ; 'Ä'
		jp	nz, EndPart
		xor	a		; if byte = 80,	it's the end of vibrato data, so go back to the beginning
		ld	(ix+0Dh), a
		jp	loc_73A
; ---------------------------------------------------------------------------

EndPart:				; CODE XREF: YM1_ParseData+1D1j
					; YM1_ParseData+1EEj
					; YM1_ParseData+1F2j
		ld	c, a		; a = vibrato value to apply
		ld	a, (ix+0Eh)
		ld	l, a
		ld	a, (ix+0Fh)
		ld	h, a		; hl = current note's frequency value
		ld	b, 0
		bit	7, c
		jr	z, loc_773
		dec	b		; if c is a negative value, b =	FF

loc_773:				; CODE XREF: YM1_ParseData+209j
		add	hl, bc		; after	this, up to date frequency is sent to YM

loc_774:				; DATA XREF: YM1_ParseData+1Cw
					; YM1_ParseData+ECr YM2_ParseData+11Ar
		ld	b, 0		; dynamically changed :	2nd frequency register corresponding to	current	channel
		ld	c, h
		ld	(ix+0Fh), c
		call	YM1_ConditionnalInput

loc_77D:				; DATA XREF: YM1_ParseData+16w
					; YM1_ParseData+104r
					; YM2_ParseData+132r
		ld	b, 0		; dynamically changed :	1st frequency register to use corresponding to current channel
		ld	c, l
		ld	(ix+0Eh), c
		call	YM1_ConditionnalInput
		ld	a, (FADE_OUT_TIMER) ; Starts with fade out length value, decrements at each YM Timer overflow. set to $63 while	loading	music
		or	a
		ret	nz
		ld	a, (ix+4)	; if currently fading out, make	sure the instrument level is updated
		jp	YM1_LoadInstrument
; End of function YM1_ParseData


; =============== S U B	R O U T	I N E =======================================


YM2_ParseData:				; CODE XREF: UpdateSound+88p
					; UpdateSound+8Ep UpdateSound+B9p
					; UpdateSound+BFp
					; YM2_ParseChannel6Data+15j
		ld	a, (iy+0)	; exactly the same general behaviour as	YM1_ParseData, with access to YM2 instead
		ld	ix, MUSIC_CHANNEL_YM4
		push	af
		add	a, a
		add	a, a
		add	a, a
		add	a, a		; a = 10h * a
		ld	d, a		; d = 10h * a
		add	a, a		; a = 20h * a
		add	a, d		; a = 30h * a
		ld	d, 0
		ld	e, a
		add	ix, de
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	z, loc_7AE
		ld	de, 01E0h ; '‡'  ; point to the right SFX channel data
		add	ix, de

loc_7AE:				; CODE XREF: YM2_ParseData+16j
		pop	af
		ld	c, 0A0h	; '†'
		add	a, c
		ld	(loc_9D7+1), a
		ld	c, 4
		add	a, c
		ld	(loc_9CE+1), a

loc_7BB:				; CODE XREF: YM2_ParseData+170j
		ld	a, (ix+3)
		or	a
		ret	nz
		ld	a, (ix+6)
		cp	(ix+2)
		jr	nz, loc_7D9
		ld	a, (ix+8)
		or	a
		jr	nz, loc_7D9
		ld	b, 28h ; '('    ; YM register : Key on/off
		ld	a, (iy+0)
		add	a, 4
		ld	c, a
		call	YM1_ConditionnalInput

loc_7D9:				; CODE XREF: YM2_ParseData+35j
					; YM2_ParseData+3Bj
		ld	a, (ix+2)
		or	a
		jp	nz, loc_904
		ld	d, (ix+1)
		ld	e, (ix+0)

loc_7E6:				; CODE XREF: YM2_ParseData+A8j
					; YM2_ParseData+B4j YM2_ParseData+C3j
					; YM2_ParseData+CDj YM2_ParseData+D7j
					; YM2_ParseData+E1j YM2_ParseData+EBj
					; YM2_ParseData+F5j YM2_ParseData+FAj
		xor	a
		ld	(ix+0Dh), a
		ld	a, (ix+9)
		ld	(ix+0Ah), a
		ld	a, (de)
		and	0F8h ; '¯'
		cp	0F8h ; '¯'
		jp	nz, loc_88E
		ld	a, (de)
		cp	0FFh
		jp	nz, setInstrument
		inc	de
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		or	l
		jr	nz, loc_838	; jump if FF xx	xx
		ld	a, 1		; else,	end of data for	this channel
		ld	(ix+3),	a
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	z, loc_834
		ld	bc, 0FE20h	; if an	SFX was	being managed, go back to corresponding	music channel
		add	ix, bc
		ld	a, 0B4h	; '¥'   ; YM Register : Stereo / LFO Sensitivity
		;ld	(DAC_REMAINING_LENGTH), ix
		add	a, (iy+0)
		ld	b, a
		ld	c, (ix+1Eh)	; load corresponding music channel stereo setting
		call	YM2_Input
		ld	a, (ix+3)
		or	a
		jr	nz, loc_834
		ld	a, (ix+4)	; if corresponding music channel in use, load its instrument, and return
		jp	YM2_LoadInstrument
; ---------------------------------------------------------------------------

loc_834:				; CODE XREF: YM2_ParseData+84j
					; YM2_ParseData+9Bj
		xor	a
		jp	YM2_LoadInstrument
; ---------------------------------------------------------------------------

loc_838:				; CODE XREF: YM2_ParseData+74j
		ex	de, hl
		jr	loc_7E6
; ---------------------------------------------------------------------------

setInstrument:				; CODE XREF: YM2_ParseData+6Aj
		cp	0FEh ; '˛'
		jr	nz, loc_848
		inc	de
		ld	a, (de)
		call	YM2_setChannelInstrument
		inc	de
		jp	loc_7E6
; ---------------------------------------------------------------------------

loc_848:				; CODE XREF: YM2_ParseData+ACj
		cp	0FDh ; '˝'
		jr	nz, loc_857
		inc	de
		ld	a, (de)
		and	0Fh
		call	YM2_LoadInstrument
		inc	de
		jp	loc_7E6
; ---------------------------------------------------------------------------

loc_857:				; CODE XREF: YM2_ParseData+B9j
		cp	0FCh ; '¸'
		jr	nz, loc_861
		call	YM_SetSlideOrKeyRelease
		jp	loc_7E6
; ---------------------------------------------------------------------------

loc_861:				; CODE XREF: YM2_ParseData+C8j
		cp	0FBh ; '˚'
		jr	nz, loc_86B
		call	LoadVibrato
		jp	loc_7E6
; ---------------------------------------------------------------------------

loc_86B:				; CODE XREF: YM2_ParseData+D2j
		cp	0FAh ; '˙'
		jr	nz, loc_875
		call	YM2_SetStereo
		jp	loc_7E6
; ---------------------------------------------------------------------------

loc_875:				; CODE XREF: YM2_ParseData+DCj
		cp	0F9h ; '˘'
		jr	nz, loc_87F
		call	LoadNoteShift
		jp	loc_7E6
; ---------------------------------------------------------------------------

loc_87F:				; CODE XREF: YM2_ParseData+E6j
		cp	0F8h ; '¯'
		jr	nz, loc_889
		call	ParseLoopCommand
		jp	loc_7E6
; ---------------------------------------------------------------------------

loc_889:				; CODE XREF: YM2_ParseData+F0j
		inc	de
		inc	de
		jp	loc_7E6
; ---------------------------------------------------------------------------

loc_88E:				; CODE XREF: YM2_ParseData+64j
		ld	a, (de)
		and	7Fh ; ''
		cp	70h ; 'p'
		jp	z, loc_8E8
		add	a, (ix+1Ch)	; index
		ld	l, a
		ld	h, 0
		ld	bc, t_YM_FREQUENCIES ; these words are not pointers, they are the two frequency	bytes to send to YM for	a given	note
		add	hl, hl
		add	hl, bc
		ld	a, (hl)
		dec	hl
		ld	l, (hl)
		ld	h, a		; hl = corresponding word
		ld	b, 0
		ld	c, (ix+1Dh)
		add	hl, bc
		ld	a, (loc_774+1)
		ld	b, a
		ld	c, h
		ld	(ix+12h), c
		ld	a, (ix+1Fh)
		or	a
		jr	nz, loc_8C0
		ld	(ix+0Fh), c
		xor	a
		ld	(ix+12h), a

loc_8C0:				; CODE XREF: YM2_ParseData+126j
		call	YM2_ConditionalInput
		ld	a, (loc_77D+1)	; dynamically changed :	1st frequency register to use corresponding to current channel
		ld	b, a
		ld	c, l
		ld	(ix+11h), c
		ld	a, (ix+1Fh)
		or	a
		jr	nz, loc_8D8
		ld	(ix+0Eh), c
		xor	a
		ld	(ix+11h), a

loc_8D8:				; CODE XREF: YM2_ParseData+13Ej
		call	YM2_ConditionalInput
		ld	b, 28h ; '('    ; YM register : Key on/off
		ld	a, (iy+0)
		add	a, 4
		or	0F0h ; ''
		ld	c, a
		call	YM1_ConditionnalInput

loc_8E8:				; CODE XREF: YM2_ParseData+102j
		ld	a, (de)
		bit	7, a
		jr	nz, loc_8F2
		ld	a, (ix+7)
		jr	loc_8F7
; ---------------------------------------------------------------------------

loc_8F2:				; CODE XREF: YM2_ParseData+15Aj
		inc	de
		ld	a, (de)
		ld	(ix+7),	a

loc_8F7:				; CODE XREF: YM2_ParseData+15Fj
		ld	(ix+2),	a
		inc	de
		ld	(ix+1),	d
		ld	(ix+0),	e
		jp	loc_7BB
; ---------------------------------------------------------------------------

loc_904:				; CODE XREF: YM2_ParseData+4Cj
		dec	(ix+2)
		ld	b, (ix+12h)
		ld	c, (ix+11h)
		ld	a, b
		or	c
		jr	z, loc_988
		ld	a, (ix+0Fh)
		ld	h, a
		ld	a, (ix+0Eh)
		ld	l, a
		push	bc
		push	hl
		or	a
		sbc	hl, bc
		ld	a, h
		ld	(TEMP_FREQUENCY), a ; temp space to store frequency values when	YM data	is parsed
		jr	nc, loc_92C
		ld	b, 0
		ld	c, (ix+1Fh)
		jp	loc_934
; ---------------------------------------------------------------------------

loc_92C:				; CODE XREF: YM2_ParseData+191j
		ld	b, 0FFh
		ld	a, (ix+1Fh)
		neg
		ld	c, a

loc_934:				; CODE XREF: YM2_ParseData+198j
		pop	hl
		add	hl, bc
		pop	bc
		push	hl
		or	a
		sbc	hl, bc
		ld	a, (TEMP_FREQUENCY) ; temp space to store frequency values when	YM data	is parsed
		xor	h
		bit	7, a
		pop	hl
		jr	nz, loc_97B
		push	hl
		ld	a, h
		and	7
		ld	h, a
		ld	(TEMP_FREQUENCY), hl ; temp space to store frequency values when YM data is parsed
		ld	bc, 4D4h
		or	a
		sbc	hl, bc
		jr	c, loc_95A
		ld	bc, 596h
		jp	loc_96E
; ---------------------------------------------------------------------------

loc_95A:				; CODE XREF: YM2_ParseData+1C1j
		ld	hl, (TEMP_FREQUENCY) ; temp space to store frequency values when YM data is parsed
		ld	bc, 26Ah
		or	a
		sbc	hl, bc
		jr	nc, loc_96B
		ld	bc, 0FA6Ah
		jp	loc_96E
; ---------------------------------------------------------------------------

loc_96B:				; CODE XREF: YM2_ParseData+1D2j
		ld	bc, 0

loc_96E:				; CODE XREF: YM2_ParseData+1C6j
					; YM2_ParseData+1D7j
		pop	hl
		add	hl, bc
		ld	a, h
		ld	(ix+0Fh), a
		ld	a, l
		ld	(ix+0Eh), a
		jp	loc_988
; ---------------------------------------------------------------------------

loc_97B:				; CODE XREF: YM2_ParseData+1B1j
		ld	(ix+0Fh), b
		ld	(ix+0Eh), c
		xor	a
		ld	(ix+11h), a
		ld	(ix+12h), a

loc_988:				; CODE XREF: YM2_ParseData+17Ej
					; YM2_ParseData+1E7j
		ld	a, (ix+0Ah)
		or	a
		jr	z, loc_994
		dec	(ix+0Ah)
		xor	a
		jr	loc_9BD
; ---------------------------------------------------------------------------

loc_994:				; CODE XREF: YM2_ParseData+1FBj
					; YM2_ParseData+229j
		ld	a, (ix+0Ch)
		ld	h, a
		ld	a, (ix+0Bh)
		ld	l, a
		ld	a, (ix+0Dh)
		ld	b, 0
		ld	c, a
		inc	(ix+0Dh)
		add	hl, bc
		ld	a, (hl)
		cp	81h ; 'Å'
		jr	nz, loc_9B1
		dec	(ix+0Dh)
		xor	a
		jr	loc_9BD
; ---------------------------------------------------------------------------

loc_9B1:				; CODE XREF: YM2_ParseData+218j
		cp	80h ; 'Ä'
		jp	nz, loc_9BD
		xor	a
		ld	(ix+0Dh), a
		jp	loc_994
; ---------------------------------------------------------------------------

loc_9BD:				; CODE XREF: YM2_ParseData+201j
					; YM2_ParseData+21Ej
					; YM2_ParseData+222j
		ld	c, a
		ld	a, (ix+0Eh)
		ld	l, a
		ld	a, (ix+0Fh)
		ld	h, a
		ld	b, 0
		bit	7, c
		jr	z, loc_9CD
		dec	b

loc_9CD:				; CODE XREF: YM2_ParseData+239j
		add	hl, bc

loc_9CE:				; DATA XREF: YM2_ParseData+27w
		ld	b, 0
		ld	c, h
		ld	(ix+0Fh), c
		call	YM2_ConditionalInput

loc_9D7:				; DATA XREF: YM2_ParseData+21w
		ld	b, 0
		ld	c, l
		ld	(ix+0Eh), c
		call	YM2_ConditionalInput
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		ret	nz
		ld	a, (FADE_OUT_TIMER) ; Starts with fade out length value, decrements at each YM Timer overflow. set to $63 while	loading	music
		or	a
		ret	nz
		ld	a, (ix+4)
		jp	YM2_LoadInstrument
; End of function YM2_ParseData


; =============== S U B	R O U T	I N E =======================================


YM1_SetChannelInstrument:		; CODE XREF: YM1_ParseData+82p
		ld	(ix+10h), a	; just set instrument value in channel byte 10 without loading it into YM
		ret
; End of function YM1_SetChannelInstrument


; =============== S U B	R O U T	I N E =======================================


YM1_LoadInstrument:			; CODE XREF: YM_UpdateInstrumentsLevels+12p
					; YM_UpdateInstrumentsLevels+1Fp
					; YM_UpdateInstrumentsLevels+2Cp
					; StopMusic+10p StopMusic+21p
					; StopMusic+32p YM1_ParseData+76j
					; YM1_ParseData+91p YM1_ParseData+227j
		push	af
		ld	a, YM_INSTRUMENTS_BANK
		call	LoadAnyBank
		pop	af
		ld	(ix+4),	a	; a is the total level of the instrument
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	z, loc_nimp3
		ld	a, (ix+4)
		jr	loc_A0D
; ---------------------------------------------------------------------------
		
loc_nimp3:		
		ld	a, (FADE_OUT_COUNTER) ;	Counts how many	times the fade out timer reached 0. Fade out stops at value $0C.
		add	a, 0Fh
		ld	h, a
		ld	a, (MUSIC_LEVEL) ; general output level	for music and SFX type 1, sent from 68k
		add	a, (ix+4)
		sub	h
		jr	nc, loc_A0D
		xor	a		; put level to 0

loc_A0D:				; CODE XREF: YM1_LoadInstrument+13j
		push	de
		push	af
		ld	a, (ix+10h)	; load instrument index
		ld	l, a
		ld	h, 0
		ld	d, h
		ld	e, l
		add	hl, hl
		add	hl, hl
		push	hl
		add	hl, de
		ld	d, h
		ld	e, l
		add	hl, hl
		add	hl, hl
		add	hl, de
		pop	de
		add	hl, de
		ld	de, YM_INSTRUMENTS_BANK_OFFSET
		add	hl, de		; hl now points	to the first byte of the instrument to load
		push	hl
		ld	de, 1Ch		; get algorithm	byte
		add	hl, de
		ld	a, (hl)
		and	7		; only keep algo bits
		ld	(ix+5),	a	; store	algo value
		pop	hl		; get back instrument start offset
		ld	a, (iy+0)	; get currently	managed	channel	value
		add	a, 30h ; '0'    ; register value for detune/multiple
		ld	b, 4		; loop 4 times

loc_A39:				; CODE XREF: YM1_LoadInstrument+4Ej
		push	bc
		ld	b, a		; YM Register :	detune/multiple
		ld	c, (hl)
		push	af
		call	YM1_ConditionnalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_A39
		ld	(TEMP_REGISTER), a ; store register value : 40h
		pop	af
		push	hl
		ld	d, 0
		ld	e, a
		ld	hl, t_YM_LEVELS
		ld	b, e
		add	hl, de
		ld	c, (hl)		; put corresponding value in c
		ld	e, (ix+5)	; get Algo
		ld	hl, t_SLOTS_PER_ALGO
		add	hl, de
		ld	d, (hl)		; put corresponding value in d
		ld	a, (TEMP_REGISTER) ; temp place	to keep	a register value when an YM instrument is loaded
		pop	hl
		ld	b, 4		; loop 4 times

loc_A63:				; CODE XREF: YM1_LoadInstrument+8Aj
		push	bc
		ld	b, a		; YM Register :	Total level
		push	af
		rr	d
		jr	nc, loc_A78	; if rotated bit = 0, then use original	instrument level
		ld	a, 7Fh ; ''    ; else, the operator is a slot, so use channel level
		sub	(hl)		; instrument's operator total level value
		add	a, c
		ld	c, a
		cp	7Fh ; ''
		jr	c, loc_A75	; if result > 7F, then put 7F, since it's the max value
		ld	c, 7Fh ; ''

loc_A75:				; CODE XREF: YM1_LoadInstrument+7Aj
		jp	loc_A79
; ---------------------------------------------------------------------------

loc_A78:				; CODE XREF: YM1_LoadInstrument+71j
		ld	c, (hl)		; get instrument's operator level

loc_A79:				; CODE XREF: YM1_LoadInstrument:loc_A75j
		call	YM1_ConditionnalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_A63
		ld	b, 14h		; loop 20d times, so 5 * 4 operators, so from 50h to A0h

loc_A85:				; CODE XREF: YM1_LoadInstrument+9Aj
		push	bc
		ld	b, a		; YM Register :	Rate scalling /	Attack rate, First decay rate /	Amplitude modulation ...
		ld	c, (hl)		; ... Secondary	decay rate, Secondary amplitude	/ Release rate,	SSG-EG
		push	af
		call	YM1_ConditionnalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_A85
		add	a, 10h
		ld	b, a		; YM Register :	Feedback / Algorithm
		ld	c, (hl)
		call	YM1_ConditionnalInput
		pop	de
		ld	a, (CURRENTLY_MANAGING_SFX)
		or	a
		jr	nz, smeuuh3		
		ld	a, (MUSIC_BANK)
		jr	smeuuh4
smeuuh3:
		ld	a, SFX_BANK
smeuuh4:		
		call	LoadAnyBank
		ret
; End of function YM1_LoadInstrument


; =============== S U B	R O U T	I N E =======================================


YM2_setChannelInstrument:		; CODE XREF: YM2_ParseData+B0p
		ld	(ix+10h), a
		ret
; End of function YM2_setChannelInstrument


; =============== S U B	R O U T	I N E =======================================


YM2_LoadInstrument:			; CODE XREF: YM_UpdateInstrumentsLevels:loc_FAp
					; YM_UpdateInstrumentsLevels+4Cp
					; YM_UpdateInstrumentsLevels+56p
					; YM_UpdateInstrumentsLevels+6Fp
					; YM_UpdateInstrumentsLevels+82p
					; StopMusic+4Fp StopMusic+66p
					; StopMusic+7Dp YM2_ParseData+A0j
					; YM2_ParseData+A4j YM2_ParseData+BFp
					; YM2_ParseData+25Cj
					; YM2_ParseChannel6Data+84j
		push	af
		ld	a, YM_INSTRUMENTS_BANK
		call	LoadAnyBank
		pop	af
		ld	(ix+4),	a
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	z, loc_AB6
		ld	a, (ix+4)
		jr	loc_AC6
; ---------------------------------------------------------------------------

loc_AB6:				; CODE XREF: YM2_LoadInstrument+Aj
		ld	a, (FADE_OUT_COUNTER) ;	Counts how many	times the fade out timer reached 0. Fade out stops at value $0C.
		add	a, 0Fh
		ld	h, a
		ld	a, (MUSIC_LEVEL) ; general output level	for music and SFX type 1, sent from 68k
		add	a, (ix+4)
		sub	h
		jr	nc, loc_AC6
		xor	a

loc_AC6:				; CODE XREF: YM2_LoadInstrument+Fj
					; YM2_LoadInstrument+1Ej
		push	de
		push	af
		ld	a, (ix+10h)	; same as in YM1 version of subroutine,	load instrument	index etc...
		ld	l, a
		ld	h, 0
		ld	d, h
		ld	e, l
		add	hl, hl
		add	hl, hl
		push	hl
		add	hl, de
		ld	d, h
		ld	e, l
		add	hl, hl
		add	hl, hl
		add	hl, de
		pop	de
		add	hl, de
		ld	de, YM_INSTRUMENTS_BANK_OFFSET
		add	hl, de
		push	hl
		ld	de, 1Ch
		add	hl, de
		ld	a, (hl)
		and	7
		ld	(ix+5),	a
		pop	hl
		ld	a, (iy+0)
		add	a, 30h ; '0'
		ld	b, 4

loc_AF2:				; CODE XREF: YM2_LoadInstrument+59j
		push	bc
		ld	b, a
		ld	c, (hl)
		push	af
		call	YM2_ConditionalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_AF2
		ld	(TEMP_REGISTER), a ; temp place	to keep	a register value when an YM instrument is loaded
		pop	af
		push	hl
		ld	d, 0
		ld	e, a
		ld	hl, t_YM_LEVELS
		ld	b, e
		add	hl, de
		ld	c, (hl)
		ld	e, (ix+5)
		ld	hl, t_SLOTS_PER_ALGO
		add	hl, de
		ld	d, (hl)
		ld	a, (TEMP_REGISTER) ; temp place	to keep	a register value when an YM instrument is loaded
		pop	hl
		ld	b, 4

loc_B1C:				; CODE XREF: YM2_LoadInstrument+95j
		push	bc
		ld	b, a
		push	af
		rr	d
		jr	nc, loc_B31
		ld	a, 7Fh ; ''
		sub	(hl)
		add	a, c
		ld	c, a
		cp	7Fh ; ''
		jr	c, loc_B2E
		ld	c, 7Fh ; ''

loc_B2E:				; CODE XREF: YM2_LoadInstrument+85j
		jp	loc_B32
; ---------------------------------------------------------------------------

loc_B31:				; CODE XREF: YM2_LoadInstrument+7Cj
		ld	c, (hl)

loc_B32:				; CODE XREF: YM2_LoadInstrument:loc_B2Ej
		call	YM2_ConditionalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_B1C
		ld	b, 14h

loc_B3E:				; CODE XREF: YM2_LoadInstrument+A5j
		push	bc
		ld	b, a
		ld	c, (hl)
		push	af
		call	YM2_ConditionalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_B3E
		add	a, 10h
		ld	b, a
		ld	c, (hl)
		call	YM2_ConditionalInput
		pop	de
		ld	a, (CURRENTLY_MANAGING_SFX)
		or	a
		jr	nz, smeuuh1		
		ld	a, (MUSIC_BANK)
		jr	smeuuh2
smeuuh1:
		ld	a, SFX_BANK
smeuuh2:		
		call	LoadAnyBank
		ret
; End of function YM2_LoadInstrument


; =============== S U B	R O U T	I N E =======================================


YM2_ParseChannel6Data:			; CODE XREF: UpdateSound+94p
					; UpdateSound+C5p
		ld	ix, MUSIC_CHANNEL_YM6
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	z, loc_B68
		ld	de, 01E0h ; '‡'  ; if we are currently managing an SFX using the 3 extra RAM areas, point to the right area
		add	ix, de
		jr	loc_B6F		; then don't even check if it uses DAC samples ... so for that kind of SFX, always use DAC ?
; ---------------------------------------------------------------------------

loc_B68:				; CODE XREF: YM2_ParseChannel6Data+8j
		ld	a, (MUSIC_DOESNT_USE_SAMPLES)
		or	a	
		jp	nz, YM2_ParseData ; jump to classic parsing subroutine if channel 6 is not in DAC mode

loc_B6F:				; CODE XREF: YM2_ParseChannel6Data+Fj
					; YM2_ParseChannel6Data+D3j
		ld	a, (ix+3)	; check	with byte 3 if channel 3 has something to do or	not
		or	a
		ret	nz		
		ld	a, (ix+6)	; check	if time	counter	02 has reached key release value 06
		cp	(ix+2)
		jr	nz, loc_B87	; check	if it's time to parse new data or not yet
		ld	a, (ix+8)	; check	if "don't release key" byte 08 is set
		or	a
		jr	nz, loc_B87	; don't jump if byte 02 = byte 06 and byte 08 = 0
		ld	a, 0FEh	; '˛'
		call	DAC_SetNewSample ; play	nothing	!

loc_B87:				; CODE XREF: YM2_ParseChannel6Data+23j
					; YM2_ParseChannel6Data+29j
		ld	a, (ix+2)	; check	if it's time to parse new data or not yet
		or	a
		jp	nz, loc_C2D	; if it's not end of sample play, decrement counter and return
		ld	d, (ix+1)	; get data pointer
		ld	e, (ix+0)

parseByte:				; CODE XREF: YM2_ParseChannel6Data+89j
					; YM2_ParseChannel6Data+92j
					; YM2_ParseChannel6Data+9Cj
					; YM2_ParseChannel6Data+A6j
					; YM2_ParseChannel6Data+ABj
		ld	a, (de)		; get data to parse
		and	0F8h ; '¯'

loc_B97:
		cp	0F8h ; '¯'
		jp	nz, loc_C05	; jump if it's not a command
		ld	a, (de)		; else,	parse command
		cp	0FFh
		jp	nz, setKeyRelease ; jump if command is not FF
		inc	de		; if command is	FF, parse next bytes
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		or	l
		jr	nz, parseAtNewOffset ; jump when it's FF xx xx, meaning "parse from new offset xxxx"
		ld	a, 1		; else,	you have FF 00 00, so end parsing and mute channel
		ld	(ix+3),	a
		ld	a, (MUSIC_DOESNT_USE_SAMPLES)
		or	a
		jr	z, return_BDE	; if music uses	DAC samples, return
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	z, return_BDE	; if it's not managing an SFX, return
		ld	bc, 0FE20h	; go back to YM	Channel	6 area
		add	ix, bc
		ld	a, 0B4h	; '¥'   ; YM Register : Stereo / LFO Sensitivity
		add	a, (iy+0)
		ld	b, a

loc_BCC:
		ld	c, (ix+1Eh)
		call	YM2_Input	; set stereo
		ld	a, (ix+3)
		or	a
		jr	nz, return_BDE	; return if channel has	nothing	to do
		ld	a, (ix+4)
		jp	YM2_LoadInstrument ; else, load	note and return
; ---------------------------------------------------------------------------

return_BDE:				; CODE XREF: YM2_ParseChannel6Data+62j
					; YM2_ParseChannel6Data+68j
					; YM2_ParseChannel6Data+7Fj
		ret
; ---------------------------------------------------------------------------

parseAtNewOffset:			; CODE XREF: YM2_ParseChannel6Data+52j
		ex	de, hl
		jr	parseByte	; get data to parse
; ---------------------------------------------------------------------------

setKeyRelease:				; CODE XREF: YM2_ParseChannel6Data+48j
		cp	0FCh ; '¸'
		jr	nz, setStereo
		call	SetRelease
		jp	parseByte	; get data to parse
; ---------------------------------------------------------------------------

setStereo:				; CODE XREF: YM2_ParseChannel6Data+8Dj
		cp	0FAh ; '˙'
		jr	nz, loopCommand
		call	YM2_SetStereo
		jp	parseByte	; get data to parse
; ---------------------------------------------------------------------------

loopCommand:				; CODE XREF: YM2_ParseChannel6Data+97j
		cp	0F8h ; '¯'
		jr	nz, ifCommandUnidentified
		call	ParseLoopCommand
		jp	parseByte	; get data to parse
; ---------------------------------------------------------------------------

ifCommandUnidentified:			; CODE XREF: YM2_ParseChannel6Data+A1j
		inc	de
		inc	de
		jp	parseByte	; get data to parse
; ---------------------------------------------------------------------------

loc_C05:				; CODE XREF: YM2_ParseChannel6Data+42j
		ld	a, (de)		; parsed byte is not a command
		and	7Fh ; ''

loc_C08:
		cp	70h ; 'p'
		jp	z, loc_C11	; if byte is F0	or 70
		inc	a		; else,	it's a new sample index : bits 6-0 + 1
		call	DAC_SetNewSample

loc_C11:				; CODE XREF: YM2_ParseChannel6Data+B3j
		ld	a, (de)
		bit	7, a		; if bit 7 = 1,	then next byte is sample play length
		jr	nz, loc_C1B	; get sample play length byte
		ld	a, (ix+7)	; else,	load current sample play length
		jr	loc_C20		; restart counter with sample play length value
; ---------------------------------------------------------------------------

loc_C1B:				; CODE XREF: YM2_ParseChannel6Data+BDj
		inc	de		; get sample play length byte
		ld	a, (de)
		ld	(ix+7),	a	; set new sample play length

loc_C20:				; CODE XREF: YM2_ParseChannel6Data+C2j
		ld	(ix+2),	a	; restart counter with sample play length value
		inc	de
		ld	(ix+1),	d	; point	to next	byte to	parse
		ld	(ix+0),	e
		jp	loc_B6F		; go back to the beginning of subroutine
; ---------------------------------------------------------------------------

loc_C2D:				; CODE XREF: YM2_ParseChannel6Data+34j
		dec	(ix+2)		; if it's not end of sample play, decrement counter and return
		ld	a, (FADE_OUT_TIMER) ; Starts with fade out length value, decrements at each YM Timer overflow. set to $63 while	loading	music
		or	a
		ret	nz		; return in any	way !
		ret
; End of function YM2_ParseChannel6Data


; =============== S U B	R O U T	I N E =======================================


PSG_ParseToneData:			; CODE XREF: UpdateSound+9Bp
					; UpdateSound+A1p UpdateSound+A7p

; FUNCTION CHUNK AT 0536 SIZE 0000000D BYTES

		ld	a, (iy+0)	; a = index of currently managed channel
		ld	ix, MUSIC_CHANNEL_PSG1 ; start of PSG channel data
		ld	h, 0
		ld	l, a
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl		; hl = 10h * a
		push	bc
		ld	b, h
		ld	c, l 
		add	hl, hl		; hl = 20h * a
		add	hl, bc		; hl = 30h * a
		pop	bc
		ex	de, hl
		add	ix, de		; ix now points	to concerned channel	
		rrca
		rrca
		rrca			; channel value	now in right place to make a PSG command
		and	60h ; '`'       ; make sure only the two interesting bits are used
		ld	(CURRENT_PSG_CHANNEL), a ; save	channel	number stored in that way
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	z, loc_C50
		ld	de, 01E0h ; '‡'  ; point to the right SFX channel data
		add	ix, de			

loc_C50:				; CODE XREF: PSG_ParseToneData+106j
		ld	a, (ix+3)	; get byte 3 of	channel	data
		or	a
		ret	nz		; return if channel has	nothing	to do
		ld	a, (ix+2)	; get time counter
		or	a
		jp	nz, loc_D3F	; don't jump if it's time to parse next byte
		ld	d, (ix+1)	; if counter = 0, parse	next byte
		ld	e, (ix+0)	; load channel data pointer

loc_C62:				; CODE XREF: PSG_ParseToneData+53j
					; PSG_ParseToneData+5Cj
					; PSG_ParseToneData+66j
					; PSG_ParseToneData+70j
					; PSG_ParseToneData+80j
					; PSG_ParseToneData+8Aj
					; PSG_ParseToneData+94j
					; PSG_ParseToneData+99j
		ld	a, (de)		; get pointed data
		and	0F8h ; '¯'
		cp	0F8h ; '¯'
		jp	nz, loc_CD2	; if byte is not a command
		ld	a, (de)		; get byte again
		cp	0FFh
		jp	nz, loc_C8B	; if a != FF check other possible command values
		inc	de		; a = FF
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		or	l
		jr	nz, PSG_Parse_At_New_Offset ; FF xx xx,	go parse at new	offset xxxx
		ld	a, 1		; FF 00	00, end	of data, mute channel and return
		ld	(ix+3),	a	; byte 3 of channel data = 1
		
					; doubt : if finishing SFX, do I need to update with music data ? like for YM ? We'll see
				
		ld	a, 0Fh
		jp	PSG_SetChannelAttenuation ; concerned channel volume : OFF
; ---------------------------------------------------------------------------

PSG_Parse_At_New_Offset:		; CODE XREF: PSG_ParseToneData+41j
		ex	de, hl
		jr	loc_C62		; get pointed data
; ---------------------------------------------------------------------------

loc_C8B:				; CODE XREF: PSG_ParseToneData+37j
		cp	0FDh ; '˝'
		jr	nz, loc_C95
		call	PSG_LoadInstrument
		jp	loc_C62		; get pointed data
; ---------------------------------------------------------------------------

loc_C95:				; CODE XREF: PSG_ParseToneData+57j
		cp	0FCh ; '¸'
		jr	nz, loc_C9F
		call	SetRelease
		jp	loc_C62		; get pointed data
; ---------------------------------------------------------------------------

loc_C9F:				; CODE XREF: PSG_ParseToneData+61j
		cp	0FBh ; '˚'
		jr	nz, Set_Timer
		call	LoadVibrato
		jp	loc_C62		; get pointed data
; ---------------------------------------------------------------------------

Set_Timer:				; CODE XREF: PSG_ParseToneData+6Bj
		cp	0FAh ; '˙'
		jr	nz, loc_CB9
		inc	de
		ld	b, 26h ; '&'    ; YM Register : Timer B value
		ld	a, (de)
		ld	c, a
		inc	de
		call	YM1_Input
		jp	loc_C62		; get pointed data
; ---------------------------------------------------------------------------

loc_CB9:				; CODE XREF: PSG_ParseToneData+75j
		cp	0F9h ; '˘'
		jr	nz, loc_CC3
		call	LoadNoteShift
		jp	loc_C62		; get pointed data
; ---------------------------------------------------------------------------

loc_CC3:				; CODE XREF: PSG_ParseToneData+85j
		cp	0F8h ; '¯'
		jr	nz, unidentifiedCommand	; Unidentified_Command
		call	ParseLoopCommand
		jp	loc_C62		; get pointed data
; ---------------------------------------------------------------------------

unidentifiedCommand:			; CODE XREF: PSG_ParseToneData+8Fj
		inc	de		; Unidentified_Command
		inc	de
		jp	loc_C62		; get pointed data
; ---------------------------------------------------------------------------

loc_CD2:				; CODE XREF: PSG_ParseToneData+31j
		ld	a, (de)		; byte is not a	command
		and	7Fh ; ''
		cp	70h ; 'p'
		jp	z, loc_D1B	; jump if byte = F0 or 70
		push	af		; keep byte without bit	7 : new	note
		ld	a, (ix+1Eh)
		or	a
		jr	z, Set_New_Note	; jump if byte 1E = 0. Byte 1E is set when key has just	been released
		xor	a		; key has just been released
		ld	(ix+12h), a	; reset	instrument relative pointer
		ld	(ix+1Eh), a	; clear	byte 1E
		ld	a, (ix+9)	; reset	vibrato	counter
		ld	(ix+0Ah), a

Set_New_Note:				; CODE XREF: PSG_ParseToneData+A9j
		xor	a
		ld	(ix+0Dh), a	; reset	vibrato	relative pointer
		pop	af		; get back byte	without	bit 7
		add	a, (ix+1Ch)	; add note shift value
		sub	15h
		ld	l, a
		ld	h, 0
		ld	bc, t_PSG_FREQUENCIES ;	PSG Frequency table, same idea as YM Frequency table but for PSG Tone Channels
		add	hl, hl
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a		; hl = corresponding frequency
		ld	b, 0
		ld	c, (ix+1Dh)
		srl	c
		add	hl, bc		; add frequency	shift value
		ld	c, l
		ld	(ix+0Eh), c	; keep frequency value to play
		ld	c, h
		ld	(ix+0Fh), c
		ld	a, (ix+8)
		and	80h ; 'Ä'       ; keep only bit 7
		jr	loc_D20
; ---------------------------------------------------------------------------

loc_D1B:				; CODE XREF: PSG_ParseToneData+A1j
		ld	a, (ix+8)	; if byte = F0 or 70
		or	1		; set bit 0

loc_D20:				; CODE XREF: PSG_ParseToneData+E3j
		ld	(ix+8),	a
		ld	a, (de)		; get full byte	again
		bit	7, a
		jr	nz, loc_D2D	; if bit 7 = 1,	set note length
		ld	a, (ix+7)
		jr	loc_D32		; reset	time counter
; ---------------------------------------------------------------------------

loc_D2D:				; CODE XREF: PSG_ParseToneData+F0j
		inc	de
		ld	a, (de)
		ld	(ix+7),	a	; set new note length

loc_D32:				; CODE XREF: PSG_ParseToneData+F5j
		ld	(ix+2),	a	; reset	time counter
		inc	de
		ld	(ix+1),	d	; save offset of next byte to parse
		ld	(ix+0),	e
		jp	loc_C50		; get byte 3 of	channel	data
; ---------------------------------------------------------------------------

loc_D3F:				; CODE XREF: PSG_ParseToneData+23j
		dec	(ix+2)		; decrement counter
		ld	a, (ix+0Ah)
		or	a
		jr	z, Apply_Vibrato ; jump	if vibrato must	be applied
		dec	(ix+0Ah)	; decrement vibrato counter
		xor	a
		jr	loc_D76
; ---------------------------------------------------------------------------

Apply_Vibrato:				; CODE XREF: PSG_ParseToneData+110j
					; PSG_ParseToneData+13Dj
		ld	a, (ix+0Ch)
		ld	h, a
		ld	a, (ix+0Bh)
		ld	l, a
		ld	a, (ix+0Dh)
		ld	b, 0
		ld	c, a
		inc	(ix+0Dh)
		add	hl, bc
		ld	a, (hl)
		cp	81h ; 'Å'
		jr	nz, loc_D6A
		dec	(ix+0Dh)
		jr	loc_D91		; THIS PART will change	the level depending on the PSG Instrument
; ---------------------------------------------------------------------------

loc_D6A:				; CODE XREF: PSG_ParseToneData+12Dj
		cp	80h ; 'Ä'
		jp	nz, loc_D76
		xor	a
		ld	(ix+0Dh), a
		jp	Apply_Vibrato
; ---------------------------------------------------------------------------

loc_D76:				; CODE XREF: PSG_ParseToneData+116j
					; PSG_ParseToneData+136j
		neg
		ld	c, a
		ld	a, (ix+0Eh)
		ld	l, a
		ld	a, (ix+0Fh)
		ld	h, a
		ld	b, 0
		bit	7, c
		jr	z, loc_D88
		dec	b

loc_D88:				; CODE XREF: PSG_ParseToneData+14Fj
		add	hl, bc
		ld	a, h
		ld	(ix+0Fh), a
		ld	a, l
		ld	(ix+0Eh), a	; now vibrato is applied

loc_D91:				; CODE XREF: PSG_ParseToneData+132j
		call	PSG_GetInstrumentPointer ; THIS	PART will change the level depending on	the PSG	Instrument
		ld	b, (hl)		; byte b = 8x or 0x
		bit	7, b
		jr	nz, loc_D9D	; if byte $8x, then it's data end, so just keep applying the same level alteration
		inc	a		; if byte 0x, point to next byte
		ld	(ix+12h), a

loc_D9D:				; CODE XREF: PSG_ParseToneData+161j
		res	7, b		; keep x only
		ld	a, 0Fh
		sub	b
		ld	b, a
		ld	a, (ix+4)
		sub	b		; a = level affected by	instrument
		jr	nc, loc_DAA	; make sure value is at	least 0
		xor	a

loc_DAA:				; CODE XREF: PSG_ParseToneData+171j
		ld	b, a		; put level to apply in	b
		ld	a, (iy+0)
		cp	2
		jr	nz, loc_DB6	; jump if it's PSG Tone 1 or 2 Channels
		ld	a, 0Fh		; if PSG Tone 3	Channel, apply max level
		jr	loc_DB9
; ---------------------------------------------------------------------------

loc_DB6:				; CODE XREF: PSG_ParseToneData+17Aj
		ld	a, (MUSIC_LEVEL) ; general output level	for music and SFX type 1, sent from 68k

loc_DB9:				; CODE XREF: PSG_ParseToneData+17Ej
		add	a, b
		sub	0Fh
		jr	nc, loc_DBF	; make sure level is at	least 0
		xor	a

loc_DBF:				; CODE XREF: PSG_ParseToneData+186j
		ld	(ix+5),	a	; store	level to apply in byte 05
		ld	b, (ix+8)
		ld	a, (ix+2)
		or	a
		jr	z, PSG_Release_Key ; if	counter	= 0, jump to release key part
		bit	7, b
		jr	nz, loc_DF2	; jump if byte 08 bit 7	= 1
		cp	(ix+6)
		jr	nz, loc_DF2	; or if	byte 02	!= byte	06

PSG_Release_Key:			; CODE XREF: PSG_ParseToneData+193j
		ld	a, b
		or	a
		jr	nz, loc_DF2	; leave	if byte	08 != 0
		ld	c, 1
		ld	(ix+1Eh), c	; set byte 1E to "release key" before next note
		or	2
		ld	(ix+8),	a	; byte 08 = $03

loc_DE2:				; CODE XREF: PSG_ParseToneData+1B7j
		call	PSG_GetInstrumentPointer
		ld	a, (hl)
		and	80h ; 'Ä'
		jr	nz, loc_DEF	; increment relative pointer until pointed byte's bit 7 = 1
		inc	(ix+12h)
		jr	loc_DE2
; ---------------------------------------------------------------------------

loc_DEF:				; CODE XREF: PSG_ParseToneData+1B2j
		inc	(ix+12h)	; now byte 12 points to	instrument release data

loc_DF2:				; CODE XREF: PSG_ParseToneData+197j
					; PSG_ParseToneData+19Cj
					; PSG_ParseToneData+1A0j
		ld	a, (FADE_OUT_TIMER) ; Starts with fade out length value, decrements at each YM Timer overflow. set to $63 while	loading	music
		or	a
		jr	nz, Transmit_Data ; transmit Frequency data to PSG
		ld	a, (iy+0)
		cp	2
		jr	z, Transmit_Data ; jump	if currently managing PSG Tone 3 Channel
		ld	a, (ix+4)
		or	a
		jr	z, Transmit_Data ; transmit Frequency data to PSG
		dec	a		; decrement level if currently fading out and fade out timer = 0
		ld	(ix+4),	a

Transmit_Data:				; CODE XREF: PSG_ParseToneData+1C0j
					; PSG_ParseToneData+1C7j
					; PSG_ParseToneData+1CDj
					
					; Conditionnal input to implement here !
					
					
		ld	a, (ix+0Fh)	; transmit Frequency data to PSG
		ld	b, a
		ld	a, (ix+0Eh)
		ld	c, a
		and	0Fh
		ld	h, a
		ld	a, (CURRENT_PSG_CHANNEL) ; current PSG channel to process, stored in the right bits ready to be	sent to	PSG
		or	h
		or	80h ; 'Ä'
		call	PSG_ConditionnalInput	; first	byte of	tone channel frequency command
		ld	a, c
		srl	b
		rra
		srl	b
		rra
		rra
		rra
		and	3Fh ; '?'
		call	PSG_ConditionnalInput	; second byte of tone channel frequency	command
		ld	a, 0Fh		; starting attenuation value
		sub	(ix+5)		; get level to apply
		ld	h, a		; save it
		ld	a, (CURRENT_PSG_CHANNEL) ; get channel number
		or	h		; load saved value
		or	90h ; 'ê'       ; load attenuation command bits
		call	PSG_ConditionnalInput
		ret
; End of function PSG_ParseToneData

; =============== S U B	R O U T	I N E =======================================


PSG_ConditionnalInput:	
		push	af		
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	nz, send_psg_data	
		exx
		push	ix		
		pop	hl
		ld	bc, 01E3h ; '„'
		add	hl, bc
		ld	a, (hl)		
		exx
		or	a
		jr	nz, send_psg_data
		pop	af
		ret	
send_psg_data:
		pop	af
		ld	(PSG_PORT), a
		ret

; End of function YM1_ConditionnalInput


; =============== S U B	R O U T	I N E =======================================


PSG_GetInstrumentPointer:		; CODE XREF: PSG_ParseToneData:loc_D91p
					; PSG_ParseToneData:loc_DE2p
					; PSG_ParseNoiseData+B7p
					; PSG_ParseNoiseData:loc_F78p
		ld	a, (ix+11h)
		ld	h, a
		ld	a, (ix+10h)	; bytes	10-11 :	pointer
		ld	l, a
		ld	b, 0
		ld	a, (ix+12h)	; byte 12 : relative pointer to	add to 10-11 pointer
		ld	c, a
		add	hl, bc
		ret
; End of function PSG_GetInstrumentPointer


; =============== S U B	R O U T	I N E =======================================


PSG_LoadInstrument:			; CODE XREF: PSG_ParseToneData+59p
					; PSG_ParseNoiseData+4Cp
		inc	de		; load psg instrument x	at level y
		ld	a, (de)
		ld	c, a
		and	0Fh		; keep only nibble 2 : instrument level
		ld	b, a
		ld	a, (iy+0)
		cp	2		; if it's PSG Tone 3 Channel
		jr	z, loc_E5E	; load instrument level
		ld	a, (CURRENTLY_FADING_OUT) ; set	to 01 when a fade out operation	is being executed
		or	a
		jr	nz, loc_E61	; don't jump if 0, so load new level

loc_E5E:				; CODE XREF: PSG_LoadInstrument+Bj
		ld	(ix+4),	b	; if it's PSG Tone 3 channel, keep nibble 2 in byte 04

loc_E61:				; CODE XREF: PSG_LoadInstrument+11j
		ld	a, c		; get back full	byte
		rra
		rra
		rra
		rra
		and	0Fh		; get psg instrument index
		inc	de
		ld	h, 0
		ld	l, a
		add	hl, hl
		ld	bc, pt_PSG_INSTRUMENTS ; The PSG instruments only affect the channel level
		add	hl, bc
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		ld	(ix+10h), c	; get instrument pointer
		ld	(ix+11h), b
		ret
; End of function PSG_LoadInstrument


; =============== S U B	R O U T	I N E =======================================


PSG_ParseNoiseData:			; CODE XREF: UpdateSound+ADp
		ld	a, (iy+0)
		ld	ix, MUSIC_CHANNEL_NOISE
		ld	a, 60h ; '`'
		ld	(CURRENT_PSG_CHANNEL), a ; current PSG channel to process, stored in the right bits ready to be	sent to	PSG
		ld	a, (CURRENTLY_MANAGING_SFX) 
		or	a
		jr	z, loc_E87
		ld	de, 01E0h ; '‡'  ; point to the right SFX channel data
		add	ix, de			

loc_E87:				; CODE XREF: PSG_ParseNoiseData+B1j
		ld	a, (ix+3)
		or	a
		ret	nz		; don't parse if channel not in use
		ld	a, (ix+2)
		or	a		; check	note time counter
		jp	nz, loc_F2F	; jump if it's not the end of the note
		ld	d, (ix+1)
		ld	e, (ix+0)	; if it's the end of the note, get data pointer to parse next byte

loc_E99:				; CODE XREF: PSG_ParseNoiseData+45j
					; PSG_ParseNoiseData+4Fj
					; PSG_ParseNoiseData+59j
					; PSG_ParseNoiseData+63j
					; PSG_ParseNoiseData+68j
		ld	a, (de)
		and	0F8h ; '¯'
		cp	0F8h ; '¯'
		jp	nz, loc_EE6	; jump if parsed byte is not a command
		ld	a, (de)
		cp	0FFh
		jp	nz, loc_EC3	; jump if command is not $FF
		inc	de
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		or	l
		jr	nz, loc_EBF	; jump if command is FF	xx xx
		ld	a, 1
		ld	(ix+3),	a	; else,	FF 00 00 : stop	using this channel
		
					; doubt : if finishing SFX, do I need to update with music data ? like for YM ? We'll see
		
		ld	a, 0Fh
		jp	PSG_SetChannelAttenuation
; ---------------------------------------------------------------------------

loc_EBF:				; CODE XREF: PSG_ParseNoiseData+33j
		ex	de, hl
		jp	loc_E99
; ---------------------------------------------------------------------------

loc_EC3:				; CODE XREF: PSG_ParseNoiseData+29j
		cp	0FDh ; '˝'
		jr	nz, loc_ECD
		call	PSG_LoadInstrument
		jp	loc_E99
; ---------------------------------------------------------------------------

loc_ECD:				; CODE XREF: PSG_ParseNoiseData+4Aj
		cp	0FCh ; '¸'
		jr	nz, loc_ED7
		call	SetRelease
		jp	loc_E99
; ---------------------------------------------------------------------------

loc_ED7:				; CODE XREF: PSG_ParseNoiseData+54j
		cp	0F8h ; '¯'
		jr	nz, Unidentified_Command
		call	ParseLoopCommand
		jp	loc_E99
; ---------------------------------------------------------------------------

Unidentified_Command:			; CODE XREF: PSG_ParseNoiseData+5Ej
		inc	de
		inc	de
		jp	loc_E99
; ---------------------------------------------------------------------------

loc_EE6:				; CODE XREF: PSG_ParseNoiseData+23j
		ld	a, (de)
		and	7Fh ; ''
		cp	70h ; 'p'
		jp	z, loc_F0B	; jump if byte = F0 or 70
		push	af		; keep byte without bit	7 : new	note
		ld	a, (ix+1Eh)
		or	a
		jr	z, loc_EFC	; jump if key has not just been	released
		xor	a		; key has just been released
		ld	(ix+12h), a	; reset	instrument relative pointer
		ld	(ix+1Eh), a	; clear	key release indicator

loc_EFC:				; CODE XREF: PSG_ParseNoiseData+78j
		pop	af
		and	7		; just keep bits 2-0
		or	0E0h ; '‡'
		ld	(PSG_PORT), a	; transmit feedback and	freqency
		ld	a, (ix+8)
		and	80h ; 'Ä'
		jr	loc_F10
; ---------------------------------------------------------------------------

loc_F0B:				; CODE XREF: PSG_ParseNoiseData+70j
		ld	a, (ix+8)
		or	1

loc_F10:				; CODE XREF: PSG_ParseNoiseData+8Ej
		ld	(ix+8),	a
		ld	a, (de)		; get full byte	again
		bit	7, a
		jr	nz, loc_F1D	; if bit 7 is set, next	byte is	note length to apply
		ld	a, (ix+7)
		jr	loc_F22		; reset	time counter
; ---------------------------------------------------------------------------

loc_F1D:				; CODE XREF: PSG_ParseNoiseData+9Bj
		inc	de
		ld	a, (de)
		ld	(ix+7),	a	; set new note length

loc_F22:				; CODE XREF: PSG_ParseNoiseData+A0j
		ld	(ix+2),	a	; reset	time counter
		inc	de
		ld	(ix+1),	d	; point	to next	byte to	parse
		ld	(ix+0),	e
		jp	loc_E87
; ---------------------------------------------------------------------------

loc_F2F:				; CODE XREF: PSG_ParseNoiseData+15j
		dec	(ix+2)		; decrement time counter
		call	PSG_GetInstrumentPointer ; affect level	depending on PSG Instrument used
		ld	b, (hl)		; byte b = 8x or 0x
		bit	7, b
		jr	nz, loc_F3E	; if byte $8x, then it's data end, so just keep applying the same level alteration
		inc	a		; if byte 0x, point to next byte
		ld	(ix+12h), a

loc_F3E:				; CODE XREF: PSG_ParseNoiseData+BDj
		res	7, b		; keep x only
		ld	a, 0Fh
		sub	b
		ld	b, a
		ld	a, (ix+4)
		sub	b		; a = level affected by	instrument
		jr	nc, loc_F4B	; make sure value is at	least 0
		xor	a

loc_F4B:				; CODE XREF: PSG_ParseNoiseData+CDj
		ld	b, a
		ld	a, (MUSIC_LEVEL) ; apply music level
		add	a, b
		sub	0Fh
		jr	nc, loc_F55	; make sure level is at	least 0
		xor	a

loc_F55:				; CODE XREF: PSG_ParseNoiseData+D7j
		ld	(ix+5),	a	; keep level value
		ld	b, (ix+8)
		ld	a, (ix+2)
		or	a
		jr	z, Release_Key	; if counter = 0, jump to release key part
		bit	7, b
		jr	nz, loc_F88	; jump if byte 08 bit 7	= 1
		cp	(ix+6)
		jr	nz, loc_F88	; or if	byte 02	!= byte	06

Release_Key:				; CODE XREF: PSG_ParseNoiseData+E4j
		ld	a, b
		or	a
		jr	nz, loc_F88	; leave	if byte	08 != 0
		ld	c, 1
		ld	(ix+1Eh), c	; set byte 1E to "release key" before next note
		or	2
		ld	(ix+8),	a	; byte 08 = $03

loc_F78:				; CODE XREF: PSG_ParseNoiseData+108j
		call	PSG_GetInstrumentPointer
		ld	a, (hl)
		and	80h ; 'Ä'
		jr	nz, loc_F85	; increment relative pointer until pointed byte's bit 7 = 1
		inc	(ix+12h)
		jr	loc_F78
; ---------------------------------------------------------------------------

loc_F85:				; CODE XREF: PSG_ParseNoiseData+103j
		inc	(ix+12h)	; now byte 12 points to	instrument release data

loc_F88:				; CODE XREF: PSG_ParseNoiseData+E8j
					; PSG_ParseNoiseData+EDj
					; PSG_ParseNoiseData+F1j
		ld	a, (FADE_OUT_TIMER) ; Starts with fade out length value, decrements at each YM Timer overflow. set to $63 while	loading	music
		or	a
		jr	nz, Transmit_Attenuation
		ld	a, (ix+4)
		or	a
		jr	z, Transmit_Attenuation
		dec	a		; decrement level if currently fading out and fade out timer = 0
		ld	(ix+4),	a

Transmit_Attenuation:			; CODE XREF: PSG_ParseNoiseData+111j
					; PSG_ParseNoiseData+117j
					
					; Conditional input to implement here !
					
		ld	a, 0Fh
		sub	(ix+5)		; get sound level and invert it	to get sound attenuation
		or	0F0h ; ''      ; add attenuation command bits
		call	PSG_ConditionnalInput	; transmit attenuation
		ret
; End of function PSG_ParseNoiseData


; =============== S U B	R O U T	I N E =======================================


YM_SetSlideOrKeyRelease:		; CODE XREF: YM1_ParseData+9Cp
					; YM2_ParseData+CAp
		inc	de
		ld	a, (de)		; get parameter
		cp	0FFh
		jr	nz, loc_FAF	; if parameter != $FF
		xor	a		; if parameter = $FF, clear channel byte 1F
		ld	(ix+1Fh), a
		inc	de
		ret
; ---------------------------------------------------------------------------

loc_FAF:				; CODE XREF: YM_SetSlideOrKeyRelease+4j
		cp	81h ; 'Å'
		jr	c, loc_FBC	; jump if a < 81
		and	7Fh ; ''
		ld	(ix+1Fh), a	; else,	put bits 6-0 in	channel	ram byte 1F
		inc	de
		ret
; End of function YM_SetSlideOrKeyRelease


; =============== S U B	R O U T	I N E =======================================


SetRelease:				; CODE XREF: YM2_ParseChannel6Data+8Fp
					; PSG_ParseToneData+63p
					; PSG_ParseNoiseData+56p
		inc	de		; point	to next	byte
		ld	a, (de)		; get next byte

loc_FBC:				; CODE XREF: YM_SetSlideOrKeyRelease+Ej
		ld	c, a
		and	80h ; 'Ä'
		ld	(ix+8),	a	; bit 7	goes to	channel	data byte 8
		ld	a, c
		and	7Fh ; ''
		ld	(ix+6),	a	; bits 6-0 go to channel data byte 6
		inc	de		; point	to next	byte
		ret
; End of function SetRelease


; =============== S U B	R O U T	I N E =======================================


LoadVibrato:				; CODE XREF: YM1_ParseData+A6p
					; YM2_ParseData+D4p
					; PSG_ParseToneData+6Dp
		inc	de		; affects channel ram bytes 09,	0B and 0C
		ld	a, (de)		; get next parameter : $2C
		push	af
		rra
		rra
		rra
		and	1Eh		; keep nibble 1	only, multiplied by 2 -> $04
		ld	hl, pt_PITCH_EFFECTS ; The pitch effects mostly	are vibratos, but also effects that make pitch go up or	down indefinitely
		ld	b, 0
		ld	c, a
		add	hl, bc		; point	to the corresponding pointer
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	(ix+0Bh), a
		ld	a, h
		ld	(ix+0Ch), a	; channel ram bytes B-C	= 4th pointer
		pop	af
		rla
		and	1Eh		; get nibble 2 only, multiplied	by 2 ->	$18
		jr	z, loc_FEA
		dec	a		; $17

loc_FEA:				; CODE XREF: LoadVibrato+1Dj
		ld	(ix+9),	a
		inc	de
		ret
; End of function LoadVibrato


; =============== S U B	R O U T	I N E =======================================


YM1_SetStereo:				; CODE XREF: YM1_ParseData+B0p

; FUNCTION CHUNK AT 1016 SIZE 00000009 BYTES

		inc	de
		ld	a, (de)
		bit	0, a
		ret	nz	; if bit 0 of pointed value is set to 1	: if FMS value = 1 or 3	?
		and	0C0h ; '¿'      ; else
		ld	(ix+1Eh), a
		ld	c, a
		ld	b, 0B4h	; '¥'
		ld	a, (iy+0)
		add	a, b
		ld	b, a		; set proper register according	to currently processed channel
		inc	de		; point	to next	pointed	rom byte
		
					; conditionnal input to implement here !
		
		jp	YM1_ConditionnalInput
; End of function YM1_SetStereo


; =============== S U B	R O U T	I N E =======================================


YM2_SetStereo:				; CODE XREF: YM2_ParseData+DEp
					; YM2_ParseChannel6Data+99p
		inc	de
		ld	a, (de)
		and	0C0h ; '¿'
		ld	(ix+1Eh), a
		ld	c, a
		ld	b, 0B4h	; '¥'
		ld	a, (iy+0)
		add	a, b
		ld	b, a
		inc	de
		jp	YM2_ConditionalInput
; End of function YM2_SetStereo

; =============== S U B	R O U T	I N E =======================================


LoadNoteShift:				; CODE XREF: YM1_ParseData+BAp
					; YM2_ParseData+E8p
					; PSG_ParseToneData+87p
		inc	de
		ld	a, (de)
		and	8Fh ; 'è'
		bit	7, a
		jr	z, loc_1029
		or	0F0h ; ''

loc_1029:				; CODE XREF: LoadNoteShift+6j
		ld	(ix+1Ch), a	; byte 1C = 0x or Fx depending on byte 7 : value of note shift
		ld	a, (de)
		rrca
		rrca
		rrca
		and	0Eh		; just keep bytes 6-5-4	multiplied by 2
		ld	(ix+1Dh), a	; value	of frequeny shift
		inc	de
		ret
; End of function LoadNoteShift


; =============== S U B	R O U T	I N E =======================================


ParseLoopCommand:			; CODE XREF: YM1_ParseData+C4p
					; YM2_ParseData+F2p
					; YM2_ParseChannel6Data+A3p
					; PSG_ParseToneData+91p
					; PSG_ParseNoiseData+60p
		inc	de
		ld	a, (de)		; get first byte parameter
		ld	b, a
		inc	de		; point	to next	data byte
		rlca
		rlca
		rlca
		and	7		; keep bits 7-6-5. It must be a	subcommand
		jr	nz, loc_1049
		ld	(ix+13h), e	; if bits 7-6-5	= 0, put next data byte	offset into channel bytes 13-14
		ld	(ix+14h), d	; this must be a loop start !
		ret
; ---------------------------------------------------------------------------

loc_1049:				; CODE XREF: ParseLoopCommand+9j
		cp	1		; if bits 7-6-5	= 1 ...	beginning of a loop ?
		jr	nz, loc_105B
		ld	(ix+15h), e	; put next data	byte offset in 15-16
		ld	(ix+16h), d	; is it	also a loop start ? like there could be	a loop in another loop ? Two loops managed independently ?
		xor	a
		ld	(ix+1Ah), a	; clear	1A-1B
		ld	(ix+1Bh), a
		ret
; ---------------------------------------------------------------------------

loc_105B:				; CODE XREF: ParseLoopCommand+14j
		cp	2		; if bits 7-6-5	= 2
		jr	nz, loc_1089
		ld	a, (ix+1Ah)
		or	a
		jr	nz, loc_106B	; if (1A) != 0,	then it's not the first loop
		ld	a, 1		; if (1A) = 0, then put	1 instead. It means it's the first loop.
		ld	(ix+1Ah), a
		ret
; ---------------------------------------------------------------------------

loc_106B:				; CODE XREF: ParseLoopCommand+2Cj
					; ParseLoopCommand+45j
					; ParseLoopCommand+48j
					; ParseLoopCommand+4Dj
		ld	a, (de)		; a = $F0
		ld	b, a		; b = $F0
		inc	de
		ld	a, (de)		; a = $D8
		ld	c, a		; c = $D8
		inc	de		; de points to a next F8 command
		ld	a, b		; a = $F0
		cp	0FFh
		jr	z, loc_1086	; if first data	byte = FF, finish
		cp	0F8h ; '¯'
		jr	z, loc_1081	; if first data	byte = F8 (then	you have something like	F8, byte with bits 7-6-5 = 2, and F8 again ?)
		and	80h ; 'Ä'
		jr	nz, loc_106B	; if bit 7 of first data byte =	1, start process again
		dec	de		; else,	start process again but	point one byte backward	first ... wow ... o_O
		jr	loc_106B	; a = $F0
; ---------------------------------------------------------------------------

loc_1081:				; CODE XREF: ParseLoopCommand+41j
		ld	a, c
		cp	60h ; '`'
		jr	nz, loc_106B	; if a = 60, finish, else start	process	again ... so it	expects	loop command 3 to get out of here !

loc_1086:				; CODE XREF: ParseLoopCommand+3Dj
					; ParseLoopCommand+6Bj
					; ParseLoopCommand+7Dj
		dec	de
		dec	de
		ret
; ---------------------------------------------------------------------------

loc_1089:				; CODE XREF: ParseLoopCommand+26j
		cp	3		; if bits 7-6-5	= 3
		jr	nz, loc_10B6
		ld	a, (ix+1Bh)
		or	a
		jr	nz, loc_1099	; same idea as command 2
		ld	a, 1		; if (1B) = 0, then put	1 instead
		ld	(ix+1Bh), a
		ret
; ---------------------------------------------------------------------------

loc_1099:				; CODE XREF: ParseLoopCommand+5Aj
					; ParseLoopCommand+73j
					; ParseLoopCommand+76j
					; ParseLoopCommand+7Bj
		ld	a, (de)		; same idea as command 2
		ld	b, a
		inc	de
		ld	a, (de)
		ld	c, a
		inc	de
		ld	a, b
		cp	0FFh
		jr	z, loc_1086
		cp	0F8h ; '¯'
		jr	z, loc_10AF
		and	80h ; 'Ä'
		jr	nz, loc_1099	; same idea as command 2
		dec	de
		jr	loc_1099	; same idea as command 2
; ---------------------------------------------------------------------------

loc_10AF:				; CODE XREF: ParseLoopCommand+6Fj
		ld	a, c
		cp	80h ; 'Ä'
		jr	nz, loc_1099	; expects command 4 to get out of here
		jr	loc_1086
; ---------------------------------------------------------------------------

loc_10B6:				; CODE XREF: ParseLoopCommand+54j
		cp	4		; if bits 7-6-5	= 4 end	of command 3
		jr	nz, loc_10BB
		ret			; if command 4,	just return ! it's just here to stop command 3
; ---------------------------------------------------------------------------

loc_10BB:				; CODE XREF: ParseLoopCommand+81j
		cp	5		; if bits 7-6-5	= 5 ...	go back	to the beginning of a loop ?
		jr	nz, loc_10D1
		bit	0, b
		jr	nz, loc_10CA	; if bit 0 = 1 (value A1)
		ld	e, (ix+15h)	; else (value A0), point back to offset	saved in 15-16
		ld	d, (ix+16h)
		ret
; ---------------------------------------------------------------------------

loc_10CA:				; CODE XREF: ParseLoopCommand+8Aj
		ld	e, (ix+13h)	; point	back to	offset saved in	13-14
		ld	d, (ix+14h)
		ret
; ---------------------------------------------------------------------------

loc_10D1:				; CODE XREF: ParseLoopCommand+86j
		cp	6		; if bits 7-6-5	= 6 : initiate a loop repeated x times,	x being	bits 4-0
		jr	nz, loc_10E3	; else,	bits 7-6-5 = 7
		ld	(ix+17h), e	; put next data	byte offset in 17-18
		ld	(ix+18h), d
		ld	a, b
		and	1Fh		; just keep parameter
		inc	a		; increment it
		ld	(ix+19h), a	; and store it in 19
		ret
; ---------------------------------------------------------------------------

loc_10E3:				; CODE XREF: ParseLoopCommand+9Cj
		dec	(ix+19h)	; decrement loop counter
		ret	z		; return if counter reached 0
		ld	e, (ix+17h)	; go back to the beginning of the loop
		ld	d, (ix+18h)
		ret
; End of function ParseLoopCommand


; =============== S U B	R O U T	I N E =======================================


Fade_Out:				; CODE XREF: Main+12j
		ld	a, 12h		; set a	fade out period	length of $12 YM timer overflows
		ld	(FADE_OUT_LENGTH), a ; number of YM Timer overflows to handle before incrementing the fade out counter
		ld	a, 1
		ld	(CURRENTLY_FADING_OUT),	a ; set	to 01 when a fade out operation	is being executed
		ld	a, (FADE_OUT_LENGTH) ; number of YM Timer overflows to handle before incrementing the fade out counter
		ld	(FADE_OUT_TIMER), a ; Starts with fade out length value, decrements at each YM Timer overflow. set to $63 while	loading	music
		ret
; End of function Fade_Out


; =============== S U B	R O U T	I N E =======================================


YM_SetTimer:				; CODE XREF: Main+1Cj
		push	bc
		ld	b, 26h ; '&'    ; YM Register : Timer B
		ld	a, (YM_TIMER_VALUE) ; stores the timer value to	send to	YM
		ld	c, a
		
					; Conditional input to implement here (maybe!) !
		
		call	YM1_Input
		pop	bc
		ret
; End of function YM_SetTimer



; =============== S U B	R O U T	I N E =======================================


DeactivateResuming:				
		ld	a, 0FFh
		ld	(RESUMING_DEACTIVATED), a
		ret
; End of function DeactivateResuming


; =============== S U B	R O U T	I N E =======================================


ActivateResuming:				
		ld	a, 0h
		ld	(RESUMING_DEACTIVATED), a
		ret
; End of function DeactivateResuming


; =============== S U B	R O U T	I N E =======================================

;

Save_Music:	
		push	ix
		push	iy
		push	bc			
		push	de	
		ld	a, (YM_TIMER_VALUE)
		ld	(SAVED_YM_TIMER_VALUE), a
		ld	a, (MUSIC_DOESNT_USE_SAMPLES)
		ld	(SAVED_MUSIC_DOESNT_USE_SAMPLES), a
		ld	ix, MUSIC_CHANNEL_YM1
		ld	iy, SAVED_MUSIC_CHANNEL_YM1
		ld	b, 0h
		ld	c, 010h
		ld	d, 0Ah		
Save_Music_Loop:			
		call	Copy_Channel_Data	
		add	ix, bc
		add	iy, bc
		dec	d
		jr	nz, Save_Music_Loop	
		pop	de
		pop	bc		
		pop	iy
		pop	ix
		ret
; End of function Save_Music

; =============== S U B	R O U T	I N E =======================================

;

Resume_Music:		
		
		push	ix
		push	iy	
		push	bc		
		push	de
		
		; save in temporary space

		ld	a, (MUSIC_BANK)
		ld	(TMPCPY_MUSIC_BANK), a
		ld	a, (YM_TIMER_VALUE)
		ld	(TMPCPY_YM_TIMER_VALUE), a
		ld	a, (MUSIC_DOESNT_USE_SAMPLES)
		ld	(TMPCPY_MUSIC_DOESNT_USE_SAMPLES), a
		ld	ix, MUSIC_CHANNEL_YM1
		ld	iy, TMPCPY_MUSIC_CHANNEL_YM1
		ld	b, 0h
		ld	c, 010h
		ld	d, 0Ah		
Tmpcpy_Music_Loop:			
		call	Copy_Channel_Data	
		add	ix, bc
		add	iy, bc
		dec	d
		jr	nz, Tmpcpy_Music_Loop
		
		call	StopMusic				
		
		; resume
		
		xor	a
		ld	a, (SAVED_MUSIC_BANK)
		ld	(MUSIC_BANK), a
		call	LoadAnyBank
		ld	a, (SAVED_MUSIC_DOESNT_USE_SAMPLES)
		ld	(MUSIC_DOESNT_USE_SAMPLES), a
		ld	a, (SAVED_YM_TIMER_VALUE)
		ld	(YM_TIMER_VALUE), a
		call	YM_SetTimer
		ld	a, 010h
		ld	(FADE_IN_PARAMETERS), a
		;ld	a, (FADE_IN_PARAMETERS)	; fade in parameter applied from 68k when a music is loaded. nibble 1 :	fade in	speed. nibble 2	: fade in start	level.
		and	0Fh
		ld	(MUSIC_LEVEL), a ; general output level	for music and SFX type 1, sent from 68k
		xor	a
		ld	(FADE_IN_TIMER), a ; reset fade	in timer	
		ld	ix, SAVED_MUSIC_CHANNEL_YM1
		ld	iy, MUSIC_CHANNEL_YM1
		ld	b, 0h
		ld	c, 010h		
		ld	d, 0Ah
Resume_Music_Loop:			
		call	Copy_Channel_Data	
		add	ix, bc
		add	iy, bc
		dec	d
		jr	nz, Resume_Music_Loop
		
		
		; Copy temporary space into saved space

		ld	a, (TMPCPY_MUSIC_BANK)
		ld	(SAVED_MUSIC_BANK), a
		ld	a, (TMPCPY_YM_TIMER_VALUE)
		ld	(SAVED_YM_TIMER_VALUE), a
		ld	a, (TMPCPY_MUSIC_DOESNT_USE_SAMPLES)
		ld	(SAVED_MUSIC_DOESNT_USE_SAMPLES), a
		ld	ix, TMPCPY_MUSIC_CHANNEL_YM1
		ld	iy, SAVED_MUSIC_CHANNEL_YM1
		ld	b, 0h
		ld	c, 010h
		ld	d, 0Ah		
Tmpcpy_save_Music_Loop:			
		call	Copy_Channel_Data	
		add	ix, bc
		add	iy, bc
		dec	d
		jr	nz, Tmpcpy_save_Music_Loop
		
		; avoid resumed PCM sample while fading in
		ld	a, 0FEh	; '˛'
		ld	(NEW_SAMPLE_TO_LOAD), a
		call	DAC_SetNewSample ; play	nothing	!
		xor	a
		ld	(DAC_REMAINING_LENGTH), a
		ld	(DAC_REMAINING_LENGTH+1), a
		ld	(DAC_LAST_OFFSET), a
		ld	(DAC_LAST_OFFSET+1), a
				
		pop	de
		pop	bc		
		pop	iy
		pop	ix
		ret
; End of function Resume_Music

; =============== S U B	R O U T	I N E =======================================


Copy_Channel_Data:				
		push	de	
		ld	d, 010h
Copy_Channel_Data_Loop:
		call	Copy_Byte
		call	Copy_Byte		
		dec	d
		jr	nz, Copy_Channel_Data_Loop
		pop	de
		ret
; End of function Copy_Byte

; =============== S U B	R O U T	I N E =======================================


Copy_Byte:				
		ld	a, (ix)
		ld	(iy), a
		inc	ix
		inc	iy
		ret
; End of function Copy_Byte

; =============== S U B	R O U T	I N E =======================================


SendDacByte:		
		push	af
		push	bc
		push	de
		push	hl			
		ld	b, 2Ah ; '*'    ; YM Register : DAC data
		ld	a, (DAC_REMAINING_LENGTH)
		ld	d, a		
		ld	a, (DAC_REMAINING_LENGTH+1)
		ld	e, a			
		ld	a, d		; check	remaining sound	length
		or	e
		jp	z, SendDacByte_ret
		ld	a, (DAC_BANK)
		call	LoadAnyBank				
		ld	a, (DAC_LAST_OFFSET)
		ld	h, a		
		ld	a, (DAC_LAST_OFFSET+1)
		ld	l, a		
		ld	c, (hl)		; get next DAC sample byte. It's 8-bit PCM
		inc	hl

SendDacByte_YmRequest:					
		ld	a, (YM1_REGISTER)
		and	80h ; 'Ä'
		jr	nz, SendDacByte_YmRequest	; loop as long as YM busy
		ld	a, b
		ld	(YM1_REGISTER),	a
		ld	a, c
		ld	(YM1_DATA), a	; transmit DAC Data
		dec	de		; decrement remaining sound length to play		
		ld	a, h
		ld	(DAC_LAST_OFFSET), a
		ld	a, l
		ld	(DAC_LAST_OFFSET+1), a	
		ld	a, d
		ld	(DAC_REMAINING_LENGTH), a
		ld	a, e
		ld	(DAC_REMAINING_LENGTH+1), a	
		ld	a, (CURRENTLY_MANAGING_SFX)
		or	a
		jp	nz, SendDacByte_ldSfxBk
		ld	a, (MUSIC_BANK)
		call	LoadAnyBank
		jp	SendDacByte_ret
		
SendDacByte_ldSfxBk:		
		ld	a, SFX_BANK
		call	LoadAnyBank		
		
SendDacByte_ret:
		pop	hl
		pop	de
		pop	bc
		pop	af
		ret
; End of function Copy_Byte

; ---------------------------------------------------------------------------
		db 08Ah
t_YM_FREQUENCIES:db 0Ah			; DATA XREF: YM1_ParseData+DDo
					; YM2_ParseData+10Bo
					; these	words are not pointers,	they are the two frequency bytes to send to YM for a given note
		dw 0AB1h
		dw 0ADAh
		dw 0B06h
		dw 0B33h
		dw 0B64h
		dw 0B98h
		dw 0BCEh
		dw 0C09h
		dw 0C46h
		dw 0C87h
		dw 1266h
		dw 128Ah
		dw 12B1h
		dw 12DAh
		dw 1306h
		dw 1333h
		dw 1364h
		dw 1398h
		dw 13CEh
		dw 1409h
		dw 1446h
		dw 1487h
		dw 1A66h
		dw 1A8Ah
		dw 1AB1h
		dw 1ADAh
		dw 1B06h
		dw 1B33h
		dw 1B64h
		dw 1B98h
		dw 1BCEh
		dw 1C09h
		dw 1C46h
		dw 1C87h
		dw 2266h
		dw 228Ah
		dw 22B1h
		dw 22DAh
		dw 2306h
		dw 2333h
		dw 2364h
		dw 2398h
		dw 23CEh
		dw 2409h
		dw 2446h
		dw 2487h
		dw 2A66h
		dw 2A8Ah
		dw 2AB1h
		dw 2ADAh
		dw 2B06h
		dw 2B33h
		dw 2B64h
		dw 2B98h
		dw 2BCEh
		dw 2C09h
		dw 2C46h
		dw 2C87h
		dw 3266h
		dw 328Ah
		dw 32B1h
		dw 32DAh
		dw 3306h
		dw 3333h
		dw 3364h
		dw 3398h
		dw 33CEh
		dw 3409h
		dw 3446h
		dw 3487h
		dw 3A66h
		dw 3A8Ah
		dw 3AB1h
		dw 3ADAh
		dw 3B06h
		dw 3B33h
		dw 3B64h
		dw 3B98h
		dw 3BCEh
		dw 3C09h
		dw 3C46h
		dw 3C87h
		dw 3CCBh
t_PSG_FREQUENCIES:dw 3EFh		; DATA XREF: PSG_ParseToneData+C5o
					; PSG Frequency	table, same idea as YM Frequency table but for PSG Tone	Channels
		dw 3B6h
		dw 381h
		dw 34Fh
		dw 320h
		dw 2F2h
		dw 2C8h
		dw 2A0h
		dw 27Ah
		dw 257h
		dw 235h
		dw 215h
		dw 1F7h
		dw 1DCh
		dw 1C1h
		dw 1A7h
		dw 18Fh
		dw 179h
		dw 164h
		dw 150h
		dw 13Dh
		dw 12Bh
		dw 11Ah
		dw 10Bh
		dw 0FCh
		dw 0EEh
		dw 0E1h
		dw 0D4h
		dw 0C8h
		dw 0BDh
		dw 0B2h
		dw 0A8h
		dw 9Fh
		dw 96h
		dw 8Dh
		dw 85h
		dw 7Eh
		dw 77h
		dw 70h
		dw 6Ah
		dw 64h
		dw 5Eh
		dw 59h
		dw 54h
		dw 4Fh
		dw 4Bh
		dw 47h
		dw 43h
		dw 3Fh
		dw 3Bh
		dw 38h
		dw 35h
		dw 32h
		dw 2Fh
		dw 2Ch
		dw 2Ah
		dw 28h
		dw 25h
		dw 23h
		dw 22h
		dw 1Fh
		dw 1Dh
		dw 1Ch
		dw 1Bh
t_YM_LEVELS:	db 70h			; DATA XREF: YM1_LoadInstrument+58o
					; YM2_LoadInstrument+63o
		db 60h			; this table contains the actual YM level values corresponding
		db 50h			; to the 16 possible values of the sound engine
		db 40h			; First	value being almost YM's min level,
		db 38h			; and last value being almost YM's max level
		db 30h
		db 2Ah
		db 26h
		db 20h
		db 1Ch
		db 18h
		db 14h
		db 10h
		db 0Bh
		db  8
		db  4
t_SLOTS_PER_ALGO:db 8			; DATA XREF: YM1_LoadInstrument+61o
					; YM2_LoadInstrument+6Co
		db  8
		db  8			; table	used to	know which operators have to be	affected by the	channel's level
		db  8			; bit 0	related	to operator 1, bit 1 to	operator 2 etc ...
		db 0Ch			; if 0,	then operator is not a slot, so	use the	instrument's original level value
		db 0Eh			; if 1,	then operator is a slot, so use	channel	level value
		db 0Eh
		db 0Fh
pt_PITCH_EFFECTS:dw byte_126B		; DATA XREF: LoadVibrato+8o
					; The pitch effects mostly are vibratos, but also effects that make pitch go up	or down	indefinitely
		dw byte_126D		; vibrato 1
		dw byte_1272
		dw byte_127D
		dw byte_1288
		dw byte_1293
		dw byte_129E		; from here, the pitch effects are not vibratos, they just make	the pitch constantly go	up or down
		dw byte_12A0
		dw byte_12A2
		dw byte_12A4
		dw byte_12A6
		dw byte_12A8
		dw byte_12AA
		dw byte_12AC
		dw byte_12AE
		dw byte_12B0
byte_126B:	db  0			; DATA XREF: RAM:pt_PITCH_EFFECTSo
					; vibrato 0 : nothing !	used to	cancel a previous vibrato ?
		db 80h
byte_126D:	db 0F0h			; DATA XREF: RAM:124Do
					; vibrato 1
		db 10h			; at each sound	frame, the next	data byte is added to the current frequency to slightly	affect it
		db 10h
		db 0F0h
		db 80h			; value	$80 means that it's end of data, so go back to the first byte of the pitch effect
byte_1272:	db 0FDh			; DATA XREF: RAM:124Fo
		db 0FDh
		db 0FFh
		db  1
		db  3
		db  3
		db  3
		db  1
		db 0FFh
		db 0FDh
		db 80h
byte_127D:	db 0FEh			; DATA XREF: RAM:1251o
		db 0FEh
		db 0FFh
		db  1
		db  2
		db  2
		db  2
		db  1
		db 0FFh
		db 0FEh
		db 80h
byte_1288:	db 0FFh			; DATA XREF: RAM:1253o
		db 0FFh
		db  0
		db  1
		db  1
		db  1
		db  1
		db  0
		db 0FFh
		db 0FFh
		db 80h
byte_1293:	db 0FFh			; DATA XREF: RAM:1255o
		db  0
		db  0
		db  1
		db  0
		db  1
		db  0
		db  0
		db 0FFh
		db  0
		db 80h
byte_129E:	db  2			; DATA XREF: RAM:1257o
					; from here, the pitch effects are not vibratos, they just make	the pitch constantly go	up or down
		db 80h
byte_12A0:	db 0FEh			; DATA XREF: RAM:1259o
		db 80h
byte_12A2:	db  4			; DATA XREF: RAM:125Bo
		db 80h
byte_12A4:	db 0FCh			; DATA XREF: RAM:125Do
		db 80h
byte_12A6:	db  8			; DATA XREF: RAM:125Fo
		db 80h
byte_12A8:	db 0F8h			; DATA XREF: RAM:1261o
		db 80h
byte_12AA:	db 10h			; DATA XREF: RAM:1263o
		db 80h
byte_12AC:	db 0F0h			; DATA XREF: RAM:1265o
		db 80h
byte_12AE:	db 20h			; DATA XREF: RAM:1267o
		db 80h
byte_12B0:	db 0E0h			; DATA XREF: RAM:1269o
		db 80h
pt_PSG_INSTRUMENTS:dw byte_12D2		; DATA XREF: PSG_LoadInstrument+22o
					; The PSG instruments only affect the channel level
		dw byte_12D4		; more details about the data layout in	psg-intruments.txt
		dw byte_12E6		; instrument 2
		dw byte_12F4		; instrument 3
		dw byte_130B		; instrument 4
		dw byte_1312		; instrument 5
		dw byte_131D		; instrument 6
		dw byte_1325		; instrument 7
		dw byte_132A		; instrument 8
		dw byte_1338		; instrument 9
		dw byte_133E		; instrument A
		dw byte_1349		; instrument B
		dw byte_134B		; instrument C
		dw byte_134F		; instrument D
		dw byte_1355		; instrument E
		dw byte_135D		; instrument F
byte_12D2:	db 8Fh			; DATA XREF: RAM:pt_PSG_INSTRUMENTSo
					; start	of data	: instrument 0
		db 8Bh
byte_12D4:	db 0Fh			; DATA XREF: RAM:12B4o
					; instrument 1
		db 0Fh
		db 0Eh
		db 0Dh
		db 0Ch
		db 0Bh
		db 0Ah
		db  9
		db  8
		db  7
		db  6
		db  5
		db  4
		db  3
		db  2
		db  1
		db 80h
		db 80h
byte_12E6:	db 0Fh			; DATA XREF: RAM:12B6o
					; instrument 2
		db 0Eh
		db 0Eh
		db 0Dh
		db 0Dh
		db 0Dh
		db 0Ch
		db 0Ch
		db 0Ch
		db 0Ch
		db 8Bh
		db 0Ah
		db 0Ah
		db 89h
byte_12F4:	db 0Fh			; DATA XREF: RAM:12B8o
					; instrument 3
		db 0Fh
		db 0Fh
		db 0Fh
		db 0Fh
		db 0Fh
		db 0Eh
		db 0Eh
		db 0Eh
		db 0Eh
		db 0Eh
		db 0Eh
		db 0Eh
		db 0Eh
		db 0Eh
		db 0Eh
		db 0Eh
		db 0Eh
		db 8Dh
		db 0Bh
		db 0Bh
		db 0Bh
		db 8Ah
byte_130B:	db 0Fh			; DATA XREF: RAM:12BAo
					; instrument 4
		db 0Fh
		db 8Eh
		db 0Bh
		db 0Bh
		db 0Bh
		db 8Ah
byte_1312:	db 0Fh			; DATA XREF: RAM:12BCo
					; instrument 5
		db 0Eh
		db 8Dh
		db 0Bh
		db  9
		db  7
		db  5
		db  3
		db  2
		db  1
		db 80h
byte_131D:	db 0Dh			; DATA XREF: RAM:12BEo
					; instrument 6
		db 0Eh
		db 0Fh
		db 8Eh
		db  4
		db  2
		db  1
		db 80h
byte_1325:	db 0Dh			; DATA XREF: RAM:12C0o
					; instrument 7
		db 0Eh
		db 0Fh
		db 8Eh
		db 8Bh
byte_132A:	db 0Fh			; DATA XREF: RAM:12C2o
					; instrument 8
		db 0Fh
		db 0Eh
		db 0Eh
		db 0Dh
		db 0Ch
		db 0Fh
		db 0Fh
		db 0Eh
		db 0Eh
		db 0Dh
		db 0Dh
		db 8Ch
		db 8Ah
byte_1338:	db 0Bh			; DATA XREF: RAM:12C4o
					; instrument 9
		db 0Ch
		db 0Dh
		db 0Eh
		db 8Fh
		db 88h
byte_133E:	db 0Bh			; DATA XREF: RAM:12C6o
					; instrument A
		db 0Dh
		db 0Fh
		db 0Eh
		db 0Dh
		db 8Ch
		db 0Ah
		db 0Ah
		db  9
		db  9
		db 88h
byte_1349:	db 8Fh			; DATA XREF: RAM:12C8o
					; instrument B
		db 8Fh
byte_134B:	db 0Fh			; DATA XREF: RAM:12CAo
					; instrument C
		db 0Ah
		db 86h
		db 83h
byte_134F:	db 0Fh			; DATA XREF: RAM:12CCo
					; instrument D
		db 0Ch
		db 0Ah
		db  8
		db 86h
		db 83h
byte_1355:	db 0Fh			; DATA XREF: RAM:12CEo
					; instrument E
		db 0Dh
		db 0Bh
		db  9
		db  8
		db  7
		db 86h
		db 83h
byte_135D:	db 8Fh			; DATA XREF: RAM:12D0o
					; instrument F
		db 80h			; end of data
		
		align 020h
		
USELESS_BYTE:	db 0			; DATA XREF: Main+62w
					; YM1_SetStereo:loc_1016r
					; YM1_SetStereo+2Bw
					; incremented each time	new stereo byte	has bit	0 set to 1, but	actually has no	effect on sound. Useless !
CURRENT_PSG_CHANNEL:db 0		; DATA XREF: PSG_ParseToneData-6FDr
					; PSG_ParseToneData+17w
					; PSG_ParseToneData+1DEr
					; PSG_ParseToneData+1FBr
					; PSG_ParseNoiseData+9w
					; current PSG channel to process, stored in the	right bits ready to be sent to PSG
CURRENT_CHANNEL:db 0			; DATA XREF: YM_UpdateInstrumentsLevelso
					; StopMusic+1o	UpdateSound+62o
					; indicates the	channel	to process, from a relative point of view : YM1, YM2, PSG or SFX channels
					; set to 01 when a fade	out operation is being executed
CURRENTLY_MANAGING_SFX:		db 0
CALL_YM2_INSTEAD_OF_YM1:db 0		; DATA XREF: Pause_Sound+6w
					; Pause_Sound+20w
					; YM_UpdateInstrumentsLevels+5w
					; YM_UpdateInstrumentsLevels+35w
					; Main+CFw StopMusic+6w StopMusic+3Dw
					; UpdateSound+6Aw UpdateSound+81w
					; YM_Inputr
					; set to $01 when managing YM4,5,6 channels, to	call part 2 of YM
CURRENTLY_MANAGING_SFX_TYPE_2:db 0	; DATA XREF: Pause_Sound+3w
					; YM_UpdateInstrumentsLevels+5Fw
					; UpdateSound+67w UpdateSound+B2w
					; YM1_ConditionnalInputr
					; YM2_ConditionalInputr
					; DAC_SetNewSample+1r
					; YM2_ParseData+12r YM2_ParseData+80r
					; YM2_ParseData+24Fr
					; YM2_LoadInstrument+6r
					; YM2_ParseChannel6Data+4r
					; YM2_ParseChannel6Data+64r
					; indicates if an SFX type 2 is	being processed, because these ones use	extra channel ram areas, to keep current music data for	when SFX is finished
		db    0
		db    0
TEMP_FREQUENCY:	dw 0			; DATA XREF: YM1_ParseData+15Ew
					; YM1_ParseData+17Ar
					; YM1_ParseData+188w
					; YM1_ParseData:loc_700r
					; YM2_ParseData+18Ew
					; YM2_ParseData+1AAr
					; YM2_ParseData+1B8w
					; YM2_ParseData:loc_95Ar
					; temp space to	store frequency	values when YM data is parsed
TEMP_REGISTER:	db 0			; DATA XREF: YM1_LoadInstrument+50w
					; YM1_LoadInstrument+66r
					; YM2_LoadInstrument+5Bw
					; YM2_LoadInstrument+71r
					; temp place to	keep a register	value when an YM instrument is loaded
					
		align 010h					
					
t_SAMPLE_LOAD_DATA:
		db	 1,   0,   DAC_BANK_1,	0,0EFh,	11h,   0, 80h ;	DATA XREF: LoadDacSound+12o
		db    1,   0,	DAC_BANK_1,   0,0EFh, 11h,0EFh, 91h ; Data layout of the	8-byte entries :
		db    1,   0,	DAC_BANK_1,   0,0E3h,   8, 31h,0F4h ; byte 0 : PCM frame	period parameter
		db    1,   0,	DAC_BANK_2,   0,0E3h,   8,   0, 80h ; byte 1 : always 0 (ignored	when data is parsed)
		db    1,   0,	DAC_BANK_2,   0,0E3h,   8,0E3h, 88h ; byte 2 : bank to load
		db    1,   0,	DAC_BANK_1,   0,0EFh, 11h,0DEh,0A3h ; byte 3 : always 0 (ignored	when data is parsed)
		db    1,   0,	DAC_BANK_1,   0,0C1h, 11h,0CDh,0B5h ; bytes 5-4 : sample	length
		db    5,   0,	DAC_BANK_1,   0,0C1h, 11h,0CDh,0B5h ; bytes 7-6 : pointer to sound PCM Data once	bank is	loaded
		db    3,   0,	DAC_BANK_1,   0,	  0, 0Fh, 8Eh,0C7h ;
		db    9,   0,	DAC_BANK_1,   0,	  0, 0Fh, 8Eh,0C7h ; With this table, the same sound sample can	be played at different rates,
		db    1,   0,	DAC_BANK_2,   0,	29h, 1Dh,0C6h, 91h ; resulting with quick high-pitched,	or slow	low-pitched sounds,
		db  0Fh,   0,	DAC_BANK_2,   0,	29h, 1Dh,0C6h, 91h ; which is quite appropriate	for drums or attack hits or explosions !
		db    1,   0,	DAC_BANK_1,   0,0A3h, 1Dh, 8Eh,0D6h
		db    5,   0,	DAC_BANK_1,   0,0A3h, 1Dh, 8Eh,0D6h
		db    9,   0,	DAC_BANK_1,   0,0A3h, 1Dh, 8Eh,0D6h
		db  0Fh,   0,	DAC_BANK_1,   0,0A3h, 1Dh, 8Eh,0D6h
		db  14h,   0,	DAC_BANK_1,   0,0A3h, 1Dh, 8Eh,0D6h
		
		align 1700h
		
		db  "MUSICYM1"	
		align	10h
MUSIC_CHANNEL_YM1:
		db 0			
		db 0			
		db 0			
MUSIC_CHANNEL_YM1_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
MUSIC_CHANNEL_YM1_STEREO: db  0
		db  0	
		db  "MUSICYM2"
		align	10h			
MUSIC_CHANNEL_YM2:
		db 0			
		db 0			
		db 0			
MUSIC_CHANNEL_YM2_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
MUSIC_CHANNEL_YM2_STEREO: db  0
		db  0
		db  "MUSICYM3"		
		align	10h			
MUSIC_CHANNEL_YM3:
		db 0			
		db 0			
		db 0			
MUSIC_CHANNEL_YM3_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
MUSIC_CHANNEL_YM3_STEREO: db  0
		db  0
		db  "MUSICYM4"	
		align	10h	
MUSIC_CHANNEL_YM4:
		db 0			
		db 0			
		db 0			
MUSIC_CHANNEL_YM4_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
MUSIC_CHANNEL_YM4_STEREO:		db  0
		db  0
		db  "MUSICYM5"		
		align	10h	
MUSIC_CHANNEL_YM5:
		db 0			
		db 0			
		db 0			
MUSIC_CHANNEL_YM5_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
MUSIC_CHANNEL_YM5_STEREO:		db  0
		db  0	
		db  "MUSICYM6"
		align	10h			
MUSIC_CHANNEL_YM6:
		db 0			
		db 0			
		db 0			
MUSIC_CHANNEL_YM6_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
MUSIC_CHANNEL_YM6_STEREO:		db  0
		db  0
		db  "MUSICTN1"	
		align	10h			
MUSIC_CHANNEL_PSG1:
		db 0			
		db 0			
		db 0			
MUSIC_CHANNEL_PSG1_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0	
		db  "MUSICTN2"
		align	10h				
MUSIC_CHANNEL_PSG2:
		db 0			
		db 0			
		db 0			
MUSIC_CHANNEL_PSG2_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0	
		db  "MUSICTN3"	
		align	10h				
MUSIC_CHANNEL_PSG3:
		db 0			
		db 0			
		db 0			
MUSIC_CHANNEL_PSG3_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0	
		db  "MUSICNOI"			
		align	10h
MUSIC_CHANNEL_NOISE:
		db 0			
		db 0			
		db 0			
MUSIC_CHANNEL_NOISE_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SFXYM1"		
		align	10h		
SFX_CHANNEL_YM1:
		db 0			
		db 0			
		db 0			
SFX_CHANNEL_YM1_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h		
		db  "SFXYM2"
		align	10h					
SFX_CHANNEL_YM2:
		db 0			
		db 0			
		db 0			
SFX_CHANNEL_YM2_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SFXYM3"		
		align	10h	
SFX_CHANNEL_YM3:
		db 0			
		db 0			
		db 0			
SFX_CHANNEL_YM3_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SFXYM4"		
		align	10h	
SFX_CHANNEL_YM4:
		db 0			
		db 0			
		db 0			
SFX_CHANNEL_YM4_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
SFX_CHANNEL_YM4_STEREO:		db  0
		db  0
		db  "SFXYM5"	
		align	10h		
SFX_CHANNEL_YM5:
		db 0			
		db 0			
		db 0			
SFX_CHANNEL_YM5_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
SFX_CHANNEL_YM5_STEREO:		db  0
		db  0	
		db  "SFXYM6"		
		align	10h
SFX_CHANNEL_YM6:
		db 0			
		db 0			
		db 0			
SFX_CHANNEL_YM6_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
SFX_CHANNEL_YM6_STEREO:		db  0
		db  0	
		db  "SFXTONE1"	
		align	10h		
SFX_CHANNEL_PSG1:
		db 0			
		db 0			
		db 0			
SFX_CHANNEL_PSG1_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SFXTONE2"	
		align	10h		
SFX_CHANNEL_PSG2:
		db 0			
		db 0			
		db 0			
SFX_CHANNEL_PSG2_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SFXTONE3"	
		align	10h			
SFX_CHANNEL_PSG3:
		db 0			
		db 0			
		db 0			
SFX_CHANNEL_PSG3_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SFXNOISE"	
		align	10h		
SFX_CHANNEL_NOISE:
		db 0			
		db 0			
		db 0			
SFX_CHANNEL_NOISE_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SAVEDYM1"		
		align	10h	
SAVED_MUSIC_CHANNEL_YM1:
		db 0			
		db 0			
		db 0			
SAVED_MUSIC_CHANNEL_YM1_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SAVEDYM2"		
		align	10h				
SAVED_MUSIC_CHANNEL_YM2:
		db 0			
		db 0			
		db 0			
SAVED_MUSIC_CHANNEL_YM2_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SAVEDYM3"	
		align	10h		
SAVED_MUSIC_CHANNEL_YM3:
		db 0			
		db 0			
		db 0			
SAVED_MUSIC_CHANNEL_YM3_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SAVEDYM4"
		align	10h			
SAVED_MUSIC_CHANNEL_YM4:
		db 0			
		db 0			
		db 0			
SAVED_MUSIC_CHANNEL_YM4_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SAVEDYM5"		
		align	10h	
SAVED_MUSIC_CHANNEL_YM5:
		db 0			
		db 0			
		db 0			
SAVED_MUSIC_CHANNEL_YM5_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SAVEDYM6"	
		align	10h	
SAVED_MUSIC_CHANNEL_YM6:
		db 0			
		db 0			
		db 0			
SAVED_MUSIC_CHANNEL_YM6_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SAVEDTN1"	
		align	10h			
SAVED_MUSIC_CHANNEL_PSG1:
		db 0			
		db 0			
		db 0			
SAVED_MUSIC_CHANNEL_PSG1_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SAVEDTN2"				
SAVED_MUSIC_CHANNEL_PSG2:
		db 0			
		db 0			
		db 0			
SAVED_MUSIC_CHANNEL_PSG2_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SAVEDTN3"	
		align	10h					
SAVED_MUSIC_CHANNEL_PSG3:
		db 0			
		db 0			
		db 0			
SAVED_MUSIC_CHANNEL_PSG3_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "SAVEDNOI"	
		align	10h				
SAVED_MUSIC_CHANNEL_NOISE:
		db 0			
		db 0			
		db 0			
SAVED_MUSIC_CHANNEL_NOISE_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		
		
		align	10h
		db  "TMPCPYM1"
		align	10h	
TMPCPY_MUSIC_CHANNEL_YM1:
		db 0			
		db 0			
		db 0			
TMPCPY_MUSIC_CHANNEL_YM1_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "TMPCPYM2"		
		align	10h				
TMPCPY_MUSIC_CHANNEL_YM2:
		db 0			
		db 0			
		db 0			
TMPCPY_MUSIC_CHANNEL_YM2_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "TMPCPYM3"	
		align	10h		
TMPCPY_MUSIC_CHANNEL_YM3:
		db 0			
		db 0			
		db 0			
TMPCPY_MUSIC_CHANNEL_YM3_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "TMPCPYM4"
		align	10h			
TMPCPY_MUSIC_CHANNEL_YM4:
		db 0			
		db 0			
		db 0			
TMPCPY_MUSIC_CHANNEL_YM4_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "TMPCPYM5"		
		align	10h	
TMPCPY_MUSIC_CHANNEL_YM5:
		db 0			
		db 0			
		db 0			
TMPCPY_MUSIC_CHANNEL_YM5_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "TMPCPYM6"	
		align	10h	
TMPCPY_MUSIC_CHANNEL_YM6:
		db 0			
		db 0			
		db 0			
TMPCPY_MUSIC_CHANNEL_YM6_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "TMPCPTN1"	
		align	10h			
TMPCPY_MUSIC_CHANNEL_PSG1:
		db 0			
		db 0			
		db 0			
TMPCPY_MUSIC_CHANNEL_PSG1_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "TMPCPTN2"				
TMPCPY_MUSIC_CHANNEL_PSG2:
		db 0			
		db 0			
		db 0			
TMPCPY_MUSIC_CHANNEL_PSG2_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "TMPCPTN3"	
		align	10h					
TMPCPY_MUSIC_CHANNEL_PSG3:
		db 0			
		db 0			
		db 0			
TMPCPY_MUSIC_CHANNEL_PSG3_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h
		db  "TMPCPNOI"	
		align	10h				
TMPCPY_MUSIC_CHANNEL_NOISE:
		db 0			
		db 0			
		db 0			
TMPCPY_MUSIC_CHANNEL_NOISE_NOT_IN_USE:
		db 1		
		db 0Eh
		db  0
		db  1
		db 18h
		db  0
		db  0
		db  0
		db 6Bh
		db 12h
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		db  0
		align	10h		
TMPCPY_MUSIC_BANK:
		db  0		
TMPCPY_MUSIC_DOESNT_USE_SAMPLES:
		db  0		
TMPCPY_YM_TIMER_VALUE:
		db  0
		
									
END_OF_DRIVER:
	if MOMPASS==2
		if $ > 1FC0h
			fatal "Driver too big to fit in Z80 Ram ; the last offset must be < 1FC0h. It is currently \{END_OF_DRIVER}h"
		else
			message "Last offset: \{END_OF_DRIVER}h"
		endif
	endif

		end