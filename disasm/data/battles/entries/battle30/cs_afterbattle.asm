
; ASM FILE data\battles\entries\battle30\cs_afterbattle.asm :
; 0x4C6A8..0x4C994 : Cutscene after battle 30
abcs_battle30:  textCursor $ACD
		loadMapFadeIn $1,$5,$8
		loadMapEntities ce_4C96C
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$C,$D,$1
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$B,$D,$1
		stopEntity $80
		setActscript $82,$FF,eas_46172
		stopEntity $82
		setPriority $7,$0
		setPriority $1F,$FFFF
		fadeInB
		entityShiver $80
		nextSingleText $0,$80   ; "Grrr...impossible!{N}Why...do I have to die?{W1}"
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$1F   ; "Where is Mitula?{W1}"
		entityShiver $80
		nextSingleText $0,$80   ; "I don't know...haven't{N}seen her.{W1}"
		csWait $28
		setFacing $80,$1
		customActscript $80,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setQuake $2
		csWait $14
		setQuake $0
		entityPosDir $82,$B,$A,$1
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setEntityDest $82,$9,$B
		nextSingleText $0,$80   ; "Oops!  The Ground Orb....{W1}"
		entityFlashWhite $82,$3C
		mapFadeOutToWhite
		csWait $14
		mapFadeInFromWhite
		setFacing $80,$3
		entityShiver $80
		nextSingleText $0,$80   ; "I can't endure the light....{N}Ohhh....{W1}"
		customActscript $80,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $0
		dc.w 0
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $80,$FF,eas_Die
		csWait $3C
		nextText $0,$1F         ; "Thanks to the Ground Orb, we{N}finally defeated Zalbard.{W2}"
		nextSingleText $0,$1F   ; "The orb released holy power{N}in it's light.{W1}"
		entityFlashWhite $82,$3C
		setActscript $7,$FF,eas_Jump
		moveEntity $7,$FF,$1,$2
		endMove $8080
		nextSingleText $0,$7    ; "Hey, look over there!{W1}"
		setCamDest $5,$0
		entityPosDir $81,$B,$3,$3
		entityFlashWhite $81,$3C
		nextSingleText $0,$81   ; "Welcome!{W1}"
		setCameraEntity $81
		moveEntity $81,$FF,$3,$4
		moreMove $2,$2
		moreMove $3,$4
		endMove $8080
		setFacing $0,$2
		setFacing $1F,$2
		setFacing $7,$2
		csWait $32
		entityFlashWhite $81,$3C
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
		dc.b $38
		dc.b $38
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		cameraSpeed $38
		setCameraEntity $82
		setEntityDest $82,$B,$2
		animEntityFadeInOut $82,$4
		setCamDest $5,$8
		setFacing $81,$0
		nextText $C0,$81        ; "Thank you.{W2}"
		nextSingleText $C0,$81  ; "I've finally returned to this{N}world.{W1}"
		nextSingleText $0,$1F   ; "Goddess Mitula?{W1}"
		nextSingleText $C0,$81  ; "Oh, nice to meet you,{N}Sir Astral.{W1}"
		setActscript $1F,$FF,eas_Jump
		nextText $0,$1F         ; "Oh, you know my name?{N}Gee....{W2}"
		nextSingleText $0,$1F   ; "Please tell us, what should{N}we do now?{W1}"
		nextSingleText $C0,$81  ; "I don't know.{W1}"
		setActscript $7,$FF,eas_Jump
		nextText $0,$7          ; "What?!{W2}"
		nextSingleText $0,$7    ; "But, why?  You're a goddess.{N}You know our future, right?{W1}"
		nextSingleText $C0,$81  ; "I'm not Volcanon.  I never{N}tell people the future, even{N}if it could prevent death.{W1}"
		entityShiver $1F
		nextSingleText $0,$1F   ; "Death?!  Not ours I hope.{W1}"
		nextText $C0,$81        ; "Zeon is an unimaginably{N}strong devil.{W2}"
		nextSingleText $C0,$81  ; "If he attains full power,{N}I, even Volcanon, would not{N}be able to stop him.{W1}"
		moveEntity $7,$FF,$2,$1
		endMove $8080
		nextSingleText $0,$7    ; "So, we have to defeat him{N}before he revives completely.{W1}"
		nextSingleText $C0,$81  ; "His power is sealed in the{N}Jewel of Evil.{W1}"
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   ; "So, that's why he wants the{N}jewel!{W1}"
		nextSingleText $0,$7    ; "Then, why don't we keep the{N}jewel forever.{W1}"
		nextText $C0,$81        ; "Arc Valley is the place where{N}evil power gathers.{W2}"
		nextSingleText $C0,$81  ; "He will recover his power{N}if he stays there long enough.{W1}"
		nextSingleText $0,$1F   ; "Did you say, Arc Valley?{W1}"
		nextText $C0,$81        ; "You call it Ancient Tower{N}or Granseal.{W2}"
		nextSingleText $C0,$81  ; "Granseal is named for the{N}symbol in the tower.{N}It seals the ground.{W1}"
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   ; "I see.{W1}"
		csWait $3C
		setFacing $81,$2
		csWait $28
		entityFlashWhite $81,$32
		setActscript $0,$0,eas_Jump
		setActscript $7,$0,eas_Jump
		setActscript $1F,$FF,eas_Jump
		nextSingleText $0,$1F   ; "Goddess Mitula, where are{N}you going?{W1}"
		nextSingleText $C0,$81  ; "Down to the surface.{N}To save the people.{W1}"
		nextSingleText $0,$1F   ; "Are you going to abandon us,{N}as Volcanon did?{W1}"
		nextText $C0,$81        ; "Well...no.{N}I'll give you a hint.{W2}"
		nextSingleText $C0,$81  ; "Listen to the legends from{N}the storytellers before you{N}go to Grans Island.{W1}"
		entityFlashWhite $81,$1E
		nextText $C0,$81        ; "You can't kill Zeon, but{N}Volcanon and I will help you{N}if you weaken him.{W2}"
		nextText $C0,$81        ; "{LEADER}!{N}You are the chosen one.{N}You have the holy jewel.{W2}"
		nextSingleText $C0,$81  ; "We need your help to reseal{N}Zeon.{N}Find the holy sword.{W1}"
		nextSingleText $0,$1F   ; "Where is it?{N}How can we find it?{W1}"
		nextSingleText $C0,$81  ; "It's on Grans.{N}Your jewel will lead you to...{W1}"
		animEntityFadeInOut $81,$6
		csWait $32
		moveEntity $1F,$FF,$2,$2
		moreMove $1,$1
		endMove $8080
		csWait $5
		setActscript $1F,$0,eas_461E4
		csWait $78
		nextSingleText $0,$1F   ; "Mitula, Mitula!!{W1}"
		moveEntity $7,$FF,$2,$1
		endMove $8080
		csWait $1E
		setFacing $7,$3
		csWait $1E
		setFacing $7,$2
		csWait $1E
		setFacing $7,$3
		csWait $1E
		nextSingleText $0,$7    ; "{LEADER}, Mitula{N}has vanished!{N}What should we do now?{W1}"
		setFacing $1F,$0
		nextSingleText $0,$1F   ; "We have to go to Arc Valley{N}on Grans Island.{W2}"
		setFacing $1F,$3
		nextSingleText $0,$1F   ; "{LEADER}, find the{N}storytellers first.{W1}"
		setFacing $0,$1
		entityNod $0
		followEntity $1F,$0,$2
		followEntity $7,$1F,$2
		csc_end
ce_4C96C:       dc.w $A
		dc.w $D
		dc.w 1
		dc.b $C
		dc.b $D
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b $B
		dc.b $A
		dc.b 3
		dc.b $9B
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $D7
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $AC
		dc.l eas_Init           
		dc.w $FFFF
