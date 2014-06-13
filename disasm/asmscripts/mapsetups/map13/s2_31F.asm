
; SCRIPT SECTION mapsetups\map13\s2_31F :
; 
ms_map13_flag31F_EntityEvents:
										dc.b 9
										dc.b 1
										dc.w sub_58108-ms_map13_flag31F_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_58056-ms_map13_flag31F_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_58072-ms_map13_flag31F_EntityEvents
										dc.b $82
										dc.b 0
										dc.w sub_58078-ms_map13_flag31F_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_58090-ms_map13_flag31F_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5809E-ms_map13_flag31F_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_580AC-ms_map13_flag31F_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_580C6-ms_map13_flag31F_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_580CE-ms_map13_flag31F_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_580D4-ms_map13_flag31F_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_580DA-ms_map13_flag31F_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_58102-ms_map13_flag31F_EntityEvents
										dc.b $8C
										dc.b 0
										dc.w sub_5810E-ms_map13_flag31F_EntityEvents
										dc.w $FD00
										dc.w nullsub_116-ms_map13_flag31F_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_58056:
										
										trap    #1
										dc.w $100
										bne.s   loc_58068
										trap    #5
										dc.w $58C
										trap    #5
										dc.w $58D
										trap    #2
										dc.w $100
loc_58068:
										
										trap    #5
										dc.w $58E
										trap    #5
										dc.w $58F
										rts

	; End of function sub_58056


; =============== S U B R O U T I N E =======================================

sub_58072:
										
										trap    #5
										dc.w $590
										rts

	; End of function sub_58072


; =============== S U B R O U T I N E =======================================

sub_58078:
										
										trap    #1
										dc.w $2C7
										bne.s   loc_5808A
										lea     cs_58512(pc), a0
										trap    #6
										trap    #2
										dc.w $2C7
										bra.s   return_5808E
loc_5808A:
										
										trap    #5
										dc.w $591
return_5808E:
										
										rts

	; End of function sub_58078


; =============== S U B R O U T I N E =======================================

sub_58090:
										
										move.b  #4,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_58090


; =============== S U B R O U T I N E =======================================

sub_5809E:
										
										move.b  #$13,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_5809E


; =============== S U B R O U T I N E =======================================

sub_580AC:
										
										trap    #1
										dc.w $2C6
										bne.s   loc_580B8
										trap    #5
										dc.w $592
										bra.s   return_580C4
loc_580B8:
										
										trap    #5
										dc.w $5B9
										trap    #5
										dc.w $5BA
										trap    #5
										dc.w $5BB
return_580C4:
										
										rts

	; End of function sub_580AC


; =============== S U B R O U T I N E =======================================

sub_580C6:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_580C6


; =============== S U B R O U T I N E =======================================

sub_580CE:
										
										trap    #5
										dc.w $593
										rts

	; End of function sub_580CE


; =============== S U B R O U T I N E =======================================

sub_580D4:
										
										trap    #5
										dc.w $594
										rts

	; End of function sub_580D4


; =============== S U B R O U T I N E =======================================

sub_580DA:
										
										trap    #1
										dc.w $2C6
										bne.s   loc_580FC
										trap    #1
										dc.w $101
										bne.s   loc_580F2
										lea     cs_58116(pc), a0
										trap    #6
										trap    #2
										dc.w $101
										bra.s   loc_580FA
loc_580F2:
										
										trap    #5
										dc.w $597
										trap    #5
										dc.w $598
loc_580FA:
										
										bra.s   return_58100
loc_580FC:
										
										trap    #5
										dc.w $5B7
return_58100:
										
										rts

	; End of function sub_580DA


; =============== S U B R O U T I N E =======================================

sub_58102:
										
										trap    #5
										dc.w $599
										rts

	; End of function sub_58102


; =============== S U B R O U T I N E =======================================

sub_58108:
										
										trap    #5
										dc.w $59A
										rts

	; End of function sub_58108


; =============== S U B R O U T I N E =======================================

sub_5810E:
										
										trap    #5
										dc.w $5B8
										rts

	; End of function sub_5810E


; =============== S U B R O U T I N E =======================================

nullsub_116:
										
										rts

	; End of function nullsub_116

cs_58116:           dc.w 4                  ; 0004 SET TEXT INDEX 595
										dc.w $595
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 8002
										dc.w $8002
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4002
										dc.w $4002
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 5
										dc.w 5
										dc.w $41                ; 0041 FLASH SCREEN WHITE 46
										dc.w $46
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 89
										dc.w $89
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 89
										dc.w $89
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 89
										dc.w $89
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
