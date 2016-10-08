
; GAME SECTION 01 :
; Technical Layer, Low Level Game Engine, Map/Exploration Engine, Entity Script Commands, Witch Functions

; FREE SPACE : 90 bytes.


InitStack:          dc.l InitStack          ; Initial Stack
p_Start:            dc.l Start              ; Start Address
										dc.l Int_OtherError     ; Bus Error
										dc.l Int_AdressError    ; Address Error
										dc.l Int_IllegalInstruction
																						; Illegal instruction
										dc.l Int_ZeroDivide     ; Zero Divide
										dc.l Int_OtherError     ; CHK instruction
off_1C:             dc.l Int_OtherError     ; TRAPV instruction
										dc.l Int_OtherError     ; Privilege Violation
										dc.l Int_OtherError     ; Trace
										dc.l Int_OtherError     ; Line 1010 Emulator
										dc.l Int_OtherError     ; Line 1111 Emulator
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Unitialized Interrrupt
off_40:             dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
off_4C:             dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
off_5C:             dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Spurious Interrupt
										dc.l Int_ExternalInterrupt
																						; Level 1 interrupt
										dc.l Int_ExternalInterrupt
																						; Level 2/External  interrupt
										dc.l Int_ExternalInterrupt
																						; Level 3 interrupt
										dc.l HInt               ; Level 4/Horizontal interrupt
										dc.l Int_ExternalInterrupt
																						; Level 5 interrupt
										dc.l VInt               ; Level 6/Vertical interrupt
										dc.l IntLvl7            ; Level 7 interrupt
										dc.l Trap0_SoundCommand 
										dc.l Trap1_CheckFlag
										dc.l Trap2_SetFlag
										dc.l Trap3_ClearFlag
										dc.l Trap4_CheckFlag
off_94:             dc.l Trap5_TextBox
										dc.l Trap6_TriggerAndExecuteMapScript
										dc.l Int_ExternalInterrupt
																						; Trap
										dc.l Int_ExternalInterrupt
																						; Trap
										dc.l Trap9_ManageContextualFunctions
																						; Trap
										dc.l Int_ExternalInterrupt
																						; Trap
										dc.l Int_ExternalInterrupt
																						; Trap
										dc.l Int_ExternalInterrupt
																						; Trap
										dc.l Int_ExternalInterrupt
																						; Trap
										dc.l Int_ExternalInterrupt
																						; Trap
										dc.l Int_ExternalInterrupt
																						; Trap
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
										dc.l Int_OtherError     ; Reserved
off_FC:             dc.l Int_OtherError     ; Reserved
aSegaGenesis:       dc.b 'SEGA GENESIS    '
aCSega1994_jul:     dc.b '(C)SEGA 1994.JUL'
aShiningForce2:     dc.b 'SHINING FORCE 2 '
										dc.b '                '
										dc.b '                '
aShiningForce_0:    dc.b 'SHINING FORCE 2 '
										dc.b '                '
										dc.b '                '
aGmMk13150:         dc.b 'GM MK-1315 -0'    ; Serial Number
										dc.b $30
										dc.w $8921              ; checksum
aJ:                 dc.b 'J               '
										dc.l 0                  ; Rom Start Adress
RomEndAddress:      dc.l $1FFFFF            ; Rom End Adress
										dc.l $FF0000            ; Ram Start Adress
										dc.l $FFFFFF            ; Ram End Adress
										dc.l $5241F820          ; SRam data
										dc.l SRAM_START         ; Sram Start Address
										dc.l SAVE2_CHARACTER_DATA+$1FC4
																						; Sram End Address
										dc.b '            '     ; Modem data
										dc.b '                    '
																						; Memo
										dc.b '                    '
aU:                 dc.b 'U               ' ; Countries codes

; =============== S U B R O U T I N E =======================================

SystemInit:
										
										bsr.s   VDP_init
										bsr.w   InitZ80
										bsr.s   InitRamVdpData
										jmp     (GameInit).l

	; End of function SystemInit


; =============== S U B R O U T I N E =======================================

VDP_init:
										move.w  #$3FFE,d0
										lea     (RAM_START).l,a0
loc_218:
										clr.l   (a0)+           ; clear all RAM !
										dbf     d0,loc_218      
										move.b  #3,((FADING_COUNTER_MAX-$1000000)).w
										clr.b   ((FADING_SETTING-$1000000)).w
										lea     vdp_init_params(pc), a0
										moveq   #$12,d1         ; loop 18 times
loc_22E:
										move.w  (a0)+,d0
										bsr.w   SetVdpReg       
										dbf     d1,loc_22E
										clr.w   d0
										clr.w   d1
										clr.w   d2
										bsr.w   DmaVramFill     
										rts

	; End of function VDP_init


; =============== S U B R O U T I N E =======================================

InitRamVdpData:
										
										move.l  #byte_FFD780,(dword_FFDED0).l
										move.l  #byte_FFD550,(VDP_REG_COMMANDS).l
										moveq   #$40,d0 ; PD2 output mode ?
										move.b  d0,(CTRL1_BIS).l
										move.b  d0,(CTRL2).l
										move.b  d0,(CTRL3_BIS).l
										lea     (dword_FFD100).l,a0
										move.w  #$FF,d0
loc_276:
										move.w  #0,(a0)+        ; clear from FFD100 to FFD500
										move.w  #0,(a0)+
										dbf     d0,loc_276      
										lea     (word_FFD500).l,a0
										move.w  #$13,d0
loc_28C:
										move.w  #0,(a0)+        ; clear next 80d bytes
										move.w  #0,(a0)+
										dbf     d0,loc_28C      
										lea     (PALETTE_1_BIS).l,a0
										moveq   #$7F,d1 
loc_2A0:
										clr.w   (a0)+           ; clear palette replicas ?
										dbf     d1,loc_2A0      
										bsr.w   ClearSpriteTable
										bsr.w   StoreVdpCommands
										bsr.w   StoreVdpCommandsbis
										bsr.w   Set_FFDE94_bit3 
										rts

	; End of function InitRamVdpData

vdp_init_params:    dc.w $8004              ; disable H int, enable read H V counter
										dc.w $8124              ; disable display, enable Vint, disable DMA, V28 cell mode
										dc.w $8230              ; scroll A table VRAM address : C000
										dc.w $8338              ; window table VRAM address : E000 ?
										dc.w $8407              ; scroll B table VRAM address : E000
										dc.w $8574              ; sprite attribute table VRAM address : E800
										dc.w $8600              ; always 0
										dc.w $8700              ; background color : plt 0, clr 0
										dc.w $8800              ; always 0
										dc.w $8900              ; always 0
										dc.w $8A00              ; Hint timing : 0
										dc.w $8B00              ; disable external interrupt, full scrolls
										dc.w $8C81              ; H40 cell mode, no interlace
										dc.w $8D3B              ; H Scroll table VRAM address : EC00
										dc.w $8E00              ; always 0
										dc.w $8F02              ; auto increment bias number : 2
										dc.w $9000              ; scroll size : V32 cell, H32 cell
										dc.w $9194              ; window is 20 cells from right
										dc.w $929C              ; window is 28 cells from bottom

; =============== S U B R O U T I N E =======================================

Start:
										tst.l   (CTRL1).l
										bne.s   loc_2EC
										tst.w   (CTRL3).l
loc_2EC:
										bne.s   loc_36A
										lea     StartParams(pc), a5
										movem.w (a5)+,d5-d7     ; copy parameters
										movem.l (a5)+,a0-a4     ; copy adresses
										move.b  -$10FF(a1),d0   ; get HW Info at 0xA10001
										andi.b  #$F,d0
										beq.s   loc_30C         
										move.l  #'SEGA',$2F00(a1)
loc_30C:
										move.w  (a4),d0         ; just read vdp control, why ?
										moveq   #0,d0
										movea.l d0,a6
										move.l  a6,usp          ; reset user stack pointer ?
										moveq   #$17,d1         ; loop for each of the 24 vdp registers
loc_316:
										move.b  (a5)+,d5        ; set each vdp register with initial parameters
										move.w  d5,(a4)
										add.w   d7,d5
										dbf     d1,loc_316      
										move.l  (a5)+,(a4)
										move.w  d0,(a3)         ; move 0 to vdp data port
										move.w  d7,(a1)         ; Z80 busreq cancel ?
										move.w  d7,(a2)         ; Z80 bus reset request ?
loc_328:
										btst    d0,(a1)
										bne.s   loc_328         ; wait for availability
										moveq   #$25,d2 ; loop 37 times
loc_32E:
										move.b  (a5)+,(a0)+     ; copy 37 bytes to Z80 ram
										dbf     d2,loc_32E      
										move.w  d0,(a2)         ; Z80 reset request ?
										move.w  d0,(a1)         ; Z80 busreq cancel ?
										move.w  d7,(a2)         ; Z80 reset cancel ?
loc_33A:
										move.l  d0,-(a6)        ; clear RAM
										dbf     d6,loc_33A      
										move.l  (a5)+,(a4)      ; disable DMA, increment data bias number : 2
										move.l  (a5)+,(a4)      ; address set : CRAM write ?
										moveq   #$1F,d3         ; loop 31 times
loc_346:
										move.l  d0,(a3)         ; clear CRAM ?
										dbf     d3,loc_346      
										move.l  (a5)+,(a4)      ; VSRAM write
										moveq   #$13,d4         ; loop 19 times
loc_350:
										move.l  d0,(a3)         ; clear VSRAM
										dbf     d4,loc_350      
										moveq   #3,d5           ; loop 3 times
loc_358:
										move.b  (a5)+,$11(a3)   ; set PSG volume to 0
										dbf     d5,loc_358      
										move.w  d0,(a2)         ; bus reset cancel ?
										movem.l (a6),d0-a6      ; clear registers
										move    #$2700,sr       ; Move 0x2700 into Status Register, which now has these set: no trace, A7 is Interupt Stack Pointer, no interrupts, clear condition code bits
loc_36A:
										bra.s   loc_3D8
StartParams:
										
										dc.w $8000              ; vdp register set base word
										dc.w $3FFF
										dc.w $100               ; vdp register set word to add for next register
										dc.l Z80_Memory
										dc.l Z80BusReq          ; Z80 bus request
										dc.l Z80BusReset        ; Z80 bus reset
										dc.l VDP_Data           ; vdp data port
										dc.l VDP_Control        ; vdp control port
										dc.b 4                  ; vdp reg 00 : disable H interupt, enable read H V counter
										dc.b $14                ; vdp reg 01 : disable display, disable Vint, enable DMA, V28 cell mode
										dc.b $30                ; vdp reg 02 : scroll A table vram address : C000
										dc.b $3C                ; vdp reg 03 : window table vram address : F000 ?
										dc.b 7                  ; vdp reg 04 : scroll B table vram address : E000
										dc.b $6C                ; vdp reg 05 : sprite attribute table vram address : D800
										dc.b 0                  ; vdp reg 06 : always 0
										dc.b 0                  ; vdp reg 07 : background color : plt 0 color 0
										dc.b 0                  ; vdp reg 08 : always 0
										dc.b 0                  ; vdp reg 09 : always 0
										dc.b $FF                ; vdp reg 10 : Hint timing value
										dc.b 0                  ; vdp reg 11 : disable external interrupt, full V/H scrolls
										dc.b $81                ; vdp reg 12 : H40 cell mode, disable shadow/highlight, no interlace
										dc.b $37                ; vdp reg 13 : H Scroll table vram address : FC00
										dc.b 0                  ; vdp reg 14 : always 0
										dc.b 1                  ; vdp reg 15 : auto-increment bias number : 1
										dc.b 1                  ; vdp reg 16 : scroll size : V32 cell, H64 cell
										dc.b 0                  ; vdp reg 17 : window H position : from left side
										dc.b 0                  ; vdp reg 18 : window V position : from upper side
										dc.b $FF                ; vdp reg 19 : DMA length counter low
										dc.b $FF                ; vdp reg 20 : DMA length counter high
										dc.b 0                  ; vdp reg 21 : DMA source address low
										dc.b 0                  ; vdp reg 22 : DMA source address mid
										dc.b $80                ; vdp reg 23 : DMA source address high, VRAM fill
										dc.l $40000080          ; wtf
										dc.b $AF                ; Z80 start code ... what's the use O_o ?
										dc.b 1
										dc.b $D9
										dc.b $1F
										dc.b $11
										dc.b $27
										dc.b 0
										dc.b $21
										dc.b $26
										dc.b 0
										dc.b $F9
										dc.b $77
										dc.b $ED
										dc.b $B0
										dc.b $DD
										dc.b $E1
										dc.b $FD
										dc.b $E1
										dc.b $ED
										dc.b $47
										dc.b $ED
										dc.b $4F
										dc.b $D1
										dc.b $E1
										dc.b $F1
										dc.b 8
										dc.b $D9
										dc.b $C1
										dc.b $D1
										dc.b $E1
										dc.b $F1
										dc.b $F9
										dc.b $F3
										dc.b $ED
										dc.b $56
										dc.b $36
										dc.b $E9
										dc.b $E9                ; Z80 start code end
										dc.l $81048F02          ; disable DMA, increment data bias number : 2
										dc.l $C0000000          ; CRAM write
										dc.l $40000010          ; VSRAM write
										dc.b $9F                ; PSG bytes
										dc.b $BF
										dc.b $DF
										dc.b $FF                ; end of PSG bytes
loc_3D8:
										tst.w   (VDP_Control).l
loc_3DE:
										move.w  (VDP_Control).l,d0
										andi.w  #2,d0           ; wait for free DMA
										bne.s   loc_3DE
										bra.w   SystemInit

	; End of function Start

										dc.b $F3                ; some unused Z80 code, strange !
										dc.b $31                ; loc_0:         di
										dc.b $F0                ;                ld      sp, 1FF0h
										dc.b $1F                ;                jp      loc_0
										dc.b $C3
										dc.b 0
										dc.b 0
										dc.b 0

; =============== S U B R O U T I N E =======================================

InitZ80:
										movem.l d0-a1,-(sp)
										move.w  #$100,(Z80BusReq).l
										move.w  #$100,(Z80BusReset).l
										lea     (Z80_Memory).l,a0
										move.w  #$1F80,d7
										lea     (SoundDriver).l,a1
loc_41A:
										move.b  (a1)+,d0
										bsr.w   CopyByteToZ80
										dbf     d7,loc_41A
										move.w  #0,(Z80BusReset).l
										moveq   #$10,d7
loc_42E:
										dbf     d7,loc_42E
										move.w  #$100,(Z80BusReset).l
										move.w  #0,(Z80BusReq).l
										lea     ((MUSIC_STACK_LENGTH-$1000000)).w,a0
										movem.l (sp)+,d0-a1
										rts

	; End of function InitZ80


; =============== S U B R O U T I N E =======================================

CopyWordToZ80:
										
										bsr.w   CopyByteToZ80
										lsr.w   #8,d0

	; End of function CopyWordToZ80


; =============== S U B R O U T I N E =======================================

CopyByteToZ80:
										
										move.b  d0,(a0)
										cmp.b   (a0),d0
										bne.s   CopyByteToZ80
										addq.l  #1,a0
										rts

	; End of function CopyByteToZ80


; =============== S U B R O U T I N E =======================================

; if xxxx = $FFFF, then get d0.w

Trap0_SoundCommand:
										
										movem.l d0-d1/a0,-(sp)
										movea.l $E(sp),a0
										move.w  (a0),d1         ; get interrupt param
loc_466:
										addq.l  #2,$E(sp)
										cmpi.w  #$FFFF,d1
										bne.s   loc_472
										move.w  d0,d1           ; if param = FFFF, then get param from d0
loc_472:
										tst.b   ((DONT_SEND_SOUND_COMMANDS-$1000000)).w
										bne.s   loc_48A
										lea     (SOUND_COMMAND_QUEUE).l,a0
										moveq   #3,d0
loc_480:
										tst.w   (a0)+
										dbeq    d0,loc_480
										move.w  d1,-2(a0)       ; add new sound command to send
loc_48A:
										movem.l (sp)+,d0-d1/a0
										rte

	; End of function Trap0_SoundCommand


; =============== S U B R O U T I N E =======================================

Int_AdressError:
										
										move.l  #'ADDR',(ERRCODE_BYTE0).l
										move.l  $A(sp),(ERRCODE_BYTE4).l
										bsr.w   SaveErrorCode
										bra.w   Int_ExternalInterrupt

	; End of function Int_AdressError


; =============== S U B R O U T I N E =======================================

Int_IllegalInstruction:
										
										move.l  #'BAD ',(ERRCODE_BYTE0).l
										move.l  2(sp),(ERRCODE_BYTE4).l
										bsr.w   SaveErrorCode
										bra.w   Int_ExternalInterrupt

	; End of function Int_IllegalInstruction


; =============== S U B R O U T I N E =======================================

Int_ZeroDivide:
										
										move.l  #'ZERO',(ERRCODE_BYTE0).l
loc_4CE:
										move.l  2(sp),(ERRCODE_BYTE4).l
										bsr.w   SaveErrorCode
										bra.w   Int_ExternalInterrupt

	; End of function Int_ZeroDivide


; =============== S U B R O U T I N E =======================================

Int_OtherError:
										
										move.l  #'OTHR',(ERRCODE_BYTE0).l
										move.l  2(sp),(ERRCODE_BYTE4).l
										bsr.w   SaveErrorCode
										bra.w   Int_ExternalInterrupt

	; End of function Int_OtherError


; =============== S U B R O U T I N E =======================================

SaveErrorCode:
										
										move.b  (ERRCODE_BYTE0).l,(SAVED_ERRCODE_BYTE0).l
										move.b  (ERRCODE_BYTE1).l,(SAVED_ERRCODE_BYTE1).l
										move.b  (ERRCODE_BYTE2).l,(SAVED_ERRCODE_BYTE2).l
										move.b  (ERRCODE_BYTE3).l,(SAVED_ERRCODE_BYTE3).l
										move.b  (ERRCODE_BYTE4).l,(SAVED_ERRCODE_BYTE4).l
										move.b  (ERRCODE_BYTE5).l,(SAVED_ERRCODE_BYTE5).l
										move.b  (ERRCODE_BYTE6).l,(SAVED_ERRCODE_BYTE6).l
										move.b  ($FFFFFF).l,(SAVED_ERRCODE_BYTE7).l

	; End of function SaveErrorCode


; START OF FUNCTION CHUNK FOR Int_AdressError

Int_ExternalInterrupt:
										
										move    #$2700,sr
										nop
										nop
										bra.s   Int_ExternalInterrupt

; END OF FUNCTION CHUNK FOR Int_AdressError


; =============== S U B R O U T I N E =======================================

IntLvl7:
										nop
										bra.s   IntLvl7

	; End of function IntLvl7


; =============== S U B R O U T I N E =======================================

Trap5_TextBox:
										
										movem.l d0-a6,-(sp)
										movea.l $3E(sp),a6
										addq.l  #2,$3E(sp)
										move.w  (a6)+,d0
										cmpi.w  #$FFFF,d0
										bne.s   loc_570
										bsr.w   HideTextBox     
										bra.s   loc_574
loc_570:
										bsr.w   DisplayText     
loc_574:
										movem.l (sp)+,d0-a6
										rte

	; End of function Trap5_TextBox


; =============== S U B R O U T I N E =======================================

; execute map script at a0

Trap6_TriggerAndExecuteMapScript:
										
										movem.l d0-a6,-(sp)
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l VInt_UpdateEntities
										jsr     j_ExecuteMapScript
										movem.l (sp)+,d0-a6
										rte

	; End of function Trap6_TriggerAndExecuteMapScript


; =============== S U B R O U T I N E =======================================

HInt:
										rte

	; End of function HInt


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
										movea.l (SECONDS_COUNTER_0).l,sp
																						; if Start Pushed during Intro, go back to Main
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

rjt_Trap9ActionsOfs:dc.w Trap9_ClearPointers-rjt_Trap9ActionsOfs
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

FadingData:         incbin "graphics/technical/fadingdata.bin"
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
										
										move.b  #IN_FROM_BLACK,((FADING_SETTING-$1000000)).w
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
										move.w  #$8F01,(VDP_Control).l
																						; auto increment : 1
										move.w  #$9300,(VDP_Control).l
																						; DMA length
										move.w  #$9401,(VDP_Control).l
										move.w  #$9780,(VDP_Control).l
																						; VRAM fill
										move.w  #$C000,(VDP_Control).l
										move.w  #$80,(VDP_Control).l 
																						; address set ?
										move.w  #0,(VDP_Data).l
loc_EC8:
										move.w  (VDP_Control).l,d0
										andi.w  #2,d0           ; wait for DMA free
										bne.s   loc_EC8
										move.w  (VDP_REG01_STATUS).l,d3
										move.w  d3,(VDP_Control).l
										move.w  #$8F02,(VDP_Control).l
																						; auto increment : 2
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
										move.w  (dword_FFD100+2).l,d7
										addq.w  #4,d7
										lsr.w   #2,d7
										sub.w   d7,d5
										andi.w  #$7E,d5 
										lsl.w   #7,d6
										move.w  (word_FFD502).l,d7
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
										move.w  (dword_FFD100).l,d7
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

; DMA stuff

sub_10DC:
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

	; End of function sub_10DC


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
										lea     (dword_FFD100).l,a6
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
										lea     ((dword_FFD100+2)).l,a6
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
										lea     (word_FFD502).l,a6
										bra.s   loc_132C

	; End of function ClearOtherVscrollStuff


; =============== S U B R O U T I N E =======================================

sub_134A:
										movem.w d1,-(sp)
										bsr.s   PrepareSomethingForDMA
										bsr.w   sub_10DC        
										movem.w (sp)+,d1
										rts

	; End of function sub_134A


; =============== S U B R O U T I N E =======================================

PrepareSomethingForDMA:
										
										movem.l d0-d1/a1,-(sp)
										bsr.w   rts1
										lea     (DMA_SPACE_FF8804).l,a0
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
										bsr.w   sub_10DC        
										movem.w (sp)+,d1
										rts

	; End of function DmaTilesViaFF8804


; =============== S U B R O U T I N E =======================================

LoadTilesAtFF8804:
										
										movem.l d0-d1/a1,-(sp)
										lea     (DMA_SPACE_FF8804).l,a1
										bsr.w   LoadTileData    
										lea     (DMA_SPACE_FF8804).l,a0
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
										move.w  (VDP_REG01_STATUS).l,d3
																						; get last 16+ vdp reg config command ?
										ori.b   #$10,d3         ; make sure it concerns a 16+ vdp reg
										move.w  d3,(VDP_Control).l
																						; send command again
										move.w  #$8F01,(VDP_Control).l
																						; set auto increment bias number to 1
										movem.l d1,-(sp)
										andi.w  #$FF,d1
										ori.w   #$9300,d1
										move.w  d1,(VDP_Control).l
																						; DMA length counter low : 0
										movem.l (sp)+,d1
										lsr.w   #8,d1
										ori.w   #$9400,d1       ; DMA length counter high : 1
										move.w  d1,(VDP_Control).l
										move.w  #$9780,(VDP_Control).l
																						; VRAM fill
										movem.l d0,-(sp)
										andi.w  #$3FFF,d0       ; d0 : destination address
										ori.w   #$4000,d0
										move.w  d0,(VDP_Control).l
										movem.l (sp)+,d0
										rol.w   #2,d0
										andi.w  #3,d0
										ori.w   #$80,d0 ; errr .. CD5 set to 1 ? doesn't correspond to any access mode
										move.w  d0,(VDP_Control).l
																						; destination address, second word
										move.w  d2,(VDP_Data).l ; writes 0 everytime
loc_1480:
										move.w  (VDP_Control).l,d0
										andi.w  #2,d0           ; wait for DMA free
										bne.s   loc_1480
										move.w  (VDP_REG01_STATUS).l,d3
																						; get last vdp 16+ reg config command and send it
										move.w  d3,(VDP_Control).l
										move.w  #$8F02,(VDP_Control).l
																						; auto increment bias number : 2
										movem.l (sp)+,d0-d3
										rts

	; End of function DmaVramFill


; =============== S U B R O U T I N E =======================================

; write D0 into RAM:de80 to D7 places

WriteAsciiNumber:
										
										movem.l d5-d7/a5-a6,-(sp)
										lea     PowersOfTen(pc), a5
										lea     ((byte_FFDE80-$1000000)).w,a6
										moveq   #9,d5
loc_14B4:
										move.w  #$2F,d6 
loc_14B8:
										addq.w  #1,d6
										sub.l   (a5),d0
										bcc.s   loc_14B8
										move.b  d6,(a6)+
										add.l   (a5)+,d0
										dbf     d5,loc_14B4
										lea     ((byte_FFDE80-$1000000)).w,a6
										moveq   #8,d6
loc_14CC:
										cmpi.b  #$30,(a6) 
										bne.w   loc_14DC
										move.b  #$20,(a6)+ 
										dbf     d6,loc_14CC
loc_14DC:
										movem.l (sp)+,d5-d7/a5-a6
										rts

	; End of function WriteAsciiNumber

PowersOfTen:        dc.l 1000000000
										dc.l 100000000
										dc.l 10000000
										dc.l 1000000
										dc.l 100000
										dc.l 10000
dword_14FA:         dc.l 1000
										dc.l 100
										dc.l 10
										dc.l 1

; =============== S U B R O U T I N E =======================================

nullsub_3:
										
										rts

	; End of function nullsub_3


; =============== S U B R O U T I N E =======================================

nullsub_4:
										
										rts

	; End of function nullsub_4


; =============== S U B R O U T I N E =======================================

; converts data ports 1/2 information into P1/2 inputs State A/B

UpdatePlayerInputs:
										
										lea     ((P1_INPUT-$1000000)).w,a5
										lea     (DATA1).l,a6    
										bsr.s   loc_151C        ; do it with DATA1 and then DATA2
										addq.w  #2,a6
loc_151C:
										move.b  #0,(a6)
										nop
										nop
										move.b  (a6),d6
										move.b  #$40,(a6) 
										lsl.b   #2,d6
										andi.b  #$C0,d6
										move.b  (a6),d7
										move.b  #0,(a6)
										andi.b  #$3F,d7 
										or.b    d7,d6
										move.b  (a6),d7
										move.b  #$40,(a6) 
										not.b   d6
										move.b  d6,(a5)+        ; state A
										move.b  (a6),d7
										move.b  #0,(a6)
										nop
										nop
										move.b  (a6),d6
										move.b  #$40,(a6) 
										lsl.b   #2,d6
										andi.b  #$C0,d6
										move.b  (a6),d7
										move.b  #0,(a6)
										andi.b  #$3F,d7 
										or.b    d7,d6
										move.b  (a6),d7
										move.b  #$40,(a6) 
										not.b   d6
										move.b  d6,(a5)+        ; state B
										move.b  (a6),d7
										rts

	; End of function UpdatePlayerInputs


; =============== S U B R O U T I N E =======================================

WaitForPlayerInput:
										
										andi.b  #$FF,((CURRENT_PLAYER_INPUT-$1000000)).w
										bne.s   return_1584
										bsr.w   WaitForVInt     
										bra.s   WaitForPlayerInput
return_1584:
										
										rts

	; End of function WaitForPlayerInput


; =============== S U B R O U T I N E =======================================

WaitForPlayer1NewButtonPush:
										
										andi.b  #$FF,((P1_INPUT-$1000000)).w
										beq.s   loc_1594
										bsr.w   WaitForVInt     
										bra.s   WaitForPlayer1NewButtonPush
loc_1594:
										andi.b  #$FF,((P1_INPUT-$1000000)).w
										bne.s   return_15A2
										bsr.w   WaitForVInt     
										bra.s   loc_1594
return_15A2:
										
										rts

	; End of function WaitForPlayer1NewButtonPush


; =============== S U B R O U T I N E =======================================

sub_15A4:
										movem.l d7,-(sp)
										move.b  ((P1_INPUT-$1000000)).w,d7
										and.b   ((byte_FFDE9E-$1000000)).w,d7
										beq.s   loc_15CA
loc_15B2:
										addq.b  #1,((byte_FFDE9F-$1000000)).w
										move.b  ((byte_FFDE9F-$1000000)).w,d7
										cmpi.b  #$A,d7
										bcc.s   loc_15CA
										clr.b   ((P1_INPUT-$1000000)).w
										movem.l (sp)+,d7
										rts
loc_15CA:
										clr.b   ((byte_FFDE9E-$1000000)).w
										clr.b   ((byte_FFDE9F-$1000000)).w
										movem.l (sp)+,d7
										rts

	; End of function sub_15A4


; =============== S U B R O U T I N E =======================================

WaitForInputFor1Second:
										
										movem.l d5,-(sp)
										moveq   #$3B,d5 
loc_15DE:
										andi.b  #$FF,((P1_INPUT-$1000000)).w
										bne.s   loc_15EE
										bsr.w   WaitForVInt     
										dbf     d5,loc_15DE
loc_15EE:
										movem.l (sp)+,d5
										rts

	; End of function WaitForInputFor1Second


; =============== S U B R O U T I N E =======================================

WaitForInputFor3Seconds:
										
										movem.l d5,-(sp)
										move.l  #$B3,d5 
										bra.s   loc_15DE

	; End of function WaitForInputFor3Seconds


; =============== S U B R O U T I N E =======================================

; randomize a few bits in D7 based on RAM:dea4

UpdateRandomSeed:
										
										move.w  (RANDOM_SEED).l,d7
										mulu.w  #$D,d7
										addi.w  #7,d7
										andi.l  #$FFFF,d7
										move.w  d7,(RANDOM_SEED).l
										move.w  d6,-(sp)
										add.w   d6,d6
										mulu.w  d6,d7
										swap    d7
										move.w  (sp)+,d6
										lsr.w   #1,d7
										rts

	; End of function UpdateRandomSeed


; =============== S U B R O U T I N E =======================================

WaitForRandomValueToMatch:
										
										movem.l d0-d5/a0-a6,-(sp)
										move.b  d6,d1
loc_162E:
										bsr.w   GetRandomValueUnsigned
										cmpi.b  #1,d1
										beq.s   loc_163A
										bpl.s   loc_163E
loc_163A:
										bra.w   loc_164A
loc_163E:
										cmp.b   d1,d7
										bcs.s   loc_1644
										bra.s   loc_162E
loc_1644:
										movem.l (sp)+,d0-d5/a0-a6
										rts
loc_164A:
										clr.b   d7
										movem.l (sp)+,d0-d5/a0-a6
										rts

	; End of function WaitForRandomValueToMatch


; =============== S U B R O U T I N E =======================================

GetRandomValueUnsigned:
										
										movem.l d0-d5/a0-a6,-(sp)
										lea     (RANDOM_WAITING_FOR_INPUT).l,a0
										clr.w   d7
										move.w  (a0),d7
										mulu.w  #$21D,d7
										addi.w  #$3039,d7
										move.w  d7,(a0)
										andi.w  #$FF,d7
										movem.l (sp)+,d0-d5/a0-a6
										rts

	; End of function GetRandomValueUnsigned


; =============== S U B R O U T I N E =======================================

; another random function taking debug mode into account

GetRandomOrDebugValue:
										
										movem.l d6-d7,-(sp)
										move.w  d0,d6
										tst.b   (DEBUG_MODE_ACTIVATED).l
										beq.s   loc_16B2
										moveq   #INPUT_A_UP_BIT,d0
										btst    #3,((P1_INPUT-$1000000)).w
										bne.w   loc_16B8
										moveq   #INPUT_A_DOWN_BIT,d0
										btst    #0,((P1_INPUT-$1000000)).w
										bne.w   loc_16B8
										moveq   #INPUT_A_LEFT_BIT,d0
										btst    #2,((P1_INPUT-$1000000)).w
										bne.w   loc_16B8
										moveq   #INPUT_A_RIGHT_BIT,d0
										btst    #1,((P1_INPUT-$1000000)).w
										bne.w   loc_16B8
loc_16B2:
										bsr.w   UpdateRandomSeed
										move.w  d7,d0
loc_16B8:
										movem.l (sp)+,d6-d7
										rts

	; End of function GetRandomOrDebugValue


; =============== S U B R O U T I N E =======================================

; d0 : music index, or previous music if value $FB

PlayMusicAfterCurrentOne:
										
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_WAIT_MUSIC_END
																						; Wait for current music to end
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_GET_D0_PARAMETER
																						; get d0 value, if $FB : play previous music
loc_16C6:
										moveq   #3,d0
										bsr.w   Sleep           
										tst.b   (WAIT_FOR_MUSIC_END).l
																						; wait for sound command sent
										bne.s   loc_16C6
										rts

	; End of function PlayMusicAfterCurrentOne


; =============== S U B R O U T I N E =======================================

;     Copy D7 bytes from A0 to A1.
;     In: A0 = src address
;         A1 = dest address
;         D7 = number of bytes to copy

CopyBytes:
										
										movem.l d7-a1,-(sp)
										cmpa.l  a0,a1
										bgt.w   loc_16EE
										subq.w  #1,d7
loc_16E2:
										move.b  (a0)+,(a1)+
										dbf     d7,loc_16E2
										movem.l (sp)+,d7-a1
										rts
loc_16EE:
										adda.w  d7,a0
										adda.w  d7,a1
										subq.w  #1,d7
loc_16F4:
										move.b  -(a0),-(a1)
										dbf     d7,loc_16F4
										movem.l (sp)+,d7-a1
										rts

	; End of function CopyBytes


; =============== S U B R O U T I N E =======================================

Trap4_CheckFlag:
										
										movem.l d1/a0,-(sp)
										movea.l $A(sp),a0
										move.w  (a0),d1
										addq.l  #2,$A(sp)
										jsr     j_CheckFlag
										movem.l (sp)+,d1/a0
										addq.l  #2,sp
										rts

	; End of function Trap4_CheckFlag


; =============== S U B R O U T I N E =======================================

Trap2_SetFlag:
										
										movem.l d1/a0,-(sp)
										movea.l $A(sp),a0
										move.w  (a0),d1
										addq.l  #2,$A(sp)
										jsr     j_SetFlag
										movem.l (sp)+,d1/a0
										addq.l  #2,sp
										rts

	; End of function Trap2_SetFlag


; =============== S U B R O U T I N E =======================================

Trap1_CheckFlag:
										
										movem.l d1/a0,-(sp)
										movea.l $A(sp),a0
										move.w  (a0),d1
										addq.l  #2,$A(sp)
										jsr     j_CheckFlag
										movem.l (sp)+,d1/a0
										addq.l  #2,sp
										rts

	; End of function Trap1_CheckFlag


; =============== S U B R O U T I N E =======================================

Trap3_ClearFlag:
										
										movem.l d1/a0,-(sp)
										movea.l $A(sp),a0
										move.w  (a0),d1
										addq.l  #2,$A(sp)
										jsr     j_ClearFlag
										movem.l (sp)+,d1/a0
										addq.l  #2,sp
										rts

	; End of function Trap3_ClearFlag


; =============== S U B R O U T I N E =======================================

; In: D0 = number of sprites
; 
; set default values in sprite table

InitSprites:
										
										movem.l d0-d1/a0,-(sp)
										lea     (SPRITE_Y).l,a0 
										move.w  #1,d1
loc_177E:
										move.w  #1,(a0)+
										move.w  d1,(a0)+
										move.w  #1,(a0)+
										move.w  #1,(a0)+
										addq.w  #1,d1
										dbf     d0,loc_177E
										subq.l  #6,a0
										clr.w   (a0)
										movem.l (sp)+,d0-d1/a0
										rts

	; End of function InitSprites


; =============== S U B R O U T I N E =======================================

; related to spell animations

sub_179C:
										movem.l d0/d2/a0,-(sp)
										andi.w  #$FF,d0
										move.w  d0,d2
										lsr.w   #6,d2
										lea     byte_183C(pc), a0
										move.b  (a0,d2.w),d2
										andi.w  #$3F,d0 
										add.w   d0,d0
										lea     word_1840(pc), a0
										move.w  d0,d1
										lsr.b   #1,d2
										bcc.s   loc_17C6
										subi.w  #$80,d1 
										neg.w   d1
loc_17C6:
										move.w  (a0,d1.w),d1
										lsr.b   #1,d2
										bcc.s   loc_17D0
										neg.w   d1
loc_17D0:
										swap    d1
										lsr.b   #1,d2
										bcc.s   loc_17DC
										subi.w  #$80,d0 
										neg.w   d0
loc_17DC:
										move.w  (a0,d0.w),d1
										lsr.b   #1,d2
										bcc.s   loc_17E6
										neg.w   d1
loc_17E6:
										movem.l (sp)+,d0/d2/a0
										rts

	; End of function sub_179C


; =============== S U B R O U T I N E =======================================

sub_17EC:
										movem.l d1/d3,-(sp)
										move.w  d1,d3
										lsr.w   #1,d3
										bsr.s   sub_179C        
										move.w  d1,d2
										muls.w  d3,d2
										asr.l   #8,d2
										asr.l   #7,d2
										swap    d1
										swap    d2
										muls.w  d3,d1
										asr.l   #8,d1
										asr.l   #7,d1
										move.w  d1,d2
										swap    d2
										movem.l (sp)+,d1/d3
										rts

	; End of function sub_17EC


; =============== S U B R O U T I N E =======================================

sub_1812:
										movem.l d1/d3,-(sp)
										move.l  d1,d3
										bsr.s   sub_179C        
										move.w  d1,d2
										lsr.w   #1,d3
										muls.w  d3,d2
										asr.l   #8,d2
										asr.l   #7,d2
										swap    d1
										swap    d2
										swap    d3
										lsr.w   #1,d3
										muls.w  d3,d1
										asr.l   #8,d1
										asr.l   #7,d1
										move.w  d1,d2
										swap    d2
										movem.l (sp)+,d1/d3
										rts

	; End of function sub_1812

byte_183C:          dc.b 6                  ; related to spell animations
										dc.b $B
										dc.b $C
										dc.b 1
word_1840:          dc.w 0
										dc.w 6
										dc.w $C
										dc.w $12
										dc.w $19
										dc.w $1F
										dc.w $25
										dc.w $2B
										dc.w $31
										dc.w $38
										dc.w $3E
										dc.w $44
										dc.w $4A
										dc.w $50
										dc.w $56
										dc.w $5C
										dc.w $61
										dc.w $67
										dc.w $6D
										dc.w $73
										dc.w $78
										dc.w $7E
										dc.w $83
										dc.w $88
										dc.w $8E
										dc.w $93
										dc.w $98
										dc.w $9D
										dc.w $A2
										dc.w $A7
										dc.w $AB
										dc.w $B0
										dc.w $B5
										dc.w $B9
										dc.w $BD
										dc.w $C1
										dc.w $C5
										dc.w $C9
										dc.w $CD
										dc.w $D1
										dc.w $D4
										dc.w $D8
										dc.w $DB
										dc.w $DE
										dc.w $E1
										dc.w $E4
										dc.w $E7
										dc.w $EA
										dc.w $EC
										dc.w $EE
										dc.w $F1
										dc.w $F3
										dc.w $F4
										dc.w $F6
										dc.w $F8
										dc.w $F9
										dc.w $FB
										dc.w $FC
										dc.w $FD
										dc.w $FE
										dc.w $FE
										dc.w $FF
										dc.w $FF
										dc.w $FF
										dc.w $100

; =============== S U B R O U T I N E =======================================

sub_18C2:
										movem.l d0-d2,-(sp)
										ext.l   d6
										move.w  d6,d0
										moveq   #$13,d2
										lsr.w   #1,d0
										move.w  d0,d7
loc_18D0:
										move.w  d7,d1
										mulu.w  d1,d1
										lsr.w   #1,d0
										cmp.l   d1,d6
										beq.w   loc_18E8
										blt.s   loc_18E2
										add.w   d0,d7
										bra.s   loc_18E4
loc_18E2:
										sub.w   d0,d7
loc_18E4:
										dbf     d2,loc_18D0
loc_18E8:
										movem.l (sp)+,d0-d2
										rts

	; End of function sub_18C2


; =============== S U B R O U T I N E =======================================

sub_18EE:
										movem.l d0-d2,-(sp)
										move.w  d6,d0
										move.w  d7,d1
										muls.w  d6,d6
										muls.w  d7,d7
										add.w   d7,d6
										bsr.s   sub_18C2
										move.w  d7,d6
										move.w  d1,d7
										bge.s   loc_1906
										neg.w   d7
loc_1906:
										lsl.w   #6,d7
										divs.w  d6,d7
										move.b  sub_1942(pc,d7.w),d7
										andi.w  #$FF,d7
										movem.l d0,-(sp)
										muls.w  d1,d0
										movem.l (sp)+,d0
										blt.s   loc_192E
										tst.w   d1
										bge.s   loc_1928
										addi.w  #$40,d7 
										bra.s   loc_192C
loc_1928:
										addi.w  #$C0,d7 
loc_192C:
										bra.s   loc_193C
loc_192E:
										subi.w  #$40,d7 
										neg.w   d7
										tst.w   d1
										bge.s   loc_193C
										addi.w  #$80,d7 
loc_193C:
										movem.l (sp)+,d0-d2
										rts

	; End of function sub_18EE


; =============== S U B R O U T I N E =======================================

; something with clearing/resetting sprite info when transitioning to battle scene?

sub_1942:
										movem.l d0-d2/d7-a1,-(sp)
										lea     (SPRITE_LINK).l,a1
										clr.w   d1
										moveq   #2,d0
										bsr.w   sub_196C
										bsr.w   sub_196C
										bsr.w   sub_198C
										clr.w   d2
										move.b  d2,(a1,d1.w)
										move.w  d2,d1
										lsl.w   #3,d1
										movem.l (sp)+,d0-d2/d7-a1
										rts

	; End of function sub_1942


; =============== S U B R O U T I N E =======================================

sub_196C:
										lea     (byte_FFAFA1).l,a0
										moveq   #$3E,d7 
										moveq   #1,d2
loc_1976:
										cmp.b   (a0)+,d0
										bne.s   loc_1982
										move.b  d2,(a1,d1.w)
										move.w  d2,d1
										lsl.w   #3,d1
loc_1982:
										addq.w  #1,d2
										dbf     d7,loc_1976
										subq.w  #1,d0
										rts

	; End of function sub_196C


; =============== S U B R O U T I N E =======================================

sub_198C:
										lea     (byte_FFAFA1).l,a0
										moveq   #$3E,d7 
										moveq   #1,d2
loc_1996:
										cmp.b   (a0)+,d0
										bne.s   loc_19A8
										move.b  d2,(a1,d1.w)
										move.w  d2,d1
										lsl.w   #3,d1
										bclr    #7,1(a1,d1.w)
loc_19A8:
										addq.w  #1,d2
										dbf     d7,loc_1996
										rts

	; End of function sub_198C


; =============== S U B R O U T I N E =======================================

sub_19B0:
										movem.l d0/a0,-(sp)
										moveq   #$3F,d0 
										lea     (byte_FFAFA0).l,a0
loc_19BC:
										clr.b   (a0)+
										dbf     d0,loc_19BC
										movem.l (sp)+,d0/a0
										rts

	; End of function sub_19B0


; =============== S U B R O U T I N E =======================================

; moves palettes, no idea why

sub_19C8:
										movem.l d7-a1,-(sp)
										lea     (PALETTE_1_BIS).l,a1
										move.w  #$80,d7 
										jsr     CopyBytes(pc)   
										lea     (PALETTE_1).l,a0
										lea     ((byte_FFDF2A-$1000000)).w,a1
										move.w  #$80,d7 
										jsr     CopyBytes(pc)   
										move.b  #$20,((byte_FFDFAA-$1000000)).w 
										movem.l (sp)+,d7-a1
										rts

	; End of function sub_19C8


; =============== S U B R O U T I N E =======================================

; related to palette updating

sub_19F8:
										clr.w   d6
										move.b  ((byte_FFDFAA-$1000000)).w,d6
										bne.s   loc_1A02
										rts
loc_1A02:
										lea     (PALETTE_1_BIS).l,a0
										lea     (PALETTE_1).l,a1
										lea     ((byte_FFDF2A-$1000000)).w,a2
										moveq   #$3F,d7 
										subq.w  #1,d6
										move.b  d6,((byte_FFDFAA-$1000000)).w
										lsr.w   #2,d6
loc_1A1C:
										clr.w   d0
										clr.w   d1
										move.b  (a2)+,d0
										move.b  (a2)+,d1
										move.w  d1,d2
										lsr.w   #4,d1
										andi.w  #$F,d2
										clr.w   d3
										clr.w   d4
										move.b  (a0)+,d3
										move.b  (a0)+,d4
										move.w  d4,d5
										lsr.w   #4,d4
										andi.w  #$F,d5
										move.w  d7,-(sp)
										moveq   #8,d7
										sub.w   d6,d7
										mulu.w  d6,d0
										mulu.w  d6,d1
										mulu.w  d6,d2
										mulu.w  d7,d3
										mulu.w  d7,d4
										mulu.w  d7,d5
										add.w   d3,d0
										add.w   d4,d1
										add.w   d5,d2
										lsr.w   #3,d0
										lsr.w   #3,d1
										lsr.w   #3,d2
										lsl.w   #4,d1
										or.w    d1,d2
										move.b  d0,(a1)+
										move.b  d2,(a1)+
										move.w  (sp)+,d7
										dbf     d7,loc_1A1C
										jsr     StoreVdpCommandster(pc)
										tst.b   ((byte_FFDFAA-$1000000)).w
										bne.s   return_1A7E
										lea     ((byte_FFDF2A-$1000000)).w,a0
										tst.b   ((byte_FFDFAB-$1000000)).w
										bne.w   sub_19C8        
return_1A7E:
										
										rts

	; End of function sub_19F8


; =============== S U B R O U T I N E =======================================

rts1:
										rts

	; End of function rts1


; =============== S U B R O U T I N E =======================================

nullsub_5:
										
										rts

	; End of function nullsub_5


; =============== S U B R O U T I N E =======================================

; Basic tile decompression
; 
;     In: A0 = address of compressed data
;         A1 = dest address in RAM
; 

LoadSpriteData:
										
										movem.l d1-d2/a0-a3,-(sp)
										movea.l a1,a3
										moveq   #$FFFFFFFF,d0
										add.w   d0,d0
										bra.s   loc_1A92
loc_1A90:
										move.w  (a0)+,(a1)+
loc_1A92:
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcs.w   loc_1B2A
										add.w   d0,d0
										bcs.w   loc_1B10
										move.l  (a0)+,(a1)+
loc_1AA2:
										add.w   d0,d0
										bcs.w   loc_1B26
										add.w   d0,d0
										bcs.w   loc_1B10
										move.l  (a0)+,(a1)+
										add.w   d0,d0
										bcs.w   loc_1B26
										add.w   d0,d0
										bcs.w   loc_1B10
										move.l  (a0)+,(a1)+
										add.w   d0,d0
loc_1AC0:
										bcs.w   loc_1B26
										add.w   d0,d0
										bcs.w   loc_1B10
										move.l  (a0)+,(a1)+
										add.w   d0,d0
										bcs.w   loc_1B26
										add.w   d0,d0
										bcs.w   loc_1B10
										move.l  (a0)+,(a1)+
										add.w   d0,d0
										bcs.w   loc_1B26
										add.w   d0,d0
										bcs.w   loc_1B10
										move.l  (a0)+,(a1)+
										add.w   d0,d0
										bcs.w   loc_1B26
										add.w   d0,d0
										bcs.w   loc_1B10
										move.l  (a0)+,(a1)+
										add.w   d0,d0
										bcs.w   loc_1B26
										add.w   d0,d0
										bcs.w   loc_1B10
										move.l  (a0)+,(a1)+
										add.w   d0,d0
										bcs.w   loc_1B26
										move.w  (a0)+,(a1)+
										add.w   d0,d0
										bra.s   loc_1A92
loc_1B10:
										beq.w   loc_1A90
										move.w  (a0)+,(a1)+
										move.w  (a0)+,d1
										bne.w   loc_1B2E
loc_1B1C:
										move.l  a1,d0
										movem.l (sp)+,d1-d2/a0-a3
										sub.l   a1,d0
										rts
loc_1B26:
										beq.w   loc_1A92
loc_1B2A:
										move.w  (a0)+,d1
										beq.s   loc_1B1C
loc_1B2E:
										moveq   #$1F,d2
										and.w   d1,d2
										sub.w   d2,d1
										cmpi.w  #$20,d1 
										beq.w   loc_1B72
										ror.w   #4,d1
										movea.l a1,a2
										suba.w  d1,a2
										bclr    #0,d2
										bne.s   loc_1B4A
										move.w  (a2)+,(a1)+
loc_1B4A:
										jmp     loc_1B4E(pc,d2.w)
loc_1B4E:
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										move.l  (a2)+,(a1)+
										bra.w   loc_1AA2
loc_1B72:
										move.w  -2(a1),d1
										swap    d1
loc_1B78:
										move.w  -2(a1),d1
										bclr    #0,d2
										bne.s   loc_1B84
										move.w  d1,(a1)+
loc_1B84:
										jmp     loc_1B88(pc,d2.w)
loc_1B88:
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										move.l  d1,(a1)+
										bra.w   loc_1AA2
loc_1BAC:
										movem.l d0-a2/a5,-(sp)
										link    a6,#-$20
loc_1BB4:
										lea     -$20(a6),a5
										moveq   #1,d3
										move.l  d3,(a5)+
										move.l  #$20003,(a5)+
										move.l  #$40005,(a5)+
loc_1BC8:
										move.l  #$60007,(a5)+
loc_1BCE:
										move.l  #$80009,(a5)+
										move.l  #$A000B,(a5)+
loc_1BDA:
										move.l  #$C000D,(a5)+
loc_1BE0:
										move.l  #$E000F,(a5)+
										lea     -$20(a6),a5
										clr.w   d3
loc_1BEC:
										moveq   #3,d4
loc_1BEE:
										lsl.w   #4,d2
										dbf     d3,loc_1BF8
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1BF8:
										add.w   d0,d0
										bcc.w   loc_1C76
										dbf     d3,loc_1C06
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1C06:
										add.w   d0,d0
										bcs.s   loc_1C22
										moveq   #0,d1
loc_1C0C:
										dbf     d3,loc_1C14
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1C14:
										add.w   d0,d0
										addx.w  d1,d1
										bset    d1,d2
loc_1C1A:
										dbf     d4,loc_1BEE
										bra.w   loc_1C7A
loc_1C22:
										dbf     d3,loc_1C2A
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1C2A:
										add.w   d0,d0
										bcs.s   loc_1C38
										addq.w  #4,d2
										dbf     d4,loc_1BEE
										bra.w   loc_1C7A
loc_1C38:
										dbf     d3,loc_1C40
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1C40:
										add.w   d0,d0
										bcs.s   loc_1C4E
										addq.b  #8,d2
										dbf     d4,loc_1BEE
										bra.w   loc_1C7A
loc_1C4E:
										subq.w  #4,d3
										bcc.s   loc_1C6E
										addq.w  #4,d3
										rol.l   d3,d0
										move.w  (a0)+,d0
										subq.w  #4,d3
										neg.w   d3
										rol.l   d3,d0
										neg.w   d3
										addi.w  #$10,d3
										move.l  d0,d1
										swap    d1
										andi.w  #$F,d1
										bra.s   loc_1C74
loc_1C6E:
										moveq   #$F,d1
										rol.w   #4,d0
										and.w   d0,d1
loc_1C74:
										add.b   d1,d2
loc_1C76:
										dbf     d4,loc_1BEE
loc_1C7A:
										move.w  d2,(a1)+
										moveq   #$F,d4
loc_1C7E:
										add.w   d2,d2
										bcc.s   loc_1CD2
										subi.w  #$B,d3
										bcc.s   loc_1CA8
										addi.w  #$B,d3
										rol.l   d3,d0
										move.w  (a0)+,d0
										subi.w  #$B,d3
										neg.w   d3
										rol.l   d3,d0
										neg.w   d3
										addi.w  #$10,d3
										move.l  d0,d1
										swap    d1
										andi.w  #$7FF,d1
										bra.s   loc_1CB0
loc_1CA8:
										move.w  #$7FF,d1
										ror.w   #5,d0
										and.w   d0,d1
loc_1CB0:
										beq.w   loc_1E3E
										lsl.w   #5,d1
										moveq   #$FFFFFFFF,d5
loc_1CB8:
										dbf     d3,loc_1CC0
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1CC0:
										add.w   d0,d0
										dbcs    d5,loc_1CB8
										addi.w  #$20,d5 
										add.w   d5,d1
										move.w  d1,(a1)+
										bra.w   loc_1E36
loc_1CD2:
										moveq   #3,d6
loc_1CD4:
										lsl.w   #4,d7
										dbf     d3,loc_1CDE
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1CDE:
										add.w   d0,d0
										bcs.s   loc_1D08
										dbf     d3,loc_1CEA
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1CEA:
										add.w   d0,d0
										bcs.s   loc_1CF8
										add.w   (a5),d7
										dbf     d6,loc_1CD4
										bra.w   loc_1E34
loc_1CF8:
										move.l  (a5),d5
										add.w   d5,d7
										swap    d5
										move.l  d5,(a5)
										dbf     d6,loc_1CD4
										bra.w   loc_1E34
loc_1D08:
										dbf     d3,loc_1D10
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1D10:
										add.w   d0,d0
										bcs.s   loc_1D4E
										dbf     d3,loc_1D1C
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1D1C:
										add.w   d0,d0
										bcs.s   loc_1D34
										move.w  4(a5),d5
										add.w   d5,d7
										move.l  (a5),2(a5)
										move.w  d5,(a5)
										dbf     d6,loc_1CD4
										bra.w   loc_1E34
loc_1D34:
										move.l  4(a5),d5
										add.w   d5,d7
										move.l  (a5),2(a5)
										move.w  d5,(a5)
										swap    d5
										move.w  d5,6(a5)
										dbf     d6,loc_1CD4
										bra.w   loc_1E34
loc_1D4E:
										dbf     d3,loc_1D56
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1D56:
										add.w   d0,d0
										bcs.s   loc_1D74
										move.w  8(a5),d5
										add.w   d5,d7
										move.l  4(a5),6(a5)
										move.l  (a5),2(a5)
										move.w  d5,(a5)
										dbf     d6,loc_1CD4
										bra.w   loc_1E34
loc_1D74:
										subq.w  #2,d3
										bcc.s   loc_1D94
										addq.w  #2,d3
										rol.l   d3,d0
										move.w  (a0)+,d0
										subq.w  #2,d3
										neg.w   d3
										rol.l   d3,d0
										neg.w   d3
										addi.w  #$10,d3
										move.l  d0,d1
										swap    d1
										andi.w  #3,d1
										bra.s   loc_1D9A
loc_1D94:
										moveq   #3,d1
										rol.w   #2,d0
										and.w   d0,d1
loc_1D9A:
										subq.w  #3,d1
										bcc.s   loc_1DA6
										addq.w  #8,d1
										move.w  d1,d5
										bra.w   loc_1E18
loc_1DA6:
										subq.w  #2,d3
										bcc.s   loc_1DC6
										addq.w  #2,d3
										rol.l   d3,d0
										move.w  (a0)+,d0
										subq.w  #2,d3
										neg.w   d3
										rol.l   d3,d0
										neg.w   d3
										addi.w  #$10,d3
										move.l  d0,d1
										swap    d1
										andi.w  #3,d1
										bra.s   loc_1DCC
loc_1DC6:
										moveq   #3,d1
										rol.w   #2,d0
										and.w   d0,d1
loc_1DCC:
										subq.w  #3,d1
										bcc.s   loc_1DD8
										moveq   #$B,d5
										add.w   d1,d5
										bra.w   loc_1E18
loc_1DD8:
										subq.w  #2,d3
										bcc.s   loc_1DF8
										addq.w  #2,d3
										rol.l   d3,d0
										move.w  (a0)+,d0
										subq.w  #2,d3
										neg.w   d3
										rol.l   d3,d0
										neg.w   d3
										addi.w  #$10,d3
										move.l  d0,d1
										swap    d1
										andi.w  #3,d1
										bra.s   loc_1DFE
loc_1DF8:
										moveq   #3,d1
										rol.w   #2,d0
										and.w   d0,d1
loc_1DFE:
										subq.w  #3,d1
										bcc.s   loc_1E0A
										moveq   #$E,d5
										add.w   d1,d5
										bra.w   loc_1E18
loc_1E0A:
										moveq   #7,d5
										dbf     d3,loc_1E14
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_1E14:
										add.w   d0,d0
										addx.w  d5,d5
loc_1E18:
										move.w  d5,d1
										add.w   d1,d1
										lea     (a5,d1.w),a2
										move.w  (a2),d1
										add.w   d1,d7
										bra.s   loc_1E2A
loc_1E26:
										move.w  -(a2),2(a2)
loc_1E2A:
										dbf     d5,loc_1E26
										move.w  d1,(a2)
										dbf     d6,loc_1CD4
loc_1E34:
										move.w  d7,(a1)+
loc_1E36:
										dbf     d4,loc_1C7E
										bra.w   loc_1BEC
loc_1E3E:
										move.w  d1,(a1)+
										unlk    a6
										movem.l (sp)+,d0-a2/a5
										rts

	; End of function LoadSpriteData


; =============== S U B R O U T I N E =======================================

; Stack tile decompression
; 
;     In: A0 = address of compressed data
;         A1 = dest address in RAM

LoadTileData:
										
										movem.l d1-a5,-(sp)
										link    a6,#-$20
										lea     -$20(a6),a5
										moveq   #3,d6
										movea.l d6,a4
										subq.w  #1,d6
										movea.l d6,a3
										subq.w  #1,d6
										moveq   #0,d4
										move.l  #$40005,(a5)+
										move.l  #$60007,(a5)+
loc_1E6C:
										move.l  #$80009,(a5)+
loc_1E72:
										move.l  #$A000B,(a5)+
										move.l  #$C000D,(a5)+
										move.l  #$E000F,(a5)+
										lea     -$20(a6),a5
										move.w  #$8000,d0
loc_1E8C:
										moveq   #3,d3
loc_1E8E:
										add.w   d0,d0
										bcs.s   loc_1E9C
loc_1E92:
										lsl.w   #4,d2
										dbf     d3,loc_1E8E
										bra.w   loc_1F24
loc_1E9C:
										bne.s   loc_1EA4
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_1E92
loc_1EA4:
										add.w   d0,d0
										bcs.s   loc_1EC0
loc_1EA8:
										lsl.w   #4,d2
										moveq   #0,d1
										add.w   d0,d0
										bne.s   loc_1EB4
										move.w  (a0)+,d0
										addx.w  d0,d0
loc_1EB4:
										addx.w  d1,d1
										bset    d1,d2
										dbf     d3,loc_1E8E
										bra.w   loc_1F24
loc_1EC0:
										bne.s   loc_1EC8
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_1EA8
loc_1EC8:
										add.w   d0,d0
										bcs.s   loc_1ED8
loc_1ECC:
										lsl.w   #4,d2
										addq.w  #4,d2
										dbf     d3,loc_1E8E
										bra.w   loc_1F24
loc_1ED8:
										bne.s   loc_1EE0
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_1ECC
loc_1EE0:
										add.w   d0,d0
										bcs.s   loc_1EF0
loc_1EE4:
										lsl.w   #4,d2
										addq.b  #8,d2
										dbf     d3,loc_1E8E
										bra.w   loc_1F24
loc_1EF0:
										bne.s   loc_1EF8
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_1EE4
loc_1EF8:
										add.w   d0,d0
										bne.s   loc_1F00
										move.w  (a0)+,d0
										addx.w  d0,d0
loc_1F00:
										addx.w  d2,d2
										add.w   d0,d0
										bne.s   loc_1F0A
										move.w  (a0)+,d0
										addx.w  d0,d0
loc_1F0A:
										addx.w  d2,d2
										add.w   d0,d0
										bne.s   loc_1F14
										move.w  (a0)+,d0
										addx.w  d0,d0
loc_1F14:
										addx.w  d2,d2
										add.w   d0,d0
										bne.s   loc_1F1E
										move.w  (a0)+,d0
										addx.w  d0,d0
loc_1F1E:
										addx.w  d2,d2
										dbf     d3,loc_1E8E
loc_1F24:
										moveq   #$FFFFFFFF,d1
										add.w   d1,d1
										addx.w  d2,d2
										bcs.w   loc_204C
loc_1F2E:
										moveq   #3,d3
loc_1F30:
										lsl.w   #4,d7
										add.w   d0,d0
										bcs.s   loc_1F58
loc_1F36:
										add.w   d0,d0
										bcs.s   loc_1F44
loc_1F3A:
										add.w   d4,d7
										dbf     d3,loc_1F30
										bra.w   loc_2040
loc_1F44:
										bne.s   word_1F4C       
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_1F3A
word_1F4C:
										
										dc.w $CD44              ;  exg     d6,d4
										dc.w $DE44              ;  add.w   d4,d7
										dbf     d3,loc_1F30
										bra.w   loc_2040
loc_1F58:
										bne.s   loc_1F60
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_1F36
loc_1F60:
										add.w   d0,d0
										bcs.s   loc_1F8E
loc_1F64:
										add.w   d0,d0
										bcs.s   loc_1F76
loc_1F68:
										exg     d6,a3
										dc.w $CD44              ; exg     d6,d4
										dc.w $DE44              ; add.w   d4,d7
										dbf     d3,loc_1F30
loc_1F72:
										bra.w   loc_2040
loc_1F76:
										bne.s   word_1F7E       
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_1F68
word_1F7E:
										
										dc.w $C94B              ; exg     a4,a3
										dc.w $CD8B              ; exg     d6,a3
										dc.w $CD44              ; exg     d6,d4
										dc.w $DE44              ; add.w   d4,d7
										dbf     d3,loc_1F30
										bra.w   loc_2040
loc_1F8E:
										bne.s   loc_1F96
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_1F64
loc_1F96:
										add.w   d0,d0
										bcs.s   loc_1FB0
loc_1F9A:
										move.w  (a5),d5
										move.w  a4,(a5)
										movea.l a3,a4
										movea.l d6,a3
										move.l  d4,d6
										move.l  d5,d4
										add.w   d4,d7
										dbf     d3,loc_1F30
										bra.w   loc_2040
loc_1FB0:
										bne.s   loc_1FB8
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_1F9A
loc_1FB8:
										move.w  #$4000,d5
loc_1FBC:
										add.w   d0,d0
										bne.s   loc_1FC4
										move.w  (a0)+,d0
										addx.w  d0,d0
loc_1FC4:
										addx.w  d5,d5
										bcc.s   loc_1FBC
										subq.w  #3,d5
										bcc.s   loc_1FD2
										addq.w  #4,d5
										bra.w   loc_2014
loc_1FD2:
										move.w  #$4000,d5
loc_1FD6:
										add.w   d0,d0
										bne.s   loc_1FDE
										move.w  (a0)+,d0
										addx.w  d0,d0
loc_1FDE:
										addx.w  d5,d5
										bcc.s   loc_1FD6
										subq.w  #3,d5
										bcc.s   loc_1FEC
										addq.w  #7,d5
										bra.w   loc_2014
loc_1FEC:
										move.w  #$4000,d5
loc_1FF0:
										add.w   d0,d0
										bne.s   loc_1FF8
										move.w  (a0)+,d0
										addx.w  d0,d0
loc_1FF8:
										addx.w  d5,d5
										bcc.s   loc_1FF0
										subq.w  #3,d5
										bcc.s   loc_2008
loc_2000:
										addi.w  #$A,d5
										bra.w   loc_2014
loc_2008:
										moveq   #5,d5
										add.w   d0,d0
										bne.s   loc_2012
										move.w  (a0)+,d0
										addx.w  d0,d0
loc_2012:
										addx.w  d5,d5
loc_2014:
										move.w  d5,d1
										add.w   d1,d1
										lea     (a5,d1.w),a2
										move.w  (a2),d1
										add.w   d1,d7
										lsr.w   #1,d5
										bcc.s   loc_2028
										move.w  -(a2),2(a2)
loc_2028:
										bra.s   loc_202E
loc_202A:
										move.l  -(a2),2(a2)
loc_202E:
										dbf     d5,loc_202A
										move.w  a4,(a2)
										movea.l a3,a4
										movea.l d6,a3
										move.l  d4,d6
										move.w  d1,d4
										dbf     d3,loc_1F30
loc_2040:
										move.w  d7,(a1)+
loc_2042:
										add.w   d2,d2
										bcc.w   loc_1F2E
										beq.w   loc_1E8C
loc_204C:
										add.w   d0,d0
										bne.w   loc_2064
										move.w  (a0)+,d0
										ror.w   #5,d0
										move.w  #$7FF,d1
										and.w   d0,d1
										eor.w   d1,d0
										ori.w   #$400,d0
										bra.s   loc_2082
loc_2064:
										moveq   #9,d5
										moveq   #0,d1
loc_2068:
										addx.w  d1,d1
										add.w   d0,d0
										dbeq    d5,loc_2068
										beq.s   loc_2076
										addx.w  d1,d1
										bra.s   loc_2082
loc_2076:
										swap    d1
										move.w  (a0)+,d1
										addx.l  d1,d1
										rol.l   d5,d1
										move.w  d1,d0
										swap    d1
loc_2082:
										movea.l a1,a2
										add.w   d1,d1
										beq.w   loc_20DA
										suba.w  d1,a2
										subq.w  #2,d1
										beq.s   loc_20B0
loc_2090:
										move.l  (a2)+,(a1)+
										add.w   d0,d0
										bcs.s   loc_20A6
loc_2096:
										add.w   d0,d0
										bcc.s   loc_2090
										bne.s   loc_20A2
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_2090
loc_20A2:
										move.w  (a2)+,(a1)+
										bra.s   loc_2042
loc_20A6:
										bne.s   loc_20AE
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_2096
loc_20AE:
										bra.s   loc_2042
loc_20B0:
										move.w  (a2),d1
										swap    d1
										move.w  (a2),d1
loc_20B6:
										move.l  d1,(a1)+
										add.w   d0,d0
										bcs.s   loc_20CE
loc_20BC:
										add.w   d0,d0
										bcc.s   loc_20B6
										bne.s   loc_20C8
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_20B6
loc_20C8:
										move.w  d1,(a1)+
										bra.w   loc_2042
loc_20CE:
										bne.s   loc_20D6
										move.w  (a0)+,d0
										addx.w  d0,d0
										bcc.s   loc_20BC
loc_20D6:
										bra.w   loc_2042
loc_20DA:
										move.l  a1,d0
										unlk    a6
										movem.l (sp)+,d1-a5
										sub.l   a1,d0
										rts

	; End of function LoadTileData


; =============== S U B R O U T I N E =======================================

; In: A0 = compressed map layout data (block indexes)
;     A1 = RAM address to put map layout data

LoadMapLayoutData:
										
										movem.l d0-a6,-(sp)
										lea     (byte_FF6000).l,a4
										moveq   #0,d3
										move.w  #$7F,d0 
loc_20F6:
										move.l  d3,(a4)+
										move.l  d3,(a4)+
										move.l  d3,(a4)+
										move.l  d3,(a4)+
										dbf     d0,loc_20F6
										movea.l a1,a3
										lea     $2000(a1),a6    ; set a6 as 0x2000 past beginning in RAM (to signify end)
										clr.w   d3
										moveq   #2,d7
										lea     (byte_FF6000).l,a4
										moveq   #0,d3
loc_2114:
										cmpa.l  a6,a1           ; loop point; compare a1 to a6 to see if we're done
										bcs.s   loc_211E
										movem.l (sp)+,d0-a6
										rts
loc_211E:
										dbf     d3,loc_2126
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_2126:
										add.w   d0,d0
										bcs.w   loc_21A6        ; passes on barrel = 0
										dbf     d3,loc_2134
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_2134:
										add.w   d0,d0
										bcs.w   loc_214E        ; passes on barrel = 00
										bsr.w   ReadMapLayoutBarrelForBlockFlags
										addq.w  #1,d7
										or.w    d7,d1           ; OR next block idx together with flags
										bsr.w   sub_2310
										bsr.w   sub_22F4
										move.w  d1,(a1)+
										bra.s   loc_2114        
loc_214E:
										moveq   #$FFFFFFFF,d4   ; barrel = 01
										clr.w   d1
										moveq   #2,d5
loc_2154:
										dbf     d3,loc_215C
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_215C:
										add.w   d0,d0
										dbcs    d4,loc_2154
										negx.w  d4
										dbf     d4,loc_216A
										bra.s   loc_2180
loc_216A:
										lsl.w   d4,d5
loc_216C:
										dbf     d3,loc_2174
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_2174:
										add.w   d0,d0
										addx.w  d1,d1
										dbf     d4,loc_216C
										add.w   d5,d1
										subq.w  #1,d1
loc_2180:
										dbf     d3,loc_2188
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_2188:
										add.w   d0,d0
										bcs.w   loc_219A
loc_218E:
										move.w  -$80(a1),(a1)+
										dbf     d1,loc_218E
										bra.w   loc_2114        
loc_219A:
										move.w  -2(a1),(a1)+
										dbf     d1,loc_219A
										bra.w   loc_2114        
loc_21A6:
										lea     -2(a1),a2
										cmpa.l  a3,a2
										bcc.s   loc_21B4
										clr.w   d1
										bra.w   loc_21BA
loc_21B4:
										move.w  (a2),d1
										andi.w  #$3FF,d1
loc_21BA:
										move.w  d1,d4
										move.b  (a4,d1.w),d1
										ext.w   d1
										dbf     d1,loc_21C8
										bra.s   loc_2208
loc_21C8:
										dbf     d3,loc_21D0
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_21D0:
										add.w   d0,d0
										bcs.w   loc_2208
										lea     (word_FF6800).l,a5
										bra.w   loc_21F0
loc_21E0:
										dbf     d3,loc_21E8
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_21E8:
										add.w   d0,d0
										bcs.w   loc_21F4
										addq.w  #2,a5
loc_21F0:
										dbf     d1,loc_21E0
loc_21F4:
										lsl.w   #3,d4
										move.w  (a5,d4.w),d1
										bsr.w   sub_2310
										bsr.w   sub_22F4
										move.w  d1,(a1)+
										bra.w   loc_2114        
loc_2208:
										lea     -$80(a1),a2
										cmpa.l  a3,a2
										bcc.s   loc_2216
										clr.w   d1
										bra.w   loc_221C
loc_2216:
										move.w  (a2),d1
										andi.w  #$3FF,d1
loc_221C:
										move.w  d1,d4
										ori.w   #$400,d1
										move.b  (a4,d1.w),d1
										ext.w   d1
										dbf     d1,loc_222E
										bra.s   loc_226E
loc_222E:
										dbf     d3,loc_2236
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_2236:
										add.w   d0,d0
										bcs.w   loc_226E
										lea     (dword_FF8800).l,a5
										bra.w   loc_2256
loc_2246:
										dbf     d3,loc_224E
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_224E:
										add.w   d0,d0
										bcs.w   loc_225A
										addq.w  #2,a5
loc_2256:
										dbf     d1,loc_2246
loc_225A:
										lsl.w   #3,d4
										move.w  (a5,d4.w),d1
										bsr.w   sub_2310
										bsr.w   sub_22F4
										move.w  d1,(a1)+
										bra.w   loc_2114        
loc_226E:
										move.w  d7,d1
										clr.w   d4
loc_2272:
										dbf     d3,loc_227A
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_227A:
										add.w   d0,d0
										addx.w  d4,d4
										lsr.w   #1,d1
										bne.s   loc_2272
										bsr.w   ReadMapLayoutBarrelForBlockFlags
										or.w    d4,d1
										bsr.w   sub_2310
										bsr.w   sub_22F4
										move.w  d1,(a1)+
										bra.w   loc_2114        

	; End of function LoadMapLayoutData


; =============== S U B R O U T I N E =======================================

; Reads next part of barrel to determine flags for next block
; barrel = 00
; 
; In: D0 = barrel
; Out: D1 = block flag word

ReadMapLayoutBarrelForBlockFlags:
										
										dbf     d3,loc_229E
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_229E:
										add.w   d0,d0
										bcs.w   loc_22B6        ; passes on barrel = 000
										clr.w   d1
										dbf     d3,loc_22AE
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_22AE:
										add.w   d0,d0
										roxr.w  #1,d1           ; barrel = 0001
										asr.w   #1,d1
										rts
loc_22B6:
										dbf     d3,loc_22BE     ; barrel = 001
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_22BE:
										add.w   d0,d0
										bcs.w   loc_22D8        ; passes on barrel = 0010
										clr.w   d1
										dbf     d3,loc_22CE
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_22CE:
										add.w   d0,d0
										addx.w  d1,d1
										addq.w  #1,d1
										ror.w   #2,d1
										rts
loc_22D8:
										move.l  d2,-(sp)        ; barrel = 0011
										moveq   #5,d2
										clr.w   d1
loc_22DE:
										dbf     d3,loc_22E6
										moveq   #$F,d3
										move.w  (a0)+,d0
loc_22E6:
										add.w   d0,d0
										addx.w  d1,d1
										dbf     d2,loc_22DE
										ror.w   #6,d1
										move.l  (sp)+,d2
										rts

	; End of function ReadMapLayoutBarrelForBlockFlags


; =============== S U B R O U T I N E =======================================

sub_22F4:
										lea     -$80(a1),a2
										cmpa.l  a3,a2
										bcc.s   loc_2302
										clr.w   d4
										bra.w   loc_2308
loc_2302:
										move.w  (a2),d4
										andi.w  #$3FF,d4
loc_2308:
										ori.w   #$400,d4
										bra.w   loc_2324

	; End of function sub_22F4


; =============== S U B R O U T I N E =======================================

sub_2310:
										lea     -2(a1),a2
										cmpa.l  a3,a2           ; check that a block-to-the-left exists (not left-most block)
										bcc.s   loc_231E        
										clr.w   d4              ; left-most block, so set block idx to 0
										bra.w   loc_2324
loc_231E:
										move.w  (a2),d4         ; copy last block idx (to the left of current block) to d4
										andi.w  #$3FF,d4
loc_2324:
										lea     (a4,d4.w),a5
										move.b  (a5),d2
										ext.w   d2
										move.w  d2,d5
										lsl.w   #3,d4
										lea     (word_FF6800).l,a2
										adda.w  d4,a2
										dbf     d5,loc_2344
										move.b  #1,(a5)
										move.w  d1,(a2)
										rts
loc_2344:
										move.w  d1,d4
loc_2346:
										move.w  (a2),d6
										move.w  d4,(a2)+
										cmp.w   d6,d1
										beq.s   return_2370
loc_234E:
										dbf     d5,loc_235C
										subq.w  #4,d2
										bcc.s   return_235A
										move.w  d6,(a2)
										addq.b  #1,(a5)
return_235A:
										
										rts
loc_235C:
										move.w  (a2),d4
										move.w  d6,(a2)+
										cmp.w   d4,d1
										beq.s   return_2370
										dbf     d5,loc_2346
										subq.w  #4,d2
										bcc.s   return_2370
										move.w  d4,(a2)
										addq.b  #1,(a5)
return_2370:
										
										rts

	; End of function sub_2310


; =============== S U B R O U T I N E =======================================

sub_2372:
										movem.l d0-a6,-(sp)
										lea     (word_FF6800).l,a2
										clr.w   d4
										move.w  #$100,d0
										move.w  d0,(a1)+
										move.w  d0,(a1)+
										move.w  d0,(a1)+
										move.w  d0,(a1)+
										move.w  d0,(a1)+
										move.w  d0,(a1)+
										move.w  d0,(a1)+
										move.w  d0,(a1)+
										move.w  d0,(a1)+
										move.w  #$32E,(a1)+
										move.w  #$32F,(a1)+
										move.w  #$B2E,(a1)+
loc_23A0:
										move.w  #$33E,(a1)+
										move.w  #$33F,(a1)+
										move.w  #$B3E,(a1)+
										move.w  #$34E,(a1)+
										move.w  #$34F,(a1)+
										move.w  #$B4E,(a1)+
loc_23B8:
										move.w  #$32C,(a1)+
										move.w  #$32D,(a1)+
										move.w  #$B2C,(a1)+
										move.w  #$33C,(a1)+
										move.w  #$33D,(a1)+
										move.w  #$B3C,(a1)+
loc_23D0:
										move.w  #$34E,(a1)+
										move.w  #$34F,(a1)+
										move.w  #$B4E,(a1)+
										subi.w  #$E,d4
										bcc.s   loc_2402
										addi.w  #$E,d4
										rol.l   d4,d0
										move.w  (a0)+,d0
										subi.w  #$E,d4
										neg.w   d4
										rol.l   d4,d0
										neg.w   d4
										addi.w  #$10,d4
										move.l  d0,d5
										swap    d5
										andi.w  #$3FFF,d5
										bra.s   loc_240A
loc_2402:
										move.w  #$3FFF,d5
										ror.w   #2,d0
										and.w   d0,d5
loc_240A:
										dbf     d5,loc_2414
										movem.l (sp)+,d0-a6
										rts
loc_2414:
										dbf     d4,loc_241C
										moveq   #$F,d4
										move.w  (a0)+,d0
loc_241C:
										add.w   d0,d0
										bcs.w   loc_244C
										dbf     d4,loc_242A
										moveq   #$F,d4
										move.w  (a0)+,d0
loc_242A:
										add.w   d0,d0
loc_242C:
										bcs.w   loc_2436
										move.w  -2(a1),(a1)+
										bra.s   loc_240A
loc_2436:
										move.w  -2(a1),d1
										btst    #$B,d1
										bne.s   loc_2446
										addq.w  #1,d1
										move.w  d1,(a1)+
										bra.s   loc_240A
loc_2446:
										subq.w  #1,d1
										move.w  d1,(a1)+
										bra.s   loc_240A
loc_244C:
										dbf     d4,loc_2454
										moveq   #$F,d4
										move.w  (a0)+,d0
loc_2454:
										add.w   d0,d0
										bcs.w   loc_249E
										dbf     d4,loc_2462
										moveq   #$F,d4
										move.w  (a0)+,d0
loc_2462:
										add.w   d0,d0
										bcs.w   loc_2480
										move.w  -2(a1),d1
										move.w  d1,d2
										andi.w  #$3FF,d1
										andi.w  #$800,d2
										add.w   d1,d1
										or.w    d2,d1
										move.w  (a2,d1.w),(a1)+
										bra.s   loc_240A
loc_2480:
										move.w  -6(a1),d1
										move.w  d1,d2
										andi.w  #$3FF,d1
										andi.w  #$800,d2
										ori.w   #$1000,d2
										add.w   d1,d1
										or.w    d2,d1
loc_2496:
										move.w  (a2,d1.w),(a1)+
										bra.w   loc_240A
loc_249E:
										dbf     d4,loc_24A6
										moveq   #$F,d4
										move.w  (a0)+,d0
loc_24A6:
										add.w   d0,d0
										bcs.w   loc_24B8
										move.w  -2(a1),d7
										andi.w  #$9800,d7
										bra.w   loc_24E0
loc_24B8:
										clr.w   d7
										dbf     d4,loc_24C2
										moveq   #$F,d4
										move.w  (a0)+,d0
loc_24C2:
										add.w   d0,d0
										roxl.w  #3,d7
										dbf     d4,loc_24CE
										moveq   #$F,d4
										move.w  (a0)+,d0
loc_24CE:
										add.w   d0,d0
										addx.w  d7,d7
										dbf     d4,loc_24DA
										moveq   #$F,d4
										move.w  (a0)+,d0
loc_24DA:
										add.w   d0,d0
										addx.w  d7,d7
										ror.w   #5,d7
loc_24E0:
										dbf     d4,loc_24E8
										moveq   #$F,d4
										move.w  (a0)+,d0
loc_24E8:
										add.w   d0,d0
										bcc.w   loc_253C
										subi.w  #9,d4
										bcc.s   loc_2514
										addi.w  #9,d4
										rol.l   d4,d0
										move.w  (a0)+,d0
										subi.w  #9,d4
										neg.w   d4
										rol.l   d4,d0
										neg.w   d4
										addi.w  #$10,d4
										move.l  d0,d3
										swap    d3
										andi.w  #$1FF,d3
										bra.s   loc_251C
loc_2514:
										move.w  #$1FF,d3
										ror.w   #7,d0
										and.w   d0,d3
loc_251C:
										cmpi.w  #$180,d3
										bcs.s   loc_2532
										dbf     d4,loc_252A
										moveq   #$F,d4
										move.w  (a0)+,d0
loc_252A:
										add.w   d0,d0
										addx.w  d3,d3
										subi.w  #$180,d3
loc_2532:
										addi.w  #$100,d3
										or.w    d7,d3
										bra.w   loc_257A
loc_253C:
										subq.w  #5,d4
										bcc.s   loc_255C
										addq.w  #5,d4
										rol.l   d4,d0
										move.w  (a0)+,d0
										subq.w  #5,d4
										neg.w   d4
										rol.l   d4,d0
										neg.w   d4
										addi.w  #$10,d4
										move.l  d0,d3
										swap    d3
										andi.w  #$1F,d3
										bra.s   loc_2562
loc_255C:
										moveq   #$1F,d3
										rol.w   #5,d0
										and.w   d0,d3
loc_2562:
										dbf     d4,loc_256A
										moveq   #$F,d4
										move.w  (a0)+,d0
loc_256A:
										add.w   d0,d0
										bcc.s   loc_2570
										neg.w   d3
loc_2570:
										add.w   -2(a1),d3
										andi.w  #$7FF,d3
										or.w    d7,d3
loc_257A:
										move.w  -2(a1),d1
										move.w  d1,d2
										andi.w  #$3FF,d1
										andi.w  #$800,d2
										add.w   d1,d1
										or.w    d2,d1
										move.w  d3,(a2,d1.w)
										move.w  -6(a1),d1
										move.w  d1,d2
										andi.w  #$3FF,d1
										andi.w  #$800,d2
										ori.w   #$1000,d2
										add.w   d1,d1
										or.w    d2,d1
										move.w  d3,(a2,d1.w)
										move.w  d3,(a1)+
										bra.w   loc_240A

	; End of function sub_2372


; =============== S U B R O U T I N E =======================================

sub_25B0:
										clr.w   d1
										move.b  ((CURRENT_MAP-$1000000)).w,d1
										movea.l (p_pt_MapData).l,a5
										lsl.w   #2,d1
										movea.l (a5,d1.w),a5
										addq.l  #1,a5
										movea.l (p_pt_MapTiles).l,a0
										clr.w   d0
										move.b  (a5)+,d0
										blt.s   loc_25E8
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										lea     ($2000).w,a1
										move.w  #$800,d0
										moveq   #2,d1
										bsr.w   DmaTilesViaFF8804bis
										bsr.w   SetFFDE94b3andWait
loc_25E8:
										addq.l  #1,a5
										movea.l (p_pt_MapTiles).l,a0
										clr.w   d0
										move.b  (a5)+,d0
										blt.s   loc_260E
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										lea     ($4000).w,a1
										move.w  #$800,d0
										moveq   #2,d1
										bsr.w   DmaTilesViaFF8804bis
										bsr.w   SetFFDE94b3andWait
loc_260E:
										movea.l (p_pt_MapTiles).l,a0
										clr.w   d0
										move.b  (a5)+,d0
										blt.s   loc_2632
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										lea     ($5000).w,a1
										move.w  #$800,d0
										moveq   #2,d1
										bsr.w   DmaTilesViaFF8804bis
										bsr.w   SetFFDE94b3andWait
loc_2632:
										addq.l  #1,a5
										trap    #VINT_FUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l 0
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l VInt_3930          
										bsr.w   sub_2D58
										movea.l (a5)+,a4
										move.w  (a4)+,d0
										move.w  (a4)+,d1
										move.w  (a4)+,d2
										move.w  (a4)+,d3
										mulu.w  #$180,d0
										mulu.w  #$180,d1
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										bsr.w   sub_2670        
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ACTIVATE
										dc.l 0
										rts

	; End of function sub_25B0


; =============== S U B R O U T I N E =======================================

; related to 4 choices apparently

sub_2670:
										move.b  ((byte_FFA84C-$1000000)).w,d0
										andi.w  #3,d0
										add.w   d0,d0
										move.w  rjt_2682(pc,d0.w),d0
										jmp     rjt_2682(pc,d0.w)

	; End of function sub_2670

rjt_2682:           dc.w sub_268A-rjt_2682
										dc.w sub_2816-rjt_2682
										dc.w sub_2750-rjt_2682
										dc.w sub_28DC-rjt_2682

; =============== S U B R O U T I N E =======================================

sub_268A:
										move.w  #0,((word_FFA810-$1000000)).w
										move.w  #0,((word_FFA814-$1000000)).w
										move.w  #0,((word_FFA818-$1000000)).w
										move.w  #0,((word_FFA81C-$1000000)).w
										jsr     sub_43A4(pc)
										nop
										move.w  #$1D,d7
										lea     (byte_FFE000).l,a0
										lea     (byte_FFC000).l,a1
										move.w  #2,d0
										move.w  #$3E,d1 
loc_26C0:
										subq.w  #8,((word_FFA804-$1000000)).w
										cmpi.w  #$14,d7
										bge.s   loc_26D0
										move.w  #$F900,d2
										bra.s   loc_26D4
loc_26D0:
										move.w  #$F900,d2
loc_26D4:
										move.w  #$F800,d3
										bsr.w   sub_29A2
										bsr.w   WaitForVInt     
										move.w  #$1F,d6
										movem.l d0-d1,-(sp)
loc_26E8:
										move.w  (a0,d0.w),(a1,d1.w)
										addi.w  #$40,d0 
										addi.w  #$40,d1 
										dbf     d6,loc_26E8
										movem.l (sp)+,d0-d1
										addq.w  #2,d0
										andi.w  #$3E,d0 
										addq.w  #2,d1
										andi.w  #$3E,d1 
										movem.l d0-d1/a0-a1,-(sp)
										lea     (byte_FFC000).l,a0
										lea     ($C000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										bsr.w   sub_119E        
										bsr.w   Set_FFDE94_bit3 
										movem.l (sp)+,d0-d1/a0-a1
										dbf     d7,loc_26C0
										bsr.w   WaitForVInt     
										move.w  #0,((word_FFA804-$1000000)).w
										move.w  #0,((word_FFA806-$1000000)).w
										trap    #VINT_FUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l VInt_3930          
										jsr     sub_4344(pc)
										nop
										rts

	; End of function sub_268A


; =============== S U B R O U T I N E =======================================

sub_2750:
										move.w  #$4F80,((word_FFA810-$1000000)).w
										move.w  #$4F80,((word_FFA814-$1000000)).w
										move.w  #$4F80,((word_FFA818-$1000000)).w
										move.w  #$4F80,((word_FFA81C-$1000000)).w
										jsr     sub_43A4(pc)
										nop
										move.w  #$1D,d7
loc_2772:
										lea     (byte_FFE000).l,a0
										lea     (byte_FFC000).l,a1
										move.w  #$3C,d0 
loc_2782:
										move.w  #0,d1
loc_2786:
										addq.w  #8,((word_FFA804-$1000000)).w
										cmpi.w  #$14,d7
										bge.s   loc_2796
										move.w  #$700,d2
										bra.s   loc_279A
loc_2796:
										move.w  #$700,d2
loc_279A:
										move.w  #$800,d3
										bsr.w   sub_29A2
loc_27A2:
										bsr.w   WaitForVInt     
										move.w  #$1F,d6
										movem.l d0-d1,-(sp)
loc_27AE:
										move.w  (a0,d0.w),(a1,d1.w)
										addi.w  #$40,d0 
										addi.w  #$40,d1 
										dbf     d6,loc_27AE
										movem.l (sp)+,d0-d1
										subq.w  #2,d0
										andi.w  #$3E,d0 
										subq.w  #2,d1
										andi.w  #$3E,d1 
										movem.l d0-d1/a0-a1,-(sp)
										lea     (byte_FFC000).l,a0
										lea     ($C000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										bsr.w   sub_119E        
										bsr.w   Set_FFDE94_bit3 
										movem.l (sp)+,d0-d1/a0-a1
										dbf     d7,loc_2786
loc_27F6:
										bsr.w   WaitForVInt     
										move.w  #8,((word_FFA804-$1000000)).w
loc_2800:
										move.w  #8,((word_FFA806-$1000000)).w
										trap    #VINT_FUNCTIONS
										dc.w VINTS_DEACTIVATE
off_280A:
										dc.l VInt_3930          
										jsr     sub_4344(pc)
										nop
										rts

	; End of function sub_2750


; =============== S U B R O U T I N E =======================================

sub_2816:
										move.w  #$5100,((word_FFA812-$1000000)).w
										move.w  #$5100,((word_FFA816-$1000000)).w
										move.w  #$5100,((word_FFA81A-$1000000)).w
										move.w  #$5100,((word_FFA81E-$1000000)).w
										jsr     sub_43A4(pc)
										nop
										move.w  #$1A,d7
										lea     (byte_FFE000).l,a0
										lea     (byte_FFC000).l,a1
										move.w  #$6C0,d0
										move.w  #0,d1
loc_284C:
										subq.w  #8,((word_FFA808-$1000000)).w
										cmpi.w  #$14,d7
										bge.s   loc_285C
										move.w  #7,d2
										bra.s   loc_2860
loc_285C:
										move.w  #7,d2
loc_2860:
										move.w  #8,d3
										bsr.w   sub_29A2
										bsr.w   WaitForVInt     
										move.w  #$1F,d6
										movem.l d0-d1,-(sp)
loc_2874:
										move.w  (a0,d0.w),(a1,d1.w)
										addq.w  #2,d0
										addq.w  #2,d1
										dbf     d6,loc_2874
										movem.l (sp)+,d0-d1
										subi.w  #$40,d0 
										andi.w  #$7FE,d0
										subi.w  #$40,d1 
										andi.w  #$7FE,d1
										movem.l d0-d1/a0-a1,-(sp)
										lea     (byte_FFC000).l,a0
										lea     ($C000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										bsr.w   sub_119E        
										bsr.w   Set_FFDE94_bit3 
										movem.l (sp)+,d0-d1/a0-a1
										dbf     d7,loc_284C
										bsr.w   WaitForVInt     
loc_28C0:
										move.w  #$18,((word_FFA808-$1000000)).w
										move.w  #$18,((word_FFA80A-$1000000)).w
										trap    #VINT_FUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l VInt_3930          
										jsr     sub_4344(pc)
										nop
										rts

	; End of function sub_2816


; =============== S U B R O U T I N E =======================================

sub_28DC:
										move.w  #0,((word_FFA812-$1000000)).w
										move.w  #0,((word_FFA816-$1000000)).w
										move.w  #0,((word_FFA81A-$1000000)).w
										move.w  #0,((word_FFA81E-$1000000)).w
										jsr     sub_43A4(pc)
										nop
										move.w  #$1A,d7
										lea     (byte_FFE000).l,a0
										lea     (byte_FFC000).l,a1
										move.w  #$140,d0
										move.w  #0,d1
loc_2912:
										addq.w  #8,((word_FFA808-$1000000)).w
										cmpi.w  #$14,d7
										bge.s   loc_2922
										move.w  #$F9,d2 
										bra.s   loc_2926
loc_2922:
										move.w  #$F9,d2 
loc_2926:
										move.w  #$F8,d3 
										bsr.w   sub_29A2
										bsr.w   WaitForVInt     
										move.w  #$1F,d6
										movem.l d0-d1,-(sp)
loc_293A:
										move.w  (a0,d0.w),(a1,d1.w)
										addq.w  #2,d0
										addq.w  #2,d1
										dbf     d6,loc_293A
										movem.l (sp)+,d0-d1
										addi.w  #$40,d0 
										andi.w  #$7FE,d0
										addi.w  #$40,d1 
										andi.w  #$7FE,d1
										movem.l d0-d1/a0-a1,-(sp)
										lea     (byte_FFC000).l,a0
										lea     ($C000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										bsr.w   sub_119E        
										bsr.w   Set_FFDE94_bit3 
										movem.l (sp)+,d0-d1/a0-a1
										dbf     d7,loc_2912
										bsr.w   WaitForVInt     
										move.w  #8,((word_FFA808-$1000000)).w
										move.w  #8,((word_FFA80A-$1000000)).w
										trap    #VINT_FUNCTIONS
										dc.w VINTS_DEACTIVATE
										dc.l VInt_3930          
										jsr     sub_4344(pc)
										nop
										rts

	; End of function sub_28DC


; =============== S U B R O U T I N E =======================================

sub_29A2:
										movem.l d0-a0,-(sp)
										lea     (byte_FFDD00).l,a0
										moveq   #$1F,d7
										move.w  d2,d0
										move.w  d2,d1
										asr.w   #8,d0
										ext.w   d1
										move.w  d3,d2
										asr.w   #8,d2
										ext.w   d3
loc_29BC:
										cmpi.w  #$1F,d7
										bne.s   loc_29CA
										add.w   d1,(a0)
										add.w   d0,6(a0)
										bra.s   loc_29D6
loc_29CA:
										cmpi.w  #1,(a0)
										beq.s   loc_29D6
										add.w   d3,(a0)
										add.w   d2,6(a0)
loc_29D6:
										addq.l  #8,a0
										dbf     d7,loc_29BC
										movem.l (sp)+,d0-a0
										rts

	; End of function sub_29A2


; =============== S U B R O U T I N E =======================================

; In: D1 = map index

LoadMapTilesets:
										
										movem.l d0-d1/a0-a1/a5,-(sp)
										ext.w   d1
										blt.w   loc_2A86
										movea.l (p_pt_MapData).l,a5
										lsl.w   #2,d1
										movea.l (a5,d1.w),a5
										move.b  (a5)+,d0
										movea.l (p_pt_MapTiles).l,a0
										clr.w   d0
										move.b  (a5)+,d0
										blt.s   loc_2A16
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										lea     (byte_FF3000).l,a1
										bsr.w   LoadTileData    
loc_2A16:
										movea.l (p_pt_MapTiles).l,a0
										clr.w   d0
										move.b  (a5)+,d0
										blt.s   loc_2A32
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										lea     (FF6802_LOADING_SPACE).l,a1
										bsr.w   LoadTileData    
loc_2A32:
										movea.l (p_pt_MapTiles).l,a0
										clr.w   d0
										move.b  (a5)+,d0
										blt.s   loc_2A4E
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										lea     (RAM_START).l,a1
										bsr.w   LoadTileData    
loc_2A4E:
										movea.l (p_pt_MapTiles).l,a0
										clr.w   d0
										move.b  (a5)+,d0
										blt.s   loc_2A6A
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										lea     (byte_FF1000).l,a1
										bsr.w   LoadTileData    
loc_2A6A:
										movea.l (p_pt_MapTiles).l,a0
										clr.w   d0
										move.b  (a5)+,d0
										blt.s   loc_2A86
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										lea     (FF2000_LOADING_SPACE).l,a1
										bsr.w   LoadTileData    
loc_2A86:
										movem.l (sp)+,d0-d1/a0-a1/a5
										rts

	; End of function LoadMapTilesets


; =============== S U B R O U T I N E =======================================

; loads all map properties (map coords, entities, etc.)

LoadMap:
										move.l  ((word_FFA818-$1000000)).w,((word_FFA810-$1000000)).w
										move.l  ((word_FFA81C-$1000000)).w,((word_FFA814-$1000000)).w
										clr.l   ((word_FFA820-$1000000)).w
										clr.l   ((word_FFA824-$1000000)).w
										clr.b   ((CAMERA_SCROLLING_MASK-$1000000)).w
										move.w  d0,-(sp)
										move.w  d1,-(sp)
										bsr.w   InitDisplay     
										move.w  (sp)+,d1
										ext.w   d1
										bpl.s   loc_2ACC
										clr.w   d1
										move.b  ((CURRENT_MAP-$1000000)).w,d1
										movea.l (p_pt_MapData).l,a5
										lsl.w   #2,d1
										movea.l (a5,d1.w),a5
										lea     $E(a5),a5       ; get address 02 - map properties
										bra.w   loc_2B80        
loc_2ACC:
										clr.w   ((word_FFAF42-$1000000)).w
										move.b  d1,((CURRENT_MAP-$1000000)).w
loc_2AD4:
										movea.l (p_pt_MapData).l,a5
										lsl.w   #2,d1
										movea.l (a5,d1.w),a5
										movea.l (p_pt_MapPalettes).l,a0
										clr.w   d0
										move.b  (a5)+,d0
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										lea     (PALETTE_1_BIS).l,a1
										move.w  #$20,d7 
										bsr.w   CopyBytes       
										clr.w   (PALETTE_1_BIS).l
										tst.b   (a5)+
										blt.s   loc_2B1C
loc_2B08:
										lea     (byte_FF3000).l,a0
										lea     ($2000).w,a1
loc_2B12:
										move.w  #$800,d0
										moveq   #2,d1
										bsr.w   sub_10DC        
loc_2B1C:
										tst.b   (a5)+
										blt.s   loc_2B34
loc_2B20:
										lea     (FF6802_LOADING_SPACE).l,a0
										lea     ($3000).w,a1
										move.w  #$800,d0
										moveq   #2,d1
										bsr.w   sub_10DC        
loc_2B34:
										tst.b   (a5)+
										blt.s   loc_2B4C
										lea     (RAM_START).l,a0; something to do with tile pixel data
										lea     ($4000).w,a1
										move.w  #$800,d0
										moveq   #2,d1
loc_2B48:
										bsr.w   sub_10DC        
loc_2B4C:
										tst.b   (a5)+
										blt.s   loc_2B64
										lea     (byte_FF1000).l,a0
loc_2B56:
										lea     ($5000).w,a1
										move.w  #$800,d0
										moveq   #2,d1
loc_2B60:
										bsr.w   sub_10DC        
loc_2B64:
										tst.b   (a5)+
										blt.s   loc_2B7C
loc_2B68:
										lea     (FF2000_LOADING_SPACE).l,a0
										lea     ($6000).w,a1
										move.w  #$800,d0
										moveq   #2,d1
										bsr.w   sub_10DC        
loc_2B7C:
										bsr.w   sub_2D58
loc_2B80:
										movea.l (a5)+,a4        ; move map properties address to A4
loc_2B82:
										move.w  (a4)+,d0
										bpl.s   loc_2BA6
										movea.l -4(a5),a4
										move.w  (a4)+,d0
										move.w  (a4)+,d1
										move.w  (a4)+,d2
										move.w  (a4)+,d3
loc_2B92:
										mulu.w  #$180,d0
										mulu.w  #$180,d1
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										bra.w   loc_2C14
loc_2BA6:
										move.w  (a4)+,d1
										move.w  (a4)+,d2
										move.w  (a4)+,d3
										mulu.w  #$180,d0
loc_2BB0:
										mulu.w  #$180,d1
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										move.w  (sp)+,d4
										move.w  d4,-(sp)
loc_2BC0:
										cmpi.w  #$FFFF,d4
										bne.s   loc_2BE6
										move.l  a0,-(sp)
										move.b  ((BATTLE_CURRENT_ENTITY-$1000000)).w,d4
										bpl.s   loc_2BD0
										clr.w   d4
loc_2BD0:
										andi.w  #$3F,d4 
										lsl.w   #5,d4
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										move.w  2(a0,d4.w),d5
										move.w  (a0,d4.w),d4
										movea.l (sp)+,a0
										bra.s   loc_2BF0
loc_2BE6:
										clr.w   d5
										move.b  d4,d5
										lsr.w   #8,d4
										lsl.w   #7,d4
										lsl.w   #7,d5
loc_2BF0:
										cmp.w   d0,d4
										blt.w   loc_2C0C
										cmp.w   d1,d5
										blt.w   loc_2C0C
										cmp.w   d2,d4
										bgt.w   loc_2C0C
										cmp.w   d3,d5
										bgt.w   loc_2C0C
										bra.w   loc_2C14
loc_2C0C:
										lea     $16(a4),a4
										bra.w   loc_2B82
loc_2C14:
										bsr.w   LoadMapArea
										move.w  (sp)+,d0
loc_2C1A:
										cmpi.w  #$FFFF,d0
										bne.s   loc_2C70
										move.w  d4,d0
										move.w  d5,d1
										move.w  d0,d2
										move.w  d1,d3
										subi.w  #$780,d0
loc_2C2C:
										subi.w  #$780,d1
										addi.w  #$780,d2
										addi.w  #$600,d3
										cmp.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
										bge.s   loc_2C42
										move.w  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d0
loc_2C42:
										cmp.w   ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d2
										ble.s   loc_2C50
loc_2C48:
										move.w  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d0
										subi.w  #$F00,d0
loc_2C50:
										cmp.w   ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d1
										bge.s   loc_2C5A
										move.w  ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d1
loc_2C5A:
										cmp.w   ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d3
										ble.s   loc_2C68
										move.w  ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d1
loc_2C64:
										subi.w  #$D80,d1
loc_2C68:
										lsr.w   #7,d0
										lsr.w   #7,d1
										lsl.w   #8,d0
										or.w    d1,d0
loc_2C70:
										clr.w   d1
										move.b  d0,d1
										lsr.w   #8,d0
										move.w  d0,d2
										move.w  d1,d3
										move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d4
										move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d5
										move.w  ((MAP_AREA_BACKGROUND_STARTX-$1000000)).w,d6
										move.w  ((MAP_AREA_BACKGROUND_STARTY-$1000000)).w,d7
										lsl.w   #7,d0
										lsl.w   #7,d1
										lsl.w   #7,d2
										lsl.w   #7,d3
										lsl.w   #7,d4
										lsl.w   #7,d5
										lsl.w   #7,d6
										lsl.w   #7,d7
loc_2C9A:
										mulu.w  ((MAP_AREA_LAYER1_PARALLAX_X-$1000000)).w,d0
										lsr.l   #8,d0
										mulu.w  ((MAP_AREA_LAYER1_PARALLAX_Y-$1000000)).w,d1
										lsr.l   #8,d1
										mulu.w  ((MAP_AREA_LAYER2_PARALLAX_X-$1000000)).w,d2
										lsr.l   #8,d2
										mulu.w  ((MAP_AREA_LAYER2_PARALLAX_Y-$1000000)).w,d3
										lsr.l   #8,d3
										add.w   d4,d0
										move.w  d0,((word_FFA810-$1000000)).w
										add.w   d5,d1
										move.w  d1,((word_FFA812-$1000000)).w
										add.w   d6,d2
										move.w  d2,((word_FFA814-$1000000)).w
										add.w   d7,d3
										move.w  d3,((word_FFA816-$1000000)).w
										bsr.w   sub_38C0
										tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
										beq.s   loc_2CD8
										move.w  d0,((word_FFA810-$1000000)).w
loc_2CD8:
										tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
										beq.s   loc_2CE2
										move.w  d1,((word_FFA812-$1000000)).w
loc_2CE2:
										tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
										beq.s   loc_2CEC
										move.w  d0,((word_FFA814-$1000000)).w
loc_2CEC:
										tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
										beq.s   loc_2CF6
										move.w  d1,((word_FFA816-$1000000)).w
loc_2CF6:
										move.w  ((word_FFA810-$1000000)).w,d0
										lsr.w   #4,d0
										neg.w   d0
										andi.w  #$FF,d0
										move.w  d0,((word_FFA804-$1000000)).w
										move.w  ((word_FFA812-$1000000)).w,d1
										lsr.w   #4,d1
										addq.w  #8,d1
										andi.w  #$FF,d1
										move.w  d1,((word_FFA808-$1000000)).w
										move.w  ((word_FFA814-$1000000)).w,d2
										lsr.w   #4,d2
										neg.w   d2
										andi.w  #$FF,d2
										move.w  d2,((word_FFA806-$1000000)).w
										move.w  ((word_FFA816-$1000000)).w,d3
										lsr.w   #4,d3
										addq.w  #8,d3
										andi.w  #$FF,d3
										move.w  d3,((word_FFA80A-$1000000)).w
										bsr.w   EnableDisplayAndInterrupts
										bsr.w   StoreVdpCommands
										bsr.w   StoreVdpCommandsbis
										bsr.w   InitWindowProperties
										bsr.w   ToggleRoofOnMapLoad
										bsr.w   WaitForVInt     
										bsr.w   sub_4344
										bsr.w   sub_43A4
										rts

	; End of function LoadMap


; =============== S U B R O U T I N E =======================================

sub_2D58:
										movea.l (a5)+,a0
										lea     (FF2000_LOADING_SPACE).l,a1
										bsr.w   sub_2372
										movea.l (a5)+,a0
										lea     (RAM_START).l,a1
										bsr.w   LoadMapLayoutData
										movea.l 4(a5),a0
loc_2D74:
										move.w  (a0),d1
										cmpi.w  #$FFFF,d1
										beq.w   loc_2D9C
										jsr     j_CheckFlag
										beq.w   loc_2D98
										move.w  2(a0),d0
										move.w  4(a0),d1
										move.w  6(a0),d2
										bsr.w   sub_3DB0
loc_2D98:
										addq.l  #8,a0
										bra.s   loc_2D74
loc_2D9C:
										lea     (RAM_START).l,a1
										movea.l $14(a5),a0
loc_2DA6:
										cmpi.w  #$FFFF,(a0)
										beq.w   loc_2DD4
										clr.w   d1
										move.b  2(a0),d1
										jsr     j_CheckFlag
										beq.w   loc_2DD0
										clr.w   d0
										move.b  1(a0),d0
										lsl.w   #6,d0
										add.b   (a0),d0
										add.w   d0,d0
										move.w  #$D802,(a1,d0.w)
loc_2DD0:
										addq.l  #4,a0
										bra.s   loc_2DA6
loc_2DD4:
										cmpi.b  #$FF,((CURRENT_BATTLE-$1000000)).w
										beq.s   return_2DEA
loc_2DDC:
										move.w  ((byte_FFF706-$1000000)).w,d0
										move.w  ((byte_FFF708-$1000000)).w,d1
										clr.w   d2
										bsr.w   sub_3DB0
return_2DEA:
										
										rts

	; End of function sub_2D58


; =============== S U B R O U T I N E =======================================

LoadMapArea:
										
										cmpi.b  #$FF,((CURRENT_BATTLE-$1000000)).w
										bne.s   loc_2E06
										move.w  d0,((MAP_AREA_LAYER1_STARTX-$1000000)).w
										move.w  d1,((MAP_AREA_LAYER1_STARTY-$1000000)).w
										move.w  d2,((MAP_AREA_LAYER1_ENDX-$1000000)).w
										move.w  d3,((MAP_AREA_LAYER1_ENDY-$1000000)).w
										bra.s   loc_2E2C
loc_2E06:
										move.w  ((byte_FFF708-$1000000)).w,d0
										clr.w   d1
										move.b  d0,d1
										subq.w  #1,d1
										mulu.w  #$180,d1
										lsr.w   #8,d0
										subq.w  #1,d0
										mulu.w  #$180,d0
										clr.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w
										clr.w   ((MAP_AREA_LAYER1_STARTY-$1000000)).w
										move.w  d0,((MAP_AREA_LAYER1_ENDX-$1000000)).w
										move.w  d1,((MAP_AREA_LAYER1_ENDY-$1000000)).w
loc_2E2C:
										move.w  (a4)+,d0
										mulu.w  #3,d0
										move.w  d0,((MAP_AREA_LAYER2_STARTX-$1000000)).w
										move.w  (a4)+,d0
loc_2E38:
										mulu.w  #3,d0
										move.w  d0,((MAP_AREA_LAYER2_STARTY-$1000000)).w
										move.w  (a4)+,d0
										mulu.w  #3,d0
										move.w  d0,((MAP_AREA_BACKGROUND_STARTX-$1000000)).w
										move.w  (a4)+,d0
loc_2E4C:
										mulu.w  #3,d0
										move.w  d0,((MAP_AREA_BACKGROUND_STARTY-$1000000)).w
										move.w  (a4)+,((MAP_AREA_LAYER1_PARALLAX_X-$1000000)).w
										move.w  (a4)+,((MAP_AREA_LAYER1_PARALLAX_Y-$1000000)).w
										move.w  (a4)+,((MAP_AREA_LAYER2_PARALLAX_X-$1000000)).w
loc_2E60:
										move.w  (a4)+,((MAP_AREA_LAYER2_PARALLAX_Y-$1000000)).w
										move.l  (a4)+,((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
										move.b  (a4)+,((MAP_AREA_PROP_1C-$1000000)).w
loc_2E6C:
										move.b  (a4)+,((MAP_AREA_MUSIC_INDEX-$1000000)).w
										movea.l (a5),a4
										move.w  #1,((TILE_ANIM_COUNTER-$1000000)).w
										move.l  $18(a5),((TILE_ANIM_DATA_ADDR-$1000000)).w
										blt.s   return_2EBE
loc_2E80:
										movea.l ((TILE_ANIM_DATA_ADDR-$1000000)).w,a1
										move.w  (a1)+,d0
										movea.l (p_pt_MapTiles).l,a0
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										move.l  a1,-(sp)
loc_2E94:
										lea     (FF6802_LOADING_SPACE).l,a1
										bsr.w   LoadTileData    
										movea.l (sp)+,a1
										move.w  (a1)+,d7
										lea     (FF6802_LOADING_SPACE).l,a0
loc_2EA8:
										lea     (byte_FF9B04).l,a1
										lsl.w   #5,d7
										bsr.w   CopyBytes       
										addq.l  #4,((TILE_ANIM_DATA_ADDR-$1000000)).w
										move.b  ((CURRENT_MAP-$1000000)).w,((TILE_ANIM_MAP_INDEX-$1000000)).w
return_2EBE:
										
										rts

	; End of function LoadMapArea


; =============== S U B R O U T I N E =======================================

sub_2EC0:
										move.w  #$20,d6 
										bsr.w   UpdateRandomSeed
										move.w  d7,d0
										move.w  #4,d6
										bsr.w   UpdateRandomSeed
										move.w  d7,d1
										addi.w  #$1C,d1
										move.w  #$10,d6
										bsr.w   UpdateRandomSeed
										move.w  d7,d2
										move.w  #4,d6
										bsr.w   UpdateRandomSeed
										move.w  d7,d3
										move.w  #4,d4
loc_2EF0:
										move.w  #4,d5
										move.w  #4,d6
										move.w  #4,d7
										bsr.w   sub_36B2
										bsr.w   WaitForVInt     
loc_2F04:
										move.w  #$8721,d0
loc_2F08:
										bsr.w   SetVdpReg       
										move.w  #$8700,d0
										bsr.w   SetVdpReg       
										bsr.w   WaitForVInt     
										bsr.w   sub_2F24
										tst.b   ((CAMERA_SCROLLING_MASK-$1000000)).w
										bne.s   loc_2F04
										rts

	; End of function sub_2EC0


; =============== S U B R O U T I N E =======================================

sub_2F24:
										move.w  d0,-(sp)
										move.w  ((word_FFA820-$1000000)).w,d0
										addq.w  #1,d0
										cmpi.w  #$80,d0 
										bgt.s   loc_2F36
										move.w  d0,((word_FFA820-$1000000)).w
loc_2F36:
										move.w  ((word_FFA822-$1000000)).w,d0
										addq.w  #1,d0
										cmpi.w  #$80,d0 
										bgt.s   loc_2F46
										move.w  d0,((word_FFA822-$1000000)).w
loc_2F46:
										move.w  ((word_FFA824-$1000000)).w,d0
										addq.w  #1,d0
										cmpi.w  #$80,d0 
										bgt.s   loc_2F56
										move.w  d0,((word_FFA824-$1000000)).w
loc_2F56:
										move.w  ((word_FFA826-$1000000)).w,d0
										addq.w  #1,d0
										cmpi.w  #$80,d0 
										bgt.s   loc_2F66
										move.w  d0,((word_FFA826-$1000000)).w
loc_2F66:
										move.w  (sp)+,d0
										rts

	; End of function sub_2F24

BlackScreenLayout:  dcb.b $80,$22
MaskSprites:        dc.l $800301
										dc.l $C77C0080
dword_2FF2:         dc.l $A00302
										dc.l $C77C0080
										dc.l $C00303
dword_2FFE:         dc.l $C77C0080
										dc.l $E00304
										dc.l $C77C0080
dword_300A:         dc.l $1000305
										dc.l $C77C0080
										dc.l $1200306
										dc.l $C77C0080
										dc.l $1400307
										dc.l $C77C0080

; =============== S U B R O U T I N E =======================================

; or something like that ?

InitDisplay:
										
										trap    #VINT_FUNCTIONS
										dc.w VINTS_DEACTIVATE   ; clear all triggers
										dc.l 0
										bsr.w   WaitForVInt     
										bsr.w   DisableDisplayAndVInt
										bsr.w   ClearSpriteTable
										move.w  #$8C00,d0       ; H32 cell mode, no interlace
										bsr.w   SetVdpReg       
										move.w  #$9000,d0       ; scroll size : V32 cell, H32 cell
										bsr.w   SetVdpReg       
										move.w  #$8230,d0       ; scroll A table VRAM address : C000
										bsr.w   SetVdpReg       
										move.w  #$8407,d0       ; scroll B table VRAM address : E000
										bsr.w   SetVdpReg       
										move.w  #$8B00,d0       ; disable external interrupt, full scrolls
										bsr.w   SetVdpReg       
										move.w  #$8D3B,d0       ; H Scroll table VRAM address : EC00
										bsr.w   SetVdpReg       
										lea     BlackScreenLayout(pc), a0
																						; it's actually filled with character '"' <_< ...
										lea     ($EF80).l,a1
										move.w  #$40,d0 
										moveq   #2,d1
										bsr.w   sub_10DC        
										lea     MaskSprites(pc), a0
loc_307E:
										lea     (SPRITE_Y).l,a1 
										moveq   #$38,d7 
										bsr.w   CopyBytes       
										lea     plt_DisplayInit(pc), a0
										lea     (PALETTE3_BIS).l,a1
										move.w  #$20,d7 
										bsr.w   CopyBytes       
										rts

	; End of function InitDisplay

plt_DisplayInit:    incbin "graphics/technical/displayinitpalette.bin"
																						; Palette for UI/Sprites

; =============== S U B R O U T I N E =======================================

sub_30BE:
										lea     (byte_FFC000).l,a0
										lea     ($C000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										bsr.w   sub_119E        
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
loc_30E6:
										bsr.w   sub_119E        
										bra.w   SetFFDE94b3andWait

	; End of function sub_30BE


; =============== S U B R O U T I N E =======================================

sub_30EE:
										movem.l a0-a5,-(sp)
										movem.w d0-d5/d7,-(sp)
										neg.w   d2
										andi.w  #$FF,d2
										lsr.w   #3,d2
										add.w   d2,d2
										subq.w  #8,d3
										andi.w  #$FF,d3
										lsr.w   #3,d3
										add.w   d5,d3
										add.w   d3,d3
										lsl.w   #5,d3
										andi.w  #$7FE,d3
										adda.w  d3,a1
										move.w  d2,d3
										moveq   #$20,d7 
										lsr.w   #3,d0
										lsr.w   #3,d1
										lea     MapOffsetHashTable(pc), a3
										lea     (RAM_START).l,a4
										lea     (FF2000_LOADING_SPACE).l,a5
loc_312C:
										bsr.w   sub_364E
										move.w  d2,(a1,d3.w)
										addq.w  #2,d3
										bclr    #6,d3
										addq.w  #1,d0
										dbf     d7,loc_312C
										movea.l a1,a0
										moveq   #$20,d0 
										moveq   #2,d1
										bsr.w   sub_119E        
										bsr.w   Set_FFDE94_bit3 
										movem.w (sp)+,d0-d5/d7
										movem.l (sp)+,a0-a5
										rts

	; End of function sub_30EE


; =============== S U B R O U T I N E =======================================

sub_3158:
										movem.l a0-a5,-(sp)
										movem.w d0-d5/d7,-(sp)
										neg.w   d2
										andi.w  #$FF,d2
										lsr.w   #3,d2
										add.w   d4,d2
										add.w   d2,d2
										andi.w  #$3E,d2 
										adda.w  d2,a1
										subq.w  #8,d3
										andi.w  #$FF,d3
										lsr.w   #3,d3
										add.w   d3,d3
										move.w  d3,d5
										lsl.w   #5,d3
										moveq   #$20,d7 
										lsr.w   #3,d0
										lsr.w   #3,d1
										lea     MapOffsetHashTable(pc), a3
										lea     (RAM_START).l,a4
										lea     (FF2000_LOADING_SPACE).l,a5
loc_3196:
										bsr.w   sub_364E
										move.w  d2,(a1,d3.w)
										addi.w  #$40,d3 
										bclr    #$B,d3
										move.w  d2,(a2,d5.w)
										addq.w  #2,d5
										bclr    #6,d5
										addq.w  #1,d1
										dbf     d7,loc_3196
										movea.l a2,a0
										moveq   #$20,d0 
										moveq   #$40,d1 
										bsr.w   sub_119E        
										bsr.w   Set_FFDE94_bit3 
										movem.w (sp)+,d0-d5/d7
										movem.l (sp)+,a0-a5
										rts

	; End of function sub_3158

MapOffsetHashTable: incbin "maps/global/mapoffsethashtable.bin"

; =============== S U B R O U T I N E =======================================

sub_364E:
										movem.w d0-d1/d3-d4/d6,-(sp)
										add.w   d0,d0
										clr.w   d2
										move.b  1(a3,d0.w),d2
										move.b  (a3,d0.w),d0
										ext.w   d0
										add.w   d1,d1
										clr.w   d3
										move.b  1(a3,d1.w),d3
										move.b  (a3,d1.w),d1
										ext.w   d1
										lsl.w   #6,d1
										add.w   d1,d0
										add.w   d0,d0
										move.w  d3,d4
										add.w   d3,d3
										add.w   d4,d3
										add.w   d3,d2
										add.w   d2,d2
										move.w  (a4,d0.w),d0
										cmpi.w  #$C000,d0
										bcs.s   loc_368C
										clr.w   d6
										bra.s   loc_3690
loc_368C:
										move.w  ((word_FFA80E-$1000000)).w,d6
loc_3690:
										andi.w  #$3FF,d0
										add.w   d0,d0
										move.w  d0,d1
										lsl.w   #3,d0
										add.w   d1,d0
										add.w   d0,d2
										move.w  (a5,d2.w),d2
										or.w    d6,d2
										movem.w (sp)+,d0-d1/d3-d4/d6
										rts

	; End of function sub_364E


; =============== S U B R O U T I N E =======================================

SetCameraDest:
										
										movem.w d0-d7,-(sp)
										bra.w   loc_36BE

	; End of function SetCameraDest


; =============== S U B R O U T I N E =======================================

sub_36B2:
										movem.w d0-d7,-(sp)
										lsl.w   #7,d0
										lsl.w   #7,d1
										lsl.w   #7,d2
										lsl.w   #7,d3
loc_36BE:
										move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d4
										move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d5
										move.w  ((MAP_AREA_BACKGROUND_STARTX-$1000000)).w,d6
										move.w  ((MAP_AREA_BACKGROUND_STARTY-$1000000)).w,d7
										lsl.w   #7,d4
										lsl.w   #7,d5
										lsl.w   #7,d6
										lsl.w   #7,d7
										mulu.w  ((MAP_AREA_LAYER1_PARALLAX_X-$1000000)).w,d0
										lsr.l   #8,d0
										mulu.w  ((MAP_AREA_LAYER1_PARALLAX_Y-$1000000)).w,d1
										lsr.l   #8,d1
										mulu.w  ((MAP_AREA_LAYER2_PARALLAX_X-$1000000)).w,d2
										lsr.l   #8,d2
										mulu.w  ((MAP_AREA_LAYER2_PARALLAX_Y-$1000000)).w,d3
										lsr.l   #8,d3
										add.w   d4,d0
										add.w   d5,d1
										add.w   d6,d2
										add.w   d7,d3
										tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
										bne.s   loc_3702
										move.w  d0,((word_FFA818-$1000000)).w
										bra.s   loc_3706
loc_3702:
										move.w  ((word_FFA810-$1000000)).w,d0
loc_3706:
										tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
										bne.s   loc_3712
										move.w  d1,((word_FFA81A-$1000000)).w
										bra.s   loc_3716
loc_3712:
										move.w  ((word_FFA812-$1000000)).w,d1
loc_3716:
										tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
										bne.s   loc_3722
										move.w  d2,((word_FFA81C-$1000000)).w
										bra.s   loc_3726
loc_3722:
										move.w  ((word_FFA814-$1000000)).w,d2
loc_3726:
										tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
										bne.s   loc_3732
										move.w  d3,((word_FFA81E-$1000000)).w
										bra.s   loc_3736
loc_3732:
										move.w  ((word_FFA816-$1000000)).w,d3
loc_3736:
										lea     (byte_FF9A04).l,a2
										bsr.w   sub_3758
										bsr.w   sub_37B2
										lea     (byte_FF9A84).l,a2
										bsr.w   sub_380C
										bsr.w   sub_3866
										movem.w (sp)+,d0-d7
										rts

	; End of function sub_36B2


; =============== S U B R O U T I N E =======================================

sub_3758:
										clr.w   ((word_FFA80E-$1000000)).w
										cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										beq.s   loc_3770
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										beq.s   loc_3770
loc_376A:
										move.w  #$2000,((word_FFA80E-$1000000)).w
loc_3770:
										move.w  ((word_FFA810-$1000000)).w,d4
										cmp.w   d0,d4
										beq.s   return_37B0
										bset    #3,((CAMERA_SCROLLING_MASK-$1000000)).w
										cmp.w   d0,d4
										bge.s   return_37B0
										movem.w d0-d3,-(sp)
										clr.w   d4
										clr.w   d5
										move.w  ((word_FFA810-$1000000)).w,d0
										asr.w   #4,d0
										move.w  ((word_FFA812-$1000000)).w,d1
										asr.w   #4,d1
										addi.w  #$100,d0
										move.w  ((word_FFA804-$1000000)).w,d2
										move.w  ((word_FFA808-$1000000)).w,d3
										lea     (byte_FFC000).l,a1
loc_37A8:
										bsr.w   sub_3158
										movem.w (sp)+,d0-d3
return_37B0:
										
										rts

	; End of function sub_3758


; =============== S U B R O U T I N E =======================================

sub_37B2:
										clr.w   ((word_FFA80E-$1000000)).w
										cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										beq.s   loc_37CA
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										beq.s   loc_37CA
										move.w  #$2000,((word_FFA80E-$1000000)).w
loc_37CA:
										move.w  ((word_FFA812-$1000000)).w,d4
										cmp.w   d1,d4
										beq.s   return_380A
										bset    #2,((CAMERA_SCROLLING_MASK-$1000000)).w
										cmp.w   d1,d4
										bge.s   return_380A
										movem.w d0-d3,-(sp)
										clr.w   d4
										clr.w   d5
loc_37E4:
										move.w  ((word_FFA810-$1000000)).w,d0
										asr.w   #4,d0
loc_37EA:
										move.w  ((word_FFA812-$1000000)).w,d1
										asr.w   #4,d1
loc_37F0:
										addi.w  #$100,d1
										move.w  ((word_FFA804-$1000000)).w,d2
										move.w  ((word_FFA808-$1000000)).w,d3
loc_37FC:
										lea     (byte_FFC000).l,a1
										bsr.w   sub_30EE
										movem.w (sp)+,d0-d3
return_380A:
										
										rts

	; End of function sub_37B2


; =============== S U B R O U T I N E =======================================

sub_380C:
										clr.w   ((word_FFA80E-$1000000)).w
loc_3810:
										cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										beq.s   loc_3824
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										bne.s   loc_3824
										move.w  #$2000,((word_FFA80E-$1000000)).w
loc_3824:
										move.w  ((word_FFA814-$1000000)).w,d4
										cmp.w   d2,d4
										beq.s   return_3864
										bset    #1,((CAMERA_SCROLLING_MASK-$1000000)).w
										cmp.w   d2,d4
										bge.s   return_3864
										movem.w d0-d3,-(sp)
										clr.w   d4
										clr.w   d5
										move.w  ((word_FFA814-$1000000)).w,d0
										asr.w   #4,d0
										move.w  ((word_FFA816-$1000000)).w,d1
										asr.w   #4,d1
										addi.w  #$100,d0
loc_384E:
										move.w  ((word_FFA806-$1000000)).w,d2
										move.w  ((word_FFA80A-$1000000)).w,d3
										lea     (byte_FFE000).l,a1
										bsr.w   sub_3158
										movem.w (sp)+,d0-d3
return_3864:
										
										rts

	; End of function sub_380C


; =============== S U B R O U T I N E =======================================

sub_3866:
										clr.w   ((word_FFA80E-$1000000)).w
										cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										beq.s   loc_387E
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										bne.s   loc_387E
										move.w  #$2000,((word_FFA80E-$1000000)).w
loc_387E:
										move.w  ((word_FFA816-$1000000)).w,d4
										cmp.w   d3,d4
										beq.s   return_38BE
										bset    #0,((CAMERA_SCROLLING_MASK-$1000000)).w
										cmp.w   d3,d4
										bge.s   return_38BE
										movem.w d0-d3,-(sp)
										clr.w   d4
										clr.w   d5
										move.w  ((word_FFA814-$1000000)).w,d0
										asr.w   #4,d0
loc_389E:
										move.w  ((word_FFA816-$1000000)).w,d1
										asr.w   #4,d1
										addi.w  #$100,d1
										move.w  ((word_FFA806-$1000000)).w,d2
										move.w  ((word_FFA80A-$1000000)).w,d3
										lea     (byte_FFE000).l,a1
										bsr.w   sub_30EE
										movem.w (sp)+,d0-d3
return_38BE:
										
										rts

	; End of function sub_3866


; =============== S U B R O U T I N E =======================================

sub_38C0:
										movem.l d2-d3/a0,-(sp)
										clr.w   d2
										move.b  ((BATTLE_CURRENT_ENTITY-$1000000)).w,d2
										bpl.s   loc_38E6
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										bne.s   loc_38DC
loc_38D2:
										move.w  ((word_FFA810-$1000000)).w,d0
										move.w  ((word_FFA812-$1000000)).w,d1
										bra.s   loc_38E4
loc_38DC:
										move.w  ((word_FFA814-$1000000)).w,d0
										move.w  ((word_FFA816-$1000000)).w,d1
loc_38E4:
										bra.s   loc_392A
loc_38E6:
										lsl.w   #5,d2
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										adda.w  d2,a0
										move.w  (a0)+,d2
										move.w  (a0)+,d3
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										bne.s   loc_390A
										sub.w   ((word_FFA814-$1000000)).w,d2
										sub.w   ((word_FFA816-$1000000)).w,d3
loc_3900:
										move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d0
										move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d1
										bra.s   loc_391A
loc_390A:
										sub.w   ((word_FFA810-$1000000)).w,d2
										sub.w   ((word_FFA812-$1000000)).w,d3
										move.w  ((MAP_AREA_BACKGROUND_STARTX-$1000000)).w,d0
										move.w  ((MAP_AREA_BACKGROUND_STARTY-$1000000)).w,d1
loc_391A:
										lsl.w   #7,d0
										lsl.w   #7,d1
										addi.w  #$D80,d0
										addi.w  #$D80,d1
										sub.w   d2,d0
										sub.w   d3,d1
loc_392A:
										movem.l (sp)+,d2-d3/a0
										rts

	; End of function sub_38C0


; =============== S U B R O U T I N E =======================================

; Related to camera position ?

VInt_3930:
										
										link    a6,#-2
										move.b  ((CAMERA_SCROLLING_MASK-$1000000)).w,d0
										andi.b  #$C,d0
										beq.s   loc_3944
										move.b  #$FF,((DISPLAY_WINDOWS_TOGGLE-$1000000)).w
loc_3944:
										tst.b   ((CAMERA_SCROLLING_MASK-$1000000)).w
										beq.w   loc_3C44
										movem.w d0-d7,-(sp)
										clr.w   ((word_FFA80E-$1000000)).w
										cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										beq.s   loc_3968
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										beq.s   loc_3968
loc_3962:
										move.w  #$2000,((word_FFA80E-$1000000)).w
loc_3968:
										btst    #3,((CAMERA_SCROLLING_MASK-$1000000)).w
										beq.w   loc_3A1A
										move.w  ((word_FFA810-$1000000)).w,d0
										move.w  d0,d5
										move.w  d0,d7
										move.w  ((word_FFA818-$1000000)).w,d1
										move.w  ((word_FFA820-$1000000)).w,d2
										sub.w   d1,d5
										move.w  d5,-2(a6)
										bge.s   loc_3998
										add.w   d2,d0
										move.w  #$100,d6
										move.w  #1,d4
										clr.w   d5
										bra.s   loc_39A2
loc_3998:
										sub.w   d2,d0
										move.w  #8,d6
										clr.w   d4
										clr.w   d5
loc_39A2:
										eor.w   d0,d7
										btst    #7,d7
										beq.s   loc_39D4
										movem.w d0-d1,-(sp)
										asr.w   #4,d0
										move.w  ((word_FFA812-$1000000)).w,d1
										asr.w   #4,d1
										add.w   d6,d0
										move.w  ((word_FFA804-$1000000)).w,d2
										move.w  ((word_FFA808-$1000000)).w,d3
										lea     (byte_FFC000).l,a1
										lea     (byte_FF9A04).l,a2
										bsr.w   sub_3158
										movem.w (sp)+,d0-d1
loc_39D4:
										move.w  -2(a6),d5
										move.w  d0,d4
										sub.w   d1,d4
										bne.s   loc_39E6
										move.w  d1,d0
										bclr    #3,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_39E6:
										eor.w   d5,d4
										bge.s   loc_39F2
										move.w  d1,d0
										bclr    #3,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_39F2:
										tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
										beq.s   loc_3A0A
										tst.w   d0
										bge.s   loc_3A00
										addi.w  #$6000,d0
loc_3A00:
										cmpi.w  #$6000,d0
										blt.s   loc_3A0A
										subi.w  #$6000,d0
loc_3A0A:
										move.w  d0,((word_FFA810-$1000000)).w
										lsr.w   #4,d0
										neg.w   d0
										andi.w  #$FF,d0
										move.w  d0,((word_FFA804-$1000000)).w
loc_3A1A:
										btst    #2,((CAMERA_SCROLLING_MASK-$1000000)).w
										beq.w   loc_3AC8
										move.w  ((word_FFA812-$1000000)).w,d0
										move.w  d0,d5
										move.w  d0,d7
										move.w  ((word_FFA81A-$1000000)).w,d1
										move.w  ((word_FFA822-$1000000)).w,d2
										sub.w   d1,d5
										move.w  d5,-2(a6)
										bge.s   loc_3A4A
										add.w   d2,d0
										move.w  #$100,d6
										clr.w   d4
										move.w  #1,d5
										bra.s   loc_3A54
loc_3A4A:
										sub.w   d2,d0
										move.w  #8,d6
										clr.w   d4
										clr.w   d5
loc_3A54:
										eor.w   d0,d7
										btst    #7,d7
										beq.s   loc_3A82
										movem.w d0-d1,-(sp)
										asr.w   #4,d0
										move.w  d0,d1
										move.w  ((word_FFA810-$1000000)).w,d0
										asr.w   #4,d0
										add.w   d6,d1
										move.w  ((word_FFA804-$1000000)).w,d2
										move.w  ((word_FFA808-$1000000)).w,d3
										lea     (byte_FFC000).l,a1
										bsr.w   sub_30EE
										movem.w (sp)+,d0-d1
loc_3A82:
										move.w  -2(a6),d5
										move.w  d0,d4
										sub.w   d1,d4
										bne.s   loc_3A94
										move.w  d1,d0
										bclr    #2,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3A94:
										eor.w   d5,d4
										bge.s   loc_3AA0
										move.w  d1,d0
										bclr    #2,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3AA0:
										tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
										beq.s   loc_3AB8
										tst.w   d0
										bge.s   loc_3AAE
										addi.w  #$6000,d0
loc_3AAE:
										cmpi.w  #$6000,d0
										blt.s   loc_3AB8
										subi.w  #$6000,d0
loc_3AB8:
										move.w  d0,((word_FFA812-$1000000)).w
										lsr.w   #4,d0
										addq.w  #8,d0
										andi.w  #$FF,d0
										move.w  d0,((word_FFA808-$1000000)).w
loc_3AC8:
										clr.w   ((word_FFA80E-$1000000)).w
										cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										beq.s   loc_3AE0
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										bne.s   loc_3AE0
										move.w  #$2000,((word_FFA80E-$1000000)).w
loc_3AE0:
										btst    #1,((CAMERA_SCROLLING_MASK-$1000000)).w
										beq.w   loc_3B92
										move.w  ((word_FFA814-$1000000)).w,d0
										move.w  d0,d5
										move.w  d0,d7
										move.w  ((word_FFA81C-$1000000)).w,d1
										move.w  ((word_FFA824-$1000000)).w,d2
										sub.w   d1,d5
										move.w  d5,-2(a6)
										bge.s   loc_3B10
										add.w   d2,d0
										move.w  #$100,d6
										move.w  #1,d4
										clr.w   d5
										bra.s   loc_3B1A
loc_3B10:
										sub.w   d2,d0
										move.w  #8,d6
										clr.w   d4
										clr.w   d5
loc_3B1A:
										eor.w   d0,d7
										btst    #7,d7
										beq.s   loc_3B4C
										movem.w d0-d1,-(sp)
										asr.w   #4,d0
										move.w  ((word_FFA816-$1000000)).w,d1
										asr.w   #4,d1
										add.w   d6,d0
										move.w  ((word_FFA806-$1000000)).w,d2
										move.w  ((word_FFA80A-$1000000)).w,d3
										lea     (byte_FFE000).l,a1
										lea     (byte_FF9A84).l,a2
										bsr.w   sub_3158
										movem.w (sp)+,d0-d1
loc_3B4C:
										move.w  -2(a6),d5
										move.w  d0,d4
										sub.w   d1,d4
										bne.s   loc_3B5E
										move.w  d1,d0
										bclr    #1,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3B5E:
										eor.w   d5,d4
										bge.s   loc_3B6A
										move.w  d1,d0
										bclr    #1,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3B6A:
										tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
										beq.s   loc_3B82
										tst.w   d0
										bge.s   loc_3B78
										addi.w  #$6000,d0
loc_3B78:
										cmpi.w  #$6000,d0
										blt.s   loc_3B82
										subi.w  #$6000,d0
loc_3B82:
										move.w  d0,((word_FFA814-$1000000)).w
										lsr.w   #4,d0
										neg.w   d0
										andi.w  #$FF,d0
										move.w  d0,((word_FFA806-$1000000)).w
loc_3B92:
										btst    #0,((CAMERA_SCROLLING_MASK-$1000000)).w
										beq.w   loc_3C40
										move.w  ((word_FFA816-$1000000)).w,d0
										move.w  d0,d5
										move.w  d0,d7
										move.w  ((word_FFA81E-$1000000)).w,d1
										move.w  ((word_FFA826-$1000000)).w,d2
										sub.w   d1,d5
										move.w  d5,-2(a6)
										bge.s   loc_3BC2
										add.w   d2,d0
										move.w  #$100,d6
										clr.w   d4
										move.w  #1,d5
										bra.s   loc_3BCC
loc_3BC2:
										sub.w   d2,d0
										move.w  #8,d6
										clr.w   d4
										clr.w   d5
loc_3BCC:
										eor.w   d0,d7
										btst    #7,d7
										beq.s   loc_3BFA
										movem.w d0-d1,-(sp)
										asr.w   #4,d0
										move.w  d0,d1
										move.w  ((word_FFA814-$1000000)).w,d0
										asr.w   #4,d0
										add.w   d6,d1
										move.w  ((word_FFA806-$1000000)).w,d2
										move.w  ((word_FFA80A-$1000000)).w,d3
										lea     (byte_FFE000).l,a1
										bsr.w   sub_30EE
										movem.w (sp)+,d0-d1
loc_3BFA:
										move.w  -2(a6),d5
										move.w  d0,d4
										sub.w   d1,d4
										bne.s   loc_3C0C
										move.w  d1,d0
										bclr    #0,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3C0C:
										eor.w   d5,d4
										bge.s   loc_3C18
										move.w  d1,d0
										bclr    #0,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3C18:
										tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
										beq.s   loc_3C30
										tst.w   d0
										bge.s   loc_3C26
										addi.w  #$6000,d0
loc_3C26:
										cmpi.w  #$6000,d0
										blt.s   loc_3C30
										subi.w  #$6000,d0
loc_3C30:
										move.w  d0,((word_FFA816-$1000000)).w
										lsr.w   #4,d0
										addq.w  #8,d0
										andi.w  #$FF,d0
										move.w  d0,((word_FFA80A-$1000000)).w
loc_3C40:
										movem.w (sp)+,d0-d7
loc_3C44:
										unlk    a6
										move.b  ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w,d0
										beq.s   loc_3C88
										cmpi.b  #$80,d0
										bne.s   loc_3C6C
										bsr.w   sub_38C0
										move.w  #$10,((word_FFA820-$1000000)).w
										move.w  d0,((word_FFA818-$1000000)).w
										lea     (byte_FF9904).l,a2
										bsr.w   sub_3758
										bra.s   loc_3C82
loc_3C6C:
										move.w  ((word_FFA810-$1000000)).w,d1
										ext.w   d0
										add.w   d0,d1
										tst.w   d0
										bpl.s   loc_3C7A
										neg.w   d0
loc_3C7A:
										move.w  d0,((word_FFA820-$1000000)).w
										move.w  d1,((word_FFA818-$1000000)).w
loc_3C82:
										bset    #3,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3C88:
										move.b  ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w,d0
										beq.s   loc_3CC4
										cmpi.b  #$80,d0
										bne.s   loc_3CA8
										bsr.w   sub_38C0
										move.w  #8,((word_FFA822-$1000000)).w
										move.w  d1,((word_FFA81A-$1000000)).w
										bsr.w   sub_37B2
										bra.s   loc_3CBE
loc_3CA8:
										move.w  ((word_FFA812-$1000000)).w,d1
										ext.w   d0
										add.w   d0,d1
										tst.w   d0
										bpl.s   loc_3CB6
										neg.w   d0
loc_3CB6:
										move.w  d0,((word_FFA822-$1000000)).w
										move.w  d1,((word_FFA81A-$1000000)).w
loc_3CBE:
										bset    #2,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3CC4:
										move.b  ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w,d0
										beq.s   loc_3D08
										cmpi.b  #$80,d0
										bne.s   loc_3CEC
										bsr.w   sub_38C0
										move.w  #$10,((word_FFA824-$1000000)).w
										move.w  d0,((word_FFA81C-$1000000)).w
										lea     (byte_FF9984).l,a2
										move.w  d0,d2
										bsr.w   sub_380C
										bra.s   loc_3D02
loc_3CEC:
										move.w  ((word_FFA814-$1000000)).w,d1
										ext.w   d0
										add.w   d0,d1
										tst.w   d0
										bpl.s   loc_3CFA
										neg.w   d0
loc_3CFA:
										move.w  d0,((word_FFA824-$1000000)).w
										move.w  d1,((word_FFA81C-$1000000)).w
loc_3D02:
										bset    #1,((CAMERA_SCROLLING_MASK-$1000000)).w
loc_3D08:
										move.b  ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w,d0
										beq.s   sub_3D46
										cmpi.b  #$80,d0
										bne.s   loc_3D2A
										bsr.w   sub_38C0
										move.w  #$10,((word_FFA826-$1000000)).w
										move.w  d1,((word_FFA81E-$1000000)).w
										move.w  d1,d3
										bsr.w   sub_3866
										bra.s   loc_3D40
loc_3D2A:
										move.w  ((word_FFA816-$1000000)).w,d1
										ext.w   d0
										add.w   d0,d1
										tst.w   d0
										bpl.s   loc_3D38
										neg.w   d0
loc_3D38:
										move.w  d0,((word_FFA826-$1000000)).w
										move.w  d1,((word_FFA81E-$1000000)).w
loc_3D40:
										bset    #0,((CAMERA_SCROLLING_MASK-$1000000)).w

	; End of function VInt_3930


; =============== S U B R O U T I N E =======================================

sub_3D46:
										move.l  ((word_FFA808-$1000000)).w,(word_FFD500).l
										move.l  ((word_FFA804-$1000000)).w,(dword_FFD100).l
										move.w  ((word_FFA80C-$1000000)).w,d6
										beq.s   loc_3D7E
										addq.w  #1,d6
										bsr.w   GetRandomValue
										add.w   d0,(dword_FFD100).l
										add.w   d0,(dword_FFD100+2).l
										bsr.w   GetRandomValue
										add.w   d0,(word_FFD500).l
										add.w   d0,(word_FFD502).l
loc_3D7E:
										bsr.w   StoreVdpCommands
										bsr.w   StoreVdpCommandsbis
										rts

	; End of function sub_3D46


; =============== S U B R O U T I N E =======================================

GetRandomValue:
										
										bsr.w   UpdateRandomSeed
										move.w  d7,d0
										bsr.w   UpdateRandomSeed
										sub.w   d7,d0
										rts

	; End of function GetRandomValue


; =============== S U B R O U T I N E =======================================

sub_3D96:
										bsr.w   sub_3DB0
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										beq.s   loc_3DA8
										bset    #0,((byte_FFA82D-$1000000)).w
										bra.s   return_3DAE
loc_3DA8:
										bset    #1,((byte_FFA82D-$1000000)).w
return_3DAE:
										
										rts

	; End of function sub_3D96


; =============== S U B R O U T I N E =======================================

sub_3DB0:
										movem.l d0-d7/a2,-(sp)
										clr.w   d7
										move.b  d1,d7
										subq.w  #1,d7
										move.w  d1,d6
										lsr.w   #8,d6
										subq.w  #1,d6
										clr.w   d3
										move.b  d2,d3
										lsr.w   #8,d2
										lsl.w   #6,d3
										add.w   d3,d2
										add.w   d2,d2
										clr.w   d1
										move.b  d0,d1
										lsr.w   #8,d0
										lsl.w   #6,d1
										add.w   d1,d0
										add.w   d0,d0
										lea     (RAM_START).l,a2
loc_3DDE:
										movem.w d0/d2/d6,-(sp)
loc_3DE2:
										move.w  (a2,d0.w),(a2,d2.w)
										addq.w  #2,d0
										addq.w  #2,d2
										dbf     d6,loc_3DE2
										movem.w (sp)+,d0/d2/d6
										addi.w  #$80,d0 
										addi.w  #$80,d2 
										dbf     d7,loc_3DDE
										movem.l (sp)+,d0-d7/a2
										rts

	; End of function sub_3DB0


; =============== S U B R O U T I N E =======================================

sub_3E06:
										lea     (RAM_START).l,a2
										move.w  #$7FF,d7
loc_3E10:
										clr.l   (a2)+
										dbf     d7,loc_3E10
										lea     (FF2000_LOADING_SPACE).l,a2
										move.l  #$C0F8C0F8,(a2)+
										move.l  #$C0F8C0F8,(a2)+
										move.l  #$C0F8C0F8,(a2)+
										move.l  #$C0F8C0F8,(a2)+
										move.w  #$C0F8,(a2)+
										clr.w   d0
										moveq   #$FFFFFFFF,d1
										bra.w   LoadMap         

	; End of function sub_3E06


; =============== S U B R O U T I N E =======================================

; uses door open SFX

sub_3E40:
										cmpi.b  #$FF,((CURRENT_BATTLE-$1000000)).w
										bne.w   return_3F22
										movem.w d0-d7,-(sp)
										lsr.w   #7,d0
										lsr.w   #7,d1
										lea     MapOffsetHashTable(pc), a2
										add.w   d0,d0
										move.b  (a2,d0.w),d0
										andi.w  #$3F,d0 
										add.w   d1,d1
										move.b  (a2,d1.w),d1
										andi.w  #$3F,d1 
										clr.w   d7
										move.b  ((CURRENT_MAP-$1000000)).w,d7
										movea.l (p_pt_MapData).l,a2
										lsl.w   #2,d7
										movea.l (a2,d7.w),a2
										movea.l $16(a2),a2
loc_3E80:
										tst.b   (a2)
										bmi.w   loc_3F1E
										cmp.b   (a2),d0
										bne.w   loc_3F24
										cmp.b   1(a2),d1
										bne.w   loc_3F24
										tst.w   (a2)+
										move.b  (a2)+,d0
										ext.w   d0
										move.b  (a2)+,d1
										ext.w   d1
										move.b  (a2)+,d6
										ext.w   d6
										subq.b  #1,d6
										move.b  (a2)+,d7
										ext.w   d7
										subq.b  #1,d7
										move.b  (a2)+,d2
										ext.w   d2
										move.b  (a2)+,d3
										ext.w   d3
										lsl.w   #6,d3
										add.w   d3,d2
										add.w   d2,d2
										lsl.w   #6,d1
										add.w   d1,d0
										add.w   d0,d0
										lea     (RAM_START).l,a2
										tst.w   d1
										blt.s   loc_3EEC
loc_3EC8:
										movem.w d0/d2/d6,-(sp)
loc_3ECC:
										move.w  (a2,d0.w),(a2,d2.w)
										addq.w  #2,d0
										addq.w  #2,d2
										dbf     d6,loc_3ECC
										movem.w (sp)+,d0/d2/d6
										addi.w  #$80,d0 
										addi.w  #$80,d2 
										dbf     d7,loc_3EC8
										bra.s   loc_3F06
loc_3EEC:
										movem.w d2/d6,-(sp)
loc_3EF0:
										clr.w   (a2,d2.w)
										addq.w  #2,d2
										dbf     d6,loc_3EF0
										movem.w (sp)+,d2/d6
										addi.w  #$80,d2 
										dbf     d7,loc_3EEC
loc_3F06:
										trap    #SOUND_COMMAND
										dc.w SFX_DOOR_OPEN      ; door open
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										beq.s   loc_3F18
										bset    #0,((byte_FFA82D-$1000000)).w
										bra.s   loc_3F1E
loc_3F18:
										bset    #1,((byte_FFA82D-$1000000)).w
loc_3F1E:
										movem.w (sp)+,d0-d7
return_3F22:
										
										rts
loc_3F24:
										addq.l  #8,a2
										addq.w  #1,d2
										bra.w   loc_3E80

	; End of function sub_3E40


; =============== S U B R O U T I N E =======================================

; display (or don't) map roof depending on player's start location

ToggleRoofOnMapLoad:
										
										movem.l d0-a1,-(sp)
										move.b  ((BATTLE_CURRENT_ENTITY-$1000000)).w,d4
										bpl.s   loc_3F38
										clr.w   d4
loc_3F38:
										andi.w  #$3F,d4 
										lsl.w   #5,d4
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										move.w  2(a0,d4.w),d5
										move.w  (a0,d4.w),d4
										clr.w   d1
										move.b  ((CURRENT_MAP-$1000000)).w,d1
										movea.l (p_pt_MapData).l,a0
										lsl.w   #2,d1
										movea.l (a0,d1.w),a0
										movea.l $1A(a0),a0
loc_3F60:
										tst.b   (a0)
										bmi.w   loc_3FE4
										move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d2
										ext.l   d2
										divs.w  #3,d2
										move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d3
										ext.l   d3
										divs.w  #3,d3
										clr.w   d0
										clr.w   d1
										move.b  6(a0),d0
										move.b  7(a0),d1
										sub.w   d2,d0
										sub.w   d3,d1
										clr.w   d2
										clr.w   d3
										move.b  4(a0),d2
										move.b  5(a0),d3
										add.b   d0,d2
										subq.b  #1,d2
										add.b   d1,d3
										subq.b  #1,d3
										mulu.w  #$180,d0
										mulu.w  #$180,d1
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										cmp.w   d0,d4
										blt.w   loc_3FCA
										cmp.w   d1,d5
loc_3FB6:
										blt.w   loc_3FCA
										cmp.w   d2,d4
loc_3FBC:
										bgt.w   loc_3FCA
										cmp.w   d3,d5
										bgt.w   loc_3FCA
loc_3FC6:
										bra.w   loc_3FCE
loc_3FCA:
										addq.l  #8,a0
										bra.s   loc_3F60
loc_3FCE:
										clr.w   d0
										move.b  (a0),d0         ; get x trigger coord of block copy script
										mulu.w  #$180,d0
										clr.w   d1
										move.b  1(a0),d1        ; get y trigger coord of block copy script
										mulu.w  #$180,d1
										bsr.w   PerformMapBlockCopyScript
loc_3FE4:
										movem.l (sp)+,d0-a1
										rts

	; End of function ToggleRoofOnMapLoad


; =============== S U B R O U T I N E =======================================

PerformMapBlockCopyScript:
										
										move.w  d7,-(sp)
										tst.w   ((word_FFAF42-$1000000)).w
										bne.w   loc_40E6
										lsr.w   #7,d0
										lsr.w   #7,d1
										moveq   #1,d2
										lea     MapOffsetHashTable(pc), a3
										add.w   d0,d0
										move.b  (a3,d0.w),d0
										andi.w  #$3F,d0 
										add.w   d1,d1
										move.b  (a3,d1.w),d1
										andi.w  #$3F,d1 
										clr.w   d7
										move.b  ((CURRENT_MAP-$1000000)).w,d7
										movea.l (p_pt_MapData).l,a2
										lsl.w   #2,d7
										movea.l (a2,d7.w),a2
										movea.l $1A(a2),a2
loc_4028:
										tst.b   (a2)
										bmi.w   loc_40E6
										cmp.b   (a2),d0
										bne.w   loc_40EA
										cmp.b   1(a2),d1
										bne.w   loc_40EA
										move.w  d2,((word_FFAF42-$1000000)).w
										tst.w   (a2)+
										move.b  (a2)+,d0
										ext.w   d0
										move.b  (a2)+,d1
										ext.w   d1
										move.b  (a2)+,d6
										ext.w   d6
										subq.b  #1,d6
										move.b  (a2)+,d7
										ext.w   d7
										subq.b  #1,d7
										move.b  (a2)+,d2
										ext.w   d2
										move.b  (a2)+,d3
										ext.w   d3
										move.w  d2,(word_FF5C00).l
										move.w  d3,(word_FF5C02).l
										move.w  d6,(word_FF5C04).l
										move.w  d7,(word_FF5C06).l
										lsl.w   #6,d3
										add.w   d3,d2
										add.w   d2,d2
										lsl.w   #6,d1
										add.w   d1,d0
										add.w   d0,d0
										lea     (RAM_START).l,a2
										lea     (byte_FF5C08).l,a3
										tst.w   d1
										blt.s   loc_40BA
loc_4092:
										movem.w d0/d2-d6,-(sp)
loc_4096:
										move.w  (a2,d2.w),(a3)+
										move.w  (a2,d0.w),(a2,d2.w)
										addq.w  #2,d0
										addq.w  #2,d2
										dbf     d6,loc_4096
										movem.w (sp)+,d0/d2-d6
										addi.w  #$80,d0 
										addi.w  #$80,d2 
										dbf     d7,loc_4092
										bra.s   loc_40D8
loc_40BA:
										movem.w d2/d6,-(sp)
loc_40BE:
										move.w  (a2,d2.w),(a3)+
										clr.w   (a2,d2.w)
										addq.w  #2,d2
										dbf     d6,loc_40BE
										movem.w (sp)+,d2/d6
										addi.w  #$80,d2 
										dbf     d7,loc_40BA
loc_40D8:
										move.w  #$FFFF,(a3)
										trap    #SOUND_COMMAND
										dc.w MUSIC_NOTHING
										bset    #0,((byte_FFA82D-$1000000)).w
loc_40E6:
										move.w  (sp)+,d7
										rts
loc_40EA:
										addq.l  #8,a2
										addq.w  #1,d2
										bra.w   loc_4028

	; End of function PerformMapBlockCopyScript


; =============== S U B R O U T I N E =======================================

sub_40F2:
										movem.w d7,-(sp)
										tst.w   ((word_FFAF42-$1000000)).w
										beq.w   loc_4150
										clr.w   ((word_FFAF42-$1000000)).w
										move.w  (word_FF5C00).l,d2
										move.w  (word_FF5C02).l,d3
										move.w  (word_FF5C04).l,d6
										move.w  (word_FF5C06).l,d7
										lsl.w   #6,d3
										add.w   d3,d2
										add.w   d2,d2
										lea     (RAM_START).l,a2
										lea     (byte_FF5C08).l,a3
loc_412C:
										movem.w d2/d6,-(sp)
loc_4130:
										move.w  (a3)+,(a2,d2.w)
										addq.w  #2,d2
										dbf     d6,loc_4130
										movem.w (sp)+,d2/d6
										addi.w  #$80,d2 
										dbf     d7,loc_412C
										trap    #SOUND_COMMAND
										dc.w MUSIC_NOTHING
										bset    #0,((byte_FFA82D-$1000000)).w
loc_4150:
										movem.w (sp)+,d7
										rts

	; End of function sub_40F2


; =============== S U B R O U T I N E =======================================

OpenChest:
										
										movem.l d0-d1/a2,-(sp)
										bsr.w   sub_4232        
										tst.w   d0
										blt.s   loc_418E
										jsr     j_CheckFlag
										beq.s   loc_416E
										move.w  #ITEMIDX_NOTHING,d2
loc_416E:
										jsr     j_SetFlag
										move.w  #MAP_BLOCKIDX_OPENCHEST,(a2,d0.w)
																						; set block idx to open chest
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										beq.s   loc_4188
										bset    #0,((byte_FFA82D-$1000000)).w
										bra.s   loc_418E
loc_4188:
										bset    #1,((byte_FFA82D-$1000000)).w
loc_418E:
										movem.l (sp)+,d0-d1/a2
										rts

	; End of function OpenChest


; =============== S U B R O U T I N E =======================================

CloseChest:
										
										movem.l d0-d1/a2,-(sp)
										bsr.w   sub_4232        
										tst.w   d0
										blt.s   loc_41C0
										jsr     j_ClearFlag
										move.w  #MAP_BLOCKIDX_CLOSEDCHEST,(a2,d0.w)
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										beq.s   loc_41BA
										bset    #0,((byte_FFA82D-$1000000)).w
										bra.s   loc_41C0
loc_41BA:
										bset    #1,((byte_FFA82D-$1000000)).w
loc_41C0:
										movem.l (sp)+,d0-d1/a2
										rts

	; End of function CloseChest


; =============== S U B R O U T I N E =======================================

CheckIfChestOpened:
										
										movem.l d0-d1/a2,-(sp)
										bsr.w   sub_4232        
										tst.w   d0
										blt.s   loc_41F0
										jsr     j_CheckFlag
										beq.s   loc_41DE
										move.w  #$7F,d2 
loc_41DE:
										move.w  (a2,d0.w),d0
										andi.w  #$3C00,d0
										cmpi.w  #$1800,d0
										beq.s   loc_41F0
										move.w  #$FFFF,d2
loc_41F0:
										movem.l (sp)+,d0-d1/a2
										rts

	; End of function CheckIfChestOpened


; =============== S U B R O U T I N E =======================================

OpenVaseOrBarrel:
										
										movem.l d0-d1/a2,-(sp)
										bsr.w   loc_424C
										tst.w   d0
										blt.s   loc_4214
										jsr     j_CheckFlag
										beq.s   loc_420E
										move.w  #$7F,d2 
loc_420E:
										jsr     j_SetFlag
loc_4214:
										movem.l (sp)+,d0-d1/a2
										rts

	; End of function OpenVaseOrBarrel


; =============== S U B R O U T I N E =======================================

CloseVaseOrBarrel:
										
										movem.l d0-d1/a2,-(sp)
										bsr.w   loc_424C
										tst.w   d0
										blt.s   loc_422C
										jsr     j_ClearFlag
loc_422C:
										movem.l (sp)+,d0-d1/a2
										rts

	; End of function CloseVaseOrBarrel


; =============== S U B R O U T I N E =======================================

; something with chests/vases/etc
; 
; Out: D2 = item idx

sub_4232:
										clr.w   d2
										move.b  ((CURRENT_MAP-$1000000)).w,d2
																						; current map I guess
										movea.l (p_pt_MapData).l,a2
										lsl.w   #2,d2
										movea.l (a2,d2.w),a2    ; a2 points to current map data
										movea.l $22(a2),a2      ; get address of current map's chest item data
										bra.w   loc_4262
loc_424C:
										clr.w   d2
										move.b  ((CURRENT_MAP-$1000000)).w,d2
										movea.l (p_pt_MapData).l,a2
										lsl.w   #2,d2
										movea.l (a2,d2.w),a2
										movea.l $26(a2),a2      ; get address of current map's non-chest item data
loc_4262:
										movem.w d4-d5,-(sp)
										move.w  d0,d4           ; save d0 and d1
										move.w  d1,d5
										clr.w   d2
										move.b  ((CURRENT_BATTLE-$1000000)).w,d2
										cmpi.b  #$FF,d2
										beq.w   loc_4290        ; if we are not in battle branch
										movem.l a0,-(sp)
										lea     (BattleMapCoords).w,a0
										mulu.w  #5,d2           ; US/EU "Open chest in battle" bug here ! Should be 7, not 5 !
										add.b   1(a0,d2.w),d0
										add.b   2(a0,d2.w),d1   ; add x1 and y1 of battle camera bounds
										movem.l (sp)+,a0
loc_4290:
										tst.b   (a2)
										bmi.w   loc_42C6        ; if negative, then value > map max coord, so value = FF : end of data
										cmp.b   (a2),d0
										bne.w   loc_42D8        
										cmp.b   1(a2),d1
										bne.w   loc_42D8        
										move.w  d4,d0           ; get back original coords
										move.w  d5,d1
										andi.w  #$3F,d1 
										lsl.w   #6,d1
										andi.w  #$3F,d0 
										add.w   d1,d0
										add.w   d0,d0           ; ... ?
										clr.w   d1
										move.b  2(a2),d1
										clr.w   d2
										move.b  3(a2),d2
										bra.w   loc_42CC
loc_42C6:
										moveq   #$FFFFFFFF,d0
										move.w  d0,d1
										move.w  d0,d2
loc_42CC:
										lea     (RAM_START).l,a2
										movem.w (sp)+,d4-d5
										rts
loc_42D8:
										addq.l  #4,a2           ; go to next item
										bra.s   loc_4290

	; End of function sub_4232


; =============== S U B R O U T I N E =======================================

WarpIfSetAtPoint:
										
										movem.l d0-d1/d7,-(sp)
										ext.l   d0
										ext.l   d1
										divs.w  #$180,d0
										divs.w  #$180,d1
										clr.w   d7
										move.b  ((CURRENT_MAP-$1000000)).w,d7
										movea.l (p_pt_MapData).l,a2
										lsl.w   #2,d7
										movea.l (a2,d7.w),a2
										movea.l $1E(a2),a2
loc_4302:
										cmpi.w  #$FFFF,(a2)
										beq.w   loc_433A
										tst.b   (a2)
										blt.s   loc_4314
										cmp.b   (a2),d0
										bne.w   loc_4340
loc_4314:
										tst.b   1(a2)
										blt.s   loc_4322
										cmp.b   1(a2),d1
										bne.w   loc_4340
loc_4322:
										move.w  #1,((MAP_EVENT_TYPE-$1000000)).w
										move.l  2(a2),((byte_FFA84C-$1000000)).w
										move.w  6(a2),((byte_FFA850-$1000000)).w
										move.w  #$59,((word_FFB1A8-$1000000)).w 
loc_433A:
										movem.l (sp)+,d0-d1/d7
										rts
loc_4340:
										addq.l  #8,a2
										bra.s   loc_4302

	; End of function WarpIfSetAtPoint


; =============== S U B R O U T I N E =======================================

sub_4344:
										movem.l a0-a1,-(sp)
										movem.w d7,-(sp)
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										bne.s   loc_4358
										clr.w   ((word_FFA80E-$1000000)).w
										bra.s   loc_435E
loc_4358:
										move.w  #$2000,((word_FFA80E-$1000000)).w
loc_435E:
										move.w  ((word_FFA810-$1000000)).w,d0
										move.w  ((word_FFA812-$1000000)).w,d1
										move.w  ((word_FFA804-$1000000)).w,d2
										move.w  ((word_FFA808-$1000000)).w,d3
										lea     (byte_FFC000).l,a1
										bsr.w   sub_43F8
										movea.l ((WINDOW_TILES_END-$1000000)).w,a1
										cmpa.l  #VDP_TILE_IDX_LIST,a1
										bne.s   loc_439A
										lea     (byte_FFC000).l,a0
										lea     ($C000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										bsr.w   sub_119E        
loc_439A:
										movem.w (sp)+,d7
										movem.l (sp)+,a0-a1
										rts

	; End of function sub_4344


; =============== S U B R O U T I N E =======================================

sub_43A4:
										movem.l a0-a1,-(sp)
										movem.w d7,-(sp)
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										beq.s   loc_43B8
										clr.w   ((word_FFA80E-$1000000)).w
										bra.s   loc_43BE
loc_43B8:
										move.w  #$2000,((word_FFA80E-$1000000)).w
loc_43BE:
										move.w  ((word_FFA814-$1000000)).w,d0
										move.w  ((word_FFA816-$1000000)).w,d1
										move.w  ((word_FFA806-$1000000)).w,d2
										move.w  ((word_FFA80A-$1000000)).w,d3
										lea     (byte_FFE000).l,a1
										bsr.w   sub_43F8
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										bsr.w   sub_119E        
										movem.w (sp)+,d7
										movem.l (sp)+,a0-a1
										rts

	; End of function sub_43A4


; =============== S U B R O U T I N E =======================================

sub_43F8:
										neg.w   d2
										andi.w  #$FF,d2
										lsr.w   #3,d2
loc_4400:
										add.w   d2,d2
										subq.w  #8,d3
										andi.w  #$FF,d3
										lsr.w   #3,d3
										add.w   d3,d3
										lsl.w   #5,d3
										andi.w  #$7FE,d3
										add.w   d2,d3
										lsr.w   #7,d0
										lsr.w   #7,d1
										lea     MapOffsetHashTable(pc), a3
										lea     (RAM_START).l,a4
										lea     (FF2000_LOADING_SPACE).l,a5
										cmpi.b  #$F,((FADING_PALETTE_FLAGS-$1000000)).w
										bne.w   loc_44B4
										moveq   #$20,d7 
loc_4434:
										movem.w d0/d3,-(sp)
										moveq   #$20,d6 
loc_443A:
										movem.w d0-d1,-(sp)
										add.w   d0,d0
										clr.w   d2
										move.b  1(a3,d0.w),d2
										move.b  (a3,d0.w),d0
										ext.w   d0
										add.w   d1,d1
										clr.w   d5
										move.b  1(a3,d1.w),d5
										move.b  (a3,d1.w),d1
										ext.w   d1
										lsl.w   #6,d1
										add.w   d1,d0
										add.w   d0,d0
										move.w  d5,d4
										add.w   d5,d5
										add.w   d4,d5
										add.w   d5,d2
										add.w   d2,d2
										move.w  (a4,d0.w),d0
										andi.w  #$3FF,d0
										add.w   d0,d0
										move.w  d0,d1
										lsl.w   #3,d0
										add.w   d1,d0
										add.w   d0,d2
										movem.w (sp)+,d0-d1
										move.w  (a5,d2.w),(a1,d3.w)
										move.w  d3,d2
										addq.w  #2,d3
										eor.w   d3,d2
										btst    #6,d2
										beq.s   loc_4496
										subi.w  #$40,d3 
loc_4496:
										addq.w  #1,d0
										dbf     d6,loc_443A
										movem.w (sp)+,d0/d3
										addi.w  #$40,d3 
										bclr    #$B,d3
										addq.w  #1,d1
										dbf     d7,loc_4434
										bsr.w   sub_3D46
										rts
loc_44B4:
										moveq   #$20,d7 
loc_44B6:
										movem.w d0/d3,-(sp)
										moveq   #$20,d6 
loc_44BC:
										movem.w d0-d1,-(sp)
										add.w   d0,d0
										clr.w   d2
										move.b  1(a3,d0.w),d2
										move.b  (a3,d0.w),d0
										ext.w   d0
										add.w   d1,d1
										clr.w   d5
loc_44D2:
										move.b  1(a3,d1.w),d5
										move.b  (a3,d1.w),d1
										ext.w   d1
										lsl.w   #6,d1
										add.w   d1,d0
										add.w   d0,d0
										move.w  d5,d4
										add.w   d5,d5
										add.w   d4,d5
										add.w   d5,d2
										add.w   d2,d2
										move.w  (a4,d0.w),d0
loc_44F0:
										cmpi.w  #$C000,d0
										bcs.s   loc_44FA
										clr.w   d4
										bra.s   loc_44FE
loc_44FA:
										move.w  ((word_FFA80E-$1000000)).w,d4
loc_44FE:
										andi.w  #$3FF,d0
										add.w   d0,d0
										move.w  d0,d1
										lsl.w   #3,d0
										add.w   d1,d0
										add.w   d0,d2
										movem.w (sp)+,d0-d1
										move.w  (a5,d2.w),(a1,d3.w)
										or.w    d4,(a1,d3.w)
										move.w  d3,d2
										addq.w  #2,d3
										eor.w   d3,d2
										btst    #6,d2
										beq.s   loc_452A
										subi.w  #$40,d3 
loc_452A:
										addq.w  #1,d0
										dbf     d6,loc_44BC
										movem.w (sp)+,d0/d3
										addi.w  #$40,d3 
										bclr    #$B,d3
										addq.w  #1,d1
										dbf     d7,loc_44B6
										rts

	; End of function sub_43F8


; =============== S U B R O U T I N E =======================================

; overrides music index if we're in a battle

LoadBattleMusic:
										
										move.w  d0,-(sp)
										clr.w   d0
										move.b  ((MAP_AREA_MUSIC_INDEX-$1000000)).w,d0
loc_454C:
										cmpi.b  #$FF,((CURRENT_BATTLE-$1000000)).w
										beq.s   loc_4586
loc_4554:
										cmpi.b  #0,d0
										bne.s   loc_455E
loc_455A:
										move.w  #MUSIC_BATTLE_THEME_3,d0
																						; HARDCODED music indexes here
loc_455E:
										cmpi.b  #MUSIC_TOWN,d0
										bne.s   loc_4568
										move.w  #MUSIC_BATTLE_THEME_3,d0
loc_4568:
										cmpi.b  #MUSIC_MITULA,d0
										bne.s   loc_4572
										move.w  #MUSIC_BATTLE_THEME_3,d0
loc_4572:
										cmpi.b  #MUSIC_MITULA_SHRINE,d0
										bne.s   loc_457C
										move.w  #MUSIC_BATTLE_THEME_1,d0
loc_457C:
										cmpi.b  #MUSIC_CASTLE,d0
										bne.s   loc_4586
										move.w  #MUSIC_BATTLE_THEME_1,d0
loc_4586:
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_GET_D0_PARAMETER
										move.w  (sp)+,d0
										rts

	; End of function LoadBattleMusic


; =============== S U B R O U T I N E =======================================

sub_458E:
										bsr.w   sub_38C0
										move.w  d0,((word_FFA814-$1000000)).w
										move.w  d0,((word_FFA81C-$1000000)).w
										lsr.w   #4,d0
										neg.w   d0
										andi.w  #$FF,d0
										move.w  d0,((word_FFA806-$1000000)).w
										move.w  d1,((word_FFA816-$1000000)).w
										move.w  d1,((word_FFA81E-$1000000)).w
										lsr.w   #4,d1
										addq.w  #8,d1
										andi.w  #$FF,d1
										move.w  d1,((word_FFA80A-$1000000)).w
										bset    #1,((byte_FFA82D-$1000000)).w
										rts

	; End of function sub_458E


; =============== S U B R O U T I N E =======================================

VInt_AdjustCameraToPlayer:
										
										clr.w   d0
										move.b  ((BATTLE_CURRENT_ENTITY-$1000000)).w,d0
										bmi.w   loc_468C
										lsl.w   #5,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										adda.w  d0,a0
										move.w  (a0)+,d4
										move.w  (a0)+,d5
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										bne.s   loc_45E8
										move.w  ((word_FFA814-$1000000)).w,d2
										move.w  ((word_FFA816-$1000000)).w,d3
										bra.s   loc_45F0
loc_45E8:
										move.w  ((word_FFA810-$1000000)).w,d2
										move.w  ((word_FFA812-$1000000)).w,d3
loc_45F0:
										clr.w   d6
										bsr.w   IsMapScrollingToFollowCameraTarget
										bne.w   return_4706
										move.w  d2,d7
										addi.w  #$600,d7
										cmp.w   d7,d4
										bge.s   loc_4616
										cmp.w   ((MAP_AREA_LAYER1_STARTX-$1000000)).w,d2
										ble.w   loc_4638
										subi.w  #$180,d2
										addq.w  #1,d6
										bra.w   loc_4638
loc_4616:
										move.w  d2,d7
										addi.w  #$900,d7
										cmp.w   d7,d4
										ble.s   loc_4638
										move.w  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,d7
										subi.w  #$F00,d7
										cmp.w   d7,d2
										bge.w   loc_4638
										addi.w  #$180,d2
										addq.w  #1,d6
										bra.w   *+4
loc_4638:
										move.w  d3,d7
										addi.w  #$600,d7
										cmp.w   d7,d5
										bge.s   loc_4654
										cmp.w   ((MAP_AREA_LAYER1_STARTY-$1000000)).w,d3
										ble.w   loc_4676
										subi.w  #$180,d3
										addq.w  #1,d6
										bra.w   loc_4676
loc_4654:
										move.w  d3,d7
										addi.w  #$900,d7
										cmp.w   d7,d5
										ble.s   loc_4676
										move.w  ((MAP_AREA_LAYER1_ENDY-$1000000)).w,d7
										subi.w  #$D80,d7
										cmp.w   d7,d3
										bge.w   loc_4676
										addi.w  #$180,d3
										addq.w  #1,d6
										bra.w   *+4
loc_4676:
										tst.w   d6
										beq.s   loc_4688
										move.w  d2,d0
										move.w  d3,d1
										bsr.w   SetCameraDest
										addq.w  #1,((word_FFA828-$1000000)).w
										bra.s   loc_468C
loc_4688:
										clr.w   ((word_FFA828-$1000000)).w
loc_468C:
										move.w  ((word_FFA828-$1000000)).w,d7
										cmpi.w  #6,d7
										ble.s   loc_469C
										move.w  #$20,d7 
										bra.s   loc_46A0
loc_469C:
										move.w  #$18,d7
loc_46A0:
										cmpi.b  #$30,((BATTLE_CURRENT_ENTITY-$1000000)).w
										bne.s   loc_46AA
										moveq   #$40,d7 
loc_46AA:
										cmpi.b  #5,((FADING_SETTING-$1000000)).w
										bne.s   loc_46B4
										moveq   #$20,d7 
loc_46B4:
										tst.w   ((word_FFB194-$1000000)).w
										beq.s   loc_46BE
										move.w  ((word_FFB194-$1000000)).w,d7
loc_46BE:
										tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
										bne.s   loc_46D0
										move.w  d7,d0
										mulu.w  ((MAP_AREA_LAYER1_PARALLAX_X-$1000000)).w,d0
										lsr.w   #8,d0
										move.w  d0,((word_FFA820-$1000000)).w
loc_46D0:
										tst.b   ((MAP_AREA_LAYER1_AUTOSCROLL_Y-$1000000)).w
										bne.s   loc_46E2
										move.w  d7,d0
										mulu.w  ((MAP_AREA_LAYER1_PARALLAX_Y-$1000000)).w,d0
										lsr.w   #8,d0
										move.w  d0,((word_FFA822-$1000000)).w
loc_46E2:
										tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
										bne.s   loc_46F4
										move.w  d7,d0
										mulu.w  ((MAP_AREA_LAYER2_PARALLAX_X-$1000000)).w,d0
										lsr.w   #8,d0
										move.w  d0,((word_FFA824-$1000000)).w
loc_46F4:
										tst.b   ((MAP_AREA_LAYER2_AUTOSCROLL_Y-$1000000)).w
										bne.s   return_4706
										move.w  d7,d0
										mulu.w  ((MAP_AREA_LAYER2_PARALLAX_Y-$1000000)).w,d0
										lsr.w   #8,d0
										move.w  d0,((word_FFA826-$1000000)).w
return_4706:
										
										rts

	; End of function VInt_AdjustCameraToPlayer


; =============== S U B R O U T I N E =======================================

; wait for end of scrolling

WaitForCameraToCatchUp:
										
										move.w  d7,-(sp)
loc_470A:
										bsr.w   IsMapScrollingToFollowCameraTarget
										beq.s   loc_4716
										bsr.w   WaitForVInt     
										bra.s   loc_470A
loc_4716:
										bsr.w   WaitForVInt     
										bsr.w   IsMapScrollingToFollowCameraTarget
										bne.s   loc_470A
										bsr.w   WaitForVInt     
										move.w  (sp)+,d7
										rts

	; End of function WaitForCameraToCatchUp


; =============== S U B R O U T I N E =======================================

; 8 = foreground x, 4 = foreground y, 2 = background x, 1 = background y
; 
; Out: Z = is scrolling

IsMapScrollingToFollowCameraTarget:
										
										move.b  ((CAMERA_SCROLLING_MASK-$1000000)).w,d7
										tst.w   ((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
										beq.s   loc_4736
										andi.b  #3,d7
loc_4736:
										tst.w   ((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
										beq.s   loc_4740
										andi.b  #$C,d7
loc_4740:
										tst.b   d7
										rts

	; End of function IsMapScrollingToFollowCameraTarget


; =============== S U B R O U T I N E =======================================

VInt_4744:
										
										bclr    #0,((byte_FFA82D-$1000000)).w
										beq.s   loc_4764
										bsr.w   sub_4344
										movea.l ((WINDOW_TILES_END-$1000000)).w,a1
										cmpa.l  #VDP_TILE_IDX_LIST,a1
										beq.s   loc_4764
										bsr.w   CopyFFC000toFFC800
										bsr.w   sub_48A0
loc_4764:
										bclr    #1,((byte_FFA82D-$1000000)).w
										beq.s   return_4770
										bsr.w   sub_43A4
return_4770:
										
										rts

	; End of function VInt_4744


; =============== S U B R O U T I N E =======================================

VInt_UpdateAnimatingTiles:
										
										move.l  ((TILE_ANIM_DATA_ADDR-$1000000)).w,d0
										ble.s   return_47C4
										subq.w  #1,((TILE_ANIM_COUNTER-$1000000)).w
										bne.s   return_47C4
										movea.l d0,a0
										move.w  (a0)+,d1
										bge.w   loc_47A2
										clr.w   d0
										move.b  (TILE_ANIM_MAP_INDEX).l,d0
										movea.l (p_pt_MapData).l,a0
										lsl.w   #2,d0
										movea.l (a0,d0.w),a0
										movea.l $2A(a0),a0
										tst.l   (a0)+
										move.w  (a0)+,d1
loc_47A2:
										move.w  (a0)+,d0
										move.w  (a0)+,d2
										move.w  (a0)+,((TILE_ANIM_COUNTER-$1000000)).w
										move.l  a0,((TILE_ANIM_DATA_ADDR-$1000000)).w
										lsl.w   #5,d1
										lea     (byte_FF9B04).l,a0
										adda.w  d1,a0
										lsl.w   #5,d2
										movea.w d2,a1
										lsl.w   #4,d0
										moveq   #2,d1
										bsr.w   sub_119E        
return_47C4:
										
										rts

	; End of function VInt_UpdateAnimatingTiles


; =============== S U B R O U T I N E =======================================

InitWindowProperties:
										
										move.l  a0,-(sp)
										move.w  d7,-(sp)
										lea     (WINDOW_PROPERTIES).l,a0
										moveq   #$1F,d7
loc_47D2:
										clr.l   (a0)+
										dbf     d7,loc_47D2
										move.l  #VDP_TILE_IDX_LIST,((WINDOW_TILES_END-$1000000)).w
										move.w  (sp)+,d7
										movea.l (sp)+,a0
										clr.b   ((WINDOW_IS_PRESENT-$1000000)).w
										cmpi.b  #$FF,((CURRENT_MAP-$1000000)).w
										beq.s   loc_47F4
										addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
loc_47F4:
										clr.w   ((PORTRAIT_WINDOW_INDEX-$1000000)).w
										clr.w   ((TEXT_WINDOW_INDEX-$1000000)).w
										clr.w   ((TIMER_WINDOW_INDEX-$1000000)).w
										rts

	; End of function InitWindowProperties


; =============== S U B R O U T I N E =======================================

; d0 = width height, d1 = X Y pos
; returns a1 = window tiles end, d0 = window slot

CreateWindow:
										
										move.l  a0,-(sp)
										movem.w d6-d7,-(sp)
										lea     (WINDOW_PROPERTIES).l,a0
										clr.w   d6
										moveq   #7,d7
loc_4812:
										tst.w   (a0)            ; get free window slot
										beq.s   loc_4826
										addq.w  #1,d6
										adda.w  #$10,a0
										dbf     d7,loc_4812     
										moveq   #$FFFFFFFF,d0   ; no window slot available
										bra.w   loc_485E
loc_4826:
										movea.l ((WINDOW_TILES_END-$1000000)).w,a1
										cmpa.l  #VDP_TILE_IDX_LIST,a1
										bne.s   loc_4836        
										bsr.w   CopyFFC000toFFC800
loc_4836:
										move.l  a1,(a0)+        ; window tiles end
										move.w  d0,(a0)+        ; width height
										move.w  d1,(a0)+        ; X Y pos 3 times
										move.w  d1,(a0)+
										move.w  d1,(a0)+
										move.w  #$101,(a0)+     ; another X Y pos
										clr.w   (a0)+
										move.w  d0,d7
										lsr.w   #8,d7           ; get width
										andi.w  #$FF,d0
										mulu.w  d7,d0
										add.w   d0,d0
										adda.w  d0,a1
										move.l  a1,((WINDOW_TILES_END-$1000000)).w
										move.w  d6,d0
										movea.l -$10(a0),a1
loc_485E:
										movem.w (sp)+,d6-d7
										movea.l (sp)+,a0
										rts

	; End of function CreateWindow


; =============== S U B R O U T I N E =======================================

;     startWindowTransition ???
;     In: D0 = window number
;     Cross: getAddressOfWindowInfo

SetWindowDestination:
										
										move.l  a0,-(sp)
										movem.w d0-d1,-(sp)
										bsr.w   GetWindowInfo   
										tst.l   (a0)
										beq.w   loc_4898
										move.w  6(a0),d0
										cmp.w   $A(a0),d0
										bne.w   loc_4898
										cmpi.w  #$8080,d1
										bne.s   loc_488A
										move.w  d0,d1
loc_488A:
										move.w  d1,8(a0)
										move.w  d1,$A(a0)
										move.w  #$100,$C(a0)
loc_4898:
										movem.w (sp)+,d0-d1
										movea.l (sp)+,a0
										rts

	; End of function SetWindowDestination


; =============== S U B R O U T I N E =======================================

sub_48A0:
										movem.w d0-d1/d7,-(sp)
										bsr.w   CopyFFC000toFFC800
										clr.w   d0
										move.w  #$8080,d1
										moveq   #7,d7
loc_48B0:
										bsr.s   SetWindowDestination
										addq.w  #1,d0
										dbf     d7,loc_48B0
										movem.w (sp)+,d0-d1/d7
										rts

	; End of function sub_48A0


; =============== S U B R O U T I N E =======================================

sub_48BE:
										move.l  a0,-(sp)
										move.w  d0,-(sp)
										bsr.w   GetWindowInfo   
										move.w  #1,$E(a0)
										move.w  (sp)+,d0
										movea.l (sp)+,a0
										rts

	; End of function sub_48BE


; =============== S U B R O U T I N E =======================================

CopyFFC000toFFC800:
										
										movem.l a0-a1,-(sp)
										move.w  d7,-(sp)
										lea     (byte_FFC000).l,a0
										lea     (byte_FFC800).l,a1
										move.w  #$800,d7
										bsr.w   CopyBytes       
										move.w  (sp)+,d7
										movem.l (sp)+,a0-a1
										rts

	; End of function CopyFFC000toFFC800


; =============== S U B R O U T I N E =======================================

; set window D0's dest to D1 (xxyy) and play window switching sound

MoveWindowWithSFX:
										
										trap    #SOUND_COMMAND
										dc.w SFX_MENU_SWITCH

	; End of function MoveWindowWithSFX


; =============== S U B R O U T I N E =======================================

; set window D0's dest to D1 (xxyy)

MoveWindowWithoutSFX:
										
										tst.b   ((SPECIAL_TURBO_CHEAT-$1000000)).w
										beq.s   loc_4900
										moveq   #1,d2
loc_4900:
										move.l  a0,-(sp)
										movem.w d0-d1,-(sp)
										bsr.w   GetWindowInfo   
										cmpi.w  #$8080,d1
										bne.s   loc_4914
										move.w  6(a0),d1
loc_4914:
										move.w  6(a0),8(a0)
										move.w  d1,$A(a0)
										move.b  d2,$C(a0)
										clr.b   $D(a0)
										movem.w (sp)+,d0-d1
										movea.l (sp)+,a0
										rts

	; End of function MoveWindowWithoutSFX


; =============== S U B R O U T I N E =======================================

ClearWindowAndUpdateEndPtr:
										
										movem.l d0-d4/a0-a1,-(sp)
										bsr.w   GetWindowInfo   
										clr.l   (a0)
										clr.l   d1
										lea     (WINDOW_PROPERTIES).l,a0
										moveq   #7,d0
										clr.w   d3
										clr.w   d4
loc_4946:
										move.l  (a0),d2
										cmp.l   d1,d2
										bls.s   loc_4956
										move.l  d2,d1
										move.b  4(a0),d3
										move.b  5(a0),d4
loc_4956:
										lea     $10(a0),a0
										dbf     d0,loc_4946
										tst.l   d1
										bne.s   loc_496A
										move.l  #VDP_TILE_IDX_LIST,d1
										bra.s   loc_4972
loc_496A:
										mulu.w  d4,d3
										add.w   d3,d3
										ext.l   d3
										add.l   d3,d1
loc_4972:
										move.l  d1,((WINDOW_TILES_END-$1000000)).w
										movem.l (sp)+,d0-d4/a0-a1
										rts

	; End of function ClearWindowAndUpdateEndPtr


; =============== S U B R O U T I N E =======================================

WaitForVint_andFFA900Clear:
										
										bsr.w   WaitForVInt     
										tst.b   ((word_FFA900-$1000000)).w
										bne.s   WaitForVint_andFFA900Clear
										rts

	; End of function WaitForVint_andFFA900Clear


; =============== S U B R O U T I N E =======================================

VInt_UpdateWindows:
										
										cmpi.l  #VDP_TILE_IDX_LIST,((WINDOW_TILES_END-$1000000)).w
										bne.s   loc_4994
										rts
loc_4994:
										clr.b   ((word_FFA900-$1000000)).w
										moveq   #7,d7
										lea     (WINDOW_PROPERTIES).l,a2
loc_49A0:
										tst.l   (a2)
										beq.w   loc_49C8
										move.b  $C(a2),d0
										cmp.b   $D(a2),d0
										beq.w   loc_49C8
										moveq   #7,d0
										sub.w   d7,d0
										bset    d0,((word_FFA900-$1000000)).w
										movea.l (a2),a0
										move.w  4(a2),d0
										move.w  6(a2),d1
										bsr.w   sub_4B5C
loc_49C8:
										lea     $10(a2),a2
										dbf     d7,loc_49A0
										moveq   #7,d7
										lea     (WINDOW_PROPERTIES).l,a2
loc_49D8:
										tst.l   (a2)
										beq.w   loc_4A72
										move.b  $C(a2),d0
										cmp.b   $D(a2),d0
										beq.w   loc_4A40
										movea.l (a2),a0
										move.w  4(a2),d0
										move.w  6(a2),d1
										addq.b  #1,$D(a2)
										clr.w   d6
										move.b  $C(a2),d6
										clr.w   d5
loc_4A00:
										move.b  $D(a2),d5
										move.w  8(a2),d3
										move.w  d3,d4
										asr.w   #8,d3
										ext.w   d4
										move.w  $A(a2),d1
										move.w  d1,d2
										asr.w   #8,d1
										ext.w   d2
										sub.w   d3,d1
										muls.w  d5,d1
										divs.w  d6,d1
										add.w   d3,d1
										sub.w   d4,d2
										muls.w  d5,d2
										divs.w  d6,d2
										add.w   d4,d2
										lsl.w   #8,d1
										andi.w  #$FF,d2
										or.w    d2,d1
										move.w  d1,6(a2)
										tst.b   ((DISPLAY_WINDOWS_TOGGLE-$1000000)).w
										bne.s   loc_4A40
										bsr.w   sub_4AC8
										bra.s   loc_4A72
loc_4A40:
										tst.b   $E(a2)
										beq.s   loc_4A5A
										clr.b   $E(a2)
										movea.l (a2),a0
										move.w  4(a2),d0
										move.w  6(a2),d1
										bsr.w   sub_4AC8
										bra.s   loc_4A72
loc_4A5A:
										tst.b   $F(a2)
										beq.s   loc_4A72
										clr.b   $F(a2)
										movea.l (a2),a0
										move.w  4(a2),d0
										move.w  6(a2),d1
										bsr.w   sub_4B5C
loc_4A72:
										lea     $10(a2),a2
										dbf     d7,loc_49D8
										tst.b   ((DISPLAY_WINDOWS_TOGGLE-$1000000)).w
										beq.s   loc_4A92
										tst.b   ((byte_FFA8FE-$1000000)).w
										bne.s   loc_4A90
										bsr.w   CopyFFC000toFFC800
										move.w  #$FFFF,((byte_FFA8FE-$1000000)).w
loc_4A90:
										bra.s   loc_4AA2
loc_4A92:
										tst.b   ((byte_FFA8FE-$1000000)).w
										beq.s   loc_4AA2
										bsr.w   sub_48A0
										move.w  #$FF,((byte_FFA8FE-$1000000)).w
loc_4AA2:
										tst.b   ((byte_FFA8FF-$1000000)).w
										beq.s   return_4AC6
										lea     (byte_FFC800).l,a0
										lea     ($C000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										bsr.w   sub_119E        
										bsr.w   Set_FFDE94_bit3 
										clr.b   ((byte_FFA8FF-$1000000)).w
return_4AC6:
										
										rts

	; End of function VInt_UpdateWindows


; =============== S U B R O U T I N E =======================================

sub_4AC8:
										movem.l a0-a1,-(sp)
										movem.w d0-d3/d6-d7,-(sp)
										lea     (byte_FFC800).l,a1
loc_4AD6:
										bsr.w   sub_4BEA
										move.w  d0,d1
										ext.w   d0
										subq.w  #1,d0
										bmi.w   loc_4B52
										asr.w   #8,d1
										subq.w  #1,d1
										bmi.w   loc_4B52
loc_4AEC:
										tst.w   d3
										bpl.s   loc_4AFA
										adda.w  d1,a0
										adda.w  d1,a0
										addq.w  #2,a0
										bra.w   loc_4B38
loc_4AFA:
										cmpi.w  #$1C,d3
										bge.w   loc_4B46
										movem.w d1-d2/d6,-(sp)
loc_4B06:
										tst.w   d2
										bmi.w   loc_4B1C
										cmpi.w  #$20,d2 
										bge.w   loc_4B1C
										move.w  (a0),d5
										beq.s   loc_4B1C
										move.w  d5,(a1,d6.w)
loc_4B1C:
										addq.w  #2,a0
										addq.w  #1,d2
										move.w  d6,d7
										addq.w  #2,d6
										eor.w   d6,d7
										btst    #6,d7
										beq.s   loc_4B30
										subi.w  #$40,d6 
loc_4B30:
										dbf     d1,loc_4B06
loc_4B34:
										movem.w (sp)+,d1-d2/d6
loc_4B38:
										addq.w  #1,d3
										addi.w  #$40,d6 
										bclr    #$B,d6
										dbf     d0,loc_4AEC
loc_4B46:
										tst.b   ((DISPLAY_WINDOWS_TOGGLE-$1000000)).w
										bne.s   loc_4B52
										move.b  #$FF,((byte_FFA8FF-$1000000)).w
loc_4B52:
										movem.w (sp)+,d0-d3/d6-d7
										movem.l (sp)+,a0-a1
										rts

	; End of function sub_4AC8


; =============== S U B R O U T I N E =======================================

sub_4B5C:
										movem.l a0-a1,-(sp)
										movem.w d0-d1/d6-d7,-(sp)
										lea     (byte_FFC000).l,a0
										lea     (byte_FFC800).l,a1
										bsr.w   sub_4BEA
										move.w  d0,d1
										ext.w   d0
										subq.w  #1,d0
										bmi.w   loc_4BE0
										asr.w   #8,d1
										subq.w  #1,d1
										bmi.w   loc_4BE0
loc_4B86:
										tst.w   d3
										bmi.w   loc_4BC6
										cmpi.w  #$1C,d3
										bge.w   loc_4BD4
										movem.w d1-d2/d6,-(sp)
loc_4B98:
										tst.w   d2
										bmi.w   loc_4BAC
loc_4B9E:
										cmpi.w  #$20,d2 
										bge.w   loc_4BAC
										move.w  (a0,d6.w),(a1,d6.w)
loc_4BAC:
										addq.w  #1,d2
										move.w  d6,d7
										addq.w  #2,d6
										eor.w   d6,d7
										btst    #6,d7
										beq.s   loc_4BBE
										subi.w  #$40,d6 
loc_4BBE:
										dbf     d1,loc_4B98
										movem.w (sp)+,d1-d2/d6
loc_4BC6:
										addq.w  #1,d3
										addi.w  #$40,d6 
										bclr    #$B,d6
										dbf     d0,loc_4B86
loc_4BD4:
										tst.b   ((DISPLAY_WINDOWS_TOGGLE-$1000000)).w
										bne.s   loc_4BE0
										move.b  #$FF,((byte_FFA8FF-$1000000)).w
loc_4BE0:
										movem.w (sp)+,d0-d1/d6-d7
										movem.l (sp)+,a0-a1
										rts

	; End of function sub_4B5C


; =============== S U B R O U T I N E =======================================

sub_4BEA:
										move.w  d1,d6
										asr.w   #8,d1
										move.w  d1,d2
										andi.w  #$1F,d1
										ext.w   d6
										move.w  d6,d3
										asl.w   #5,d6
										add.w   d1,d6
										add.w   d6,d6
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   return_4C36
										move.w  (word_FFD500).l,d1
										addq.w  #4,d1
										lsr.w   #3,d1
										lsl.w   #6,d1
										add.w   d1,d6
										andi.w  #$7FF,d6
										move.w  (dword_FFD100).l,d1
										addq.w  #4,d1
										lsr.w   #3,d1
										add.w   d1,d1
										move.w  d6,d7
										sub.w   d1,d6
										eor.w   d6,d7
										btst    #6,d7
										beq.s   return_4C36
										addi.w  #$40,d6 
return_4C36:
										
										rts

	; End of function sub_4BEA


; =============== S U B R O U T I N E =======================================

;     Get address in RAM of window info, starting at RAM:a87e.
;     In: D0 = window idx
;     Out: A0 = address of window info

GetWindowInfo:
										
										lsl.w   #4,d0
										lea     (WINDOW_PROPERTIES).l,a0
										adda.w  d0,a0
										rts

	; End of function GetWindowInfo


; =============== S U B R O U T I N E =======================================

;     Get address of specific tile based on coord for a window.
;     In: D0 = window idx
;         D1 = X/Y coord, stacked into a word
;     Out: A1 = address of window coord

GetAddressOfWindowTileDataStartingAtCoord:
										
										move.l  a0,-(sp)
										movem.w d0-d2,-(sp)
										bsr.s   GetWindowInfo   
										movea.l (a0)+,a1
										clr.w   d0
										move.b  (a0),d0
										clr.w   d2
										move.b  d1,d2
										lsr.w   #8,d1
										mulu.w  d2,d0
										add.w   d1,d0
										add.w   d0,d0
										adda.w  d0,a1
										movem.w (sp)+,d0-d2
										movea.l (sp)+,a0
										rts

	; End of function GetAddressOfWindowTileDataStartingAtCoord


; =============== S U B R O U T I N E =======================================

VInt_UpdateSprites:
										
										tst.b   ((byte_FFAF69-$1000000)).w
										bne.s   loc_4C74
										move.b  ((byte_FFAF6A-$1000000)).w,((byte_FFAF69-$1000000)).w
loc_4C74:
										subq.b  #1,((byte_FFAF69-$1000000)).w
										move.b  ((byte_FFAF69-$1000000)).w,d6
										sub.b   ((byte_FFAF6B-$1000000)).w,d6
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										lea     (byte_FFDD00).l,a1
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										bne.s   loc_4CB2
										move.w  ((word_FFA806-$1000000)).w,d2
										sub.w   (dword_FFD100+2).l,d2
										asl.w   #4,d2
										add.w   ((word_FFA814-$1000000)).w,d2
										move.w  (word_FFD502).l,d3
										sub.w   ((word_FFA80A-$1000000)).w,d3
										asl.w   #4,d3
										add.w   ((word_FFA816-$1000000)).w,d3
										bra.s   loc_4CD2
loc_4CB2:
										move.w  ((word_FFA804-$1000000)).w,d2
										sub.w   (dword_FFD100).l,d2
										asl.w   #4,d2
										add.w   ((word_FFA810-$1000000)).w,d2
										move.w  (word_FFD500).l,d3
										sub.w   ((word_FFA808-$1000000)).w,d3
										asl.w   #4,d3
										add.w   ((word_FFA812-$1000000)).w,d3
loc_4CD2:
										subi.w  #$F,d2
										subi.w  #$F,d3
										moveq   #$2F,d7 ; number of entities, for iterating
loc_4CDC:
										move.w  (a0),d0
										move.w  2(a0),d1
										sub.w   d2,d0
										sub.w   d3,d1
										asr.w   #4,d0
										asr.w   #4,d1
										cmpi.w  #$FFE8,d0
										blt.w   sub_4E1E
										cmpi.w  #$100,d0
										bgt.w   sub_4E1E
										cmpi.w  #$FFE8,d1
										blt.w   sub_4E1E
										cmpi.w  #$100,d1
										bgt.w   sub_4E1E
										btst    #7,$1D(a0)
										beq.s   loc_4D18
										tst.b   d6
										bge.w   sub_4E1E
loc_4D18:
										tst.w   d7
										bne.s   loc_4D2A
										move.b  $11(a0),d5
loc_4D20:
										jsr     sub_20050
										bra.w   loc_4DC4
loc_4D2A:
										move.b  $1E(a0),d4
										cmpi.b  #$F,d4
										bge.s   loc_4D3A
										move.w  #$380,d5
										bra.s   loc_4D3E
loc_4D3A:
										move.w  #$389,d5
loc_4D3E:
										cmpi.b  #$FF,d4
										beq.s   loc_4D5C
										addq.b  #1,d4
										btst    #4,$1D(a0)
										beq.s   loc_4D50
										addq.b  #2,d4
loc_4D50:
										cmpi.b  #$1E,d4
										ble.s   loc_4D58
										clr.w   d4
loc_4D58:
										move.b  d4,$1E(a0)
loc_4D5C:
										move.w  d6,-(sp)
										clr.w   d4
										move.b  $12(a0),d4
										move.w  d4,d6
										lsl.w   #3,d4
										add.w   d6,d4
										add.w   d4,d4
										add.w   d4,d5
										addi.w  #$80,d0 
										addi.w  #$70,d1 
										move.w  d0,6(a1)
										move.w  d1,(a1)
										move.w  #$40,d6 
										sub.w   d7,d6
										addi.w  #$A00,d6
										move.w  d6,2(a1)
										ori.w   #$4000,d5
										move.b  $1D(a0),d0
										andi.w  #3,d0
										cmpi.w  #2,d0
										bne.s   loc_4DA0
										ori.w   #$1000,d5
loc_4DA0:
										move.b  $10(a0),d0
										ext.w   d0
										move.b  byte_4E16(pc,d0.w),d0
										bne.s   loc_4DB0
										ori.w   #$800,d5
loc_4DB0:
										move.b  ((WINDOW_IS_PRESENT-$1000000)).w,d6
										cmp.b   $11(a0),d6
										bge.s   loc_4DBE
										ori.w   #$8000,d5
loc_4DBE:
										move.w  d5,4(a1)
										move.w  (sp)+,d6
loc_4DC4:
										adda.w  #$20,a0 
										addq.l  #8,a1
										dbf     d7,loc_4CDC
										clr.b   -5(a1)
										move.w  (a0),d0
										move.w  2(a0),d1
										sub.w   d2,d0
										sub.w   d3,d1
										asr.w   #4,d0
										asr.w   #4,d1
										cmpi.w  #$FFE8,d0
										blt.w   loc_4E0A
										cmpi.w  #$100,d0
										bgt.w   loc_4E0A
										cmpi.w  #$FFE8,d1
										blt.w   loc_4E0A
										cmpi.w  #$100,d1
										bgt.w   loc_4E0A
loc_4E00:
										jsr     sub_20020
										bra.w   loc_4E10
loc_4E0A:
										jsr     sub_20024
loc_4E10:
										bsr.w   sub_4E24
										rts

	; End of function VInt_UpdateSprites

byte_4E16:          dc.b 0
										dc.b 1
										dc.b 2
										dc.b 3
										dc.b 0
										dc.b 2
										dc.b 2
										dc.b 0

; =============== S U B R O U T I N E =======================================

sub_4E1E:
										move.w  #1,(a1)
										bra.s   loc_4DC4

	; End of function sub_4E1E


; =============== S U B R O U T I N E =======================================

sub_4E24:
										lea     (SPRITE_Y).l,a1 
										moveq   #7,d7
										move.w  #$40,d6 
loc_4E30:
										cmpi.b  #$10,3(a1,d6.w)
										beq.s   loc_4E3E
										addq.w  #8,d6
										dbf     d7,loc_4E30
loc_4E3E:
										clr.b   3(a1,d6.w)
										move.w  #$38,d6 
										moveq   #$2F,d7 
										lea     ((byte_FFAFB0-$1000000)).w,a0
loc_4E4C:
										tst.b   (a0)+
										beq.s   loc_4E5E
loc_4E50:
										move.w  #$3F,d0 
										sub.w   d7,d0
										move.b  d0,3(a1,d6.w)
										move.w  d0,d6
										lsl.w   #3,d6
loc_4E5E:
										dbf     d7,loc_4E4C
										moveq   #$2F,d7 
										lea     ((byte_FFAFB0-$1000000)).w,a0
loc_4E68:
										tst.b   (a0)+
										bne.s   loc_4E7A
										move.w  #$3F,d0 
										sub.w   d7,d0
										move.b  d0,3(a1,d6.w)
										move.w  d0,d6
										lsl.w   #3,d6
loc_4E7A:
										dbf     d7,loc_4E68
loc_4E7E:
										move.b  #8,3(a1,d6.w)
										rts

	; End of function sub_4E24


; =============== S U B R O U T I N E =======================================

sub_4E86:
										movem.l a0-a1,-(sp)
										move.w  d0,-(sp)
										lea     ((byte_FFAF47-$1000000)).w,a1
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										moveq   #$1F,d7
loc_4E96:
										clr.w   d0
										move.b  (a1)+,d0
										bmi.w   loc_4EBE
										lsl.w   #5,d0
										cmpi.w  #$7000,(a0,d0.w)
										bge.s   loc_4E96
										move.w  (a0),(a0,d0.w)
										move.w  (a0),ENTITYDEF_OFFSET_XDEST(a0,d0.w)
										move.w  ENTITYDEF_OFFSET_Y(a0),ENTITYDEF_OFFSET_Y(a0,d0.w)
										move.w  ENTITYDEF_OFFSET_Y(a0),ENTITYDEF_OFFSET_YDEST(a0,d0.w)
										bra.s   loc_4E96
loc_4EBE:
										move.w  (sp)+,d0
										movem.l (sp)+,a0-a1
										rts

	; End of function sub_4E86


; =============== S U B R O U T I N E =======================================

sub_4EC6:
										move.b  #2,((byte_FFAF6A-$1000000)).w
										clr.b   ((byte_FFAF69-$1000000)).w
										move.b  #1,((byte_FFAF6B-$1000000)).w
										rts

	; End of function sub_4EC6


; =============== S U B R O U T I N E =======================================

sub_4ED8:
										move.b  #$14,((byte_FFAF6A-$1000000)).w
										clr.b   ((byte_FFAF69-$1000000)).w
										move.b  #$F,((byte_FFAF6B-$1000000)).w
										rts

	; End of function sub_4ED8


; =============== S U B R O U T I N E =======================================

VInt_UpdateEntities:
										
										clr.b   ((NUM_SPRITES_TO_LOAD-$1000000)).w
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										moveq   #$30,d7 ; do that for each entity
loc_4EF4:
										move.w  (a0),d0
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
										cmpi.w  #$7000,d0       ; check if slot is empty
										bge.w   UpdateNextEntity
										bsr.w   UpdateEntityData
loc_4F06:
										move.l  ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0),d0
										movea.l d0,a1
										beq.w   UpdateNextEntity
										move.w  (a1),d2
										add.w   d2,d2
										move.w  rjt_EntityScriptCommands(pc,d2.w),d2
										jmp     rjt_EntityScriptCommands(pc,d2.w)

	; End of function VInt_UpdateEntities

rjt_EntityScriptCommands:
										dc.w esc00_wait-rjt_EntityScriptCommands
																						; esc for Entity Script Command
										dc.w esc01_waitUntilDestination-rjt_EntityScriptCommands
										dc.w esc02_-rjt_EntityScriptCommands
										dc.w esc03_-rjt_EntityScriptCommands
										dc.w esc04_moveToRelativeDest-rjt_EntityScriptCommands
										dc.w esc05_moveToAbsoluteDest-rjt_EntityScriptCommands
										dc.w esc06_-rjt_EntityScriptCommands
										dc.w esc07_-rjt_EntityScriptCommands
										dc.w esc08_-rjt_EntityScriptCommands
										dc.w esc09_-rjt_EntityScriptCommands
										dc.w esc0A_updateEntitySprite-rjt_EntityScriptCommands
										dc.w esc0B_setSpriteSize-rjt_EntityScriptCommands
										dc.w esc0C_setPosition-rjt_EntityScriptCommands
										dc.w esc0D_clonePosition-rjt_EntityScriptCommands
										dc.w esc0E_-rjt_EntityScriptCommands
										dc.w esc0F_waitUntilOtherEntityReachesDest-rjt_EntityScriptCommands
										dc.w esc10_setSpeed-rjt_EntityScriptCommands
										dc.w esc11_-rjt_EntityScriptCommands
										dc.w esc12_-rjt_EntityScriptCommands
										dc.w esc13_-rjt_EntityScriptCommands
										dc.w esc14_setAnimationCounter-rjt_EntityScriptCommands
										dc.w esc15_setAbilityToChangeFacing-rjt_EntityScriptCommands
										dc.w esc16_setEntityNumber-rjt_EntityScriptCommands
										dc.w esc17_setSpriteNumber-rjt_EntityScriptCommands
										dc.w esc18_set1Cbit7-rjt_EntityScriptCommands
										dc.w esc19_set1Cbit6-rjt_EntityScriptCommands
										dc.w esc1A_set1Cbit5-rjt_EntityScriptCommands
										dc.w esc1B_setEntityFlipping-rjt_EntityScriptCommands
										dc.w esc1C_setEntityTransparency-rjt_EntityScriptCommands
										dc.w esc1D_setEntityGhost-rjt_EntityScriptCommands
										dc.w esc1E_setEntityAnimSpeedx2-rjt_EntityScriptCommands
										dc.w esc1F_set1Dbit3-rjt_EntityScriptCommands
										dc.w esc20_setEntityInWater-rjt_EntityScriptCommands
										dc.w esc21_set1Cbit4-rjt_EntityScriptCommands
										dc.w esc22_setEntityFacing-rjt_EntityScriptCommands
										dc.w esc23_sendSoundCommand-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc30_branch-rjt_EntityScriptCommands
										dc.w esc31_branchIfFlagSet-rjt_EntityScriptCommands
										dc.w esc32_branchIfFlagClear-rjt_EntityScriptCommands
										dc.w esc33_randomBranch-rjt_EntityScriptCommands
										dc.w esc34_jump-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc40_-rjt_EntityScriptCommands
										dc.w esc41_Pass-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands
										dc.w esc_goToNextEntity-rjt_EntityScriptCommands

; =============== S U B R O U T I N E =======================================

; clear timer and parse next command

esc00_wait:
										
										move.w  2(a1),d2        ; timer for next movescript read
										cmp.b   ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a0),d2
										ble.s   loc_4FCE
loc_4FC6:
										addq.b  #1,ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a0)
										bra.w   esc_goToNextEntity
loc_4FCE:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc00_wait


; =============== S U B R O U T I N E =======================================

; wait until entity has reached its destination

esc01_waitUntilDestination:
										
										move.w  (a0),d0         ; pos
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
										move.w  ENTITYDEF_OFFSET_XDEST(a0),d2
																						; dest
										move.w  ENTITYDEF_OFFSET_YDEST(a0),d3
										move.w  d2,d4
										move.w  d3,d5
										sub.w   d0,d4           ; difference
										sub.w   d1,d5
										move.w  d5,d6
										or.w    d4,d6
										bne.w   esc_clearTimerGoToNextEntity
										addq.l  #2,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc01_waitUntilDestination


; =============== S U B R O U T I N E =======================================

; update next entity

esc02_:
										link    a6,#-$A
										move.l  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,-4(a6)
										move.l  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,-8(a6)
										tst.w   d7
										bne.s   loc_502C
										move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,-$A(a6)
										addi.w  #$180,-4(a6)
loc_5018:
										addi.w  #$180,-2(a6)
										subi.w  #$180,-8(a6)
										subi.w  #$180,-6(a6)
										bra.s   loc_5032
loc_502C:
										move.b  ((P1_INPUT-$1000000)).w,-$A(a6)
loc_5032:
										move.w  (a0),d0
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
										clr.w   d2
										clr.w   d3
										clr.w   d4
										clr.w   d5
										moveq   #$FFFFFFFF,d6
loc_5042:
										btst    #0,-$A(a6)
										beq.s   loc_505E
										cmp.w   -2(a6),d1
										ble.s   loc_505E
										move.w  #$FE80,d5
										move.b  $1B(a0),d3
										ext.w   d3
										neg.w   d3
										moveq   #1,d6
loc_505E:
										btst    #1,-$A(a6)
										beq.s   loc_5078
										cmp.w   -6(a6),d1
										bge.s   loc_5078
										move.w  #$180,d5
										move.b  $1B(a0),d3
										ext.w   d3
										moveq   #3,d6
loc_5078:
										btst    #2,-$A(a6)
										beq.s   loc_5094
										cmp.w   -4(a6),d0
										ble.s   loc_5094
										move.w  #$FE80,d4
										move.b  $1A(a0),d2
										ext.w   d2
										neg.w   d2
										moveq   #2,d6
loc_5094:
										btst    #3,-$A(a6)
										beq.s   loc_50AE
										cmp.w   -8(a6),d0
										bge.s   loc_50AE
										move.w  #$180,d4
										move.b  $1A(a0),d2
										ext.w   d2
										clr.w   d6
loc_50AE:
										unlk    a6
										tst.w   d6
										bge.w   loc_50BC
										addq.l  #2,a1
										bra.w   esc_goToNextEntity
loc_50BC:
										btst    #6,$1C(a0)
										beq.w   loc_51A8
										tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
										beq.s   loc_50D6
										btst    #4,((P1_INPUT-$1000000)).w
										bne.w   loc_51A8
loc_50D6:
										btst    #0,d6
										bne.w   loc_51A8
										movem.w d0-d1,-(sp)
										movem.w d2-d3,-(sp)
										bsr.w   GetMapPixelCoordRAMOffset
										move.w  d2,d0
										movem.w (sp)+,d2-d3
										move.w  (a4,d0.w),d1
										andi.w  #$C000,d1
										btst    #$F,d1
										beq.s   loc_514E
										tst.w   d6
										bne.w   loc_5124
										addi.w  #-$7E,d0
										move.w  (a4,d0.w),d0
										andi.w  #$C000,d0
										cmp.w   d0,d1
										bne.s   loc_5124
										move.w  #$FE80,d5
										move.b  $1B(a0),d3
										ext.w   d3
										neg.w   d3
										bra.w   loc_51A4
loc_5124:
										cmpi.w  #2,d6
										bne.w   loc_514A
										addi.w  #$7E,d0 
										move.w  (a4,d0.w),d0
										andi.w  #$C000,d0
										cmp.w   d0,d1
										bne.s   loc_514A
										move.w  #$180,d5
										move.b  $1B(a0),d3
										ext.w   d3
										bra.w   loc_51A4
loc_514A:
										bra.w   loc_51A4
loc_514E:
										btst    #$E,d1
										beq.s   loc_51A4
										tst.w   d6
										bne.w   loc_5178
										addi.w  #$82,d0 
										move.w  (a4,d0.w),d0
										andi.w  #$C000,d0
										cmp.w   d0,d1
										bne.s   loc_5178
										move.w  #$180,d5
										move.b  $1B(a0),d3
										ext.w   d3
										bra.w   loc_51A4
loc_5178:
										cmpi.w  #2,d6
										bne.w   loc_51A0
										addi.w  #-$82,d0
										move.w  (a4,d0.w),d0
										andi.w  #$C000,d0
										cmp.w   d0,d1
										bne.s   loc_51A0
										move.w  #$FE80,d5
										move.b  $1B(a0),d3
										ext.w   d3
										neg.w   d3
										bra.w   loc_51A4
loc_51A0:
										bra.w   *+4
loc_51A4:
										movem.w (sp)+,d0-d1
loc_51A8:
										add.w   d4,d0
										add.w   d5,d1
										movem.w d4-d6,-(sp)
										btst    #5,$1C(a0)
										beq.w   loc_5220
										moveq   #$1F,d6
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a2
loc_51C0:
										btst    #7,ENTITYDEF_OFFSET_FLAGS_A(a2)
										beq.w   loc_5218
										move.w  (a2),d4
										move.w  ENTITYDEF_OFFSET_Y(a2),d5
										sub.w   d0,d4
										bpl.s   loc_51D6
										neg.w   d4
loc_51D6:
										cmpi.w  #$100,d4
										bge.w   loc_51EC
										sub.w   d1,d5
										bpl.s   loc_51E4
										neg.w   d5
loc_51E4:
										cmpi.w  #$100,d5
										blt.w   loc_5210
loc_51EC:
										move.w  ENTITYDEF_OFFSET_XDEST(a2),d4
										move.w  ENTITYDEF_OFFSET_YDEST(a2),d5
										sub.w   d0,d4
										bpl.s   loc_51FA
										neg.w   d4
loc_51FA:
										cmpi.w  #$100,d4
										bge.w   loc_5218
										sub.w   d1,d5
										bpl.s   loc_5208
										neg.w   d5
loc_5208:
										cmpi.w  #$100,d5
										bge.w   loc_5218
loc_5210:
										movem.w (sp)+,d4-d6
										bra.w   loc_531E
loc_5218:
										adda.w  #$20,a2 
										dbf     d6,loc_51C0
loc_5220:
										movem.w (sp)+,d4-d6
										movem.w d2-d3,-(sp)
										bsr.w   GetMapPixelCoordRAMOffset
										move.w  (a4,d2.w),d3
										andi.w  #$3C00,d3
										cmpi.w  #$3800,d3
										bne.s   loc_5256
										cmpi.b  #$FF,((CURRENT_BATTLE-$1000000)).w
										bne.s   loc_5256
										trap    #CHECK_FLAG
										dc.w $41                ; Caravan is unlocked (0x4428A..0x44337, 0x44338..0x44403)
										beq.s   loc_5256
										move.w  #2,((MAP_EVENT_TYPE-$1000000)).w
										movem.w (sp)+,d2-d3
										bra.w   loc_531E
loc_5256:
										cmpi.w  #$3C00,d3
										bne.s   loc_5278
										cmpi.b  #$FF,((CURRENT_BATTLE-$1000000)).w
										bne.s   loc_5278
										trap    #CHECK_FLAG
										dc.w $40                ; Raft is unlocked (0x05264)
										beq.s   loc_5278
										move.w  #3,((MAP_EVENT_TYPE-$1000000)).w
										movem.w (sp)+,d2-d3
										bra.w   loc_531E
loc_5278:
										cmpi.w  #$400,d3
										bne.s   loc_528A
										bsr.w   sub_3E40        
										move.w  (a4,d2.w),d3
										andi.w  #$3C00,d3
loc_528A:
										cmpi.w  #$1000,d3
										bne.s   loc_5294
										bsr.w   WarpIfSetAtPoint
loc_5294:
										cmpi.w  #$1400,d3
										bne.s   loc_52C0
										move.w  #6,((MAP_EVENT_TYPE-$1000000)).w
										move.w  $C(a0),d3
										add.w   d4,d3
										ext.l   d3
										divs.w  #$180,d3
										move.w  d3,((byte_FFA84C-$1000000)).w
										move.w  $E(a0),d3
										add.w   d5,d3
										ext.l   d3
loc_52B8:
										divs.w  #$180,d3
										move.w  d3,((byte_FFA84E-$1000000)).w
loc_52C0:
										cmpi.w  #$C000,(a4,d2.w)
										movem.w (sp)+,d2-d3
										bcs.w   loc_52E8
										tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
										beq.s   loc_52DE
										btst    #4,((P1_INPUT-$1000000)).w
										bne.w   loc_52E8
loc_52DE:
										btst    #6,$1C(a0)
										bne.w   loc_531E
loc_52E8:
										move.w  d0,-(sp)
										move.w  ((MOVE_SOUND-$1000000)).w,d0
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_GET_D0_PARAMETER
										move.w  (sp)+,d0
										move.w  d2,4(a0)
										beq.s   loc_5300
										move.w  #$180,8(a0)
loc_5300:
										move.w  d3,6(a0)
										beq.s   loc_530C
										move.w  #$180,$A(a0)
loc_530C:
										add.w   d4,$C(a0)
										add.w   d5,$E(a0)
										tst.w   ((word_FFB196-$1000000)).w
										ble.s   loc_531E
										subq.w  #1,((word_FFB196-$1000000)).w
loc_531E:
										bsr.w   UpdateEntitySprite
										addq.l  #2,a1
										bra.w   esc_goToNextEntity

	; End of function esc02_


; =============== S U B R O U T I N E =======================================

esc03_:
										move.w  (a0),d0
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
										move.l  a0,-(sp)
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										move.w  2(a1),d2
										lsl.w   #5,d2
										adda.w  d2,a0
										move.w  (a0),d2
										move.w  ENTITYDEF_OFFSET_Y(a0),d3
										sub.w   d2,d0
										bpl.s   loc_5348
										neg.w   d0
loc_5348:
										sub.w   d3,d1
										bpl.s   loc_534E
										neg.w   d1
loc_534E:
										cmp.w   d0,d1
										ble.s   loc_5354
										move.w  d1,d0
loc_5354:
										cmpi.w  #$1E0,d0
										bgt.s   loc_5360
										movea.l (sp)+,a0
										bra.w   loc_53F8
loc_5360:
										move.b  ENTITYDEF_OFFSET_FACING(a0),d4
										move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
										move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
										move.w  4(a1),d2
										lsl.w   #4,d2
										move.w  6(a1),d3
										lsl.w   #4,d3
										bsr.w   sub_5FAC
										bsr.w   GetMapPixelCoordRAMOffset
										cmpi.w  #$C000,(a4,d2.w)
										bcs.s   loc_53B4
										move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
										move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
										move.w  4(a1),d2
										lsl.w   #4,d2
										clr.w   d3
										move.b  ENTITYDEF_OFFSET_FACING(a0),d4
										bsr.w   sub_5FAC
										bsr.w   GetMapPixelCoordRAMOffset
										cmpi.w  #$C000,(a4,d2.w)
										bcs.s   loc_53B4
										move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
										move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
loc_53B4:
										movea.l (sp)+,a0
										move.w  d0,ENTITYDEF_OFFSET_XDEST(a0)
										move.w  (a0),d2
										move.b  ENTITYDEF_OFFSET_XSPEED(a0),d3
										ext.w   d3
										sub.w   d2,d0
										bne.s   loc_53C8
										clr.w   d3
loc_53C8:
										bpl.s   loc_53CE
										neg.w   d0
										neg.w   d3
loc_53CE:
										move.w  d0,8(a0)
										move.w  d3,4(a0)
										move.w  d1,ENTITYDEF_OFFSET_YDEST(a0)
										move.w  ENTITYDEF_OFFSET_Y(a0),d2
										move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
										ext.w   d3
										sub.w   d2,d1
										bne.s   loc_53EA
										clr.w   d3
loc_53EA:
										bpl.s   loc_53F0
										neg.w   d1
										neg.w   d3
loc_53F0:
										move.w  d1,$A(a0)
										move.w  d3,6(a0)
loc_53F8:
										addq.l  #8,a1
										bra.w   esc_goToNextEntity

	; End of function esc03_


; =============== S U B R O U T I N E =======================================

; related to moving an entity

esc04_moveToRelativeDest:
										
										move.w  2(a1),d0
										move.w  4(a1),d1
										muls.w  #$180,d0
										muls.w  #$180,d1
										add.w   (a0),d0         ; get new pos
										add.w   ENTITYDEF_OFFSET_Y(a0),d1
										bsr.w   CheckIfSameDestForOtherEntity
										bne.w   esc_goToNextEntity
										addq.l  #6,a1
										bra.w   loc_55C8

	; End of function esc04_moveToRelativeDest


; =============== S U B R O U T I N E =======================================

esc05_moveToAbsoluteDest:
										
										move.w  2(a1),d0
										move.w  4(a1),d1
										mulu.w  #$180,d0
										mulu.w  #$180,d1
										bsr.w   CheckIfSameDestForOtherEntity
										bne.w   esc_goToNextEntity
										addq.l  #6,a1
										bra.w   loc_55C8

	; End of function esc05_moveToAbsoluteDest


; =============== S U B R O U T I N E =======================================

esc06_:
										move.w  2(a1),d2
										move.w  4(a1),d3
										move.w  2(a1),d4
										move.w  4(a1),d5
										sub.w   6(a1),d2
										sub.w   6(a1),d3
										add.w   6(a1),d4
										add.w   6(a1),d5
										mulu.w  #$180,d2
										mulu.w  #$180,d3
										mulu.w  #$180,d4
										mulu.w  #$180,d5
										moveq   #3,d6
loc_5472:
										move.w  d6,-(sp)
										movem.w d7,-(sp)
										move.w  (a0),d0
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
										moveq   #4,d6
										bsr.w   UpdateRandomSeed
										move.w  d7,d6
										movem.w (sp)+,d7
										bne.s   loc_549A
										cmp.w   d4,d0
										bge.w   loc_55B8
										addi.w  #$180,d0
										bra.w   loc_54CC
loc_549A:
										cmpi.w  #1,d6
										bne.s   loc_54AE
										cmp.w   d3,d1
										ble.w   loc_55B8
										subi.w  #$180,d1
										bra.w   loc_54CC
loc_54AE:
										cmpi.w  #2,d6
										bne.s   loc_54C2
										cmp.w   d2,d0
										ble.w   loc_55B8
										subi.w  #$180,d0
										bra.w   loc_54CC
loc_54C2:
										cmp.w   d5,d1
										bge.w   loc_55B8
										addi.w  #$180,d1
loc_54CC:
										btst    #6,$1C(a0)
										beq.w   loc_55B0
										move.w  d7,-(sp)
										clr.w   d7
										btst    #0,d6
										bne.w   loc_5596
										movem.w d0-d1,-(sp)
										movem.w d2-d3,-(sp)
										move.w  (a0),d0
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
										bsr.w   GetMapPixelCoordRAMOffset
										move.w  d2,d0
										movem.w (sp)+,d2-d3
										move.w  (a4,d0.w),d1
										andi.w  #$C000,d1
										btst    #$F,d1
										beq.s   loc_554A
										tst.w   d6
										bne.w   loc_5526
										addi.w  #-$7E,d0
										move.w  (a4,d0.w),d0
										andi.w  #$C000,d0
										cmp.w   d0,d1
										bne.s   loc_5526
										move.w  #$FE80,d7
										bra.w   loc_5592
loc_5526:
										cmpi.w  #2,d6
										bne.w   loc_5546
										addi.w  #$7E,d0 
										move.w  (a4,d0.w),d0
										andi.w  #$C000,d0
										cmp.w   d0,d1
										bne.s   loc_5546
										move.w  #$180,d7
										bra.w   loc_5592
loc_5546:
										bra.w   loc_5592
loc_554A:
										btst    #$E,d1
										beq.s   loc_5592
										tst.w   d6
										bne.w   loc_556E
										addi.w  #$82,d0 
										move.w  (a4,d0.w),d0
										andi.w  #$C000,d0
										cmp.w   d0,d1
										bne.s   loc_556E
										move.w  #$180,d7
										bra.w   loc_5592
loc_556E:
										cmpi.w  #2,d6
										bne.w   loc_558E
										addi.w  #-$82,d0
										move.w  (a4,d0.w),d0
										andi.w  #$C000,d0
										cmp.w   d0,d1
										bne.s   loc_558E
										move.w  #$FE80,d7
										bra.w   loc_5592
loc_558E:
										bra.w   *+4
loc_5592:
										movem.w (sp)+,d0-d1
loc_5596:
										add.w   d7,d1
										move.w  (sp)+,d7
										movem.w d2-d3,-(sp)
										bsr.w   GetMapPixelCoordRAMOffset
										cmpi.w  #$C000,(a4,d2.w)
										movem.w (sp)+,d2-d3
										bcc.w   loc_55B8
loc_55B0:
										bsr.w   CheckIfSameDestForOtherEntity
										beq.w   loc_55C4
loc_55B8:
										move.w  (sp)+,d6
										dbf     d6,loc_5472
										addq.l  #8,a1
										bra.w   esc_goToNextEntity
loc_55C4:
										move.w  (sp)+,d6
										addq.l  #8,a1

	; End of function esc06_


; START OF FUNCTION CHUNK FOR esc04_moveToRelativeDest

loc_55C8:
										clr.w   d4
										clr.w   d5
										move.b  ENTITYDEF_OFFSET_XSPEED(a0),d4
										move.b  ENTITYDEF_OFFSET_YSPEED(a0),d5
										move.w  d0,ENTITYDEF_OFFSET_XDEST(a0)
										cmp.w   (a0),d0
										bne.s   loc_55DE
										clr.w   d4
loc_55DE:
										sub.w   (a0),d0
										bpl.s   loc_55E6
										neg.w   d0
										neg.w   d4
loc_55E6:
										move.w  d1,ENTITYDEF_OFFSET_YDEST(a0)
										cmp.w   ENTITYDEF_OFFSET_Y(a0),d1
										bne.s   loc_55F2
										clr.w   d5
loc_55F2:
										sub.w   ENTITYDEF_OFFSET_Y(a0),d1
										bpl.s   loc_55FC
										neg.w   d1
										neg.w   d5
loc_55FC:
										move.w  d0,8(a0)
loc_5600:
										move.w  d1,$A(a0)
										move.w  d4,4(a0)
										move.w  d5,6(a0)
										bra.w   esc_clearTimerGoToNextCommand

; END OF FUNCTION CHUNK FOR esc04_moveToRelativeDest


; =============== S U B R O U T I N E =======================================

; check if another entity has the same destination as current entity
; Z=1 if that's the case

CheckIfSameDestForOtherEntity:
										
										movem.w d4-d6,-(sp)
										btst    #5,$1C(a0)      ; end if not obstructed by people
										beq.w   loc_5660
										moveq   #$30,d6 
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a2
loc_5624:
										cmpi.w  #$7000,(a2)     ; test each entity
										beq.w   loc_5658
										cmp.w   d6,d7
										beq.w   loc_5658
										move.w  $C(a2),d4       ; compare dests
										move.w  $E(a2),d5
										sub.w   d0,d4
										bpl.s   loc_5640
										neg.w   d4
loc_5640:
										sub.w   d1,d5
										bpl.s   loc_5646
										neg.w   d5
loc_5646:
										add.w   d4,d5
										cmpi.w  #$180,d5
										bcc.w   loc_5658
										moveq   #$FFFFFFFF,d4
										movem.w (sp)+,d4-d6
										rts
loc_5658:
										adda.w  #$20,a2 
loc_565C:
										dbf     d6,loc_5624     
loc_5660:
										clr.w   d4
										movem.w (sp)+,d4-d6
										rts

	; End of function CheckIfSameDestForOtherEntity


; =============== S U B R O U T I N E =======================================

; related to controlling raft

esc07_:
										link    a6,#-$A
										move.l  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,-4(a6)
loc_5672:
										move.l  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,-8(a6)
										move.b  ((P1_INPUT-$1000000)).w,-$A(a6)
										move.w  (a0),d0
										move.w  2(a0),d1        ; get pos
										clr.w   d2
										clr.w   d3
										clr.w   d4
										clr.w   d5
										moveq   #$FFFFFFFF,d6
										btst    #0,-$A(a6)
										beq.s   loc_56AA
										cmp.w   -2(a6),d1
										ble.s   loc_56AA
										move.w  #$FE80,d5
										move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
										ext.w   d3
										neg.w   d3
										moveq   #1,d6
loc_56AA:
										btst    #1,-$A(a6)
										beq.s   loc_56C4
										cmp.w   -6(a6),d1
										bge.s   loc_56C4
										move.w  #$180,d5
										move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
										ext.w   d3
										moveq   #3,d6
loc_56C4:
										btst    #2,-$A(a6)
										beq.s   loc_56E0
										cmp.w   -4(a6),d0
										ble.s   loc_56E0
										move.w  #$FE80,d4
										move.b  ENTITYDEF_OFFSET_XSPEED(a0),d2
										ext.w   d2
										neg.w   d2
										moveq   #2,d6
loc_56E0:
										btst    #3,-$A(a6)
										beq.s   loc_56FA
										cmp.w   -8(a6),d0
										bge.s   loc_56FA
										move.w  #$180,d4
										move.b  ENTITYDEF_OFFSET_XSPEED(a0),d2
										ext.w   d2
										clr.w   d6
loc_56FA:
										unlk    a6
										tst.w   d6
										bge.w   loc_5708
										addq.l  #2,a1
										bra.w   esc_goToNextEntity
loc_5708:
										add.w   d4,d0
										add.w   d5,d1
										movem.w d4-d6,-(sp)
										btst    #5,$1C(a0)
										beq.w   loc_575C
										moveq   #$1F,d6
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a2
loc_5720:
										btst    #7,ENTITYDEF_OFFSET_FLAGS_A(a2)
										beq.w   loc_5754
										move.w  (a2),d4
										move.w  2(a2),d5
										sub.w   d0,d4
										bpl.s   loc_5736
										neg.w   d4
loc_5736:
										cmpi.w  #$100,d4
										bge.w   loc_5754
										sub.w   d1,d5
										bpl.s   loc_5744
										neg.w   d5
loc_5744:
										cmpi.w  #$100,d5
										bge.w   loc_5754
										movem.w (sp)+,d4-d6
										bra.w   loc_57E0
loc_5754:
										adda.w  #$20,a2 
										dbf     d6,loc_5720
loc_575C:
										movem.w (sp)+,d4-d6
										movem.w d2-d3,-(sp)
										bsr.w   GetMapPixelCoordRAMOffset
										move.w  (a4,d2.w),d3
										andi.w  #$3C00,d3
										cmpi.w  #$400,d3
										bne.s   loc_5782
										bsr.w   sub_3E40        
loc_577A:
										move.w  (a4,d2.w),d3
										andi.w  #$3C00,d3
loc_5782:
										cmpi.w  #$1000,d3
										bne.s   loc_5794
										bsr.w   WarpIfSetAtPoint
										movem.w (sp)+,d2-d3
loc_5790:
										bra.w   loc_57C0
loc_5794:
										cmpi.w  #$3800,d3
										bne.s   loc_57A2
loc_579A:
										movem.w (sp)+,d2-d3
										bra.w   loc_57C0
loc_57A2:
										cmpi.w  #$C000,(a4,d2.w)
										bcc.s   loc_57B8
										move.w  #4,((MAP_EVENT_TYPE-$1000000)).w
										movem.w (sp)+,d2-d3
loc_57B4:
										bra.w   loc_57E0
loc_57B8:
										movem.w (sp)+,d2-d3
										bra.w   loc_57E0
loc_57C0:
										move.w  d2,4(a0)
										beq.s   loc_57CC
										move.w  #$180,8(a0)
loc_57CC:
										move.w  d3,6(a0)
										beq.s   loc_57D8
										move.w  #$180,$A(a0)
loc_57D8:
										add.w   d4,ENTITYDEF_OFFSET_XDEST(a0)
										add.w   d5,ENTITYDEF_OFFSET_YDEST(a0)
loc_57E0:
										bsr.w   UpdateEntitySprite
										addq.l  #2,a1
										bra.w   esc_goToNextEntity

	; End of function esc07_


; =============== S U B R O U T I N E =======================================

; related to controlling caravan

esc08_:
										link    a6,#-$A
										move.l  ((MAP_AREA_LAYER1_STARTX-$1000000)).w,-4(a6)
										move.l  ((MAP_AREA_LAYER1_ENDX-$1000000)).w,-8(a6)
										move.b  ((P1_INPUT-$1000000)).w,-$A(a6)
										move.w  (a0),d0
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
										clr.w   d2
										clr.w   d3
										clr.w   d4
										clr.w   d5
										moveq   #$FFFFFFFF,d6
loc_5810:
										btst    #INPUT_A_UP_BIT,-$A(a6)
										beq.s   loc_582C
										cmp.w   -2(a6),d1
										ble.s   loc_582C
										move.w  #$FE80,d5
										move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
										ext.w   d3
										neg.w   d3
										moveq   #1,d6
loc_582C:
										btst    #INPUT_A_DOWN_BIT,-$A(a6)
										beq.s   loc_5846
										cmp.w   -6(a6),d1
										bge.s   loc_5846
										move.w  #$180,d5
										move.b  ENTITYDEF_OFFSET_YSPEED(a0),d3
										ext.w   d3
										moveq   #3,d6
loc_5846:
										btst    #INPUT_A_LEFT_BIT,-$A(a6)
										beq.s   loc_5862
										cmp.w   -4(a6),d0
										ble.s   loc_5862
										move.w  #$FE80,d4
										move.b  ENTITYDEF_OFFSET_XSPEED(a0),d2
										ext.w   d2
										neg.w   d2
										moveq   #2,d6
loc_5862:
										btst    #INPUT_A_RIGHT_BIT,-$A(a6)
										beq.s   loc_587C
										cmp.w   -8(a6),d0
										bge.s   loc_587C
										move.w  #$180,d4
										move.b  ENTITYDEF_OFFSET_XSPEED(a0),d2
										ext.w   d2
										clr.w   d6
loc_587C:
										unlk    a6
										tst.w   d6
										bge.w   loc_588A
										addq.l  #2,a1
										bra.w   esc_goToNextEntity
loc_588A:
										add.w   d4,d0
										add.w   d5,d1
										movem.w d4-d6,-(sp)
										btst    #5,$1C(a0)
										beq.w   loc_58DE
										moveq   #$1F,d6
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a2
loc_58A2:
										btst    #7,$1C(a2)
										beq.w   loc_58D6
										move.w  (a2),d4
										move.w  ENTITYDEF_OFFSET_Y(a2),d5
										sub.w   d0,d4
										bpl.s   loc_58B8
										neg.w   d4
loc_58B8:
										cmpi.w  #$100,d4
										bge.w   loc_58D6
										sub.w   d1,d5
										bpl.s   loc_58C6
										neg.w   d5
loc_58C6:
										cmpi.w  #$100,d5
										bge.w   loc_58D6
										movem.w (sp)+,d4-d6
										bra.w   loc_5962
loc_58D6:
										adda.w  #$20,a2 
										dbf     d6,loc_58A2
loc_58DE:
										movem.w (sp)+,d4-d6
										movem.w d2-d3,-(sp)
										bsr.w   GetMapPixelCoordRAMOffset
										move.w  (a4,d2.w),d3
										andi.w  #$3C00,d3
										cmpi.w  #$400,d3
										bne.s   loc_5904
										bsr.w   sub_3E40        
										move.w  (a4,d2.w),d3
										andi.w  #$3C00,d3
loc_5904:
										cmpi.w  #$1000,d3
										bne.s   loc_5916
										bsr.w   WarpIfSetAtPoint
										movem.w (sp)+,d2-d3
										bra.w   loc_5942
loc_5916:
										cmpi.w  #$3C00,d3
										bne.s   loc_5924
										movem.w (sp)+,d2-d3
										bra.w   loc_5942
loc_5924:
										cmpi.w  #$C000,(a4,d2.w)
										bcc.s   loc_593A
										move.w  #5,((MAP_EVENT_TYPE-$1000000)).w
										movem.w (sp)+,d2-d3
										bra.w   loc_5962
loc_593A:
										movem.w (sp)+,d2-d3
										bra.w   loc_5962
loc_5942:
										move.w  d2,4(a0)
										beq.s   loc_594E
										move.w  #$180,8(a0)
loc_594E:
										move.w  d3,6(a0)
										beq.s   loc_595A
										move.w  #$180,$A(a0)
loc_595A:
										add.w   d4,ENTITYDEF_OFFSET_XDEST(a0)
										add.w   d5,ENTITYDEF_OFFSET_YDEST(a0)
loc_5962:
										bsr.w   UpdateEntitySprite
										addq.l  #2,a1
										bra.w   esc_goToNextEntity

	; End of function esc08_


; =============== S U B R O U T I N E =======================================

; related to facing

esc09_:
										movem.l d2-d3,-(sp)
										move.w  2(a1),d2
										move.w  4(a1),d3
										move.b  ENTITYDEF_OFFSET_FACING(a0),d0
																						; facing
										move.w  d0,d1
										andi.w  #4,d0
										andi.w  #3,d1
										add.w   d1,d2
										andi.w  #3,d2
										or.w    d0,d2
										lsl.w   #2,d2
										move.w  word_59AC(pc,d2.w),d0
										move.w  word_59AE(pc,d2.w),d1
										muls.w  d3,d0
										muls.w  d3,d1
										add.w   (a0),d0
										add.w   ENTITYDEF_OFFSET_Y(a0),d1
										movem.l (sp)+,d2-d3
										addq.l  #6,a1
										bra.w   loc_55C8
word_59AC:
										
										dc.w $180
word_59AE:
										
										dc.w 0
										dc.w 0
										dc.w $FE80
										dc.w $FE80
										dc.w 0
										dc.w 0
										dc.w $180
										dc.w $180
										dc.w $FE80
										dc.w $FE80
										dc.w $FE80
										dc.w $FE80
										dc.w $180
										dc.w $180
										dc.w $180

	; End of function esc09_


; =============== S U B R O U T I N E =======================================

; same facing as other entity ?

esc0E_:
										movem.l d2-d3/a1,-(sp)
										move.w  4(a1),d2
										move.w  6(a1),d3
										move.w  2(a1),d0
										lsl.w   #5,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a1
										adda.w  d0,a1
										move.b  ENTITYDEF_OFFSET_FACING(a1),d0
																						; other entity facing
										move.w  d0,d1
										andi.w  #4,d0
										andi.w  #3,d1
										add.w   d1,d2
										andi.w  #3,d2
										or.w    d0,d2
										lsl.w   #2,d2
										move.w  word_59AC(pc,d2.w),d0
										move.w  word_59AE(pc,d2.w),d1
										muls.w  d3,d0
										muls.w  d3,d1
										add.w   (a1),d0
										add.w   2(a1),d1
										movem.l (sp)+,d2-d3/a1
										addq.l  #8,a1
										bra.w   loc_55C8

	; End of function esc0E_


; =============== S U B R O U T I N E =======================================

; force entity sprite update ?

esc0A_updateEntitySprite:
										
										cmpi.b  #7,((NUM_SPRITES_TO_LOAD-$1000000)).w
										bgt.w   esc_goToNextEntity
										move.b  ENTITYDEF_OFFSET_FACING(a0),d6
										bsr.w   ChangeEntitySprite
										addq.l  #2,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc0A_updateEntitySprite


; =============== S U B R O U T I N E =======================================

; update FFAF44

esc0B_setSpriteSize:
										
										move.w  2(a1),((SPRITE_SIZE-$1000000)).w
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc0B_setSpriteSize


; =============== S U B R O U T I N E =======================================

; set new pos/dest, clear offset

esc0C_setPosition:
										
										move.w  2(a1),d0
										move.w  4(a1),d1
										muls.w  #$180,d0
										muls.w  #$180,d1
										move.w  d0,(a0)
										move.w  d1,ENTITYDEF_OFFSET_Y(a0)
										move.w  d0,ENTITYDEF_OFFSET_XDEST(a0)
										move.w  d1,ENTITYDEF_OFFSET_YDEST(a0)
										clr.l   8(a0)
										addq.l  #6,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc0C_setPosition


; =============== S U B R O U T I N E =======================================

; set same X pos, dest, offset and facing as other entity

esc0D_clonePosition:
										
										move.l  a1,-(sp)
										move.w  2(a1),d0
										lsl.w   #5,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a1
										adda.w  d0,a1
										move.l  (a1),(a0)
										move.l  ENTITYDEF_OFFSET_XDEST(a1),ENTITYDEF_OFFSET_XDEST(a0)
										move.l  8(a1),8(a0)
										move.b  ENTITYDEF_OFFSET_FACING(a1),d6
										move.b  d6,ENTITYDEF_OFFSET_FACING(a0)
										bsr.w   ChangeEntitySprite
										movea.l (sp)+,a1
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc0D_clonePosition


; =============== S U B R O U T I N E =======================================

esc0F_waitUntilOtherEntityReachesDest:
										
										move.l  a0,-(sp)
										move.w  2(a1),d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										lsl.w   #5,d0
										adda.w  d0,a0
										move.w  (a0),d0         ; pos
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
										move.w  ENTITYDEF_OFFSET_XDEST(a0),d2
																						; dest
										move.w  ENTITYDEF_OFFSET_YDEST(a0),d3
										move.w  d2,d4
										move.w  d3,d5
										sub.w   d0,d4
										sub.w   d1,d5
										move.w  d5,d6
										or.w    d4,d6
										movea.l (sp)+,a0
										bne.w   esc_clearTimerGoToNextEntity
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc0F_waitUntilOtherEntityReachesDest


; =============== S U B R O U T I N E =======================================

; set entity 1A-1B values with xxxx

esc10_setSpeed:
										
										move.w  2(a1),ENTITYDEF_OFFSET_XSPEED(a0)
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc10_setSpeed


; =============== S U B R O U T I N E =======================================

; set entity 18-19 values with xxxx

esc11_:
										move.w  2(a1),$18(a0)
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc11_


; =============== S U B R O U T I N E =======================================

; set or clear entity value 1C bits 0-1 according to xxxx

esc12_:
										tst.b   2(a1)
										bne.s   loc_5AEE
										bclr    #0,$1C(a0)
										bra.s   loc_5AF4
loc_5AEE:
										bset    #0,$1C(a0)
loc_5AF4:
										tst.b   3(a1)
										bne.s   loc_5B02
										bclr    #1,$1C(a0)
										bra.s   loc_5B08
loc_5B02:
										bset    #1,$1C(a0)
loc_5B08:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc12_


; =============== S U B R O U T I N E =======================================

; set or clear entity value 1C bits 2-3 according to xxxx

esc13_:
										tst.b   2(a1)
										bne.s   loc_5B1C
										bclr    #2,$1C(a0)
										bra.s   loc_5B22
loc_5B1C:
										bset    #2,$1C(a0)
loc_5B22:
										tst.b   3(a1)
										bne.s   loc_5B30
										bclr    #3,$1C(a0)
										bra.s   loc_5B36
loc_5B30:
										bset    #3,$1C(a0)
loc_5B36:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc13_


; =============== S U B R O U T I N E =======================================

esc14_setAnimationCounter:
										
										tst.w   2(a1)
										beq.s   loc_5B4A
										move.b  #1,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
										bra.s   loc_5B50
loc_5B4A:
										move.b  #$FF,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
loc_5B50:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc14_setAnimationCounter


; =============== S U B R O U T I N E =======================================

esc15_setAbilityToChangeFacing:
										
										tst.w   2(a1)
										bne.s   loc_5B64
										bclr    #6,$1D(a0)
										bra.s   loc_5B6A
loc_5B64:
										bset    #6,$1D(a0)
loc_5B6A:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc15_setAbilityToChangeFacing


; =============== S U B R O U T I N E =======================================

esc16_setEntityNumber:
										
										move.b  3(a1),ENTITYDEF_OFFSET_ENTNUM(a0)
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc16_setEntityNumber


; =============== S U B R O U T I N E =======================================

esc17_setSpriteNumber:
										
										move.b  3(a1),ENTITYDEF_OFFSET_MAPSPRITE(a0)
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc17_setSpriteNumber


; =============== S U B R O U T I N E =======================================

; set or clear entity value 1C bit 7 according to xxxx

esc18_set1Cbit7:
										
										tst.w   2(a1)
										bne.s   loc_5B96
										bclr    #7,ENTITYDEF_OFFSET_FLAGS_A(a0)
										bra.s   loc_5B9C
loc_5B96:
										bset    #7,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5B9C:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc18_set1Cbit7


; =============== S U B R O U T I N E =======================================

; set or clear entity value 1C bit 6 according to xxxx

esc19_set1Cbit6:
										
										tst.w   2(a1)
										bne.s   loc_5BB0
										bclr    #6,ENTITYDEF_OFFSET_FLAGS_A(a0)
										bra.s   loc_5BB6
loc_5BB0:
										bset    #6,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5BB6:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc19_set1Cbit6


; =============== S U B R O U T I N E =======================================

; set or clear entity value 1C bit 5 according to xxxx

esc1A_set1Cbit5:
										
										tst.w   2(a1)
										bne.s   loc_5BCA
										bclr    #5,ENTITYDEF_OFFSET_FLAGS_A(a0)
										bra.s   loc_5BD0
loc_5BCA:
										bset    #5,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5BD0:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc1A_set1Cbit5


; =============== S U B R O U T I N E =======================================

esc1B_setEntityFlipping:
										
										move.w  2(a1),d0
										andi.w  #3,d0
										andi.b  #$FC,ENTITYDEF_OFFSET_FLAGS_B(a0)
										or.b    d0,ENTITYDEF_OFFSET_FLAGS_B(a0)
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc1B_setEntityFlipping


; =============== S U B R O U T I N E =======================================

esc1C_setEntityTransparency:
										
										tst.w   2(a1)
										bne.s   loc_5BFC
										bclr    #7,ENTITYDEF_OFFSET_FLAGS_B(a0)
										bra.s   loc_5C02
loc_5BFC:
										bset    #7,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5C02:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc1C_setEntityTransparency


; =============== S U B R O U T I N E =======================================

esc1D_setEntityGhost:
										
										tst.w   2(a1)
										bne.s   loc_5C16
										bclr    #2,ENTITYDEF_OFFSET_FLAGS_B(a0)
										bra.s   loc_5C1C
loc_5C16:
										bset    #2,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5C1C:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc1D_setEntityGhost


; =============== S U B R O U T I N E =======================================

esc1E_setEntityAnimSpeedx2:
										
										tst.w   2(a1)
										bne.s   loc_5C30
										bclr    #4,ENTITYDEF_OFFSET_FLAGS_B(a0)
										bra.s   loc_5C36
loc_5C30:
										bset    #4,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5C36:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc1E_setEntityAnimSpeedx2


; =============== S U B R O U T I N E =======================================

; set entity bit 3 of byte $1D

esc1F_set1Dbit3:
										
										tst.w   2(a1)
										bne.s   loc_5C4A
										bclr    #3,ENTITYDEF_OFFSET_FLAGS_B(a0)
										bra.s   loc_5C50
loc_5C4A:
										bset    #3,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5C50:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc1F_set1Dbit3


; =============== S U B R O U T I N E =======================================

; set entity bit 5 of byte $1D

esc20_setEntityInWater:
										
										tst.w   2(a1)
										bne.s   loc_5C64
										bclr    #5,ENTITYDEF_OFFSET_FLAGS_B(a0)
										bra.s   loc_5C6A
loc_5C64:
										bset    #5,ENTITYDEF_OFFSET_FLAGS_B(a0)
loc_5C6A:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc20_setEntityInWater


; =============== S U B R O U T I N E =======================================

; set entity bit 4 of byte $1C

esc21_set1Cbit4:
										
										tst.w   2(a1)
										bne.s   loc_5C7E
										bclr    #4,ENTITYDEF_OFFSET_FLAGS_A(a0)
										bra.s   loc_5C84
loc_5C7E:
										bset    #4,ENTITYDEF_OFFSET_FLAGS_A(a0)
loc_5C84:
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc21_set1Cbit4


; =============== S U B R O U T I N E =======================================

esc22_setEntityFacing:
										
										move.w  2(a1),d0
										move.b  d0,ENTITYDEF_OFFSET_FACING(a0)
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc22_setEntityFacing


; =============== S U B R O U T I N E =======================================

esc23_sendSoundCommand:
										
										move.w  2(a1),d0
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_GET_D0_PARAMETER
										addq.l  #4,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc23_sendSoundCommand


; =============== S U B R O U T I N E =======================================

; parse from current offset + xxxx

esc30_branch:
										
										adda.w  2(a1),a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc30_branch


; =============== S U B R O U T I N E =======================================

esc31_branchIfFlagSet:
										
										movem.w d1,-(sp)
										move.w  2(a1),d1
										bsr.w   j_CheckFlag
										movem.w (sp)+,d1
										beq.s   loc_5CC6
										adda.w  4(a1),a1
										bra.s   loc_5CC8
loc_5CC6:
										addq.l  #6,a1
loc_5CC8:
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc31_branchIfFlagSet


; =============== S U B R O U T I N E =======================================

esc32_branchIfFlagClear:
										
										movem.w d1,-(sp)
										move.w  2(a1),d1
										bsr.w   j_CheckFlag
										movem.w (sp)+,d1
										bne.s   loc_5CE4
										adda.w  4(a1),a1
										bra.s   loc_5CE6
loc_5CE4:
										addq.l  #6,a1
loc_5CE6:
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc32_branchIfFlagClear


; =============== S U B R O U T I N E =======================================

esc33_randomBranch:
										
										movem.w d6-d7,-(sp)
										move.w  #2,d6
										bsr.w   UpdateRandomSeed
										tst.w   d7
										movem.w (sp)+,d6-d7
										bne.s   loc_5D04
										adda.w  4(a1),a1
										bra.s   loc_5D06
loc_5D04:
										addq.l  #6,a1
loc_5D06:
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc33_randomBranch


; =============== S U B R O U T I N E =======================================

esc34_jump:
										
										movea.l 2(a1),a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc34_jump


; =============== S U B R O U T I N E =======================================

esc40_:
										tst.b   ((FADING_SETTING-$1000000)).w
										bne.s   loc_5D42
										move.w  (a0),d0         ; get player's pixel position from entity info
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
										bsr.w   GetMapPixelCoordRAMOffset
										move.w  (a4,d2.w),d3    ; copy block idx under player from RAM
										move.w  d3,d2
										andi.w  #$3C00,d2
										cmpi.w  #$800,d2        ; check for "block copy" flag
										bne.s   loc_5D38
										bsr.w   PerformMapBlockCopyScript
										bra.s   loc_5D42
loc_5D38:
										cmpi.w  #$C00,d2
										bne.s   loc_5D42
loc_5D3E:
										bsr.w   sub_40F2
loc_5D42:
										addq.l  #2,a1
										bra.w   esc_clearTimerGoToNextCommand

	; End of function esc40_


; =============== S U B R O U T I N E =======================================

; directly go to next command 4 bytes forward

esc41_Pass:
										
										addq.l  #4,a1
										bra.w   *+4

	; End of function esc41_Pass


; =============== S U B R O U T I N E =======================================

esc_clearTimerGoToNextCommand:
										
										clr.b   ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a0)
										move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
										bra.w   loc_4F06

	; End of function esc_clearTimerGoToNextCommand


; =============== S U B R O U T I N E =======================================

; clear timer and update next entity

esc_clearTimerGoToNextEntity:
										
										clr.b   ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER(a0)

	; End of function esc_clearTimerGoToNextEntity


; =============== S U B R O U T I N E =======================================

esc_goToNextEntity:
										
										move.l  a1,ENTITYDEF_OFFSET_ACTSCRIPTADDR(a0)
UpdateNextEntity:
										
										adda.w  #ENTITYDEF_SIZE,a0
										dbf     d7,loc_4EF4
										rts

	; End of function esc_goToNextEntity


; =============== S U B R O U T I N E =======================================

; update entity based on entity params (all movement is done here, it seems like)
; 
; In: A0 = entity RAM addr

UpdateEntityData:
										
										move.w  (a0),d0         ; X position
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
																						; Y position
										move.w  ENTITYDEF_OFFSET_XDEST(a0),d2
																						; X destination
										move.w  ENTITYDEF_OFFSET_YDEST(a0),d3
																						; Y destination
										move.w  d2,d4           ; keep X destination
										move.w  d3,d5           ; keep Y destination
										sub.w   d0,d4           ; get X dest - X pos
										sub.w   d1,d5           ; get Y dest - Y pos
										move.w  d5,d6
										or.w    d4,d6
										beq.w   loc_5F8E        ; if there is no difference between pos and dest, end function
										movem.w d4-d5,-(sp)     ; keep dest
										clr.w   d4
										clr.w   d5
										movem.w d0-d1/d6-d7,-(sp)
																						; keep pos
										sub.w   d2,d0
										beq.w   loc_5DD2
										bpl.s   loc_5DA0        
										neg.w   d0              ; get positive X distance
loc_5DA0:
										move.w  8(a0),d7        ; manage X pos
										move.w  d7,d6
										lsl.w   #2,d7           ; X offset * 4
										sub.w   d6,d7
										lsr.w   #2,d6
										lsr.w   #2,d7           ; ok so d7 = 3/4 * original X offset, and d6 = original X offset / 4
										clr.w   d4
										btst    #0,$1C(a0)
										beq.s   loc_5DC0
										cmp.w   d7,d0
										blt.s   loc_5DC0
										move.b  $18(a0),d4
loc_5DC0:
										btst    #2,$1C(a0)
										beq.s   loc_5DD2
										cmp.w   d6,d0
										bge.s   loc_5DD2
										move.b  $18(a0),d4
										neg.w   d4
loc_5DD2:
										sub.w   d3,d1
										beq.w   loc_5E0E
										bpl.s   loc_5DDC        
										neg.w   d1
loc_5DDC:
										move.w  $A(a0),d7       ; manage Y pos
										move.w  d7,d6
										lsl.w   #2,d7
										sub.w   d6,d7
										lsr.w   #2,d6
										lsr.w   #2,d7
										clr.w   d5
										btst    #1,$1C(a0)
										beq.s   loc_5DFC
										cmp.w   d7,d1
										blt.s   loc_5DFC
										move.b  $19(a0),d5
loc_5DFC:
										btst    #3,$1C(a0)
										beq.s   loc_5E0E
										cmp.w   d6,d1
										bge.s   loc_5E0E
										move.b  $19(a0),d5
										neg.w   d5
loc_5E0E:
										movem.w (sp)+,d0-d1/d6-d7
										cmp.w   d2,d0
										beq.s   loc_5E2E
										bge.s   loc_5E24
										add.w   d4,4(a0)
										bne.s   loc_5E22
										sub.w   d4,4(a0)
loc_5E22:
										bra.s   loc_5E2E
loc_5E24:
										sub.w   d4,4(a0)
										bne.s   loc_5E2E
										add.w   d4,4(a0)
loc_5E2E:
										cmp.w   d3,d1
										beq.s   loc_5E4A
										bge.s   loc_5E40
										add.w   d5,6(a0)
										bne.s   loc_5E3E
										sub.w   d5,6(a0)
loc_5E3E:
										bra.s   loc_5E4A
loc_5E40:
										sub.w   d5,6(a0)
										bne.s   loc_5E4A
										add.w   d5,6(a0)
loc_5E4A:
										move.w  4(a0),d4
										move.w  6(a0),d5
										tst.w   8(a0)
										beq.s   loc_5E5A
										add.w   d4,(a0)
loc_5E5A:
										tst.w   $A(a0)
										beq.s   loc_5E64
										add.w   d5,ENTITYDEF_OFFSET_Y(a0)
loc_5E64:
										movem.w d2-d3,-(sp)
										clr.w   d2
										clr.w   d3
										move.w  8(a0),d0
										beq.s   loc_5E82
										move.w  4(a0),d0
										move.w  d0,d2
										bge.s   loc_5E80
										moveq   #$FFFFFFFF,d0
										neg.w   d2
										bra.s   loc_5E82
loc_5E80:
										moveq   #1,d0
loc_5E82:
										move.w  $A(a0),d1
										beq.s   loc_5E98
										move.w  6(a0),d1
										move.w  d1,d3
										bge.s   loc_5E96
										moveq   #$FFFFFFFF,d1
										neg.w   d3
										bra.s   loc_5E98
loc_5E96:
										moveq   #1,d1
loc_5E98:
										sub.w   d2,d3
										cmpi.w  #$FFF8,d3
										bge.s   loc_5EA2
										clr.w   d1
loc_5EA2:
										cmpi.w  #8,d3
										ble.s   loc_5EAA
										clr.w   d0
loc_5EAA:
										addq.w  #1,d0
										lsl.w   #2,d0
										addq.w  #1,d1
										add.w   d1,d0
										movem.w (sp)+,d2-d3
										move.l  a1,-(sp)
										lea     byte_5F9C(pc), a1
										nop
										move.b  (a1,d0.w),d6
										bpl.s   loc_5EC8
										move.b  ENTITYDEF_OFFSET_FACING(a0),d6
loc_5EC8:
										movea.l (sp)+,a1
										move.w  d4,d0
										bpl.s   loc_5ED0
										neg.w   d0
loc_5ED0:
										move.w  d5,d1
										bpl.s   loc_5ED6
										neg.w   d1
loc_5ED6:
										cmpi.b  #$FF,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
										beq.s   loc_5EE6
										add.w   d1,d0
										lsr.w   #5,d0
										add.b   d0,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
loc_5EE6:
										bsr.w   UpdateEntitySprite
										movem.w (sp)+,d4-d5
										move.w  (a0),d0
										move.w  ENTITYDEF_OFFSET_Y(a0),d1
										sub.w   d0,d2
										bne.s   loc_5F00
										move.w  ENTITYDEF_OFFSET_XDEST(a0),(a0)
										clr.w   8(a0)
loc_5F00:
										eor.w   d2,d4
										bpl.s   loc_5F0C
										move.w  ENTITYDEF_OFFSET_XDEST(a0),(a0)
										clr.w   8(a0)
loc_5F0C:
										sub.w   d1,d3
										bne.s   loc_5F1A
										move.w  ENTITYDEF_OFFSET_YDEST(a0),ENTITYDEF_OFFSET_Y(a0)
										clr.w   $A(a0)
loc_5F1A:
										eor.w   d3,d5
										bpl.s   loc_5F28
										move.w  ENTITYDEF_OFFSET_YDEST(a0),ENTITYDEF_OFFSET_Y(a0)
										clr.w   $A(a0)
loc_5F28:
										tst.l   8(a0)
										bne.w   loc_5F8E
										movem.w d0-d3,-(sp)
										move.w  ENTITYDEF_OFFSET_XDEST(a0),d0
										move.w  ENTITYDEF_OFFSET_YDEST(a0),d1
										bsr.w   GetMapPixelCoordRAMOffset
										move.w  (a4,d2.w),d0
										andi.w  #$3C00,d0
										cmpi.w  #$2000,d0
										bne.s   loc_5F54
										move.b  #2,$11(a0)
loc_5F54:
										cmpi.w  #$2400,d0
										bne.s   loc_5F5E
										clr.b   $11(a0)
loc_5F5E:
										move.b  $1D(a0),d1
										cmpi.w  #$3400,d0
										bne.s   loc_5F70
										bset    #5,$1D(a0)
										bra.s   loc_5F76
loc_5F70:
										bclr    #5,$1D(a0)
loc_5F76:
										move.b  $1D(a0),d2
										eor.b   d2,d1
										btst    #5,d1
										beq.s   loc_5F8A
										move.b  ENTITYDEF_OFFSET_FACING(a0),d6
										bsr.w   ChangeEntitySprite
loc_5F8A:
										movem.w (sp)+,d0-d3
loc_5F8E:
										cmpi.b  #$1E,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
										ble.s   return_5F9A
										clr.b   ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
																						; reset animation counter if it reached max value
return_5F9A:
										
										rts

	; End of function UpdateEntityData

byte_5F9C:          dc.b 5
										dc.b 2
										dc.b 6
										dc.b $FF
										dc.b 1
										dc.b $FF
										dc.b 3
										dc.b $FF
										dc.b 4
										dc.b 0
										dc.b 7
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF
										dc.b $FF

; =============== S U B R O U T I N E =======================================

sub_5FAC:
										tst.b   d4
										bne.w   loc_5FBA
										add.w   d2,d0
										add.w   d3,d1
										bra.w   return_6022
loc_5FBA:
										subq.b  #1,d4
										bne.w   loc_5FC8
										add.w   d3,d0
										sub.w   d2,d1
										bra.w   return_6022
loc_5FC8:
										subq.b  #1,d4
										bne.w   loc_5FD6
										sub.w   d2,d0
										sub.w   d3,d1
										bra.w   return_6022
loc_5FD6:
										subq.b  #1,d4
										bne.w   loc_5FE4
										sub.w   d3,d0
										add.w   d2,d1
										bra.w   return_6022
loc_5FE4:
										subq.b  #1,d4
										bne.w   loc_5FF6
										add.w   d3,d0
										sub.w   d3,d1
										add.w   d2,d0
										sub.w   d2,d1
										bra.w   return_6022
loc_5FF6:
										subq.b  #1,d4
										bne.w   loc_6008
										sub.w   d2,d0
										sub.w   d2,d1
										sub.w   d3,d0
										sub.w   d3,d1
										bra.w   return_6022
loc_6008:
										subq.b  #1,d4
										bne.w   loc_601A
										sub.w   d3,d0
										add.w   d3,d1
										sub.w   d2,d0
										add.w   d2,d1
										bra.w   return_6022
loc_601A:
										sub.w   d3,d0
										sub.w   d3,d1
										add.w   d2,d1
										add.w   d2,d0
return_6022:
										
										rts

	; End of function sub_5FAC


; =============== S U B R O U T I N E =======================================

; load all entities for the current map

LoadMapEntitySprites:
										
										bsr.w   DisableDisplayAndVInt
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										moveq   #$2F,d7 
loc_602E:
										cmpi.w  #$7000,(a0)
										beq.s   loc_603C
										move.w  d7,-(sp)
										bsr.w   sub_618A
										move.w  (sp)+,d7
loc_603C:
										adda.w  #$20,a0 
										dbf     d7,loc_602E
										bsr.w   EnableDisplayAndInterrupts
										rts

	; End of function LoadMapEntitySprites

FacingValuesbis:    dc.b 0
										dc.b 1
										dc.b 2
										dc.b 3
										dc.b 0
										dc.b 2
										dc.b 2
										dc.b 0

; =============== S U B R O U T I N E =======================================

; In: D0 = entity idx

sub_6052:
										movem.l d0-a2,-(sp)
										lsl.w   #ENTITYDEF_SIZE_BITS,d0
										lea     ((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w,a0
										adda.w  d0,a0
										cmpi.b  #$FF,d2
										beq.s   loc_6072
										andi.w  #$7F,d2 
										andi.b  #$80,$1D(a0)
										or.b    d2,$1D(a0)
loc_6072:
										cmpi.b  #$FF,d3
										beq.s   loc_607C
										move.b  d3,$13(a0)
loc_607C:
										move.w  d1,d6
										andi.w  #3,d6
										bsr.w   ChangeEntitySprite
										movem.l (sp)+,d0-a2
										rts

	; End of function sub_6052


; =============== S U B R O U T I N E =======================================

UpdateEntitySprite:
										
										btst    #6,$1D(a0)
										beq.w   return_6180
										cmp.b   $10(a0),d6
										beq.w   return_6180
										cmpi.b  #7,((NUM_SPRITES_TO_LOAD-$1000000)).w
										bge.w   return_6180

	; End of function UpdateEntitySprite


; =============== S U B R O U T I N E =======================================

; a0 : entity address
; d6 : facing

ChangeEntitySprite:
										
										move.b  d6,ENTITYDEF_OFFSET_FACING(a0)
										ext.w   d6
										move.b  FacingValuesbis(pc,d6.w),d6
										bne.s   loc_60B6
										addq.w  #2,d6
loc_60B6:
										movem.l a0-a1,-(sp)
										move.b  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
										cmpi.b  #$F0,d1
										bcc.w   loc_617C
										clr.w   d1
										move.b  $12(a0),d1
										cmpi.b  #$20,d1 
										beq.w   loc_617C
										move.w  d1,-(sp)
										clr.w   d1
										move.b  $1D(a0),d1
										move.w  d1,-(sp)
										move.b  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
										move.w  d1,d0
										add.w   d1,d1
										add.w   d0,d1
										add.w   d6,d1
										subq.w  #1,d1
										lsl.w   #2,d1
										lea     (pt_MapSprites).l,a0
loc_60F4:
										movea.l (a0,d1.w),a0
										lea     (FF8002_LOADING_SPACE).l,a1
										clr.w   d0
										move.b  ((NUM_SPRITES_TO_LOAD-$1000000)).w,d0
										addq.b  #1,((NUM_SPRITES_TO_LOAD-$1000000)).w
										mulu.w  #$240,d0        ; two sprites to load for the walking animation
										lea     (a1,d0.w),a1
loc_6110:
										jsr     (LoadSpriteData).w
										movea.l a1,a0
										move.w  (sp)+,d1
										btst    #5,d1
										beq.s   loc_6124
										jsr     sub_44070
loc_6124:
										btst    #3,d1
										beq.s   loc_6134
										move.w  ((SPRITE_SIZE-$1000000)).w,d0
										jsr     sub_44068
loc_6134:
										btst    #2,d1
										beq.s   loc_6140
										jsr     sub_44074
loc_6140:
										andi.w  #3,d1
										cmpi.w  #1,d1
										bne.s   loc_6152
										jsr     sub_44060
										bra.s   loc_615E
loc_6152:
										cmpi.w  #3,d1
										bne.s   loc_615E
										jsr     sub_44064
loc_615E:
										move.w  (sp)+,d1
										move.w  d1,d0
										lsl.w   #3,d1
										add.w   d0,d1
										lsl.w   #6,d1
										lea     ($7000).w,a1
										adda.w  d1,a1
										move.w  #$120,d0
										moveq   #2,d1
										bsr.w   sub_119E        
										bsr.w   Set_FFDE94_bit3 
loc_617C:
										movem.l (sp)+,a0-a1
return_6180:
										
										rts

	; End of function ChangeEntitySprite

FacingValues:       dc.b 0                  ; 8 bytes holding facing values for sprites (not sure what it's for)
										dc.b 1
										dc.b 2
										dc.b 3
										dc.b 0
										dc.b 2
										dc.b 2
										dc.b 0

; =============== S U B R O U T I N E =======================================

sub_618A:
										clr.w   d6
										move.b  $10(a0),d6
										move.b  FacingValues(pc,d6.w),d6
										bne.s   loc_6198
										addq.w  #2,d6
loc_6198:
										movem.l a0-a1,-(sp)
										clr.w   d1
										move.b  $12(a0),d1
										move.w  d1,-(sp)
										clr.w   d1
										move.b  $13(a0),d1
										cmpi.w  #$F0,d1 
										blt.s   loc_61BA
										jsr     sub_20054
										move.w  (sp)+,d1
										bra.s   loc_61F6
loc_61BA:
										move.w  d1,d0
										add.w   d1,d1
										add.w   d0,d1
										add.w   d6,d1
										subq.w  #1,d1
										lsl.w   #2,d1
										lea     (pt_MapSprites).l,a0
										movea.l (a0,d1.w),a0
										lea     (FF8002_LOADING_SPACE).l,a1
										jsr     (LoadSpriteData).w
										movea.l a1,a0
										move.w  (sp)+,d1
										move.w  d1,d0
										lsl.w   #3,d1
										add.w   d0,d1
										lsl.w   #6,d1
										lea     ($7000).w,a1
										adda.w  d1,a1
										move.w  #$120,d0
										moveq   #2,d1
										bsr.w   sub_10DC        
loc_61F6:
										movem.l (sp)+,a0-a1
										rts

	; End of function sub_618A


; =============== S U B R O U T I N E =======================================

; In: D0 = x pixel coord
;     D1 = y pixel coord
; Out: D2 = RAM offset from start of map VDP tile data

GetMapPixelCoordRAMOffset:
										
										movem.w d0-d1,-(sp)
										cmpi.b  #$FF,((CURRENT_BATTLE-$1000000)).w
										bne.s   loc_622E        
										tst.b   $11(a0)
										beq.s   loc_622E        
										tst.b   ((MAP_AREA_PROP_1C-$1000000)).w
										bne.s   loc_621E
										move.w  ((MAP_AREA_LAYER2_STARTX-$1000000)).w,d2
										move.w  ((MAP_AREA_LAYER2_STARTY-$1000000)).w,d3
										bra.s   loc_6226
loc_621E:
										move.w  ((MAP_AREA_BACKGROUND_STARTX-$1000000)).w,d2
										move.w  ((MAP_AREA_BACKGROUND_STARTY-$1000000)).w,d3
loc_6226:
										lsl.w   #7,d2
										lsl.w   #7,d3
										add.w   d2,d0
										add.w   d3,d1
loc_622E:
										lea     MapOffsetHashTable(pc), a3
																						; jump here if not in battle
										lea     (RAM_START).l,a4
										move.w  d0,d2
										move.w  d1,d3
										lsr.w   #7,d2
										lsr.w   #7,d3
										add.w   d2,d2
										move.b  (a3,d2.w),d2
										andi.w  #$3F,d2 
										add.w   d3,d3
										move.b  (a3,d3.w),d3
										andi.w  #$3F,d3 
										lsl.w   #6,d3
										add.w   d3,d2
										add.w   d2,d2
										movem.w (sp)+,d0-d1
										rts

	; End of function GetMapPixelCoordRAMOffset


; =============== S U B R O U T I N E =======================================

; d0 : string index

DisplayText:
										
										movem.l d0-a6,-(sp)
										move.w  d0,-(sp)
										bsr.w   sub_676E
										move.w  (sp)+,d0
										move.b  #1,((CURRENTLY_TYPEWRITING-$1000000)).w
																						; "Currently typewriting"
										movem.w d0,-(sp)        ; save string #
										lsr.w   #6,d0
										andi.b  #$FC,d0         ; string # -> bank pointer offset
										movea.l (p_pt_ScriptBanks).l,a0
																						; load script bank pointer
										movea.l (a0,d0.w),a0
										movem.w (sp)+,d0        ; restore string #
										andi.w  #$FF,d0         ; restrict to range 0-255
										moveq   #0,d7
										bra.s   loc_6298        
GoToNextString:
										
										move.b  (a0),d7         ; first string byte : string length
										adda.l  d7,a0
										addq.l  #1,a0
loc_6298:
										dbf     d0,GoToNextString
																						; loop until wanted string reached
										clr.l   ((ADDR_CURRENT_DIALOGUE_ASCII_BYTE-$1000000)).w
																						; get ready
										clr.b   ((byte_FFB6D8-$1000000)).w
										move.b  (a0)+,((COMPRESSED_STRING_LENGTH-$1000000)).w
																						; keep length of current string
loc_62A8:
										move.l  #TEXT_NAME_INDEX_1,((ADDR_CURRENT_DIALOGUE_NAMEIDX-$1000000)).w
										move.b  #1,((USE_REGULAR_DIALOGUE_FONT-$1000000)).w
loc_62B6:
										cmpi.b  #1,((COMPRESSED_STRING_LENGTH-$1000000)).w
																						; check length
										beq.w   loc_62FE
										jsr     j_InitDecoder   ; initialize decoder
										move.l  a0,((COMPRESSED_STRING_POINTER-$1000000)).w
																						; keep string pointer
loc_62CA:
										bsr.w   GetNextTextSymbol
										cmpi.b  #$FE,d0
										beq.s   loc_62FE
										cmpi.b  #$EE,d0
										bcc.w   ParseSpecialTextSymbol
																						; if symbol >= $EE
										bset    #0,((byte_FFB6D8-$1000000)).w
										bne.s   loc_62F2
										cmpi.b  #2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
										beq.s   loc_62F2
										move.b  #$FF,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
loc_62F2:
										bsr.s   sub_6308
										bsr.w   SymbolsToGraphics
										bsr.w   HandleDialogueTypewriting
										bra.s   loc_62CA
loc_62FE:
										clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
										movem.l (sp)+,d0-a6
										rts

	; End of function DisplayText


; =============== S U B R O U T I N E =======================================

sub_6308:
										cmpi.b  #$CC,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
										bls.s   return_634C
loc_6310:
										bsr.w   ClearNextLineOfDialoguePixels
																						; line end reached
										move.b  #2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
										addi.b  #$10,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										beq.s   loc_6332
										cmpi.b  #$20,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w 
										bra.s   loc_6338
loc_6332:
										cmpi.b  #$30,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w 
loc_6338:
										bcs.s   return_634C

	; End of function sub_6308


; =============== S U B R O U T I N E =======================================

sub_633A:
										movem.l d0,-(sp)
										bsr.w   sub_6AD2
										movem.l (sp)+,d0
										subi.b  #$10,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
return_634C:
										
										rts

	; End of function sub_633A


; =============== S U B R O U T I N E =======================================

GetNextTextSymbol:
										
										tst.l   ((ADDR_CURRENT_DIALOGUE_ASCII_BYTE-$1000000)).w
										bne.w   loc_6366
										movea.l ((COMPRESSED_STRING_POINTER-$1000000)).w,a0
										jsr     j_HuffmanDecode
										move.l  a0,((COMPRESSED_STRING_POINTER-$1000000)).w
										rts
loc_6366:
										movea.l ((ADDR_CURRENT_DIALOGUE_ASCII_BYTE-$1000000)).w,a1
										clr.w   d0
										move.b  (a1)+,d0
										move.b  (a1),d1
										move.l  a1,((ADDR_CURRENT_DIALOGUE_ASCII_BYTE-$1000000)).w
										lea     unk_666E(pc), a1
										move.b  (a1,d0.w),d0
										tst.b   d1
										bne.s   return_6384
										clr.l   ((ADDR_CURRENT_DIALOGUE_ASCII_BYTE-$1000000)).w
return_6384:
										
										rts

	; End of function GetNextTextSymbol


; =============== S U B R O U T I N E =======================================

ParseSpecialTextSymbol:
										
										cmpi.b  #$EE,d0         ; regular tile
										beq.w   loc_640A
										cmpi.b  #$F3,d0         ; leader
										beq.w   leader
										cmpi.b  #$F0,d0         ; delay 2
										beq.w   loc_6414
										cmpi.b  #$EF,d0         ; line
										beq.w   loc_6434
										cmpi.b  #$F7,d0         ; wait 2
										beq.w   loc_6466
										cmpi.b  #$F2,d0         ; name
										beq.w   name
										cmpi.b  #$F4,d0         ; item
										beq.w   item
										cmpi.b  #$F1,d0         ; number
										beq.w   number
										cmpi.b  #$F6,d0         ; class
										beq.w   class
										cmpi.b  #$FA,d0         ; wait 1
										beq.w   wait
										cmpi.b  #$F8,d0         ; delay 1
										beq.w   delay1
										cmpi.b  #$F9,d0         ; delay 3
										beq.w   delay3
										cmpi.b  #$F5,d0         ; spell
										beq.w   spell
										cmpi.b  #$FB,d0         ; clear
										beq.w   clear
										cmpi.b  #$FD,d0         ; color #
										beq.w   color
										cmpi.b  #$FC,d0         ; name #
										beq.w   player
										bra.w   loc_62CA
loc_640A:
										move.b  #1,((byte_FFB6D8-$1000000)).w
										bra.w   loc_62CA
loc_6414:
										move.w  #$77,d0 
										move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
										movem.w d2,-(sp)
										clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
										bsr.w   Sleep           
										movem.w (sp)+,d0
										move.b  d0,((CURRENTLY_TYPEWRITING-$1000000)).w
										bra.w   loc_62CA
loc_6434:
										bsr.w   ClearNextLineOfDialoguePixels
										move.b  #2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
										addi.b  #$10,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										beq.s   loc_6456
										cmpi.b  #$20,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w 
										bra.s   loc_645C
loc_6456:
										cmpi.b  #$30,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w 
loc_645C:
										bcs.s   loc_6462
										bsr.w   sub_633A
loc_6462:
										bra.w   loc_62CA
loc_6466:
										move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
										move.w  d2,-(sp)
										clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
										moveq   #$14,d2
loc_6472:
										movem.l d6-d7,-(sp)
										move.w  #$100,d6
										bsr.w   UpdateRandomSeed
										move.b  d7,((RANDOM_WAITING_FOR_INPUT-$1000000)).w
										movem.l (sp)+,d6-d7
										bsr.s   sub_64A8
										bsr.w   WaitForVInt     
										move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
										andi.b  #$7F,d1 
										beq.s   loc_6472
										trap    #SOUND_COMMAND
										dc.w SFX_VALIDATION
										clr.w   d2
										bsr.s   sub_64A8
										move.w  (sp)+,d0
										move.b  d0,((CURRENTLY_TYPEWRITING-$1000000)).w
										bra.w   loc_62CA

	; End of function ParseSpecialTextSymbol


; =============== S U B R O U T I N E =======================================

sub_64A8:
										tst.b   ((DISPLAY_WINDOWS_TOGGLE-$1000000)).w
										beq.s   loc_64B0
										moveq   #1,d2
loc_64B0:
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   loc_64C2
loc_64BA:
										lea     (byte_FFDCB8).l,a0
										bra.s   loc_64C8
loc_64C2:
										lea     (byte_FFDD18).l,a0
loc_64C8:
										cmpi.w  #7,d2
										bge.s   loc_64DA
										move.w  #1,(a0)
										move.w  #1,6(a0)
										bra.s   loc_64E4
loc_64DA:
										move.w  #$168,6(a0)
loc_64E0:
										move.w  #$148,(a0)
loc_64E4:
										clr.b   2(a0)
										move.w  #$C064,4(a0)
										subq.w  #1,d2
										bne.s   return_64F4
										moveq   #$14,d2
return_64F4:
										
										rts

	; End of function sub_64A8


; =============== S U B R O U T I N E =======================================

UpdateForceAndGetFirstForceMemberIndex:
										
										jsr     j_UpdateForce
										clr.w   d0
										move.b  (BATTLE_PARTY_MEMBERS).l,d0
										rts

	; End of function UpdateForceAndGetFirstForceMemberIndex


; START OF FUNCTION CHUNK FOR ParseSpecialTextSymbol

leader:
										bsr.s   UpdateForceAndGetFirstForceMemberIndex
										jsr     j_GetCharName
										moveq   #CHAR_NAMELENGTH,d7
										bsr.w   CopyASCIIBytesForDialogueString
										bra.w   loc_62CA
player:
										bsr.w   GetNextTextSymbol
loc_651C:
										jsr     j_GetCharName
										moveq   #CHAR_NAMELENGTH,d7
										bsr.w   CopyASCIIBytesForDialogueString
										bra.w   loc_62CA
name:
										bsr.w   sub_6648
										move.w  d1,d0
										jsr     j_GetCharName
										bsr.w   CopyASCIIBytesForDialogueString
										bra.w   loc_62CA
item:
										bsr.w   sub_6648
										jsr     j_FindItemName
										bsr.w   CopyASCIIBytesForDialogueString
										bra.w   loc_62CA
number:
										move.l  ((TEXT_NUMBER-$1000000)).w,d0
										jsr     (WriteAsciiNumber).w
										lea     ((RAM_Dialog_StringToPrint-$1000000)).w,a1
										move.l  a1,((ADDR_CURRENT_DIALOGUE_ASCII_BYTE-$1000000)).w
										lea     ((byte_FFDE80-$1000000)).w,a0
										moveq   #9,d1
loc_6568:
										clr.w   d0
										move.b  (a0)+,d0
										cmpi.b  #$20,d0 
										beq.s   loc_6574
										move.b  d0,(a1)+
loc_6574:
										dbf     d1,loc_6568
										clr.b   (a1)
										bra.w   loc_62CA
class:
										bsr.w   sub_6648
										jsr     j_GetClassName
										bsr.w   CopyASCIIBytesForDialogueString
loc_658C:
										bra.w   loc_62CA
wait:
										move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
										move.w  d2,-(sp)
										clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
										moveq   #$14,d2
loc_659C:
										movem.l d6-d7,-(sp)
										move.w  #$100,d6
										bsr.w   UpdateRandomSeed
										move.b  d7,((RANDOM_WAITING_FOR_INPUT-$1000000)).w
										movem.l (sp)+,d6-d7
										bsr.w   WaitForVInt     
loc_65B4:
										move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
										andi.b  #$7F,d1 
										beq.s   loc_659C
										move.w  (sp)+,d0
										move.b  d0,((CURRENTLY_TYPEWRITING-$1000000)).w
										bra.w   loc_62CA
delay1:
										move.w  #$15,d0
loc_65CC:
										move.b  ((CURRENTLY_TYPEWRITING-$1000000)).w,d2
										movem.w d2,-(sp)
										clr.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
loc_65D8:
										tst.b   ((byte_FFB198-$1000000)).w
										bne.s   loc_65EC
										move.b  ((CURRENT_PLAYER_INPUT-$1000000)).w,d1
										andi.b  #$7F,d1 
										bne.s   loc_65F0
										bsr.w   WaitForVInt     
loc_65EC:
										dbf     d0,loc_65D8
loc_65F0:
										movem.w (sp)+,d0
										move.b  d0,((CURRENTLY_TYPEWRITING-$1000000)).w
										bra.w   loc_62CA
delay3:
										move.w  #$77,d0 
										bra.s   loc_65CC
spell:
										bsr.w   sub_6648
loc_6606:
										jsr     j_FindSpellName
										bsr.w   CopyASCIIBytesForDialogueString
										bra.w   loc_62CA
clear:
										bsr.w   sub_6872
										move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
										subq.w  #1,d0
										move.w  d0,-(sp)
										bsr.w   GetWindowInfo   
										movea.l (a0),a1
										bsr.w   sub_67E6
										move.w  (sp)+,d0
										move.w  #$8080,d1
										bsr.w   SetWindowDestination
										bsr.w   WaitForVInt     
										bra.w   loc_62CA
color:
										bsr.w   GetNextTextSymbol
										move.b  d0,((USE_REGULAR_DIALOGUE_FONT-$1000000)).w
loc_6644:
										bra.w   loc_62CA

; END OF FUNCTION CHUNK FOR ParseSpecialTextSymbol


; =============== S U B R O U T I N E =======================================

sub_6648:
										movea.l ((ADDR_CURRENT_DIALOGUE_NAMEIDX-$1000000)).w,a1
										move.w  (a1)+,d1
										move.l  a1,((ADDR_CURRENT_DIALOGUE_NAMEIDX-$1000000)).w
										rts

	; End of function sub_6648


; =============== S U B R O U T I N E =======================================

; copy ASCII string of length D7 at A0 to RAM for dialogue textbox

CopyASCIIBytesForDialogueString:
										
										movea.l a0,a2
										subq.w  #1,d7
										lea     ((RAM_Dialog_StringToPrint-$1000000)).w,a1
										move.l  a1,((ADDR_CURRENT_DIALOGUE_ASCII_BYTE-$1000000)).w
loc_6660:
										move.b  (a2)+,(a1)+
										beq.w   return_666C
										dbf     d7,loc_6660
										clr.b   (a1)
return_666C:
										
										rts

	; End of function CopyASCIIBytesForDialogueString

unk_666E:           dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b $44 
										dc.b   1
										dc.b $4B 
										dc.b   1
										dc.b $4C 
										dc.b $4D 
										dc.b $48 
										dc.b $49 
										dc.b $4A 
										dc.b   1
										dc.b $4E 
										dc.b $43 
										dc.b $41 
										dc.b $42 
										dc.b $4F 
										dc.b   2
										dc.b   3
										dc.b   4
										dc.b   5
										dc.b   6
										dc.b   7
										dc.b   8
										dc.b   9
										dc.b  $A
										dc.b  $B
										dc.b $50 
										dc.b   1
										dc.b $49 
										dc.b   1
										dc.b $4A 
										dc.b $45 
										dc.b   1
										dc.b  $C
										dc.b  $D
										dc.b  $E
										dc.b  $F
										dc.b $10
										dc.b $11
										dc.b $12
										dc.b $13
										dc.b $14
										dc.b $15
										dc.b $16
										dc.b $17
										dc.b $18
										dc.b $19
										dc.b $1A
										dc.b $1B
										dc.b $1C
										dc.b $1D
										dc.b $1E
										dc.b $1F
										dc.b $20
										dc.b $21 
										dc.b $22 
										dc.b $23 
										dc.b $24 
										dc.b $25 
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b $40 
										dc.b   1
										dc.b $26 
										dc.b $27 
										dc.b $28 
										dc.b $29 
										dc.b $2A 
										dc.b $2B 
										dc.b $2C 
										dc.b $2D 
										dc.b $2E 
										dc.b $2F 
										dc.b $30 
										dc.b $31 
										dc.b $32 
										dc.b $33 
										dc.b $34 
										dc.b $35 
										dc.b $36 
										dc.b $37 
										dc.b $38 
										dc.b $39 
										dc.b $3A 
										dc.b $3B 
										dc.b $3C 
										dc.b $3D 
										dc.b $3E 
										dc.b $3F 
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b $40 
										dc.b   1
										dc.b $26 
										dc.b $27 
										dc.b $28 
										dc.b $29 
										dc.b $2A 
										dc.b $2B 
										dc.b $2C 
										dc.b $2D 
										dc.b $2E 
										dc.b $2F 
										dc.b $30 
										dc.b $31 
										dc.b $32 
										dc.b $33 
										dc.b $34 
										dc.b $35 
										dc.b $36 
										dc.b $37 
										dc.b $38 
										dc.b $39 
										dc.b $3A 
										dc.b $3B 
										dc.b $3C 
										dc.b $3D 
										dc.b $3E 
										dc.b $3F 
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b $40 
										dc.b   1
										dc.b $42 
										dc.b $49 
										dc.b $4A 
										dc.b $42 
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1
										dc.b   1

; =============== S U B R O U T I N E =======================================

sub_676E:
										tst.w   ((TEXT_WINDOW_INDEX-$1000000)).w
										bne.w   return_67E4
										addq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
										bsr.w   sub_6872
										move.b  #1,((USE_REGULAR_DIALOGUE_FONT-$1000000)).w
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   loc_6794
										move.w  #$1D08,d0
										bra.s   loc_6798
loc_6794:
										move.w  #$1D06,d0
loc_6798:
										move.w  #$21D,d1
										bsr.w   CreateWindow    
										addq.w  #1,d0
										move.w  d0,((TEXT_WINDOW_INDEX-$1000000)).w
										bsr.w   sub_67E6
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   loc_67CE
										move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
										subq.w  #1,d0
										move.w  #$213,d1
										move.w  #8,d2
										bsr.w   MoveWindowWithoutSFX
										moveq   #8,d0
										bsr.w   Sleep           
										bra.s   return_67E4
loc_67CE:
										move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
										subq.w  #1,d0
										move.w  #$215,d1
										move.w  #1,d2
										bsr.w   MoveWindowWithoutSFX
loc_67E0:
										bsr.w   WaitForVInt     
return_67E4:
										
										rts

	; End of function sub_676E


; =============== S U B R O U T I N E =======================================

sub_67E6:
										cmpi.w  #VDPTILE_IDX_SCREEN_BLACKBAR,(SPRITE_VDP_TILE_INDEX).l
																						; check if we are on the map or in battle (by checking for presence of black bar sprites)
										bne.s   loc_67F6
										move.w  #WINDOW_DIALOGUE_TILELINECOUNTER_EVENT,d6
										bra.s   loc_67FA
loc_67F6:
										move.w  #WINDOW_DIALOGUE_TILELINECOUNTER_BATTLE,d6
loc_67FA:
										move.w  #VDPTILE_IDX_DIALOGUEWINDOW_TOPLEFTBORDER,d0
										move.w  #VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER,d1
										move.w  #VDPTILE_IDX_DIALOGUEWINDOW_TOPRIGHTBORDER,d2
										clr.w   d3
										bsr.w   CopyLineOfVDPTileOrderForDialogueWindowToRAM
										move.w  #VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER,d0
										move.w  #VDPTILE_IDX_DIALOGUEWINDOW_FIRSTINNERBOXTILE,d1
										move.w  #VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER,d2
										move.w  ((RAM_Dialogue_VDPTileRowScrollingOffset-$1000000)).w,d4
										lsl.w   #5,d4
										add.w   d4,d1
										moveq   #1,d3
loc_6822:
										move.w  d1,-(sp)
										bsr.w   CopyLineOfVDPTileOrderForDialogueWindowToRAM
										move.w  (sp)+,d1
										addi.w  #$20,d1 
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   loc_6844
loc_6838:
										cmpi.w  #$C700,d1
										blt.s   loc_6842
										subi.w  #$C0,d1 
loc_6842:
										bra.s   loc_684E
loc_6844:
										cmpi.w  #$C6C0,d1
										blt.s   loc_684E
										subi.w  #$80,d1 
loc_684E:
										dbf     d6,loc_6822
loc_6852:
										move.w  #$D060,d0
										move.w  #$D061,d1
										move.w  #$D860,d2
										clr.w   d3

	; End of function sub_67E6


; =============== S U B R O U T I N E =======================================

; In: A1 - address in RAM to copy VDP tile idxes
;     D0 - VDP tile idx for left border of line
;     D1 - VDP tile idx for first inner box tile of line
;     D2 - VDP tile idx for right border of line
;     D3 - amount to add to D1 each time a tile is copied (0 for top and bottom border lines, 1 for inner box)

CopyLineOfVDPTileOrderForDialogueWindowToRAM:
										
										move.w  d0,(a1)+
loc_6862:
										move.w  #WINDOW_DIALOGUE_WIDTHINTILES,d7
loc_6866:
										move.w  d1,(a1)+
										add.w   d3,d1
										dbf     d7,loc_6866
										move.w  d2,(a1)+
										rts

	; End of function CopyLineOfVDPTileOrderForDialogueWindowToRAM


; =============== S U B R O U T I N E =======================================

sub_6872:
										clr.w   ((RAM_Dialogue_VDPTileRowScrollingOffset-$1000000)).w
loc_6876:
										move.b  #2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
loc_687C:
										move.b  #0,((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w
										lea     (FF6802_LOADING_SPACE).l,a0
										move.w  #$5FF,d7
loc_688C:
										move.l  #$FFFFFFFF,(a0)+
										dbf     d7,loc_688C
										clr.w   d0
										bra.w   loc_68FC

	; End of function sub_6872


; =============== S U B R O U T I N E =======================================

HandleDialogueTypewriting:
										
										cmpi.b  #$7C,d0 
										beq.w   return_68FA
										cmpi.b  #$7D,d0 
loc_68A8:
										beq.w   return_68FA
										move.w  d0,-(sp)
loc_68AE:
										bsr.w   HandleBlinkingDialogueCursor
										move.w  (sp)+,d1
										clr.w   d0
										moveq   #3,d2
										sub.b   ((MESSAGE_SPEED-$1000000)).w,d2
										beq.s   loc_68C2
										subq.w  #1,d2
										bset    d2,d0
loc_68C2:
										cmpi.b  #1,d1
										beq.s   loc_68DE        ; skip playing speech sound if character is a space
										eori.b  #1,((SPEECH_SOUND_TOGGLE-$1000000)).w
										beq.s   loc_68DC
										move.w  d0,-(sp)
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,d0
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_GET_D0_PARAMETER
										move.w  (sp)+,d0
loc_68DC:
										bra.s   loc_68E2
loc_68DE:
										clr.b   ((SPEECH_SOUND_TOGGLE-$1000000)).w
loc_68E2:
										subq.w  #1,d0
										blt.s   return_68FA
loc_68E6:
										tst.b   ((byte_FFB198-$1000000)).w
										bne.s   loc_68F2
										tst.b   ((P1_INPUT-$1000000)).w
										bne.s   return_68FA
loc_68F2:
										bsr.w   WaitForVInt     
										dbf     d0,loc_68E6
return_68FA:
										
										rts

	; End of function HandleDialogueTypewriting


; START OF FUNCTION CHUNK FOR sub_6872

loc_68FC:
										bsr.w   WaitForVInt     
loc_6900:
										lea     (FF6802_LOADING_SPACE).l,a0
										lea     ($C800).l,a1
loc_690C:
										move.w  #$1B0,d0
										move.w  #2,d1
										bsr.w   sub_119E        
										lea     (byte_FF6C02).l,a0
										lea     ($CC00).l,a1
										bsr.w   sub_119E        
										lea     (byte_FF7002).l,a0
										lea     ($D000).l,a1
										bsr.w   sub_119E        
										bsr.w   SetFFDE94b3andWait
										lea     (byte_FF7402).l,a0
										lea     ($D400).l,a1
										bsr.w   sub_119E        
loc_694C:
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   loc_6976
										lea     (byte_FF7802).l,a0
										lea     ($D800).l,a1
										bsr.w   sub_119E        
										lea     (byte_FF7C02).l,a0
										lea     ($DC00).l,a1
										bsr.w   sub_119E        
loc_6976:
										bra.w   Set_FFDE94_bit3 

; END OF FUNCTION CHUNK FOR sub_6872


; =============== S U B R O U T I N E =======================================

HandleBlinkingDialogueCursor:
										
										move.w  ((RAM_Dialogue_VDPTileRowScrollingOffset-$1000000)).w,d0
										lsl.w   #3,d0
										add.b   ((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w,d0
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   loc_699A
										cmpi.b  #$30,d0 
										blt.s   loc_6998
										subi.b  #$30,d0 
loc_6998:
										bra.s   loc_69A4
loc_699A:
										cmpi.b  #$20,d0 
										blt.s   loc_69A4
										subi.b  #$20,d0 
loc_69A4:
										cmpi.b  #$10,d0
										bge.w   loc_69D8
										lea     (FF6802_LOADING_SPACE).l,a0
										lea     ($C800).l,a1
										move.w  #$1B0,d0
										move.w  #2,d1
										bsr.w   sub_119E        
										lea     (byte_FF6C02).l,a0
										lea     ($CC00).l,a1
										bsr.w   sub_119E        
										bra.w   SetFFDE94b3andWait
loc_69D8:
										cmpi.b  #$20,d0 
loc_69DC:
										bge.w   loc_6A0C
										lea     (byte_FF7002).l,a0
										lea     ($D000).l,a1
										move.w  #$1B0,d0
										move.w  #2,d1
										bsr.w   sub_119E        
										lea     (byte_FF7402).l,a0
										lea     ($D400).l,a1
										bsr.w   sub_119E        
										bra.w   SetFFDE94b3andWait
loc_6A0C:
										lea     (byte_FF7802).l,a0
										lea     ($D800).l,a1
										move.w  #$1B0,d0
										move.w  #2,d1
										bsr.w   sub_119E        
										lea     (byte_FF7C02).l,a0
										lea     ($DC00).l,a1
										bsr.w   sub_119E        
										bra.w   SetFFDE94b3andWait

	; End of function HandleBlinkingDialogueCursor


; =============== S U B R O U T I N E =======================================

; related to text box

HideTextBox:
										
										move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
										subq.w  #1,d0
										blt.s   return_6A7E
										move.w  #$21D,d1
loc_6A44:
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   loc_6A56
										moveq   #8,d2
										bsr.w   MoveWindowWithoutSFX
										bra.s   loc_6A68
loc_6A56:
										moveq   #1,d2
										bsr.w   MoveWindowWithoutSFX
										moveq   #1,d0
										move.w  #$8080,d1
										moveq   #1,d2
										bsr.w   MoveWindowWithoutSFX
loc_6A68:
										bsr.w   WaitForVint_andFFA900Clear
										move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
										subq.w  #1,d0
										bsr.w   ClearWindowAndUpdateEndPtr
										clr.w   ((TEXT_WINDOW_INDEX-$1000000)).w
										subq.b  #1,((WINDOW_IS_PRESENT-$1000000)).w
return_6A7E:
										
										rts

	; End of function HideTextBox


; =============== S U B R O U T I N E =======================================

ClearNextLineOfDialoguePixels:
										
										move.w  d0,-(sp)
										move.w  ((RAM_Dialogue_VDPTileRowScrollingOffset-$1000000)).w,d0
										addq.w  #2,d0
										cmpi.w  #6,d0
										bne.s   loc_6A90
										clr.w   d0
loc_6A90:
										lsl.w   #3,d0
										add.b   ((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w,d0
loc_6A96:
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   loc_6AAC
										cmpi.b  #$30,d0 
										blt.s   loc_6AAA
										subi.b  #$30,d0 
loc_6AAA:
										bra.s   loc_6AB6
loc_6AAC:
										cmpi.b  #$20,d0 
										blt.s   loc_6AB6
										subi.b  #$20,d0 
loc_6AB6:
										lsl.w   #7,d0
										lea     (FF6802_LOADING_SPACE).l,a0
										adda.w  d0,a0
										move.w  #$1FF,d0
loc_6AC4:
										move.l  #$FFFFFFFF,(a0)+
										dbf     d0,loc_6AC4
										move.w  (sp)+,d0
										rts

	; End of function ClearNextLineOfDialoguePixels


; =============== S U B R O U T I N E =======================================

sub_6AD2:
										bsr.w   sub_6AE0
										bsr.w   sub_6AE0
										bsr.w   WaitForVInt     
										rts

	; End of function sub_6AD2


; =============== S U B R O U T I N E =======================================

sub_6AE0:
										move.w  ((RAM_Dialogue_VDPTileRowScrollingOffset-$1000000)).w,d0
										move.w  d0,-(sp)
										addq.w  #1,d0
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   loc_6AF8
										cmpi.w  #6,d0
										bra.s   loc_6AFC
loc_6AF8:
										cmpi.w  #4,d0
loc_6AFC:
										bne.s   loc_6B00
										clr.w   d0
loc_6B00:
										move.w  d0,((RAM_Dialogue_VDPTileRowScrollingOffset-$1000000)).w
										move.w  ((TEXT_WINDOW_INDEX-$1000000)).w,d0
										subq.w  #1,d0
										move.w  d0,-(sp)
										bsr.w   GetWindowInfo   
										movea.l (a0),a1
										bsr.w   sub_67E6
										move.w  (sp)+,d0
loc_6B18:
										move.w  #$8080,d1
										bsr.w   SetWindowDestination
										bsr.w   WaitForVInt     
										move.w  (sp)+,d0
										lsl.w   #3,d0
										add.b   ((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w,d0
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   loc_6B42
										cmpi.b  #$30,d0 
										blt.s   loc_6B40
										subi.b  #$30,d0 
loc_6B40:
										bra.s   loc_6B4C
loc_6B42:
										cmpi.b  #$20,d0 
										blt.s   loc_6B4C
										subi.b  #$20,d0 
loc_6B4C:
										lsl.w   #7,d0
										lea     (FF6802_LOADING_SPACE).l,a0
										lea     ($C800).l,a1
										adda.w  d0,a0
										adda.w  d0,a1
										move.w  #$1B0,d0
										move.w  #2,d1
										bsr.w   sub_119E        
										bsr.w   Set_FFDE94_bit3 
										rts

	; End of function sub_6AE0


; =============== S U B R O U T I N E =======================================

SymbolsToGraphics:
										
										movem.w d0-d2,-(sp)
										andi.w  #$FF,d0
										move.w  d0,d7
										move.b  ((USE_REGULAR_DIALOGUE_FONT-$1000000)).w,d1
										cmpi.b  #1,d1
										beq.s   loc_6B9E
										move.b  ((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w,d2
										movem.w d0-d2/d7,-(sp)
										bsr.s   DialogGraphicsToRAM
										movem.w (sp)+,d0-d2/d7
										addq.b  #1,d2
										move.b  d2,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
										bsr.s   DialogGraphicsToRAM
										addq.w  #1,d4
										bra.s   loc_6BA0
loc_6B9E:
										bsr.s   DialogGraphicsToRAM
loc_6BA0:
										movem.w (sp)+,d0-d2
										rts

	; End of function SymbolsToGraphics


; =============== S U B R O U T I N E =======================================

DialogGraphicsToRAM:
										
										subq.w  #1,d7
										lsl.w   #5,d7
										movea.l (p_VariableWidthFont).l,a0
										adda.w  d7,a0
										move.w  (a0)+,d4
										andi.w  #$F,d4
										beq.s   loc_6BBC
										addq.w  #1,d4
loc_6BBC:
										bsr.s   sub_6BDE
										move.w  d6,d7
loc_6BC0:
										bsr.w   sub_6C3A
										addq.l  #4,a2
										addq.w  #1,d5
										cmpi.w  #8,d5
										bcs.s   loc_6BD4
										clr.w   d5
										adda.w  #$3E0,a2
loc_6BD4:
										dbf     d7,loc_6BC0
										add.b   d4,((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w
										rts

	; End of function DialogGraphicsToRAM


; =============== S U B R O U T I N E =======================================

sub_6BDE:
										move.b  d1,d2
										lsl.b   #4,d2
										move.b  ((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w,d0
										move.w  ((RAM_Dialogue_VDPTileRowScrollingOffset-$1000000)).w,d3
										lsl.w   #3,d3
										add.b   d3,d0
										cmpi.w  #$C77C,(SPRITE_VDP_TILE_INDEX).l
										bne.s   loc_6C04
										cmpi.b  #$30,d0 
										blt.s   loc_6C02
										subi.b  #$30,d0 
loc_6C02:
										bra.s   loc_6C0E
loc_6C04:
										cmpi.b  #$20,d0 
										blt.s   loc_6C0E
										subi.b  #$20,d0 
loc_6C0E:
										andi.w  #$F8,d0 
										lsl.w   #7,d0
										move.b  ((DIALOGUE_TYPEWRITING_CURRENT_Y-$1000000)).w,d3
										andi.w  #7,d3
										move.w  d3,d5
										lsl.w   #2,d3
										add.w   d3,d0
										move.b  ((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w,d3
										andi.w  #$F8,d3 
										lsl.w   #2,d3
										add.w   d3,d0
										lea     (FF6802_LOADING_SPACE).l,a2
										adda.w  d0,a2
										moveq   #$E,d6
										rts

	; End of function sub_6BDE


; =============== S U B R O U T I N E =======================================

sub_6C3A:
										move.w  (a0)+,d0
										moveq   #$B,d6
loc_6C3E:
										lsl.w   #1,d0
										bcc.s   loc_6C80
										move.b  ((DIALOGUE_TYPEWRITING_CURRENT_X-$1000000)).w,d3
										andi.w  #7,d3
										addi.w  #$B,d3
										sub.w   d6,d3
										add.w   d3,d3
										move.w  rjt_6C5A(pc,d3.w),d3
										jmp     rjt_6C5A(pc,d3.w)
rjt_6C5A:
										dc.w sub_6C86-rjt_6C5A
										dc.w sub_6C8E-rjt_6C5A
										dc.w sub_6C96-rjt_6C5A
										dc.w sub_6CA2-rjt_6C5A
										dc.w sub_6CAE-rjt_6C5A
										dc.w sub_6CBA-rjt_6C5A
										dc.w sub_6CC6-rjt_6C5A
										dc.w sub_6CD2-rjt_6C5A
										dc.w sub_6CDE-rjt_6C5A
										dc.w sub_6CEA-rjt_6C5A
										dc.w sub_6CF6-rjt_6C5A
										dc.w sub_6D04-rjt_6C5A
										dc.w sub_6D12-rjt_6C5A
										dc.w sub_6D20-rjt_6C5A
										dc.w sub_6D2E-rjt_6C5A
										dc.w sub_6D3C-rjt_6C5A
										dc.w sub_6D4A-rjt_6C5A
										dc.w sub_6D58-rjt_6C5A
										dc.w sub_6D66-rjt_6C5A
loc_6C80:
										dbf     d6,loc_6C3E
										rts

	; End of function sub_6C3A


; =============== S U B R O U T I N E =======================================

sub_6C86:
										andi.b  #$F,(a2)
										or.b    d2,(a2)
										bra.s   loc_6C80

	; End of function sub_6C86


; =============== S U B R O U T I N E =======================================

sub_6C8E:
										andi.b  #$F0,(a2)
										or.b    d1,(a2)
										bra.s   loc_6C80

	; End of function sub_6C8E


; =============== S U B R O U T I N E =======================================

sub_6C96:
										andi.b  #$F,1(a2)
										or.b    d2,1(a2)
										bra.s   loc_6C80

	; End of function sub_6C96


; =============== S U B R O U T I N E =======================================

sub_6CA2:
										andi.b  #$F0,1(a2)
										or.b    d1,1(a2)
										bra.s   loc_6C80

	; End of function sub_6CA2


; =============== S U B R O U T I N E =======================================

sub_6CAE:
										andi.b  #$F,2(a2)
										or.b    d2,2(a2)
										bra.s   loc_6C80

	; End of function sub_6CAE


; =============== S U B R O U T I N E =======================================

sub_6CBA:
										andi.b  #$F0,2(a2)
										or.b    d1,2(a2)
										bra.s   loc_6C80

	; End of function sub_6CBA


; =============== S U B R O U T I N E =======================================

sub_6CC6:
										andi.b  #$F,3(a2)
										or.b    d2,3(a2)
										bra.s   loc_6C80

	; End of function sub_6CC6


; =============== S U B R O U T I N E =======================================

sub_6CD2:
										andi.b  #$F0,3(a2)
										or.b    d1,3(a2)
										bra.s   loc_6C80

	; End of function sub_6CD2


; =============== S U B R O U T I N E =======================================

sub_6CDE:
										andi.b  #$F,$20(a2)
										or.b    d2,$20(a2)
										bra.s   loc_6C80

	; End of function sub_6CDE


; =============== S U B R O U T I N E =======================================

sub_6CEA:
										andi.b  #$F0,$20(a2)
										or.b    d1,$20(a2)
										bra.s   loc_6C80

	; End of function sub_6CEA


; =============== S U B R O U T I N E =======================================

sub_6CF6:
										andi.b  #$F,$21(a2)
										or.b    d2,$21(a2)
										bra.w   loc_6C80

	; End of function sub_6CF6


; =============== S U B R O U T I N E =======================================

sub_6D04:
										andi.b  #$F0,$21(a2)
										or.b    d1,$21(a2)
loc_6D0E:
										bra.w   loc_6C80

	; End of function sub_6D04


; =============== S U B R O U T I N E =======================================

sub_6D12:
										andi.b  #$F,$22(a2)
										or.b    d2,$22(a2)
										bra.w   loc_6C80

	; End of function sub_6D12


; =============== S U B R O U T I N E =======================================

sub_6D20:
										andi.b  #$F0,$22(a2)
										or.b    d1,$22(a2)
										bra.w   loc_6C80

	; End of function sub_6D20


; =============== S U B R O U T I N E =======================================

sub_6D2E:
										andi.b  #$F,$23(a2)
										or.b    d2,$23(a2)
										bra.w   loc_6C80

	; End of function sub_6D2E


; =============== S U B R O U T I N E =======================================

sub_6D3C:
										andi.b  #$F0,$23(a2)
										or.b    d1,$23(a2)
										bra.w   loc_6C80

	; End of function sub_6D3C


; =============== S U B R O U T I N E =======================================

sub_6D4A:
										andi.b  #$F,$40(a2)
										or.b    d2,$40(a2)
										bra.w   loc_6C80

	; End of function sub_6D4A


; =============== S U B R O U T I N E =======================================

sub_6D58:
										andi.b  #$F0,$40(a2)
										or.b    d1,$40(a2)
										bra.w   loc_6C80

	; End of function sub_6D58


; =============== S U B R O U T I N E =======================================

sub_6D66:
										andi.b  #$F,$41(a2)
										or.b    d2,$41(a2)
										bra.w   loc_6C80

	; End of function sub_6D66

										dc.b   0                ; unused layout ?
										dc.b $EE 
										dc.b $EE 
										dc.b $EE 
										dc.b  $E
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $EC 
										dc.b $CB 
										dc.b $BB 
										dc.b $BB 
										dc.b $EC 
										dc.b $BE 
										dc.b $CB 
										dc.b $11
										dc.b $EC 
										dc.b $BC 
										dc.b $B1 
										dc.b $CC 
										dc.b $EC 
										dc.b $BB 
										dc.b $1C
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EE 
										dc.b $EE 
										dc.b $EE 
										dc.b $EE 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $BB 
										dc.b $BB 
										dc.b $BB 
										dc.b $BB 
										dc.b $11
										dc.b $11
										dc.b $11
										dc.b $11
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $EE 
										dc.b $EE 
										dc.b $EE 
										dc.b $EE 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $BB 
										dc.b $BB 
										dc.b $BB 
										dc.b $BB 
										dc.b $11
										dc.b $11
										dc.b $11
										dc.b $11
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $EE 
										dc.b $EE 
										dc.b $EE 
										dc.b $EE 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $BB 
										dc.b $BB 
										dc.b $BB 
										dc.b $BB 
										dc.b $11
										dc.b $11
										dc.b $11
										dc.b $11
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $EE 
										dc.b $EE 
										dc.b $EE 
										dc.b $EE 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $BB 
										dc.b $BB 
										dc.b $BB 
										dc.b $BB 
										dc.b $11
										dc.b $11
										dc.b $11
										dc.b $11
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $CC 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
										dc.b $EC 
										dc.b $B1 
										dc.b $CD 
										dc.b $DD 
SramCheckString:    dc.b 'Taguchi New Supra'
										dc.b $FF

; =============== S U B R O U T I N E =======================================

; check saves ?

CheckSRAM:
										
										movem.l d7-a1,-(sp)
										lea     SramCheckString(pc), a0
										lea     (SRAM_STRING).l,a1
										moveq   #$10,d7
loc_6EB6:
										cmpm.b  (a0)+,(a1)+
										lea     1(a1),a1
										dbne    d7,loc_6EB6
										bne.w   loc_6F38
										btst    #1,(SAVE_FLAGS).l
										bne.s   loc_6ED2
										clr.w   d1
										bra.s   loc_6EFC
loc_6ED2:
										lea     (SAVE2_CHARACTER_DATA).l,a0
										lea     (DMA_SPACE_FF8804).l,a1
loc_6EDE:
										move.w  #$FB0,d7
										bsr.w   CopyBytesFromSRAM
										cmp.b   (SAVE2_CHECKSUM).l,d0
										bne.s   loc_6EF2
										moveq   #1,d1
										bra.s   loc_6EFC
loc_6EF2:
										moveq   #$FFFFFFFF,d1
										bclr    #1,(SAVE_FLAGS).l
loc_6EFC:
										btst    #0,(SAVE_FLAGS).l
										bne.s   loc_6F0A
										clr.w   d0
										bra.s   loc_6F34
loc_6F0A:
										lea     (SAVE1_CHARACTER_DATA).l,a0
										lea     (DMA_SPACE_FF8804).l,a1
										move.w  #$FB0,d7
										bsr.w   CopyBytesFromSRAM
										cmp.b   (SAVE1_CHECKSUM).l,d0
										bne.s   loc_6F2A
										moveq   #1,d0
										bra.s   loc_6F34
loc_6F2A:
										moveq   #$FFFFFFFF,d0
										bclr    #0,(SAVE_FLAGS).l
loc_6F34:
										bra.w   loc_6F64
loc_6F38:
										lea     (SRAM_START).l,a0
loc_6F3E:
										move.w  #$1FFF,d7
loc_6F42:
										clr.b   (a0)
										addq.l  #2,a0
										dbf     d7,loc_6F42
										lea     SramCheckString(pc), a0
										lea     (SRAM_STRING).l,a1
										moveq   #$11,d7         ; copy string to sram ... again ?
loc_6F56:
										bsr.w   CopyBytesToSRAM 
										clr.b   (SAVE_FLAGS).l  
										clr.w   d0
										clr.w   d1
loc_6F64:
										movem.l (sp)+,d7-a1
										rts

	; End of function CheckSRAM


; =============== S U B R O U T I N E =======================================

SaveGame:
										movem.l d0-d1/d7-a2,-(sp)
										lea     (CHARACTER_DATA).l,a0
										tst.b   d0
										bne.s   loc_6F88
										lea     (SAVE1_CHARACTER_DATA).l,a1
loc_6F7E:
										lea     (SAVE1_CHECKSUM).l,a2
										clr.w   d1
										bra.s   loc_6F96
loc_6F88:
										lea     (SAVE2_CHARACTER_DATA).l,a1
										lea     (SAVE2_CHECKSUM).l,a2
										moveq   #1,d1
loc_6F96:
										move.w  #$FB0,d7
										bsr.w   CopyBytesToSRAM 
										move.b  d0,(a2)         ; d0 = save checksum
										bset    d1,(SAVE_FLAGS).l
																						; indicate busy save slot
										movem.l (sp)+,d0-d1/d7-a2
										rts

	; End of function SaveGame


; =============== S U B R O U T I N E =======================================

LoadGame:
										movem.l d0-d1/d7-a2,-(sp)
										lea     (CHARACTER_DATA).l,a1
										tst.b   d0
										bne.s   loc_6FC4
loc_6FBA:
										lea     (SAVE1_CHARACTER_DATA).l,a0
										clr.w   d1
										bra.s   loc_6FCC
loc_6FC4:
										lea     (SAVE2_CHARACTER_DATA).l,a0
										moveq   #1,d1
loc_6FCC:
										move.w  #$FB0,d7
										bsr.w   CopyBytesFromSRAM
										movem.l (sp)+,d0-d1/d7-a2
										rts

	; End of function LoadGame


; =============== S U B R O U T I N E =======================================

CopySave:
										move.w  d0,-(sp)
										bsr.s   LoadGame
										eori.w  #1,d0
										andi.w  #1,d0
										bsr.s   SaveGame
										move.w  (sp)+,d0
										rts

	; End of function CopySave


; =============== S U B R O U T I N E =======================================

ClearSaveSlotFlag:
										
										tst.b   d0
										bne.s   loc_6FFA
										bclr    #0,(SAVE_FLAGS).l
										bra.s   return_7002
loc_6FFA:
										bclr    #1,(SAVE_FLAGS).l
return_7002:
										
										rts

	; End of function ClearSaveSlotFlag


; =============== S U B R O U T I N E =======================================

; a0 = source address
; a1 = destination address
; d7 = number of bytes to copy

CopyBytesToSRAM:
										
										movem.l d7-a1,-(sp)
										clr.w   d0
										subq.w  #1,d7
loc_700C:
										move.b  (a0),(a1)
										add.b   (a0)+,d0
										addq.l  #2,a1
										dbf     d7,loc_700C
										movem.l (sp)+,d7-a1
										rts

	; End of function CopyBytesToSRAM


; =============== S U B R O U T I N E =======================================

; and calculate checksum

CopyBytesFromSRAM:
										
										movem.l d7-a1,-(sp)
										clr.w   d0
										subq.w  #1,d7
loc_7024:
										move.b  (a0),(a1)+
										add.b   (a0),d0
										addq.l  #2,a0
										dbf     d7,loc_7024
										movem.l (sp)+,d7-a1
										rts

	; End of function CopyBytesFromSRAM


; =============== S U B R O U T I N E =======================================

; witch suspend screen

WitchSuspend:
										
										trap    #SOUND_COMMAND
										dc.w MUSIC_SUSPEND
										bsr.w   sub_7BDE
										move.w  #$1E,((BLINK_COUNTER-$1000000)).w
										move.w  #6,((word_FFB07C-$1000000)).w
										move.b  #$FF,((byte_FFB082-$1000000)).w
										trap    #TEXTBOX
										dc.w $F0                ; "That's it for today?{W2}{N}Yes, you had better take a{N}rest now.{N}Come back again.{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.b   ((byte_FFB082-$1000000)).w
										bsr.w   sub_7CDC
										jsr     j_SuspendGame
										move.w  #$258,d0
loc_7068:
										bsr.w   WaitForVInt     
										btst    #7,((P1_INPUT-$1000000)).w
										dbne    d0,loc_7068
										trap    #SOUND_COMMAND
										dc.w SOUND_COMMAND_FADE_OUT
										bsr.w   FadeOutToBlack
										trap    #VINT_FUNCTIONS
										dc.w VINTS_CLEAR
										bsr.w   DisableDisplayAndVInt
										move    #$2700,sr
										movea.l (InitStack).w,sp
										movea.l (p_Start).w,a0  
										jmp     (a0)
loc_7094:
										moveq   #$3C,d0 
										bsr.w   Sleep           
										bsr.w   sub_7BDE
										move.w  #$1E,((BLINK_COUNTER-$1000000)).w
										move.w  #6,((word_FFB07C-$1000000)).w
										move.b  #$FF,((byte_FFB082-$1000000)).w
										trap    #TEXTBOX
										dc.w $EE                ; "Finally, you've fulfilled my{N}wish!{N}{D2}{D2}Thanks to you, I can{N}escape from this forest!{D2}{N}Are you really that{N}surprised?{D2}{D2}{D2}"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.b   ((byte_FFB082-$1000000)).w
										bsr.w   sub_7CDC
										bsr.w   FadeOutToWhite
										trap    #VINT_FUNCTIONS
										dc.w VINTS_REMOVE
										dc.l VInt_WitchBlink    
										jmp     j_EndGame

	; End of function WitchSuspend


; =============== S U B R O U T I N E =======================================

GameInit:
										move    #$2300,sr
										bsr.w   LoadBaseTiles
										bsr.w   CheckRegion
										jsr     j_NewGame
										jsr     j_DisplaySegaLogo
										bne.w   loc_71EC
										tst.b   ((DEBUG_MODE_ACTIVATED-$1000000)).w
										beq.w   GameIntro
										bsr.w   EnableDisplayAndInterrupts
										bsr.w   WaitForVInt     
										btst    #INPUT_A_START_BIT,((P1_INPUT-$1000000)).w
										beq.s   loc_7118
										jsr     (EnableDisplayAndInterrupts).w
										bsr.w   InitDisplay     
										jsr     (EnableDisplayAndInterrupts).w
										jmp     j_rts
loc_7118:
										btst    #INPUT_A_UP_BIT,((P1_INPUT-$1000000)).w
										bne.w   DebugModeBattleTest
										btst    #INPUT_A_DOWN_BIT,((P1_INPUT-$1000000)).w
										beq.w   j_GameIntro
										jsr     (EnableDisplayAndInterrupts).w
										bsr.w   InitDisplay     
										bsr.w   EnableDisplayAndInterrupts
										bsr.w   FadeInFromBlack
										trap    #VINT_FUNCTIONS
word_713E:
										
										dc.w VINTS_ADD
										dc.l VInt_UpdateWindows
										move.b  #$FF,((DEBUG_MODE_ACTIVATED-$1000000)).w
										bsr.w   InitWindowProperties
										trap    #SET_FLAG
word_7150:
										
										dc.w $18F               ; set after first battle's cutscene OR first save? Checked at witch screens
										moveq   #0,d0
										moveq   #0,d1
										moveq   #$38,d2 
										jsr     j_NumberPrompt
										clr.w   d1
										move.b  DebugModeAvailableMaps(pc,d0.w),d0
										bsr.w   GetEgressPositionForMap
										moveq   #0,d4
										movem.w d0-d4,-(sp)
										move.w  #$258,d0
										jsr     j_DebugFlagSetter
										movem.w (sp)+,d0-d4
										jsr     j_ExecuteExplorationLoop
										bra.w   MainBattleAndExplorationLoop

	; End of function GameInit

DebugModeAvailableMaps:
										incbin "maps/global/debugmodeavailablemaps.bin"

; =============== S U B R O U T I N E =======================================

j_GameIntro:
										
										bra.w   GameIntro

	; End of function j_GameIntro


; =============== S U B R O U T I N E =======================================

sub_71C4:
										jsr     j_DisplaySegaLogo
										bne.w   loc_71EC

	; End of function sub_71C4


; =============== S U B R O U T I N E =======================================

GameIntro:
										
										move.l  sp,(SECONDS_COUNTER_0).l
										move.l  #loc_71EC,((AFTER_INTRO_JUMP_OFFSET-$1000000)).w
										jsr     (EnableDisplayAndInterrupts).w
										clr.w   d0
										jsr     j_PlayIntroOrEndCutscene
										clr.l   ((AFTER_INTRO_JUMP_OFFSET-$1000000)).w
loc_71EC:
										clr.w   ((word_FFA80C-$1000000)).w
										move.b  #3,((FADING_COUNTER_MAX-$1000000)).w
										bsr.w   EnableInterrupts
										lea     (PALETTE_1).l,a0
										lea     (PALETTE_1_BIS).l,a1
										move.w  #$80,d7 
										bsr.w   CopyBytes       
										bsr.w   FadeOutToBlack
										trap    #VINT_FUNCTIONS
word_7214:
										
										dc.w VINTS_CLEAR
										clr.w   d6
										jsr     (ClearHscrollStuff).w
										jsr     (ClearOtherHscrollStuff).w
										jsr     (ClearVscrollStuff).w
										jsr     (ClearOtherVscrollStuff).w
										jsr     (SetFFDE94b3andWait).w
										bsr.w   InitDisplay     
										bsr.w   DisableDisplayAndVInt
										trap    #SOUND_COMMAND
word_7236:
										
										dc.w MUSIC_TITLE
										jsr     TitleScreen
										bne.s   loc_724E        
										move    #$2700,sr
										movea.l (InitStack).w,sp
										movea.l (p_Start).w,a0  
										jmp     (a0)            ; reset
loc_724E:
										bsr.w   DisableDisplayAndVInt
																						; title screen -> witch menu
										bsr.w   ClearVsramAndSprites
										bsr.w   EnableDisplayAndInterrupts
										move.b  #$FF,((WINDOW_HIDING_FORBIDDEN-$1000000)).w
										trap    #VINT_FUNCTIONS
word_7262:
										
										dc.w VINTS_CLEAR
										clr.w   d6
										jsr     (ClearHscrollStuff).w
										jsr     (ClearOtherHscrollStuff).w
										jsr     (ClearVscrollStuff).w
										jsr     (ClearOtherVscrollStuff).w
										jsr     (SetFFDE94b3andWait).w
										bsr.w   InitDisplay     
										bsr.w   DisableDisplayAndVInt
										clr.b   ((byte_FFB198-$1000000)).w
										move.w  #$48,((CURRENT_SPEAK_SOUND-$1000000)).w 
										bsr.w   sub_7C5E
										move.w  #$1E,((BLINK_COUNTER-$1000000)).w
										move.w  #6,((word_FFB07C-$1000000)).w
loc_729C:
										move.b  #0,((byte_FFB082-$1000000)).w
										jsr     j_ClearEntities
										movea.l (p_SpeechBalloonTiles).l,a0
										lea     ($8000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										jsr     (DmaTilesViaFF8804).w
										bsr.w   EnableDisplayAndInterrupts
										trap    #SOUND_COMMAND
word_72C4:
										
										dc.w MUSIC_WITCH
										bsr.w   FadeInFromBlack
										trap    #VINT_FUNCTIONS
word_72CC:
										
										dc.w VINTS_ADD
										dc.l VInt_UpdateWindows
										bsr.w   InitWindowProperties
										bsr.w   WaitForVInt     
										trap    #VINT_FUNCTIONS
word_72DC:
										
										dc.w VINTS_ADD
										dc.l VInt_WitchBlink    
										bsr.w   CheckSRAM       
										moveq   #$20,d7 
										move.b  d7,(SAVED_ERRCODE_BYTE0).l
										move.b  d7,(SAVED_ERRCODE_BYTE1).l
										move.b  d7,(SAVED_ERRCODE_BYTE2).l
										move.b  d7,(SAVED_ERRCODE_BYTE3).l
										move.b  d7,(SAVED_ERRCODE_BYTE4).l
										move.b  d7,(SAVED_ERRCODE_BYTE5).l
										move.b  d7,(SAVED_ERRCODE_BYTE6).l
										move.b  d7,(SAVED_ERRCODE_BYTE7).l
										tst.w   d0
										bpl.s   loc_7332
										move.l  #1,((TEXT_NUMBER-$1000000)).w
										trap    #SOUND_COMMAND
word_7326:
										
										dc.w MUSIC_CORRUPTED_SAVE
										trap    #TEXTBOX
word_732A:
										
										dc.w $ED                ; "Ooops!  Record {#} has{N}vanished!{W2}"
										jsr     j_FadeOut_WaitForP2Input
loc_7332:
										tst.w   d1
										bpl.s   loc_734C
										move.l  #2,((TEXT_NUMBER-$1000000)).w
										trap    #SOUND_COMMAND
word_7340:
										
										dc.w MUSIC_CORRUPTED_SAVE
										trap    #TEXTBOX
word_7344:
										
										dc.w $ED                ; "Ooops!  Record {#} has{N}vanished!{W2}"
										jsr     j_FadeOut_WaitForP2Input
loc_734C:
										btst    #7,((P1_INPUT-$1000000)).w
										bne.w   loc_73AA
										trap    #TEXTBOX
word_7358:
										
										dc.w $D8                ; "{CLEAR}Hee, hee, hee...{N}You're finally here!{W2}"
										bsr.w   WaitForVInt     
										bsr.w   sub_7CF4
										bsr.w   WaitForVInt     
										move.w  #$1E,((BLINK_COUNTER-$1000000)).w
										move.w  #6,((word_FFB07C-$1000000)).w
										move.b  #$FF,((byte_FFB082-$1000000)).w
										trap    #TEXTBOX
word_737A:
										
										dc.w $D9                ; "Ah, you look so confused.{N}You don't know why you're{N}here?{W2}"
loc_737C:
										btst    #7,((P1_INPUT-$1000000)).w
										bne.w   loc_73C2
										trap    #TEXTBOX
word_7388:
										
										dc.w $DA                ; "Yes, yes...I used a spell{N}on you.{W2}"
										btst    #7,((P1_INPUT-$1000000)).w
										bne.w   loc_73C2
										trap    #TEXTBOX
word_7396:
										
										dc.w $DB                ; "Ha, ha.  Where are you{N}going?  You can't escape{W2}"
										btst    #7,((P1_INPUT-$1000000)).w
										bne.w   loc_73C2
										trap    #TEXTBOX
word_73A4:
										
										dc.w $DC                ; "from this mystery forest{N}unless you help me.{W2}"
										bra.w   loc_73C2
loc_73AA:
										bsr.w   WaitForVInt     
										bsr.w   sub_7CF4
										bsr.w   WaitForVInt     
										move.w  #$1E,((BLINK_COUNTER-$1000000)).w
										move.b  #$FF,((byte_FFB082-$1000000)).w
loc_73C2:
										trap    #TEXTBOX
										dc.w $DD                ; "{CLEAR}Whatcha gonna do?"
										move.b  (SAVE_FLAGS).l,d3
										andi.w  #3,d3
										bne.s   loc_73D8
										clr.w   d0
										moveq   #1,d2
										bra.s   loc_73E8
loc_73D8:
										moveq   #1,d0
										cmpi.w  #3,d3
										bne.s   loc_73E4
										moveq   #6,d2
										bra.s   loc_73E8
loc_73E4:
										move.w  #$F,d2
loc_73E8:
										clr.w   d1
										jsr     j_WitchMainMenu
										tst.w   d0
										bmi.s   loc_73C2
										add.w   d0,d0
										move.w  rjt_WitchChoice(pc,d0.w),d0
										jmp     rjt_WitchChoice(pc,d0.w)

	; End of function GameIntro

rjt_WitchChoice:    dc.w WitchNew-rjt_WitchChoice
										dc.w WitchLoad-rjt_WitchChoice
										dc.w WitchDel-rjt_WitchChoice
										dc.w WitchCopy-rjt_WitchChoice

; =============== S U B R O U T I N E =======================================

WitchNew:
										trap    #TEXTBOX
										dc.w $DE                ; "What should I call you?{W2}"
										move.b  (SAVE_FLAGS).l,d2
										andi.w  #3,d2
										eori.w  #3,d2
										lsl.w   #1,d2
										btst    #1,d2
										beq.s   loc_7424
										moveq   #1,d0
										bra.s   loc_7426
loc_7424:
										moveq   #2,d0
loc_7426:
										moveq   #1,d1
loc_7428:
										jsr     j_WitchMainMenu
										tst.w   d0
										bmi.s   loc_73C2
										subq.w  #1,d0
										move.w  d0,((SAVE_SLOT_BEING_USED-$1000000)).w
										jsr     j_NewGame
										trap    #TEXTBOX
										dc.w $FFFF
										clr.w   d0
										jsr     sub_1007C
										btst    #7,(SAVE_FLAGS).l
										beq.w   loc_7476
										btst    #7,((P1_INPUT-$1000000)).w
										beq.w   loc_7476
										moveq   #1,d0
										moveq   #$1B,d7
loc_7464:
										jsr     sub_1007C
loc_746A:
										addq.w  #1,d0
										cmpi.w  #6,d0
										beq.s   loc_746A
										dbf     d7,loc_7464
loc_7476:
										trap    #TEXTBOX
										dc.w $DF                ; "{NAME;0}....{N}Nice name, huh?{W2}"
										bsr.w   CheatModeConfiguration
										trap    #TEXTBOX
										dc.w $E8                ; "I'll let you decide the{N}difficulty level at this time."
										clr.w   d0
										moveq   #3,d1
										moveq   #$F,d2
										jsr     j_WitchMainMenu
										tst.w   d0
										bpl.s   loc_7494
										clr.w   d0
loc_7494:
										btst    #0,d0
										beq.s   loc_749E
										trap    #SET_FLAG
										dc.w $4E                ; Difficulty
loc_749E:
										btst    #1,d0
										beq.s   loc_74A8        
										trap    #SET_FLAG
										dc.w $4F                ; Difficulty
loc_74A8:
										addi.w  #$E9,d0 ; difficulty choice reactions
										bsr.w   DisplayText     
										trap    #TEXTBOX
										dc.w $E0                ; "Now, good luck!{N}You have no time to waste!{W1}"
loc_74B4:
										move.w  ((SAVE_SLOT_BEING_USED-$1000000)).w,d0
										move.b  #3,((CURRENT_MAP-$1000000)).w
										move.b  #3,((EGRESS_MAP_INDEX-$1000000)).w
										bsr.w   SaveGame
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  #3,d0
										move.w  #$38,d1 
										move.w  #3,d2
										move.w  #3,d3
										moveq   #1,d4
loc_74DE:
										bra.w   MainBattleAndExplorationLoop

	; End of function WitchNew


; =============== S U B R O U T I N E =======================================

WitchLoad:
										
										trap    #TEXTBOX
										dc.w $E1                ; "By the way, who are you?"
										move.b  (SAVE_FLAGS).l,d2
										andi.w  #3,d2
										lsl.w   #1,d2
										btst    #1,d2
										beq.s   loc_74FC
										moveq   #1,d0
										bra.s   loc_74FE
loc_74FC:
										moveq   #2,d0
loc_74FE:
										moveq   #2,d1
										jsr     j_WitchMainMenu
										tst.w   d0
										bmi.w   loc_73C2
										subq.w  #1,d0
										move.w  d0,((SAVE_SLOT_BEING_USED-$1000000)).w
										bsr.w   LoadGame
										trap    #TEXTBOX
										dc.w $E2                ; "{NAME;0}, yes!  I knew it!{W2}"
										bsr.w   CheatModeConfiguration
										trap    #TEXTBOX
										dc.w $E0                ; "Now, good luck!{N}You have no time to waste!{W1}"
										trap    #TEXTBOX
										dc.w $FFFF
										clr.b   ((WINDOW_HIDING_FORBIDDEN-$1000000)).w
										trap    #CHECK_FLAG
										dc.w $58                ; checks if a game has been saved for copying purposes? (or if saved from battle?)
										beq.s   loc_753A
										jsr     j_ExecuteBattleLoop
										bra.w   loc_75E0
loc_753A:
										clr.w   d0
										move.b  ((CURRENT_MAP-$1000000)).w,d0
										jsr     GetEgressPositionForMap(pc)
										nop
										moveq   #$FFFFFFFF,d4
										bra.w   loc_75E0

	; End of function WitchLoad


; =============== S U B R O U T I N E =======================================

WitchCopy:
										
										trap    #TEXTBOX
										dc.w $E3                ; "Copy?  Really?"
										jsr     j_YesNoChoiceBox
										tst.w   d0
										bne.w   loc_73C2
										move.b  (SAVE_FLAGS).l,d0
										andi.w  #3,d0
										subq.w  #1,d0
										bsr.w   CopySave
										trap    #TEXTBOX
										dc.w $E4                ; "Hee, hee!  It's done.{W2}"
										bra.w   loc_73C2

	; End of function WitchCopy


; =============== S U B R O U T I N E =======================================

WitchDel:
										trap    #TEXTBOX
										dc.w $E5                ; "Delete which one?"
										move.b  (SAVE_FLAGS).l,d2
										andi.w  #3,d2
										lsl.w   #1,d2
										btst    #1,d2
										beq.s   loc_758E
										moveq   #1,d0
										bra.s   loc_7590
loc_758E:
										moveq   #2,d0
loc_7590:
										moveq   #2,d1
										jsr     j_WitchMainMenu
										tst.w   d0
										bmi.w   loc_73C2
										subq.w  #1,d0
										move.w  d0,((SAVE_SLOT_BEING_USED-$1000000)).w
										trap    #TEXTBOX
										dc.w $E6                ; "Delete?  Are you sure?"
										jsr     j_YesNoChoiceBox
										tst.w   d0
										bne.w   loc_73C2
										move.w  ((SAVE_SLOT_BEING_USED-$1000000)).w,d0
										bsr.w   ClearSaveSlotFlag
										trap    #TEXTBOX
										dc.w $E7                ; "Hee, hee!  It's gone!{W2}"
										bra.w   loc_73C2

	; End of function WitchDel


; =============== S U B R O U T I N E =======================================

; In: D0 = map idx
;     D1 = player X coord
;     D2 = player Y coord
;     D3 = player facing
;     D4 = ???
;     D7 = battle idx (FFFF for none)
; ...more

MainBattleAndExplorationLoop:
										
										clr.b   ((WINDOW_HIDING_FORBIDDEN-$1000000)).w
loc_75C8:
										bsr.w   AlterMapIndexIfChanged
										bsr.w   GetNextBattleOnMap
										cmpi.w  #$FFFF,d7
										beq.w   loc_75E4
										move.w  d7,d1
										jsr     j_ExecuteBattleLoop
loc_75E0:
										bsr.w   AlterMapIndexIfChanged
loc_75E4:
										jsr     j_ExecuteExplorationLoop
										bra.s   loc_75C8

	; End of function MainBattleAndExplorationLoop


; =============== S U B R O U T I N E =======================================

; In: D0 = from map idx
; Out: D0 = to map idx
;      D1 = X
;      D2 = Y
;      D3 = facing

GetEgressPositionForMap:
										
										trap    #CHECK_FLAG
										dc.w $18F               ; set after first battle's cutscene OR first save? Checked at witch screens
										bne.s   loc_75FC        ; egress always goes back to granseal church (Wiz : or is it Bowie's room ?) if you haven't triggered the gizmos cutscene
										moveq   #3,d0           ; HARDCODED default egress position
										moveq   #$38,d1 
										moveq   #3,d2
										moveq   #3,d3
										rts
loc_75FC:
										move.l  a0,-(sp)
										moveq   #1,d1
										moveq   #1,d2
										moveq   #1,d3
										lea     SavepointMapCoords(pc), a0
loc_7608:
										cmpi.b  #CODE_TERMINATOR_BYTE,(a0)
										beq.w   loc_7620
										cmp.b   (a0),d0
										beq.s   loc_7618
										addq.l  #4,a0
										bra.s   loc_7608
loc_7618:
										move.b  (a0)+,d0
										move.b  (a0)+,d1
										move.b  (a0)+,d2
										move.b  (a0)+,d3
loc_7620:
										trap    #CHECK_FLAG
										dc.w $40                ; Raft is unlocked (0x05264)
										beq.s   loc_764A
										lea     RaftResetMapCoords(pc), a0
																						; separate raft egress locations?
loc_762A:
										addq.l  #4,a0
										cmpi.b  #CODE_TERMINATOR_BYTE,(a0)
										beq.w   loc_7638
										cmp.b   (a0),d0
										bne.s   loc_762A
loc_7638:
										move.b  1(a0),((RAFT_MAP_INDEX-$1000000)).w
										move.b  2(a0),((RAFT_X-$1000000)).w
										move.b  3(a0),((RAFT_Y-$1000000)).w
loc_764A:
										movea.l (sp)+,a0
										rts

	; End of function GetEgressPositionForMap


; =============== S U B R O U T I N E =======================================

LoadBaseTiles:
										
										bsr.w   DisableDisplayAndVInt
										bsr.w   ClearVsramAndSprites
										move.w  #$8C00,d0       ; H32 cell mode, no interlace
										bsr.w   SetVdpReg       
										move.w  #$9000,d0       ; scroll size : V32 cell, H32 cell
										bsr.w   SetVdpReg       
										move.w  #$8230,d0       ; scroll A table VRAM address : C000
										bsr.w   SetVdpReg       
										move.w  #$8407,d0       ; scroll B table VRAM address : E000
										bsr.w   SetVdpReg       
										move.w  #$8B00,d0       ; disable external interrupt, full scrolls
										bsr.w   SetVdpReg       
										move.w  #$8D3B,d0       ; H Scroll table VRAM address : EC00
										jsr     (SetVdpReg).w   
										movea.l (p_BaseTiles).l,a0
										lea     (0).w,a1
										move.w  #$1000,d0
										moveq   #2,d1
										bsr.w   DmaTilesViaFF8804
																						; load base tiles
										rts

	; End of function LoadBaseTiles


; =============== S U B R O U T I N E =======================================

DebugModeBattleTest:
										
										move.b  #$FF,((DEBUG_MODE_ACTIVATED-$1000000)).w
										move.b  #$FF,((SPECIAL_TURBO_CHEAT-$1000000)).w
										moveq   #1,d0
										bsr.w   j_JoinForce
										moveq   #2,d0
										bsr.w   j_JoinForce
										moveq   #3,d0
										bsr.w   j_JoinForce
										moveq   #4,d0
										bsr.w   j_JoinForce
										moveq   #5,d0
										bsr.w   j_JoinForce
										moveq   #6,d0
										bsr.w   j_JoinForce
										moveq   #7,d0
										bsr.w   j_JoinForce
										moveq   #8,d0
										bsr.w   j_JoinForce
										moveq   #9,d0
										bsr.w   j_JoinForce
										moveq   #$A,d0
										bsr.w   j_JoinForce
										moveq   #$B,d0
										bsr.w   j_JoinForce
										moveq   #$C,d0
										bsr.w   j_JoinForce
										moveq   #$D,d0
										bsr.w   j_JoinForce
										moveq   #$E,d0
										bsr.w   j_JoinForce
										moveq   #$F,d0
										bsr.w   j_JoinForce
										moveq   #$10,d0
										bsr.w   j_JoinForce
										moveq   #$11,d0
										bsr.w   j_JoinForce
										moveq   #$12,d0
										bsr.w   j_JoinForce
										moveq   #$13,d0
										bsr.w   j_JoinForce
										moveq   #$14,d0
										bsr.w   j_JoinForce
										moveq   #$15,d0
										bsr.w   j_JoinForce
										moveq   #$16,d0
										bsr.w   j_JoinForce
										moveq   #$17,d0
										bsr.w   j_JoinForce
										moveq   #$18,d0
										bsr.w   j_JoinForce
										moveq   #$19,d0
										bsr.w   j_JoinForce
										moveq   #$1A,d0
										bsr.w   j_JoinForce
										moveq   #$1B,d0
										bsr.w   j_JoinForce
										moveq   #$1C,d0
										bsr.w   j_JoinForce
										moveq   #$1D,d0
										bsr.w   j_JoinForce
										moveq   #0,d0
										move.w  #$63,d1 
										bsr.w   j_SetBaseAGI
										bsr.w   j_SetBaseATK
										bsr.w   j_SetBaseDEF
										bsr.w   j_SetMaxHP
										bsr.w   j_SetCurrentAGI
										bsr.w   j_SetCurrentATK
										bsr.w   j_SetCurrentDEF
										bsr.w   j_SetCurrentHP
										trap    #SOUND_COMMAND
										dc.w MUSIC_BATTLE_THEME_3
										bsr.w   EnableDisplayAndInterrupts
										bsr.w   InitDisplay     
										bsr.w   EnableDisplayAndInterrupts
										bsr.w   FadeInFromBlack
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_UpdateWindows
										bsr.w   InitWindowProperties
										move.w  #$1E,(word_FFB12E).l
										lea     (byte_FFB0AE).l,a0
										move.l  #$10203,(a0)+
										move.l  #$4050607,(a0)+
										move.l  #$8090A0B,(a0)+
										move.l  #$C0D0E0F,(a0)+
										move.l  #$10111213,(a0)+
										move.l  #$14151617,(a0)+
										move.l  #$18191A1B,(a0)+
										move.l  #$1C1D1E1F,(a0)+
										bsr.w   CheatModeConfiguration
loc_77DE:
										trap    #TEXTBOX
										dc.w $1C8               ; "Battle number?{D1}"
										clr.w   d0
										clr.w   d1
										move.w  #$31,d2 
										jsr     j_NumberPrompt
										trap    #TEXTBOX
										dc.w $FFFF
										tst.w   d0
										blt.w   loc_7894
										movem.w d0-d2,-(sp)
										clr.w   d0
										clr.w   d1
										move.w  #1,d2
										jsr     j_NumberPrompt
										tst.w   d0
										movem.w (sp)+,d0-d2
										beq.s   loc_7820
										move.w  d0,d1
										addi.w  #$1C2,d1
										jsr     j_SetFlag
loc_7820:
										movem.w d0-d4,-(sp)
										move.w  #$46,d0 
										jsr     j_DebugFlagSetter
										movem.w (sp)+,d0-d4
										clr.w   d1
										move.b  d0,d1
										mulu.w  #7,d0
										lea     BattleMapCoords(pc), a0
										nop
										adda.w  d0,a0
										move.b  (a0)+,d0
										move.b  (a0)+,((byte_FFF706-$1000000)).w
										move.b  (a0)+,((byte_FFF707-$1000000)).w
										move.b  (a0)+,((byte_FFF708-$1000000)).w
										move.b  (a0)+,((byte_FFF709-$1000000)).w
										jsr     j_ExecuteBattleLoop
										jsr     j_ChurchActions
										trap    #TEXTBOX
										dc.w $1CC               ; "Shop number?{D1}"
										move.w  #0,d0
										move.w  #0,d1
										move.w  #$64,d2 
										jsr     j_NumberPrompt
										trap    #TEXTBOX
										dc.w $FFFF
										move.b  d0,((CURRENT_SHOP_INDEX-$1000000)).w
										jsr     j_ShopActions
										jsr     j_MainMenuActions
										jsr     j_CaravanActions
										bra.w   loc_77DE
loc_7894:
										bsr.w   sub_78BC
										jsr     sub_10040
										tst.b   d0
										bne.w   loc_77DE
										bpl.s   loc_78B6
										movem.l d0-a6,-(sp)
										jsr     j_ChurchActions
										movem.l (sp)+,d0-a6
										bra.s   loc_78BA
loc_78B6:
										bsr.w   LevelUpWholeForce
loc_78BA:
										bra.s   loc_7894

	; End of function DebugModeBattleTest


; =============== S U B R O U T I N E =======================================

sub_78BC:
										moveq   #$1D,d7
										clr.w   d0
										lea     (RAM_START).l,a0
loc_78C6:
										bsr.w   j_GetCurrentLevel
										bsr.w   sub_7930
										move.w  d1,(a0)
										bsr.w   j_GetMaxHP
										bsr.w   j_SetCurrentHP
										bsr.w   sub_7930
										move.w  d1,2(a0)
										bsr.w   j_GetMaxMP
										bsr.w   j_SetCurrentMP
										bsr.w   sub_7930
										move.w  d1,4(a0)
										bsr.w   j_GetBaseATK
										bsr.w   sub_7930
										move.w  d1,6(a0)
										bsr.w   j_GetBaseDEF
										bsr.w   sub_7930
										move.w  d1,8(a0)
										bsr.w   j_GetBaseAGI
										bsr.w   sub_7930
										move.w  d1,$A(a0)
										adda.w  #$10,a0
										addq.w  #1,d0
										dbf     d7,loc_78C6
										rts

	; End of function sub_78BC


; =============== S U B R O U T I N E =======================================

LevelUpWholeForce:
										
										moveq   #$1D,d7
										clr.w   d0
loc_7924:
										bsr.w   j_LevelUp
										addq.w  #1,d0
										dbf     d7,loc_7924
										rts

	; End of function LevelUpWholeForce


; =============== S U B R O U T I N E =======================================

sub_7930:
										move.w  d1,d2
										ext.l   d2
										divs.w  #$64,d2 
										move.w  d2,d3
										mulu.w  #$100,d3
										move.w  d3,d1
										swap    d2
										ext.l   d2
										divs.w  #$A,d2
										move.w  d2,d3
										mulu.w  #$10,d3
										add.w   d3,d1
										swap    d2
										add.w   d2,d1
										rts

	; End of function sub_7930


; =============== S U B R O U T I N E =======================================

; Alters map index if certain flags are set (Granseal, Pacalon, etc)
; In: D0 = map idx
; Out: D0 = new map idx

AlterMapIndexIfChanged:
										
										movem.l d1-d2/a0,-(sp)
										lea     FlagSwitchedMaps(pc), a0
loc_795E:
										move.w  (a0),d2
										bmi.w   loc_7982
										cmp.w   d0,d2
										bne.w   loc_797E
										move.w  2(a0),d1
										jsr     j_CheckFlag
										beq.s   loc_797E
										move.w  4(a0),d0
										bra.w   loc_7982
loc_797E:
										addq.l  #6,a0
										bra.s   loc_795E
loc_7982:
										movem.l (sp)+,d1-d2/a0
										rts

	; End of function AlterMapIndexIfChanged

FlagSwitchedMaps:   incbin "maps/global/flagswitchedmaps.bin"
																						; maps to change if flags are set
																						; map idx (word), flag (word), new map idx (word)

; =============== S U B R O U T I N E =======================================

; In: D0 = map idx (if not supplied, will be pulled from CURRENT_MAP)
;     D1 = player X coord to check
;     D2 = player Y coord to check
; Out: D7 = battle idx to trigger (FFFF if none)
; ...more

GetNextBattleOnMap:
										
										movem.l d1-d6/a0,-(sp)
										move.w  d1,d4
										move.w  d2,d5
										move.w  d0,-(sp)
										cmpi.b  #$FF,d0         ; check if map idx was supplied and pull from CURRENT_MAP if so
										bne.s   loc_79B2
										clr.w   d0
										move.b  ((CURRENT_MAP-$1000000)).w,d0
loc_79B2:
										lea     BattleMapCoords(pc), a0
										moveq   #$2C,d6 ; set number of maps to iterate
										clr.w   d7
loc_79BA:
										cmp.b   (a0),d0
										bne.s   loc_7A24
										move.w  #FLAGIDX_BATTLE0,d1
										add.w   d7,d1
										jsr     j_CheckFlag
										beq.s   loc_7A24
										cmpi.b  #$FF,5(a0)
										beq.w   loc_79DE
										cmp.b   5(a0),d4
										bne.w   loc_7A24
loc_79DE:
										cmpi.b  #$FF,6(a0)
										beq.w   loc_79F0
										cmp.b   6(a0),d5
										bne.w   loc_7A24
loc_79F0:
										move.b  1(a0),((byte_FFF706-$1000000)).w
										move.b  2(a0),((byte_FFF707-$1000000)).w
										move.b  3(a0),((byte_FFF708-$1000000)).w
										move.b  4(a0),((byte_FFF709-$1000000)).w
										addi.w  #$64,d1 
										jsr     j_CheckFlag
										beq.s   loc_7A1E
										subi.w  #$64,d1 
										jsr     j_ClearFlag
loc_7A1E:
										move.w  (sp)+,d1
										bra.w   loc_7A30
loc_7A24:
										addq.l  #7,a0
										addq.w  #1,d7
loc_7A28:
										dbf     d6,loc_79BA
										moveq   #$FFFFFFFF,d7
										move.w  (sp)+,d0
loc_7A30:
										movem.l (sp)+,d1-d6/a0
										rts

	; End of function GetNextBattleOnMap

BattleMapCoords:    incbin "battles/global/battlemapcoords.bin"
SavepointMapCoords: incbin "maps/global/savepointmapcoords.bin"
RaftResetMapCoords: incbin "maps/global/raftresetmapcoords.bin"

; =============== S U B R O U T I N E =======================================

sub_7BDE:
										move.b  #$FF,((WINDOW_HIDING_FORBIDDEN-$1000000)).w
										trap    #VINT_FUNCTIONS
										dc.w VINTS_CLEAR
										clr.w   d6
										jsr     (ClearHscrollStuff).w
										jsr     (ClearOtherHscrollStuff).w
										jsr     (ClearVscrollStuff).w
										jsr     (ClearOtherVscrollStuff).w
										jsr     (SetFFDE94b3andWait).w
										bsr.w   DisableDisplayAndVInt
										bsr.w   ClearVsramAndSprites
										bsr.w   EnableDisplayAndInterrupts
										bsr.w   InitDisplay     
										bsr.w   DisableDisplayAndVInt
										clr.b   ((byte_FFB198-$1000000)).w
										move.w  #$48,((CURRENT_SPEAK_SOUND-$1000000)).w 
										bsr.w   sub_7C5E
										bsr.w   EnableDisplayAndInterrupts
										movea.l (p_WitchLayout).l,a0
										lea     $700(a0),a0
										lea     (byte_FFE15C).l,a1
										move.w  #$707,d1
										bsr.w   sub_7D28
										bsr.w   sub_7D0C
										bsr.w   FadeInFromBlack
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_UpdateWindows
										bsr.w   InitWindowProperties
										bsr.w   WaitForVInt     
										trap    #VINT_FUNCTIONS
										dc.w VINTS_ADD
										dc.l VInt_WitchBlink    
										rts

	; End of function sub_7BDE


; =============== S U B R O U T I N E =======================================

sub_7C5E:
										jsr     (DisableDisplayAndVInt).w
										movea.l (p_WitchTiles).l,a0
										lea     (FF6802_LOADING_SPACE).l,a1
										move.l  a1,-(sp)
										bsr.w   LoadTileData    
										movea.l (sp)+,a0
										lea     ($2000).w,a1
										move.w  #$2000,d0
										moveq   #2,d1
										bsr.w   sub_10DC        
										movea.l (p_WitchLayout).l,a0
										lea     (byte_FFE000).l,a1
										move.w  #$800,d7
										bsr.w   CopyBytes       
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										bsr.w   sub_10DC        
										movea.l (p_plt_Witch).l,a0
										lea     (PALETTE_1_BIS).l,a1
										moveq   #$20,d7 
										bsr.w   CopyBytes       
										lea     $20(a0),a0
										lea     $60(a1),a1
										moveq   #$20,d7 
										bsr.w   CopyBytes       
										move.w  #$1E,((BLINK_COUNTER-$1000000)).w
										move.w  #6,((word_FFB07C-$1000000)).w
										rts

	; End of function sub_7C5E


; =============== S U B R O U T I N E =======================================

sub_7CDC:
										movea.l (p_WitchLayout).l,a0
										lea     (byte_FFE000).l,a1
										move.w  #$800,d7
										bsr.w   CopyBytes       
loc_7CF0:
										bra.w   sub_7D0C

	; End of function sub_7CDC


; =============== S U B R O U T I N E =======================================

sub_7CF4:
										movea.l (p_WitchLayout).l,a0
										lea     $700(a0),a0
loc_7CFE:
										lea     (byte_FFE15C).l,a1
										move.w  #$707,d1
										bsr.w   sub_7D28

	; End of function sub_7CF4


; =============== S U B R O U T I N E =======================================

sub_7D0C:
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$220,d0
										moveq   #2,d1
										bsr.w   sub_119E        
										bsr.w   SetFFDE94b3andWait
										rts

	; End of function sub_7D0C


; =============== S U B R O U T I N E =======================================

sub_7D28:
										movem.l d0-a1,-(sp)
										move.w  d1,d6
										move.w  d1,d7
										lsr.w   #8,d6
										ext.w   d7
										subq.w  #1,d6
										subq.w  #1,d7
loc_7D38:
										movem.l d6/a1,-(sp)
loc_7D3C:
										move.w  (a0)+,(a1)+
										dbf     d6,loc_7D3C
										movem.l (sp)+,d6/a1
										lea     $40(a1),a1
										dbf     d7,loc_7D38
										movem.l (sp)+,d0-a1
										rts

	; End of function sub_7D28


; =============== S U B R O U T I N E =======================================

; witch blink function ?

VInt_WitchBlink:
										
										link    a6,#-2
										tst.b   ((byte_FFB082-$1000000)).w
										beq.w   loc_7E16
										clr.w   -2(a6)
										lea     ((BLINK_COUNTER-$1000000)).w,a2
										subq.w  #1,(a2)
										cmpi.w  #3,(a2)
										bne.s   loc_7D8A
										movea.l (p_WitchLayout).l,a0
										lea     $762(a0),a0
										lea     (byte_FFE21E).l,a1
										move.w  #$302,d1
										bsr.s   sub_7D28
										addq.w  #1,-2(a6)
loc_7D8A:
										tst.w   (a2)
										bne.s   loc_7DB4
										movea.l (p_WitchLayout).l,a0
										lea     $700(a0),a0
										lea     (byte_FFE15C).l,a1
										move.w  #$705,d1
										bsr.s   sub_7D28
										addq.w  #1,-2(a6)
										moveq   #$78,d6 
										jsr     (UpdateRandomSeed).w
										addi.w  #$1E,d7
										move.w  d7,(a2)
loc_7DB4:
										lea     ((word_FFB07C-$1000000)).w,a2
										tst.b   ((CURRENTLY_TYPEWRITING-$1000000)).w
										bne.s   loc_7DC6
										cmpi.w  #5,(a2)
										ble.s   loc_7DEE
										bra.s   loc_7E16
loc_7DC6:
										subq.w  #1,(a2)
										cmpi.w  #5,(a2)
										bne.s   loc_7DEA
										movea.l (p_WitchLayout).l,a0
										lea     $780(a0),a0
										lea     (byte_FFE29E).l,a1
										move.w  #$301,d1
										bsr.w   sub_7D28
										addq.w  #1,-2(a6)
loc_7DEA:
										tst.w   (a2)
										bne.s   loc_7E16
loc_7DEE:
										movea.l (p_WitchLayout).l,a0
										lea     $77A(a0),a0
										lea     (byte_FFE29E).l,a1
										move.w  #$301,d1
										bsr.w   sub_7D28
										addq.w  #1,-2(a6)
										moveq   #5,d6
										jsr     (UpdateRandomSeed).w
										addi.w  #$A,d7
										move.w  d7,(a2)
loc_7E16:
										tst.w   -2(a6)
										beq.s   loc_7E36
										lea     (byte_FFE000).l,a0
										lea     ($E000).l,a1
										move.w  #$200,d0
										moveq   #2,d1
										bsr.w   sub_119E        
										bsr.w   Set_FFDE94_bit3 
loc_7E36:
										unlk    a6
										rts

	; End of function VInt_WitchBlink


; =============== S U B R O U T I N E =======================================

CheatModeConfiguration:
										
										btst    #7,((P1_INPUT-$1000000)).w
										beq.w   return_7EC4
										btst    #0,((P1_INPUT-$1000000)).w
										beq.s   loc_7E58
										btst    #7,(SAVE_FLAGS).l
										bne.w   nullsub_17
loc_7E58:
										tst.b   ((CONFIGURATION_MODE_ACTIVATED-$1000000)).w
										beq.w   return_7EC4
										trap    #TEXTBOX
										dc.w $1C0               ; "Configuration....{D3}"
										trap    #TEXTBOX
										dc.w $1C2               ; "{CLEAR}Special Turbo"
										jsr     j_YesNoChoiceBox
										tst.w   d0
										bne.s   loc_7E78
										move.b  #$FF,((SPECIAL_TURBO_CHEAT-$1000000)).w
loc_7E78:
										trap    #TEXTBOX
										dc.w $1C3               ; "{CLEAR}Control Opponent"
										jsr     j_YesNoChoiceBox
										tst.w   d0
										bne.s   loc_7E8C
										move.b  #$FF,((CONTROL_OPPONENT_CHEAT-$1000000)).w
loc_7E8C:
										trap    #TEXTBOX
										dc.w $1C4               ; "{CLEAR}Auto Battle"
										jsr     j_YesNoChoiceBox
										tst.w   d0
										bne.s   loc_7EA0
										move.b  #$FF,((AUTO_BATTLE_CHEAT-$1000000)).w
loc_7EA0:
										trap    #TEXTBOX
										dc.w $1C7               ; "{CLEAR}Game Completed"
										jsr     j_YesNoChoiceBox
										tst.w   d0
										bne.s   loc_7EB8
										bset    #7,(SAVE_FLAGS).l
										bra.s   loc_7EC0
loc_7EB8:
										bclr    #7,(SAVE_FLAGS).l
loc_7EC0:
										trap    #TEXTBOX
										dc.w $1CD               ; "Configuration is done.{N}Go ahead!{W1}"
return_7EC4:
										
										rts

	; End of function CheatModeConfiguration


; =============== S U B R O U T I N E =======================================

CheckRegion:
										
										move.b  (HW_Info).l,d0  
										andi.b  #$C0,d0
										cmpi.b  #$80,d0
										beq.w   return_7F40
										bsr.w   EnableDisplayAndInterrupts
										lea     aDevelopedForUseOnlyWith(pc), a0
										lea     (byte_FFC286).l,a1
										bsr.w   LoadRegionCheckString
										lea     aNtscGenesys(pc), a0
										lea     (byte_FFC350).l,a1
										bsr.w   LoadRegionCheckString
										lea     aSystems_(pc), a0
										lea     (byte_FFC41A).l,a1
										bsr.w   LoadRegionCheckString
										lea     (byte_FFC000).l,a0
										lea     ($C000).l,a1
										move.w  #$400,d0
										moveq   #2,d1
										bsr.w   sub_119E        
										lea     (PALETTE_1).l,a0
										move.l  #$EEE,(a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										clr.l   (a0)+
										bsr.w   StoreVdpCommandster
										bsr.w   SetFFDE94b3andWait
loc_7F3E:
										bra.s   loc_7F3E
return_7F40:
										
										rts

	; End of function CheckRegion


; =============== S U B R O U T I N E =======================================

LoadRegionCheckString:
										
										clr.w   d0
										move.b  (a0)+,d0
										beq.s   return_7F4C
										move.w  d0,(a1)+
										bra.s   LoadRegionCheckString
return_7F4C:
										
										rts

	; End of function LoadRegionCheckString

aDevelopedForUseOnlyWith:
										dc.b 'DEVELOPED FOR USE ONLY WITH',0
aNtscGenesys:       dc.b '  NTSC GENESYS',0
										dc.b $26
										dc.b 0
aPalAndFrenchSe:    dc.b 'PAL AND FRENCH SECAM MEGA DRIVE',0
aSystems_:          dc.b 'SYSTEMS.',0

; =============== S U B R O U T I N E =======================================

nullsub_17:
										
										rts

	; End of function nullsub_17

										align $8000
