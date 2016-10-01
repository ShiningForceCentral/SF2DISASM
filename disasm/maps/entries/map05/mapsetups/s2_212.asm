
; SCRIPT SECTION maps\entries\map05\mapsetups\s2_212 :
; 
ms_map5_flag212_EntityEvents:
										dc.b $1C
										dc.b 3
										dc.w sub_60452-ms_map5_flag212_EntityEvents
										dc.b $1B
										dc.b 1
										dc.w sub_60458-ms_map5_flag212_EntityEvents
										dc.b $80
										dc.b 3
										dc.w sub_60460-ms_map5_flag212_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_60468-ms_map5_flag212_EntityEvents
										dc.b $82
										dc.b 0
										dc.w sub_60476-ms_map5_flag212_EntityEvents
										dc.w $FD00
										dc.w return_604C6-ms_map5_flag212_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_60452:
										
										trap    #TRAP_TEXTBOX
										dc.w $D9B               ; "I can't believe it!{N}I want to die, but I can't!{W1}"
										rts

	; End of function sub_60452


; =============== S U B R O U T I N E =======================================

sub_60458:
										
										lea     cs_60F18(pc), a0
										trap    #6
										rts

	; End of function sub_60458


; =============== S U B R O U T I N E =======================================

sub_60460:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_60460


; =============== S U B R O U T I N E =======================================

sub_60468:
										
										move.b  #$1D,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_60468


; =============== S U B R O U T I N E =======================================

sub_60476:
										
										trap    #TRAP_CHECKFLAG
										dc.w $1C
										beq.s   loc_60494
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										clr.w   ((RAM_Dialogue_NameIdx1-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $1A7               ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
										trap    #TRAP_TEXTBOX
										dc.w $FF2               ; "A hole.{W1}"
										bra.s   return_604C6
loc_60494:
										
										trap    #TRAP_CHECKFLAG
										dc.w $3B1
										bne.s   return_604C6
										lea     cs_6060E(pc), a0
										trap    #6
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$1C,d0
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #TRAP_TEXTBOX
										dc.w $D9B               ; "I can't believe it!{N}I want to die, but I can't!{W1}"
										trap    #TRAP_SETFLAG
										dc.w $3B1               ; set after recruiting Lemon in Yeel
return_604C6:
										
										rts

	; End of function sub_60476

