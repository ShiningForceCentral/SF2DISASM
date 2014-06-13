
; SCRIPT SECTION mapsetups\map10\s2 :
; 
ms_map10_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w sub_56DE0-ms_map10_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_56DE6-ms_map10_EntityEvents
										dc.b $82
										dc.b 0
										dc.w sub_56DF0-ms_map10_EntityEvents
										dc.b $83
										dc.b 0
										dc.w sub_56DFE-ms_map10_EntityEvents
										dc.b $84
										dc.b 0
										dc.w sub_56E08-ms_map10_EntityEvents
										dc.b $85
										dc.b 0
										dc.w sub_56E12-ms_map10_EntityEvents
										dc.b $86
										dc.b 0
										dc.w sub_56E1C-ms_map10_EntityEvents
										dc.b $87
										dc.b 0
										dc.w sub_56E22-ms_map10_EntityEvents
										dc.b $88
										dc.b 0
										dc.w sub_56E2C-ms_map10_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_56E36-ms_map10_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_56E44-ms_map10_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_56E4C-ms_map10_EntityEvents
										dc.b $8C
										dc.b 3
										dc.w sub_56E52-ms_map10_EntityEvents
										dc.b $8D
										dc.b 3
										dc.w sub_56E58-ms_map10_EntityEvents
										dc.b $8E
										dc.b 3
										dc.w sub_56E5E-ms_map10_EntityEvents
										dc.b $8F
										dc.b 3
										dc.w sub_56E64-ms_map10_EntityEvents
										dc.b $90
										dc.b 1
										dc.w sub_56E6A-ms_map10_EntityEvents
										dc.b $91
										dc.b 3
										dc.w sub_56E70-ms_map10_EntityEvents
										dc.b $92
										dc.b 3
										dc.w sub_56E7A-ms_map10_EntityEvents
										dc.b $93
										dc.b 1
										dc.w sub_56E84-ms_map10_EntityEvents
										dc.b $94
										dc.b 1
										dc.w sub_56E8A-ms_map10_EntityEvents
										dc.b $95
										dc.b 3
										dc.w sub_56E90-ms_map10_EntityEvents
										dc.b $A
										dc.b 3
										dc.w sub_56E96-ms_map10_EntityEvents
										dc.w $FD00
										dc.w return_56E9A-ms_map10_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56DE0:
										
										trap    #5
										dc.w $621
										rts

	; End of function sub_56DE0


; =============== S U B R O U T I N E =======================================

sub_56DE6:
										
										trap    #5
										dc.w $624
										trap    #5
										dc.w $625
										rts

	; End of function sub_56DE6


; =============== S U B R O U T I N E =======================================

sub_56DF0:
										
										move.b  #$14,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_56DF0


; =============== S U B R O U T I N E =======================================

sub_56DFE:
										
										trap    #5
										dc.w $61C
										trap    #5
										dc.w $61D
										rts

	; End of function sub_56DFE


; =============== S U B R O U T I N E =======================================

sub_56E08:
										
										trap    #5
										dc.w $61A
										trap    #5
										dc.w $61B
										rts

	; End of function sub_56E08


; =============== S U B R O U T I N E =======================================

sub_56E12:
										
										trap    #5
										dc.w $628
										trap    #5
										dc.w $629
										rts

	; End of function sub_56E12


; =============== S U B R O U T I N E =======================================

sub_56E1C:
										
										trap    #5
										dc.w $61E
										rts

	; End of function sub_56E1C


; =============== S U B R O U T I N E =======================================

sub_56E22:
										
										trap    #5
										dc.w $622
										trap    #5
										dc.w $623
										rts

	; End of function sub_56E22


; =============== S U B R O U T I N E =======================================

sub_56E2C:
										
										trap    #5
										dc.w $62C
										trap    #5
										dc.w $62D
										rts

	; End of function sub_56E2C


; =============== S U B R O U T I N E =======================================

sub_56E36:
										
										move.b  #5,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										rts

	; End of function sub_56E36


; =============== S U B R O U T I N E =======================================

sub_56E44:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_56E44


; =============== S U B R O U T I N E =======================================

sub_56E4C:
										
										trap    #5
										dc.w $62E
										rts

	; End of function sub_56E4C


; =============== S U B R O U T I N E =======================================

sub_56E52:
										
										trap    #5
										dc.w $62F
										rts

	; End of function sub_56E52


; =============== S U B R O U T I N E =======================================

sub_56E58:
										
										trap    #5
										dc.w $630
										rts

	; End of function sub_56E58


; =============== S U B R O U T I N E =======================================

sub_56E5E:
										
										trap    #5
										dc.w $631
										rts

	; End of function sub_56E5E


; =============== S U B R O U T I N E =======================================

sub_56E64:
										
										trap    #5
										dc.w $632
										rts

	; End of function sub_56E64


; =============== S U B R O U T I N E =======================================

sub_56E6A:
										
										trap    #5
										dc.w $633
										rts

	; End of function sub_56E6A


; =============== S U B R O U T I N E =======================================

sub_56E70:
										
										trap    #5
										dc.w $634
										trap    #5
										dc.w $635
										rts

	; End of function sub_56E70


; =============== S U B R O U T I N E =======================================

sub_56E7A:
										
										trap    #5
										dc.w $636
										trap    #5
										dc.w $637
										rts

	; End of function sub_56E7A


; =============== S U B R O U T I N E =======================================

sub_56E84:
										
										trap    #5
										dc.w $68E
										rts

	; End of function sub_56E84


; =============== S U B R O U T I N E =======================================

sub_56E8A:
										
										trap    #5
										dc.w $68D
										rts

	; End of function sub_56E8A


; =============== S U B R O U T I N E =======================================

sub_56E90:
										
										trap    #5
										dc.w $626
										rts

	; End of function sub_56E90


; =============== S U B R O U T I N E =======================================

sub_56E96:
										
										trap    #5
										dc.w $639
return_56E9A:
										
										rts

	; End of function sub_56E96

