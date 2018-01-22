
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
		setActscript $80,$FF,eas_Init
		csWait 30
		setQuake 0
		nextText $80,$82        ; "No more excuses!{W2}"
		nextSingleText $80,$82  ; "This is your last chance.{N}Kill {LEADER} this time,{N}or I'll kill you!{W1}"
		setActscript $80,$FF,eas_46172
		customActscript $80,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$3,$1
		endMove $8080
		entityShiver $80
		nextSingleText $0,$80   ; "Ah...yes, sir.  I'll kill{N}{LEADER} this time.{N}I stake my life on it.{W1}"
		nextSingleText $80,$82  ; "Bring the Jewel of Evil back{N}to me!{W1}"
		nextSingleText $0,$80   ; "Yes, sir!{W1}"
		setFacing $80,DOWN
		csWait 40
		setActscript $80,$0,eas_RotateRightHighSpeed
		csWait 40
		animEntityFadeInOut $80,$6
		setPos $80,63,63,DOWN
		csWait 150
		setPriority $83,$FFFF
		setPriority $81,$0
		setActscript $83,$0,eas_Transparent
		setPos $83,13,12,DOWN
		csWait 50
		setPos $81,13,12,UP
		animEntityFadeInOut $81,$7
		csWait 50
		hideEntity $83
		csWait 40
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$1,$2
		endMove $8080
		entityNod $81
		csWait 50
		nextSingleText $80,$82  ; "You were right, Odd Eye.{W1}"
		moveEntity $81,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$81   ; "Of course.{W1}"
		nextText $80,$82        ; "I can't trust Geshp anymore.{W2}"
		nextSingleText $80,$82  ; "If he fails, you must battle{N}{LEADER}.{W1}"
		entityShiver $81
		nextText $0,$81         ; "You want me to kill{N}{LEADER}?{W2}"
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait 20
		moveEntity $81,$FF,$3,$1
		endMove $8080
		csWait 30
		nextText $0,$81         ; "He's probably much stronger{N}now.{N}Hmmm, sounds interesting.{W2}"
		setActscript $81,$FF,eas_Init
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
		setActscript $1A,$FF,eas_Init
		moveEntityNextToPlayer $1A,$0
		setFacing $0,RIGHT
		csWait 20
		nextSingleText $0,$1A   ; "Sorry, {LEADER}.{N}I'm going back to Roft.{N}I'm worried about Petro.{W1}"
		csWait 30
		moveEntity $1A,$FF,$1,$4
		endMove $8080
		setFacing $0,UP
		setFacing $7,UP
		setFacing $1F,UP
		setFacing $1A,DOWN
		csWait 30
		entityNod $1A
		csWait 20
		moveEntity $1A,$FF,$1,$4
		endMove $8080
		hideEntity $1A
		csc_end
