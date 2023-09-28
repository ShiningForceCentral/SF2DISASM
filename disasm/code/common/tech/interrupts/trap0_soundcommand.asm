
; ASM FILE code\common\tech\interrupts\trap0_soundcommand.asm :
; 0x45C..0x490 : Trap 0 - Sound Command

; =============== S U B R O U T I N E =======================================

; If interrupt parameter word = -1, then get d0.w


Trap0_SoundCommand:
                
                movem.l d0-d1/a0,-(sp)
                movea.l $E(sp),a0
                move.w  (a0),d1         ; get interrupt param
                addq.l  #2,$E(sp)
                cmpi.w  #-1,d1
                bne.s   loc_472
                move.w  d0,d1           ; if param = FFFF, then get param from d0
loc_472:
                
                tst.b   ((SOUND_COMMANDS_DEACTIVATED-$1000000)).w
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

