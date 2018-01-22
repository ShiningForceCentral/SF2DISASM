
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
		setFacing $8A,$3
		nextSingleText $0,$8A   ; "Weigh anchor!{W1}"
		setEntityDest $0,$B,$D
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
		csWait $1E
		setFacing $0,$3
		setFacing $1F,$3
		setFacing $1E,$3
		setFacing $9F,$3
		setCamDest $A,$B
		setBlocks $F,$16,$3,$1,$C,$16
		csWait $4
		setBlocks $F,$15,$3,$1,$C,$15
		csWait $4
		setBlocks $F,$14,$3,$1,$C,$14
		csWait $4
		setBlocks $F,$13,$3,$1,$C,$13
		csWait $4
		setBlocks $F,$12,$3,$1,$C,$12
		csWait $4
		setBlocks $F,$11,$3,$1,$C,$11
		csWait $4
		setBlocks $F,$10,$3,$1,$C,$10
		csWait $4
		setBlocks $F,$F,$3,$1,$C,$F
		csWait $F
		setCamDest $D,$C
		setFacing $9F,$0
		nextSingleText $0,$9F   ; "Sir Astral, where are we{N}headed?{W1}"
		setFacing $1F,$2
		nextSingleText $C0,$1F  ; "This earthquake must{N}have caused damage all{N}over the island.{W1}"
		setFacing $1F,$3
		nextSingleText $C0,$1F  ; "Maybe...to the east...to...{N}Oh, yes!  To the mainland!{W1}"
		setActscript $9F,$FF,eas_Jump
		setActscript $9F,$FF,eas_Jump
		nextSingleText $0,$9F   ; "To Parmecia?!{N}Hmmmm....{W1}"
		setFacing $1E,$0
		nextSingleText $0,$1E   ; "What?  To the mainland?{N}No!{W2}{N}What about Elis?!  No,{N}we'll stay here on Grans!{W1}"
		setFacing $1E,$3
		moveEntity $1F,$0,$1,$1
		moreMove $2,$2
		endMove $8080
		setCamDest $B,$C
		nextSingleText $C0,$1F  ; "It's too dangerous to stay{N}here.{N}Weigh anchor right now!{W1}"
		clearF $4A              ; Astral + King are followers
		setCamDest $B,$D
		executeSubroutine csub_54714
		csWait $78
		loadMapFadeIn $42,$1C,$1A
		loadMapEntities ce_54736
		setActscript $0,$FF,eas_Init
		entitySprite $0,$D3
		fadeInB
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $0,$0,$0,$1
		moreMove $1,$2
		moreMove $0,$1
		moreMove $1,$1
		moreMove $0,$1
		moreMove $1,$2
		moreMove $0,$3
		endMove $8080
		csWait $3C
		setQuake $3
		csWait $3C
		setQuake $5
		csWait $1E
		playSound SFX_INTRO_LIGHTNING
		flashScreenWhite $1E
		setBlocks $0,$31,$A,$F,$1C,$17
		flashScreenWhite $1E
		csWait $3C
		setQuake $3
		csWait $3C
		setQuake $1
		csWait $5A
		setQuake $0
		csWait $78
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

ce_54736:       dc.w $22
		dc.w $21
		dc.w 0
		dc.w $FFFF
