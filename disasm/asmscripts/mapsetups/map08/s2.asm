
; SCRIPT SECTION mapsetups\map08\s2 :
; 
ms_map8_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_56090-ms_map8_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_560AC-ms_map8_EntityEvents
										dc.w $FD00
										dc.w return_56144-ms_map8_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56090:
										
										trap    #1
										dc.w $100
										bne.s   loc_560A6
										trap    #2
										dc.w $100
										trap    #5
										dc.w $529
										trap    #5
										dc.w $52A
										trap    #5
										dc.w $52B
loc_560A6:
										
										trap    #5
										dc.w $52C
										rts

	; End of function sub_56090


; =============== S U B R O U T I N E =======================================

sub_560AC:
										
										trap    #5
										dc.w $52D
										rts

	; End of function sub_560AC


; =============== S U B R O U T I N E =======================================

sub_560B2:
										
										trap    #5
										dc.w $52E
										rts

	; End of function sub_560B2


; =============== S U B R O U T I N E =======================================

j_j_ChurchActions:
										
										jmp     j_ChurchActions

	; End of function j_j_ChurchActions


; =============== S U B R O U T I N E =======================================

sub_560BE:
										
										trap    #5
										dc.w $52F
										trap    #5
										dc.w $530
										trap    #5
										dc.w $531
										rts

	; End of function sub_560BE


; =============== S U B R O U T I N E =======================================

sub_560CC:
										
										trap    #1
										dc.w $2DB
										bne.s   loc_560DC
										trap    #5
										dc.w $532
										trap    #5
										dc.w $533
										bra.s   return_560E0
loc_560DC:
										
										trap    #5
										dc.w $545
return_560E0:
										
										rts

	; End of function sub_560CC


; =============== S U B R O U T I N E =======================================

sub_560E2:
										
										move.b  #3,((RAM_CurrentShopIdx-$1000000)).w
										jmp     j_ShopActions

	; End of function sub_560E2


; =============== S U B R O U T I N E =======================================

sub_560EE:
										
										lea     cs_56172(pc), a0
										trap    #6
										rts

	; End of function sub_560EE


; =============== S U B R O U T I N E =======================================

sub_560F6:
										
										trap    #5
										dc.w $539
										trap    #5
										dc.w $53A
										trap    #5
										dc.w $53B
										trap    #5
										dc.w $53C
										rts

	; End of function sub_560F6


; =============== S U B R O U T I N E =======================================

sub_56108:
										
										trap    #5
										dc.w $53D
										trap    #5
										dc.w $53E
										rts

	; End of function sub_56108


; =============== S U B R O U T I N E =======================================

sub_56112:
										
										trap    #5
										dc.w $53F
										trap    #5
										dc.w $540
										rts

	; End of function sub_56112


; =============== S U B R O U T I N E =======================================

sub_5611C:
										
										trap    #5
										dc.w $541
										trap    #5
										dc.w $542
										rts

	; End of function sub_5611C


; =============== S U B R O U T I N E =======================================

sub_56126:
										
										move.b  #3,((RAM_CurrentShopIdx-$1000000)).w
										move.b  #$12,((RAM_CurrentShopIdx-$1000000)).w
										jmp     j_ShopActions

	; End of function sub_56126


; =============== S U B R O U T I N E =======================================

sub_56138:
										
										trap    #1
										dc.w 8
										bne.s   return_56144
										lea     cs_56146(pc), a0
										trap    #6
return_56144:
										
										rts

	; End of function sub_56138

cs_56146:           dc.w $15                ; 0015 SET ACTSCRIPT 8 FF 460CE
										dc.b 8
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 8 FF 461AA
										dc.b 8
										dc.b $FF
										dc.l eas_461AA          
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 8 0
										dc.w 8
										dc.w 0
										dc.w 4                  ; 0004 SET TEXT INDEX 543
										dc.w $543
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8
										dc.w 8
										dc.w 8                  ; 0008 JOIN FORCE 8
										dc.w 8
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8
										dc.w 8
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 8
										dc.w 8
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_56172:           dc.w 4                  ; 0004 SET TEXT INDEX 534
										dc.w $534
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87
										dc.w $87
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 45E44
										dc.b $87
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E44
										dc.b $86
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 86 0
										dc.b $86
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 87 2
										dc.b $87
										dc.b 2
										dc.b $80                ; WAIT 39
										dc.b $39
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w $23                ; 0023 SET ENTITY FACING 87 3
										dc.b $87
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87
										dc.w $87
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
