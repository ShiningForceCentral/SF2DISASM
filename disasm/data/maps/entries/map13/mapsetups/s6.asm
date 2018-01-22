
; ASM FILE data\maps\entries\map13\mapsetups\s6.asm :
; 0x582E0..0x58E18 : 

; =============== S U B R O U T I N E =======================================

ms_map13_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $2C7               ; set after you dislodge the turtle/fairy in Polca
		bne.s   loc_582EC
		lea     cs_58310(pc), a0
		trap    #6
loc_582EC:
		trap    #CHECK_FLAG
		dc.w $2CC               ; set after your raft-giving conversation with the mayor in Polca
		beq.s   loc_582FE
		move.w  #$89,d0 
		moveq   #3,d1
		jsr     sub_4781A
loc_582FE:
		trap    #CHECK_FLAG
		dc.w $2CE               ; set after Oddler runs after you as you leave Polca, and tags along
		beq.s   return_5830E
		move.w  #$8C,d0 
		jsr     MoveEntityOutOfMap
return_5830E:
		rts

	; End of function ms_map13_InitFunction

cs_58310:       setFacing $82,$3        ; 0023 SET ENTITY FACING 82 3
		customActscript $82,$FF ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		startEntity $82         ; 001B START ENTITY ANIM 82
		csc_end
cs_58330:       playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuake $6             ; 0033 SET QUAKE AMOUNT 6
		flashScreenWhite $5A    ; 0041 FLASH SCREEN WHITE 5A
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		csWait $14
		csWait $5
		setActscript $0,$0,eas_461B6; 0015 SET ACTSCRIPT 0 0 461B6
		csWait $5
		setActscript $85,$0,eas_461E4; 0015 SET ACTSCRIPT 85 0 461E4
		csWait $32
		csWait $5
		setActscript $7,$0,eas_461B6; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $64
		textCursor $5AC         ; 0004 INIT TEXT CURSOR 5AC : "Oh!{W1}"
		entityPosDir $8C,$1D,$7,$2; 0019 SET ENTITY POS AND FACING 8C 1D 7 2
		customActscript $8C,$FF ; 0014 SET MANUAL ACTSCRIPT 8C
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $8C,$FF,$2,$2; 002D MOVE ENTITY 8C FF 2 2
		endMove $8080
		customActscript $8C,$FF ; 0014 SET MANUAL ACTSCRIPT 8C
		dc.w $10                ;   0010 SET SPEED X=$4 Y=$4
		dc.b 4
		dc.b 4
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $0,$0         ; 0023 SET ENTITY FACING 0 0
		setFacing $7,$0         ; 0023 SET ENTITY FACING 7 0
		moveEntity $8C,$FF,$2,$1; 002D MOVE ENTITY 8C FF 2 1
		endMove $8080
		setActscript $8C,$FF,eas_46172; 0015 SET ACTSCRIPT 8C FF 46172
		customActscript $8C,$FF ; 0014 SET MANUAL ACTSCRIPT 8C
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $8C,$0,$3,$1 ; 002D MOVE ENTITY 8C 0 3 1
		endMove $8080
		csWait $2
		setActscript $8C,$FF,eas_461AA; 0015 SET ACTSCRIPT 8C FF 461AA
		customActscript $8C,$FF ; 0014 SET MANUAL ACTSCRIPT 8C
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $85,$0        ; 0023 SET ENTITY FACING 85 0
		csWait $3C
		nextSingleText $0,$85   ; "Oh!{W1}"
		moveEntity $85,$FF,$0,$3; 002D MOVE ENTITY 85 FF 0 3
		endMove $8080
		setFacing $85,$3        ; 0023 SET ENTITY FACING 85 3
		nextSingleText $FF,$FF  ; "The beastman checks the boy.{W1}"
		nextSingleText $0,$85   ; "Good heavens!{N}He's badly injured!{W1}"
		csWait $1E
		setFacing $85,$0        ; 0023 SET ENTITY FACING 85 0
		csWait $32
		moveEntity $85,$FF,$2,$2; 002D MOVE ENTITY 85 FF 2 2
		endMove $8080
		setActscript $85,$FF,eas_Jump; 0015 SET ACTSCRIPT 85 FF 45E44
		setActscript $85,$0,eas_Jump; 0015 SET ACTSCRIPT 85 0 45E44
		nextSingleText $0,$85   ; "Mayor, mayor!{W1}"
		entityPosDir $89,$11,$7,$0; 0019 SET ENTITY POS AND FACING 89 11 7 0
		setCamDest $D,$3        ; 0032 SET CAMERA DEST D 3
		entityPosDir $0,$19,$9,$1; 0019 SET ENTITY POS AND FACING 0 19 9 1
		entityPosDir $7,$19,$9,$1; 0019 SET ENTITY POS AND FACING 7 19 9 1
		setCameraEntity $89     ; 0024 SET ENTITY FOLLOWED BY CAMERA 89
		moveEntity $89,$FF,$0,$5; 002D MOVE ENTITY 89 FF 0 5
		moreMove $1,$1
		endMove $8080
		setFacing $89,$0        ; 0023 SET ENTITY FACING 89 0
		nextSingleText $0,$89   ; "What's all this noise?{W1}"
		nextSingleText $0,$85   ; "Mayor, a boy from the mountain{N}is seriously injured!{W1}"
		nextSingleText $0,$89   ; "What?!{W1}"
		moveEntity $89,$FF,$3,$1; 002D MOVE ENTITY 89 FF 3 1
		moreMove $0,$3
		endMove $8080
		setFacing $85,$0        ; 0023 SET ENTITY FACING 85 0
		nextText $0,$89         ; "Ohhh...his eyes are{N}seriously damaged!{W2}"
		nextSingleText $0,$89   ; "He must have been caught{N}in the eruption....{W1}"
		moveEntity $85,$FF,$0,$3; 002D MOVE ENTITY 85 FF 0 3
		moreMove $3,$1
		endMove $8080
		setFacing $85,$2        ; 0023 SET ENTITY FACING 85 2
		nextSingleText $0,$85   ; "He needs prompt treatment!{W1}"
		nextSingleText $0,$89   ; "Yes!  Bring him into my house!{W1}"
		entityNod $85           ; 0026 MAKE ENTITY NOD 85
		moveEntity $89,$0,$0,$1 ; 002D MOVE ENTITY 89 0 0 1
		endMove $8080
		moveEntity $85,$0,$2,$1 ; 002D MOVE ENTITY 85 0 2 1
		endMove $8080
		csWait $3
		setActscript $85,$FF,eas_461AA; 0015 SET ACTSCRIPT 85 FF 461AA
		setActscript $89,$FF,eas_461AA; 0015 SET ACTSCRIPT 89 FF 461AA
		setFacing $89,$2        ; 0023 SET ENTITY FACING 89 2
		csWait $1E
		moveEntity $8C,$0,$1,$1 ; 002D MOVE ENTITY 8C 0 1 1
		endMove $8080
		csWait $2
		setActscript $8C,$FF,eas_461AA; 0015 SET ACTSCRIPT 8C FF 461AA
		csWait $1E
		setCameraEntity $FFFF   ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		moveEntity $89,$0,$2,$9 ; 002D MOVE ENTITY 89 0 2 9
		endMove $8080
		moveEntity $8C,$0,$2,$9 ; 002D MOVE ENTITY 8C 0 2 9
		endMove $8080
		moveEntity $85,$FF,$2,$9; 002D MOVE ENTITY 85 FF 2 9
		endMove $8080
		setActscript $8C,$FF,eas_Init; 0015 SET ACTSCRIPT 8C FF 460CE
		setFacing $89,$2        ; 0023 SET ENTITY FACING 89 2
		setFacing $85,$1        ; 0023 SET ENTITY FACING 85 1
		setFacing $8C,$3        ; 0023 SET ENTITY FACING 8C 3
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		reloadEntities ms_map13_flag2C6_Entities
						; 0044  57F08
		csc_end
cs_58512:       customActscript $82,$FF ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $18                ;   0018 SET 1C BIT 7 $0
		dc.w 0
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setCameraEntity $FFFF   ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		textCursor $59B         ; 0004 INIT TEXT CURSOR 59B : "Help!  Help!{N}I can't...get up!{W2}{N}You, please turn me over!{W1}"
		nextSingleText $0,$82   ; "Help!  Help!{N}I can't...get up!{W2}{N}You, please turn me over!{W1}"
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setEntityDest $7,$2,$C  ; 0029 SET ENTITY DEST 7 2 C
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		csWait $1E
		setActscript $0,$FF,eas_BumpUp; 0015 SET ACTSCRIPT 0 FF 45F0C
		csWait $28
		nextSingleText $0,$82   ; "Are you a wimp?{N}Push harder!{W1}"
		csWait $A
		entityNod $0            ; 0026 MAKE ENTITY NOD 0
		setActscript $0,$FF,eas_BumpUp; 0015 SET ACTSCRIPT 0 FF 45F0C
		setActscript $0,$FF,eas_BumpUp; 0015 SET ACTSCRIPT 0 FF 45F0C
		csWait $14
		nextSingleText $0,$82   ; "Good, good!{N}Push!{W1}"
		setActscript $0,$FF,eas_46172; 0015 SET ACTSCRIPT 0 FF 46172
		moveEntity $0,$FF,$3,$1 ; 002D MOVE ENTITY 0 FF 3 1
		endMove $8080
		csWait $1E
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $0,$FF,$1,$1 ; 002D MOVE ENTITY 0 FF 1 1
		endMove $8080
		setQuake $2             ; 0033 SET QUAKE AMOUNT 2
		csWait $1E
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		animEntityFadeInOut $82,$6; 0022 ANIMATE ENTITY FADE INOUT 82
		customActscript $82,$0  ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $1B                ;   001B SET FLIPPING $0
		dc.w 0
		dc.w $17                ;   0017 SET ENTITY SPRITE $DB
		dc.w $DB
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		animEntityFadeInOut $82,$7; 0022 ANIMATE ENTITY FADE INOUT 82
		csWait $28
		setFacing $82,$3        ; 0023 SET ENTITY FACING 82 3
		nextSingleText $0,$82   ; "(Giggle)...sorry, I had to{N}test you.{W2}{N}I'm happy to meet you.{N}He must like you.{W2}{N}Oh no, I can't tell you who{N}HE is.{N}See you later!{W1}"
		setActscript $82,$FF,eas_Init2; 0015 SET ACTSCRIPT 82 FF 46102
		setActscript $82,$FF,eas_46172; 0015 SET ACTSCRIPT 82 FF 46172
		moveEntity $82,$FF,$1,$A; 002D MOVE ENTITY 82 FF 1 A
		endMove $8080
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		csc_end
cs_585FE:       playSound $FD           ; 0005 PLAY SOUND 
		customActscript $81,$FF ; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $82,$FF ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $83,$FF ; 0014 SET MANUAL ACTSCRIPT 83
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $84,$FF ; 0014 SET MANUAL ACTSCRIPT 84
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $83,$FF,eas_46172; 0015 SET ACTSCRIPT 83 FF 46172
		setActscript $84,$FF,eas_46172; 0015 SET ACTSCRIPT 84 FF 46172
		textCursor $5BC         ; 0004 INIT TEXT CURSOR 5BC : "Bedoe soldiers are cowards!{W1}"
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		nextSingleText $0,$80   ; "Bedoe soldiers are cowards!{W1}"
		setCamDest $E,$A        ; 0032 SET CAMERA DEST E A
		playSound MUSIC_ENEMY_ATTACK; 0005 PLAY SOUND MUSIC_ENEMY_ATTACK
		nextSingleText $0,$A    ; "Be quiet!{W1}"
		moveEntity $A,$FF,$0,$1 ; 002D MOVE ENTITY A FF 0 1
		endMove $8080
		moveEntity $81,$0,$2,$3 ; 002D MOVE ENTITY 81 0 2 3
		endMove $8080
		moveEntity $82,$FF,$2,$3; 002D MOVE ENTITY 82 FF 2 3
		endMove $8080
		moveEntity $81,$0,$0,$3 ; 002D MOVE ENTITY 81 0 0 3
		endMove $8080
		moveEntity $82,$0,$0,$3 ; 002D MOVE ENTITY 82 0 0 3
		endMove $8080
		moveEntity $83,$0,$2,$2 ; 002D MOVE ENTITY 83 0 2 2
		endMove $8080
		moveEntity $84,$FF,$2,$2; 002D MOVE ENTITY 84 FF 2 2
		endMove $8080
		setActscript $83,$0,eas_Die; 0015 SET ACTSCRIPT 83 0 46024
		setActscript $84,$FF,eas_Die; 0015 SET ACTSCRIPT 84 FF 46024
		setFacing $81,$2        ; 0023 SET ENTITY FACING 81 2
		setFacing $82,$2        ; 0023 SET ENTITY FACING 82 2
		setFacing $A,$2         ; 0023 SET ENTITY FACING A 2
		csWait $28
		nextSingleText $0,$A    ; "My comrades!{W1}"
		csWait $14
		moveEntity $80,$FF,$2,$1; 002D MOVE ENTITY 80 FF 2 1
		endMove $8080
		setFacing $A,$0         ; 0023 SET ENTITY FACING A 0
		nextSingleText $0,$80   ; "You're our captive.  Don't{N}force me to kill you.{W1}"
		csWait $5
		setActscript $80,$0,eas_461E4; 0015 SET ACTSCRIPT 80 0 461E4
		csWait $14
		setFacing $80,$2        ; 0023 SET ENTITY FACING 80 2
		nextText $0,$80         ; "No more funny business, you{N}can't resist us!{W2}"
		setFacing $80,$2        ; 0023 SET ENTITY FACING 80 2
		nextSingleText $0,$80   ; "Now, give me that injured{N}boy!{W1}"
		moveEntity $81,$0,$2,$1 ; 002D MOVE ENTITY 81 0 2 1
		endMove $8080
		moveEntity $82,$FF,$2,$1; 002D MOVE ENTITY 82 FF 2 1
		endMove $8080
		csWait $14
		nextSingleText $0,$9    ; "Don't listen to him!{W2}"
		csWait $5
		setActscript $80,$0,eas_461E4; 0015 SET ACTSCRIPT 80 0 461E4
		csWait $5
		setActscript $81,$0,eas_461B6; 0015 SET ACTSCRIPT 81 0 461B6
		csWait $5
		setActscript $82,$0,eas_461B6; 0015 SET ACTSCRIPT 82 0 461B6
		setFacing $A,$1         ; 0023 SET ENTITY FACING A 1
		csWait $28
		setCamDest $6,$6        ; 0032 SET CAMERA DEST 6 6
		nextSingleText $0,$9    ; "I'll help you fight against{N}the devils and guard Oddler!{W1}"
		setCameraEntity $9      ; 0024 SET ENTITY FOLLOWED BY CAMERA 9
		entityPosDir $0,$14,$9,$3; 0019 SET ENTITY POS AND FACING 0 14 9 3
		entityPosDir $7,$13,$8,$3; 0019 SET ENTITY POS AND FACING 7 13 8 3
		moveEntity $9,$FF,$3,$3 ; 002D MOVE ENTITY 9 FF 3 3
		moreMove $0,$6
		endMove $8080
		setActscript $9,$FF,eas_BumpRight
						; 0015 SET ACTSCRIPT 9 FF 45EBC
		csWait $14
		moveEntity $9,$FF,$0,$1 ; 002D MOVE ENTITY 9 FF 0 1
		endMove $8080
		setFacing $9,$1         ; 0023 SET ENTITY FACING 9 1
		setCamDest $E,$8        ; 0032 SET CAMERA DEST E 8
		nextSingleText $0,$9    ; "You!{W1}"
		setFacing $80,$1        ; 0023 SET ENTITY FACING 80 1
		setFacing $81,$1        ; 0023 SET ENTITY FACING 81 1
		setFacing $82,$1        ; 0023 SET ENTITY FACING 82 1
		csWait $28
		setFacing $9,$0         ; 0023 SET ENTITY FACING 9 0
		moveEntity $A,$FF,$1,$1 ; 002D MOVE ENTITY A FF 1 1
		endMove $8080
		nextSingleText $0,$A    ; "Oh, {LEADER}, {NAME;7}!{W1}"
		moveEntity $7,$FF,$3,$1 ; 002D MOVE ENTITY 7 FF 3 1
		endMove $8080
		nextSingleText $C0,$7   ; "{NAME;10}!  Why are you here?{W1}"
		nextText $0,$A          ; "I came here to get a raft{N}for you.{W2}"
		nextSingleText $0,$A    ; "The people of Polca are{N}being controlled by these{N}devils.  They deceived me!{W1}"
		moveEntity $9,$FF,$0,$1 ; 002D MOVE ENTITY 9 FF 0 1
		endMove $8080
		setFacing $9,$3         ; 0023 SET ENTITY FACING 9 3
		nextSingleText $0,$9    ; "Prince {NAME;10}, I'm sorry.{W1}"
		setCameraEntity $9      ; 0024 SET ENTITY FOLLOWED BY CAMERA 9
		moveEntity $9,$FF,$1,$1 ; 002D MOVE ENTITY 9 FF 1 1
		endMove $8080
		nextSingleText $0,$9    ; "Polcans will not fight.{N}Please let me join you!{W1}"
		join $9                 ; 0008 JOIN FORCE 9
		setCameraEntity $A      ; 0024 SET ENTITY FOLLOWED BY CAMERA A
		nextSingleText $0,$A    ; "Great!{W1}"
		setFacing $9,$3         ; 0023 SET ENTITY FACING 9 3
		entityNod $9            ; 0026 MAKE ENTITY NOD 9
		moveEntity $A,$FF,$1,$1 ; 002D MOVE ENTITY A FF 1 1
		endMove $8080
		nextSingleText $0,$A    ; "Don't forget me!{W1}"
		moveEntity $81,$FF,$1,$1; 002D MOVE ENTITY 81 FF 1 1
		moreMove $2,$1
		endMove $8080
		setActscript $A,$FF,eas_46172; 0015 SET ACTSCRIPT A FF 46172
		customActscript $A,$FF  ; 0014 SET MANUAL ACTSCRIPT A
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $A,$0,$2,$3  ; 002D MOVE ENTITY A 0 2 3
		endMove $8080
		moveEntity $81,$FF,$0,$1; 002D MOVE ENTITY 81 FF 0 1
		moreMove $3,$1
		endMove $8080
		customActscript $A,$FF  ; 0014 SET MANUAL ACTSCRIPT A
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $81,$2        ; 0023 SET ENTITY FACING 81 2
		csWait $28
		moveEntity $80,$FF,$2,$1; 002D MOVE ENTITY 80 FF 2 1
		moreMove $1,$1
		endMove $8080
		nextText $0,$80         ; "You still dare to resist us?!{W2}"
		nextSingleText $0,$80   ; "For that you shall die!!{W1}"
		setStoryFlag $D         ; Battle 13 unlocked
		mapSysEvent $D,$0,$0,$0 ; 0007 EXECUTE MAP SYSTEM EVENT D000000
		csc_end
cs_58856:       textCursor $5CF         ; 0004 INIT TEXT CURSOR 5CF : "Heeeeee!{W1}"
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $A,$FF,eas_Init; 0015 SET ACTSCRIPT A FF 460CE
		setFacing $89,$3        ; 0023 SET ENTITY FACING 89 3
		csWait $1E
		setFacing $89,$1        ; 0023 SET ENTITY FACING 89 1
		csWait $1E
		setFacing $89,$3        ; 0023 SET ENTITY FACING 89 3
		setActscript $89,$FF,eas_Jump; 0015 SET ACTSCRIPT 89 FF 45E44
		setActscript $89,$0,eas_Jump; 0015 SET ACTSCRIPT 89 0 45E44
		nextSingleText $0,$89   ; "Heeeeee!{W1}"
		entityShiver $89        ; 002A MAKE ENTITY SHIVER 89
		nextSingleText $0,$89   ; "I'm sorry!  I'm sorry!{N}Don't possess me!{W1}"
		entityShiver $89        ; 002A MAKE ENTITY SHIVER 89
		setEntityDest $A,$11,$4 ; 0029 SET ENTITY DEST A 11 4
		setEntityDest $7,$11,$5 ; 0029 SET ENTITY DEST 7 11 5
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		nextSingleText $C0,$7   ; "What's he talking about?{W1}"
		setFacing $A,$3         ; 0023 SET ENTITY FACING A 3
		nextSingleText $0,$A    ; "I don't know...{N}What a loon!{W1}"
		moveEntity $A,$FF,$2,$1 ; 002D MOVE ENTITY A FF 2 1
		endMove $8080
		setFacing $A,$1         ; 0023 SET ENTITY FACING A 1
		nextSingleText $0,$A    ; "C'mon, mayor.  We're alive!{W1}"
		nextSingleText $0,$89   ; "What?!{W1}"
		moveEntity $0,$0,$3,$1  ; 002D MOVE ENTITY 0 0 3 1
		endMove $8080
		moveEntity $89,$FF,$3,$1; 002D MOVE ENTITY 89 FF 3 1
		endMove $8080
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		setFacing $89,$0        ; 0023 SET ENTITY FACING 89 0
		setFacing $A,$2         ; 0023 SET ENTITY FACING A 2
		csWait $1E
		nextSingleText $FF,$FF  ; "The mayor examines {NAME;10}{N}carefully.{W1}"
		csWait $28
		nextSingleText $0,$89   ; "You're warm!  You're alive!{W1}"
		setActscript $89,$FF,eas_Jump; 0015 SET ACTSCRIPT 89 FF 45E44
		setActscript $89,$FF,eas_Jump; 0015 SET ACTSCRIPT 89 FF 45E44
		csWait $1E
		setFacing $89,$3        ; 0023 SET ENTITY FACING 89 3
		customActscript $89,$FF ; 0014 SET MANUAL ACTSCRIPT 89
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $89,$FF,eas_46172; 0015 SET ACTSCRIPT 89 FF 46172
		moveEntity $89,$FF,$1,$1; 002D MOVE ENTITY 89 FF 1 1
		endMove $8080
		entityNod $89           ; 0026 MAKE ENTITY NOD 89
		nextText $0,$89         ; "I really regret all of this.{W2}"
		nextText $0,$89         ; "Suddenly, the devils{N}appeared.{W2}"
		nextText $0,$89         ; "We had no power to resist{N}them.{W2}"
		nextSingleText $0,$89   ; "They promised they would do{N}nothing if we gave Oddler{N}to them.{W1}"
		moveEntity $A,$FF,$2,$1 ; 002D MOVE ENTITY A FF 2 1
		endMove $8080
		setFacing $A,$1         ; 0023 SET ENTITY FACING A 1
		nextSingleText $0,$A    ; "And you sent ME in Oddler's{N}place?!{W1}"
		entityShakeHead $89     ; 0027 MAKE ENTITY SHAKE HEAD 89
		nextSingleText $0,$89   ; "I'm sorry, please don't{N}tell King Bedoe!{W1}"
		csWait $14
		setFacing $A,$3         ; 0023 SET ENTITY FACING A 3
		csWait $32
		nextText $0,$A          ; "Alright, I won't...{W2}"
		setFacing $A,$1         ; 0023 SET ENTITY FACING A 1
		csWait $14
		nextSingleText $0,$A    ; "If you prepare a raft for{N}{LEADER}.{W1}"
		setActscript $89,$FF,eas_Init; 0015 SET ACTSCRIPT 89 FF 460CE
		setActscript $89,$FF,eas_Jump; 0015 SET ACTSCRIPT 89 FF 45E44
		setActscript $89,$0,eas_Jump; 0015 SET ACTSCRIPT 89 0 45E44
		nextSingleText $0,$89   ; "Oh, thank you!{N}A raft, OK.{W1}"
		setActscript $A,$FF,eas_46172; 0015 SET ACTSCRIPT A FF 46172
		setActscript $7,$FF,eas_46172; 0015 SET ACTSCRIPT 7 FF 46172
		setFacing $A,$2         ; 0023 SET ENTITY FACING A 2
		moveEntity $A,$0,$0,$2  ; 002D MOVE ENTITY A 0 0 2
		moreMove $1,$1
		endMove $8080
		moveEntity $89,$FF,$3,$1; 002D MOVE ENTITY 89 FF 3 1
		moreMove $0,$2
		endMove $8080
		setFacing $A,$3         ; 0023 SET ENTITY FACING A 3
		setFacing $89,$3        ; 0023 SET ENTITY FACING 89 3
		csWait $14
		moveEntity $7,$0,$2,$1  ; 002D MOVE ENTITY 7 0 2 1
		endMove $8080
		moveEntity $89,$FF,$3,$3; 002D MOVE ENTITY 89 FF 3 3
		endMove $8080
		setFacing $89,$0        ; 0023 SET ENTITY FACING 89 0
		setCamDest $B,$2        ; 0032 SET CAMERA DEST B 2
		setActscript $89,$FF,eas_Jump; 0015 SET ACTSCRIPT 89 FF 45E44
		setActscript $89,$0,eas_Jump; 0015 SET ACTSCRIPT 89 0 45E44
		nextSingleText $0,$89   ; "Hey, Ripster!{W1}"
		entityPosDir $85,$17,$7,$2; 0019 SET ENTITY POS AND FACING 85 17 7 2
		customActscript $85,$FF ; 0014 SET MANUAL ACTSCRIPT 85
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $85,$FF,$2,$5; 002D MOVE ENTITY 85 FF 2 5
		endMove $8080
		nextSingleText $0,$85   ; "Yes.{W1}"
		nextSingleText $0,$89   ; "Prepare a raft for{N}Prince {NAME;10}.{W1}"
		setActscript $85,$FF,eas_Init; 0015 SET ACTSCRIPT 85 FF 460CE
		setActscript $85,$FF,eas_JumpRight
						; 0015 SET ACTSCRIPT 85 FF 45E94
		csWait $1E
		moveEntity $85,$FF,$2,$1; 002D MOVE ENTITY 85 FF 2 1
		endMove $8080
		nextSingleText $0,$85   ; "But, it's the last one we{N}have...{W1}"
		setActscript $89,$FF,eas_Jump; 0015 SET ACTSCRIPT 89 FF 45E44
		setActscript $89,$0,eas_Jump; 0015 SET ACTSCRIPT 89 0 45E44
		nextText $0,$89         ; "I don't care!{W2}"
		nextSingleText $0,$89   ; "You can make another if{N}necessary, can't you?!{W1}"
		entityNod $85           ; 0026 MAKE ENTITY NOD 85
		nextSingleText $0,$85   ; "Y...yes, sir!{W1}"
		customActscript $85,$FF ; 0014 SET MANUAL ACTSCRIPT 85
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $85,$FF,$0,$5; 002D MOVE ENTITY 85 FF 0 5
		endMove $8080
		hideEntity $85          ; 002E HIDE ENTITY 85
		setCamDest $B,$0        ; 0032 SET CAMERA DEST B 0
		moveEntity $89,$FF,$1,$3; 002D MOVE ENTITY 89 FF 1 3
		endMove $8080
		csWait $14
		nextText $0,$89         ; "A raft will be waiting for{N}you on the river.{W2}"
		nextSingleText $0,$89   ; "Why don't you take a look{N}at it right now?{W1}"
		moveEntity $89,$FF,$2,$2; 002D MOVE ENTITY 89 FF 2 2
		moreMove $1,$1
		endMove $8080
		setFacing $89,$3        ; 0023 SET ENTITY FACING 89 3
		csWait $1E
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $A,$FF,eas_Init; 0015 SET ACTSCRIPT A FF 460CE
		moveEntity $A,$FF,$3,$1 ; 002D MOVE ENTITY A FF 3 1
		moreMove $2,$1
		endMove $8080
		setFacing $A,$3         ; 0023 SET ENTITY FACING A 3
		nextSingleText $C0,$7   ; "He wants to get rid of us.{W1}"
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		nextText $0,$A          ; "You're right.{W1}"
		nextSingleText $0,$A    ; "Anyway, now we have a raft!{W1}"
		moveEntity $A,$FF,$2,$1 ; 002D MOVE ENTITY A FF 2 1
		endMove $8080
		setFacing $A,$3         ; 0023 SET ENTITY FACING A 3
		nextSingleText $0,$A    ; "Let's go!{W1}"
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $A,$7,$2   ; 002C FOLLOW ENTITY A 7 2
		csc_end
cs_58AE2:       textCursor $5ED         ; 0004 INIT TEXT CURSOR 5ED : "Just a minute.{W1}"
		setCamDest $10,$8       ; 0032 SET CAMERA DEST 10 8
		entityPosDir $89,$11,$7,$0; 0019 SET ENTITY POS AND FACING 89 11 7 0
		entityPosDir $8C,$10,$7,$0; 0019 SET ENTITY POS AND FACING 8C 10 7 0
		nextSingleText $0,$89   ; "Just a minute.{W1}"
		setCamDest $A,$4        ; 0032 SET CAMERA DEST A 4
		nextSingleText $0,$89   ; "If it's possible...{W1}"
		setFacing $89,$2        ; 0023 SET ENTITY FACING 89 2
		csWait $32
		setFacing $89,$0        ; 0023 SET ENTITY FACING 89 0
		csWait $1E
		nextSingleText $0,$89   ; "Please take this boy with{N}you.{W1}"
		csWait $14
		nextText $C0,$A         ; "You lazy human!{W2}"
		nextSingleText $C0,$A   ; "You don't want to take care{N}of him!{W1}"
		setFacing $89,$2        ; 0023 SET ENTITY FACING 89 2
		nextSingleText $0,$89   ; "I...er....{W1}"
		entityPosDir $0,$16,$C,$0; 0019 SET ENTITY POS AND FACING 0 16 C 0
		entityPosDir $7,$17,$C,$2; 0019 SET ENTITY POS AND FACING 7 17 C 2
		entityPosDir $A,$17,$B,$3; 0019 SET ENTITY POS AND FACING A 17 B 3
		setCamDest $10,$6       ; 0032 SET CAMERA DEST 10 6
		csWait $1E
		nextText $80,$7         ; "{LEADER}, will you take{N}"
		nextText $80,$7         ; "him with us?{W1}"
		yesNo                   ; 0011 STORY YESNO PROMPT
		jumpIfFlagSet $59,cs_58B7A; YES/NO prompt answer
		nextText $0,$7          ; "I agree.  Our journey will{N}be too difficult on him,{N}as he is blind.{W2}"
		csWait $1E
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		setFacing $A,$1         ; 0023 SET ENTITY FACING A 1
		nextSingleText $80,$7   ; "Mayor, we can't take him,{N}we're sorry.{W1}"
		setCamDest $F,$2        ; 0032 SET CAMERA DEST F 2
		setFacing $89,$0        ; 0023 SET ENTITY FACING 89 0
		nextSingleText $0,$89   ; "B...but....{W1}"
		csc_end
cs_58B7A:       textCursor $5F8         ; 0004 INIT TEXT CURSOR 5F8 : "Are you serious?{N}{LEADER}, you're too nice.{W1}"
		nextSingleText $80,$7   ; "Are you serious?{N}{LEADER}, you're too nice.{W1}"
		customActscript $8C,$FF ; 0014 SET MANUAL ACTSCRIPT 8C
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $89,$0,$0,$3 ; 002D MOVE ENTITY 89 0 0 3
		moreMove $A,$1
		endMove $8080
		moveEntity $8C,$FF,$0,$3; 002D MOVE ENTITY 8C FF 0 3
		endMove $8080
		csWait $14
		moveEntity $89,$0,$0,$3 ; 002D MOVE ENTITY 89 0 0 3
		moreMove $A,$1
		endMove $8080
		moveEntity $8C,$FF,$0,$3; 002D MOVE ENTITY 8C FF 0 3
		endMove $8080
		setFacing $89,$3        ; 0023 SET ENTITY FACING 89 3
		setFacing $8C,$3        ; 0023 SET ENTITY FACING 8C 3
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		setFacing $A,$1         ; 0023 SET ENTITY FACING A 1
		nextText $0,$89         ; "Oh, thank you!{W1}"
		setFacing $89,$2        ; 0023 SET ENTITY FACING 89 2
		setFacing $1F,$0        ; 0023 SET ENTITY FACING 1F 0
		nextText $0,$89         ; "Oddler, {LEADER} will{N}take you.{W2}"
		nextSingleText $0,$89   ; "You can trust him!{W1}"
		setFacing $8C,$0        ; 0023 SET ENTITY FACING 8C 0
		jump cs_58D4C           ; 000B JUMP 58D4C
cs_58BEA:       textCursor $605         ; 0004 INIT TEXT CURSOR 605 : "Wait, wait!{W1}"
		nextSingleText $0,$8C   ; "Wait, wait!{W1}"
		entityPosDir $8C,$E,$15,$3; 0019 SET ENTITY POS AND FACING 8C E 15 3
		setCamDest $A,$12       ; 0032 SET CAMERA DEST A 12
		moveEntity $8C,$FF,$3,$3; 002D MOVE ENTITY 8C FF 3 3
		endMove $8080
		nextSingleText $0,$8C   ; "Please, let me go with you!{W1}"
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $A,$FF,eas_Init; 0015 SET ACTSCRIPT A FF 460CE
		entityPosDir $0,$E,$1E,$1; 0019 SET ENTITY POS AND FACING 0 E 1E 1
		entityPosDir $7,$F,$1E,$1; 0019 SET ENTITY POS AND FACING 7 F 1E 1
		entityPosDir $A,$D,$1E,$1; 0019 SET ENTITY POS AND FACING A D 1E 1
		setCamDest $A,$16       ; 0032 SET CAMERA DEST A 16
		textCursor $5F3         ; 0004 INIT TEXT CURSOR 5F3 : "{LEADER}, will you take{N}"
		nextText $80,$7         ; "{LEADER}, will you take{N}"
		nextText $80,$7         ; "him with us?{W1}"
		yesNo                   ; 0011 STORY YESNO PROMPT
		jumpIfFlagSet $59,cs_58D4C; YES/NO prompt answer
		textCursor $607         ; 0004 INIT TEXT CURSOR 607 : "Huh?{W1}"
		hideText                ; 0009 HIDE TEXTBOX AND PORTRAIT
		nextSingleText $0,$8C   ; "Huh?{W1}"
		customActscript $8C,$FF ; 0014 SET MANUAL ACTSCRIPT 8C
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $89,$3        ; 0023 SET ENTITY FACING 89 3
		moveEntity $8C,$FF,$3,$3; 002D MOVE ENTITY 8C FF 3 3
		endMove $8080
		setFacing $8C,$1        ; 0023 SET ENTITY FACING 8C 1
		customActscript $8C,$FF ; 0014 SET MANUAL ACTSCRIPT 8C
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		removeEntityShadow $8C  ; 0030 REMOVE ENTITY SHADOW 8C (null) (null)
		csWait $1E
		moveEntity $0,$0,$1,$2  ; 002D MOVE ENTITY 0 0 1 2
		endMove $8080
		moveEntity $7,$0,$1,$2  ; 002D MOVE ENTITY 7 0 1 2
		endMove $8080
		moveEntity $A,$FF,$1,$2 ; 002D MOVE ENTITY A FF 1 2
		endMove $8080
		nextText $80,$7         ; "Watch out!{W2}"
		nextSingleText $80,$7   ; "Be careful.{W1}"
		setActscript $8C,$FF,eas_Init; 0015 SET ACTSCRIPT 8C FF 460CE
		setFacing $8C,$3        ; 0023 SET ENTITY FACING 8C 3
		entityShakeHead $8C     ; 0027 MAKE ENTITY SHAKE HEAD 8C
		entityNod $8C           ; 0026 MAKE ENTITY NOD 8C
		nextSingleText $0,$8C   ; "Yes, I will....{W1}"
		csWait $32
		setFacing $8C,$1        ; 0023 SET ENTITY FACING 8C 1
		csWait $32
		setFacing $8C,$3        ; 0023 SET ENTITY FACING 8C 3
		nextText $0,$8C         ; "As long as I'm here the{N}devils will return.{W2}"
		nextSingleText $0,$8C   ; "Maybe {LEADER} is strong{N}enough to resist them?{W1}"
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		setFacing $8C,$0        ; 0023 SET ENTITY FACING 8C 0
		nextSingleText $80,$7   ; "But, you may be injured!{W1}"
		setFacing $8C,$3        ; 0023 SET ENTITY FACING 8C 3
		setFacing $0,$2         ; 0023 SET ENTITY FACING 0 2
		setFacing $A,$0         ; 0023 SET ENTITY FACING A 0
		nextText $0,$A          ; "Well, I think he should come{N}with us.{W2}"
		nextText $0,$A          ; "If we left him here, he{N}could be killed.{W2}"
		nextSingleText $0,$A    ; "It's too dangerous, isn't it,{N}{LEADER}?{W1}"
		moveEntity $7,$FF,$3,$1 ; 002D MOVE ENTITY 7 FF 3 1
		endMove $8080
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		setFacing $0,$0         ; 0023 SET ENTITY FACING 0 0
		nextText $80,$7         ; "He needs a guardian.{W2}"
		nextSingleText $80,$7   ; "I'll take care of him.{W1}"
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		setFacing $8C,$0        ; 0023 SET ENTITY FACING 8C 0
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		nextSingleText $80,$7   ; "OK.  Let's go.{W1}"
		textCursor $5FC         ; 0004 INIT TEXT CURSOR 5FC : "Thank you very much.{W1}"
		entityNod $8C           ; 0026 MAKE ENTITY NOD 8C
		nextSingleText $0,$8C   ; "Thank you very much.{W1}"
		setFacing $8C,$3        ; 0023 SET ENTITY FACING 8C 3
		jump cs_58DD2           ; 000B JUMP 58DD2
cs_58D4C:       textCursor $5FC         ; 0004 INIT TEXT CURSOR 5FC : "Thank you very much.{W1}"
		hideText                ; 0009 HIDE TEXTBOX AND PORTRAIT
		csWait $14
		entityNod $8C           ; 0026 MAKE ENTITY NOD 8C
		nextSingleText $0,$8C   ; "Thank you very much.{W1}"
		customActscript $8C,$FF ; 0014 SET MANUAL ACTSCRIPT 8C
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $89,$3        ; 0023 SET ENTITY FACING 89 3
		moveEntity $8C,$FF,$3,$2; 002D MOVE ENTITY 8C FF 3 2
		endMove $8080
		setFacing $8C,$1        ; 0023 SET ENTITY FACING 8C 1
		customActscript $8C,$FF ; 0014 SET MANUAL ACTSCRIPT 8C
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		removeEntityShadow $8C  ; 0030 REMOVE ENTITY SHADOW 8C (null) (null)
		csWait $1E
		moveEntity $0,$0,$1,$2  ; 002D MOVE ENTITY 0 0 1 2
		endMove $8080
		moveEntity $7,$0,$1,$2  ; 002D MOVE ENTITY 7 0 1 2
		endMove $8080
		moveEntity $A,$FF,$1,$2 ; 002D MOVE ENTITY A FF 1 2
		endMove $8080
		csWait $28
		nextText $80,$7         ; "Watch out!{W2}"
		nextSingleText $80,$7   ; "Be careful.{W1}"
		setActscript $8C,$FF,eas_Init; 0015 SET ACTSCRIPT 8C FF 460CE
		setFacing $8C,$3        ; 0023 SET ENTITY FACING 8C 3
		entityShakeHead $8C     ; 0027 MAKE ENTITY SHAKE HEAD 8C
		entityNod $8C           ; 0026 MAKE ENTITY NOD 8C
		nextSingleText $0,$8C   ; "Yes, I will....{W1}"
cs_58DD2:       textCursor $600         ; 0004 INIT TEXT CURSOR 600 : "I'm Oddler.{N}I was nearly dead when I{N}came here.{W2}"
		nextText $0,$8C         ; "I'm Oddler.{N}I was nearly dead when I{N}came here.{W2}"
		nextText $0,$8C         ; "Actually, I don't remember....{W2}"
		nextText $0,$8C         ; "I don't know the reason why{N}the devils are after me.{W2}"
		nextSingleText $0,$8C   ; "I'm afraid I'll cause you a{N}lot of trouble.{W1}"
		nextSingleText $FF,$FF  ; "{LEADER} decides to{N}take Oddler with him.{W1}"
		csWait $1E
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $8C,$7,$2  ; 002C FOLLOW ENTITY 8C 7 2
		followEntity $A,$8C,$2  ; 002C FOLLOW ENTITY A 8C 2
		setF $44                ; Oddler is a follower
		clearF $4B              ; Luke is a follower
		setF $2CE               ; set after Oddler runs after you as you leave Polca, and tags along
		csc_end
