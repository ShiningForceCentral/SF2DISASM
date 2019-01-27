
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
		 
		sndCom SOUND_COMMAND_FADE_OUT
		lea     cs_632EA(pc), a0
		trap    #6
		clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
		txt $FAE                ; "The Princess is asleep.{N}Will you kiss her?"
		jsr     j_YesNoPrompt
		tst.w   d0
		bne.s   byte_632E0
		lea     cs_EndKiss(pc), a0
		trap    #MAPSCRIPT
		jsr     PlayEndCredits
		moveq   #$FFFFFFFF,d0
		jsr     PlayIntroOrEndCutscene
		jmp     (WitchEnd).w
byte_632E0:
		sndCom SOUND_COMMAND_INIT_DRIVER
		sndCom MUSIC_TOWN
		rts

	; End of function sub_632AC

cs_632EA:       setActscriptWait $0,eas_Init
		csWait 1
		shiver $0
		csc_end

; =============== S U B R O U T I N E =======================================

sub_632FA:
		 
		chkFlg $3D6
		beq.s   return_6332E
		chkFlg $3D7
		bne.s   return_6332E
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		move.w  #$80,d0 
		jsr     GetEntityPortraitAndSpeechSfx
		move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
		move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
		txt $FA9                ; "Oh, {LEADER}!{N}I really respect you.{W2}"
		txt $FAA                ; "You shouldered quite a{N}burden for the kingdom.{W2}"
		txt $FAB                ; "I'll be happy if you rule{N}this kingdom with Princess{N}Elis!{W1}"
		setFlg $3D7
return_6332E:
		rts

	; End of function sub_632FA


; =============== S U B R O U T I N E =======================================

sub_63330:
		 
		chkFlg $3D8
		bne.s   return_6335C
		lea     cs_6335E(pc), a0
		trap    #6
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		move.w  #$80,d0 
		jsr     GetEntityPortraitAndSpeechSfx
		move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
		move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
		txt $FAC                ; "{LEADER}, please kiss{N}her.{W1}"
		setFlg $3D8
return_6335C:
		rts

	; End of function sub_63330

cs_6335E:       setFacing $80,DOWN
		csc_end
