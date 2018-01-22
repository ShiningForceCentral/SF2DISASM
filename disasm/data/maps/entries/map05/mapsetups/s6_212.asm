
; ASM FILE data\maps\entries\map05\mapsetups\s6_212.asm :
; 0x6061E..0x60FAE : 

; =============== S U B R O U T I N E =======================================

ms_map5_flag212_InitFunction:
		
		trap    #1
		dc.w $3B0
		bne.s   loc_60630
		lea     cs_607DE(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $3B0               ; set after Lemon jumps off the cliff in Yeel
		bra.s   loc_60636
loc_60630:
		lea     cs_6060E(pc), a0
		trap    #6
loc_60636:
		trap    #CHECK_FLAG
		dc.w $3AE
		bne.s   loc_6067C
		cmpi.l  #$6005580,((ENTITY_DATA_STRUCT_X_AND_START-$1000000)).w
		bne.s   loc_6067C
		trap    #CHECK_FLAG
		dc.w $1C                ; if character 1C joined the Force : Lemon ?
		beq.s   loc_6065E
		lea     cs_60656(pc), a0
		trap    #6
		bra.w   loc_6065E
cs_60656:
		entityPosDir $1C,$1B,$37,$1
		csc_end
loc_6065E:
		lea     cs_60C42(pc), a0
		trap    #6
		trap    #CHECK_FLAG
		dc.w $3A2
		beq.s   loc_60672
		lea     cs_60EB2(pc), a0
		trap    #6
		bra.s   loc_60678
loc_60672:
		lea     cs_60CA4(pc), a0
		trap    #6
loc_60678:
		trap    #SET_FLAG
		dc.w $3AE               ; set after the scene in underground Yeel where Chaz paces and consults books
loc_6067C:
		trap    #CHECK_FLAG
		dc.w $1B
		beq.s   loc_6068C
		move.w  #$1B,d0
		jsr     MoveEntityOutOfMap
loc_6068C:
		trap    #CHECK_FLAG
		dc.w $3B0
		bne.s   loc_6069C
		move.w  #$82,d0 
		jsr     MoveEntityOutOfMap
loc_6069C:
		trap    #CHECK_FLAG
		dc.w $3AD
		beq.s   loc_606B4
		lea     cs_606AC(pc), a0
		trap    #6
		bra.w   loc_606B4
cs_606AC:
		entityPosDir $80,$1A,$32,$3
		csc_end
loc_606B4:
		trap    #1
		dc.w $1C
		beq.s   loc_606BE
		trap    #SET_FLAG
		dc.w $3B1               ; set after recruiting Lemon in Yeel
loc_606BE:
		trap    #CHECK_FLAG
		dc.w $3AC
		beq.s   return_606E8
		trap    #CHECK_FLAG
		dc.w $3AD
		bne.s   return_606E8
		lea     cs_606EA(pc), a0
		trap    #6
		trap    #CHECK_FLAG
		dc.w $1C
		beq.s   return_606E8
		lea     cs_606E0(pc), a0
		trap    #6
		bra.w   return_606E8
cs_606E0:
		entityPosDir $1C,$B,$A,$1
		csc_end
return_606E8:
		rts

	; End of function ms_map5_flag212_InitFunction

cs_606EA:       entityPosDir $0,$B,$A,$1
		entityPosDir $7,$B,$A,$1
		entityPosDir $1F,$B,$A,$1
		csWait $1
		reloadMap $5,$4
		csWait $A
		csc_end
cs_60708:       textCursor $DB9
		entityPosDir $1C,$15,$21,$3
		setActscript $1C,$FF,eas_Init
		nextSingleText $80,$1C  ; "Sir Astral!  {LEADER}!{W1}"
		setCamDest $10,$1C
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		entityPosDir $0,$15,$27,$1
		entityPosDir $7,$16,$27,$1
		entityPosDir $1F,$14,$27,$1
		nextSingleText $80,$1C  ; "{LEADER}, wait!{W1}"
		moveEntity $1C,$FF,$3,$2
		endMove $8080
		setCamDest $10,$21
		nextSingleText $80,$1C  ; "May I join your force?{W1}"
		csWait $32
		nextSingleText $0,$1F   ; "Well...{W1}"
		csWait $1E
		nextText $80,$1C        ; "You can trust me.{N}I'm a born fighter.{W2}"
		nextText $80,$1C        ; "As you know, I want to die.{W2}"
		nextSingleText $80,$1C  ; "I will die fighting for your{N}cause, if you let me.{W1}"
		csWait $28
		setFacing $1F,$0
		setFacing $0,$2
		setFacing $7,$2
		nextSingleText $0,$1F   ; "He's a hero in Galam.{N}I think he should join us.{W1}"
		entityNod $0
		entityNod $7
		csWait $14
		moveEntity $0,$0,$1,$3
		endMove $8080
		moveEntity $7,$0,$1,$4
		moreMove $A,$1
		endMove $8080
		moveEntity $1F,$FF,$1,$4
		moreMove $8,$1
		endMove $8080
		nextSingleText $0,$1F   ; "{NAME;28}, please come{N}with us.  You'll be a great{N}help.{W1}"
		join $1C
		setActscript $1C,$FF,eas_Jump
		setActscript $1C,$FF,eas_Jump
		nextSingleText $80,$1C  ; "Oh, thank you!  I know I can{N}take the King of the Devils!{W1}"
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $1C,$1F,$2
		csc_end
cs_607DE:       textCursor $D3C
		entityPosDir $82,$3F,$3F,$3
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		entityPosDir $0,$15,$27,$1
		entityPosDir $7,$16,$28,$1
		entityPosDir $1F,$14,$28,$1
		reloadMap $10,$22
		fadeInB
		nextSingleText $0,$1C   ; "I'm guilty!{W1}"
		csWait $5
		setActscript $0,$0,eas_461B6
		csWait $5
		setActscript $7,$0,eas_461E4
		csWait $5
		setActscript $1F,$0,eas_461B6
		csWait $50
		moveEntity $7,$FF,$1,$2
		endMove $8080
		setFacing $0,$1
		setFacing $1F,$1
		nextSingleText $0,$7    ; "Hey, there's {NAME;28}.{W1}"
		setCamDest $D,$1C
		nextText $0,$1C         ; "I've killed a lot of people{N}for the devils!{W2}"
		setFacing $1C,$3
		entityShiver $1C
		nextSingleText $0,$1C   ; "The guilt is too much to{N}handle.  I must die!{W1}"
		setActscript $1C,$FF,eas_46172
		customActscript $1C,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		entityNod $1C
		csWait $1E
		moveEntity $1C,$FF,$1,$5
		moreMove $0,$3
		endMove $8080
		setFacing $1C,$3
		customActscript $1C,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $2
		dc.w 2
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		setActscript $1C,$FF,eas_46172
		playSound SFX_FALLING
		moveEntity $1C,$FF,$3,$6
		endMove $8080
		entityPosDir $1C,$3F,$3F,$3
		entityPosDir $82,$13,$21,$3
		setQuake $5
		csWait $3C
		setQuake $0
		setCamDest $10,$22
		moveEntity $7,$FF,$2,$1
		moreMove $1,$1
		endMove $8080
		setActscript $7,$FF,eas_Jump
		setActscript $7,$FF,eas_Jump
		setFacing $7,$3
		nextSingleText $0,$7    ; "Gee!{N}{NAME;28} killed himself!{W1}"
		moveEntity $1F,$FF,$1,$2
		endMove $8080
		setFacing $0,$2
		setFacing $7,$2
		nextText $0,$1F         ; "No, {NAME;28} cannot die{N}by jumping off a cliff.{W2}"
		setFacing $1F,$0
		nextText $0,$1F         ; "{NAME;28} is an immortal{N}vampire.{W2}"
		nextSingleText $0,$1F   ; "But, I'm sure the impact{N}didn't feel too good.{W1}"
		entityNod $0
		entityNod $7
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		setActscript $1C,$FF,eas_Init
		startEntity $1C
		csc_end
cs_6093A:       textCursor $D44
		setPriority $1B,$0
		setPriority $80,$FFFF
		setCamDest $6,$2
		setActscript $1C,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setFacing $1C,$1
		setEntityDest $0,$B,$7
		setEntityDest $7,$B,$7
		setEntityDest $1F,$B,$7
		moveEntity $7,$FF,$0,$1
		moreMove $9,$1
		endMove $8080
		moveEntity $1F,$FF,$2,$1
		moreMove $9,$1
		endMove $8080
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		nextText $80,$80        ; "Ah, devils finally found the{N}hidden door.{W1}"
		nextSingleText $80,$80  ; "I must give the people time{N}to escape!{W1}"
		nextSingleText $FF,$FF  ; "The priest pulls out a holy{N}symbol.{W1}"
		setPriority $83,$FFFF
		setPriority $80,$0
		playSound SFX_LANDSTALKER_ITEM
		entityPosDir $83,$B,$4,$3
		csWait $3C
		moveEntity $83,$0,$3,$1
		endMove $8080
		moveEntity $80,$FF,$3,$1
		endMove $8080
		entityShiver $80
		setFacing $0,$2
		setFacing $7,$2
		nextSingleText $80,$7   ; "What's he doing?{W1}"
		nextSingleText $0,$1F   ; "He's mistaking us for devils.{W1}"
		hideEntity $83
		csWait $14
		entityShiver $80
		setFacing $7,$1
		setFacing $0,$1
		nextText $80,$80        ; "What tough devils!{W2}"
		nextSingleText $80,$80  ; "My symbol doesn't drive{N}them away!{W1}"
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$1F   ; "Excuse me, we're not devils.{W1}"
		entityShiver $80
		nextSingleText $80,$80  ; "I don't believe you!{W1}"
		nextSingleText $80,$7   ; "But we really...{W1}"
		setPriority $1B,$0
		setPriority $80,$FFFF
		entityPosDir $1B,$B,$4,$3
		csWait $1E
		nextSingleText $0,$1B   ; "Brother?{W1}"
		setFacing $80,$1
		setActscript $80,$FF,eas_Jump
		setActscript $80,$FF,eas_Jump
		nextText $80,$80        ; "{NAME;27}, they found the{N}hidden door!{W2}"
		nextSingleText $80,$80  ; "I tried to drive them away{N}with this holy symbol, but{N}I failed.{W1}"
		setPriority $80,$0
		entityNod $1B
		nextSingleText $0,$1B   ; "Then, they're not devils.{W1}"
		entityShiver $80
		nextSingleText $80,$80  ; "Nobody but devils ever come{N}to such a dangerous place!{N}They must be devils!{W1}"
		csWait $14
		nextSingleText $0,$1B   ; "Have you asked them?{W1}"
		moveEntity $1F,$FF,$0,$1
		moreMove $9,$1
		moreMove $D,$1
		moreMove $D,$1
		endMove $8080
		nextText $80,$1F        ; "How can we explain this?{W2}"
		nextSingleText $80,$1F  ; "We are from Granseal.{N}We came here to defeat the{N}devils.{W1}"
		setFacing $80,$3
		entityShiver $1B
		nextSingleText $0,$1B   ; "Granseal?{W1}"
		moveEntity $80,$FF,$2,$1
		moreMove $8,$1
		endMove $8080
		csWait $14
		nextSingleText $0,$1B   ; "Really?{W1}"
		moveEntity $1B,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$1B   ; "Alright!{W1}"
		csWait $28
		nextSingleText $0,$1B   ; "This is great news!{W1}"
		setActscript $1B,$FF,eas_Jump
		setActscript $1B,$FF,eas_Jump
		nextSingleText $0,$1B   ; "Are you Sir Astral?{W1}"
		entityNod $1F
		nextSingleText $80,$1F  ; "Yes, but...I'm sorry, have{N}we met?{W1}"
		nextText $0,$1B         ; "I'm {NAME;27}, a son of{N}Hawel.{W2}"
		nextSingleText $0,$1B   ; "Do you remember me?{W1}"
		setActscript $1F,$FF,eas_Jump
		setActscript $1F,$FF,eas_Jump
		nextSingleText $80,$1F  ; "Hawel's son?{W1}"
		moveEntity $1F,$FF,$0,$1
		moreMove $1,$1
		moreMove $A,$1
		endMove $8080
		setFacing $1B,$0
		entityShiver $1F
		nextText $80,$1F        ; "Oh, {NAME;27}!{W2}"
		nextText $80,$1F        ; "Yes, of course.{N}Nice to see you again.{W2}"
		nextSingleText $80,$1F  ; "What are you doing here?{W1}"
		csc_end
cs_60B10:       textCursor $D62
		nextSingleText $0,$1B   ; "I came back to Yeel to{N}continue my father's work.{W1}"
		nextSingleText $80,$1F  ; "{NAME;27}, maybe you can{N}answer some questions?{W1}"
		entityNod $1B
		nextText $0,$1B         ; "I'll try.{W2}"
		nextSingleText $0,$1B   ; "What would you like to know?{W1}"
		setActscript $1F,$FF,eas_Jump
		setActscript $1F,$FF,eas_Jump
		nextSingleText $80,$1F  ; "Oh, this will be a great{N}help!{W1}"
		moveEntity $80,$FF,$3,$1
		moreMove $0,$1
		moreMove $9,$1
		endMove $8080
		setFacing $1B,$3
		setFacing $1F,$3
		nextSingleText $0,$80   ; "You can use the room below.{W1}"
		moveEntity $1F,$FF,$3,$1
		moreMove $A,$1
		endMove $8080
		setFacing $80,$0
		nextSingleText $80,$1F  ; "Thank you very much.{W1}"
		setFacing $1F,$3
		nextSingleText $80,$1F  ; "I really appreciate this.{W1}"
		csWait $14
		moveEntity $1B,$0,$1,$1
		endMove $8080
		moveEntity $80,$FF,$1,$1
		endMove $8080
		entityPosDir $1B,$3F,$3F,$3
		moveEntity $80,$FF,$1,$1
		endMove $8080
		entityPosDir $80,$3F,$3F,$3
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		csc_end
cs_60BA6:       textCursor $D6A
		nextSingleText $0,$1B   ; "I heard you're going to{N}defeat the devils....{W1}"
		entityNod $1F
		nextSingleText $0,$1F   ; "Yep.  {LEADER} just{N}solved the secret.  We{N}can now enter the tower.{W1}"
		nextText $0,$1B         ; "The tower?{W2}"
		nextSingleText $0,$1B   ; "Then, all these disasters{N}were caused by Zeon?{W1}"
		csWait $1E
		moveEntity $80,$FF,$3,$1
		moreMove $0,$1
		moreMove $9,$1
		endMove $8080
		setFacing $1F,$3
		setFacing $1B,$3
		nextSingleText $0,$80   ; "Let me help you.{W1}"
		csWait $5
		setActscript $80,$0,eas_461E4
		csWait $78
		nextSingleText $0,$80   ; "I would like to give you{N}a hand.{W1}"
		moveEntity $1F,$FF,$3,$1
		moreMove $A,$1
		endMove $8080
		setFacing $80,$0
		nextSingleText $0,$1F   ; "Oh, thank you.{W1}"
		setFacing $1F,$3
		nextSingleText $80,$1F  ; "I appreciate your kindness.{W1}"
		csWait $14
		moveEntity $1B,$0,$1,$1
		endMove $8080
		moveEntity $80,$FF,$1,$1
		endMove $8080
		entityPosDir $1B,$3F,$3F,$3
		moveEntity $80,$FF,$1,$1
		endMove $8080
		entityPosDir $80,$3F,$3F,$3
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $1C,$1F,$2
		csc_end
cs_60C42:       textCursor $D72
		setActscript $1C,$FF,eas_Init
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		entityPosDir $0,$1C,$36,$2
		entityPosDir $7,$1C,$37,$2
		entityPosDir $1F,$1B,$35,$2
		entityPosDir $80,$1A,$32,$3
		entityPosDir $1B,$19,$35,$0
		setCameraEntity $FFFF
		reloadMap $13,$30
		fadeInB
		csWait $3C
		nextSingleText $80,$1F  ; "...and now we're here.{W1}"
		nextText $0,$1B         ; "Wow!  Your story is so{N}complicated.{W2}"
		nextText $0,$1B         ; "But, from what I understand,{N}Zeon is reviving.{W2}"
		nextSingleText $0,$1B   ; "And all these disasters were{N}caused by him?{W1}"
		csc_end
cs_60CA4:       textCursor $D76
		entityNod $1F
		nextSingleText $80,$1F  ; "That's right.  We have to{N}find out where the Holy{N}Sword is.{W1}"
		csWait $14
		nextText $0,$1B         ; "I think I've seen it in a{N}book....{W2}"
		entityShiver $1B
		nextSingleText $0,$1B   ; "Yes, I did...but...{N}I don't remember....{W1}"
		setFacing $1B,$2
		csWait $28
		entityShiver $1F
		nextSingleText $80,$1F  ; "It's important...{W1}"
		setFacing $1B,$0
		nextSingleText $0,$1B   ; "Please, give me a moment.{W1}"
		setFacing $1B,$2
		csWait $3C
		customActscript $1B,$FF
		dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $1B,$FF,$2,$2
		moreMove $A,$14
		moreMove $8,$14
		moreMove $0,$2
		moreMove $C,$14
		endMove $8080
		setFacing $1B,$2
		csWait $14
		moveEntity $1B,$FF,$2,$2
		moreMove $A,$14
		moreMove $8,$14
		moreMove $0,$2
		moreMove $C,$14
		endMove $8080
		setFacing $1B,$3
		csWait $28
		entityNod $1B
		nextSingleText $0,$1B   ; "Was it this one?{W1}"
		customActscript $1B,$FF
		dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $1B,$FF,$2,$2
		moreMove $1,$2
		endMove $8080
		csWait $1E
		entityShiver $1B
		entityShiver $1B
		csWait $1E
		entityShiver $1B
		csWait $1E
		nextSingleText $0,$1B   ; "No, that's not it.{W1}"
		customActscript $1B,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $1B,$FF,$3,$2
		moreMove $C,$50
		endMove $8080
		setActscript $1B,$FF,eas_Init
		setActscript $1B,$FF,eas_Jump
		setActscript $1B,$FF,eas_Jump
		nextSingleText $0,$1B   ; "How about this one?{W1}"
		customActscript $1B,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $1B,$FF,$1,$2
		endMove $8080
		csWait $1E
		entityShiver $1B
		entityShiver $1B
		csWait $28
		entityShiver $1B
		csWait $28
		setActscript $1B,$FF,eas_Jump
		setActscript $1B,$FF,eas_Jump
		nextSingleText $0,$1B   ; "Yeah, I got it!{W1}"
		customActscript $1F,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $1F,$FF,$1,$1
		moreMove $2,$2
		endMove $8080
		nextSingleText $80,$1F  ; "Is that the right one?{W1}"
		setFacing $1B,$0
		entityNod $1B
		nextSingleText $0,$1B   ; "Yes!  But...{W1}"
		nextSingleText $80,$1F  ; "But what?{W1}"
		setActscript $1B,$FF,eas_Init
		moveEntity $1B,$FF,$3,$1
		moreMove $8,$1
		endMove $8080
		nextSingleText $0,$1B   ; "The most important part is{N}missing.  It's been stolen.{W1}"
		setActscript $1F,$FF,eas_Init
		setActscript $1F,$FF,eas_JumpRight
		csWait $A
		customActscript $1F,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                ; 0014 END OF CUSTOM ACTSCRIPT
		dc.b $80
		moveEntity $1F,$FF,$2,$2
		endMove $8080
		nextText $80,$1F        ; "Who could've taken it?{W2}"
		setFacing $1F,$3
		nextSingleText $80,$1F  ; "Oh, we've lost the key.{W1}"
		csWait $28
		moveEntity $7,$FF,$2,$4
		moreMove $1,$1
		endMove $8080
		setFacing $1B,$3
		nextText $80,$7         ; "Not necessarily, Sir Astral.{W2}"
		nextSingleText $80,$7   ; "Believe in {LEADER}.{N}He was chosen by the gods.{W1}"
		nextText $80,$1F        ; "Hmmm....{W2}"
		entityNod $1F
		nextSingleText $80,$1F  ; "Yes, {NAME;7} is right.{N}{LEADER} is our leader!{W1}"
		setActscript $1F,$FF,eas_Init
		moveEntity $1F,$FF,$0,$4
		moreMove $B,$1
		endMove $8080
		setFacing $0,$1
		nextText $80,$1F        ; "{LEADER}, we have to{N}find the Holy Sword and{N}the door to the tower.{W2}"
		nextSingleText $80,$1F  ; "The legends only hint of{N}you, but we believe in you.{W1}"
		entityNod $0
		moveEntity $80,$FF,$3,$1
		endMove $8080
		setFacing $1F,$1
		setFacing $1B,$0
		nextSingleText $0,$80   ; "Believe in the power of{N}your jewel!{W1}"
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		moveEntity $80,$FF,$1,$1
		moreMove $B,$1
		endMove $8080
		csc_end
cs_60EB2:       textCursor $D8C
		entityNod $1F
		nextSingleText $80,$1F  ; "Yes, that's the truth.{W1}"
		csWait $28
		moveEntity $1F,$FF,$0,$1
		endMove $8080
		setFacing $1F,$3
		setFacing $0,$1
		setFacing $7,$1
		setFacing $1C,$1
		nextSingleText $80,$1F  ; "Now, {LEADER}.{W1}"
		entityNod $0
		moveEntity $80,$FF,$3,$1
		endMove $8080
		setFacing $1F,$1
		setFacing $1B,$0
		nextSingleText $0,$80   ; "We need to return and{N}restore world peace.{W1}"
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $1C,$1F,$2
		moveEntity $80,$FF,$1,$1
		moreMove $B,$1
		endMove $8080
		csc_end
cs_60F18:       textCursor $D8F
		nextSingleText $0,$1B   ; "{LEADER}, would you mind{N}if I went with you?{W1}"
		faceEntity $1F,$1B
		nextSingleText $80,$1F  ; "No, {NAME;27}.  You have{N}to continue your work.{W1}"
		nextText $0,$1B         ; "I knew you'd say that, but I{N}can't continue my work if{N}Zeon revives.{W2}"
		nextSingleText $0,$1B   ; "Also, as a historian, I{N}want to see the King of{N}the Devils.{W1}"
		faceEntity $7,$1B
		nextSingleText $80,$7   ; "{NAME;27} will just follow{N}us if you don't let him{N}join us.{W1}"
		entityNod $1B
		nextSingleText $0,$1B   ; "{NAME;7} is right.{W1}"
		nextSingleText $80,$1F  ; "(Sigh)...OK.{W1}"
		join $1B
		nextSingleText $0,$1B   ; "I'm so excited!{W1}"
		entityShiver $1B
		csWait $1E
		nextSingleText $80,$7   ; "This is not a sight-seeing{N}tour, OK?!{N}Let's go {LEADER}!{W1}"
		followEntity $1B,$0,$5
		csc_end
cs_60F64:       textCursor $D98
		nextText $FF,$FF        ; "It's a fine-looking piano.{N}Will you play it?{W1}"
		yesNo
		jumpIfFlagClear $59,cs_60FA4; YES/NO prompt answer
		textCursor $D99
		playSound MUSIC_PIANO_THEME
		csWait $78
		setQuake $1
		playSound SFX_BIG_DOOR_RUMBLE
		csWait $5A
		setQuake $0
		csWait $1E
		nextSingleText $FF,$FF  ; "Something opened somewhere.{W1}"
		setBlocks $20,$2D,$1,$1,$B,$4
		setF $3AC               ; set after playing the piano in Yeel (during the late game)
		csc_end
cs_60FA4:       textCursor $D9A
		nextSingleText $FF,$FF  ; "{LEADER}, can't you play?{W1}"
		csc_end
