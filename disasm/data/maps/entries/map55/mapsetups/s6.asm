
; ASM FILE data\maps\entries\map55\mapsetups\s6.asm :
; 0x5E268..0x5E37C : 

; =============== S U B R O U T I N E =======================================

ms_map55_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $3E7
		beq.s   return_5E27A
		lea     byte_5E320(pc), a0
		trap    #6
		lea     cs_5E346(pc), a0
		trap    #6
return_5E27A:
		rts

	; End of function ms_map55_InitFunction

byte_5E27C:     setActscript $0,$FF,eas_5E2C4
		setActscript $7,$FF,eas_Init
		setActscript $7,$FF,eas_5E2C4
		setActscript $1F,$FF,eas_Init
		setActscript $1F,$FF,eas_5E2C4
		jumpIfFlagClear $4C,cs_5E2BC; Zynk is a follower
		setActscript $1A,$FF,eas_Init
		setActscript $1A,$FF,eas_5E2C4
cs_5E2BC:       mapSysEvent $25,$1D,$8,$2
		csc_end
eas_5E2C4:      dc.w $1A                ; 001A SET 1C BIT 5 $0
		dc.w 0
		dc.w 5                  ; 0005 MOVE TO ABSOLUTE DEST X=$7 Y=$7
		dc.w 7
		dc.w 7
		dc.w 0                  ; 0000 WAIT value $6
		dc.w 6
		dc.w $1F                ; 001F SET 1D BIT 3 $FFFF
		dc.w $FFFF
		dc.w $B                 ; 000B SET SPRITE SIZE $16
		dc.w $16
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $1
		dc.w 1
		dc.w $B                 ; 000B SET SPRITE SIZE $14
		dc.w $14
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $1
		dc.w 1
		dc.w $B                 ; 000B SET SPRITE SIZE $12
		dc.w $12
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $1
		dc.w 1
		dc.w $B                 ; 000B SET SPRITE SIZE $10
		dc.w $10
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $1
		dc.w 1
		dc.w $B                 ; 000B SET SPRITE SIZE $E
		dc.w $E
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $1
		dc.w 1
		dc.w $B                 ; 000B SET SPRITE SIZE $C
		dc.w $C
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 1                  ; 0001 WAIT UNTIL DESTINATION
		dc.w $17                ; 0017 SET ENTITY SPRITE $3C
		dc.w $3C
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $1
		dc.w 1
		dc.w $34                ; 0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
byte_5E320:     mapLoad $4B,$8,$E
		loadMapEntities ce_5E33E
		setActscript $0,$FF,eas_Init
		playSound MUSIC_MAIN_THEME
		fadeInB
		csc_end
ce_5E33E:       dc.b 0
		dc.b $C
		dc.w $13
		dc.b 0
		dc.b 3
		dc.w $FFFF
cs_5E346:       textCursor $D2B
		setActscript $0,$FF,eas_Init
		moveEntity $0,$FF,$2,$1
		moreMove $2,$1
		endMove $8080
		csWait $1E
		setFacing $7,$0
		setFacing $1A,$0
		setFacing $1F,$0
		setFacing $0,$0
		nextText $0,$1F         ; "What a terrible waste.{N}We've lost an ancient{N}treasure.{W2}"
		setFacing $1F,$2
		nextSingleText $0,$1F   ; "Anyway, we have to go to{N}Arc Valley.{N}{LEADER}, let's go.{W1}"
		csc_end
