
; ASM FILE data\scripting\map\cs_intro4.asm :
; 0x48A78..0x48FE2 : Intro cutscene 4
IntroCutscene4:
		textCursor $1089        
						; Initial text line $1089 : "Somebody bring a light to{N}the King's chamber!{D2}"
		mapLoad $41,$7,$3
		loadMapEntities ce_48FAA
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
		fadeInFromBlackHalf
		csWait $28
		moveEntity $81,$0,$3,$2
		endMove $8080
		playSound SFX_INTRO_LIGHTNING
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait $3C
		textCursor $1089        
						; Initial text line $1089 : "Somebody bring a light to{N}the King's chamber!{D2}"
		nextSingleText $0,$81   
						; "Somebody bring a light to{N}the King's chamber!{D2}"
		csWait $14
		playSound SFX_DEMON_BREATH
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait $1E
		setEntityDir $81,$1
		nextText $80,$80        
						; "Oh...the wind blew out{N}all the candles!{D2}"
		nextSingleText $80,$80  
						; "It's so dark.{N}I can't see a thing.{D2}"
		csWait $1E
		executeSubroutine ApplyStormEffect
		setQuakeAmount $3
		flashScreenWhite $A
		mapFadeOutToWhite
		csWait $14
		playSound SFX_INTRO_LIGHTNING
		csWait $14
		mapFadeInFromWhite
		tintMap
		setQuakeAmount $0
		customActscript $80,$FF
		dc.w $10                
						;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  
						; "What was that?{D2}"
		csWait $5
		setActscript $81,$0,eas_461B6
		csWait $50
		moveEntity $81,$FF,$1,$2
		endMove $8080
		csWait $28
		setActscript $81,$FF,eas_46172
		customActscript $81,$FF
		dc.w $10                
						;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $81,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$81   
						; "Sire, the Ancient Tower...{D2}"
		moveEntity $80,$FF,$3,$1
		moreMove $A,$1
		endMove $8080
		nextSingleText $80,$80  
						; "What's wrong?{D2}"
		setActscript $81,$FF,eas_Init
		setActscript $81,$FF,eas_Jump
		setActscript $81,$FF,eas_Jump
		nextSingleText $0,$81   
						; "It's collapsing!{N}Maybe it was struck by{N}lightning?{D2}"
		moveEntity $80,$FF,$1,$1
		endMove $8080
		nextSingleText $80,$80  
						; "No, not lightning...{D2}"
		csWait $14
		customActscript $80,$FF
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  
						; "To my knowledge, that tower{N}is impervious to any type{N}of disaster.{D2}"
		playSound SFX_DEMON_BREATH
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait $1E
		nextSingleText $0,$82   
						; "Minister!{D2}"
		setEntityDir $81,$2
		setEntityDir $80,$2
		setCamDest $0,$5
		entityPosDir $82,$3,$9,$3
		setCameraEntity $82
		customActscript $82,$FF
		dc.w $10                
						;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $82,$FF,$3,$1
		moreMove $0,$1
		moreMove $7,$3
		moreMove $0,$3
		moreMove $1,$2
		endMove $8080
		setEntityDir $80,$3
		setEntityDir $81,$3
		csWait $14
		entityNod $82
		entityNod $82
		csWait $14
		setActscript $81,$FF,eas_Init
		setCamDest $7,$5
		moveEntity $81,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$81   
						; "What is it?{D2}"
		nextSingleText $0,$82   
						; "The...sealed door...{N}Ancient Tower...{D2}"
		setActscript $80,$FF,eas_Init
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  
						; "Go on.{D2}"
		setActscript $82,$FF,eas_Init
		moveEntity $82,$FF,$0,$2
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$82   
						; "It's open!{D2}"
		setActscript $81,$FF,eas_46172
		customActscript $81,$FF
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $81,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$81   
						; "That's impossible!{N}It can't be opened!{D2}"
		moveEntity $82,$FF,$2,$2
		moreMove $9,$1
		endMove $8080
		nextSingleText $0,$82   
						; "I'm sure it was closed{N}before the lightning, but...{D2}"
		csWait $28
		setEntityDir $81,$0
		setEntityDir $80,$2
		csWait $28
		setEntityDir $81,$3
		setEntityDir $80,$3
		csWait $28
		nextSingleText $0,$81   
						; "Strange.{D2}"
		entityNod $81
		nextSingleText $0,$81   
						; "Sire, I'm going to go and{N}see what happened!{D2}"
		setActscript $81,$FF,eas_Init
		moveEntity $81,$FF,$3,$1
		moreMove $0,$1
		endMove $8080
		setEntityDir $80,$2
		nextSingleText $0,$81   
						; "We must know the truth.{D2}"
		csWait $14
		entityNod $80
		nextSingleText $80,$80  
						; "Be careful.{D2}"
		moveEntity $81,$FF,$2,$1
		moreMove $3,$1
		endMove $8080
		nextSingleText $0,$81   
						; "Take me to the sealed door.{D2}"
		entityNod $82
		setCameraEntity $82
		moveEntity $82,$0,$3,$2
		moreMove $2,$3
		moreMove $5,$3
		moreMove $2,$1
		moreMove $1,$1
		endMove $8080
		moveEntity $81,$FF,$3,$3
		moreMove $2,$3
		moreMove $5,$3
		moreMove $2,$1
		moreMove $1,$1
		endMove $8080
		hideEntity $82
		hideEntity $81
		setCameraEntity $FFFF
		csWait $1E
		setCamDest $7,$5
		setCameraEntity $80
		playSound SFX_DEMON_BREATH
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait $1E
		setEntityDir $80,$3
		csWait $1E
		nextSingleText $80,$80  
						; "Strange, strange indeed!{D2}"
		customActscript $80,$FF
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$1,$2
		endMove $8080
		csWait $14
		nextSingleText $80,$80  
						; "Lightning at the Ancient{N}Tower.{D2}"
		setEntityDir $80,$3
		csWait $1E
		setEntityDir $80,$2
		csWait $1E
		setEntityDir $80,$0
		csWait $1E
		setEntityDir $80,$3
		csWait $1E
		nextSingleText $80,$80  
						; "Huh?{N}Did I hear something?{D2}"
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  
						; "A sealed door that is open.{N}An unusual storm.{N}Everything is so strange.{D2}"
		csWait $5
		setActscript $80,$0,eas_461B6
		csWait $3C
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  
						; "What?  I feel as if someone{N}is watching me.{N}It must be my nerves.{D2}"
		setEntityDir $80,$1
		playSound SFX_INTRO_LIGHTNING
		entityPosDir $84,$9,$B,$1
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		entityPosDir $84,$3F,$3F,$1
		csWait $3C
		nextSingleText $80,$80  
						; "I guess it was nothing.{N}I have to get a hold of{N}myself.{D2}"
		entityShakeHead $80
		customActscript $80,$FF
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $80,$FF,$1,$1
		endMove $8080
		playSound SFX_INTRO_LIGHTNING
		entityPosDir $84,$9,$B,$1
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		entityPosDir $84,$3F,$3F,$1
		csWait $3C
		setEntityDir $80,$3
		csWait $1E
		nextSingleText $80,$80  
						; "What was that?{N}Who's there?!{D2}"
		setActscript $80,$FF,eas_46172
		moveEntity $80,$FF,$1,$1
		endMove $8080
		playSound SFX_INTRO_LIGHTNING
		entityPosDir $84,$9,$B,$1
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		entityPosDir $84,$3F,$3F,$1
		csWait $3C
		nextSingleText $80,$80  
						; "It's not my imagination!{N}Somebody's in this room!{D2}"
		csWait $5
		setActscript $80,$0,eas_461B6
		csWait $50
		playSound SFX_INTRO_LIGHTNING
		entityPosDir $84,$9,$B,$1
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		entityPosDir $84,$3F,$3F,$1
		csWait $3C
		setEntityDir $80,$1
		entityPosDir $83,$9,$2,$3
		setCamDest $7,$1
		csWait $1E
		setActscript $80,$FF,eas_Init
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		nextSingleText $80,$80  
						; "Hey!{D2}"
		customActscript $80,$FF
		dc.w $10                
						;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $80,$FF,eas_46172
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $80,$80  
						; "Stay away from me!{D2}"
		setActscript $83,$FF,eas_Init2
		setActscript $83,$FF,eas_46172
		stopEntity $83
		moveEntity $83,$FF,$0,$1
		moreMove $3,$1
		moreMove $0,$1
		moreMove $3,$1
		endMove $8080
		moveEntity $83,$FF,$0,$1
		moreMove $3,$1
		endMove $8080
		startEntity $83
		setCameraEntity $80
		entityShiver $83
		csWait $1E
		entityShiver $83
		entityShiver $83
		csWait $14
		moveEntity $80,$FF,$3,$1
		endMove $8080
		csWait $5
		setActscript $80,$0,eas_461E4
		csWait $1E
		nextSingleText $80,$80  
						; "Somebody...HELP!{D2}"
		setEntityDir $80,$1
		entityShiver $83
		csWait $1E
		entityShiver $83
		customActscript $85,$FF
		dc.w $10                
						;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		entityPosDir $85,$C,$5,$3
		moveEntity $85,$0,$3,$4
		endMove $8080
		entityFlashWhite $85,$50
		waitIdle $85
		setActscript $80,$0,eas_RotateRightHighSpeed
		entityFlashWhite $85,$28
		nextSingleText $80,$80  
						; "Aughhhh!!!{D2}"
		hideEntity $85
		csWait $1E
		setActscript $80,$0,eas_RotateRight
		csWait $32
		moveEntity $80,$FF,$B,$1
		moreMove $3,$1
		endMove $8080
		setEntityDir $80,$1
		customActscript $80,$FF
		dc.w $14                
						;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                
						;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 
						;   000A UPDATE SPRITE
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		nextSingleText $80,$80  
						; "(Sigh)....{D2}"
		entityShiver $83
		csWait $1E
		playSound SFX_INTRO_LIGHTNING
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		executeSubroutine ApplyStormEffect
		csWait $28
		entityShiver $83
		csWait $28
		fadeOutToBlackHalf
		csc_end                 
						; END OF CUTSCENE SCRIPT
ce_48FAA:
		dc.w $3F
		dc.w $3F
		dc.w 1
		dc.b $C
		dc.b 6
		dc.b 3
		dc.b $CB
		dc.l eas_Init           
		dc.b $A
		dc.b 7
		dc.b 3
		dc.b $CD
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $CE
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $9F
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $BB
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $B7
		dc.l eas_Init           
		dc.w $FFFF
