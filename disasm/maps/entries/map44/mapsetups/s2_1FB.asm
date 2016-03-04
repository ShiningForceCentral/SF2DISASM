
; SCRIPT SECTION maps\entries\map44\mapsetups\s2_1FB :
; 
ms_map44_flag1FB_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_544E6-ms_map44_flag1FB_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_544EC-ms_map44_flag1FB_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_544F2-ms_map44_flag1FB_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_544F8-ms_map44_flag1FB_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_544FE-ms_map44_flag1FB_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_54504-ms_map44_flag1FB_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_5450A-ms_map44_flag1FB_EntityEvents
										dc.b $8A
										dc.b 1
										dc.w sub_54510-ms_map44_flag1FB_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_54550-ms_map44_flag1FB_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_54556-ms_map44_flag1FB_EntityEvents
										dc.w $FD00
										dc.w nullsub_146-ms_map44_flag1FB_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_544B6:
										
										trap    #5
										dc.w $271
										rts

	; End of function sub_544B6


; =============== S U B R O U T I N E =======================================

sub_544BC:
										
										trap    #5
										dc.w $32A
										rts

	; End of function sub_544BC


; =============== S U B R O U T I N E =======================================

sub_544C2:
										
										trap    #5
										dc.w $26C
										rts

	; End of function sub_544C2


; =============== S U B R O U T I N E =======================================

sub_544C8:
										
										trap    #5
										dc.w $26D
										rts

	; End of function sub_544C8


; =============== S U B R O U T I N E =======================================

sub_544CE:
										
										trap    #5
										dc.w $26E
										rts

	; End of function sub_544CE


; =============== S U B R O U T I N E =======================================

sub_544D4:
										
										trap    #5
										dc.w $26F
										rts

	; End of function sub_544D4


; =============== S U B R O U T I N E =======================================

sub_544DA:
										
										trap    #5
										dc.w $270
										rts

	; End of function sub_544DA


; =============== S U B R O U T I N E =======================================

sub_544E0:
										
										trap    #5
										dc.w $272
										rts

	; End of function sub_544E0


; =============== S U B R O U T I N E =======================================

sub_544E6:
										
										trap    #5
										dc.w $3E9
										rts

	; End of function sub_544E6


; =============== S U B R O U T I N E =======================================

sub_544EC:
										
										trap    #5
										dc.w $3EA
										rts

	; End of function sub_544EC


; =============== S U B R O U T I N E =======================================

sub_544F2:
										
										trap    #5
										dc.w $3EB
										rts

	; End of function sub_544F2


; =============== S U B R O U T I N E =======================================

sub_544F8:
										
										trap    #5
										dc.w $3EC
										rts

	; End of function sub_544F8


; =============== S U B R O U T I N E =======================================

sub_544FE:
										
										trap    #5
										dc.w $3ED
										rts

	; End of function sub_544FE


; =============== S U B R O U T I N E =======================================

sub_54504:
										
										trap    #5
										dc.w $3EE
										rts

	; End of function sub_54504


; =============== S U B R O U T I N E =======================================

sub_5450A:
										
										trap    #5
										dc.w $3EF
										rts

	; End of function sub_5450A


; =============== S U B R O U T I N E =======================================

sub_54510:
										
										trap    #5
										dc.w $3F0
										trap    #5
										dc.w $FFFF
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$1F,d0
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #5
										dc.w $3F1
										jsr     j_YesNoPrompt
										bne.s   loc_5454A
										lea     cs_54578(pc), a0
										trap    #6
										bra.s   return_5454E
loc_5454A:
										
										trap    #5
										dc.w $3F2
return_5454E:
										
										rts

	; End of function sub_54510


; =============== S U B R O U T I N E =======================================

sub_54550:
										
										trap    #5
										dc.w $3F3
										rts

	; End of function sub_54550


; =============== S U B R O U T I N E =======================================

sub_54556:
										
										trap    #5
										dc.w $3F4
										rts

	; End of function sub_54556


; =============== S U B R O U T I N E =======================================

nullsub_146:
										
										rts

	; End of function nullsub_146

