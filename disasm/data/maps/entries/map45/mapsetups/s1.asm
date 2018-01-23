
; ASM FILE data\maps\entries\map45\mapsetups\s1.asm :
; 0x5FF7A..0x60024 : 
ms_map45_Entities:
		dc.b 6
		dc.b 6
		dc.b 3
		dc.b $19
		dc.l eas_Init
		dc.b $C
		dc.b $1E
		dc.b 3
		dc.b $B9
		dc.b $FF
		dc.b $C
		dc.b $1E
		dc.b 1
		dc.b $C
		dc.b $1B
		dc.b 0
		dc.b $B9
		dc.l eas_Init
		dc.b $D
		dc.b $1B
		dc.b 2
		dc.b $B9
		dc.l eas_Init
		dc.b $C
		dc.b $18
		dc.b 3
		dc.b $92
		dc.l eas_Init
		dc.b $F
		dc.b $1C
		dc.b 1
		dc.b $B8
		dc.l eas_5FFC4
		dc.b 9
		dc.b $1A
		dc.b 1
		dc.b $B8
		dc.l eas_5FFC8
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $B5
		dc.l eas_Init
		dc.b $3F
		dc.b $3F
		dc.b 1
		dc.b $B4
		dc.l eas_Init
		dc.w $FFFF
eas_5FFC4:      ac_wait 16
eas_5FFC8:      ac_11 $0
		ac_setSpeed 5140
		ac_12 $0
		ac_13 $0
		ac_set1Cb7 $FFFF
		ac_setAnimCounter $0
		ac_setFacing DOWN
		ac_updateSprite
		ac_moveRel 0,65535
		ac_wait 8
		ac_moveRel 0,0
		ac_setFacing RIGHT
		ac_updateSprite
		ac_wait 8
		ac_setFacing UP
		ac_updateSprite
		ac_moveRel 0,1
		ac_wait 8
		ac_moveRel 0,0
		ac_setFacing RIGHT
		ac_updateSprite
		ac_wait 8
word_60020:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFA8
		dc.w (eas_5FFC8-word_60020) & $FFFF
