
; ASM FILE data\maps\entries\map59\mapsetups\s6_21F.asm :
; 0x615D8..0x626A6 : 

; =============== S U B R O U T I N E =======================================

ms_map59_flag21F_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $21F
		beq.s   return_615E4
		lea     cs_615E6(pc), a0
		trap    #6
return_615E4:
		rts

	; End of function ms_map59_flag21F_InitFunction

cs_615E6:       textCursor $EB0         ; 0004 INIT TEXT CURSOR EB0 : "Where am I?{N}What's going on?{W2}"
		setCameraEntity $FFFF   ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		reloadMap $9,$6         ; 0046  9 6
		entityPosDir $0,$C,$B,$1; 0019 SET ENTITY POS AND FACING 0 C B 1
		setPriority $0,$0       ; 0053  0 0
		setPriority $80,$FFFF   ; 0053  80 FFFF
		setBlocks $C,$27,$7,$4,$A,$3; 0034 SET BLOCKS C27 704 A03
		setActscript $82,$FF,eas_46172; 0015 SET ACTSCRIPT 82 FF 46172
		setActscript $80,$FF,eas_46172; 0015 SET ACTSCRIPT 80 FF 46172
		setActscript $83,$FF,eas_46172; 0015 SET ACTSCRIPT 83 FF 46172
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $81,$0,eas_Transparent
						; 0015 SET ACTSCRIPT 81 0 45FA8
		customActscript $86,$FF ; 0014 SET MANUAL ACTSCRIPT 86
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $86,$FF,eas_46172; 0015 SET ACTSCRIPT 86 FF 46172
		moveEntity $86,$0,$3,$1 ; 002D MOVE ENTITY 86 0 3 1
		endMove $8080
		csWait $2
		setActscript $86,$FF,eas_461AA; 0015 SET ACTSCRIPT 86 FF 461AA
		csWait $5
		fadeInB                 ; 0039 FADE IN FROM BLACK
		csWait $28
		nextText $80,$86        ; "Where am I?{N}What's going on?{W2}"
		nextSingleText $80,$86  ; "I...can't...sit up.{W1}"
		entityShiver $86        ; 002A MAKE ENTITY SHIVER 86
		nextSingleText $80,$86  ; "{NAME;28}, is that you?{N}{NAME;28}, what happened?{W1}"
		nextSingleText $0,$1C   ; "King...King Galam...{W1}"
		moveEntity $1C,$FF,$1,$1; 002D MOVE ENTITY 1C FF 1 1
		moreMove $8,$28
		endMove $8080
		setFacing $1C,$3        ; 0023 SET ENTITY FACING 1C 3
		entitySprite $1C,$BA    ; 001A SET ENTITY SPRITE 1C BA
		csWait $14
		nextSingleText $0,$1C   ; "I don't know what to say.{W1}"
		nextText $80,$86        ; "I can't see very well.{N}Am I dying?{W2}"
		nextSingleText $80,$86  ; "I don't want to die!{N}{NAME;28}, tell me why.{W1}"
		entityShiver $86        ; 002A MAKE ENTITY SHIVER 86
		csWait $1E
		entityShiver $1C        ; 002A MAKE ENTITY SHIVER 1C
		csWait $1E
		moveEntity $84,$FF,$0,$2; 002D MOVE ENTITY 84 FF 0 2
		moreMove $1,$4
		endMove $8080
		nextSingleText $0,$84   ; "Poor King Galam.{N}You were possessed by a{N}devil.{W1}"
		entityShiver $86        ; 002A MAKE ENTITY SHIVER 86
		nextText $80,$86        ; "A devil?  I don't understand.{W2}"
		nextSingleText $80,$86  ; "Are you...Elis, Princess{N}of Granseal?{W1}"
		entityNod $84           ; 0026 MAKE ENTITY NOD 84
		nextSingleText $0,$84   ; "Yes.{W1}"
		nextSingleText $80,$86  ; "I have not seen you for a{N}while.  Let me see your face.{W2}"
		entityNod $84           ; 0026 MAKE ENTITY NOD 84
		moveEntity $84,$FF,$1,$1; 002D MOVE ENTITY 84 FF 1 1
		moreMove $0,$1
		moreMove $1,$1
		moreMove $A,$A
		endMove $8080
		stopEntity $84          ; 001C STOP ENTITY ANIM 84
		entitySprite $84,$B1    ; 001A SET ENTITY SPRITE 84 B1
		nextSingleText $80,$84  ; "Can you see me now?{N}King Galam?{W1}"
		entityShiver $86        ; 002A MAKE ENTITY SHIVER 86
		setActscript $86,$FF,eas_Init; 0015 SET ACTSCRIPT 86 FF 460CE
		setActscript $86,$FF,eas_Jump; 0015 SET ACTSCRIPT 86 FF 45E44
		startEntity $86         ; 001B START ENTITY ANIM 86
		startEntity $84         ; 001B START ENTITY ANIM 84
		entitySprite $84,$CC    ; 001A SET ENTITY SPRITE 84 CC
		setFacing $84,$3        ; 0023 SET ENTITY FACING 84 3
		setFacing $86,$3        ; 0023 SET ENTITY FACING 86 3
		setActscript $86,$FF,eas_46172; 0015 SET ACTSCRIPT 86 FF 46172
		customActscript $86,$FF ; 0014 SET MANUAL ACTSCRIPT 86
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $86,$0,$0,$1 ; 002D MOVE ENTITY 86 0 0 1
		endMove $8080
		csWait $5
		setActscript $86,$FF,eas_461AA; 0015 SET ACTSCRIPT 86 FF 461AA
		moveEntity $86,$0,$1,$1 ; 002D MOVE ENTITY 86 0 1 1
		endMove $8080
		csWait $2
		setActscript $86,$FF,eas_461AA; 0015 SET ACTSCRIPT 86 FF 461AA
		nextSingleText $FF,$FF  ; "King Galam grabbed Elis'{N}arms!{W1}"
		setActscript $84,$FF,eas_46172; 0015 SET ACTSCRIPT 84 FF 46172
		customActscript $86,$FF ; 0014 SET MANUAL ACTSCRIPT 86
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $84,$FF ; 0014 SET MANUAL ACTSCRIPT 84
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		entitySprite $1C,$1C    ; 001A SET ENTITY SPRITE 1C 1C
		setFacing $1C,$0        ; 0023 SET ENTITY FACING 1C 0
		setCamDest $7,$5        ; 0032 SET CAMERA DEST 7 5
		moveEntity $84,$0,$1,$1 ; 002D MOVE ENTITY 84 0 1 1
		moreMove $2,$1
		endMove $8080
		moveEntity $86,$FF,$1,$1; 002D MOVE ENTITY 86 FF 1 1
		moreMove $2,$1
		endMove $8080
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $7,$0,eas_Jump; 0015 SET ACTSCRIPT 7 0 45E44
		setActscript $85,$0,eas_Jump; 0015 SET ACTSCRIPT 85 0 45E44
		setActscript $1C,$FF,eas_Jump; 0015 SET ACTSCRIPT 1C FF 45E44
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $7,$0,eas_Jump; 0015 SET ACTSCRIPT 7 0 45E44
		setActscript $85,$0,eas_Jump; 0015 SET ACTSCRIPT 85 0 45E44
		setActscript $1C,$FF,eas_Jump; 0015 SET ACTSCRIPT 1C FF 45E44
		csWait $14
		moveEntity $1C,$FF,$1,$1; 002D MOVE ENTITY 1C FF 1 1
		moreMove $8,$1
		endMove $8080
		nextText $0,$1C         ; "What are you doing?{W2}"
		nextSingleText $0,$1C   ; "King Galam!{N}You're standing?!{W1}"
		setFacing $86,$2        ; 0023 SET ENTITY FACING 86 2
		nextSingleText $80,$86  ; "Ha, ha, ha!{N}Galam?{W1}"
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $A
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $A
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $A
		setActscript $86,$FF,eas_Init; 0015 SET ACTSCRIPT 86 FF 460CE
		entitySprite $86,$A3    ; 001A SET ENTITY SPRITE 86 A3
		entityShiver $86        ; 002A MAKE ENTITY SHIVER 86
		playSound MUSIC_ZEON_ATTACK; 0005 PLAY SOUND MUSIC_ZEON_ATTACK
		nextSingleText $80,$86  ; "I'm not Galam, you fools!{W1}"
		setActscript $84,$0,eas_Jump; 0015 SET ACTSCRIPT 84 0 45E44
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $7,$0,eas_Jump; 0015 SET ACTSCRIPT 7 0 45E44
		setActscript $85,$0,eas_Jump; 0015 SET ACTSCRIPT 85 0 45E44
		setActscript $1C,$FF,eas_Jump; 0015 SET ACTSCRIPT 1C FF 45E44
		setActscript $84,$0,eas_Jump; 0015 SET ACTSCRIPT 84 0 45E44
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $7,$0,eas_Jump; 0015 SET ACTSCRIPT 7 0 45E44
		setActscript $85,$0,eas_Jump; 0015 SET ACTSCRIPT 85 0 45E44
		setActscript $1C,$FF,eas_Jump; 0015 SET ACTSCRIPT 1C FF 45E44
		setActscript $84,$FF,eas_46172; 0015 SET ACTSCRIPT 84 FF 46172
		setActscript $84,$0,eas_AnimSpeedx2
						; 0015 SET ACTSCRIPT 84 0 45FB2
		nextSingleText $80,$7   ; "Zeon!{W1}"
		setActscript $1C,$FF,eas_46172; 0015 SET ACTSCRIPT 1C FF 46172
		customActscript $1C,$FF ; 0014 SET MANUAL ACTSCRIPT 1C
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1C,$FF,$2,$1; 002D MOVE ENTITY 1C FF 2 1
		endMove $8080
		nextSingleText $0,$1C   ; "How?!{N}You died!{W1}"
		nextText $80,$86        ; "Never!{N}You don't know anything{N}about me!{W2}"
		nextText $80,$86        ; "I can't be killed by the{N}sword.{W2}"
		setFacing $86,$3        ; 0023 SET ENTITY FACING 86 3
		entityShiver $86        ; 002A MAKE ENTITY SHIVER 86
		nextSingleText $80,$86  ; "All you can do is weaken me.{W1}"
		csWait $14
		entityShiver $85        ; 002A MAKE ENTITY SHIVER 85
		nextText $80,$85        ; "Yes, Mitula told us to{N}weaken him!{W2}"
		nextSingleText $80,$85  ; "I should have remembered{N}that before Elis was{N}captured!{W1}"
		nextSingleText $0,$1C   ; "Y...you fiend!{W1}"
		setActscript $1C,$FF,eas_Init; 0015 SET ACTSCRIPT 1C FF 460CE
		customActscript $1C,$FF ; 0014 SET MANUAL ACTSCRIPT 1C
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1C,$FF,$0,$1; 002D MOVE ENTITY 1C FF 0 1
		endMove $8080
		setFacing $86,$2        ; 0023 SET ENTITY FACING 86 2
		nextSingleText $80,$86  ; "Stop!  Do you want me to kill{N}Elis?!{W1}"
		entityShiver $1C        ; 002A MAKE ENTITY SHIVER 1C
		nextSingleText $0,$1C   ; "Scoundrel!{N}We have to save her!{W1}"
		setCamDest $8,$5        ; 0032 SET CAMERA DEST 8 5
		csWait $1E
		setFacing $86,$3        ; 0023 SET ENTITY FACING 86 3
		nextSingleText $0,$86   ; "{LEADER}!  Phoenix!{N}Come here!{W1}"
		csWait $14
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		setFacing $0,$0         ; 0023 SET ENTITY FACING 0 0
		csWait $14
		nextSingleText $80,$7   ; "Well, {LEADER}.{N}What should we do?{W1}"
		nextText $0,$86         ; "Quickly!  My time is short,{N}but I can still choke her!{W2}"
		nextSingleText $0,$86   ; "Get over here, NOW!{W1}"
		csWait $14
		nextSingleText $80,$7   ; "We have no choice....{W1}"
		entityNod $0            ; 0026 MAKE ENTITY NOD 0
		nextSingleText $FF,$FF  ; "{LEADER} nods hopelessly.{W1}"
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		csWait $1E
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $7,$FF  ; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $0,$0,$1,$1  ; 002D MOVE ENTITY 0 0 1 1
		endMove $8080
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		nextText $0,$86         ; "That's far enough.{N}Now, phoenix.{W2}"
		nextSingleText $0,$86   ; "Take the Jewel of Evil{N}from {LEADER}!{W1}"
		csWait $14
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		csWait $32
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		csWait $1E
		nextSingleText $80,$7   ; "But, we can't remove it.{W1}"
		setActscript $86,$FF,eas_Jump; 0015 SET ACTSCRIPT 86 FF 45E44
		setActscript $86,$FF,eas_Jump; 0015 SET ACTSCRIPT 86 FF 45E44
		nextSingleText $0,$86   ; "Shut up!  Do it!{W1}"
		nextSingleText $80,$7   ; "But...{W1}"
		csWait $1E
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		setFacing $0,$0         ; 0023 SET ENTITY FACING 0 0
		csWait $14
		moveEntity $0,$FF,$0,$1 ; 002D MOVE ENTITY 0 FF 0 1
		endMove $8080
		csWait $1E
		customActscript $7,$FF  ; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $7,$0,$2,$1  ; 002D MOVE ENTITY 7 0 2 1
		endMove $8080
		csWait $F
		setActscript $7,$FF,eas_461AA; 0015 SET ACTSCRIPT 7 FF 461AA
		nextSingleText $FF,$FF  ; "{NAME;7} tugs at the{N}jewel.{W1}"
		csWait $14
		nextSingleText $80,$7   ; "Nope.  Let me try this.{W1}"
		entityShiver $7         ; 002A MAKE ENTITY SHIVER 7
		nextSingleText $FF,$FF  ; "{NAME;7} removed the{N}jewel from {LEADER}'s neck.{W1}"
		setActscript $7,$FF,eas_46172; 0015 SET ACTSCRIPT 7 FF 46172
		moveEntity $7,$0,$0,$1  ; 002D MOVE ENTITY 7 0 0 1
		endMove $8080
		csWait $F
		setActscript $7,$FF,eas_461AA; 0015 SET ACTSCRIPT 7 FF 461AA
		nextSingleText $80,$7   ; "Oh, my!{W1}"
		csWait $1E
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		nextSingleText $80,$7   ; "What should I do with it?{W1}"
		csWait $14
		setFacing $86,$0        ; 0023 SET ENTITY FACING 86 0
		nextSingleText $0,$86   ; "Put it in front of me.{W1}"
		csWait $14
		entityNod $7            ; 0026 MAKE ENTITY NOD 7
		nextSingleText $80,$7   ; "OK....{W1}"
		moveEntity $7,$FF,$1,$2 ; 002D MOVE ENTITY 7 FF 1 2
		moreMove $A,$1
		endMove $8080
		setFacing $86,$0        ; 0023 SET ENTITY FACING 86 0
		csWait $14
		entityNod $7            ; 0026 MAKE ENTITY NOD 7
		csWait $14
		nextSingleText $FF,$FF  ; "{NAME;7} put the jewel on{N}the ground.{W1}"
		moveEntity $7,$FF,$0,$2 ; 002D MOVE ENTITY 7 FF 0 2
		endMove $8080
		nextSingleText $0,$86   ; "Excellent!{N}Finally, I have it back!{W1}"
		setActscript $86,$FF,eas_46172; 0015 SET ACTSCRIPT 86 FF 46172
		customActscript $86,$FF ; 0014 SET MANUAL ACTSCRIPT 86
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $86,$0,$0,$1 ; 002D MOVE ENTITY 86 0 0 1
		endMove $8080
		moveEntity $84,$FF,$0,$1; 002D MOVE ENTITY 84 FF 0 1
		endMove $8080
		setFacing $86,$3        ; 0023 SET ENTITY FACING 86 3
		csWait $1E
		entityNod $86           ; 0026 MAKE ENTITY NOD 86
		nextSingleText $FF,$FF  ; "Zeon picks up the jewel.{W1}"
		csWait $28
		playSound SFX_SPELL_CAST; 0005 PLAY SOUND SFX_SPELL_CAST
		entityFlashWhite $86,$14; 0018 FLASH ENTITY WHITE 86 14
		csWait $14
		playSound SFX_SPELL_CAST; 0005 PLAY SOUND SFX_SPELL_CAST
		entityFlashWhite $86,$14; 0018 FLASH ENTITY WHITE 86 14
		csWait $14
		playSound SFX_SPELL_CAST; 0005 PLAY SOUND SFX_SPELL_CAST
		entityFlashWhite $86,$14; 0018 FLASH ENTITY WHITE 86 14
		csWait $14
		nextSingleText $0,$86   ; "Oh...oh...I feel my powers{N}returning!{W1}"
		setFacing $85,$1        ; 0023 SET ENTITY FACING 85 1
		entityShiver $85        ; 002A MAKE ENTITY SHIVER 85
		nextText $80,$85        ; "Zeon is reviving.{N}We have to stop him!{W2}"
		nextSingleText $80,$85  ; "How?  Mitula!  Volcanon!{N}Tell me!{W1}"
		entityShiver $85        ; 002A MAKE ENTITY SHIVER 85
		nextSingleText $0,$86   ; "Ha, ha!  Astral!{N}I'll have revived fully in a{N}few minutes.{W1}"
		entityShiver $85        ; 002A MAKE ENTITY SHIVER 85
		nextSingleText $0,$86   ; "You did a good job, Elis.{N}You may take a rest now.{W1}"
		nextSingleText $80,$84  ; "A rest?  Wha...{W1}"
		nextSingleText $FF,$FF  ; "A black cloud envelopes{N}Elis.{W1}"
		entityPosDir $83,$E,$8,$2; 0019 SET ENTITY POS AND FACING 83 E 8 2
		csWait $32
		nextSingleText $80,$84  ; "Ohhh....{W1}"
		csWait $14
		stopEntity $84          ; 001C STOP ENTITY ANIM 84
		customActscript $83,$FF ; 0014 SET MANUAL ACTSCRIPT 83
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $83,$0,$3,$1 ; 002D MOVE ENTITY 83 0 3 1
		endMove $8080
		moveEntity $84,$FF,$3,$1; 002D MOVE ENTITY 84 FF 3 1
		endMove $8080
		setFacing $84,$1        ; 0023 SET ENTITY FACING 84 1
		customActscript $84,$FF ; 0014 SET MANUAL ACTSCRIPT 84
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait $14
		hideEntity $83          ; 002E HIDE ENTITY 83
		moveEntity $1C,$FF,$0,$1; 002D MOVE ENTITY 1C FF 0 1
		endMove $8080
		nextSingleText $0,$1C   ; "Princess!{W1}"
		setFacing $86,$2        ; 0023 SET ENTITY FACING 86 2
		nextSingleText $0,$86   ; "And you too {NAME;28}.{N}So long!{W1}"
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $14
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $14
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $14
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		entityPosDir $82,$C,$8,$2; 0019 SET ENTITY POS AND FACING 82 C 8 2
		animEntityFadeInOut $82,$5; 0022 ANIMATE ENTITY FADE INOUT 82
		setFacing $1C,$3        ; 0023 SET ENTITY FACING 1C 3
		nextSingleText $0,$1C   ; "Aauugghhh!{N}I'm burning!{W1}"
		customActscript $1C,$FF ; 0014 SET MANUAL ACTSCRIPT 1C
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $82,$FF ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $82,$0,$3,$2 ; 002D MOVE ENTITY 82 0 3 2
		endMove $8080
		moveEntity $1C,$FF,$3,$2; 002D MOVE ENTITY 1C FF 3 2
		endMove $8080
		setFacing $1C,$3        ; 0023 SET ENTITY FACING 1C 3
		customActscript $1C,$FF ; 0014 SET MANUAL ACTSCRIPT 1C
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $0,$2         ; 0023 SET ENTITY FACING 0 2
		setFacing $85,$2        ; 0023 SET ENTITY FACING 85 2
		nextSingleText $0,$86   ; "That is special fire.{N}It burns even vampires!{W1}"
		entityShiver $86        ; 002A MAKE ENTITY SHIVER 86
		csWait $14
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		setFacing $85,$1        ; 0023 SET ENTITY FACING 85 1
		nextSingleText $80,$7   ; "NO!{W1}"
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $85,$FF,eas_Init; 0015 SET ACTSCRIPT 85 FF 460CE
		moveEntity $7,$0,$2,$1  ; 002D MOVE ENTITY 7 0 2 1
		endMove $8080
		moveEntity $85,$FF,$1,$1; 002D MOVE ENTITY 85 FF 1 1
		endMove $8080
		setFacing $85,$2        ; 0023 SET ENTITY FACING 85 2
		setFacing $86,$0        ; 0023 SET ENTITY FACING 86 0
		customActscript $7,$FF  ; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $85,$FF ; 0014 SET MANUAL ACTSCRIPT 85
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $7,$FF,eas_46172; 0015 SET ACTSCRIPT 7 FF 46172
		setActscript $85,$FF,eas_46172; 0015 SET ACTSCRIPT 85 FF 46172
		setActscript $86,$0,eas_BumpRight
						; 0015 SET ACTSCRIPT 86 0 45EBC
		entityFlashWhite $86,$28; 0018 FLASH ENTITY WHITE 86 28
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		setCameraEntity $7      ; 0024 SET ENTITY FOLLOWED BY CAMERA 7
		moveEntity $7,$0,$0,$4  ; 002D MOVE ENTITY 7 0 0 4
		endMove $8080
		moveEntity $85,$0,$7,$4 ; 002D MOVE ENTITY 85 0 7 4
		endMove $8080
		playSound SFX_FALLING   ; 0005 PLAY SOUND SFX_FALLING
		waitIdle $85            ; 0016 WAIT UNTIL IDLE ENTITY 85
		playSound SFX_LIGHTNING_2; 0005 PLAY SOUND SFX_LIGHTNING_2
		setQuake $4             ; 0033 SET QUAKE AMOUNT 4
		setEntityDest $86,$D,$8 ; 0029 SET ENTITY DEST 86 D 8
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		customActscript $7,$FF  ; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $85,$1        ; 0023 SET ENTITY FACING 85 1
		customActscript $85,$FF ; 0014 SET MANUAL ACTSCRIPT 85
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait $1E
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setCameraEntity $0      ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		moveEntity $0,$FF,$1,$1 ; 002D MOVE ENTITY 0 FF 1 1
		endMove $8080
		setActscript $0,$FF,eas_BumpUp; 0015 SET ACTSCRIPT 0 FF 45F0C
		nextSingleText $FF,$FF  ; "{LEADER} slapped the jewel{N}out of Zeon's hand.{W1}"
		playSound $FD           ; 0005 PLAY SOUND 
		entityPosDir $81,$E,$8,$3; 0019 SET ENTITY POS AND FACING 81 E 8 3
		setActscript $81,$FF,eas_46172; 0015 SET ACTSCRIPT 81 FF 46172
		moveEntity $81,$0,$0,$2 ; 002D MOVE ENTITY 81 0 0 2
		endMove $8080
		setFacing $86,$3        ; 0023 SET ENTITY FACING 86 3
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		nextSingleText $0,$86   ; "Ouch, darn you {LEADER}!{W1}"
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $0,$FF,eas_46172; 0015 SET ACTSCRIPT 0 FF 46172
		setActscript $86,$0,eas_BumpDown; 0015 SET ACTSCRIPT 86 0 45F34
		entityFlashWhite $86,$A ; 0018 FLASH ENTITY WHITE 86 A
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		moveEntity $0,$0,$3,$5  ; 002D MOVE ENTITY 0 0 3 5
		endMove $8080
		playSound SFX_FALLING   ; 0005 PLAY SOUND SFX_FALLING
		entityFlashWhite $86,$28; 0018 FLASH ENTITY WHITE 86 28
		waitIdle $0             ; 0016 WAIT UNTIL IDLE ENTITY 0
		playSound SFX_LIGHTNING_2; 0005 PLAY SOUND SFX_LIGHTNING_2
		setQuake $4             ; 0033 SET QUAKE AMOUNT 4
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait $1E
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		csWait $1E
		nextSingleText $0,$0    ; "Ohhh....{W1}"
		entityShiver $0         ; 002A MAKE ENTITY SHIVER 0
		nextSingleText $FF,$FF  ; "{LEADER} is stunned.{W1}"
		setCamDest $A,$4        ; 0032 SET CAMERA DEST A 4
		setFacing $86,$3        ; 0023 SET ENTITY FACING 86 3
		stopEntity $86          ; 001C STOP ENTITY ANIM 86
		csWait $5
		setActscript $86,$0,eas_461B6; 0015 SET ACTSCRIPT 86 0 461B6
		csWait $3C
		startEntity $86         ; 001B START ENTITY ANIM 86
		nextSingleText $80,$86  ; "That's what you get!{W1}"
		csWait $1E
		setFacing $86,$0        ; 0023 SET ENTITY FACING 86 0
		csWait $1E
		customActscript $86,$FF ; 0014 SET MANUAL ACTSCRIPT 86
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $86,$FF,$0,$1; 002D MOVE ENTITY 86 FF 0 1
		endMove $8080
		setCamDest $A,$6        ; 0032 SET CAMERA DEST A 6
		entityPosDir $80,$D,$E,$3; 0019 SET ENTITY POS AND FACING 80 D E 3
		animEntityFadeInOut $80,$7; 0022 ANIMATE ENTITY FADE INOUT 80
		csWait $1E
		customActscript $80,$FF ; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$1,$3; 002D MOVE ENTITY 80 FF 1 3
		moreMove $5,$1
		endMove $8080
		csWait $1E
		playSound SFX_PRISM_LASER_FIRING; 0005 PLAY SOUND SFX_PRISM_LASER_FIRING
		entityPosDir $82,$3F,$3F,$2; 0019 SET ENTITY POS AND FACING 82 3F 3F 2
		animEntityFadeInOut $80,$6; 0022 ANIMATE ENTITY FADE INOUT 80
		playSound MUSIC_FINAL_BATTLE; 0005 PLAY SOUND MUSIC_FINAL_BATTLE
		entityShiver $1C        ; 002A MAKE ENTITY SHIVER 1C
		csWait $14
		entityShiver $1C        ; 002A MAKE ENTITY SHIVER 1C
		csWait $14
		setActscript $1C,$FF,eas_Init; 0015 SET ACTSCRIPT 1C FF 460CE
		startEntity $1C         ; 001B START ENTITY ANIM 1C
		setFacing $1C,$3        ; 0023 SET ENTITY FACING 1C 3
		csWait $1E
		nextSingleText $0,$1C   ; "Groovy!{W1}"
		customActscript $1C,$FF ; 0014 SET MANUAL ACTSCRIPT 1C
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1C,$FF,$1,$1; 002D MOVE ENTITY 1C FF 1 1
		endMove $8080
		entityShiver $85        ; 002A MAKE ENTITY SHIVER 85
		nextSingleText $80,$85  ; "{NAME;28}...{W1}"
		moveEntity $1C,$FF,$1,$1; 002D MOVE ENTITY 1C FF 1 1
		moreMove $8,$1
		endMove $8080
		entityShiver $86        ; 002A MAKE ENTITY SHIVER 86
		setCamDest $8,$3        ; 0032 SET CAMERA DEST 8 3
		nextSingleText $80,$86  ; "What?  How?{W1}"
		setFacing $86,$2        ; 0023 SET ENTITY FACING 86 2
		csWait $1E
		nextSingleText $80,$86  ; "{NAME;28}...leave, now!{W1}"
		nextText $0,$1C         ; "King Galam...{W2}"
		nextSingleText $0,$1C   ; "Please stop!{W1}"
		nextSingleText $80,$86  ; "Get away!{W1}"
		nextSingleText $0,$1C   ; "I'll go, but I'll take you{N}with me to another dimension.{W1}"
		moveEntity $1C,$FF,$0,$1; 002D MOVE ENTITY 1C FF 0 1
		endMove $8080
		nextSingleText $80,$86  ; "Die!{W1}"
		setActscript $1C,$FF,eas_46172; 0015 SET ACTSCRIPT 1C FF 46172
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $14
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $14
		moveEntity $1C,$0,$2,$3 ; 002D MOVE ENTITY 1C 0 2 3
		endMove $8080
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $14
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $14
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $14
		waitIdle $1C            ; 0016 WAIT UNTIL IDLE ENTITY 1C
		csWait $14
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		entityPosDir $82,$A,$8,$2; 0019 SET ENTITY POS AND FACING 82 A 8 2
		animEntityFadeInOut $82,$5; 0022 ANIMATE ENTITY FADE INOUT 82
		setCamDest $8,$6        ; 0032 SET CAMERA DEST 8 6
		entityPosDir $80,$D,$E,$3; 0019 SET ENTITY POS AND FACING 80 D E 3
		animEntityFadeInOut $80,$7; 0022 ANIMATE ENTITY FADE INOUT 80
		csWait $1E
		customActscript $80,$FF ; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$FF,$1,$3; 002D MOVE ENTITY 80 FF 1 3
		moreMove $5,$3
		endMove $8080
		csWait $1E
		playSound SFX_PRISM_LASER_FIRING; 0005 PLAY SOUND SFX_PRISM_LASER_FIRING
		entityPosDir $82,$3F,$3F,$2; 0019 SET ENTITY POS AND FACING 82 3F 3F 2
		animEntityFadeInOut $80,$6; 0022 ANIMATE ENTITY FADE INOUT 80
		csWait $28
		setCamDest $8,$3        ; 0032 SET CAMERA DEST 8 3
		nextSingleText $0,$1C   ; "King...Galam...{W1}"
		moveEntity $1C,$FF,$0,$1; 002D MOVE ENTITY 1C FF 0 1
		endMove $8080
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $A
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $A
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $4     ; 0041 FLASH SCREEN WHITE 4
		csWait $A
		moveEntity $1C,$FF,$2,$1; 002D MOVE ENTITY 1C FF 2 1
		endMove $8080
		csWait $32
		moveEntity $1C,$FF,$0,$2; 002D MOVE ENTITY 1C FF 0 2
		endMove $8080
		entityShiver $86        ; 002A MAKE ENTITY SHIVER 86
		csWait $14
		nextText $80,$86        ; "How?  It's not possible!{W2}"
		nextText $80,$86        ; "You can't still be alive!{W2}"
		setFacing $86,$3        ; 0023 SET ENTITY FACING 86 3
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		setFacing $86,$0        ; 0023 SET ENTITY FACING 86 0
		nextSingleText $80,$86  ; "Oh, my powers are fading.{N}Where's the jewel?!{W1}"
		entityShiver $86        ; 002A MAKE ENTITY SHIVER 86
		nextSingleText $0,$1C   ; "My King...come with me....{W1}"
		moveEntity $1C,$FF,$0,$1; 002D MOVE ENTITY 1C FF 0 1
		endMove $8080
		moveEntity $1C,$0,$0,$1 ; 002D MOVE ENTITY 1C 0 0 1
		endMove $8080
		csWait $19
		setActscript $1C,$FF,eas_461AA; 0015 SET ACTSCRIPT 1C FF 461AA
		nextSingleText $80,$86  ; "No, I'll never go back to{N}such a terrible...{W1}"
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		setActscript $86,$FF,eas_46172; 0015 SET ACTSCRIPT 86 FF 46172
		customActscript $86,$FF ; 0014 SET MANUAL ACTSCRIPT 86
		dc.w $10                ;   0010 SET SPEED X=$5 Y=$5
		dc.b 5
		dc.b 5
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $1C,$FF ; 0014 SET MANUAL ACTSCRIPT 1C
		dc.w $10                ;   0010 SET SPEED X=$5 Y=$5
		dc.b 5
		dc.b 5
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $86,$0,$2,$1 ; 002D MOVE ENTITY 86 0 2 1
		endMove $8080
		moveEntity $1C,$0,$2,$1 ; 002D MOVE ENTITY 1C 0 2 1
		endMove $8080
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		waitIdle $86            ; 0016 WAIT UNTIL IDLE ENTITY 86
		nextSingleText $80,$86  ; "I shall return!{N}Remember!{W1}"
		setActscript $1C,$FF,eas_46172; 0015 SET ACTSCRIPT 1C FF 46172
		setActscript $86,$FF,eas_46172; 0015 SET ACTSCRIPT 86 FF 46172
		setFacing $86,$3        ; 0023 SET ENTITY FACING 86 3
		setFacing $1C,$3        ; 0023 SET ENTITY FACING 1C 3
		setPriority $86,$FFFF   ; 0053  86 FFFF
		setPriority $1C,$0      ; 0053  1C 0
		moveEntity $1C,$0,$4,$1 ; 002D MOVE ENTITY 1C 0 4 1
		endMove $8080
		csWait $8
		setActscript $1C,$FF,eas_461AA; 0015 SET ACTSCRIPT 1C FF 461AA
		moveEntity $86,$0,$1,$3 ; 002D MOVE ENTITY 86 0 1 3
		endMove $8080
		moveEntity $1C,$0,$1,$3 ; 002D MOVE ENTITY 1C 0 1 3
		endMove $8080
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		waitIdle $86            ; 0016 WAIT UNTIL IDLE ENTITY 86
		entityShakeHead $86     ; 0027 MAKE ENTITY SHAKE HEAD 86
		playSound SFX_FALLING   ; 0005 PLAY SOUND SFX_FALLING
		setActscript $86,$0,eas_463AE; 0015 SET ACTSCRIPT 86 0 463AE
		setActscript $1C,$FF,eas_463AE; 0015 SET ACTSCRIPT 1C FF 463AE
		nextSingleText $80,$86  ; "Noooooooooo!{W1}"
		csWait $1E
		setQuake $2             ; 0033 SET QUAKE AMOUNT 2
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $14    ; 0041 FLASH SCREEN WHITE 14
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $14    ; 0041 FLASH SCREEN WHITE 14
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $14    ; 0041 FLASH SCREEN WHITE 14
		setBlocks $14,$27,$7,$4,$A,$3; 0034 SET BLOCKS 1427 704 A03
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $14    ; 0041 FLASH SCREEN WHITE 14
		playSound SFX_BLAST_SPELL; 0005 PLAY SOUND SFX_BLAST_SPELL
		flashScreenWhite $14    ; 0041 FLASH SCREEN WHITE 14
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		csWait $3C
		playSound $FD           ; 0005 PLAY SOUND 
		setCameraEntity $7      ; 0024 SET ENTITY FOLLOWED BY CAMERA 7
		csWait $3C
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		startEntity $7          ; 001B START ENTITY ANIM 7
		setFacing $7,$3         ; 0023 SET ENTITY FACING 7 3
		entityShakeHead $7      ; 0027 MAKE ENTITY SHAKE HEAD 7
		csWait $3C
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		csWait $14
		nextSingleText $80,$7   ; "{NAME;28} has taken Zeon{N}away.{W1}"
		playSound MUSIC_SAD_THEME_3; 0005 PLAY SOUND MUSIC_SAD_THEME_3
		setCameraEntity $85     ; 0024 SET ENTITY FOLLOWED BY CAMERA 85
		csWait $1E
		setActscript $85,$FF,eas_Init; 0015 SET ACTSCRIPT 85 FF 460CE
		startEntity $85         ; 001B START ENTITY ANIM 85
		setFacing $85,$3        ; 0023 SET ENTITY FACING 85 3
		entityShakeHead $85     ; 0027 MAKE ENTITY SHAKE HEAD 85
		csWait $1E
		moveEntity $85,$FF,$0,$1; 002D MOVE ENTITY 85 FF 0 1
		moreMove $9,$1
		endMove $8080
		setFacing $7,$3         ; 0023 SET ENTITY FACING 7 3
		nextText $80,$85        ; "It's over.{W2}"
		nextSingleText $80,$85  ; "But, what a tragic ending.{W1}"
		entityNod $7            ; 0026 MAKE ENTITY NOD 7
		csWait $28
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		nextSingleText $80,$7   ; "{LEADER}?  Is he OK?{W1}"
		setCameraEntity $7      ; 0024 SET ENTITY FOLLOWED BY CAMERA 7
		moveEntity $7,$FF,$0,$1 ; 002D MOVE ENTITY 7 FF 0 1
		moreMove $3,$4
		endMove $8080
		moveEntity $85,$0,$3,$4 ; 002D MOVE ENTITY 85 0 3 4
		moreMove $2,$7
		endMove $8080
		moveEntity $7,$FF,$3,$5 ; 002D MOVE ENTITY 7 FF 3 5
		moreMove $2,$6
		endMove $8080
		setFacing $85,$1        ; 0023 SET ENTITY FACING 85 1
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		csWait $28
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		startEntity $0          ; 001B START ENTITY ANIM 0
		setFacing $0,$3         ; 0023 SET ENTITY FACING 0 3
		entityShakeHead $0      ; 0027 MAKE ENTITY SHAKE HEAD 0
		csWait $1E
		nextSingleText $80,$7   ; "{LEADER},  Zeon was{N}taken away by {NAME;28}.{W1}"
		entityNod $0            ; 0026 MAKE ENTITY NOD 0
		nextSingleText $FF,$FF  ; "{LEADER} nods.{W1}"
		csWait $28
		entityShiver $85        ; 002A MAKE ENTITY SHIVER 85
		nextSingleText $80,$85  ; "Oh, is she...is Princess{N}Elis OK?{W1}"
		moveEntity $85,$0,$1,$2 ; 002D MOVE ENTITY 85 0 1 2
		endMove $8080
		moveEntity $7,$FF,$2,$1 ; 002D MOVE ENTITY 7 FF 2 1
		moreMove $1,$1
		endMove $8080
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		setCamDest $8,$5        ; 0032 SET CAMERA DEST 8 5
		moveEntity $0,$0,$1,$5  ; 002D MOVE ENTITY 0 0 1 5
		moreMove $8,$1
		endMove $8080
		moveEntity $85,$0,$1,$5 ; 002D MOVE ENTITY 85 0 1 5
		moreMove $0,$2
		moreMove $1,$1
		moreMove $A,$1
		endMove $8080
		moveEntity $7,$FF,$1,$6 ; 002D MOVE ENTITY 7 FF 1 6
		moreMove $0,$1
		moreMove $9,$1
		endMove $8080
		csWait $14
		setPriority $7,$FFFF    ; 0053  7 FFFF
		setPriority $84,$0      ; 0053  84 0
		setActscript $7,$FF,eas_BumpUp; 0015 SET ACTSCRIPT 7 FF 45F0C
		setActscript $7,$FF,eas_BumpUp; 0015 SET ACTSCRIPT 7 FF 45F0C
		nextSingleText $80,$7   ; "Princess!{W1}"
		nextSingleText $FF,$FF  ; "{NAME;7} shakes her{N}wildly.{W1}"
		csWait $A
		showPortrait $8084      ; 001D SHOW PORTRAIT 8084
		executeSubroutine csub_6269C; 000A EXECUTE SUBROUTINE 6269C
		nextSingleText $80,$84  ; "Elis does not respond.{W1}"
		entityShiver $7         ; 002A MAKE ENTITY SHIVER 7
		nextSingleText $80,$7   ; "She's so cold, and looks so{N}pale.{W2}"
		moveEntity $7,$FF,$0,$1 ; 002D MOVE ENTITY 7 FF 0 1
		moreMove $9,$1
		endMove $8080
		nextSingleText $80,$7   ; "Sir Astral, is she dead?{W1}"
		setFacing $85,$3        ; 0023 SET ENTITY FACING 85 3
		entityShakeHead $85     ; 0027 MAKE ENTITY SHAKE HEAD 85
		nextSingleText $80,$85  ; "I don't think so.{N}Let me see her.{W1}"
		setFacing $85,$2        ; 0023 SET ENTITY FACING 85 2
		csWait $1E
		customActscript $85,$FF ; 0014 SET MANUAL ACTSCRIPT 85
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $85,$FF,eas_46172; 0015 SET ACTSCRIPT 85 FF 46172
		moveEntity $85,$0,$2,$1 ; 002D MOVE ENTITY 85 0 2 1
		endMove $8080
		csWait $10
		setActscript $85,$FF,eas_461AA; 0015 SET ACTSCRIPT 85 FF 461AA
		csWait $28
		nextSingleText $FF,$FF  ; "Astral examines Elis.{W1}"
		csWait $28
		moveEntity $85,$0,$0,$1 ; 002D MOVE ENTITY 85 0 0 1
		endMove $8080
		csWait $10
		setActscript $85,$FF,eas_461AA; 0015 SET ACTSCRIPT 85 FF 461AA
		setFacing $85,$3        ; 0023 SET ENTITY FACING 85 3
		nextText $80,$85        ; "No. She's cold, but she's{N}breathing.{W2}"
		nextSingleText $80,$85  ; "I don't understand....{W1}"
		csWait $32
		playSound $FD           ; 0005 PLAY SOUND 
		nextSingleText $0,$87   ; "She's in a coma.{W1}"
		csWait $5
		setActscript $0,$0,eas_461B6; 0015 SET ACTSCRIPT 0 0 461B6
		csWait $5
		setActscript $85,$0,eas_461B6; 0015 SET ACTSCRIPT 85 0 461B6
		csWait $5
		setActscript $7,$0,eas_461E4; 0015 SET ACTSCRIPT 7 0 461E4
		csWait $78
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		setFacing $85,$1        ; 0023 SET ENTITY FACING 85 1
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		playSound MUSIC_MITULA  ; 0005 PLAY SOUND MUSIC_MITULA
		entityPosDir $87,$D,$7,$3; 0019 SET ENTITY POS AND FACING 87 D 7 3
		playSound SFX_PRISM_LASER_FIRING; 0005 PLAY SOUND SFX_PRISM_LASER_FIRING
		entityFlashWhite $87,$46; 0018 FLASH ENTITY WHITE 87 46
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $85,$0,eas_Jump; 0015 SET ACTSCRIPT 85 0 45E44
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $0,$0,eas_Jump; 0015 SET ACTSCRIPT 0 0 45E44
		setActscript $85,$0,eas_Jump; 0015 SET ACTSCRIPT 85 0 45E44
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		csWait $14
		moveEntity $85,$FF,$1,$1; 002D MOVE ENTITY 85 FF 1 1
		endMove $8080
		setFacing $85,$2        ; 0023 SET ENTITY FACING 85 2
		nextSingleText $80,$85  ; "Goddess Mitula...?{W1}"
		setCamDest $8,$4        ; 0032 SET CAMERA DEST 8 4
		entityNod $87           ; 0026 MAKE ENTITY NOD 87
		nextSingleText $0,$87   ; "Hello, Astral.{N}{LEADER} and {NAME;7},{N}you did very well.{W1}"
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		nextSingleText $0,$7    ; "Mitula!  I knew you would{N}come.{W1}"
		entityShiver $87        ; 002A MAKE ENTITY SHIVER 87
		nextSingleText $0,$87   ; "We've been watching.{W1}"
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		nextSingleText $80,$7   ; "We?  I don't see anybody{N}else?{W1}"
		csWait $5
		setActscript $7,$0,eas_461B6; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $50
		nextSingleText $0,$87   ; "C'mon, {NAME;7}.{N}You know what I mean.{W1}"
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		nextSingleText $80,$7   ; "Volcanon?{W1}"
		setActscript $7,$FF,eas_46172; 0015 SET ACTSCRIPT 7 FF 46172
		customActscript $7,$FF  ; 0014 SET MANUAL ACTSCRIPT 7
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $7,$FF,$3,$1 ; 002D MOVE ENTITY 7 FF 3 1
		endMove $8080
		entityShiver $7         ; 002A MAKE ENTITY SHIVER 7
		csWait $1E
		nextSingleText $0,$87   ; "Yes.  He helped you many{N}times.{W1}"
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		moveEntity $7,$FF,$2,$3 ; 002D MOVE ENTITY 7 FF 2 3
		moreMove $1,$3
		moreMove $8,$1
		endMove $8080
		setCamDest $8,$3        ; 0032 SET CAMERA DEST 8 3
		nextSingleText $80,$7   ; "When?{W1}"
		setFacing $87,$2        ; 0023 SET ENTITY FACING 87 2
		nextText $80,$87        ; "You doubt me?{W2}"
		nextSingleText $80,$87  ; "How about {NAME;28}?{N}God Volcanon protected him{N}from the fire.{W1}"
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		nextSingleText $0,$7    ; "Really?  But he said, he{N}would forsake the people{N}of the earth.{W1}"
		nextText $80,$87        ; "He said that to deceive the{N}devils.{W2}"
		nextText $80,$87        ; "If he had joined you at{N}that time, Zeon would've{N}come to Parmecia.{W2}"
		nextText $80,$87        ; "The entire continent might{N}have been destroyed.{W2}"
		nextSingleText $80,$87  ; "And if Volcanon had joined{N}you, you would've leaned{N}on him, wouldn't you have?{W1}"
		csWait $14
		nextText $80,$85        ; "The Jewel of Light was made{N}by him, wasn't it?{W2}"
		setFacing $0,$0         ; 0023 SET ENTITY FACING 0 0
		setFacing $87,$0        ; 0023 SET ENTITY FACING 87 0
		setActscript $85,$FF,eas_Init; 0015 SET ACTSCRIPT 85 FF 460CE
		moveEntity $85,$FF,$2,$1; 002D MOVE ENTITY 85 FF 2 1
		moreMove $1,$1
		moreMove $A,$1
		endMove $8080
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		nextSingleText $80,$85  ; "It protected {NAME;28}, right?{W1}"
		csWait $14
		setFacing $87,$3        ; 0023 SET ENTITY FACING 87 3
		csWait $1E
		entityShiver $87        ; 002A MAKE ENTITY SHIVER 87
		nextSingleText $0,$87   ; "You're very smart, Astral.{W1}"
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuake $1             ; 0033 SET QUAKE AMOUNT 1
		csWait $5A
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		csWait $14
		nextText $0,$87         ; "I have to go now.{W2}"
		nextSingleText $0,$87   ; "I need the Jewel of Light.{W1}"
		moveEntity $87,$FF,$3,$1; 002D MOVE ENTITY 87 FF 3 1
		endMove $8080
		setFacing $85,$3        ; 0023 SET ENTITY FACING 85 3
		setFacing $7,$3         ; 0023 SET ENTITY FACING 7 3
		csWait $1E
		setActscript $87,$FF,eas_46172; 0015 SET ACTSCRIPT 87 FF 46172
		customActscript $87,$FF ; 0014 SET MANUAL ACTSCRIPT 87
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $87,$0,$3,$1 ; 002D MOVE ENTITY 87 0 3 1
		endMove $8080
		csWait $10
		setActscript $87,$FF,eas_461AA; 0015 SET ACTSCRIPT 87 FF 461AA
		entityFlashWhite $87,$28; 0018 FLASH ENTITY WHITE 87 28
		moveEntity $87,$0,$1,$1 ; 002D MOVE ENTITY 87 0 1 1
		endMove $8080
		csWait $10
		setActscript $87,$FF,eas_461AA; 0015 SET ACTSCRIPT 87 FF 461AA
		nextSingleText $FF,$FF  ; "Mitula took the Jewel of{N}Light from {LEADER}.{W1}"
		entityNod $87           ; 0026 MAKE ENTITY NOD 87
		nextSingleText $0,$87   ; "And I need the Jewel of Evil.{W1}"
		setActscript $87,$FF,eas_Init2; 0015 SET ACTSCRIPT 87 FF 46102
		csWait $A
		moveEntity $87,$FF,$0,$3; 002D MOVE ENTITY 87 FF 0 3
		endMove $8080
		setFacing $85,$0        ; 0023 SET ENTITY FACING 85 0
		setFacing $7,$0         ; 0023 SET ENTITY FACING 7 0
		setFacing $0,$0         ; 0023 SET ENTITY FACING 0 0
		csWait $1E
		entityNod $87           ; 0026 MAKE ENTITY NOD 87
		hideEntity $81          ; 002E HIDE ENTITY 81
		nextSingleText $FF,$FF  ; "Mitula took the Jewel{N}of Evil.{W1}"
		setFacing $87,$2        ; 0023 SET ENTITY FACING 87 2
		csWait $14
		nextText $80,$87        ; "I have to seal Zeon before{N}he regains his power.{W2}"
		nextSingleText $80,$87  ; "You had better leave now.{N}Arc Valley will be destroyed.{W1}"
		setFacing $87,$1        ; 0023 SET ENTITY FACING 87 1
		csWait $1E
		entityFlashWhite $87,$3C; 0018 FLASH ENTITY WHITE 87 3C
		nextSingleText $0,$85   ; "One more thing!{W1}"
		csWait $1E
		setFacing $87,$2        ; 0023 SET ENTITY FACING 87 2
		nextSingleText $80,$87  ; "Yes?{W1}"
		moveEntity $85,$FF,$3,$1; 002D MOVE ENTITY 85 FF 3 1
		moreMove $8,$1
		endMove $8080
		nextSingleText $0,$85   ; "How do we wake Elis up?{W1}"
		nextText $80,$87        ; "She has been poisoned.{W2}"
		nextSingleText $80,$87  ; "When the poison leaves her{N}body, her face will turn pink.{W1}"
		setFacing $85,$3        ; 0023 SET ENTITY FACING 85 3
		csWait $14
		entityNod $85           ; 0026 MAKE ENTITY NOD 85
		nextSingleText $0,$85   ; "Then she will awaken?{W1}"
		csWait $14
		setFacing $85,$0        ; 0023 SET ENTITY FACING 85 0
		nextText $80,$87        ; "If she's still sleeping, she{N}will need a kiss from her{N}true love.{W2}"
		nextSingleText $80,$87  ; "This kiss will awaken her.{W1}"
		entityShiver $85        ; 002A MAKE ENTITY SHIVER 85
		moveEntity $85,$FF,$0,$1; 002D MOVE ENTITY 85 FF 0 1
		endMove $8080
		nextSingleText $0,$85   ; "When will the poison leave?{W1}"
		entityShakeHead $87     ; 0027 MAKE ENTITY SHAKE HEAD 87
		csWait $A
		nextText $80,$87        ; "I have no idea.  It depends{N}on her physical strength.{W2}"
		nextText $80,$87        ; "It may take a few months...{N}or a few years.{W2}"
		nextSingleText $80,$87  ; "Now, I must go.{N}Good luck.{W1}"
		setFacing $87,$1        ; 0023 SET ENTITY FACING 87 1
		csWait $1E
		entityFlashWhite $87,$64; 0018 FLASH ENTITY WHITE 87 64
		hideEntity $87          ; 002E HIDE ENTITY 87
		csWait $32
		playSound $FD           ; 0005 PLAY SOUND 
		moveEntity $7,$FF,$0,$1 ; 002D MOVE ENTITY 7 FF 0 1
		endMove $8080
		nextSingleText $0,$7    ; "She's gone.{W1}"
		customActscript $85,$FF ; 0014 SET MANUAL ACTSCRIPT 85
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $85,$FF,$2,$1; 002D MOVE ENTITY 85 FF 2 1
		moreMove $B,$A
		endMove $8080
		entityShiver $85        ; 002A MAKE ENTITY SHIVER 85
		nextSingleText $80,$85  ; "A few years....{W1}"
		moveEntity $7,$FF,$0,$1 ; 002D MOVE ENTITY 7 FF 0 1
		moreMove $B,$1
		moreMove $D,$1
		moreMove $D,$A
		endMove $8080
		nextText $0,$7          ; "Sir Astral, c'mon!{W2}"
		setFacing $85,$1        ; 0023 SET ENTITY FACING 85 1
		nextSingleText $0,$7    ; "Mitula told us to leave.{W1}"
		entityShiver $85        ; 002A MAKE ENTITY SHIVER 85
		nextSingleText $80,$85  ; "Oh, yeah...let's get out of{N}here!{W1}"
		setActscript $85,$FF,eas_Init; 0015 SET ACTSCRIPT 85 FF 460CE
		moveEntity $85,$FF,$2,$1; 002D MOVE ENTITY 85 FF 2 1
		moreMove $B,$1
		endMove $8080
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		nextSingleText $80,$85  ; "{LEADER}, you carry{N}Princess Elis!{W1}"
		setPriority $0,$0       ; 0053  0 0
		setPriority $84,$FFFF   ; 0053  84 FFFF
		entityNod $0            ; 0026 MAKE ENTITY NOD 0
		csWait $14
		moveEntity $0,$0,$1,$1  ; 002D MOVE ENTITY 0 0 1 1
		endMove $8080
		csWait $2
		setActscript $0,$FF,eas_461AA; 0015 SET ACTSCRIPT 0 FF 461AA
		moveEntity $0,$FF,$0,$1 ; 002D MOVE ENTITY 0 FF 0 1
		moreMove $B,$14
		endMove $8080
		entityNod $0            ; 0026 MAKE ENTITY NOD 0
		hideEntity $84          ; 002E HIDE ENTITY 84
		setFacing $0,$3         ; 0023 SET ENTITY FACING 0 3
		entitySprite $0,$AE     ; 001A SET ENTITY SPRITE 0 AE
		csWait $1E
		csWait $5
		setActscript $7,$0,eas_461B6; 0015 SET ACTSCRIPT 7 0 461B6
		csWait $5
		setActscript $85,$0,eas_461E4; 0015 SET ACTSCRIPT 85 0 461E4
		setQuake $8003          ; 0033 SET QUAKE AMOUNT 8003
		playSound MUSIC_BOSS_ATTACK; 0005 PLAY SOUND MUSIC_BOSS_ATTACK
		nextSingleText $0,$85   ; "Oops!  She's sealing the{N}tower!{W1}"
		moveEntity $0,$0,$3,$1  ; 002D MOVE ENTITY 0 0 3 1
		endMove $8080
		csWait $2
		setActscript $0,$FF,eas_461AA; 0015 SET ACTSCRIPT 0 FF 461AA
		moveEntity $7,$FF,$3,$1 ; 002D MOVE ENTITY 7 FF 3 1
		endMove $8080
		nextSingleText $0,$7    ; "Hurry!{W1}"
		moveEntity $85,$FF,$3,$1; 002D MOVE ENTITY 85 FF 3 1
		moreMove $8,$1
		endMove $8080
		nextSingleText $0,$85   ; "{LEADER}, run!{W1}"
		setPriority $0,$FFFF    ; 0053  0 FFFF
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $85,$7,$2  ; 002C FOLLOW ENTITY 85 7 2
		setActscript $0,$FF,eas_46172; 0015 SET ACTSCRIPT 0 FF 46172
		setCameraEntity $0      ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		moveEntity $0,$0,$3,$1  ; 002D MOVE ENTITY 0 0 3 1
		moreMove $2,$1
		moreMove $3,$A
		endMove $8080
		csWait $3C
cs_62658:       setQuake $5             ; 0033 SET QUAKE AMOUNT 5
		csWait $32
		playSound $FD           ; 0005 PLAY SOUND 
		fadeOutB                ; 003A FADE OUT TO BLACK
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		mapLoad $3,$0,$0        ; 0048 LOAD MAP 3 0 0
		csc36                   ; 0036 RELATED TO LOADING A MAP
		fadeInB                 ; 0039 FADE IN FROM BLACK
		reloadMap $0,$0         ; 0046  0 0
		textCursor $F44         ; 0004 INIT TEXT CURSOR F44 : "Two years have passed{N}since Mitula resealed Zeon.{W1}"
		nextSingleText $FF,$FF  ; "Two years have passed{N}since Mitula resealed Zeon.{W1}"
		nextSingleText $0,$88   ; "Wow, is it true?{N}Did Elis' face turn pink?{W1}"
		clearF $180             ; set after Bowie obtains the jewel of light/evil... whichever it is
		clearF $181             ; set after Bowie obtains King Galam's jewel
		resetForceBattleStats   ; 0055 RESET FORCE BATTLE STATS
		mapSysEvent $3,$38,$3,$3; 0007 EXECUTE MAP SYSTEM EVENT 3380303
		csc_end

; =============== S U B R O U T I N E =======================================

csub_6269C:
		moveq   #1,d0
		jsr     sub_100B8
		rts

	; End of function csub_6269C

