
; ASM FILE code\gameflow\battle\battlemusic-standard.asm :
; Standard reimplementation of battle music player function.

; =============== S U B R O U T I N E =======================================


PlayMapMusic:
                
                movem.l d0-d2/a0,-(sp)
                clr.w   d0
                move.b  ((MAP_AREA_MUSIC_INDEX-$1000000)).w,d0
                checkSavedByte #NOT_CURRENTLY_IN_BATTLE, CURRENT_BATTLE
                beq.s   @Continue
                
                lea     table_ExplorationToBattleMusics(pc), a0
                move.w  d0,d1
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Continue
                move.b  (a0),d0
                
@Continue:      
            if (MUSIC_RESUMING&RESUME_BATTLEFIELD_MUSIC_ONLY=1)
                activateMusicResuming
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
                deactivateMusicResuming
            else
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
            endif
                movem.l (sp)+,d0-d2/a0
                rts

    ; End of function PlayMapMusic

