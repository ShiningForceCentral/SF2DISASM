
; SCRIPT SECTION system\sound\musicfunctions :
; Sound function

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

