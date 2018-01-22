
; ASM FILE data\battles\entries\battle32\cs_afterbattle.asm :
; 0x4CDB4..0x4CF0C : Cutscene after battle 32
abcs_battle32:  textCursor $B25
		loadMapFadeIn $4A,$5,$14
		loadMapEntities ce_4CEEC
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		entityPosDir $7,$B,$19,$1
		setActscript $1F,$FF,eas_Init
		entityPosDir $1F,$9,$19,$1
		setActscript $16,$FF,eas_Init
		entityPosDir $16,$B,$1A,$1
		setActscript $1E,$FF,eas_Init
		entityPosDir $1E,$A,$1A,$1
		setActscript $17,$FF,eas_Init
		entityPosDir $17,$A,$16,$3
		fadeInB
		moveEntity $7,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$7    ; "I can't believe it!{N}You might have been killed{N}by the devils.{W1}"
		nextSingleText $0,$1F   ; "Indeed!  Why did you{N}change your mind?{W1}"
		moveEntity $17,$FF,$3,$1
		endMove $8080
		nextText $C0,$17        ; "I'm {NAME;23}, from Galam.{N}I was waiting for the chance{N}to escape from them.{W2}"
		nextSingleText $C0,$17  ; "I can't stand their wicked{N}ways!{W1}"
		moveEntity $7,$FF,$1,$1
		endMove $8080
		setFacing $7,$2
		setFacing $17,$0
		nextSingleText $0,$7    ; "You have the same opinion{N}of them as we do.{W1}"
		nextSingleText $C0,$17  ; "Please let me join you!{N}I could be a great help to{N}you.{W2}"
		setFacing $17,$3
		nextSingleText $C0,$17  ; "You need a professional{N}soldier like me.{W1}"
		nextSingleText $0,$1F   ; "Oh, we welcome you.{W1}"
		setActscript $7,$FF,eas_46172
		moveEntity $7,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$7    ; "But, he was on the other{N}side just an minute ago.{W1}"
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		setFacing $1F,$0
		nextSingleText $0,$1F   ; "I don't care, {NAME;7}.{N}He has seen the error of his{N}ways.{W1}"
		setFacing $1F,$3
		nextSingleText $0,$1F   ; "{LEADER}, don't you want{N}{NAME;23} to join our{N}force?{W1}"
		entityNod $0
		join $17
		csc54 $17,$0            ; 0054 UNKNOWN
		moveEntity $17,$FF,$3,$1
		endMove $8080
		nextSingleText $C0,$17  ; "Oh, thank you!{W2}"
		setActscript $17,$FF,eas_Jump
		setActscript $17,$FF,eas_Jump
		nextSingleText $C0,$17  ; "I'll try to do my best!{W1}"
		executeSubroutine csub_4CEE4
		followEntity $1E,$0,$2
		followEntity $7,$1E,$1
		followEntity $1F,$1E,$3
		followEntity $16,$1E,$2
		followEntity $17,$16,$2
		csc_end

; =============== S U B R O U T I N E =======================================

csub_4CEE4:
		moveq   #$17,d0
		jmp     j_LeaveBattleParty

	; End of function csub_4CEE4

ce_4CEEC:       dc.w $A
		dc.w $19
		dc.w 1
		dc.b $B
		dc.b $19
		dc.b 1
		dc.b 7
		dc.l eas_Init           
		dc.b $B
		dc.b $1A
		dc.b 1
		dc.b $16
		dc.l eas_Init           
		dc.b $A
		dc.b $16
		dc.b 3
		dc.b $17
		dc.l eas_Init           
		dc.w $FFFF
