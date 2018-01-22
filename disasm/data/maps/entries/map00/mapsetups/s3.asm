
; ASM FILE data\maps\entries\map00\mapsetups\s3.asm :
; 0x5E3A4..0x5E61E : 
ms_map0_ZoneEvents:
		dc.b $E
		dc.b $C
		dc.w sub_5E3B0-ms_map0_ZoneEvents
		dc.b $F
		dc.b $C
		dc.w sub_5E3B0-ms_map0_ZoneEvents
		dc.w $FD00
		dc.w return_5E3C0-ms_map0_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5E3B0:
		trap    #CHECK_FLAG
		dc.w $321
		bne.s   return_5E3C0
		lea     cs_5E3C2(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $321               ; set after Zalbard taunts you in the scene outside the Mitula Shrine
return_5E3C0:
		rts

	; End of function sub_5E3B0

cs_5E3C2:       textCursor $AAB
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		nextSingleText $0,$80   ; "Welcome, Granseal force!{W1}"
		setActscript $1F,$0,eas_Jump
		setActscript $0,$0,eas_Jump
		setActscript $7,$FF,eas_Jump
		setFacing $7,$3
		nextSingleText $0,$7    ; "What?{W1}"
		csWait $5
		setActscript $7,$0,eas_461B6
		csWait $78
		setFacing $1F,$1
		nextSingleText $0,$1F   ; "I heard a voice from the{N}other side of the door.{W1}"
		setFacing $0,$1
		setEntityDest $801F,$D,$C
		setEntityDest $7,$10,$C
		setFacing $1F,$1
		setFacing $7,$1
		setCamDest $8,$9
		nextSingleText $0,$80   ; "I'm Zalbard.  I'm one of{N}the greater devils.{W1}"
		setActscript $1F,$FF,eas_46172
		setActscript $0,$FF,eas_46172
		setActscript $7,$FF,eas_46172
		moveEntity $1F,$0,$3,$2
		endMove $8080
		moveEntity $0,$0,$3,$1
		endMove $8080
		moveEntity $7,$FF,$3,$2
		endMove $8080
		nextSingleText $0,$80   ; "Do come in.  Of course, you{N}can go back now and abandon{N}Mitula!{W1}"
		setFacing $7,$2
		nextText $0,$7          ; "Sir Astral...{W2}"
		nextSingleText $0,$7    ; "The greater devil that{N}attacked Bedoe was as{N}strong as Volcanon.{W1}"
		nextText $0,$80         ; "Are you talking about{N}Sir Odd Eye?{W2}"
		nextSingleText $0,$80   ; "Did he fight against{N}Volcanon at Bedoe?{W1}"
		setFacing $7,$1
		nextSingleText $0,$1F   ; "Yes.  And he lost.{W1}"
		nextText $0,$80         ; "I can't believe it!{N}Odd Eye is the strongest{N}devil among us.{W2}"
		nextText $0,$80         ; "But, we haven't been able to{N}contact him lately.{W2}"
		nextText $0,$80         ; "This is good news for me.{N}If I get the Jewel of Evil, I{N}can take his place.{W2}"
		nextSingleText $0,$80   ; "Now, enter the shrine.{N}Mitula is here.{W1}"
		csWait $3C
		nextSingleText $0,$7    ; "What should we do?{N}A greater devil awaits us{N}inside.{W1}"
		setFacing $7,$2
		setActscript $1F,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		customActscript $1F,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1F,$FF,$2,$2
		endMove $8080
		nextSingleText $0,$1F   ; "Odd Eye...Odd Eye...{N}Odd...Eye....{W1}"
		nextSingleText $0,$7    ; "Sir Astral?{W1}"
		moveEntity $1F,$FF,$0,$2
		endMove $8080
		nextSingleText $0,$1F   ; "I think I've heard that{N}name before....{W1}"
		moveEntity $7,$FF,$3,$1
		moreMove $2,$3
		endMove $8080
		setFacing $0,$3
		setFacing $7,$1
		setCamDest $9,$C
		setFacing $1F,$3
		setActscript $1F,$FF,eas_46172
		setActscript $7,$FF,eas_46172
		customActscript $7,$FF
		dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
		dc.b 8
		dc.b 8
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $1F,$0,$3,$2
		endMove $8080
		csWait $10
		moveEntity $7,$0,$3,$2
		endMove $8080
		waitIdle $1F
		setActscript $7,$FF,eas_461AA
		nextSingleText $0,$7    ; "Sir Astral?{W1}"
		nextSingleText $0,$1F   ; "Hmmmm....{W1}"
		moveEntity $1F,$0,$3,$2
		endMove $8080
		moveEntity $7,$0,$3,$2
		endMove $8080
		waitIdle $1F
		setActscript $7,$FF,eas_461AA
		nextSingleText $0,$7    ; "Sir Astral!!!{W1}"
		customActscript $1F,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $1F,$FF,eas_Jump
		setActscript $1F,$FF,eas_46172
		moveEntity $1F,$FF,$1,$4
		endMove $8080
		nextSingleText $0,$1F   ; "Whhhhhhat?{N}{NAME;7}, don't scare me!{W1}"
		entityShiver $1F
		customActscript $7,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setCamDest $9,$B
		moveEntity $7,$FF,$1,$3
		endMove $8080
		nextText $0,$7          ; "What's wrong with you?{W2}"
		nextSingleText $0,$7    ; "Should we go into the shrine{N}now?{W1}"
		nextSingleText $0,$1F   ; "Oh, sorry.{W1}"
		customActscript $1F,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $1F,$FF,eas_Init
		moveEntity $1F,$FF,$0,$1
		endMove $8080
		setFacing $1F,$1
		nextText $0,$1F         ; "Zalbard...at least he's not{N}as strong as Odd Eye.{W2}"
		nextText $0,$1F         ; "But still, he's a greater{N}devil.{W2}"
		nextSingleText $0,$1F   ; "We had better complete our{N}preparations before we go in.{W1}"
		nextSingleText $0,$0    ; "OK.{W1}"
		entityNod $7
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		followEntity $1F,$0,$2
		followEntity $7,$1F,$2
		setBlocks $0,$26,$2,$3,$E,$A
		setF $348               ; set after the door to the Mitula Shrine is opened
		csc_end
