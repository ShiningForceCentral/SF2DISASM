
; ASM FILE code\common\tech\interrupts\trap0_soundcommand.asm :
; 0x45C..0x490 : Trap 0 - Sound Command

; =============== S U B R O U T I N E =======================================

; If interrupt parameter word = -1, then get d0.w


Trap0_SoundCommand:
                
                movem.l d0-d1/a0,-(sp)
                movea.l 14(sp),a0
                move.w  (a0),d1         ; get interrupt param
                addq.l  #2,14(sp)
                cmpi.w  #-1,d1
                bne.s   @Continue
                
                move.w  d0,d1
@Continue:
                
                tst.b   ((SOUND_COMMANDS_DEACTIVATED-$1000000)).w
                bne.s   @Done
                
                lea     (SOUND_COMMAND_QUEUE).l,a0
                moveq   #3,d0
@FindOpenSlot_Loop:
                
                tst.w   (a0)+
                dbeq    d0,@FindOpenSlot_Loop
                
                move.w  d1,-2(a0)       ; add new sound command to send
@Done:
                
                movem.l (sp)+,d0-d1/a0
                rte

    ; End of function Trap0_SoundCommand

