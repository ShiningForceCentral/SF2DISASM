
; SCRIPT SECTION mapsetups\map06\s2_2BD :
; 
ms_map6_flag2BD_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_549C0-ms_map6_flag2BD_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_54A0E-ms_map6_flag2BD_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_54A34-ms_map6_flag2BD_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_54A6A-ms_map6_flag2BD_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_54A9C-ms_map6_flag2BD_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_54AD8-ms_map6_flag2BD_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_54B36-ms_map6_flag2BD_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_54B54-ms_map6_flag2BD_EntityEvents
										dc.b $88
										dc.b 1
										dc.w sub_54B7E-ms_map6_flag2BD_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_54BA0-ms_map6_flag2BD_EntityEvents
										dc.b $8A
										dc.b 1
										dc.w sub_54BB2-ms_map6_flag2BD_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_54BCC-ms_map6_flag2BD_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_54BFE-ms_map6_flag2BD_EntityEvents
										dc.b $8D
										dc.b 1
										dc.w sub_54C10-ms_map6_flag2BD_EntityEvents
										dc.w $FD00
										dc.w return_54C30-ms_map6_flag2BD_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_549C0:
										
										trap    #1
										dc.w $2BE
										bne.s   loc_549D0
										trap    #5
										dc.w $3FF
										trap    #5
										dc.w $400
										bra.s   return_54A0C
loc_549D0:
										
										trap    #1
										dc.w $322
										bne.s   loc_549F2
										cmp.b   #1,((byte_FFB651-$1000000)).w
										bne.s   loc_549EC
										move.b  #$11,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										bra.s   loc_549F0
loc_549EC:
										
										trap    #5
										dc.w $40C
loc_549F0:
										
										bra.s   return_54A0C
loc_549F2:
										
										cmp.b   #1,((byte_FFB651-$1000000)).w
										bne.s   loc_54A08
										move.b  #$17,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										bra.s   return_54A0C
loc_54A08:
										
										trap    #5
										dc.w $44B
return_54A0C:
										
										rts

	; End of function sub_549C0


; =============== S U B R O U T I N E =======================================

sub_54A0E:
										
										trap    #1
										dc.w $322
										bne.s   loc_54A2E
										trap    #1
										dc.w $2BE
										bne.s   loc_54A24
										trap    #5
										dc.w $3FD
										trap    #5
										dc.w $3FE
										bra.s   loc_54A2C
loc_54A24:
										
										trap    #5
										dc.w $40D
										trap    #5
										dc.w $40E
loc_54A2C:
										
										bra.s   return_54A32
loc_54A2E:
										
										trap    #5
										dc.w $44C
return_54A32:
										
										rts

	; End of function sub_54A0E


; =============== S U B R O U T I N E =======================================

sub_54A34:
										
										trap    #1
										dc.w $322
										bne.s   loc_54A60
										trap    #1
										dc.w $2BE
										bne.s   loc_54A56
										trap    #1
										dc.w $2BD
										bne.s   loc_54A50
										trap    #5
										dc.w $403
										trap    #5
										dc.w $404
										bra.s   loc_54A54
loc_54A50:
										
										trap    #5
										dc.w $421
loc_54A54:
										
										bra.s   loc_54A5E
loc_54A56:
										
										trap    #5
										dc.w $40F
										trap    #5
										dc.w $410
loc_54A5E:
										
										bra.s   return_54A68
loc_54A60:
										
										trap    #5
										dc.w $44D
										trap    #5
										dc.w $44E
return_54A68:
										
										rts

	; End of function sub_54A34


; =============== S U B R O U T I N E =======================================

sub_54A6A:
										
										trap    #1
										dc.w $322
										bne.s   loc_54A96
										trap    #1
										dc.w $2BE
										bne.s   loc_54A8C
										trap    #1
										dc.w $2BD
										bne.s   loc_54A86
										trap    #5
										dc.w $406
										trap    #5
										dc.w $407
										bra.s   loc_54A8A
loc_54A86:
										
										trap    #5
										dc.w $422
loc_54A8A:
										
										bra.s   loc_54A94
loc_54A8C:
										
										trap    #5
										dc.w $411
										trap    #5
										dc.w $412
loc_54A94:
										
										bra.s   return_54A9A
loc_54A96:
										
										trap    #5
										dc.w $44F
return_54A9A:
										
										rts

	; End of function sub_54A6A


; =============== S U B R O U T I N E =======================================

sub_54A9C:
										
										trap    #1
										dc.w $322
										bne.s   loc_54AD0
										trap    #1
										dc.w $2BE
										bne.s   loc_54ABA
										trap    #1
										dc.w $2BD
										bne.s   loc_54AB4
										trap    #5
										dc.w $408
										bra.s   loc_54AB8
loc_54AB4:
										
										trap    #5
										dc.w $423
loc_54AB8:
										
										bra.s   loc_54ACE
loc_54ABA:
										
										cmp.b   #1,((byte_FFB651-$1000000)).w
										bne.s   loc_54ACA
										jsr     j_ChurchActions
										bra.s   loc_54ACE
loc_54ACA:
										
										trap    #5
										dc.w $413
loc_54ACE:
										
										bra.s   return_54AD6
loc_54AD0:
										
										jsr     j_ChurchActions
return_54AD6:
										
										rts

	; End of function sub_54A9C


; =============== S U B R O U T I N E =======================================

sub_54AD8:
										
										trap    #1
										dc.w $2BE
										bne.s   loc_54AF4
										trap    #1
										dc.w $2BD
										bne.s   loc_54AEE
										trap    #5
										dc.w $401
										trap    #5
										dc.w $402
										bra.s   loc_54AF2
loc_54AEE:
										
										trap    #5
										dc.w $420
loc_54AF2:
										
										bra.s   return_54B34
loc_54AF4:
										
										trap    #1
										dc.w $322
										bne.s   loc_54B1A
										cmp.b   #1,((byte_FFB651-$1000000)).w
										bne.s   loc_54B10
										move.b  #2,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										bra.s   loc_54B18
loc_54B10:
										
										trap    #5
										dc.w $414
										trap    #5
										dc.w $415
loc_54B18:
										
										bra.s   return_54B34
loc_54B1A:
										
										cmp.b   #1,((byte_FFB651-$1000000)).w
										bne.s   loc_54B30
										move.b  #8,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
										bra.s   return_54B34
loc_54B30:
										
										trap    #5
										dc.w $450
return_54B34:
										
										rts

	; End of function sub_54AD8


; =============== S U B R O U T I N E =======================================

sub_54B36:
										
										trap    #1
										dc.w $322
										bne.s   loc_54B4E
										trap    #1
										dc.w $2BE
										bne.s   loc_54B48
										trap    #5
										dc.w $405
										bra.s   loc_54B4C
loc_54B48:
										
										trap    #5
										dc.w $416
loc_54B4C:
										
										bra.s   return_54B52
loc_54B4E:
										
										trap    #5
										dc.w $451
return_54B52:
										
										rts

	; End of function sub_54B36


; =============== S U B R O U T I N E =======================================

sub_54B54:
										
										trap    #1
										dc.w $322
										bne.s   loc_54B78
										trap    #1
										dc.w $2BE
										bne.s   loc_54B72
										trap    #1
										dc.w $2BD
										bne.s   loc_54B6C
										trap    #5
										dc.w $409
										bra.s   loc_54B70
loc_54B6C:
										
										trap    #5
										dc.w $424
loc_54B70:
										
										bra.s   loc_54B76
loc_54B72:
										
										trap    #5
										dc.w $417
loc_54B76:
										
										bra.s   return_54B7C
loc_54B78:
										
										trap    #5
										dc.w $452
return_54B7C:
										
										rts

	; End of function sub_54B54


; =============== S U B R O U T I N E =======================================

sub_54B7E:
										
										trap    #1
										dc.w $322
										bne.s   loc_54B96
										trap    #1
										dc.w $2BE
										bne.s   loc_54B90
										trap    #5
										dc.w $40B
										bra.s   loc_54B94
loc_54B90:
										
										trap    #5
										dc.w $418
loc_54B94:
										
										bra.s   return_54B9E
loc_54B96:
										
										trap    #5
										dc.w $453
										trap    #5
										dc.w $454
return_54B9E:
										
										rts

	; End of function sub_54B7E


; =============== S U B R O U T I N E =======================================

sub_54BA0:
										
										trap    #1
										dc.w $322
										bne.s   loc_54BAC
										trap    #5
										dc.w $419
										bra.s   return_54BB0
loc_54BAC:
										
										trap    #5
										dc.w $455
return_54BB0:
										
										rts

	; End of function sub_54BA0


; =============== S U B R O U T I N E =======================================

sub_54BB2:
										
										trap    #1
										dc.w $322
										bne.s   loc_54BC2
										trap    #5
										dc.w $41A
										trap    #5
										dc.w $41B
										bra.s   return_54BCA
loc_54BC2:
										
										trap    #5
										dc.w $456
										trap    #5
										dc.w $457
return_54BCA:
										
										rts

	; End of function sub_54BB2


; =============== S U B R O U T I N E =======================================

sub_54BCC:
										
										trap    #1
										dc.w $322
										bne.s   loc_54BF8
										trap    #1
										dc.w $2BE
										bne.s   loc_54BEE
										trap    #1
										dc.w $2BD
										bne.s   loc_54BE4
										trap    #5
										dc.w $40A
										bra.s   loc_54BEC
loc_54BE4:
										
										trap    #5
										dc.w $425
										trap    #5
										dc.w $426
loc_54BEC:
										
										bra.s   loc_54BF6
loc_54BEE:
										
										trap    #5
										dc.w $41C
										trap    #5
										dc.w $41D
loc_54BF6:
										
										bra.s   return_54BFC
loc_54BF8:
										
										trap    #5
										dc.w $458
return_54BFC:
										
										rts

	; End of function sub_54BCC


; =============== S U B R O U T I N E =======================================

sub_54BFE:
										
										trap    #1
										dc.w $322
										bne.s   loc_54C0A
										trap    #5
										dc.w $41E
										bra.s   return_54C0E
loc_54C0A:
										
										trap    #5
										dc.w $459
return_54C0E:
										
										rts

	; End of function sub_54BFE


; =============== S U B R O U T I N E =======================================

sub_54C10:
										
										trap    #1
										dc.w $322
										bne.w   loc_54C32
										trap    #1
										dc.w $2BE
										bne.s   loc_54C24
										trap    #5
										dc.w $41F
										bra.s   return_54C30
loc_54C24:
										
										trap    #5
										dc.w $427
										trap    #5
										dc.w $428
										trap    #5
										dc.w $429
return_54C30:
										
										rts
loc_54C32:
										
										trap    #1
										dc.w $324
										bne.w   loc_54CC0
										trap    #1
										dc.w $325
										bne.s   loc_54C4C
										trap    #5
										dc.w $45A
										trap    #5
										dc.w $45B
										bra.w   loc_54CBE
loc_54C4C:
										
										moveq   #$72,d1 
										jsr     sub_81D0
										cmp.w   #$FFFF,d0
										bne.s   loc_54C8E
										trap    #5
										dc.w $45C
										trap    #5
										dc.w $FFFF
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #$1F,d0
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #5
										dc.w $45D
										trap    #5
										dc.w $45E
										trap    #5
										dc.w $FFFF
										bra.s   loc_54CBE
loc_54C8E:
										
										trap    #5
										dc.w $45F
										trap    #5
										dc.w $FFFF
										lea     cs_54CC6(pc), a0
										trap    #6
										trap    #5
										dc.w $460
										trap    #5
										dc.w $FFFF
										move.w  #$74,d0 
										moveq   #0,d1
										bsr.w   sub_4F48A
										btst    #0,d0
										bne.s   loc_54CBA
										trap    #2
										dc.w $324
										bra.s   loc_54CBE
loc_54CBA:
										
										trap    #5
										dc.w $6C1
loc_54CBE:
										
										bra.s   return_54CC4
loc_54CC0:
										
										trap    #5
										dc.w $462
return_54CC4:
										
										rts

	; End of function sub_54C10

cs_54CC6:           dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
