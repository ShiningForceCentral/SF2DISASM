
; SCRIPT SECTION maps\entries\map05\mapsetups\s2_28A :
; 
ms_map5_flag28A_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_51B1E-ms_map5_flag28A_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_51BB8-ms_map5_flag28A_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_51BC2-ms_map5_flag28A_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_51BCC-ms_map5_flag28A_EntityEvents
										dc.b $84
										dc.b 3
										dc.w sub_51BD2-ms_map5_flag28A_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_51B50-ms_map5_flag28A_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_51B56-ms_map5_flag28A_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_51BDC-ms_map5_flag28A_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_51BE2-ms_map5_flag28A_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_51BF0-ms_map5_flag28A_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_51BFA-ms_map5_flag28A_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_51C04-ms_map5_flag28A_EntityEvents
										dc.b $8C
										dc.b 3
										dc.w sub_51C0E-ms_map5_flag28A_EntityEvents
										dc.b $8D
										dc.b 3
										dc.w sub_51BAE-ms_map5_flag28A_EntityEvents
										dc.b $8E
										dc.b 1
										dc.w sub_51C1C-ms_map5_flag28A_EntityEvents
										dc.w $FD00
										dc.w nullsub_113-ms_map5_flag28A_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_51AC2:
										
										trap    #5
										dc.w $310
										trap    #5
										dc.w $311
										trap    #5
										dc.w $FFFF
										jsr     j_HidePortraitWindow
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #5
										dc.w $312
										trap    #5
										dc.w $FFFF
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										move.w  #4,d0
										jsr     GetEntityPortraitAndSpeechSound
										move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
										move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #5
										dc.w $313
										lea     cs_51B14(pc), a0
										trap    #6
										trap    #2
										dc.w $48
										rts

	; End of function sub_51AC2

cs_51B14:           dc.w $2C                ; 002C FOLLOW ENTITY 4 0 2
										dc.w 4
										dc.w 0
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_51B1E:
										
										trap    #5
										dc.w $2F8
										rts

	; End of function sub_51B1E


; =============== S U B R O U T I N E =======================================

sub_51B24:
										
										trap    #5
										dc.w $2F9
										trap    #5
										dc.w $2FA
										rts

	; End of function sub_51B24


; =============== S U B R O U T I N E =======================================

sub_51B2E:
										
										trap    #5
										dc.w $2FB
										trap    #5
										dc.w $2FC
										rts

	; End of function sub_51B2E


; =============== S U B R O U T I N E =======================================

sub_51B38:
										
										trap    #5
										dc.w $2FD
										trap    #5
										dc.w $2FE
										rts

	; End of function sub_51B38


; =============== S U B R O U T I N E =======================================

sub_51B42:
										
										trap    #5
										dc.w $2FF
										trap    #5
										dc.w $300
										trap    #5
										dc.w $301
										rts

	; End of function sub_51B42


; =============== S U B R O U T I N E =======================================

sub_51B50:
										
										trap    #5
										dc.w $302
										rts

	; End of function sub_51B50


; =============== S U B R O U T I N E =======================================

sub_51B56:
										
										trap    #5
										dc.w $303
										rts

	; End of function sub_51B56


; =============== S U B R O U T I N E =======================================

sub_51B5C:
										
										trap    #5
										dc.w $304
										rts

	; End of function sub_51B5C


; =============== S U B R O U T I N E =======================================

sub_51B62:
										
										trap    #5
										dc.w $305
										trap    #5
										dc.w $306
										rts

	; End of function sub_51B62


; =============== S U B R O U T I N E =======================================

sub_51B6C:
										
										trap    #5
										dc.w $307
										trap    #5
										dc.w $308
										trap    #5
										dc.w $309
										rts

	; End of function sub_51B6C


; =============== S U B R O U T I N E =======================================

sub_51B7A:
										
										trap    #5
										dc.w $30A
										rts

	; End of function sub_51B7A


; =============== S U B R O U T I N E =======================================

sub_51B80:
										
										trap    #5
										dc.w $30B
										trap    #5
										dc.w $30C
										trap    #5
										dc.w $30D
										rts

	; End of function sub_51B80


; =============== S U B R O U T I N E =======================================

sub_51B8E:
										
										trap    #1
										dc.w $48
										bne.s   loc_51B9E
										trap    #5
										dc.w $30E
										trap    #5
										dc.w $30F
										bra.s   return_51BA6
loc_51B9E:
										
										trap    #5
										dc.w $314
										trap    #5
										dc.w $315
return_51BA6:
										
										rts

	; End of function sub_51B8E


; =============== S U B R O U T I N E =======================================

sub_51BA8:
										
										trap    #5
										dc.w $32A
										rts

	; End of function sub_51BA8


; =============== S U B R O U T I N E =======================================

sub_51BAE:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_51BAE


; =============== S U B R O U T I N E =======================================

nullsub_113:
										
										rts

	; End of function nullsub_113


; =============== S U B R O U T I N E =======================================

sub_51BB8:
										
										trap    #5
										dc.w $316
										trap    #5
										dc.w $317
										rts

	; End of function sub_51BB8


; =============== S U B R O U T I N E =======================================

sub_51BC2:
										
										trap    #5
										dc.w $318
										trap    #5
										dc.w $319
										rts

	; End of function sub_51BC2


; =============== S U B R O U T I N E =======================================

sub_51BCC:
										
										trap    #5
										dc.w $31A
										rts

	; End of function sub_51BCC


; =============== S U B R O U T I N E =======================================

sub_51BD2:
										
										trap    #5
										dc.w $31B
										trap    #5
										dc.w $31C
										rts

	; End of function sub_51BD2


; =============== S U B R O U T I N E =======================================

sub_51BDC:
										
										trap    #5
										dc.w $31D
										rts

	; End of function sub_51BDC


; =============== S U B R O U T I N E =======================================

sub_51BE2:
										
										trap    #5
										dc.w $31E
										trap    #5
										dc.w $31F
										trap    #5
										dc.w $320
										rts

	; End of function sub_51BE2


; =============== S U B R O U T I N E =======================================

sub_51BF0:
										
										trap    #5
										dc.w $321
										trap    #5
										dc.w $322
										rts

	; End of function sub_51BF0


; =============== S U B R O U T I N E =======================================

sub_51BFA:
										
										trap    #5
										dc.w $323
										trap    #5
										dc.w $324
										rts

	; End of function sub_51BFA


; =============== S U B R O U T I N E =======================================

sub_51C04:
										
										trap    #5
										dc.w $325
										trap    #5
										dc.w $326
										rts

	; End of function sub_51C04


; =============== S U B R O U T I N E =======================================

sub_51C0E:
										
										trap    #5
										dc.w $327
										trap    #5
										dc.w $328
										trap    #5
										dc.w $329
										rts

	; End of function sub_51C0E


; =============== S U B R O U T I N E =======================================

sub_51C1C:
										
										trap    #5
										dc.w $32A
										rts

	; End of function sub_51C1C

