
; SCRIPT SECTION mapsetups\map03\s2_1FA :
; 
ms_map3_flag1FA_EntityEvents:
										dc.b $80
										dc.b 0
										dc.w sub_51210-ms_map3_flag1FA_EntityEvents
										dc.b $81
										dc.b 0
										dc.w sub_51210-ms_map3_flag1FA_EntityEvents
										dc.b $82
										dc.b 3
										dc.w sub_51220-ms_map3_flag1FA_EntityEvents
										dc.b $83
										dc.b 3
										dc.w sub_51226-ms_map3_flag1FA_EntityEvents
										dc.b $84
										dc.b 0
										dc.w sub_5122C-ms_map3_flag1FA_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_51232-ms_map3_flag1FA_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_51238-ms_map3_flag1FA_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_5123E-ms_map3_flag1FA_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_51244-ms_map3_flag1FA_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_51170+$10000-ms_map3_flag1FA_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_510FA+$10000-ms_map3_flag1FA_EntityEvents
										dc.b $8B
										dc.b 0
										dc.w sub_51210-ms_map3_flag1FA_EntityEvents
										dc.b $8C
										dc.b 3
										dc.w sub_5124A-ms_map3_flag1FA_EntityEvents
										dc.b $8D
										dc.b 3
										dc.w sub_51250-ms_map3_flag1FA_EntityEvents
										dc.b $8E
										dc.b 3
										dc.w sub_511BC+$10000-ms_map3_flag1FA_EntityEvents
										dc.b 6
										dc.b 0
										dc.w sub_51256-ms_map3_flag1FA_EntityEvents
										dc.w $FD00
										dc.w return_5105A+$10000-ms_map3_flag1FA_EntityEvents
										dc.b $FF
										dc.b $FF

; =============== S U B R O U T I N E =======================================

sub_51210:
										
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #5
										dc.w $2A6
										rts

	; End of function sub_51210


; =============== S U B R O U T I N E =======================================

sub_51220:
										
										trap    #5
										dc.w $299
										rts

	; End of function sub_51220


; =============== S U B R O U T I N E =======================================

sub_51226:
										
										trap    #5
										dc.w $29A
										rts

	; End of function sub_51226


; =============== S U B R O U T I N E =======================================

sub_5122C:
										
										trap    #5
										dc.w $29B
										rts

	; End of function sub_5122C


; =============== S U B R O U T I N E =======================================

sub_51232:
										
										trap    #5
										dc.w $29C
										rts

	; End of function sub_51232


; =============== S U B R O U T I N E =======================================

sub_51238:
										
										trap    #5
										dc.w $29D
										rts

	; End of function sub_51238


; =============== S U B R O U T I N E =======================================

sub_5123E:
										
										trap    #5
										dc.w $29E
										rts

	; End of function sub_5123E


; =============== S U B R O U T I N E =======================================

sub_51244:
										
										trap    #5
										dc.w $29F
										rts

	; End of function sub_51244


; =============== S U B R O U T I N E =======================================

sub_5124A:
										
										trap    #5
										dc.w $2A0
										rts

	; End of function sub_5124A


; =============== S U B R O U T I N E =======================================

sub_51250:
										
										trap    #5
										dc.w $2A1
										rts

	; End of function sub_51250


; =============== S U B R O U T I N E =======================================

sub_51256:
										
										trap    #1
										dc.w 6
										bne.s   return_512B8
										trap    #5
										dc.w $2A2
										trap    #5
										dc.w $FFFF
										jsr     j_hidePortraitWindow
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #5
										dc.w $2A3
										jsr     j_yesNoPrompt
										trap    #5
										dc.w $FFFF
										tst.w   d0
										bne.s   return_512B8
										move.w  #6,d0
										jsr     sub_1007C
										trap    #5
										dc.w $2A4
										trap    #5
										dc.w $FFFF
										move.w  ((word_FFB09E-$1000000)).w,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #5
										dc.w $2A5
										trap    #5
										dc.w $FFFF
										jsr     j_hidePortraitWindow
										lea     cs_512BA(pc), a0
										trap    #6
return_512B8:
										
										rts

	; End of function sub_51256

cs_512BA:           dc.w $23                ; 0023 SET ENTITY FACING 6 3
										dc.b 6
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 6 FF 45E44
										dc.b 6
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 6 FF 45E44
										dc.b 6
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 6 FF 45E44
										dc.b 6
										dc.b $FF
										dc.l eas_Jump           
										dc.w 8                  ; 0008 JOIN FORCE 6
										dc.w 6
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 6
										dc.w 6
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
