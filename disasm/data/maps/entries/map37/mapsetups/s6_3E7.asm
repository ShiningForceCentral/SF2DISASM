
; ASM FILE data\maps\entries\map37\mapsetups\s6_3E7.asm :
; 0x5FAA4..0x5FDE4 : 

; =============== S U B R O U T I N E =======================================

ms_map37_flag3E7_InitFunction:
		
		jsr     sub_47948
		trap    #CHECK_FLAG
		dc.w $100
		bne.s   return_5FABA
		lea     cs_5FABC(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
return_5FABA:
		rts

	; End of function ms_map37_flag3E7_InitFunction

cs_5FABC:       textCursor $D1F         ; 0004 INIT TEXT CURSOR D1F : "Ouch!  Hey, {NAME;26}!{N}I like your wild driving!{W2}"
		reloadMap $6,$6         ; 0046  6 6
		entityPosDir $0,$8,$C,$1; 0019 SET ENTITY POS AND FACING 0 8 C 1
		entityPosDir $7,$D,$C,$1; 0019 SET ENTITY POS AND FACING 7 D C 1
		entityPosDir $1A,$A,$A,$3; 0019 SET ENTITY POS AND FACING 1A A A 3
		entityPosDir $80,$A,$B,$1; 0019 SET ENTITY POS AND FACING 80 A B 1
		stopEntity $80          ; 001C STOP ENTITY ANIM 80
		playSound MUSIC_STOP    ; 0005 PLAY SOUND MUSIC_STOP
		fadeInB                 ; 0039 FADE IN FROM BLACK
		nextText $80,$7         ; "Ouch!  Hey, {NAME;26}!{N}I like your wild driving!{W2}"
		nextSingleText $80,$7   ; "Where's Sir Astral?{W1}"
		setFacing $7,$0         ; 0023 SET ENTITY FACING 7 0
		csWait $14
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		csWait $14
		setFacing $7,$0         ; 0023 SET ENTITY FACING 7 0
		csWait $14
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		csWait $14
		entityShiver $7         ; 002A MAKE ENTITY SHIVER 7
		nextSingleText $80,$7   ; "Oh, there he is!{W1}"
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		moveEntity $7,$FF,$2,$3 ; 002D MOVE ENTITY 7 FF 2 3
		moreMove $9,$1
		endMove $8080
		nextSingleText $80,$7   ; "Sir Astral!  Are you OK?{W1}"
		setFacing $7,$2         ; 0023 SET ENTITY FACING 7 2
		nextSingleText $80,$7   ; "{LEADER}, come on!{W1}"
		csc_end
cs_5FB30:       textCursor $D25         ; 0004 INIT TEXT CURSOR D25 : "Phew!  We've made it to{N}Grans Island!{W1}"
		setActscript $80,$FF,eas_Init; 0015 SET ACTSCRIPT 80 FF 460CE
		setFacing $80,$3        ; 0023 SET ENTITY FACING 80 3
		entityShakeHead $80     ; 0027 MAKE ENTITY SHAKE HEAD 80
		nextText $0,$80         ; "Phew!  We've made it to{N}Grans Island!{W1}"
		nextText $0,$80         ; "{LEADER}, Geshp's probably{N}coming for us!{W2}"
		nextText $0,$80         ; "Evacuate the ship!{W1}"
		nextText $0,$80         ; "What are you doing?{N}Get off the ship!{W2}"
		nextSingleText $0,$80   ; "I'll go first.{W1}"
		moveEntity $80,$FF,$0,$4; 002D MOVE ENTITY 80 FF 0 4
		moreMove $4,$1
		moreMove $0,$3
		endMove $8080
		hideEntity $80          ; 002E HIDE ENTITY 80
		csc_end
cs_5FB6A:       textCursor $D31         ; 0004 INIT TEXT CURSOR D31 : "Wow, the ship is vibrating!{W1}"
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuake $1             ; 0033 SET QUAKE AMOUNT 1
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $80,$FF,eas_Init; 0015 SET ACTSCRIPT 80 FF 460CE
		setActscript $1A,$FF,eas_Init; 0015 SET ACTSCRIPT 1A FF 460CE
		setCamDest $B,$6        ; 0032 SET CAMERA DEST B 6
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		nextSingleText $80,$7   ; "Wow, the ship is vibrating!{W1}"
		setFacing $80,$1        ; 0023 SET ENTITY FACING 80 1
		nextSingleText $0,$80   ; "What's going on?{W1}"
		setEntityDest $1A,$B,$B ; 0029 SET ENTITY DEST 1A B B
		setEntityDest $1A,$E,$B ; 0029 SET ENTITY DEST 1A E B
		setEntityDest $1A,$F,$A ; 0029 SET ENTITY DEST 1A F A
		setEntityDest $1A,$10,$A; 0029 SET ENTITY DEST 1A 10 A
		setFacing $1A,$3        ; 0023 SET ENTITY FACING 1A 3
		nextSingleText $0,$1A   ; "Don't worry. {W1}"
		setActscript $7,$FF,eas_Jump; 0015 SET ACTSCRIPT 7 FF 45E44
		nextSingleText $80,$7   ; "But...but...{N}Woooooow!{W1}"
		setCamDest $4,$6        ; 0032 SET CAMERA DEST 4 6
		setFacing $0,$1         ; 0023 SET ENTITY FACING 0 1
		playSound $FE           ; 0005 PLAY SOUND 
		playSound SFX_BIG_DOOR_RUMBLE; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
		setQuake $3             ; 0033 SET QUAKE AMOUNT 3
		csWait $14
		setQuake $1             ; 0033 SET QUAKE AMOUNT 1
		playSound MUSIC_MITULA_SHRINE; 0005 PLAY SOUND MUSIC_MITULA_SHRINE
		executeSubroutine csub_5FD3A; 000A EXECUTE SUBROUTINE 5FD3A
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		moveEntity $80,$0,$1,$1 ; 002D MOVE ENTITY 80 0 1 1
		moreMove $2,$1
		moreMove $6,$1
		moreMove $2,$6
		endMove $8080
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		moreMove $2,$2
		moreMove $6,$1
		moreMove $2,$5
		endMove $8080
		setFacing $80,$1        ; 0023 SET ENTITY FACING 80 1
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		nextSingleText $0,$7    ; "It's floating!  This big{N}ship is floating!{W1}"
		setFacing $1A,$2        ; 0023 SET ENTITY FACING 1A 2
		setCamDest $B,$6        ; 0032 SET CAMERA DEST B 6
		nextSingleText $80,$1A  ; "We're going higher and{N}higher....{W1}"
		csWait $28
		fadeOutB                ; 003A FADE OUT TO BLACK
		setCameraEntity $FFFF   ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		mapLoad $4B,$28,$C      ; 0048 LOAD MAP 4B 28 C
		loadMapEntities ce_5FDD4; 0042 RELATED TO LOADING MAP ENTITIES 5FDD4
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setBlocks $3C,$3B,$4,$5,$2C,$F; 0034 SET BLOCKS 3C3B 405 2C0F
		fadeInB                 ; 0039 FADE IN FROM BLACK
		executeSubroutine sub_5FD7C; 000A EXECUTE SUBROUTINE 5FD7C
		csWait $3C
		nextSingleText $0,$1F   ; "I've never experienced{N}anything like this in my{N}seventy years of life!{W1}"
		csWait $3C
		fadeOutB                ; 003A FADE OUT TO BLACK
		mapLoad $25,$4,$6       ; 0048 LOAD MAP 25 4 6
		loadEntitiesFromMapSetup $9,$B,$0
						; 0049  9 B 0
		csWait $1
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $80,$FF,eas_Init; 0015 SET ACTSCRIPT 80 FF 460CE
		setActscript $1A,$FF,eas_Init; 0015 SET ACTSCRIPT 1A FF 460CE
		entityPosDir $80,$9,$C,$1; 0019 SET ENTITY POS AND FACING 80 9 C 1
		entityPosDir $7,$A,$C,$1; 0019 SET ENTITY POS AND FACING 7 A C 1
		entityPosDir $1A,$A,$B,$2; 0019 SET ENTITY POS AND FACING 1A A B 2
		fadeInB                 ; 0039 FADE IN FROM BLACK
		nextSingleText $80,$1A  ; "OK, now we'll head to{N}Grans Island.{W1}"
		setQuake $1             ; 0033 SET QUAKE AMOUNT 1
		csWait $A
		setQuake $0             ; 0033 SET QUAKE AMOUNT 0
		executeSubroutine sub_5FD4C; 000A EXECUTE SUBROUTINE 5FD4C
		setFacing $80,$2        ; 0023 SET ENTITY FACING 80 2
		nextSingleText $0,$80   ; "Oh, we're flying!{W1}"
		nextSingleText $0,$7    ; "The Ancients were greater{N}than we thought!{W1}"
		setFacing $80,$1        ; 0023 SET ENTITY FACING 80 1
		setFacing $1A,$3        ; 0023 SET ENTITY FACING 1A 3
		nextSingleText $80,$1A  ; "Oh, thank you very much.{W1}"
		csWait $3C
		fadeOutB                ; 003A FADE OUT TO BLACK
		mapLoad $4B,$28,$C      ; 0048 LOAD MAP 4B 28 C
		loadMapEntities ce_5FDD4; 0042 RELATED TO LOADING MAP ENTITIES 5FDD4
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		setBlocks $3C,$3B,$4,$5,$2C,$F; 0034 SET BLOCKS 3C3B 405 2C0F
		customActscript $80,$FF ; 0014 SET MANUAL ACTSCRIPT 80
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $80,$0,$2,$1E; 002D MOVE ENTITY 80 0 2 1E
		endMove $8080
		executeSubroutine sub_5FD5E; 000A EXECUTE SUBROUTINE 5FD5E
		fadeInB                 ; 0039 FADE IN FROM BLACK
		csWait $F
		executeSubroutine sub_5FD66; 000A EXECUTE SUBROUTINE 5FD66
		csWait $78
		mapSysEvent $3B,$3F,$3F,$0; 0007 EXECUTE MAP SYSTEM EVENT 3B3F3F00
		csc_end

; =============== S U B R O U T I N E =======================================

csub_5FD3A:
		moveq   #7,d7
loc_5FD3C:
		subq.b  #1,($FFFFA849).w
		moveq   #4,d0
		jsr     (Sleep).w       
		dbf     d7,loc_5FD3C
		rts

	; End of function csub_5FD3A


; =============== S U B R O U T I N E =======================================

sub_5FD4C:
		moveq   #7,d7
loc_5FD4E:
		subq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		moveq   #4,d0
		jsr     (Sleep).w       
		dbf     d7,loc_5FD4E
		rts

	; End of function sub_5FD4C


; =============== S U B R O U T I N E =======================================

sub_5FD5E:
		move.b  #$18,((byte_FFAEEE+5-$1000000)).w
		rts

	; End of function sub_5FD5E


; =============== S U B R O U T I N E =======================================

sub_5FD66:
		moveq   #$B,d7
loc_5FD68:
		subq.b  #1,((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
		subq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
		moveq   #4,d0
		jsr     (Sleep).w       
		dbf     d7,loc_5FD68
		rts

	; End of function sub_5FD66


; =============== S U B R O U T I N E =======================================

sub_5FD7C:
		bsr.w   sub_5FD92
		moveq   #$17,d7
loc_5FD82:
		addq.b  #1,((byte_FFAEEE+5-$1000000)).w
		moveq   #4,d0
		jsr     (Sleep).w       
		dbf     d7,loc_5FD82
		rts

	; End of function sub_5FD7C


; =============== S U B R O U T I N E =======================================

sub_5FD92:
		move.b  #1,((byte_FFDFAB-$1000000)).w
		lea     plt_5FDB4(pc), a0
		lea     (PALETTE_4_BIS).l,a1
		moveq   #$20,d7 
		jsr     (CopyBytes).w   
		lea     (PALETTE_1_BIS).l,a0
		jsr     (sub_19C8).w    
		rts

	; End of function sub_5FD92

plt_5FDB4:      dc.w 0
		dc.w 0
		dc.w 0
		dc.w $E60
		dc.w $EA4
		dc.w $CC8
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $ECC
		dc.w 0
		dc.w $EEE
ce_5FDD4:       dc.w 0
		dc.w 0
		dc.w 3
		dc.b $2D
		dc.b $11
		dc.b 0
		dc.b $FD
		dc.l eas_Init           
		dc.w $FFFF
