
; SCRIPT SECTION mapsetups\map03\s1 :
; 
ms_map3_Entities:   dc.b $2A                ; initial X of entity
										dc.b 8                  ; initial Y pos
										dc.b 3                  ; initial facing
										dc.b 1                  ; sprite
										dc.l eas_Init           ; script
										dc.b $2C
										dc.b $A
										dc.b 1
										dc.b 2
										dc.l eas_Init           
										dc.b 5
										dc.b 6
										dc.b 0
										dc.b $C3
										dc.l eas_Init2          
										dc.b $D                 ; Initial XPos
										dc.b 8                  ; Initial YPos
										dc.b 0                  ; Initial Facing
										dc.b $C7                ; Entity Number ? Determines the sprite, no matter the facing
										dc.l eas_Init           ; Actscript to apply
										dc.b $14                ; Initial XPos
										dc.b $D                 ; Initial YPos
										dc.b 3                  ; Initial Facing
										dc.b $C1                ; Entity Number ? Determines the sprite, no matter the facing
										dc.b $FF                ; FF to give random walk
										dc.b $14                ; Random Center XPos
										dc.b $D                 ; Random Center YPos
										dc.b 3                  ; Max Distance from center
										dc.b $12
										dc.b $A
										dc.b 3
										dc.b $C3
										dc.b $FF
										dc.b $12
										dc.b $A
										dc.b 1
										dc.b $15
										dc.b 9
										dc.b 3
										dc.b $C8
										dc.l eas_Init           
										dc.b $C
										dc.b 9
										dc.b 3
										dc.b $C6
										dc.b $FF
										dc.b $C
										dc.b 9
										dc.b 1
										dc.b 7
										dc.b $12
										dc.b 3
										dc.b $C1
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $D1
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $D1
										dc.l eas_Init           
										dc.b $2D
										dc.b $16
										dc.b 1
										dc.b $C4
										dc.l eas_Init           
										dc.b $1B
										dc.b 3
										dc.b 3
										dc.b $CE
										dc.l eas_Init           
										dc.b $1F
										dc.b 3
										dc.b 3
										dc.b $CE
										dc.l eas_Init           
										dc.b 1
										dc.b $17
										dc.b 0
										dc.b $CE
										dc.l eas_Init           
										dc.b $20
										dc.b $B
										dc.b 3
										dc.b $C0
										dc.l eas_Init           
										dc.b $36
										dc.b $11
										dc.b 1
										dc.b $D1
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $CE
										dc.l eas_Init           
										dc.b 8
										dc.b $12
										dc.b 3
										dc.b $C1
										dc.l eas_Init           
										dc.w $FFFF
