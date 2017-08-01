
; ASM FILE data\maps\entries\map44\mapsetups\s6_1FB.asm :
; 0x54568..0x5473E : 

; =============== S U B R O U T I N E =======================================

ms_map44_flag1FB_InitFunction:
		
		lea     cs_54570(pc), a0
		trap    #6
return_5456E:
		rts

	; End of function ms_map44_flag1FB_InitFunction

cs_54570:       playSound MUSIC_BOSS_ATTACK; 0005 PLAY SOUND MUSIC_BOSS_ATTACK
		fadeInB                 ; 0039 FADE IN FROM BLACK
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_54578:       textCursor $3F5         ; Initial text line $3F5 : "OK.  Let's go!{W1}"
		nextSingleText $0,$1F   ; "OK.  Let's go!{W1}"
		entityNod $8A           ; 0026 MAKE ENTITY NOD 8A
		setEntityDir $8A,$3     ; 0023 SET ENTITY FACING 8A 3
		nextSingleText $0,$8A   ; "Weigh anchor!{W1}"
		setEntityDest $0,$B,$D  ; 0029 SET ENTITY DEST 0 B D
		moveEntity $8B,$0,$0,$4 ; 002D MOVE ENTITY 8B 0 0 4
		moreMove $1,$9
		moreMove $A,$2
		moreMove $B,$1
		endMove $8080
		moveEntity $8C,$0,$8,$1E; 002D MOVE ENTITY 8C 0 8 1E
		moreMove $1,$9
		moreMove $8,$2
		moreMove $B,$1
		endMove $8080
		moveEntity $0,$FF,$0,$4 ; 002D MOVE ENTITY 0 FF 0 4
byte_545B6:     moreMove $3,$1
		moreMove $0,$1
		moreMove $0,$1
		moreMove $0,$2
		endMove $8080
		csWait $1E              ; WAIT 1E
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDir $1F,$3     ; 0023 SET ENTITY FACING 1F 3
		setEntityDir $1E,$3     ; 0023 SET ENTITY FACING 1E 3
		setEntityDir $9F,$3     ; 0023 SET ENTITY FACING 9F 3
		setCamDest $A,$B        ; 0032 SET CAMERA DEST A B
		setBlocks $F16,$301,$C16; 0034 SET BLOCKS F16 301 C16
		csWait $4               ; WAIT 4
		setBlocks $F15,$301,$C15; 0034 SET BLOCKS F15 301 C15
		csWait $4               ; WAIT 4
		setBlocks $F14,$301,$C14; 0034 SET BLOCKS F14 301 C14
		csWait $4               ; WAIT 4
		setBlocks $F13,$301,$C13; 0034 SET BLOCKS F13 301 C13
		csWait $4               ; WAIT 4
		setBlocks $F12,$301,$C12; 0034 SET BLOCKS F12 301 C12
		csWait $4               ; WAIT 4
		setBlocks $F11,$301,$C11; 0034 SET BLOCKS F11 301 C11
		csWait $4               ; WAIT 4
		setBlocks $F10,$301,$C10; 0034 SET BLOCKS F10 301 C10
		csWait $4               ; WAIT 4
		setBlocks $F0F,$301,$C0F; 0034 SET BLOCKS F0F 301 C0F
		csWait $F               ; WAIT F
		setCamDest $D,$C        ; 0032 SET CAMERA DEST D C
		setEntityDir $9F,$0     ; 0023 SET ENTITY FACING 9F 0
		nextSingleText $0,$9F   ; "Sir Astral, where are we{N}headed?{W1}"
		setEntityDir $1F,$2     ; 0023 SET ENTITY FACING 1F 2
		nextSingleText $C0,$1F  ; "This earthquake must{N}have caused damage all{N}over the island.{W1}"
		setEntityDir $1F,$3     ; 0023 SET ENTITY FACING 1F 3
		nextSingleText $C0,$1F  ; "Maybe...to the east...to...{N}Oh, yes!  To the mainland!{W1}"
		setActscript $9F,$FF,eas_Jump; 0015 SET ACTSCRIPT 9F FF 45E44
		setActscript $9F,$FF,eas_Jump; 0015 SET ACTSCRIPT 9F FF 45E44
		nextSingleText $0,$9F   ; "To Parmecia?!{N}Hmmmm....{W1}"
		setEntityDir $1E,$0     ; 0023 SET ENTITY FACING 1E 0
		nextSingleText $0,$1E   ; "What?  To the mainland?{N}No!{W2}{N}What about Elis?!  No,{N}we'll stay here on Grans!{W1}"
		setEntityDir $1E,$3     ; 0023 SET ENTITY FACING 1E 3
		moveEntity $1F,$0,$1,$1 ; 002D MOVE ENTITY 1F 0 1 1
		moreMove $2,$2
		endMove $8080
		setCamDest $B,$C        ; 0032 SET CAMERA DEST B C
		nextSingleText $C0,$1F  ; "It's too dangerous to stay{N}here.{N}Weigh anchor right now!{W1}"
		clearF $4A              ; Astral + King are followers
		setCamDest $B,$D        ; 0032 SET CAMERA DEST B D
		executeSubroutine csub_54714; 000A EXECUTE SUBROUTINE 54714
		csWait $78              ; WAIT 78
		loadMapFadeIn $42,$1C,$1A; 0037 LOAD MAP AND FADE IN 42 1C 1A
		loadMapEntities ce_54736; Entity data to figure out and format
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		entitySprite $0,$D3     ; 001A SET ENTITY SPRITE 0 D3
		fadeInB                 ; 0039 FADE IN FROM BLACK
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                ;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $0,$0,$0,$1  ; 002D MOVE ENTITY 0 0 0 1
		moreMove $1,$2
		moreMove $0,$1
		moreMove $1,$1
		moreMove $0,$1
		moreMove $1,$2
		moreMove $0,$3
		endMove $8080
		csWait $3C              ; WAIT 3C
		setQuakeAmount $3       ; 0033 SET QUAKE AMOUNT 3
		csWait $3C              ; WAIT 3C
		setQuakeAmount $5       ; 0033 SET QUAKE AMOUNT 5
		csWait $1E              ; WAIT 1E
		playSound SFX_INTRO_LIGHTNING; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
		flashScreenWhite $1E    ; 0041 FLASH SCREEN WHITE 1E
		setBlocks $31,$A0F,$1C17; 0034 SET BLOCKS 31 A0F 1C17
		flashScreenWhite $1E    ; 0041 FLASH SCREEN WHITE 1E
		csWait $3C              ; WAIT 3C
		setQuakeAmount $3       ; 0033 SET QUAKE AMOUNT 3
		csWait $3C              ; WAIT 3C
		setQuakeAmount $1       ; 0033 SET QUAKE AMOUNT 1
		csWait $5A              ; WAIT 5A
		setQuakeAmount $0       ; 0033 SET QUAKE AMOUNT 0
		csWait $78              ; WAIT 78
		mapSysEvent $491A0D00   ; 0007 EXECUTE MAP SYSTEM EVENT 491A0D00
		clearF $280             ; set after the end of battle 7's long sequence, cleared at docks?
		csc_end                 ; END OF CUTSCENE SCRIPT

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
