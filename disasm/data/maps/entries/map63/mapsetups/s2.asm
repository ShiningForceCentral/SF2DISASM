
; ASM FILE data\maps\entries\map63\mapsetups\s2.asm :
; 0x5C98A..0x5C9E2 : 
ms_map63_EntityEvents:
		msEntityEvent 29, RIGHT, sub_5C992-ms_map63_EntityEvents
		msDefaultEntityEvent 0, return_5C9E0-ms_map63_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5C992:
		trap    #CHECK_FLAG
		dc.w $1D
		bne.s   return_5C9E0
		moveq   #$75,d1 
		jsr     j_sub_9146
		cmpi.w  #$FFFF,d0
		bne.s   loc_5C9D2
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		move.w  #$1D,d0
		jsr     GetEntityPortraitAndSpeechSfx
		move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
		move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
		jsr     LoadAndDisplayCurrentPortrait
		trap    #TEXTBOX
		dc.w $1051              ; "Olooooo...Oloo....{N}Have you seen my arm?{W2}"
		trap    #TEXTBOX
		dc.w $1052              ; "I can't move...without my{N}arm...oloooo....{W1}"
		trap    #TEXTBOX
		dc.w $FFFF
		bra.s   return_5C9E0
loc_5C9D2:
		moveq   #$75,d0 
		jsr     sub_4F542
		lea     cs_5CBB4(pc), a0
		trap    #6
return_5C9E0:
		rts

	; End of function sub_5C992

