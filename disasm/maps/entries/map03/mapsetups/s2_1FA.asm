
; SCRIPT SECTION maps\entries\map03\mapsetups\s2_1FA :
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
										trap    #TRAP_TEXTBOX
										dc.w $2A6               ; "Already passed away...{N}{LEADER} feels pity.{W1}"
										rts

	; End of function sub_51210


; =============== S U B R O U T I N E =======================================

sub_51220:
										
										trap    #TRAP_TEXTBOX
										dc.w $299               ; "(Shiver)....{N}The Galam Army was so{N}rude.{W1}"
										rts

	; End of function sub_51220


; =============== S U B R O U T I N E =======================================

sub_51226:
										
										trap    #TRAP_TEXTBOX
										dc.w $29A               ; "Galam soldiers rushed into{N}the castle.  What's going{N}on?{W1}"
										rts

	; End of function sub_51226


; =============== S U B R O U T I N E =======================================

sub_5122C:
										
										trap    #TRAP_TEXTBOX
										dc.w $29B               ; "Be quiet when the Galam{N}Army comes in!  Got it?{W1}"
										rts

	; End of function sub_5122C


; =============== S U B R O U T I N E =======================================

sub_51232:
										
										trap    #TRAP_TEXTBOX
										dc.w $29C               ; "I'm not afraid of Galam!{N}Grown-ups are cowards.{W1}"
										rts

	; End of function sub_51232


; =============== S U B R O U T I N E =======================================

sub_51238:
										
										trap    #TRAP_TEXTBOX
										dc.w $29D               ; "It has been so quiet since{N}they forced their way into{N}the castle.{W2}{N}What's going on?{W1}"
										rts

	; End of function sub_51238


; =============== S U B R O U T I N E =======================================

sub_5123E:
										
										trap    #TRAP_TEXTBOX
										dc.w $29E               ; "Why did Galam invade our{N}country so suddenly?  Why?{N}We are allies.{W1}"
										rts

	; End of function sub_5123E


; =============== S U B R O U T I N E =======================================

sub_51244:
										
										trap    #TRAP_TEXTBOX
										dc.w $29F               ; "I can't believe it!{W2}{N}The Galam Army went into{N}the castle with Mr. {NAME;28}{N}in the lead.{W1}"
										rts

	; End of function sub_51244


; =============== S U B R O U T I N E =======================================

sub_5124A:
										
										trap    #TRAP_TEXTBOX
										dc.w $2A0               ; "See, see!{N}Galam soldiers destroyed{N}the cages!{W2}{N}The strange animals ran{N}away!{W1}"
										rts

	; End of function sub_5124A


; =============== S U B R O U T I N E =======================================

sub_51250:
										
										trap    #TRAP_TEXTBOX
										dc.w $2A1               ; "{LEADER}, are you{N}alright?{W2}{N}Please do not go into{N}the castle, {LEADER}.{W1}"
										rts

	; End of function sub_51250


; =============== S U B R O U T I N E =======================================

sub_51256:
										
										trap    #1
										dc.w 6
										bne.s   return_512B8
										trap    #TRAP_TEXTBOX
										dc.w $2A2               ; "(Shiver)...ooouu....{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										jsr     j_HidePortraitWindow
										move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
										clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $2A3               ; "{CLEAR}He is shivering.{N}Will you name him?"
										jsr     j_YesNoPrompt
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										tst.w   d0
										bne.s   return_512B8
										move.w  #6,d0
										jsr     sub_1007C
										trap    #TRAP_TEXTBOX
										dc.w $2A4               ; "{LEADER} named him{N}{NAME;6} and beckoned.{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										move.w  ((word_FFB09E-$1000000)).w,((CURRENT_SPEAK_SOUND-$1000000)).w
										jsr     LoadAndDisplayCurrentPortrait
										trap    #TRAP_TEXTBOX
										dc.w $2A5               ; "Oooo!  Ooooo!{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										jsr     j_HidePortraitWindow
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
