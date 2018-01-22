
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

cs_503A6:       textCursor $8BF
		resetForceBattleStats
		reloadMap 0,0
		setCameraEntity $FFFF
		loadMapEntities ce_506DE
		setActscript $0,$FF,eas_Init
		setBlocks 0,10,22,10,42,10
		playSound MUSIC_TOWN
		fadeInB
		textCursor $8A5
		nextSingleText $0,$80   ; "We were almost swallowed{N}by that chasm.{W1}"
		nextSingleText $C0,$0   ; "That was close!{W1}"
		nextSingleText $C0,$1   ; "Sir Astral, where should{N}we go now?{W1}"
		nextSingleText $0,$80   ; "I think we should to go{N}to the mainland.{N}Don't you agree, Minister?{W1}"
		nextSingleText $0,$81   ; "We have no choice.{W1}"
		nextSingleText $C0,$3   ; "Then, let's go to the{N}continent of Parmecia!{W1}"
		executeSubroutine sub_5036E
		nextSingleText $FF,$FF  ; "And so the ship heads east{N}for Parmecia.{W1}"
		csWait 120
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
cs_50426:       textCursor $8B5
		nextSingleText $0,$80   ; "Minister, we're approaching{N}Parmecia!{W1}"
		nextSingleText $0,$81   ; "Land the ship, captain.{W1}"
		nextSingleText $C0,$83  ; "Where?{W1}"
		nextSingleText $0,$80   ; "Anywhere.  There!{N}No!  There!{W1}"
		nextSingleText $80,$83  ; "But, the ship will be{N}destroyed!{W1}"
		nextSingleText $0,$80   ; "It doesn't matter.  The ship{N}will be used for lumber after{N}we land, anyway.{W1}"
		nextSingleText $80,$83  ; "Are you serious?  Just{N}don't complain that we{N}don't have a ship later!{W1}"
		executeSubroutine sub_50380
		csWait 240
		csWait 205
		setQuake 1
		executeSubroutine sub_5038E
		csWait 48
		executeSubroutine sub_5039E
		customActscript $84,$FF
		dc.w $10                ;   0010 SET SPEED X=$1 Y=$1
		dc.b 1
		dc.b 1
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $84,$0,$0,$1
		endMove $8080
		nextSingleText $0,$5    ; "Whoa!{W1}"
		nextSingleText $0,$1    ; "The ship has crashed into{N}the shore!  Oh, no!{W1}"
		nextSingleText $0,$83   ; "Ouch!  Ouch!{N}That's what I call good{N}seamanship!{W1}"
		setQuake 0
		waitIdle $84
		csWait 30
		stopEntity $84
		csWait 30
		textCursor $8BF
		nextSingleText $FF,$FF  ; "The people of Granseal have{N}arrived at their new home.{W1}"
		loadMapFadeIn 14,18,25
		loadMapEntities ce_5072E
		setActscript $0,$FF,eas_Init
		fadeInB
		csWait 5
		setActscript $81,$0,eas_461B6
		csWait 5
		setActscript $82,$0,eas_461B6
		csWait 5
		setActscript $83,$0,eas_461B6
		csWait 5
		setActscript $84,$0,eas_461B6
		csWait 5
		setActscript $85,$0,eas_461B6
		csWait 5
		setActscript $86,$0,eas_461B6
		csWait 5
		setActscript $87,$0,eas_461B6
		csWait 5
		setActscript $88,$0,eas_461B6
		csWait 5
		setActscript $89,$0,eas_461B6
		csWait 5
		setActscript $8A,$0,eas_461B6
		csWait 5
		setActscript $8B,$0,eas_461B6
		csWait 5
		setActscript $8C,$0,eas_461B6
		setFacing $80,2
		csWait 60
		setFacing $80,0
		csWait 60
		setFacing $80,2
		csWait 30
		nextSingleText $0,$80   ; "Everybody, listen up!{W1}"
		csWait 20
		setFacing $81,0
		setFacing $82,0
		setFacing $83,0
		setFacing $84,0
		setFacing $85,0
		setFacing $86,1
		setFacing $87,1
		setFacing $88,2
		setFacing $89,2
		setFacing $8A,2
		csWait 20
		setFacing $8B,3
		setFacing $8C,3
		nextText $0,$80         ; "Let's build a new Granseal{N}here!{W2}"
		nextText $0,$80         ; "The ship will be a good{N}source of timber!{W2}"
		nextSingleText $0,$80   ; "Break the ship apart and{N}bring the timber onto the{N}land!{W1}"
		setActscript $81,$0,eas_Walking
		setActscript $82,$0,eas_Walking
		setActscript $83,$0,eas_Walking
		setActscript $84,$0,eas_Walking
		setActscript $85,$0,eas_Walking
		setActscript $86,$0,eas_Walking
		setActscript $87,$0,eas_Walking
		setActscript $88,$0,eas_Walking
		setActscript $89,$0,eas_Walking
		setActscript $8A,$0,eas_Walking
		setActscript $8B,$0,eas_Walking
		setActscript $8C,$0,eas_Walking
		csWait 80
		loadMapFadeIn 14,45,2
		loadMapEntities ce_5079E
		setActscript $0,$FF,eas_Init
		setBlocks 51,7,1,1,63,63
		setBlocks 51,6,1,1,51,7
		stopEntity $83
		stopEntity $84
		stopEntity $85
		jumpIfFlagSet $6,cs_50624; Kiwi joined
		hideEntity $6
cs_50624:       fadeInB
		moveEntity $3,$FF,$3,$1
		endMove $8080
		nextText $0,$3          ; "We're going to break the{N}ship up into pieces and build{N}our new town....{W2}"
		nextText $0,$3          ; "That means, we can't go back{N}to Grans Island!{W2}"
		nextSingleText $0,$3    ; "Hey, listen to me!{W1}"
		setFacing $1,1
		nextText $C0,$1         ; "Be quiet!  We know that.{W2}"
		nextSingleText $0,$1    ; "Help me remove this plank!{W1}"
		nextSingleText $0,$3    ; "OK, I'm coming.{W1}"
		moveEntity $3,$FF,$3,$2
		endMove $8080
		setFacing $3,3
		entitySprite $3,$3B
		csWait 60
		nextText $0,$3          ; "Ugh...ugghhh...{N}It's stuck!{W2}"
		nextSingleText $0,$3    ; "Heave!  Heave!{N}Come oooooooooon!{W1}"
		setActscript $3,$FF,eas_46172
		customActscript $3,$FF
		dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
		dc.b $40
		dc.b $40
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setBlocks 63,63,1,1,51,7
		playSound SFX_FALLING
		moveEntity $3,$FF,$1,$4
		endMove $8080
		setQuake 5
		playSound SFX_DOOR_OPEN
		csWait 10
		hideEntity $3
		setBlocks 56,0,1,2,51,3
		setQuake 0
		csWait 30
		nextSingleText $0,$5    ; "Oh, what a klutz!{W1}"
		moveEntity $5,$FF,$0,$2
		endMove $8080
		setFacing $5,1
		csWait 60
		nextSingleText $C0,$1   ; "That's OK.  {NAME;3} needed{N}a bath anyway.{W1}"
		csWait 20
		setCamDest 34,4
		nextSingleText $0,$4    ; "{LEADER}, bring that plank{N}above deck.{W1}"
		setPriority $0,$0
		setPriority $84,$FFFF
		csc_end
ce_506DE:       dc.w $3F
		dc.w $3F
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
cs_50806:       textCursor $8F0
		loadMapEntities ce_5094A
		setActscript $0,$FF,eas_Init
		setActscript $80,$FF,eas_Init
		setActscript $80,$FF,eas_Init
		setActscript $0,$FF,eas_Init
		followEntity $81,$0,$2
		followEntity $0,$80,$2
		setBlocks 42,0,11,10,24,48
		setCameraEntity $80
		fadeInB
		moveEntity $80,$FF,$2,$4
		moreMove $1,$1
		moreMove $2,$2
		moreMove $1,$2
		endMove $8080
		moveEntity $80,$FF,$2,$1
		moreMove $1,$1
		moreMove $1,$1
		moreMove $2,$8
		moreMove $3,$2
		endMove $8080
		moveEntity $80,$FF,$2,$8
		moreMove $3,$2
		moreMove $2,$3
		moreMove $3,$1
		moreMove $2,$2
		moreMove $3,$2
		endMove $8080
		moveEntity $80,$FF,$2,$5
		endMove $8080
		setPosFlash $82,0,0,2
		nextSingleText $0,$80   ; "Look at that, {LEADER}!{N}They've finished breaking{N}up the ship.{W1}"
		setFacing $0,3
		setFacing $80,3
		setFacing $81,3
		setCamDest 25,47
		setBlocks 53,0,11,10,24,48
		csWait 15
		setBlocks 42,0,11,10,24,48
		csWait 5
		setBlocks 53,0,11,10,24,48
		csWait 15
		setBlocks 42,10,11,10,24,48
		csWait 5
		setBlocks 53,10,11,10,24,48
		csWait 15
		setBlocks 42,10,11,10,24,48
		csWait 5
		setBlocks 53,10,11,10,24,48
		csWait 30
		nextText $0,$80         ; "Wow, there's our new town!{W2}"
		nextSingleText $0,$80   ; "But, our Granseal was much{N}more beautiful.{N}Cheer up!{W1}"
		setCameraEntity $FFFF
		setActscript $80,$FF,eas_Init
		setActscript $81,$FF,eas_Init
		setActscript $0,$FF,eas_Init
		setEntityDest $80,29,52
		setPos $80,0,0,3
		setEntityDest $81,29,52
		setPos $81,0,0,3
		setEntityDest $0,29,52
		setPos $0,0,0,3
		csWait 60
		nextSingleText $FF,$FF  ; "They worked hard to build{N}their new town.{W1}"
		playSound $FD
		resetForceBattleStats
		mapSysEvent $7,$B,$A,$1
		csc_end
ce_5094A:       dc.w $3D
		dc.w $30
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
