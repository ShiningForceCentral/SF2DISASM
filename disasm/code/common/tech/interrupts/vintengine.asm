
; ASM FILE code\common\tech\interrupts\vintengine.asm :
; 0x594..0x14A6 : Vertical Interrupt Engine - Main Technical Engine - Triggered at each frame display

; =============== S U B R O U T I N E =======================================

VInt:
		movem.l d0-a6,-(sp)
		bclr    #7,(VINT_PARAMS).l
		beq.s   loc_5EC
		bsr.w   WaitForDMAFree  
		bsr.w   DisableDisplay
		bsr.w   RelatedToBits031_sub_674
		bsr.w   EnableDisplay
		bsr.w   RelatedToBit4_sub_700
		bsr.w   ParseFadingFX
		bsr.w   UpdateSoundAndInputAndPalettes
		andi    #$F800,sr       ; disable interrupts
		clr.b   ((DISPLAY_WINDOWS_TOGGLE-$1000000)).w
		tst.b   ((WINDOW_HIDING_FORBIDDEN-$1000000)).w
		bne.s   loc_5DA
		btst    #7,((P1_INPUT-$1000000)).w
						; if Start pushed, hide windows
		beq.s   loc_5DA
		move.b  #$FF,((DISPLAY_WINDOWS_TOGGLE-$1000000)).w
loc_5DA:
		bsr.w   ExecuteVIntFuncs
		clr.b   ((VINT_WAIT_TOGGLE-$1000000)).w
		move.b  ((VINT_ENABLED-$1000000)).w,d0
		or.b    d0,(VINT_PARAMS).l
loc_5EC:
		addq.b  #1,((byte_FFDEA0-$1000000)).w
		clr.b   (byte_FFDEA1).l
		move.w  (VDP_REG00_STATUS).l,(VDP_Control).l
		move.l  ((AFTER_INTRO_JUMP_OFFSET-$1000000)).w,d0
		beq.s   loc_620
		btst    #7,((P1_INPUT-$1000000)).w
						; if we're currently playing the Intro, check if Start is pushed
		beq.s   loc_620
		clr.l   ((AFTER_INTRO_JUMP_OFFSET-$1000000)).w
		movea.l (SECONDS_COUNTER_0).l,sp; if Start Pushed during Intro, go back to Main
		movea.l d0,a0
		move    #$2300,sr       ; enable interrupts
		jmp     (a0)
loc_620:
		movem.l (sp)+,d0-a6
		rte

	; End of function VInt


; =============== S U B R O U T I N E =======================================

ExecuteVIntFuncs:
		
		move.b  ((FRAMES_SINCE_VINT-$1000000)).w,d0
		addq.b  #1,d0           ; increment frame and second counters
		cmpi.b  #$3C,d0 
		bne.s   loc_638
		clr.b   d0
		addq.l  #1,((SECONDS_COUNTER-$1000000)).w
loc_638:
		move.b  d0,((FRAMES_SINCE_VINT-$1000000)).w
		lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
		moveq   #7,d7
		clr.w   d6              ; loop 8 times, for each contextual function pointer available
loc_644:
		move.l  (a0)+,d0
		btst    d6,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
		beq.s   loc_658
		movem.l d0-a6,-(sp)
		movea.l d0,a0
		jsr     (a0)            ; for each trigger set, execute corresponding contextual function
		movem.l (sp)+,d0-a6
loc_658:
		addq.w  #1,d6
		dbf     d7,loc_644
		rts

	; End of function ExecuteVIntFuncs


; =============== S U B R O U T I N E =======================================

DisableDisplay:
		
		andi.b  #$BF,(VDP_REG01_VALUE).l
		move.w  (VDP_REG01_STATUS).l,(VDP_Control).l
		rts

	; End of function DisableDisplay


; =============== S U B R O U T I N E =======================================

; related to bit0, bit3 and bit1

RelatedToBits031_sub_674:
		
		bsr.s   RelatedToBit0_sub_67C
		bsr.w   RelatedToBits31_sub_740
		rts

	; End of function RelatedToBits031_sub_674


; =============== S U B R O U T I N E =======================================

; executes if bit0 set

RelatedToBit0_sub_67C:
		
		bclr    #0,(VINT_PARAMS).l
		beq.w   return_6FE
		tst.b   (byte_FFDE95).l
		beq.w   return_6FE
		lea     (byte_FFD780).l,a0
loc_698:
		move.w  (a0)+,d0
		move.w  #$8F02,d1
		bclr    #$F,d0
		beq.s   loc_6B2
		move.w  #$8F40,d1
		bclr    #$E,d0
		beq.s   loc_6B2
		move.w  #$8F80,d1
loc_6B2:
		move.w  d1,(VDP_Control).l
		move.w  (a0)+,d2
		move.w  d2,d1
		andi.w  #$3FFF,d2
		ori.w   #$4000,d2
		move.w  d2,(VDP_Control).l
		clr.w   d2
		add.w   d1,d1
		addx.w  d2,d2
		add.w   d1,d1
		addx.w  d2,d2
		move.w  d2,(VDP_Control).l
loc_6DA:
		move.w  (a0)+,(VDP_Data).l
		dbf     d0,loc_6DA
		subq.b  #1,(byte_FFDE95).l
		bne.s   loc_698
		move.w  #$8F02,(VDP_Control).l
		move.l  #byte_FFD780,(dword_FFDED0).l
return_6FE:
		rts

	; End of function RelatedToBit0_sub_67C


; =============== S U B R O U T I N E =======================================

; related to bit4

RelatedToBit4_sub_700:
		
		bclr    #4,(VINT_PARAMS).l
		beq.s   return_73E
		lea     (byte_FFD780).l,a0
		move.w  #$8F02,(VDP_Control).l
		move.w  (a0),d7
		andi.w  #$3FFF,d7
		move.w  d7,(VDP_Control).l
		move.w  (a0)+,d7
		rol.w   #2,d7
		andi.w  #3,d7
		move.w  d7,(VDP_Control).l
		move.w  (a0)+,d7
loc_734:
		move.w  (VDP_Data).l,(a0)+
		dbf     d7,loc_734
return_73E:
		rts

	; End of function RelatedToBit4_sub_700


; =============== S U B R O U T I N E =======================================

; executes if bit3 set or bit1 clear

RelatedToBits31_sub_740:
		
		bclr    #3,(VINT_PARAMS).l
		bne.s   loc_754
		btst    #1,(VINT_PARAMS).l
		bne.s   return_7CC
loc_754:
		move.w  #$100,(Z80BusReq).l
loc_75C:
		btst    #0,(Z80BusReq).l
		bne.s   loc_75C
		btst    #1,(VINT_PARAMS).l
		bne.s   return_7CC
		bsr.w   DmaSpriteTable
		tst.b   (byte_FFDE96).l
		beq.s   loc_7BA
		lea     (byte_FFD550).l,a0
		lea     (VDP_Control).l,a6
		move.w  (VDP_REG01_STATUS).l,d7
		ori.b   #$10,d7
		move.w  d7,(a6)
loc_794:
		move.w  (a0)+,(a6)
		move.l  (a0)+,(a6)
		move.l  (a0)+,(a6)
		move.l  (a0)+,(a6)
		move.w  (a0)+,(TEMP_DMA_VALUE).l
		move.w  (TEMP_DMA_VALUE).l,(a6)
		subq.b  #1,(byte_FFDE96).l
		bne.s   loc_794
		move.w  (VDP_REG01_STATUS).l,(a6)
		move.w  #$8F02,(a6)
loc_7BA:
		move.w  #0,(Z80BusReq).l
		move.l  #byte_FFD550,(VDP_REG_COMMANDS).l
return_7CC:
		rts

	; End of function RelatedToBits31_sub_740


; =============== S U B R O U T I N E =======================================

Trap9_ManageContextualFunctions:
		
		movem.l d0-a6,-(sp)
		move    sr,d6
		move    #$2700,sr
		movea.l $3E(sp),a6
		move.w  (a6)+,d0
		addq.l  #2,$3E(sp)
		add.w   d0,d0
		move.w  rjt_Trap9ActionsOfs(pc,d0.w),d0
		jmp     rjt_Trap9ActionsOfs(pc,d0.w)
						; jump according to the first two bytes parameter : $0000 to $0004

	; End of function Trap9_ManageContextualFunctions

rjt_Trap9ActionsOfs:
		dc.w Trap9_ClearPointers-rjt_Trap9ActionsOfs
		dc.w Trap9_SetFunctionAndTrigger-rjt_Trap9ActionsOfs
		dc.w Trap9_ClearFunctionAndTrigger-rjt_Trap9ActionsOfs
		dc.w Trap9_ClearTrigger-rjt_Trap9ActionsOfs
		dc.w Trap9_SetTrigger-rjt_Trap9ActionsOfs

; =============== S U B R O U T I N E =======================================

; clear pointers

Trap9_ClearPointers:
		
		moveq   #0,d0
		clr.b   ((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
		lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
		clr.l   (a0)+
		clr.l   (a0)+
		clr.l   (a0)+
		clr.l   (a0)+
		clr.l   (a0)+
		clr.l   (a0)+
		clr.l   (a0)+
		clr.l   (a0)+
		bra.w   loc_8D6

	; End of function Trap9_ClearPointers


; =============== S U B R O U T I N E =======================================

; declare function and set trigger

Trap9_SetFunctionAndTrigger:
		
		move.l  (a6)+,d0
		addq.l  #4,$3E(sp)
		moveq   #7,d7
		lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
		clr.w   d1
loc_822:
		tst.l   (a0)+
		beq.w   loc_832
		addq.w  #1,d1
		dbf     d7,loc_822
		bra.w   loc_8D6
loc_832:
		move.l  d0,-(a0)
		bset    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
		bra.w   loc_8D6

	; End of function Trap9_SetFunctionAndTrigger


; =============== S U B R O U T I N E =======================================

; remove declared function and clear trigger

Trap9_ClearFunctionAndTrigger:
		
		move.l  (a6)+,d0
		addq.l  #4,$3E(sp)
		moveq   #7,d7
		lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
		clr.w   d1
loc_84A:
		cmp.l   (a0)+,d0
		beq.w   loc_85A
		addq.w  #1,d1
		dbf     d7,loc_84A
		bra.w   loc_8D6
loc_85A:
		clr.l   -(a0)
		bclr    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
		bra.w   loc_8D6

	; End of function Trap9_ClearFunctionAndTrigger


; =============== S U B R O U T I N E =======================================

; clear function trigger, or clear all triggers if param=0

Trap9_ClearTrigger:
		
		addq.l  #4,$3E(sp)
		move.l  (a6)+,d0
		beq.w   loc_88E
		moveq   #7,d7
		lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
		clr.w   d1
loc_876:
		cmp.l   (a0)+,d0
		beq.w   loc_886
		addq.w  #1,d1
		dbf     d7,loc_876
		bra.w   loc_8D6
loc_886:
		bclr    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
		bra.w   loc_8D6
loc_88E:
		clr.b   ((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
		bra.w   loc_8D6

	; End of function Trap9_ClearTrigger


; =============== S U B R O U T I N E =======================================

; set function trigger, or set all triggers if param=0

Trap9_SetTrigger:
		
		moveq   #7,d7
		lea     ((VINT_FUNC_ADDRS-$1000000)).w,a0
		clr.w   d1
		addq.l  #4,$3E(sp)
		move.l  (a6)+,d0
		beq.w   loc_8C0
loc_8A8:
		cmp.l   (a0)+,d0
		beq.w   loc_8B8         
		addq.w  #1,d1
		dbf     d7,loc_8A8
		bra.w   loc_8D6
loc_8B8:
		bset    d1,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w
						; set trigger
		bra.w   loc_8D6
loc_8C0:
		clr.w   d0
		clr.w   d1
		moveq   #7,d7
loc_8C6:
		tst.l   (a0)+
		beq.s   loc_8CC
		bset    d1,d0
loc_8CC:
		addq.w  #1,d1
		dbf     d7,loc_8C6
		move.b  d0,((VINT_FUNCS_ENABLED_BITFIELD-$1000000)).w

	; End of function Trap9_SetTrigger


; START OF FUNCTION CHUNK FOR Trap9_ClearTrigger

loc_8D6:
		move    d6,sr
		movem.l (sp)+,d0-a6
		rte

; END OF FUNCTION CHUNK FOR Trap9_ClearTrigger


; =============== S U B R O U T I N E =======================================

UpdateSoundAndInputAndPalettes:
		
		move.w  #$100,(Z80BusReq).l
loc_8E6:
		btst    #0,(Z80BusReq).l
		bne.s   loc_8E6         ; wait for Z80 bus available
		tst.b   ((WAIT_FOR_MUSIC_END-$1000000)).w
		beq.w   loc_906
		tst.b   (Z80_CHANNEL_1_NOT_IN_USE).l
		beq.w   loc_9F6
		clr.b   ((WAIT_FOR_MUSIC_END-$1000000)).w
loc_906:
		lea     ((SOUND_COMMAND_QUEUE-$1000000)).w,a0
		move.l  4(a0),d0
		or.l    (a0),d0         ; if stack void, do nothing
		beq.w   loc_9F6
		move.b  (a0),d1         ; contains music volume parameter when command is FC
														; or fade in parameter when 7F < command < F0
		move.b  1(a0),d0        ; stores first command in d1 and d0 and pushes the rest forward
		move.w  2(a0),(a0)+
loc_91E:
		move.w  2(a0),(a0)+
		move.w  2(a0),(a0)+
		clr.w   (a0)
		cmpi.b  #$FB,d0
		bne.s   loc_95A         ; if command FB, play back previous music
														; NOTE : for future cube save/resume feature,
														; send proper resume command instead of previous music index !
														; Cube should save current music at every new music index !
		tst.b   ((MUSIC_STACK_LENGTH-$1000000)).w
		beq.s   loc_94E
		movem.l d7-a0,-(sp)
		lea     ((MUSIC_STACK-$1000000)).w,a0
		moveq   #8,d7
loc_93E:
		move.b  1(a0),(a0)+
		dbf     d7,loc_93E
		movem.l (sp)+,d7-a0
		subq.b  #1,((MUSIC_STACK_LENGTH-$1000000)).w
loc_94E:
		move.b  ((MUSIC_STACK-$1000000)).w,(Z80_SoundDriverCommand).l
		bra.w   loc_9F6
loc_95A:
		cmpi.b  #$FD,d0
		bcs.s   loc_96A
		move.b  d0,(Z80_SoundDriverCommand).l
						; if command >= FD, then send it to Z80
		bra.w   loc_9F6
loc_96A:
		cmpi.b  #$F0,d0
		bne.s   loc_97A
		move.b  #1,((WAIT_FOR_MUSIC_END-$1000000)).w
						; if F0, then wait for current music to end before sending commands to Z80
		bra.w   loc_9F6
loc_97A:
		cmpi.b  #$FC,d0
		bne.s   loc_994         ; if FC, then update music level
		andi.b  #$F,d1
		move.b  d1,(Z80_SoundDriverMusicLevel).l
loc_98A:
		move.b  d0,(Z80_SoundDriverCommand).l
		bra.w   loc_9F6
loc_994:
		movem.l d0,-(sp)
		andi.b  #$7F,d0 ; a music/sfx index mask that must be changed to allow indexes above $80
														; also change stuff at 9AA then !
		cmp.b   ((MUSIC_STACK-$1000000)).w,d0
						; compare with last played music
		movem.l (sp)+,d0
		bne.s   loc_9AA
		bra.w   loc_9F6         ; if same to last played music, let current music play
														; (might play nothing if last played music has ended !)
loc_9AA:
		bclr    #7,d0           ; if command > 7F, then send Fade In parameter
		beq.s   loc_9B8         ; branch if bit was 1 before bclr
		move.b  d1,(Z80_SoundDriverFadeInData).l
		bra.s   loc_9C6
loc_9B8:
		cmpi.b  #$40,d0 
		bgt.s   loc_9C6
loc_9BE:
		move.b  #$F,(Z80_SoundDriverFadeInData).l
						; if music, put this fade in parameter : no fade in
loc_9C6:
		move.b  d0,(Z80_SoundDriverCommand).l
						; send music/sfx command to Z80
		cmpi.b  #$40,d0 
		bge.s   loc_9F6
loc_9D2:
		movem.l d7-a0,-(sp)
		lea     ((WAIT_FOR_MUSIC_END-$1000000)).w,a0
		moveq   #8,d7
loc_9DC:
		move.b  -2(a0),-(a0)    ; add music index to music stack
		dbf     d7,loc_9DC
		move.b  d0,-(a0)
		movem.l (sp)+,d7-a0
		cmpi.b  #$A,((MUSIC_STACK_LENGTH-$1000000)).w
		bge.s   loc_9F6
		addq.b  #1,((MUSIC_STACK_LENGTH-$1000000)).w
loc_9F6:
		bsr.w   UpdatePlayerInputs
loc_9FA:
		tst.b   ((byte_FFDE9D-$1000000)).w
		bne.s   loc_A60
		moveq   #2,d0
		move.b  ((P1_INPUT-$1000000)).w,d1
		lsr.w   #1,d1
		dbcc    d0,*+4
		lsr.w   #1,d1
		dbcc    d0,*+4
		lsr.w   #1,d1
		dbcc    d0,*+4
		lsr.w   #1,d1
		dbcc    d0,*+4
		tst.w   d0
		bgt.s   loc_A54         
		move.b  ((PRIMARY_WALKING_DIRECTION-$1000000)).w,d0
						; get current walking direction
loc_A26:
		eor.b   d0,((P1_INPUT-$1000000)).w
						; get new direction
		moveq   #2,d0
		move.b  ((P1_INPUT-$1000000)).w,d1
		lsr.w   #1,d1
		dbcc    d0,*+4
		lsr.w   #1,d1
		dbcc    d0,*+4
		lsr.w   #1,d1
		dbcc    d0,*+4
		lsr.w   #1,d1
		dbcc    d0,*+4
		tst.w   d0
		bgt.s   loc_A52
		andi.b  #3,((P1_INPUT-$1000000)).w
						; if both directions are new, only keep vertical one
loc_A52:
		bra.s   loc_A60
loc_A54:
		move.b  ((P1_INPUT-$1000000)).w,d1
						; if only one direction pushed, set it as primary
		andi.w  #$F,d1
		move.b  d1,((PRIMARY_WALKING_DIRECTION-$1000000)).w
loc_A60:
		move.b  ((P1_INPUT-$1000000)).w,d0
		move.b  d0,((CURRENT_PLAYER_INPUT-$1000000)).w
						; overwrite P2 6-button data with P1 state with walking direction
		cmp.b   ((LAST_PLAYER_INPUT-$1000000)).w,d0
		bne.s   loc_A86         
		addq.b  #1,((INPUT_REPEAT_DELAYER-$1000000)).w
						; if input is the same then increment counter and ignore input
		cmpi.b  #$18,((INPUT_REPEAT_DELAYER-$1000000)).w
		bcc.s   loc_A80
		clr.b   ((CURRENT_PLAYER_INPUT-$1000000)).w
						; keep current input only when counter reaches $18
		bra.s   loc_A84
loc_A80:
		subq.b  #6,((INPUT_REPEAT_DELAYER-$1000000)).w
loc_A84:
		bra.s   loc_AAC
loc_A86:
		clr.w   d2              ; if input is new
		move.b  ((LAST_PLAYER_INPUT-$1000000)).w,d1
		andi.b  #$F,d1
		beq.s   loc_A94
		moveq   #1,d2           ; was pushing a direction
loc_A94:
		move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,((LAST_PLAYER_INPUT-$1000000)).w
		andi.b  #$F,d0
		beq.w   loc_AA8
		tst.b   d2
		bne.w   loc_AAC
loc_AA8:
		clr.b   ((INPUT_REPEAT_DELAYER-$1000000)).w
loc_AAC:
		move.w  #0,(Z80BusReq).l
		bsr.w   sub_19F8        
		rts

	; End of function UpdateSoundAndInputAndPalettes


; =============== S U B R O U T I N E =======================================

ParseFadingFX:
		
		move.b  ((FADING_SETTING-$1000000)).w,d0
		beq.w   return_B1C
		subq.b  #1,((FADING_COUNTER-$1000000)).w
		bne.w   return_B1C
		move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
		subq.b  #1,d0
		ext.w   d0
		lsl.w   #3,d0           ; *8 ? so 8 bytes per entry ?
		move.b  ((FADING_POINTER-$1000000)).w,d1
		ext.w   d1
		add.w   d1,d0
		move.b  FadingData(pc,d0.w),d1
		cmpi.w  #$80,d1 
		bne.s   loc_AEC
		clr.b   ((FADING_SETTING-$1000000)).w
						; end of palette fx ?
loc_AEC:
		movem.l d1,-(sp)
		andi.w  #$F0,d1 
		cmpi.w  #$80,d1 
		movem.l (sp)+,d1
		bne.s   loc_B0A
		andi.w  #$F,d1          ; go x backwards
		sub.b   d1,((FADING_POINTER-$1000000)).w
		bra.w   ParseFadingFX
loc_B0A:
		ext.w   d1
		move.w  d1,d0
		move.b  ((FADING_PALETTE_FLAGS-$1000000)).w,d1
		ext.w   d1
		bsr.w   DoSomethingWithPalettes1or2
		addq.b  #1,((FADING_POINTER-$1000000)).w
return_B1C:
		rts

	; End of function ParseFadingFX

FadingData:     incbin "data/graphics/tech/fadingdata.bin"
						; 80 : end
														; 8x : go x backward

; =============== S U B R O U T I N E =======================================

; waits for 0xc00004 (VDP DMA register) to be cleared

WaitForDMAFree:
		
		movem.w d0,-(sp)
loc_B9A:
		move.w  (VDP_Control).l,d0
		btst    #1,d0           ; control if DMA in progress
		bne.s   loc_B9A         ; loop if DMA in progress
		movem.w (sp)+,d0
		rts

	; End of function WaitForDMAFree


; =============== S U B R O U T I N E =======================================

; d0 : vdp reg number

GetVdpRegStatus:
		
		movem.l a0,-(sp)
		lea     (VDP_REG00_STATUS).l,a0
		add.w   d0,d0
		move.w  (a0,d0.w),d0
		movem.l (sp)+,a0
		rts

	; End of function GetVdpRegStatus


; =============== S U B R O U T I N E =======================================

; d0 : vdp reg command

SetVdpReg:
		bsr.s   WaitForDMAFree  
		movem.l d0-d1/a0,-(sp)
		lea     (VDP_REG00_STATUS).l,a0
		move.w  d0,(VDP_Control).l
		move.w  d0,d1
		andi.w  #$7F00,d0
		lsr.w   #7,d0
		move.w  d1,(a0,d0.w)    ; store new vdp reg status
		movem.l (sp)+,d0-d1/a0
		rts

	; End of function SetVdpReg


; =============== S U B R O U T I N E =======================================

VdpEnableDisplay:
		
		bsr.s   WaitForDMAFree  
		movem.l d0-d1/a0,-(sp)
		lea     (VDP_REG00_STATUS).l,a0
		add.w   d0,d0
		or.b    d1,1(a0,d0.w)   ; enable display
		bra.s   SendVDPCommand

	; End of function VdpEnableDisplay


; =============== S U B R O U T I N E =======================================

VdpDisableDisplay:
		
		bsr.s   WaitForDMAFree  
		movem.l d0-d1/a0,-(sp)
		lea     (VDP_REG00_STATUS).l,a0
		add.w   d0,d0
		and.b   d1,1(a0,d0.w)   ; disable display

	; End of function VdpDisableDisplay


; START OF FUNCTION CHUNK FOR VdpEnableDisplay

SendVDPCommand:
		
		move.w  (a0,d0.w),d1
		move.w  d1,(VDP_Control).l
		movem.l (sp)+,d0-d1/a0
		rts

; END OF FUNCTION CHUNK FOR VdpEnableDisplay


; =============== S U B R O U T I N E =======================================

EnableDisplay:
		
		move.w  #1,d0           ; get vdp reg 01
		move.w  #$40,d1 
		bra.s   VdpEnableDisplay

	; End of function EnableDisplay


; =============== S U B R O U T I N E =======================================

DisableDisplaybis:
		
		move.w  #1,d0
		move.w  #$BF,d1 
		bra.s   VdpDisableDisplay

	; End of function DisableDisplaybis


; =============== S U B R O U T I N E =======================================

EnableInterrupts:
		
		move.b  #$80,((VINT_ENABLED-$1000000)).w
		move    #$2300,sr       ; set interrupt mask to level 3
		rts

	; End of function EnableInterrupts


; =============== S U B R O U T I N E =======================================

DisableInterrupts:
		
		clr.b   ((VINT_ENABLED-$1000000)).w
		move    #$2700,sr       ; set interrupt mask to level 7 : no more HInt/VInt !
		rts

	; End of function DisableInterrupts


; =============== S U B R O U T I N E =======================================

EnableDisplayAndInterrupts:
		
		bsr.s   EnableDisplay
		bra.s   EnableInterrupts

	; End of function EnableDisplayAndInterrupts


; =============== S U B R O U T I N E =======================================

DisableDisplayAndVInt:
		
		bsr.s   DisableInterrupts
		bra.s   DisableDisplaybis

	; End of function DisableDisplayAndVInt


; =============== S U B R O U T I N E =======================================

ClearFFDE94bit1:
		
		bclr    #1,(VINT_PARAMS).l
		rts

	; End of function ClearFFDE94bit1


; =============== S U B R O U T I N E =======================================

; used to execute sub_740

SetFFDE94bit1:
		
		bset    #1,(VINT_PARAMS).l
		rts

	; End of function SetFFDE94bit1


; =============== S U B R O U T I N E =======================================

DuplicatePalettes:
		
		movem.l d7/a5-a6,-(sp)
		lea     (PALETTE_1_BIS).l,a5
		lea     (PALETTE_1).l,a6
		move.w  #$3F,d7 
loc_C76:
		move.w  (a5)+,(a6)+
		dbf     d7,loc_C76
		movem.l (sp)+,d7/a5-a6

	; End of function DuplicatePalettes


; =============== S U B R O U T I N E =======================================

; Palette transfer ?

StoreVdpCommandster:
		
		move    sr,-(sp)
		move    #$2700,sr       ; disable interrupts
		movem.l a6,-(sp)
		movea.l (VDP_REG_COMMANDS).l,a6
		move.w  #$8F02,(a6)+    ; auto increment : 2
		move.w  #$9400,(a6)+    ; DMA length
		move.w  #$9340,(a6)+
		move.w  #$96E8,(a6)+
		move.w  #$9500,(a6)+
		move.w  #$977F,(a6)+    ; RAM to VRAM, address : 0x3FE800
		move.w  #$C000,(a6)+
		move.w  #$80,(a6)+ ; data port stuff ?
		move.l  a6,(VDP_REG_COMMANDS).l
		addq.b  #1,(byte_FFDE96).l
		movem.l (sp)+,a6
		move    (sp)+,sr
		rts

	; End of function StoreVdpCommandster


; =============== S U B R O U T I N E =======================================

; looks like this piece of code is incomplete and useless

CopyPaletteIncomplete:
		
		lea     (PALETTE_1_BIS).l,a1
		move.w  #$F,d0
loc_CCE:
		move.w  (a0)+,(a1)+
		dbf     d0,loc_CCE
		rts

	; End of function CopyPaletteIncomplete


; =============== S U B R O U T I N E =======================================

FadeInFromBlack:
		
		move.b  #1,((FADING_SETTING-$1000000)).w
		bra.w   ExecuteFading

	; End of function FadeInFromBlack


; =============== S U B R O U T I N E =======================================

FadeOutToBlack:
		
		move.b  #OUT_TO_BLACK,((FADING_SETTING-$1000000)).w
		bra.w   ExecuteFading

	; End of function FadeOutToBlack


; =============== S U B R O U T I N E =======================================

FadeInFromWhite:
		
		move.b  #IN_FROM_WHITE,((FADING_SETTING-$1000000)).w
		bra.w   ExecuteFading

	; End of function FadeInFromWhite


; =============== S U B R O U T I N E =======================================

FadeOutToWhite:
		
		move.b  #OUT_TO_WHITE,((FADING_SETTING-$1000000)).w

	; End of function FadeOutToWhite


; =============== S U B R O U T I N E =======================================

ExecuteFading:
		
		clr.w   ((byte_FFDFAA-$1000000)).w
		clr.b   ((FADING_POINTER-$1000000)).w
		move.b  ((FADING_COUNTER_MAX-$1000000)).w,((FADING_COUNTER-$1000000)).w
		move.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
loc_D0E:
		bsr.w   WaitForVInt     
		tst.b   ((FADING_SETTING-$1000000)).w
						; wait until fade end
		bne.s   loc_D0E
		bsr.w   WaitForVInt     
		rts

	; End of function ExecuteFading


; =============== S U B R O U T I N E =======================================

DoSomethingWithPalettes1or2:
		
		movem.l d2-a2,-(sp)
		lea     (PALETTE_1_BIS).l,a0
		lea     (PALETTE_1).l,a1
		moveq   #3,d6
loc_D30:
		moveq   #3,d5
		sub.w   d6,d5
		btst    d5,d1
		bne.s   loc_D44
		adda.w  #$20,a0 ; go to plt 2 instead
		adda.w  #$20,a1 
		bra.w   loc_DA8
loc_D44:
		moveq   #$F,d7
loc_D46:
		movem.l d0,-(sp)
		move.w  (a0)+,d2
		add.w   d0,d0
		move.w  d2,d3
		andi.w  #$F,d3
		add.w   d0,d3
		bpl.s   loc_D5C
		clr.w   d3
		bra.s   loc_D66
loc_D5C:
		cmpi.w  #$F,d3
		ble.s   loc_D66
		move.w  #$F,d3
loc_D66:
		asl.w   #4,d0
		move.w  d2,d4
		andi.w  #$F0,d4 
		add.w   d0,d4
		bpl.s   loc_D76
		clr.w   d4
		bra.s   loc_D80
loc_D76:
		cmpi.w  #$F0,d4 
		ble.s   loc_D80
		move.w  #$F0,d4 
loc_D80:
		or.w    d4,d3
		asl.w   #4,d0
		move.w  d2,d4
		andi.w  #$F00,d4
		add.w   d0,d4
		bpl.s   loc_D92
		clr.w   d4
		bra.s   loc_D9C
loc_D92:
		cmpi.w  #$F00,d4
		ble.s   loc_D9C
		move.w  #$F00,d4
loc_D9C:
		or.w    d4,d3
		move.w  d3,(a1)+
		movem.l (sp)+,d0
		dbf     d7,loc_D46
loc_DA8:
		dbf     d6,loc_D30
		bsr.w   StoreVdpCommandster
		bsr.w   Set_FFDE94_bit3 
		movem.l (sp)+,d2-a2
		rts

	; End of function DoSomethingWithPalettes1or2


; =============== S U B R O U T I N E =======================================

ClearVsramAndSprites:
		
		move.w  #$100,(Z80BusReq).l
loc_DC2:
		btst    #0,(Z80BusReq).l
		bne.s   loc_DC2         ; wait for bus available
		bsr.s   ClearScrollTableData
		bsr.s   ClearSpriteTable
		bsr.s   DmaSpriteTable
		move.w  #0,(Z80BusReq).l
		rts

	; End of function ClearVsramAndSprites


; =============== S U B R O U T I N E =======================================

DmaSpriteTable:
		
		bsr.w   WaitForDMAFree  
		lea     (VDP_Control).l,a6
		move.w  #$8134,(a6)     ; disable display, enable Vint, enable DMA
		move.l  #$94019300,(a6) ; DMA Length : $100
		move.l  #$96EE9540,(a6) ; from RAM 0xFFEE40
loc_DF6:
		move.w  #$977F,(a6)
		move.w  #$6800,(a6)     ; to VRAM 0xE800
		move.w  #$83,(TEMP_DMA_VALUE).l 
		move.w  (TEMP_DMA_VALUE).l,(a6)
		move.w  (VDP_REG01_STATUS).l,(a6)
						; Shouldn't it go to reg 01 with value 81 instead of 83 ??
		rts

	; End of function DmaSpriteTable


; =============== S U B R O U T I N E =======================================

ClearSpriteTable:
		
		movem.l d0-d1/a0,-(sp)
		lea     (SPRITE_Y).l,a0 
		moveq   #$3F,d1 
		moveq   #1,d0
loc_E22:
		move.l  d0,(a0)
		clr.l   4(a0)
		addq.w  #8,a0
		addq.b  #1,d0
		dbf     d1,loc_E22
		clr.b   -5(a0)
		movem.l (sp)+,d0-d1/a0
		rts

	; End of function ClearSpriteTable


; =============== S U B R O U T I N E =======================================

ClearScrollTableData:
		
		movem.l d7/a6,-(sp)
		move.w  #$C000,d0       ; clear scroll A table
loc_E42:
		move.w  #$1000,d1
		clr.w   d2
		bsr.w   DmaVramFill     
		move.w  #$E000,d0       ; clear scroll B table
		move.w  #$1000,d1
		clr.w   d2
		bsr.w   DmaVramFill     
		move.w  #$1FF,d7
		lea     ((byte_FFC000-$1000000)).w,a6
loc_E62:
		clr.l   (a6)+
loc_E64:
		dbf     d7,loc_E62
		move.w  #$1FF,d7
		adda.w  #$1800,a6
loc_E70:
		clr.l   (a6)+
		dbf     d7,loc_E70
		movem.l (sp)+,d7/a6
		rts

	; End of function ClearScrollTableData


; =============== S U B R O U T I N E =======================================

DoDMAstuffbis:
		
		movem.l d0-d3,-(sp)
		move.w  (VDP_REG01_STATUS).l,d3
		ori.b   #$10,d3
		move.w  d3,(VDP_Control).l
		move.w  #$8F01,(VDP_Control).l; auto increment : 1
		move.w  #$9300,(VDP_Control).l; DMA length
		move.w  #$9401,(VDP_Control).l
		move.w  #$9780,(VDP_Control).l; VRAM fill
		move.w  #$C000,(VDP_Control).l
		move.w  #$80,(VDP_Control).l ; address set ?
		move.w  #0,(VDP_Data).l
loc_EC8:
		move.w  (VDP_Control).l,d0
		andi.w  #2,d0           ; wait for DMA free
		bne.s   loc_EC8
		move.w  (VDP_REG01_STATUS).l,d3
		move.w  d3,(VDP_Control).l
		move.w  #$8F02,(VDP_Control).l; auto increment : 2
		movem.l (sp)+,d0-d3
		rts

	; End of function DoDMAstuffbis


; =============== S U B R O U T I N E =======================================

; Wait until VInt func is called, i.e. next frame

WaitForVInt:
		bset    #7,(VINT_PARAMS).l
		move.b  #1,((VINT_WAIT_TOGGLE-$1000000)).w
loc_EFC:
		tst.b   ((VINT_WAIT_TOGGLE-$1000000)).w
						; wait until FFDEF7 clear
		bne.s   loc_EFC         
		rts

	; End of function WaitForVInt


; =============== S U B R O U T I N E =======================================

; wait for D0 Vints/frames

Sleep:
		movem.w d0,-(sp)
		subq.w  #1,d0
		bcs.w   loc_F14
loc_F0E:
		bsr.s   WaitForVInt     
		dbf     d0,loc_F0E
loc_F14:
		movem.w (sp)+,d0
		rts

	; End of function Sleep


; =============== S U B R O U T I N E =======================================

; used to execute sub_67C

Set_FFDE94_bit0:
		
		bset    #0,(VINT_PARAMS).l
		rts

	; End of function Set_FFDE94_bit0


; =============== S U B R O U T I N E =======================================

; execute sub_67C

SetFFDE94b0andWait:
		
		bsr.s   Set_FFDE94_bit0 
		bra.w   WaitForVInt     

	; End of function SetFFDE94b0andWait


; =============== S U B R O U T I N E =======================================

; used to execute sub_740

Set_FFDE94_bit3:
		
		bset    #3,(VINT_PARAMS).l
		rts

	; End of function Set_FFDE94_bit3


; =============== S U B R O U T I N E =======================================

; set bit 3 of 0xFFDE94 and wait next Vint to execute sub_740

SetFFDE94b3andWait:
		
		bsr.s   Set_FFDE94_bit3 
		bra.w   WaitForVInt     

	; End of function SetFFDE94b3andWait


; =============== S U B R O U T I N E =======================================

sub_F3A:
		bsr.w   DisableInterrupts
		movem.l d7/a4-a5,-(sp)
		movea.l (dword_FFDED0).l,a4
		moveq   #0,d7
		move.w  d7,(a4)+
		bsr.s   sub_F90
		move.w  a6,(a4)+
loc_F50:
		move.w  d0,(a4)+
loc_F52:
		move.l  a4,(dword_FFDED0).l
		addq.b  #1,(byte_FFDE95).l
		clr.l   d7
		move.w  a6,d7
		ori.l   #$FF0000,d7
		movea.l d7,a6
		move.w  d0,(a6)
		movem.l (sp)+,d7/a4-a5
		bsr.w   EnableInterrupts
		rts

	; End of function sub_F3A


; =============== S U B R O U T I N E =======================================

sub_F76:
		bsr.w   DisableInterrupts
		movem.l d7/a4-a5,-(sp)
		movea.l (dword_FFDED0).l,a4
		moveq   #0,d7
		move.w  d7,(a4)+
		bsr.s   sub_F90
		bsr.s   SwapA6
		move.w  a6,(a4)+
		bra.s   loc_F50

	; End of function sub_F76


; =============== S U B R O U T I N E =======================================

sub_F90:
		movem.l d5-d7,-(sp)
loc_F94:
		lea     ($E000).l,a6
		lsl.w   #1,d5
		move.w  (byte_FFD102).l,d7
		addq.w  #4,d7
		lsr.w   #2,d7
		sub.w   d7,d5
		andi.w  #$7E,d5 
		lsl.w   #7,d6
		move.w  (byte_FFD502).l,d7
		subq.w  #8,d7
		lsl.w   #4,d7
		add.w   d7,d6
		andi.w  #$F80,d6
		or.w    d6,d5
		adda.w  d5,a6
		bsr.s   SwapA6
		movem.l (sp)+,d5-d6
		movem.l d5-d6,-(sp)
		adda.l  #$C000,a6
		lsl.w   #1,d5
loc_FD4:
		move.w  (word_FFD100).l,d7
		lsr.w   #2,d7
		sub.w   d7,d5
		andi.w  #$7E,d5 
		lsl.w   #7,d6
		move.w  (word_FFD500).l,d7
		lsl.w   #4,d7
		add.w   d7,d6
loc_FEE:
		andi.w  #$F80,d6
		or.w    d6,d5
		adda.w  d5,a6
		movem.l (sp)+,d5-d7
		andi.w  #$7E,d5 
		andi.w  #$F80,d6
		rts

	; End of function sub_F90


; =============== S U B R O U T I N E =======================================

SwapA6:
		movem.l d7,-(sp)
		move.l  a6,d7
		swap    d7
		movea.l d7,a6
		movem.l (sp)+,d7
		rts

	; End of function SwapA6


; =============== S U B R O U T I N E =======================================

sub_1014:
		bsr.w   DisableInterrupts
		lea     (byte_FFDB80).l,a4
loc_101E:
		movem.l d5-d6,-(sp)
		move.w  (word_FFDEA6).l,d5
		lsr.w   #8,d5
		move.w  (word_FFDEA6).l,d6
loc_1030:
		andi.w  #$FF,d6
		bsr.w   sub_F90
		movem.l (sp)+,d5-d6
loc_103C:
		movem.l d3-d4/a3-a6,-(sp)
		clr.l   d3
		move.w  a6,d3
		cmpi.w  #$E000,d3
		bcc.s   loc_104E
		addi.w  #$1000,d3
loc_104E:
		ori.l   #$FF0000,d3
		movea.l d3,a3
loc_1056:
		movea.l (dword_FFDED0).l,a5
		move.w  (word_FFDEA8).l,d3
		andi.l  #$FF,d3
		move.b  d3,(byte_FFDE95).l
		subq.w  #1,d3
loc_1070:
		movem.l a3,-(sp)
		move.w  (word_FFDEA8).l,d4
		andi.l  #$FF00,d4
		lsr.w   #8,d4
		subq.w  #1,d4
		move.w  d4,(a5)+
		move.w  a6,(a5)+
loc_1088:
		move.w  (a4),(a5)+
		move.w  (a4)+,(a3)+
		dbf     d4,loc_1088
		adda.w  #$80,a6 
		movem.l (sp)+,a3
		adda.w  #$80,a3 
		dbf     d3,loc_1070
		movem.l (sp)+,d3-d4/a3-a6
		bsr.w   EnableInterrupts
		bra.w   SetFFDE94b0andWait
loc_10AC:
		bsr.w   DisableInterrupts
loc_10B0:
		lea     (byte_FFDB80).l,a4
		movem.l d5-d6,-(sp)
		move.w  (word_FFDEA6).l,d5
		lsr.w   #8,d5
loc_10C2:
		move.w  (word_FFDEA6).l,d6
		andi.w  #$FF,d6
		bsr.w   sub_F90
		movem.l (sp)+,d5-d6
		bsr.w   SwapA6
		bra.w   loc_103C

	; End of function sub_1014


; =============== S U B R O U T I N E =======================================

; DMA
; a0 : RAM Source
; a1 : VRAM Destination
; d0 : length

DmaFromRamToVram:
		
		move    sr,-(sp)
		move    #$2700,sr
loc_10E2:
		move.w  #$100,(Z80BusReq).l
loc_10EA:
		btst    #0,(Z80BusReq).l
		bne.s   loc_10EA        ; wait for Z80 bus free
		movem.l d2,-(sp)
		movem.l d0/a6,-(sp)
loc_10FC:
		lea     (VDP_Control).l,a6
		cmpi.w  #2,d1
		beq.s   loc_1112
		move.l  d1,d2
		addi.w  #-$7100,d1
		move.w  d1,(a6)
		move.l  d2,d1
loc_1112:
		moveq   #$10,d2
		or.w    (VDP_REG01_STATUS).l,d2
		move.w  d2,(a6)
		clr.w   d2
		move.b  d0,d2
		lsr.w   #8,d0
		swap    d0
		move.w  d2,d0
loc_1126:
		ori.l   #$94009300,d0
		move.l  d0,(a6)
		move.l  #$96009500,d2
		move.l  a0,d0
		lsr.l   #1,d0
		move.b  d0,d2
		lsr.w   #8,d0
		swap    d2
		move.b  d0,d2
		swap    d2
		move.l  d2,(a6)
		swap    d0
		ori.w   #$9700,d0
		move.w  d0,(a6)
		move.w  a1,d0
		andi.w  #$3FFF,d0
		ori.w   #$4000,d0
		move.w  d0,(a6)
		move.w  a1,d0
		rol.w   #2,d0
loc_115C:
		andi.w  #3,d0
		ori.b   #$80,d0
		move.w  d0,(TEMP_DMA_VALUE).l
		move.w  (TEMP_DMA_VALUE).l,(a6)
		move.w  (VDP_REG01_STATUS).l,(a6)
loc_1176:
		move.w  #0,(Z80BusReq).l
		cmpi.w  #2,d1
		beq.s   loc_1188
		move.w  #$8F02,(a6)
loc_1188:
		movem.l (sp)+,d0/a6
		moveq   #0,d2
		move.w  d0,d2
		add.l   d2,d2
		adda.l  d2,a0
		adda.l  d2,a1
		movem.l (sp)+,d2
		move    (sp)+,sr
		rts

	; End of function DmaFromRamToVram


; =============== S U B R O U T I N E =======================================

; DMA stuff. d0 = DMA destination ?

sub_119E:
		move    sr,-(sp)
loc_11A0:
		move    #$2700,sr
		move.b  ((VINT_ENABLED-$1000000)).w,-(sp)
		sf      ((VINT_ENABLED-$1000000)).w
						; gives msb sign
		movem.l d2,-(sp)
		movem.l d0/a6,-(sp)
		movea.l (VDP_REG_COMMANDS).l,a6
		move.l  d1,d2
		addi.w  #-$7100,d1
		move.w  d1,(a6)+
		move.l  d2,d1
		clr.w   d2
		move.b  d0,d2
		lsr.w   #8,d0
		swap    d0
		move.w  d2,d0
		ori.l   #$94009300,d0
		move.l  d0,(a6)+
		move.l  #$96009500,d2
		move.l  a0,d0
		lsr.l   #1,d0
		move.b  d0,d2
		lsr.w   #8,d0
		swap    d2
		move.b  d0,d2
		swap    d2
		move.l  d2,(a6)+
		swap    d0
loc_11EE:
		ori.w   #$9700,d0
		move.w  d0,(a6)+
		move.w  a1,d0
		andi.w  #$3FFF,d0
		ori.w   #$4000,d0
		move.w  d0,(a6)+
		move.w  a1,d0
		rol.w   #2,d0
loc_1204:
		andi.w  #3,d0
		ori.b   #$80,d0
		move.w  d0,(a6)+
loc_120E:
		move.l  a6,(VDP_REG_COMMANDS).l
loc_1214:
		addq.b  #1,(byte_FFDE96).l
		movem.l (sp)+,d0/a6
		moveq   #0,d2
		move.w  d0,d2
		add.l   d2,d2
		adda.l  d2,a0
		adda.l  d2,a1
		movem.l (sp)+,d2
		move.b  (sp)+,((VINT_ENABLED-$1000000)).w
		move    (sp)+,sr
		rts

	; End of function sub_119E


; =============== S U B R O U T I N E =======================================

sub_1234:
		movem.w d7,-(sp)
		move.w  a6,d7
		andi.w  #$3FFF,d7
		ori.w   #$4000,d7
loc_1242:
		move.w  d7,(VDP_Control).l
		move.w  a6,d7
		lsr.w   #8,d7
		lsr.w   #6,d7
loc_124E:
		move.w  d7,(VDP_Control).l
loc_1254:
		movem.w (sp)+,d7
		rts

	; End of function sub_1234


; =============== S U B R O U T I N E =======================================

StoreVdpCommands:
		
		movem.l a6,-(sp)
loc_125E:
		movea.l (VDP_REG_COMMANDS).l,a6
		move.w  #$8F02,(a6)+    ; auto-increment : 2
		btst    #1,(byte_FFDEC1).l
		bne.s   loc_127C        
		move.w  #$9400,(a6)+    ; DMA length
		move.w  #$9302,(a6)+
		bra.s   loc_1284
loc_127C:
		move.w  #$9402,(a6)+    ; DMA length
		move.w  #$9300,(a6)+
loc_1284:
		move.w  #$96E8,(a6)+
		move.w  #$9580,(a6)+
		move.w  #$977F,(a6)+    ; RAM to VRAM, address : 0x3FE880
		move.w  #$6C00,(a6)+
loc_1294:
		move.w  #$83,(a6)+ ; Data Port stuff ?
		move.l  a6,(VDP_REG_COMMANDS).l
		addq.b  #1,(byte_FFDE96).l
		movem.l (sp)+,a6
		rts

	; End of function StoreVdpCommands


; =============== S U B R O U T I N E =======================================

ClearHscrollStuff:
		
		movem.l d7/a6,-(sp)
		lea     (word_FFD100).l,a6
loc_12B4:
		move.w  #$FF,d7
loc_12B8:
		move.w  d6,(a6)+
		addq.l  #2,a6
		dbf     d7,loc_12B8
		movem.l (sp)+,d7/a6
		bra.s   StoreVdpCommands

	; End of function ClearHscrollStuff


; =============== S U B R O U T I N E =======================================

ClearOtherHscrollStuff:
		
		movem.l d7/a6,-(sp)
		lea     (byte_FFD102).l,a6
		bra.s   loc_12B4

	; End of function ClearOtherHscrollStuff


; =============== S U B R O U T I N E =======================================

StoreVdpCommandsbis:
		
		movem.l a6,-(sp)
		movea.l (VDP_REG_COMMANDS).l,a6
		move.w  #$8F02,(a6)+    ; auto-inc : 2
		btst    #2,(byte_FFDEC1).l
		bne.s   loc_12F4        
		move.w  #$9400,(a6)+
		move.w  #$9304,(a6)+    ; DMA length
		bra.s   loc_12FC
loc_12F4:
		move.w  #$9400,(a6)+    ; DMA length
		move.w  #$9328,(a6)+
loc_12FC:
		move.w  #$96EA,(a6)+
		move.w  #$9580,(a6)+
		move.w  #$977F,(a6)+    ; RAM to VRAM, address 0x3FEA80
		move.w  #$4000,(a6)+
		move.w  #$90,(a6)+ ; Data port stuff ?
		move.l  a6,(VDP_REG_COMMANDS).l
		addq.b  #1,(byte_FFDE96).l
		movem.l (sp)+,a6
		rts

	; End of function StoreVdpCommandsbis


; =============== S U B R O U T I N E =======================================

ClearVscrollStuff:
		
		movem.l d7/a6,-(sp)
		lea     (word_FFD500).l,a6
loc_132C:
		move.w  #$13,d7
loc_1330:
		move.w  d6,(a6)+
		addq.l  #2,a6
		dbf     d7,loc_1330
		movem.l (sp)+,d7/a6
		bra.s   StoreVdpCommandsbis

	; End of function ClearVscrollStuff


; =============== S U B R O U T I N E =======================================

ClearOtherVscrollStuff:
		
		movem.l d7/a6,-(sp)
		lea     (byte_FFD502).l,a6
		bra.s   loc_132C

	; End of function ClearOtherVscrollStuff


; =============== S U B R O U T I N E =======================================

sub_134A:
		movem.w d1,-(sp)
		bsr.s   PrepareSomethingForDMA
		bsr.w   DmaFromRamToVram
		movem.w (sp)+,d1
		rts

	; End of function sub_134A


; =============== S U B R O U T I N E =======================================

PrepareSomethingForDMA:
		
		movem.l d0-d1/a1,-(sp)
		bsr.w   rts1
		lea     (FF8804_LOADING_SPACE).l,a0
		movem.l (sp)+,d0-d1/a1
		move.w  #2,d1
		rts

	; End of function PrepareSomethingForDMA


; =============== S U B R O U T I N E =======================================

; DMA preparation stuff

sub_1372:
		movem.w d1,-(sp)
		bsr.s   PrepareSomethingForDMA
		bsr.w   sub_119E        
		movem.w (sp)+,d1
		rts

	; End of function sub_1372


; =============== S U B R O U T I N E =======================================

DmaTilesViaFF8804:
		
		movem.w d1,-(sp)
		bsr.s   LoadTilesAtFF8804
		bsr.w   DmaFromRamToVram
		movem.w (sp)+,d1
		rts

	; End of function DmaTilesViaFF8804


; =============== S U B R O U T I N E =======================================

LoadTilesAtFF8804:
		
		movem.l d0-d1/a1,-(sp)
		lea     (FF8804_LOADING_SPACE).l,a1
		bsr.w   LoadCompressedData
		lea     (FF8804_LOADING_SPACE).l,a0
		movem.l (sp)+,d0-d1/a1
		move.w  #2,d1
		rts

	; End of function LoadTilesAtFF8804


; =============== S U B R O U T I N E =======================================

DmaTilesViaFF8804bis:
		
		movem.w d1,-(sp)
		bsr.s   LoadTilesAtFF8804
		bsr.w   sub_119E        
		movem.w (sp)+,d1
		rts

	; End of function DmaTilesViaFF8804bis


; =============== S U B R O U T I N E =======================================

; DMA stuff

sub_13C0:
		movem.l d0-d1/a0-a1,-(sp)
		lea     ((byte_FFC000-$1000000)).w,a0
		lea     ($C000).l,a1
		move.w  #$800,d0
		move.w  #2,d1
		bsr.w   sub_119E        
		bsr.w   Set_FFDE94_bit3 
		movem.l (sp)+,d0-d1/a0-a1
		rts

	; End of function sub_13C0


; =============== S U B R O U T I N E =======================================

; DMA stuff

sub_13E4:
		movem.l d0-d1/a0-a1,-(sp)
		lea     ((byte_FFC000-$1000000)).w,a0
		lea     ($E000).l,a1
		move.w  #$400,d0
		move.w  #2,d1
		bsr.w   sub_119E        
		bsr.w   Set_FFDE94_bit3 
		movem.l (sp)+,d0-d1/a0-a1
		rts

	; End of function sub_13E4


; =============== S U B R O U T I N E =======================================

DMAandWait:
		bsr.s   sub_13C0        
		bra.w   WaitForVInt     

	; End of function DMAandWait


; =============== S U B R O U T I N E =======================================

; d0:DMA destination - d1:DMA length - d2:sent to VDP Data

DmaVramFill:
		movem.l d0-d3,-(sp)
		move.w  (VDP_REG01_STATUS).l,d3; get last 16+ vdp reg config command ?
		ori.b   #$10,d3         ; make sure it concerns a 16+ vdp reg
		move.w  d3,(VDP_Control).l; send command again
		move.w  #$8F01,(VDP_Control).l; set auto increment bias number to 1
		movem.l d1,-(sp)
		andi.w  #$FF,d1
		ori.w   #$9300,d1
		move.w  d1,(VDP_Control).l; DMA length counter low : 0
		movem.l (sp)+,d1
		lsr.w   #8,d1
		ori.w   #$9400,d1       ; DMA length counter high : 1
		move.w  d1,(VDP_Control).l
		move.w  #$9780,(VDP_Control).l; VRAM fill
		movem.l d0,-(sp)
		andi.w  #$3FFF,d0       ; d0 : destination address
		ori.w   #$4000,d0
		move.w  d0,(VDP_Control).l
		movem.l (sp)+,d0
		rol.w   #2,d0
		andi.w  #3,d0
		ori.w   #$80,d0 ; errr .. CD5 set to 1 ? doesn't correspond to any access mode
		move.w  d0,(VDP_Control).l; destination address, second word
		move.w  d2,(VDP_Data).l ; writes 0 everytime
loc_1480:
		move.w  (VDP_Control).l,d0
		andi.w  #2,d0           ; wait for DMA free
		bne.s   loc_1480
		move.w  (VDP_REG01_STATUS).l,d3; get last vdp 16+ reg config command and send it
		move.w  d3,(VDP_Control).l
		move.w  #$8F02,(VDP_Control).l; auto increment bias number : 2
		movem.l (sp)+,d0-d3
		rts

	; End of function DmaVramFill

