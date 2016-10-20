
; ASM FILE data\scripting\entity\eas_battleneutralentities.asm :
; 0x4497A..0x449C6 : Entity actscripts for battle entities which are not force members or enemies
eas_LyingLeft:
		dc.w $1B                
						; 001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 
						; 000A UPDATE SPRITE
eas_Motionless:
		dc.w $14                
						; 0014 SET ANIM COUNTER $0
		dc.w 0
word_44984:
		dc.w $30                
						; 0030 BRANCH TO CURRENT ADDR. + $878
		dc.w eas_Idle-word_44984
eas_LyingRight:
		dc.w $1B                
						; 001B SET FLIPPING $3
		dc.w 3
		dc.w $A                 
						; 000A UPDATE SPRITE
word_4498E:
		dc.w $30                
						; 0030 BRANCH TO CURRENT ADDR. + $FFF2
		dc.w eas_Motionless+$10000-word_4498E
eas_WhirlsInWater:
		dc.w $20                
						; 0020 SET ENTITY IN WATER $FFFF
		dc.w $FFFF
		dc.w $1E                
						; 001E SET ANIM SPEED X2 $FFFF
		dc.w $FFFF
word_4499A:
		dc.w $22                
						; 0022 SET FACING $0
		dc.w 0
		dc.w $A                 
						; 000A UPDATE SPRITE
		dc.w 0                  
						; 0000 WAIT value $A
		dc.w $A
		dc.w $22                
						; 0022 SET FACING $1
		dc.w 1
		dc.w $A                 
						; 000A UPDATE SPRITE
		dc.w 0                  
						; 0000 WAIT value $A
		dc.w $A
		dc.w $22                
						; 0022 SET FACING $2
		dc.w 2
		dc.w $A                 
						; 000A UPDATE SPRITE
		dc.w 0                  
						; 0000 WAIT value $A
		dc.w $A
		dc.w $22                
						; 0022 SET FACING $3
		dc.w 3
		dc.w $A                 
						; 000A UPDATE SPRITE
		dc.w 0                  
						; 0000 WAIT value $A
		dc.w $A
word_449C2:
		dc.w $30                
						; 0030 BRANCH TO CURRENT ADDR. + $FFD8
		dc.w word_4499A+$10000-word_449C2
