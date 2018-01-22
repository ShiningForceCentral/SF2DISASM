
; ASM FILE data\battles\entries\battle40\cs_afterbattle.asm :
; 0x4EA94..0x4ED0E : Cutscene after battle 40
abcs_battle40:  textCursor $BF9
		loadMapFadeIn 54,10,4
		loadMapEntities ce_4ECD6
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setPos $7,13,8,RIGHT
		setActscript $1F,$FF,eas_Init
		setPos $1F,15,6,DOWN
		setActscript $1C,$FF,eas_Init
		setPos $1C,17,8,LEFT
		jumpIfFlagClear $4C,cs_4EAEE; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setPos $1A,63,62,DOWN
cs_4EAEE:       setBlocks 11,6,11,29,44,0
		setBlocks 0,52,10,7,13,10
		customActscript $83,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		stopEntity $83
		setActscript $80,$FF,eas_46172
		setActscript $81,$FF,eas_46172
		setActscript $82,$FF,eas_46172
		setActscript $80,$0,eas_AnimSpeedx2
		setActscript $81,$0,eas_AnimSpeedx2
		setActscript $82,$0,eas_AnimSpeedx2
		playSound MUSIC_SAD_THEME_1
		fadeInB
		csWait 60
		nextText $0,$83         ; "{LEADER}, you won?{N}You've become so strong.{W2}"
		nextSingleText $0,$83   ; "I knew you would....{W1}"
		nextSingleText $C0,$0   ; "Oh, really?{W1}"
		nextText $0,$83         ; "Your friends are very good.{N}I knew that when I was{N}traveling with you.{W2}"
		nextSingleText $0,$83   ; "Yes, it was interesting...{N}I miss that time....{W1}"
		setActscript $7,$FF,eas_Jump
		nextSingleText $C0,$7   ; "Odd Eye...no, Oddler!{N}Did you...?{W1}"
		nextSingleText $0,$83   ; "No, {NAME;7}.  I did my{N}best.  You were just better{N}than me.{W1}"
		nextSingleText $C0,$0   ; "We had to be.{W1}"
		nextText $0,$83         ; "I wouldn't have had to{N}fight if I never had gotten{N}my memory back.{W2}"
		nextSingleText $0,$83   ; "It's funny, fighting was{N}everything to me.{W1}"
		entityShiver $7
		nextSingleText $C0,$7   ; "Oddler, please don't die!{W1}"
		nextText $0,$83         ; "Thank you, {NAME;7}.{N}I learned a lot from you.{W2}"
		nextSingleText $0,$83   ; "Oh, the pain!{N}Let me say good-bye.{W1}"
		moveEntity $0,$0,$1,$1
		endMove $8080
		moveEntity $7,$FF,$0,$1
		endMove $8080
		nextSingleText $0,$83   ; "If possible, I want to{N}relive my life...not as{N}a devil...next time....{W1}"
		entityFlashWhite $83,$1E
		setPos $80,15,8,DOWN
		moveEntity $80,$0,$0,$2
		endMove $8080
		csWait 8
		setPos $81,15,8,DOWN
		moveEntity $81,$0,$7,$2
		endMove $8080
		csWait 8
		setPos $82,15,8,DOWN
		moveEntity $82,$0,$3,$2
		endMove $8080
		csWait 8
		setPos $80,15,8,DOWN
		moveEntity $80,$0,$7,$2
		endMove $8080
		csWait 8
		setPos $81,15,8,DOWN
		moveEntity $81,$0,$0,$2
		endMove $8080
		csWait 8
		setPos $82,15,8,DOWN
		moveEntity $82,$0,$7,$2
		endMove $8080
		csWait 8
		setPos $80,15,8,DOWN
		moveEntity $80,$0,$3,$2
		endMove $8080
		csWait 8
		setPos $81,15,8,DOWN
		moveEntity $81,$0,$7,$2
		endMove $8080
		csWait 8
		setPos $82,15,8,DOWN
		moveEntity $82,$0,$0,$2
		endMove $8080
		csWait 8
		hideEntity $80
		csWait 8
		hideEntity $81
		csWait 8
		hideEntity $82
		entityFlashWhite $83,$78
		hideEntity $83
		playSound $FD
		csWait 120
		playSound MUSIC_SAD_THEME_3
		entityShiver $7
		setFacing $7,UP
		nextSingleText $0,$7    ; "(Sob, sob)...how sad.{N}{LEADER}, Sir Astral...{W1}"
		setFacing $1C,DOWN
		nextSingleText $0,$1C   ; "Oddler had a pure spirit...{N}I'll miss him.{W1}"
		setFacing $1F,UP
		nextSingleText $0,$1F   ; "Don't cry for him now.{N}This is Zeon's doing.{W1}"
		setFacing $1F,DOWN
		nextSingleText $0,$1F   ; "We shall go onward and{N}remember Oddler in our{N}hearts.{W1}"
		moveEntity $1C,$FF,$2,$1
		moreMove $3,$1
		endMove $8080
		setFacing $1C,LEFT
		moveEntity $1F,$FF,$3,$2
		endMove $8080
		moveEntity $7,$FF,$3,$1
		endMove $8080
		setFacing $7,RIGHT
		csWait 40
		setFacing $0,RIGHT
		csWait 40
		setFacing $0,LEFT
		csWait 40
		setFacing $0,UP
		csWait 30
		entityNod $0
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $1C,$1F,$2
		csc_end
ce_4ECD6:       dc.w $F
		dc.w $A
		dc.w 1
		dc.b $D
		dc.b 8
		dc.b 0
		dc.b 7
		dc.l eas_Init           
		dc.b $11
		dc.b 8
		dc.b 2
		dc.b $1C
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $AD
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $AD
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $AD
		dc.l eas_Init           
		dc.b $F
		dc.b 8
		dc.b 3
		dc.b $A0
		dc.l eas_Init           
		dc.w $FFFF
