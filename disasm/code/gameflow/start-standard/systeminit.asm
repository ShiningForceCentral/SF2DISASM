
; ASM FILE code\gameflow\start-standard\systeminit.asm :
; Start, System, and Z80 initialization functions

; =============== S U B R O U T I N E =======================================


Start:
                
                tst.l   (CTRL1).l
                bne.s   @Goto_WaitForDma
                
                tst.w   (CTRL3).l
@Goto_WaitForDma:
                
                bne.s   @WaitForDma     ; skip setup
                
                lea     table_StartParameters(pc), a5
                movem.w (a5)+,d5-d7     ; copy parameters
                movem.l (a5)+,a0-a4     ; copy adresses
                move.b  -$10FF(a1),d0   ; get HW Info at 0xA10001
                andi.b  #BYTE_LOWER_NIBBLE_MASK,d0
                beq.s   @SkipSecurity         
                move.l  #'SEGA',$2F00(a1) ; move "SEGA" to TMSS register at $A14000
@SkipSecurity:
                
                move.w  (a4),d0         ; clear write-pending flag in VDP to prevent issues if the 68k has been reset in the middle of writing a command long word to the VDP
                moveq   #0,d0
                movea.l d0,a6
                move.l  a6,usp          ; reset user stack pointer
                moveq   #23,d1          ; loop for each of the 24 VDP registers
@VdpInit_Loop:
                
                move.b  (a5)+,d5        ; set each VDP register with initial parameters
                move.w  d5,(a4)
                add.w   d7,d5
                dbf     d1,@VdpInit_Loop      
                
                move.l  (a5)+,(a4)
                move.w  d0,(a3)         ; move 0 to VDP data port
                move.w  d7,(a1)         ; stop the Z80
                move.w  d7,(a2)         ; reset the Z80
@WaitForZ80:
                
                btst    d0,(a1)
                bne.s   @WaitForZ80     ; wait for availability
                
                moveq   #37,d2
@Z80Init_Loop:
                
                move.b  (a5)+,(a0)+     ; copy bytes to Z80 ram
                dbf     d2,@Z80Init_Loop      
                
                move.w  d0,(a2)         ; 
                move.w  d0,(a1)         ; start the Z80
                move.w  d7,(a2)         ; reset the Z80
@ClearRam_Loop:
                
                move.l  d0,-(a6)
                dbf     d6,@ClearRam_Loop      
                
                move.l  (a5)+,(a4)      ; disable DMA, increment data bias number : 2
                move.l  (a5)+,(a4)      ; address set : CRAM write
                moveq   #31,d3
@ClearCram_Loop:
                
                move.l  d0,(a3)
                dbf     d3,@ClearCram_Loop      
                
                move.l  (a5)+,(a4)      ; VSRAM write
                moveq   #19,d4
@ClearVsram_Loop:
                
                move.l  d0,(a3)
                dbf     d4,@ClearVsram_Loop      
                
                moveq   #3,d5
@PsgInit_Loop:
                
                move.b  (a5)+,$11(a3)   ; set PSG volume to 0
                dbf     d5,@PsgInit_Loop      
                
                move.w  d0,(a2)         ; 
                movem.l (a6),d0-a6      ; clear registers
                move    #$2700,sr       ; Move $2700 into Status Register, which now has these set: no trace, a7 is Interrupt Stack Pointer, no interrupts, clear condition code bits
@WaitForDma:
                
                move.w  (VDP_Control).l,d0
                andi.w  #2,d0           ; wait for free DMA
                bne.s   @WaitForDma
                
                ; Flow into next routine

    ; End of function Start


; =============== S U B R O U T I N E =======================================


InitializeSystem:
                
                bsr.w   InitializeVdp   ; and clear 68K RAM
            if (MEMORY_MAPPER=1)
                bsr.w   InitializeMapper
            endif
            if (RELOCATED_SAVED_DATA_TO_SRAM=1)
                bsr.s   InitializeSavedData
            endif
                bsr.s   InitializeZ80   ; and load sound driver to Z80 RAM
                bsr.w   InitializeVdpData
                jmp     InitializeGame

    ; End of function InitializeSystem


; =============== S U B R O U T I N E =======================================

; Clear active saved data slot during system initialization if RELOCATED_SAVED_DATA_TO_SRAM is enabled.


InitializeSavedData:
                
                enableSram
                loadSavedDataAddress COMBATANT_DATA, a0
                move.w  #SAVE_SLOT_LONGS_COUNTER,d0
                moveq   #0,d1
                
@Loop:          setSavedLongWithPostIncrement d1, a0
                dbf     d0,@Loop
                
                rts

    ; End of function InitializeSavedData


; =============== S U B R O U T I N E =======================================


InitializeZ80:
                
                movem.l d0/d7-a1,-(sp)
                move.w  #$100,(Z80BusReq).l
                move.w  #$100,(Z80BusReset).l
                lea     (Z80_Memory).l,a0
                move.w  #SOUND_DRIVER_BYTE_SIZE,d7
                lea     (SoundDriver).l,a1
@LoadSoundDriver_Loop:
                
                move.b  (a1)+,d0
                bsr.s   CopyByteToZ80
                dbf     d7,@LoadSoundDriver_Loop
                
                move.w  #0,(Z80BusReset).l
                moveq   #16,d7
@WasteCycles_Loop:
                
                dbf     d7,@WasteCycles_Loop
                move.w  #$100,(Z80BusReset).l
                move.w  #0,(Z80BusReq).l
                movem.l (sp)+,d0/d7-a1
                rts

    ; End of function InitZ80


; =============== S U B R O U T I N E =======================================


CopyByteToZ80:
                
                move.b  d0,(a0)
                cmp.b   (a0),d0
                bne.s   CopyByteToZ80
                addq.l  #1,a0
                rts

    ; End of function CopyByteToZ80


; =============== S U B R O U T I N E =======================================


InitializeVdp:
                
                move.w  #$3FFE,d0
                lea     (FF0000_RAM_START).l,a0
@ClearRam_Loop:
                
                clr.l   (a0)+           ; clear all RAM !
                dbf     d0,@ClearRam_Loop
                
                move.b  #3,((FADING_COUNTER_MAX-$1000000)).w
                clr.b   ((FADING_SETTING-$1000000)).w
                lea     table_VdpInitializationParameters(pc), a0
                moveq   #18,d1
@SetVdpReg_Loop:
                
                move.w  (a0)+,d0
                bsr.w   SetVdpReg
                dbf     d1,@SetVdpReg_Loop
                
                clr.w   d0
                clr.w   d1
                clr.w   d2
                
                ; Flow into next routine

    ; End of function InitializeVdp


; =============== S U B R O U T I N E =======================================

; d0.w = Destination, d1.w = Length, d2.w = Filler value


ApplyVramDmaFill:
                
                movem.l d0-d3,-(sp)
                move.w  (VDP_REG01_STATUS).l,d3 ; get last 16+ vdp reg config command ?
                ori.b   #$10,d3         ; make sure it concerns a 16+ vdp reg
                move.w  d3,(VDP_Control).l ; send command again
                move.w  #$8F01,(VDP_Control).l ; set auto increment bias number to 1
                movem.l d1,-(sp)
                andi.w  #BYTE_MASK,d1
                ori.w   #$9300,d1
                move.w  d1,(VDP_Control).l ; DMA length counter low : 0
                movem.l (sp)+,d1
                lsr.w   #BYTE_SHIFT_COUNT,d1
                ori.w   #$9400,d1       ; DMA length counter high : 1
                move.w  d1,(VDP_Control).l
                move.w  #$9780,(VDP_Control).l ; VRAM fill
                movem.l d0,-(sp)
                andi.w  #$3FFF,d0       ; d0 : destination address
                ori.w   #$4000,d0
                move.w  d0,(VDP_Control).l
                movem.l (sp)+,d0
                rol.w   #2,d0
                andi.w  #3,d0
                ori.w   #$80,d0 ; errr .. CD5 set to 1 ? doesn't correspond to any access mode
                move.w  d0,(VDP_Control).l ; destination address, second word
                move.w  d2,(VDP_Data).l ; writes 0 everytime
@Wait:
                
                move.w  (VDP_Control).l,d0
                andi.w  #2,d0           ; wait for DMA free
                bne.s   @Wait
                
                move.w  (VDP_REG01_STATUS).l,d3 ; get last vdp 16+ reg config command and send it
                move.w  d3,(VDP_Control).l
                move.w  #$8F02,(VDP_Control).l ; auto increment bias number : 2
                movem.l (sp)+,d0-d3
                rts

    ; End of function ApplyVramDmaFill


; =============== S U B R O U T I N E =======================================

; Clear WRAM data tables reserved by the program for VDP control.


InitializeVdpData:
                
                move.l  #VDP_COMMAND_QUEUE,(VDP_COMMAND_QUEUE_POINTER).l
                move.l  #DMA_QUEUE,(DMA_QUEUE_POINTER).l
                moveq   #$40,d0 ; PD2 output mode ?
                move.b  d0,(CTRL1_BIS).l
                move.b  d0,(CTRL2).l
                move.b  d0,(CTRL3_BIS).l
                lea     (HORIZONTAL_SCROLL_DATA).l,a0
                move.w  #255,d0
@ClearHScrollData_Loop:
                
                move.w  #0,(a0)+        ; clear from FFD100 to FFD500
                move.w  #0,(a0)+
                dbf     d0,@ClearHScrollData_Loop
                
                lea     (VERTICAL_SCROLL_DATA).l,a0
                move.w  #19,d0
@ClearVScrollData_Loop:
                
                move.w  #0,(a0)+        ; clear next 80d bytes
                move.w  #0,(a0)+
                dbf     d0,@ClearVScrollData_Loop
                
                lea     (PALETTE_1_BASE).l,a0
                moveq   #CRAM_BYTE_COUNTER,d1
@ClearPalettes_Loop:
                
                clr.w   (a0)+           ; clear palette replicas ?
                dbf     d1,@ClearPalettes_Loop  
                
                pea     EnableDmaQueueProcessing(pc)
                pea     UpdateVdpVScrollData(pc)
                pea     UpdateVdpHScrollData(pc)
                jmp     ClearSpriteTable(pc)

    ; End of function InitializeVdpData

table_StartParameters:
                
                dc.w $8000              ; VDP register set base word
                dc.w $3FFF
                dc.w $100               ; VDP register set word to add for next register
                dc.l Z80_Memory
                dc.l Z80BusReq          ; Z80 bus request
                dc.l Z80BusReset        ; Z80 bus reset
                dc.l VDP_Data           ; VDP data port
                dc.l VDP_Control        ; VDP control port
                dc.b 4                  ; VDP reg 00 : disable H interupt, enable read H V counter
                dc.b $14                ; VDP reg 01 : disable display, disable Vint, enable DMA, V28 cell mode
                dc.b $30                ; VDP reg 02 : scroll A table vram address : C000
                dc.b $3C                ; VDP reg 03 : window table vram address : F000 ?
                dc.b 7                  ; VDP reg 04 : scroll B table vram address : E000
                dc.b $6C                ; VDP reg 05 : sprite attribute table vram address : D800
                dc.b 0                  ; VDP reg 06 : always 0
                dc.b 0                  ; VDP reg 07 : background color : plt 0 color 0
                dc.b 0                  ; VDP reg 08 : always 0
                dc.b 0                  ; VDP reg 09 : always 0
                dc.b $FF                ; VDP reg 10 : Hint timing value
                dc.b 0                  ; VDP reg 11 : disable external interrupt, full V/H scrolls
                dc.b $81                ; VDP reg 12 : H40 cell mode, disable shadow/highlight, no interlace
                dc.b $37                ; VDP reg 13 : H Scroll table vram address : FC00
                dc.b 0                  ; VDP reg 14 : always 0
                dc.b 1                  ; VDP reg 15 : auto-increment bias number : 1
                dc.b 1                  ; VDP reg 16 : scroll size : V32 cell, H64 cell
                dc.b 0                  ; VDP reg 17 : window H position : from left side
                dc.b 0                  ; VDP reg 18 : window V position : from upper side
                dc.b $FF                ; VDP reg 19 : DMA length counter low
                dc.b $FF                ; VDP reg 20 : DMA length counter high
                dc.b 0                  ; VDP reg 21 : DMA source address low
                dc.b 0                  ; VDP reg 22 : DMA source address mid
                dc.b $80                ; VDP reg 23 : DMA source address high, VRAM fill
                dc.l $40000080          ; VRAM address 0
                dc.b $AF                ; Z80 start code
                dc.b 1                  ; xor     a
                dc.b $D9                ; ld      bc, 1FD9h
                dc.b $1F                ; ld      de, 27h
                dc.b $11                ; ld      hl, 26h
                dc.b $27                ; ld      sp, hl
                dc.b 0                  ; ld      (hl), a
                dc.b $21                ; ldir
                dc.b $26                ; pop     ix
                dc.b 0                  ; pop     iy
                dc.b $F9                ; ld      i, a
                dc.b $77                ; ld      r, a
                dc.b $ED                ; pop     de
                dc.b $B0                ; pop     hl
                dc.b $DD                ; pop     af
                dc.b $E1                ; ex      af, af'
                dc.b $FD                ; exx
                dc.b $E1                ; pop     bc
                dc.b $ED                ; pop     de
                dc.b $47                ; pop     hl
                dc.b $ED                ; pop     af
                dc.b $4F                ; ld      sp, hl
                dc.b $D1                ; di
                dc.b $E1                ; im      1
                dc.b $F1                ; ld      (hl), 0E9h
                dc.b 8                  ; jp      (hl)
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
                
table_VdpInitializationParameters:
                dc.w $8004              ; disable H int, enable read H V counter
                dc.w $8124              ; disable display, enable Vint, disable DMA, V28 cell mode
                dc.w $8230              ; scroll A table VRAM address : C000
                dc.w $8338              ; window table VRAM address : E000
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
