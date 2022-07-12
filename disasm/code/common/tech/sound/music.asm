
; ASM FILE code\common\tech\sound\music.asm :
; 0x16BE..0x16D6 : Sound function

; =============== S U B R O U T I N E =======================================

; d0 : music index, or previous music if value $FB


PlayMusicAfterCurrentOne:
                
                 
                sndCom  SOUND_COMMAND_WAIT_MUSIC_END ; Wait for current music to end
                sndCom  SOUND_COMMAND_GET_D0_PARAMETER
@Wait:
                
                moveq   #3,d0
                bsr.w   Sleep           
                tst.b   (WAIT_FOR_MUSIC_END).l ; wait for sound command sent
                bne.s   @Wait
                rts

    ; End of function PlayMusicAfterCurrentOne

