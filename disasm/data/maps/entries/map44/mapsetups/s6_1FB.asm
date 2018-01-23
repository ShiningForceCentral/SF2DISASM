
; ASM FILE data\maps\entries\map44\mapsetups\s6_1FB.asm :
; 0x54568..0x5473E : 

; =============== S U B R O U T I N E =======================================

ms_map44_flag1FB_InitFunction:
		
		lea     cs_54570(pc), a0
		trap    #6
return_5456E:
		rts

	; End of function ms_map44_flag1FB_InitFunction

cs_54570:       playSound MUSIC_BOSS_ATTACK
		fadeInB
		csc_end
cs_54578:       textCursor $3F5
		nextSingleText $0,$1F   ; "OK.  Let's go!{W1}"
		entityNod $8A
		setFacing $8A,DOWN
		nextSingleText $0,$8A   ; "Weigh anchor!{W1}"
		setEntityDest $0,11,13
		moveEntity $8B,$0,$0,$4
		moreMove $1,$9
		moreMove $A,$2
		moreMove $B,$1
		endMove $8080
		moveEntity $8C,$0,$8,$1E
		moreMove $1,$9
		moreMove $8,$2
		moreMove $B,$1
		endMove $8080
		moveEntity $0,$FF,$0,$4
byte_545B6:     moreMove $3,$1
		moreMove $0,$1
		moreMove $0,$1
		moreMove $0,$2
		endMove $8080
		csWait 30
		setFacing $0,DOWN
		setFacing $1F,DOWN
		setFacing $1E,DOWN
		setFacing $9F,DOWN
		setCamDest 10,11
		setBlocks 15,22,3,1,12,22
		csWait 4
		setBlocks 15,21,3,1,12,21
		csWait 4
		setBlocks 15,20,3,1,12,20
		csWait 4
		setBlocks 15,19,3,1,12,19
		csWait 4
		setBlocks 15,18,3,1,12,18
		csWait 4
		setBlocks 15,17,3,1,12,17
		csWait 4
		setBlocks 15,16,3,1,12,16
		csWait 4
		setBlocks 15,15,3,1,12,15
		csWait 15
		setCamDest 13,12
		setFacing $9F,RIGHT
		nextSingleText $0,$9F   ; "Sir Astral, where are we{N}headed?{W1}"
		setFacing $1F,LEFT
		nextSingleText $C0,$1F  ; "This earthquake must{N}have caused damage all{N}over the island.{W1}"
		setFacing $1F,DOWN
		nextSingleText $C0,$1F  ; "Maybe...to the east...to...{N}Oh, yes!  To the mainland!{W1}"
		setActscript $9F,$FF,eas_Jump
		setActscript $9F,$FF,eas_Jump
		nextSingleText $0,$9F   ; "To Parmecia?!{N}Hmmmm....{W1}"
		setFacing $1E,RIGHT
		nextSingleText $0,$1E   ; "What?  To the mainland?{N}No!{W2}{N}What about Elis?!  No,{N}we'll stay here on Grans!{W1}"
		setFacing $1E,DOWN
		moveEntity $1F,$0,$1,$1
		moreMove $2,$2
		endMove $8080
		setCamDest 11,12
		nextSingleText $C0,$1F  ; "It's too dangerous to stay{N}here.{N}Weigh anchor right now!{W1}"
		clearF $4A              ; Astral + King are followers
		setCamDest 11,13
		executeSubroutine csub_54714
		csWait 120
		loadMapFadeIn 66,28,26
		loadMapEntities ce_54736
		setActscript $0,$FF,eas_Init
		entitySprite $0,$D3
		fadeInB
		customActscript $0,$FF
		ac_setSpeed 5140        ;   
		ac_jump eas_Idle        ;   
		ac_end
		moveEntity $0,$0,$0,$1
		moreMove $1,$2
		moreMove $0,$1
		moreMove $1,$1
		moreMove $0,$1
		moreMove $1,$2
		moreMove $0,$3
		endMove $8080
		csWait 60
		setQuake 3
		csWait 60
		setQuake 5
		csWait 30
		playSound SFX_INTRO_LIGHTNING
		flashScreenWhite $1E
		setBlocks 0,49,10,15,28,23
		flashScreenWhite $1E
		csWait 60
		setQuake 3
		csWait 60
		setQuake 1
		csWait 90
		setQuake 0
		csWait 120
		mapSysEvent $49,$1A,$D,$0
		clearF $280             ; set after the end of battle 7's long sequence, cleared at docks?
		csc_end

; =============== S U B R O U T I N E =======================================

csub_54714:
		moveq   #$F,d7
loc_54716:
		subq.b  #1,($FFFFA846).w
		moveq   #4,d0
		jsr     (Sleep).w       
		dbf     d7,loc_54716
		moveq   #$17,d7
loc_54726:
		addq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		moveq   #4,d0
		jsr     (Sleep).w       
		dbf     d7,loc_54726
		rts

	; End of function csub_54714

ce_54736:       mainEntity 34,33,RIGHT
		dc.w $FFFF
