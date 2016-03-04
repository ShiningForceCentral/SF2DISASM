
; SCRIPT SECTION maps\entries\map61\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map61_InitFunction:
										
										rts

	; End of function ms_map61_InitFunction

cs_5C6CA:           dc.w 4                  ; 0004 SET TEXT INDEX E3A
										dc.w $E3A
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $29                ; 0029 SET ENTITY DEST 0 4 9
										dc.w 0
										dc.w 4
										dc.w 9
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $29                ; 0029 SET ENTITY DEST 7 6 9
										dc.w 7
										dc.w 6
										dc.w 9
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 0 5
										dc.w 0
										dc.w 5
										dc.w $29                ; 0029 SET ENTITY DEST 1E 5 7
										dc.w $1E
										dc.w 5
										dc.w 7
										dc.w $29                ; 0029 SET ENTITY DEST 1F 5 9
										dc.w $1F
										dc.w 5
										dc.w 9
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1E 3
										dc.b $1E
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1E 1
										dc.b $1E
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $18                ; 0018 FLASH ENTITY WHITE 1E 28
										dc.w $1E
										dc.w $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w $34                ; 0034 SET BLOCKS B00 101 506
										dc.w $B00
										dc.w $101
										dc.w $506
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 1E 3
										dc.b $1E
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $13                ; 0013 SET STORY FLAG F
										dc.w $F
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1E 1F 2
										dc.w $1E
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
