
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
eas_5FFC4:      dc.w 0                  ; 0000 WAIT value $10
		dc.w $10
eas_5FFC8:      dc.w $11                ; 0011  $0
		dc.w 0
		dc.w $10                ; 0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $12                ; 0012  $0
		dc.w 0
		dc.w $13                ; 0013  $0
		dc.w 0
		dc.w $18                ; 0018 SET 1C BIT 7 $FFFF
		dc.w $FFFF
		dc.w $14                ; 0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $22                ; 0022 SET FACING $3
		dc.w 3
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$FFFF
		dc.w 0
		dc.w $FFFF
		dc.w 0                  ; 0000 WAIT value $8
		dc.w 8
		dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$0
		dc.w 0
		dc.w 0
		dc.w $22                ; 0022 SET FACING $0
		dc.w 0
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $8
		dc.w 8
		dc.w $22                ; 0022 SET FACING $1
		dc.w 1
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$1
		dc.w 0
		dc.w 1
		dc.w 0                  ; 0000 WAIT value $8
		dc.w 8
		dc.w 4                  ; 0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$0
		dc.w 0
		dc.w 0
		dc.w $22                ; 0022 SET FACING $0
		dc.w 0
		dc.w $A                 ; 000A UPDATE SPRITE
		dc.w 0                  ; 0000 WAIT value $8
		dc.w 8
word_60020:     dc.w $30                ; 0030 BRANCH TO CURRENT ADDR. + $FFA8
		dc.w (eas_5FFC8-word_60020) & $FFFF
