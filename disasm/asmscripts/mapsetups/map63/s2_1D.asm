
; SCRIPT SECTION mapsetups\map63\s2_1D :
; 
ms_map63_flag1D_EntityEvents:
										dc.b $1D
										dc.b 0
										dc.w sub_5C992-ms_map63_flag1D_EntityEvents
										dc.w $FD00
										dc.w return_5C9E0-ms_map63_flag1D_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5C992:
										
										trap    #1
										dc.w $1D
										bne.s   return_5C9E0
										moveq   #$75,d1 
										jsr     sub_81D0
										cmp.w   #$FFFF,d0
										bne.s   loc_5C9D2
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$1D,d0
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #5
										dc.w $1051
										trap    #5
										dc.w $1052
										trap    #5
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

