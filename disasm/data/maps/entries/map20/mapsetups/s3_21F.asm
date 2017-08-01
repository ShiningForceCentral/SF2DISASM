
; ASM FILE data\maps\entries\map20\mapsetups\s3_21F.asm :
; 0x6329A..0x63364 : 
ms_map20_flag21F_ZoneEvents:
		dc.b $13
		dc.b $34
		dc.w sub_632AC-ms_map20_flag21F_ZoneEvents
		dc.b $1A
		dc.b $FF
		dc.w sub_632FA-ms_map20_flag21F_ZoneEvents
		dc.b $1B
		dc.b $34
		dc.w sub_63330-ms_map20_flag21F_ZoneEvents
		dc.w $FD00
		dc.w nullsub_85-ms_map20_flag21F_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_85:
		rts

	; End of function nullsub_85


; =============== S U B R O U T I N E =======================================

sub_632AC:
		trap    #SOUND_COMMAND
		dc.w SOUND_COMMAND_FADE_OUT
		lea     cs_632EA(pc), a0
		trap    #6
		clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
		trap    #TEXTBOX
		dc.w $FAE               ; "The Princess is asleep.{N}Will you kiss her?"
		jsr     j_YesNoPrompt
		tst.w   d0
		bne.s   loc_632E0
		lea     cs_EndKiss(pc), a0
		trap    #MAPSCRIPT
		jsr     PlayEndCredits
		moveq   #$FFFFFFFF,d0
		jsr     PlayIntroOrEndCutscene
		jmp     (WitchEnd).w
loc_632E0:
		trap    #SOUND_COMMAND
		dc.w SOUND_COMMAND_INIT_DRIVER
		trap    #SOUND_COMMAND
		dc.w MUSIC_TOWN
		rts

	; End of function sub_632AC

cs_632EA:       setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		csWait $1               ; WAIT 1
		entityShiver $0         ; 002A MAKE ENTITY SHIVER 0
		csc_end                 ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_632FA:
		trap    #1
		dc.w $3D6
		beq.s   return_6332E
		trap    #CHECK_FLAG
		dc.w $3D7
		bne.s   return_6332E
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		move.w  #$80,d0 
		jsr     GetEntityPortraitAndSpeechSfx
		move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
		move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
		trap    #TEXTBOX
		dc.w $FA9               ; "Oh, {LEADER}!{N}I really respect you.{W2}"
		trap    #TEXTBOX
		dc.w $FAA               ; "You shouldered quite a{N}burden for the kingdom.{W2}"
		trap    #TEXTBOX
		dc.w $FAB               ; "I'll be happy if you rule{N}this kingdom with Princess{N}Elis!{W1}"
		trap    #SET_FLAG
		dc.w $3D7
return_6332E:
		rts

	; End of function sub_632FA


; =============== S U B R O U T I N E =======================================

sub_63330:
		trap    #CHECK_FLAG
		dc.w $3D8
		bne.s   return_6335C
		lea     cs_6335E(pc), a0
		trap    #6
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		move.w  #$80,d0 
		jsr     GetEntityPortraitAndSpeechSfx
		move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
		move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
		trap    #TEXTBOX
		dc.w $FAC               ; "{LEADER}, please kiss{N}her.{W1}"
		trap    #SET_FLAG
		dc.w $3D8
return_6335C:
		rts

	; End of function sub_63330

cs_6335E:       setEntityDir $80,$3     ; 0023 SET ENTITY FACING 80 3
		csc_end                 ; END OF CUTSCENE SCRIPT
