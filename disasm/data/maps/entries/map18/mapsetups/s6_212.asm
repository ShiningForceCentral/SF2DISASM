
; ASM FILE data\maps\entries\map18\mapsetups\s6_212.asm :
; 0x61298..0x61488 : 

; =============== S U B R O U T I N E =======================================

ms_map18_flag212_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $398
		bne.s   loc_612A8
		lea     cs_612BE(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $398               ; set after the scene with Zeon plays as you leave the Galam Drawbridge area
loc_612A8:
		move.w  #$80,d0 
		jsr     MoveEntityOutOfMap
		move.w  #$82,d0 
		jsr     MoveEntityOutOfMap
		rts

	; End of function ms_map18_flag212_InitFunction

cs_612BE:       textCursor $E61
		mapLoad 59,8,4
		setPos $0,63,63,DOWN
		setPos $7,63,63,DOWN
		setPos $1F,63,63,DOWN
		setPos $1A,63,63,DOWN
		fadeInFromBlackHalf
		nextSingleText $80,$82  ; "{LEADER} defeated Red{N}Baron too?  Is that what{N}you said, Geshp?{W1}"
		entityNod $80
		nextSingleText $0,$80   ; "Yes, sir...I'm sorry.{W1}"
		nextText $80,$82        ; "Once again, my minions have{N}failed me.{W2}"
		nextSingleText $80,$82  ; "Are my soldiers that weak?{W1}"
		entityShiver $80
		setSize $80,$15
		nextText $0,$80         ; "Yes...oh, no!  I mean, they{N}were strong enough.{W2}"
		nextSingleText $0,$80   ; "But {LEADER} and his force{N}were smarter.{W1}"
		playSound SFX_BIG_DOOR_RUMBLE
		setQuake 3
		csWait 30
		setActscriptWait $80,eas_Init
		csWait 30
		setQuake 0
		nextText $80,$82        ; "No more excuses!{W2}"
		nextSingleText $80,$82  ; "This is your last chance.{N}Kill {LEADER} this time,{N}or I'll kill you!{W1}"
		setActscriptWait $80,eas_46172
		customActscriptWait $80
		 ac_setSpeed 8,8        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $80
		 moveDown 1
		endActions
		entityShiver $80
		nextSingleText $0,$80   ; "Ah...yes, sir.  I'll kill{N}{LEADER} this time.{N}I stake my life on it.{W1}"
		nextSingleText $80,$82  ; "Bring the Jewel of Evil back{N}to me!{W1}"
		nextSingleText $0,$80   ; "Yes, sir!{W1}"
		setFacing $80,DOWN
		csWait 40
		setActscript $80,eas_RotateRightHighSpeed
		csWait 40
		animEntityFadeInOut $80,$6
		setPos $80,63,63,DOWN
		csWait 150
		setPriority $83,$FFFF
		setPriority $81,$0
		setActscript $83,eas_Transparent
		setPos $83,13,12,DOWN
		csWait 50
		setPos $81,13,12,UP
		animEntityFadeInOut $81,$7
		csWait 50
		hideEntity $83
		csWait 40
		customActscriptWait $81
		 ac_setSpeed 16,16      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $81
		 moveUp 2
		endActions
		entityNod $81
		csWait 50
		nextSingleText $80,$82  ; "You were right, Odd Eye.{W1}"
		entityActionsWait $81
		 moveUp 1
		endActions
		nextSingleText $0,$81   ; "Of course.{W1}"
		nextText $80,$82        ; "I can't trust Geshp anymore.{W2}"
		nextSingleText $80,$82  ; "If he fails, you must battle{N}{LEADER}.{W1}"
		entityShiver $81
		nextText $0,$81         ; "You want me to kill{N}{LEADER}?{W2}"
		customActscriptWait $81
		 ac_setSpeed 8,8        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		csWait 20
		entityActionsWait $81
		 moveDown 1
		endActions
		csWait 30
		nextText $0,$81         ; "He's probably much stronger{N}now.{N}Hmmm, sounds interesting.{W2}"
		setActscriptWait $81,eas_Init
		setFacing $81,UP
		nextSingleText $0,$81   ; "I'll do it.  If this comes{N}to pass, it will be his final{N}battle.{W1}"
		csWait 30
		executeSubroutine csub_61426
		mapSysEvent $12,$9,$A,$3
		csc_end

; =============== S U B R O U T I N E =======================================

csub_61426:
		lea     (PALETTE_1).l,a0
		lea     (PALETTE_1_BIS).l,a1
		moveq   #$F,d0
loc_61434:
		move.l  (a0)+,(a1)+
		dbf     d0,loc_61434
		rts

	; End of function csub_61426

cs_6143C:       textCursor $36F
		setActscriptWait $1A,eas_Init
		moveEntityNextToPlayer $1A,$0
		setFacing $0,RIGHT
		csWait 20
		nextSingleText $0,$1A   ; "Sorry, {LEADER}.{N}I'm going back to Roft.{N}I'm worried about Petro.{W1}"
		csWait 30
		entityActionsWait $1A
		 moveUp 4
		endActions
		setFacing $0,UP
		setFacing $7,UP
		setFacing $1F,UP
		setFacing $1A,DOWN
		csWait 30
		entityNod $1A
		csWait 20
		entityActionsWait $1A
		 moveUp 4
		endActions
		hideEntity $1A
		csc_end
