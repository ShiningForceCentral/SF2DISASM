
; ASM FILE data\maps\entries\map59\mapsetups\s6.asm :
; 0x5EAD8..0x5F34C : 

; =============== S U B R O U T I N E =======================================

ms_map59_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $3E7
		bne.s   loc_5EB18
		lea     cs_5EB44(pc), a0
		trap    #6
		lea     cs_5EBFC(pc), a0
		trap    #6
		lea     cs_5ED06(pc), a0
		trap    #6
		lea     cs_5EDB8(pc), a0
		trap    #6
		lea     cs_5EF60(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $3E7               
						; set after the Nazca ship shootdown scene
		move.b  #$2D,((EGRESS_MAP_INDEX-$1000000)).w 
		trap    #SET_FLAG
		dc.w $1B4               
						; Battle 36 unlocked
		trap    #SET_FLAG
		dc.w $1B8               
						; Battle 40 unlocked
		trap    #SET_FLAG
		dc.w $1BA               
						; Battle 42 unlocked
		trap    #SET_FLAG
		dc.w $1BB               
						; Battle 43 unlocked
		rts
loc_5EB18:
		
		trap    #CHECK_FLAG
		dc.w $1BB
		beq.s   return_5EB24
		lea     cs_5EB26(pc), a0
		trap    #6
return_5EB24:
		
		rts

	; End of function ms_map59_InitFunction

cs_5EB26:
		executeSubroutine csub_5EB34
						; 000A EXECUTE SUBROUTINE 5EB34
		mapSysEvent $3B0D2201   
						; 0007 EXECUTE MAP SYSTEM EVENT 3B0D2201
		csc_end                 
						; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

csub_5EB34:
		
		lea     (PALETTE_1_BIS).l,a0
		moveq   #$1F,d7
loc_5EB3C:
		
		clr.l   (a0)+
		dbf     d7,loc_5EB3C
		rts

	; End of function csub_5EB34

cs_5EB44:
		textCursor $E73         
						; Initial text line $E73 : "{LEADER} is almost here{N}already?{W1}"
		setCameraEntity $FFFF   
						; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		csc46 $8,$2             
						; 0046 UNKNOWN
		loadMapEntities ce_5F19E
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		csWait $3C              
						; WAIT 3C
		playSound MUSIC_WITCH   
						; 0005 PLAY SOUND MUSIC_WITCH
		csWait $1E              
						; WAIT 1E
		setActscript $80,$0,eas_Transparent
						; 0015 SET ACTSCRIPT 80 0 45FA8
		fadeInFromBlackHalf     
						; 004A FADE IN FROM BLACK HALF
		nextSingleText $0,$80   
						; "{LEADER} is almost here{N}already?{W1}"
		nextSingleText $80,$81  
						; "Yes, sir.  With an ancient{N}aircraft.  He'll be passing{N}over the cape soon.{W1}"
		nextSingleText $0,$80   
						; "Good.  I'll do anything to{N}get my powers back.{W1}"
		nextText $80,$81        
						; "They're stronger than we{N}thought.{W2}"
		nextSingleText $80,$81  
						; "But, I have an idea.  Please{N}let me try it.{W1}"
		nextSingleText $0,$80   
						; "Well?{W1}"
		nextText $80,$81        
						; "I think it's better for us{N}to shoot them down over the{N}"
		nextSingleText $80,$81  
						; "cape.{W1}"
		nextSingleText $0,$80   
						; "I agree.{W1}"
		nextText $80,$81        
						; "Thank you.  Then... may I{W2}"
		nextSingleText $80,$81  
						; "borrow Odd Eye?{W1}"
		nextText $0,$80         
						; "He's still damaged from his{N}battle against Volcanon.{W2}"
		nextSingleText $0,$80   
						; "Take Red Baron instead.{W1}"
		entityShiver $81        
						; 002A MAKE ENTITY SHIVER 81
		entityShiver $81        
						; 002A MAKE ENTITY SHIVER 81
		nextSingleText $80,$81  
						; "Thank you, sir.{W1}"
		nextSingleText $0,$80   
						; "They'll be passing over the{N}cape soon.  Go!{W1}"
		nextSingleText $80,$81  
						; "Yes, sir!{W1}"
		animEntityFadeInOut $81,$6
						; 0022 ANIMATE ENTITY FADE INOUT 81
		nextSingleText $0,$82   
						; "That Geshp!  He wants{N}everything.{W1}"
		entityPosDir $82,$9,$9,$3
						; 0019 SET ENTITY POS AND FACING 82 9 9 3
		animEntityFadeInOut $82,$7
						; 0022 ANIMATE ENTITY FADE INOUT 82
		moveEntity $82,$FF,$0,$4
						; 002D MOVE ENTITY 82 FF 0 4
		moreMove $1,$1
		endMove $8080
		nextSingleText $0,$80   
						; "You noticed that too?{W1}"
		entityNod $82           
						; 0026 MAKE ENTITY NOD 82
		nextText $0,$82         
						; "Yes, King Zeon.{W2}"
		nextSingleText $0,$82   
						; "I'm afraid Geshp can't stop{N}{LEADER}'s advance.{W1}"
		nextSingleText $0,$80   
						; "You really think so?{W1}"
		nextText $0,$82         
						; "I was just thinking of{N}{LEADER}'s hidden powers.{W2}"
		nextSingleText $0,$82   
						; "We must never underestimate{N}him.{W1}"
		nextSingleText $0,$80   
						; "Anyway, it will be a{N}fantastic show!  Ha, ha!{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5EBFC:
		loadMapFadeIn $35,$8,$E 
						; 0037 LOAD MAP AND FADE IN 35 8 E
		textCursor $E8B         
						; Initial text line $E8B : "Finish the preparations{N}before the Nazca Ship flies{N}over the cape!{W1}"
		loadMapEntities ce_5F1DE
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		stopEntity $82          
						; 001C STOP ENTITY ANIM 82
		stopEntity $83          
						; 001C STOP ENTITY ANIM 83
		stopEntity $84          
						; 001C STOP ENTITY ANIM 84
		stopEntity $85          
						; 001C STOP ENTITY ANIM 85
		playSound MUSIC_BATTLE_THEME_1
						; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		setActscript $82,$FF,eas_Init
						; 0015 SET ACTSCRIPT 82 FF 460CE
		setActscript $86,$FF,eas_Init
						; 0015 SET ACTSCRIPT 86 FF 460CE
		setActscript $87,$FF,eas_Init
						; 0015 SET ACTSCRIPT 87 FF 460CE
		setActscript $88,$FF,eas_Init
						; 0015 SET ACTSCRIPT 88 FF 460CE
		customActscript $82,$FF 
						; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $10                
						;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $86,$FF 
						; 0014 SET MANUAL ACTSCRIPT 86
		dc.w $10                
						;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $87,$FF 
						; 0014 SET MANUAL ACTSCRIPT 87
		dc.w $10                
						;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $88,$FF 
						; 0014 SET MANUAL ACTSCRIPT 88
		dc.w $10                
						;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $82,$0,$0,$3 
						; 002D MOVE ENTITY 82 0 0 3
		endMove $8080
		moveEntity $86,$0,$0,$3 
						; 002D MOVE ENTITY 86 0 0 3
		endMove $8080
		moveEntity $87,$0,$0,$3 
						; 002D MOVE ENTITY 87 0 0 3
		endMove $8080
		moveEntity $88,$0,$0,$3 
						; 002D MOVE ENTITY 88 0 0 3
		endMove $8080
		setEntityDir $80,$2     
						; 0023 SET ENTITY FACING 80 2
		csWait $1E              
						; WAIT 1E
		setEntityDir $80,$0     
						; 0023 SET ENTITY FACING 80 0
		csWait $1E              
						; WAIT 1E
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		nextSingleText $0,$80   
						; "Finish the preparations{N}before the Nazca Ship flies{N}over the cape!{W1}"
		setCamDest $A,$E        
						; 0032 SET CAMERA DEST A E
		entityPosDir $81,$F,$10,$3
						; 0019 SET ENTITY POS AND FACING 81 F 10 3
		animEntityFadeInOut $81,$7
						; 0022 ANIMATE ENTITY FADE INOUT 81
		nextSingleText $80,$81  
						; "How are the Prism Flowers?{W1}"
		nextSingleText $0,$80   
						; "They're ready!{W1}"
		nextSingleText $80,$81  
						; "Excellent!{W1}"
		entityNod $81           
						; 0026 MAKE ENTITY NOD 81
		setCameraEntity $81     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 81
		moveEntity $81,$FF,$0,$2
						; 002D MOVE ENTITY 81 FF 0 2
		moreMove $1,$2
		endMove $8080
		setEntityDir $81,$0     
						; 0023 SET ENTITY FACING 81 0
		nextText $80,$81        
						; "Now, c'mon Granseal losers!{W2}"
		nextSingleText $80,$81  
						; "The Prism Flowers are waiting{N}for you!  Hee, heee!{W1}"
		entityNod $81           
						; 0026 MAKE ENTITY NOD 81
		entityNod $81           
						; 0026 MAKE ENTITY NOD 81
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5ED06:
		textCursor $E91         
						; Initial text line $E91 : "There's Grans Island!{W1}"
		loadMapFadeIn $49,$0,$0 
						; 0037 LOAD MAP AND FADE IN 49 0 0
		loadMapEntities ce_5F1BE
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		executeSubroutine sub_5F31E
						; 000A EXECUTE SUBROUTINE 5F31E
		playSound MUSIC_MITULA_SHRINE
						; 0005 PLAY SOUND MUSIC_MITULA_SHRINE
		setBlocks $A,$160A,$2A0A
						; 0034 SET BLOCKS A 160A 2A0A
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		executeSubroutine sub_5FD92
						; 000A EXECUTE SUBROUTINE 5FD92
		nextSingleText $80,$1A  
						; "There's Grans Island!{W1}"
		nextSingleText $80,$7   
						; "Alright!{W1}"
		nextSingleText $0,$1F   
						; "We've finally come home.{W1}"
		loadMapFadeIn $35,$A,$D 
						; 0037 LOAD MAP AND FADE IN 35 A D
		loadMapEntities ce_5F23E
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		playSound MUSIC_BATTLE_THEME_1
						; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
		stopEntity $80          
						; 001C STOP ENTITY ANIM 80
		stopEntity $82          
						; 001C STOP ENTITY ANIM 82
		stopEntity $83          
						; 001C STOP ENTITY ANIM 83
		stopEntity $84          
						; 001C STOP ENTITY ANIM 84
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		nextSingleText $80,$81  
						; "I see the Nazca Ship!{N}Everybody, get ready!{W1}"
		loadMapFadeIn $49,$0,$0 
						; 0037 LOAD MAP AND FADE IN 49 0 0
		loadMapEntities ce_5F1BE
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		executeSubroutine sub_5F31E
						; 000A EXECUTE SUBROUTINE 5F31E
		playSound MUSIC_MITULA_SHRINE
						; 0005 PLAY SOUND MUSIC_MITULA_SHRINE
		setBlocks $A,$160A,$2A0A
						; 0034 SET BLOCKS A 160A 2A0A
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		executeSubroutine sub_5FD92
						; 000A EXECUTE SUBROUTINE 5FD92
		nextSingleText $0,$1F   
						; "What's that?  I saw a flash{N}of light over there.{W1}"
		nextSingleText $80,$7   
						; "I didn't see it.  You must be{N}seeing things because you're{N}so old!  Ha, ha!{W1}"
		nextText $0,$1F         
						; "(Grumble)....{W2}"
		nextSingleText $0,$1F   
						; "Someday, {NAME;7}....{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_5EDB8:
		textCursor $E99         
						; Initial text line $E99 : "NOW!{W1}"
		loadMapFadeIn $35,$A,$D 
						; 0037 LOAD MAP AND FADE IN 35 A D
		loadMapEntities ce_5F28E
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		playSound MUSIC_ENEMY_ATTACK
						; 0005 PLAY SOUND MUSIC_ENEMY_ATTACK
		setActscript $85,$0,eas_5EF46
						; 0015 SET ACTSCRIPT 85 0 5EF46
		setActscript $86,$0,eas_5EF46
						; 0015 SET ACTSCRIPT 86 0 5EF46
		setActscript $87,$0,eas_5EF46
						; 0015 SET ACTSCRIPT 87 0 5EF46
		setActscript $88,$0,eas_5EF46
						; 0015 SET ACTSCRIPT 88 0 5EF46
		setActscript $89,$0,eas_5EF46
						; 0015 SET ACTSCRIPT 89 0 5EF46
		setActscript $8A,$0,eas_5EF46
						; 0015 SET ACTSCRIPT 8A 0 5EF46
		setActscript $8B,$0,eas_5EF46
						; 0015 SET ACTSCRIPT 8B 0 5EF46
		setActscript $8C,$0,eas_5EF46
						; 0015 SET ACTSCRIPT 8C 0 5EF46
		stopEntity $8D          
						; 001C STOP ENTITY ANIM 8D
		stopEntity $8E          
						; 001C STOP ENTITY ANIM 8E
		stopEntity $8F          
						; 001C STOP ENTITY ANIM 8F
		stopEntity $90          
						; 001C STOP ENTITY ANIM 90
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		setEntityDir $81,$2     
						; 0023 SET ENTITY FACING 81 2
		nextSingleText $80,$81  
						; "NOW!{W1}"
		moveEntity $81,$FF,$0,$1
						; 002D MOVE ENTITY 81 FF 0 1
		endMove $8080
		nextSingleText $80,$81  
						; "Shoot them!  Shoot them!{W1}"
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		entityPosDir $85,$C,$10,$2
						; 0019 SET ENTITY POS AND FACING 85 C 10 2
		csWait $1E              
						; WAIT 1E
		setEntityDir $85,$1     
						; 0023 SET ENTITY FACING 85 1
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
						; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
		entityPosDir $85,$D,$F,$1
						; 0019 SET ENTITY POS AND FACING 85 D F 1
		moveEntity $85,$0,$4,$A 
						; 002D MOVE ENTITY 85 0 4 A
		endMove $8080
		flashScreenWhite $2     
						; 0041 FLASH SCREEN WHITE 2
		entityPosDir $86,$D,$F,$1
						; 0019 SET ENTITY POS AND FACING 86 D F 1
		moveEntity $86,$0,$4,$A 
						; 002D MOVE ENTITY 86 0 4 A
		endMove $8080
		csWait $14              
						; WAIT 14
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		entityPosDir $87,$D,$11,$2
						; 0019 SET ENTITY POS AND FACING 87 D 11 2
		csWait $1E              
						; WAIT 1E
		setEntityDir $87,$1     
						; 0023 SET ENTITY FACING 87 1
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
						; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
		entityPosDir $87,$E,$10,$1
						; 0019 SET ENTITY POS AND FACING 87 E 10 1
		moveEntity $87,$0,$4,$A 
						; 002D MOVE ENTITY 87 0 4 A
		endMove $8080
		flashScreenWhite $2     
						; 0041 FLASH SCREEN WHITE 2
		entityPosDir $88,$E,$10,$1
						; 0019 SET ENTITY POS AND FACING 88 E 10 1
		moveEntity $88,$0,$4,$A 
						; 002D MOVE ENTITY 88 0 4 A
		endMove $8080
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		entityPosDir $89,$E,$13,$2
						; 0019 SET ENTITY POS AND FACING 89 E 13 2
		csWait $1E              
						; WAIT 1E
		setEntityDir $89,$1     
						; 0023 SET ENTITY FACING 89 1
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
						; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
		entityPosDir $89,$F,$12,$1
						; 0019 SET ENTITY POS AND FACING 89 F 12 1
		moveEntity $89,$0,$4,$A 
						; 002D MOVE ENTITY 89 0 4 A
		endMove $8080
		flashScreenWhite $2     
						; 0041 FLASH SCREEN WHITE 2
		entityPosDir $8A,$F,$12,$1
						; 0019 SET ENTITY POS AND FACING 8A F 12 1
		moveEntity $8A,$0,$4,$A 
						; 002D MOVE ENTITY 8A 0 4 A
		endMove $8080
		csWait $A               
						; WAIT A
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		entityPosDir $8B,$F,$14,$2
						; 0019 SET ENTITY POS AND FACING 8B F 14 2
		csWait $1E              
						; WAIT 1E
		setEntityDir $8B,$1     
						; 0023 SET ENTITY FACING 8B 1
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
						; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
		entityPosDir $8B,$10,$13,$1
						; 0019 SET ENTITY POS AND FACING 8B 10 13 1
		moveEntity $8B,$0,$4,$A 
						; 002D MOVE ENTITY 8B 0 4 A
		endMove $8080
		flashScreenWhite $2     
						; 0041 FLASH SCREEN WHITE 2
		entityPosDir $8C,$10,$13,$1
						; 0019 SET ENTITY POS AND FACING 8C 10 13 1
		moveEntity $8C,$0,$4,$A 
						; 002D MOVE ENTITY 8C 0 4 A
		endMove $8080
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		entityPosDir $8B,$C,$10,$2
						; 0019 SET ENTITY POS AND FACING 8B C 10 2
		csWait $1E              
						; WAIT 1E
		setEntityDir $8B,$1     
						; 0023 SET ENTITY FACING 8B 1
		playSound SFX_PRISM_LASER_CUTSCENE_FIRING
						; 0005 PLAY SOUND SFX_PRISM_LASER_CUTSCENE_FIRING
		entityPosDir $8B,$D,$F,$1
						; 0019 SET ENTITY POS AND FACING 8B D F 1
		moveEntity $8B,$0,$4,$A 
						; 002D MOVE ENTITY 8B 0 4 A
		endMove $8080
		flashScreenWhite $2     
						; 0041 FLASH SCREEN WHITE 2
		entityPosDir $8C,$D,$F,$1
						; 0019 SET ENTITY POS AND FACING 8C D F 1
		moveEntity $8C,$FF,$4,$A
						; 002D MOVE ENTITY 8C FF 4 A
		endMove $8080
		csc_end                 
						; END OF CUTSCENE SCRIPT
eas_5EF46:
		dc.b   0                
						; 001E SET ANIM SPEED X2 $FFFF
		dc.b $1E
		dc.b $FF
		dc.b $FF
		dc.b   0                
						; 001C SET TRANSPARENCY $FFFF
		dc.b $1C
		dc.w $FFFF
		dc.w $1A                
						; 001A SET 1C BIT 5 $0
		dc.w 0
		dc.w $15                
						; 0015 SET ABILITY TO CHANGE FACING $0
		dc.w 0
		dc.w $10                
						; 0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                
						; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
cs_5EF60:
		textCursor $E9B         
						; Initial text line $E9B : "I did see something!{W1}"
		loadMapFadeIn $25,$4,$6 
						; 0037 LOAD MAP AND FADE IN 25 4 6
		csc49 $9,$B,$3          
						; 0049 UNKNOWN
		executeSubroutine sub_47948
						; 000A EXECUTE SUBROUTINE 47948
		entityPosDir $1A,$8,$A,$0
						; 0019 SET ENTITY POS AND FACING 1A 8 A 0
		executeSubroutine sub_5F32E
						; 000A EXECUTE SUBROUTINE 5F32E
		setActscript $7,$FF,eas_Init
						; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1F FF 460CE
		setActscript $1A,$FF,eas_Init
						; 0015 SET ACTSCRIPT 1A FF 460CE
		entityPosDir $80,$9,$C,$1
						; 0019 SET ENTITY POS AND FACING 80 9 C 1
		entityPosDir $7,$A,$C,$1
						; 0019 SET ENTITY POS AND FACING 7 A C 1
		entityPosDir $1A,$A,$B,$2
						; 0019 SET ENTITY POS AND FACING 1A A B 2
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		nextSingleText $0,$80   
						; "I did see something!{W1}"
		nextSingleText $80,$7   
						; "Well, I didn't.{W1}"
		nextSingleText $0,$80   
						; "This could be bad.{W1}"
		nextSingleText $80,$1A  
						; "Sir Astral!  {LEADER}!{N}Something is coming straight{N}towards us!{W1}"
		nextSingleText $0,$80   
						; "What is it?{W1}"
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		flashScreenWhite $14    
						; 0041 FLASH SCREEN WHITE 14
		setQuakeAmount $1       
						; 0033 SET QUAKE AMOUNT 1
		csWait $A               
						; WAIT A
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		moveEntity $7,$FF,$0,$1 
						; 002D MOVE ENTITY 7 FF 0 1
		moreMove $E,$1
		moreMove $F,$1
		moreMove $E,$1
		moreMove $F,$1
		endMove $8080
		setEntityDir $7,$2      
						; 0023 SET ENTITY FACING 7 2
		nextSingleText $80,$7   
						; "Oooouu!!  What was that?!{N}Lightning?{W1}"
		setEntityDir $0,$0      
						; 0023 SET ENTITY FACING 0 0
		setEntityDir $1A,$3     
						; 0023 SET ENTITY FACING 1A 3
		nextText $80,$1A        
						; "An attack from the ground.{W2}"
		nextSingleText $80,$1A  
						; "I can't control the ship!{W1}"
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		flashScreenWhite $14    
						; 0041 FLASH SCREEN WHITE 14
		setQuakeAmount $1       
						; 0033 SET QUAKE AMOUNT 1
		csWait $A               
						; WAIT A
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		csWait $A               
						; WAIT A
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		flashScreenWhite $14    
						; 0041 FLASH SCREEN WHITE 14
		setQuakeAmount $1       
						; 0033 SET QUAKE AMOUNT 1
		csWait $A               
						; WAIT A
		nextText $80,$1A        
						; "We've sustained damage to{N}the engine!{W2}"
		nextSingleText $80,$1A  
						; "We might crash!{W1}"
		moveEntity $80,$FF,$0,$1
						; 002D MOVE ENTITY 80 FF 0 1
		endMove $8080
		setEntityDir $80,$1     
						; 0023 SET ENTITY FACING 80 1
		entityShiver $80        
						; 002A MAKE ENTITY SHIVER 80
		nextText $0,$80         
						; "Crash?!{W2}"
		nextSingleText $80,$1A  
						; "Geshp's trap!  Darn!{W1}"
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		flashScreenWhite $14    
						; 0041 FLASH SCREEN WHITE 14
		setQuakeAmount $1       
						; 0033 SET QUAKE AMOUNT 1
		csWait $A               
						; WAIT A
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		flashScreenWhite $14    
						; 0041 FLASH SCREEN WHITE 14
		setQuakeAmount $1       
						; 0033 SET QUAKE AMOUNT 1
		csWait $A               
						; WAIT A
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $7,$FF,eas_Jump
						; 0015 SET ACTSCRIPT 7 FF 45E44
		nextText $80,$7         
						; "I don't want to crash!{W2}"
		nextSingleText $80,$7   
						; "Sir Astral, please help us!{W1}"
		nextSingleText $0,$80   
						; "{NAME;26}, can you land on{N}that cape before the ship{N}crashes?{W1}"
		nextSingleText $80,$1A  
						; "I'm not sure,{W2}"
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		flashScreenWhite $14    
						; 0041 FLASH SCREEN WHITE 14
		setQuakeAmount $1       
						; 0033 SET QUAKE AMOUNT 1
		csWait $A               
						; WAIT A
		nextSingleText $80,$1A  
						; "but I'll try.{W1}"
		playSound SFX_BATTLEFIELD_DEATH
						; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		flashScreenWhite $14    
						; 0041 FLASH SCREEN WHITE 14
		setQuakeAmount $1       
						; 0033 SET QUAKE AMOUNT 1
		csWait $A               
						; WAIT A
		setQuakeAmount $3       
						; 0033 SET QUAKE AMOUNT 3
		executeSubroutine sub_5F338
						; 000A EXECUTE SUBROUTINE 5F338
		fadeOutB                
						; 003A FADE OUT TO BLACK
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		mapLoad $4B,$14,$E      
						; 0048 LOAD MAP 4B 14 E
		loadMapEntities ce_5F1CE
						; Entity data to figure out and format
		setActscript $0,$FF,eas_Init
						; 0015 SET ACTSCRIPT 0 FF 460CE
		setCameraEntity $80     
						; 0024 SET ENTITY FOLLOWED BY CAMERA 80
		customActscript $80,$FF 
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $10                
						;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              
						; 0014 END OF CUSTOM ACTSCRIPT
		csc45 $10               
						; (null)
		moveEntity $80,$0,$2,$C 
						; 002D MOVE ENTITY 80 0 2 C
		endMove $8080
		executeSubroutine csub_5F326
						; 000A EXECUTE SUBROUTINE 5F326
		fadeInB                 
						; 0039 FADE IN FROM BLACK
		executeSubroutine sub_5FD92
						; 000A EXECUTE SUBROUTINE 5FD92
		csWait $96              
						; WAIT 96
		playSound $FD           
						; 0005 PLAY SOUND 
		executeSubroutine sub_5F16C
						; 000A EXECUTE SUBROUTINE 5F16C
		setQuakeAmount $1       
						; 0033 SET QUAKE AMOUNT 1
		playSound SFX_INTRO_LIGHTNING
						; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
		flashScreenWhite $3C    
						; 0041 FLASH SCREEN WHITE 3C
		waitIdle $80            
						; 0016 WAIT UNTIL IDLE ENTITY 80
		setBlocks $383B,$405,$C11
						; 0034 SET BLOCKS 383B 405 C11
		csWait $78              
						; WAIT 78
		setQuakeAmount $0       
						; 0033 SET QUAKE AMOUNT 0
		executeSubroutine csub_5F14C
						; 000A EXECUTE SUBROUTINE 5F14C
		csWait $78              
						; WAIT 78
		mapSysEvent $25080C03   
						; 0007 EXECUTE MAP SYSTEM EVENT 25080C03
		csc_end                 
						; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

csub_5F14C:
		
		lea     plt_5F17E(pc), a0
		lea     (PALETTE_4_BIS).l,a1
		moveq   #$20,d7 
		jsr     (CopyBytes).w   
		lea     (PALETTE_1_BIS).l,a0
		clr.b   ((byte_FFDFAB-$1000000)).w
		jsr     (sub_19C8).w    
		rts

	; End of function csub_5F14C


; =============== S U B R O U T I N E =======================================

sub_5F16C:
		
		moveq   #$17,d7
loc_5F16E:
		
		subq.b  #1,((byte_FFAEEE+5-$1000000)).w
		moveq   #2,d0
		jsr     (Sleep).w       
		dbf     d7,loc_5F16E
		rts

	; End of function sub_5F16C

plt_5F17E:
		dc.w 0
		dc.w $C40
		dc.w $E84
		dc.w $26
		dc.w $6A
		dc.w $2AE
		dc.w $42
		dc.w $C4
		dc.w 0
		dc.w $222
		dc.w $666
		dc.w $AAA
		dc.w $20E
		dc.w $6CE
		dc.w $4E8
		dc.w $EEE
ce_5F19E:
		dc.w 0
		dc.w 0
		dc.w 1
		dc.b $D
		dc.b 4
		dc.b 1
		dc.b $FB
		dc.l eas_Init           
		dc.b $D
		dc.b 8
		dc.b 1
		dc.b $9F
		dc.l eas_Init           
		dc.b $D
		dc.b $19
		dc.b 1
		dc.b $A0
		dc.l eas_Init           
		dc.w $FFFF
ce_5F1BE:
		dc.w $3F
		dc.w $3F
		dc.w 1
		dc.b 5
		dc.b 5
		dc.b 1
		dc.b $FD
		dc.l eas_Init           
		dc.w $FFFF
ce_5F1CE:
		dc.w $3F
		dc.w $3F
		dc.w 1
		dc.b $19
		dc.b $13
		dc.b 1
		dc.b $FD
		dc.l eas_Init           
		dc.w $FFFF
ce_5F1DE:
		dc.w 0
		dc.w 0
		dc.w 1
		dc.b $B
		dc.b $13
		dc.b 1
		dc.b $5C
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 0
		dc.b $9F
		dc.l eas_Init           
		dc.b 9
		dc.b $10
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $D
		dc.b $11
		dc.b 1
		dc.b $9D
		dc.l eas_Init           
		dc.b $E
		dc.b $13
		dc.b 2
		dc.b $9D
		dc.l eas_Init           
		dc.b $F
		dc.b $14
		dc.b 1
		dc.b $9D
		dc.l eas_Init           
		dc.b 8
		dc.b $10
		dc.b 0
		dc.b $5A
		dc.l eas_Init           
		dc.b $A
		dc.b $10
		dc.b 2
		dc.b $5A
		dc.l eas_Init           
		dc.b $B
		dc.b $10
		dc.b 2
		dc.b $5A
		dc.l eas_Init           
		dc.b $F
		dc.b $13
		dc.b 3
		dc.b $8A
		dc.l eas_Init           
		dc.b $D
		dc.b $13
		dc.b 0
		dc.b $8A
		dc.l eas_Init           
		dc.w $FFFF
ce_5F23E:
		dc.w 0
		dc.w 0
		dc.w 1
		dc.b $C
		dc.b $10
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $10
		dc.b $12
		dc.b 0
		dc.b $9F
		dc.l eas_Init           
		dc.b $D
		dc.b $11
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $E
		dc.b $13
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $F
		dc.b $14
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $B
		dc.b $10
		dc.b 0
		dc.b $5A
		dc.l eas_Init           
		dc.b $C
		dc.b $11
		dc.b 0
		dc.b $8A
		dc.l eas_Init           
		dc.b $D
		dc.b $13
		dc.b 0
		dc.b $5A
		dc.l eas_Init           
		dc.b $E
		dc.b $14
		dc.b 0
		dc.b $8A
		dc.l eas_Init           
		dc.w $FFFF
ce_5F28E:
		dc.w 0
		dc.w 0
		dc.w 1
		dc.b $B
		dc.b $10
		dc.b 0
		dc.b $5A
		dc.l eas_Init           
		dc.b $10
		dc.b $12
		dc.b 0
		dc.b $9F
		dc.l eas_Init           
		dc.b $C
		dc.b $11
		dc.b 0
		dc.b $8A
		dc.l eas_Init           
		dc.b $D
		dc.b $13
		dc.b 0
		dc.b $5A
		dc.l eas_Init           
		dc.b $E
		dc.b $14
		dc.b 0
		dc.b $8A
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b $BA
		dc.l eas_Init           
		dc.b $C
		dc.b $10
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $D
		dc.b $11
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $E
		dc.b $13
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.b $F
		dc.b $14
		dc.b 0
		dc.b $9D
		dc.l eas_Init           
		dc.w $FFFF

; =============== S U B R O U T I N E =======================================

sub_5F31E:
		
		move.b  #$F0,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		nop
csub_5F326:
		
		move.b  #$18,((byte_FFAEEE+5-$1000000)).w
		rts

	; End of function sub_5F31E


; =============== S U B R O U T I N E =======================================

sub_5F32E:
		
		move.b  #$F8,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		nop
		rts

	; End of function sub_5F32E


; =============== S U B R O U T I N E =======================================

sub_5F338:
		
		moveq   #$F,d7
loc_5F33A:
		
		subq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		nop
		moveq   #4,d0
		jsr     (Sleep).w       
		dbf     d7,loc_5F33A
		rts

	; End of function sub_5F338

