
; ASM FILE code\gameflow\start\gamestart.asm :
; 0x2DE..0x3F6 : Start function

; =============== S U B R O U T I N E =======================================


Start:
                
                module
                tst.l   (CTRL1).l
                bne.s   @Goto_SkipSetup
                tst.w   (CTRL3).l
@Goto_SkipSetup:
                
                bne.s   @SkipSetup
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
                
                move.w  d0,(a2)
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
                
                move.w  d0,(a2)
                movem.l (a6),d0-a6      ; clear registers
                move    #$2700,sr       ; Move $2700 into Status Register, which now has these set: no trace, a7 is Interrupt Stack Pointer, no interrupts, clear condition code bits
@SkipSetup:
                
                bra.s   @Continue
table_StartParameters:
                
                dc.w $8000              ; VDP register set base word
                dc.w $3FFF              ; (RAM byte size / 4) - 1
                dc.w $100               ; VDP register set word to add for next register
                dc.l Z80_Memory         ; start of Z80 RAM
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
@Continue:
                
                tst.w   (VDP_Control).l
@WaitForDma:
                
                move.w  (VDP_Control).l,d0
                andi.w  #2,d0           ; wait for free DMA
                bne.s   @WaitForDma
                
                bra.w   InitializeSystem

    ; End of function Start

                modend
                dc.b $F3                ; Unused Z80 code
                dc.b $31                ; di
                dc.b $F0                ; ld      sp, 1FF0h
                dc.b $1F                ; jp      loc_0
                dc.b $C3
                dc.b 0
                dc.b 0
                dc.b 0
