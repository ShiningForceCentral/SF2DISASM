
; ASM FILE data\maps\entries\map73\mapsetups\s6.asm :
; 0x50342..0x5096A : 

; =============== S U B R O U T I N E =======================================

ms_map73_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $2BC               ; set after ship arrives in Parmecia and you regain control of Bowie
		bne.s   loc_50354
		lea     cs_503A6(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2BC               ; set after ship arrives in Parmecia and you regain control of Bowie
		rts
loc_50354:
		trap    #CHECK_FLAG
		dc.w $1FC               ; Battle 8 completed
		beq.s   return_5036C
		trap    #CHECK_FLAG
		dc.w $2C1               ; set after you automatically walk into New Granseal after it is built
		bne.s   return_5036C
		lea     cs_50806(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2C1               ; set after you automatically walk into New Granseal after it is built
		rts
return_5036C:
		rts

	; End of function ms_map73_InitFunction


; =============== S U B R O U T I N E =======================================

sub_5036E:
		moveq   #$A,d7
loc_50370:
		addq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		moveq   #4,d0
		jsr     (Sleep).w       
		dbf     d7,loc_50370
		rts

	; End of function sub_5036E


; =============== S U B R O U T I N E =======================================

sub_50380:
		move.w  #$1200,((word_FFA814-$1000000)).w
		move.w  #$3F60,((word_FFA816-$1000000)).w
		rts

	; End of function sub_50380


; =============== S U B R O U T I N E =======================================

sub_5038E:
		moveq   #$A,d7
loc_50390:
		subq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		jsr     (WaitForVInt).w 
		dbf     d7,loc_50390
		rts

	; End of function sub_5038E


; =============== S U B R O U T I N E =======================================

sub_5039E:
		move.b  #0,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		rts

	; End of function sub_5039E

cs_503A6:       textCursor $8BF         ; Initial text line $8BF : "The people of Granseal have{N}arrived at their new home.{W1}"
		resetForceBattleStats   ; 0055 RESET FORCE BATTLE STATS
		csc46 $0,$0             ; 0046 UNKNOWN
		setCameraEntity $FFFF   ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		loadMapEntities ce_506DE; Entity data to figure out and format
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setBlocks $A,$160A,$2A0A; 0034 SET BLOCKS A 160A 2A0A
		playSound MUSIC_TOWN    ; 0005 PLAY SOUND MUSIC_TOWN
		fadeInB                 ; 0039 FADE IN FROM BLACK
		textCursor $8A5         ; Initial text line $8A5 : "We were almost swallowed{N}by that chasm.{W1}"
		nextSingleText $0,$80   ; "We were almost swallowed{N}by that chasm.{W1}"
		nextSingleText $C0,$0   ; "That was close!{W1}"
		nextSingleText $C0,$1   ; "Sir Astral, where should{N}we go now?{W1}"
		nextSingleText $0,$80   ; "I think we should to go{N}to the mainland.{N}Don't you agree, Minister?{W1}"
		nextSingleText $0,$81   ; "We have no choice.{W1}"
		nextSingleText $C0,$3   ; "Then, let's go to the{N}continent of Parmecia!{W1}"
		executeSubroutine sub_5036E; 000A EXECUTE SUBROUTINE 5036E
		nextSingleText $FF,$FF  ; "And so the ship heads east{N}for Parmecia.{W1}"
		csWait $78              ; WAIT 78
		nextSingleText $0,$1    ; "I feel...sick...to my...{N}stomach...ohhh....{W1}"
		jumpIfFlagClear $6,cs_50426; Kiwi joined
		nextSingleText $C0,$6   ; "{NAME;1}, look!{W1}"
		nextSingleText $0,$1    ; "Sorry, {NAME;6}...I can't{N}do anything right now....{W1}"
		nextSingleText $C0,$6   ; "That's not what...{W1}"
		nextSingleText $0,$1    ; "Sorry...ohhh...!{W1}"
		nextSingleText $C0,$6   ; "Hooray, land ho!{W1}"
		nextSingleText $0,$1    ; "What?  Oh, it's true!{N}Sir Astral, we can see the {N}mainland!{W1}"
		nextSingleText $0,$80   ; "Finally we've arrived.{N}King Granseal, can you see{N}Parmecia?{W1}"
		nextSingleText $0,$82   ; "Oh, that's good...{W1}"
cs_50426:       textCursor $8B5         ; Initial text line $8B5 : "Minister, we're approaching{N}Parmecia!{W1}"
		nextSingleText $0,$80   ; "Minister, we're approaching{N}Parmecia!{W1}"
		nextSingleText $0,$81   ; "Land the ship, captain.{W1}"
		nextSingleText $C0,$83  ; "Where?{W1}"
		nextSingleText $0,$80   ; "Anywhere.  There!{N}No!  There!{W1}"
		nextSingleText $80,$83  ; "But, the ship will be{N}destroyed!{W1}"
		nextSingleText $0,$80   ; "It doesn't matter.  The ship{N}will be used for lumber after{N}we land, anyway.{W1}"
		nextSingleText $80,$83  ; "Are you serious?  Just{N}don't complain that we{N}don't have a ship later!{W1}"
		executeSubroutine sub_50380; 000A EXECUTE SUBROUTINE 50380
		csWait $F0              ; WAIT F0
		csWait $CD              ; WAIT CD
		setQuakeAmount $1       ; 0033 SET QUAKE AMOUNT 1
		executeSubroutine sub_5038E; 000A EXECUTE SUBROUTINE 5038E
		csWait $30              ; WAIT 30
		executeSubroutine sub_5039E; 000A EXECUTE SUBROUTINE 5039E
		customActscript $84,$FF ; 0014 SET MANUAL ACTSCRIPT 84
		dc.w $10                ;   0010 SET SPEED X=$1 Y=$1
		dc.b 1
		dc.b 1
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $84,$0,$0,$1 ; 002D MOVE ENTITY 84 0 0 1
		endMove $8080
		nextSingleText $0,$5    ; "Whoa!{W1}"
		nextSingleText $0,$1    ; "The ship has crashed into{N}the shore!  Oh, no!{W1}"
		nextSingleText $0,$83   ; "Ouch!  Ouch!{N}That's what I call good{N}seamanship!{W1}"
		setQuakeAmount $0       ; 0033 SET QUAKE AMOUNT 0
		waitIdle $84            ; 0016 WAIT UNTIL IDLE ENTITY 84
		csWait $1E              ; WAIT 1E
		stopEntity $84          ; 001C STOP ENTITY ANIM 84
		csWait $1E              ; WAIT 1E
		textCursor $8BF         ; Initial text line $8BF : "The people of Granseal have{N}arrived at their new home.{W1}"
		nextSingleText $FF,$FF  ; "The people of Granseal have{N}arrived at their new home.{W1}"
		loadMapFadeIn $E,$12,$19; 0037 LOAD MAP AND FADE IN E 12 19
		loadMapEntities ce_5072E; Entity data to figure out and format
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		fadeInB                 ; 0039 FADE IN FROM BLACK
		csWait $5               ; WAIT 5
		setActscript $81,$0,eas_461B6; 0015 SET ACTSCRIPT 81 0 461B6
		csWait $5               ; WAIT 5
		setActscript $82,$0,eas_461B6; 0015 SET ACTSCRIPT 82 0 461B6
		csWait $5               ; WAIT 5
		setActscript $83,$0,eas_461B6; 0015 SET ACTSCRIPT 83 0 461B6
		csWait $5               ; WAIT 5
		setActscript $84,$0,eas_461B6; 0015 SET ACTSCRIPT 84 0 461B6
		csWait $5               ; WAIT 5
		setActscript $85,$0,eas_461B6; 0015 SET ACTSCRIPT 85 0 461B6
		csWait $5               ; WAIT 5
		setActscript $86,$0,eas_461B6; 0015 SET ACTSCRIPT 86 0 461B6
		csWait $5               ; WAIT 5
		setActscript $87,$0,eas_461B6; 0015 SET ACTSCRIPT 87 0 461B6
		csWait $5               ; WAIT 5
		setActscript $88,$0,eas_461B6; 0015 SET ACTSCRIPT 88 0 461B6
		csWait $5               ; WAIT 5
		setActscript $89,$0,eas_461B6; 0015 SET ACTSCRIPT 89 0 461B6
		csWait $5               ; WAIT 5
		setActscript $8A,$0,eas_461B6; 0015 SET ACTSCRIPT 8A 0 461B6
		csWait $5               ; WAIT 5
		setActscript $8B,$0,eas_461B6; 0015 SET ACTSCRIPT 8B 0 461B6
		csWait $5               ; WAIT 5
		setActscript $8C,$0,eas_461B6; 0015 SET ACTSCRIPT 8C 0 461B6
		setEntityDir $80,$2     ; 0023 SET ENTITY FACING 80 2
		csWait $3C              ; WAIT 3C
		setEntityDir $80,$0     ; 0023 SET ENTITY FACING 80 0
		csWait $3C              ; WAIT 3C
		setEntityDir $80,$2     ; 0023 SET ENTITY FACING 80 2
		csWait $1E              ; WAIT 1E
		nextSingleText $0,$80   ; "Everybody, listen up!{W1}"
		csWait $14              ; WAIT 14
		setEntityDir $81,$0     ; 0023 SET ENTITY FACING 81 0
		setEntityDir $82,$0     ; 0023 SET ENTITY FACING 82 0
		setEntityDir $83,$0     ; 0023 SET ENTITY FACING 83 0
		setEntityDir $84,$0     ; 0023 SET ENTITY FACING 84 0
		setEntityDir $85,$0     ; 0023 SET ENTITY FACING 85 0
		setEntityDir $86,$1     ; 0023 SET ENTITY FACING 86 1
		setEntityDir $87,$1     ; 0023 SET ENTITY FACING 87 1
		setEntityDir $88,$2     ; 0023 SET ENTITY FACING 88 2
		setEntityDir $89,$2     ; 0023 SET ENTITY FACING 89 2
		setEntityDir $8A,$2     ; 0023 SET ENTITY FACING 8A 2
		csWait $14              ; WAIT 14
		setEntityDir $8B,$3     ; 0023 SET ENTITY FACING 8B 3
		setEntityDir $8C,$3     ; 0023 SET ENTITY FACING 8C 3
		nextText $0,$80         ; "Let's build a new Granseal{N}here!{W2}"
		nextText $0,$80         ; "The ship will be a good{N}source of timber!{W2}"
		nextSingleText $0,$80   ; "Break the ship apart and{N}bring the timber onto the{N}land!{W1}"
		setActscript $81,$0,eas_Walking; 0015 SET ACTSCRIPT 81 0 45054
		setActscript $82,$0,eas_Walking; 0015 SET ACTSCRIPT 82 0 45054
		setActscript $83,$0,eas_Walking; 0015 SET ACTSCRIPT 83 0 45054
		setActscript $84,$0,eas_Walking; 0015 SET ACTSCRIPT 84 0 45054
		setActscript $85,$0,eas_Walking; 0015 SET ACTSCRIPT 85 0 45054
		setActscript $86,$0,eas_Walking; 0015 SET ACTSCRIPT 86 0 45054
		setActscript $87,$0,eas_Walking; 0015 SET ACTSCRIPT 87 0 45054
		setActscript $88,$0,eas_Walking; 0015 SET ACTSCRIPT 88 0 45054
		setActscript $89,$0,eas_Walking; 0015 SET ACTSCRIPT 89 0 45054
		setActscript $8A,$0,eas_Walking; 0015 SET ACTSCRIPT 8A 0 45054
		setActscript $8B,$0,eas_Walking; 0015 SET ACTSCRIPT 8B 0 45054
		setActscript $8C,$0,eas_Walking; 0015 SET ACTSCRIPT 8C 0 45054
		csWait $50              ; WAIT 50
		loadMapFadeIn $E,$2D,$2 ; 0037 LOAD MAP AND FADE IN E 2D 2
		loadMapEntities ce_5079E; Entity data to figure out and format
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setBlocks $3307,$101,$3F3F; 0034 SET BLOCKS 3307 101 3F3F
		setBlocks $3306,$101,$3307; 0034 SET BLOCKS 3306 101 3307
		stopEntity $83          ; 001C STOP ENTITY ANIM 83
		stopEntity $84          ; 001C STOP ENTITY ANIM 84
		stopEntity $85          ; 001C STOP ENTITY ANIM 85
		jumpIfFlagSet $6,cs_50624; Kiwi joined
		hideEntity $6           ; 002E HIDE ENTITY 6
cs_50624:       fadeInB                 ; 0039 FADE IN FROM BLACK
		moveEntity $3,$FF,$3,$1 ; 002D MOVE ENTITY 3 FF 3 1
		endMove $8080
		nextText $0,$3          ; "We're going to break the{N}ship up into pieces and build{N}our new town....{W2}"
		nextText $0,$3          ; "That means, we can't go back{N}to Grans Island!{W2}"
		nextSingleText $0,$3    ; "Hey, listen to me!{W1}"
		setEntityDir $1,$1      ; 0023 SET ENTITY FACING 1 1
		nextText $C0,$1         ; "Be quiet!  We know that.{W2}"
		nextSingleText $0,$1    ; "Help me remove this plank!{W1}"
		nextSingleText $0,$3    ; "OK, I'm coming.{W1}"
		moveEntity $3,$FF,$3,$2 ; 002D MOVE ENTITY 3 FF 3 2
		endMove $8080
		setEntityDir $3,$3      ; 0023 SET ENTITY FACING 3 3
		entitySprite $3,$3B     ; 001A SET ENTITY SPRITE 3 3B
		csWait $3C              ; WAIT 3C
		nextText $0,$3          ; "Ugh...ugghhh...{N}It's stuck!{W2}"
		nextSingleText $0,$3    ; "Heave!  Heave!{N}Come oooooooooon!{W1}"
		setActscript $3,$FF,eas_46172; 0015 SET ACTSCRIPT 3 FF 46172
		customActscript $3,$FF  ; 0014 SET MANUAL ACTSCRIPT 3
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setBlocks $3F3F,$101,$3307; 0034 SET BLOCKS 3F3F 101 3307
		playSound SFX_FALLING   ; 0005 PLAY SOUND SFX_FALLING
		moveEntity $3,$FF,$1,$4 ; 002D MOVE ENTITY 3 FF 1 4
		endMove $8080
		setQuakeAmount $5       ; 0033 SET QUAKE AMOUNT 5
		playSound SFX_DOOR_OPEN ; 0005 PLAY SOUND SFX_DOOR_OPEN
		csWait $A               ; WAIT A
		hideEntity $3           ; 002E HIDE ENTITY 3
		setBlocks $3800,$102,$3303; 0034 SET BLOCKS 3800 102 3303
		setQuakeAmount $0       ; 0033 SET QUAKE AMOUNT 0
		csWait $1E              ; WAIT 1E
		nextSingleText $0,$5    ; "Oh, what a klutz!{W1}"
		moveEntity $5,$FF,$0,$2 ; 002D MOVE ENTITY 5 FF 0 2
		endMove $8080
		setEntityDir $5,$1      ; 0023 SET ENTITY FACING 5 1
		csWait $3C              ; WAIT 3C
		nextSingleText $C0,$1   ; "That's OK.  {NAME;3} needed{N}a bath anyway.{W1}"
		csWait $14              ; WAIT 14
		setCamDest $22,$4       ; 0032 SET CAMERA DEST 22 4
		nextSingleText $0,$4    ; "{LEADER}, bring that plank{N}above deck.{W1}"
		csc53 $0,$0             ; 0053 UNKNOWN
		csc53 $84,$FFFF         ; 0053 UNKNOWN
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_506DE:       dc.b   0
		dc.b $3F 
		dc.b   0
		dc.b $3F 
		dc.w 1
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $D1
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b 1
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $CD
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b 3
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b 6
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $CB
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $C1
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b 5
		dc.l eas_Init           
		dc.b 5
		dc.b 5
		dc.b 0
		dc.b $D3
		dc.l eas_Init           
		dc.w $FFFF
ce_5072E:       dc.w 0
		dc.w 0
		dc.w 1
		dc.b $17
		dc.b $1E
		dc.b 3
		dc.b $CD
		dc.l eas_Init           
		dc.b $13
		dc.b $1D
		dc.b 1
		dc.b $C6
		dc.l eas_Init           
		dc.b $15
		dc.b $1D
		dc.b 2
		dc.b $C4
		dc.l eas_Init           
		dc.b $14
		dc.b $1E
		dc.b 3
		dc.b $C7
		dc.l eas_Init           
		dc.b $14
		dc.b $1F
		dc.b 1
		dc.b $C7
		dc.l eas_Init           
		dc.b $13
		dc.b $20
		dc.b 3
		dc.b $C5
		dc.l eas_Init           
		dc.b $17
		dc.b $22
		dc.b 3
		dc.b $C8
		dc.l eas_Init           
		dc.b $18
		dc.b $22
		dc.b 3
		dc.b $C9
		dc.l eas_Init           
		dc.b $1B
		dc.b $1D
		dc.b 3
		dc.b $C2
		dc.l eas_Init           
		dc.b $1B
		dc.b $1E
		dc.b 2
		dc.b $C1
		dc.l eas_Init           
		dc.b $1A
		dc.b $1F
		dc.b 1
		dc.b $C2
		dc.l eas_Init           
		dc.b $18
		dc.b $1A
		dc.b 1
		dc.b $C5
		dc.l eas_Init           
		dc.b $17
		dc.b $1B
		dc.b 1
		dc.b $C4
		dc.l eas_Init           
		dc.w $FFFF
ce_5079E:       dc.w $28
		dc.w 8
		dc.w 2
		dc.b $33
		dc.b 8
		dc.b 3
		dc.b 1
		dc.l eas_Init           
		dc.b $29
		dc.b $A
		dc.b 3
		dc.b 2
		dc.l eas_Init           
		dc.b $33
		dc.b 4
		dc.b 3
		dc.b 3
		dc.l eas_Init           
		dc.b $27
		dc.b 8
		dc.b 0
		dc.b 4
		dc.l eas_Init           
		dc.b $31
		dc.b 4
		dc.b 1
		dc.b 5
		dc.l eas_Init           
		dc.b $26
		dc.b 5
		dc.b 3
		dc.b 6
		dc.l eas_Init           
		dc.b $29
		dc.b 4
		dc.b 3
		dc.b $CA
		dc.l eas_Init           
		dc.b $35
		dc.b $A
		dc.b 3
		dc.b $CA
		dc.l eas_Init           
		dc.b $2F
		dc.b 5
		dc.b 3
		dc.b $C4
		dc.l eas_Init           
		dc.b $2C
		dc.b 6
		dc.b 0
		dc.b $B3
		dc.l eas_Init           
		dc.b $2D
		dc.b 6
		dc.b 3
		dc.b $B3
		dc.l eas_Init           
		dc.b $2E
		dc.b 6
		dc.b 2
		dc.b $B3
		dc.l eas_Init           
		dc.w $FFFF
cs_50806:       textCursor $8F0         ; Initial text line $8F0 : "Look at that, {LEADER}!{N}They've finished breaking{N}up the ship.{W1}"
		loadMapEntities ce_5094A; Entity data to figure out and format
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setActscript $80,$FF,eas_Init; 0015 SET ACTSCRIPT 80 FF 460CE
		setActscript $80,$FF,eas_Init; 0015 SET ACTSCRIPT 80 FF 460CE
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		followEntity $81,$0,$2  ; 002C FOLLOW ENTITY 81 0 2
		followEntity $0,$80,$2  ; 002C FOLLOW ENTITY 0 80 2
		setBlocks $2A00,$B0A,$1830; 0034 SET BLOCKS 2A00 B0A 1830
		setCameraEntity $80     ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
		fadeInB                 ; 0039 FADE IN FROM BLACK
		moveEntity $80,$FF,$2,$4; 002D MOVE ENTITY 80 FF 2 4
		moreMove $1,$1
		moreMove $2,$2
		moreMove $1,$2
		endMove $8080
		moveEntity $80,$FF,$2,$1; 002D MOVE ENTITY 80 FF 2 1
		moreMove $1,$1
		moreMove $1,$1
		moreMove $2,$8
		moreMove $3,$2
		endMove $8080
		moveEntity $80,$FF,$2,$8; 002D MOVE ENTITY 80 FF 2 8
		moreMove $3,$2
		moreMove $2,$3
		moreMove $3,$1
		moreMove $2,$2
		moreMove $3,$2
		endMove $8080
		moveEntity $80,$FF,$2,$5; 002D MOVE ENTITY 80 FF 2 5
		endMove $8080
		entityPosDirFlash $82,$0,$0,$2; 0017 SET ENTITY POS AND FACING WITH FLASH 82 0 0 2
		nextSingleText $0,$80   ; "Look at that, {LEADER}!{N}They've finished breaking{N}up the ship.{W1}"
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $80,$3     ; 0023 SET ENTITY FACING 80 3
		setEntityDir $81,$3     ; 0023 SET ENTITY FACING 81 3
		setCamDest $19,$2F      ; 0032 SET CAMERA DEST 19 2F
		setBlocks $3500,$B0A,$1830; 0034 SET BLOCKS 3500 B0A 1830
		csWait $F               ; WAIT F
		setBlocks $2A00,$B0A,$1830; 0034 SET BLOCKS 2A00 B0A 1830
		csWait $5               ; WAIT 5
		setBlocks $3500,$B0A,$1830; 0034 SET BLOCKS 3500 B0A 1830
		csWait $F               ; WAIT F
		setBlocks $2A0A,$B0A,$1830; 0034 SET BLOCKS 2A0A B0A 1830
		csWait $5               ; WAIT 5
		setBlocks $350A,$B0A,$1830; 0034 SET BLOCKS 350A B0A 1830
		csWait $F               ; WAIT F
		setBlocks $2A0A,$B0A,$1830; 0034 SET BLOCKS 2A0A B0A 1830
		csWait $5               ; WAIT 5
		setBlocks $350A,$B0A,$1830; 0034 SET BLOCKS 350A B0A 1830
		csWait $1E              ; WAIT 1E
		nextText $0,$80         ; "Wow, there's our new town!{W2}"
		nextSingleText $0,$80   ; "But, our Granseal was much{N}more beautiful.{N}Cheer up!{W1}"
		setCameraEntity $FFFF   ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		setActscript $80,$FF,eas_Init; 0015 SET ACTSCRIPT 80 FF 460CE
		setActscript $81,$FF,eas_Init; 0015 SET ACTSCRIPT 81 FF 460CE
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setEntityDest $80,$1D,$34; 0029 SET ENTITY DEST 80 1D 34
		entityPosDir $80,$0,$0,$3; 0019 SET ENTITY POS AND FACING 80 0 0 3
		setEntityDest $81,$1D,$34; 0029 SET ENTITY DEST 81 1D 34
		entityPosDir $81,$0,$0,$3; 0019 SET ENTITY POS AND FACING 81 0 0 3
		setEntityDest $0,$1D,$34; 0029 SET ENTITY DEST 0 1D 34
		entityPosDir $0,$0,$0,$3; 0019 SET ENTITY POS AND FACING 0 0 0 3
		csWait $3C              ; WAIT 3C
		nextSingleText $FF,$FF  ; "They worked hard to build{N}their new town.{W1}"
		playSound $FD           ; 0005 PLAY SOUND 
		resetForceBattleStats   ; 0055 RESET FORCE BATTLE STATS
		mapSysEvent $70B0A01    ; 0007 EXECUTE MAP SYSTEM EVENT 70B0A01
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_5094A:       dc.b   0
		dc.b $3D 
		dc.b   0
		dc.b $30 
		dc.w 2
		dc.b $3E
		dc.b $30
		dc.b 2
		dc.b $CA
		dc.l eas_Init           
		dc.b $3F
		dc.b $30
		dc.b 2
		dc.b $CA
		dc.l eas_Init           
		dc.b $1C
		dc.b $31
		dc.b 0
		dc.b $D3
		dc.l eas_Init           
		dc.w $FFFF
