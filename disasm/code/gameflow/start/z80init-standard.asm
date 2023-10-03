
; ASM FILE code\gameflow\start\z80init-standard.asm :
; Z80 init function

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
