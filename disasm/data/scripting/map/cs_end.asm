
; ASM FILE data\scripting\map\cs_end.asm :
; 0x49058..0x494BC : End cutscene
EndCutscene:
		dc.w $48                
						; 0048 LOAD MAP 14 13 21
		dc.w $14
		dc.w $13
		dc.w $21
		dc.w $42                
						; 0042 RELATED TO LOADING MAP ENTITIES 492CC
		dc.l word_492CC
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 FF 460CE
		dc.b 0
		dc.b $FF
		dc.l eas_Init           
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 0
		dc.b 0
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF MANUAL ACTSCRIPT
		dc.b $80
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 80
		dc.b $80
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF MANUAL ACTSCRIPT
		dc.b $80
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 81
		dc.b $81
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF MANUAL ACTSCRIPT
		dc.b $80
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 82
		dc.b $82
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF MANUAL ACTSCRIPT
		dc.b $80
		dc.w $14                
						; 0014 SET MANUAL ACTSCRIPT 83
		dc.b $83
		dc.b $FF
		dc.w $10                
						;   0010 SET SPEED X=$14 Y=$14
		dc.b $14
		dc.b $14
		dc.w $34                
						;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.b $80                
						; 0014 END OF MANUAL ACTSCRIPT
		dc.b $80
		dc.w $1A                
						; 001A SET ENTITY SPRITE B AA
		dc.w $B
		dc.w $AA
		dc.w $39                
						; 0039 FADE IN FROM BLACK
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 0 19 23 0
		dc.b 0
		dc.b $19
		dc.b $23
		dc.b 0
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 7 1
		dc.b 0
		dc.b $FF
		dc.b 7
		dc.b 1
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 3 4
		dc.b 0
		dc.b $FF
		dc.b 3
		dc.b 4
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.w $2D                
						; 002D MOVE ENTITY 80 FF 0 1
		dc.b $80
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 81 FF 0 1
		dc.b $81
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $26                
						; 0026 MAKE ENTITY NOD 80
		dc.w $80
		dc.w $26                
						; 0026 MAKE ENTITY NOD 81
		dc.w $81
		dc.w $26                
						; 0026 MAKE ENTITY NOD 0
		dc.w 0
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $2D                
						; 002D MOVE ENTITY 0 FF 1 4
		dc.b 0
		dc.b $FF
		dc.b 1
		dc.b 4
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.b $80                
						; WAIT 50
		dc.b $50
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 83 19 23 0
		dc.b $83
		dc.b $19
		dc.b $23
		dc.b 0
		dc.w $2D                
						; 002D MOVE ENTITY 83 FF 7 1
		dc.b $83
		dc.b $FF
		dc.b 7
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $26                
						; 0026 MAKE ENTITY NOD 0
		dc.w 0
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $2D                
						; 002D MOVE ENTITY 0 0 3 4
		dc.b 0
		dc.b 0
		dc.b 3
		dc.b 4
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 83 FF 0 1
		dc.b $83
		dc.b $FF
		dc.b 0
		dc.b 1
		dc.b 3
		dc.b 3
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.w $23                
						; 0023 SET ENTITY FACING 83 2
		dc.b $83
		dc.b 2
		dc.w $15                
						; 0015 SET ACTSCRIPT 80 0 45E44
		dc.b $80
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 81 0 45E44
		dc.b $81
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 82 FF 45E44
		dc.b $82
		dc.b $FF
		dc.l eas_Jump           
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $23                
						; 0023 SET ENTITY FACING 82 3
		dc.b $82
		dc.b 3
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $23                
						; 0023 SET ENTITY FACING 81 1
		dc.b $81
		dc.b 1
		dc.w $26                
						; 0026 MAKE ENTITY NOD 82
		dc.w $82
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $23                
						; 0023 SET ENTITY FACING 80 1
		dc.b $80
		dc.b 1
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $23                
						; 0023 SET ENTITY FACING 81 3
		dc.b $81
		dc.b 3
		dc.w $26                
						; 0026 MAKE ENTITY NOD 80
		dc.w $80
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $23                
						; 0023 SET ENTITY FACING 81 0
		dc.b $81
		dc.b 0
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $23                
						; 0023 SET ENTITY FACING 80 0
		dc.b $80
		dc.b 0
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $23                
						; 0023 SET ENTITY FACING 0 1
		dc.b 0
		dc.b 1
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $23                
						; 0023 SET ENTITY FACING 83 3
		dc.b $83
		dc.b 3
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.b $80                
						; WAIT A
		dc.b $A
		dc.w $23                
						; 0023 SET ENTITY FACING 83 2
		dc.b $83
		dc.b 2
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $2D                
						; 002D MOVE ENTITY 0 0 2 4
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 4
		dc.w $8080
		dc.w $2D                
						; 002D MOVE ENTITY 83 FF 2 4
		dc.b $83
		dc.b $FF
		dc.b 2
		dc.b 4
		dc.w $8080
		dc.w $26                
						; 0026 MAKE ENTITY NOD 81
		dc.w $81
		dc.w $26                
						; 0026 MAKE ENTITY NOD 83
		dc.w $83
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $23                
						; 0023 SET ENTITY FACING 82 1
		dc.b $82
		dc.b 1
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $15                
						; 0015 SET ACTSCRIPT 82 FF 45E44
		dc.b $82
		dc.b $FF
		dc.l eas_Jump           
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $2D                
						; 002D MOVE ENTITY 82 FF 1 1
		dc.b $82
		dc.b $FF
		dc.b 1
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING 82 3
		dc.b $82
		dc.b 3
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING B 17 25 3
		dc.b $B
		dc.b $17
		dc.b $25
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY B 0 3 1
		dc.b $B
		dc.b 0
		dc.b 3
		dc.b 1
		dc.b 2
		dc.b 2
		dc.b 3
		dc.b 2
		dc.w $8080
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 2 17 25 3
		dc.b 2
		dc.b $17
		dc.b $25
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY 2 0 3 1
		dc.b 2
		dc.b 0
		dc.b 3
		dc.b 1
		dc.b 2
		dc.b 2
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING A 17 25 3
		dc.b $A
		dc.b $17
		dc.b $25
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY A 0 3 1
		dc.b $A
		dc.b 0
		dc.b 3
		dc.b 1
		dc.b 2
		dc.b 2
		dc.w $8080
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 3 17 25 3
		dc.b 3
		dc.b $17
		dc.b $25
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY 3 0 3 1
		dc.b 3
		dc.b 0
		dc.b 3
		dc.b 1
		dc.b 2
		dc.b 1
		dc.w $8080
		dc.b $80                
						; WAIT 14
		dc.b $14
		dc.w $19                
						; 0019 SET ENTITY POS AND FACING 7 17 25 3
		dc.b 7
		dc.b $17
		dc.b $25
		dc.b 3
		dc.w $2D                
						; 002D MOVE ENTITY 7 0 3 1
		dc.b 7
		dc.b 0
		dc.b 3
		dc.b 1
		dc.w $8080
		dc.w $23                
						; 0023 SET ENTITY FACING B 0
		dc.b $B
		dc.b 0
		dc.b $80                
						; WAIT A
		dc.b $A
		dc.w $23                
						; 0023 SET ENTITY FACING 2 0
		dc.b 2
		dc.b 0
		dc.b $80                
						; WAIT A
		dc.b $A
		dc.w $23                
						; 0023 SET ENTITY FACING A 3
		dc.b $A
		dc.b 3
		dc.b $80                
						; WAIT A
		dc.b $A
		dc.w $23                
						; 0023 SET ENTITY FACING 3 3
		dc.b 3
		dc.b 3
		dc.w $23                
						; 0023 SET ENTITY FACING 0 1
		dc.b 0
		dc.b 1
		dc.w $23                
						; 0023 SET ENTITY FACING 83 1
		dc.b $83
		dc.b 1
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.w $23                
						; 0023 SET ENTITY FACING 83 2
		dc.b $83
		dc.b 2
		dc.b $80                
						; WAIT 1E
		dc.b $1E
		dc.w $23                
						; 0023 SET ENTITY FACING 0 1
		dc.b 0
		dc.b 1
		dc.w $23                
						; 0023 SET ENTITY FACING 83 1
		dc.b $83
		dc.b 1
		dc.b $80                
						; WAIT 28
		dc.b $28
		dc.w $15                
						; 0015 SET ACTSCRIPT B 0 45E44
		dc.b $B
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 2 0 45E44
		dc.b 2
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT A 0 45E44
		dc.b $A
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 3 0 45E44
		dc.b 3
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 0 45E44
		dc.b 7
		dc.b 0
		dc.l eas_Jump           
		dc.w $23                
						; 0023 SET ENTITY FACING 83 2
		dc.b $83
		dc.b 2
		dc.w $26                
						; 0026 MAKE ENTITY NOD 80
		dc.w $80
		dc.w $23                
						; 0023 SET ENTITY FACING 0 2
		dc.b 0
		dc.b 2
		dc.b $80                
						; WAIT 32
		dc.b $32
		dc.w $26                
						; 0026 MAKE ENTITY NOD 0
		dc.w 0
		dc.w $15                
						; 0015 SET ACTSCRIPT B 0 45E44
		dc.b $B
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 2 0 45E44
		dc.b 2
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT A 0 45E44
		dc.b $A
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 3 0 45E44
		dc.b 3
		dc.b 0
		dc.l eas_Jump           
		dc.w $15                
						; 0015 SET ACTSCRIPT 7 0 45E44
		dc.b 7
		dc.b 0
		dc.l eas_Jump           
		dc.w $3A                
						; 003A FADE OUT TO BLACK
		dc.b $FF                
						; END OF CUTSCENE SCRIPT
		dc.b $FF
word_492CC:
		dc.w $3F
		dc.w $3F
		dc.w 3
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $B
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b 2
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $A
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b 3
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b 7
		dc.l eas_Init           
		dc.b $15
		dc.b $28
		dc.b 0
		dc.b $D1
		dc.l eas_Init           
		dc.b $15
		dc.b $27
		dc.b 0
		dc.b $CB
		dc.l eas_Init           
		dc.b $16
		dc.b $26
		dc.b 0
		dc.b $CD
		dc.l eas_Init           
		dc.b $3F
		dc.b $3F
		dc.b 3
		dc.b $CC
		dc.l eas_Init           
		dc.w $FFFF
dms_01:
		dc.w $52                
						; 0052 RELATED TO TWO ENTITIES 86 0
		dc.w $86
		dc.w 0
		dc.w $56                
						; 0056 SOMETHING WITH AN ENTITY 5
		dc.w 5
		dc.w $56                
						; 0056 SOMETHING WITH AN ENTITY 3
		dc.w 3
		dc.w $56                
						; 0056 SOMETHING WITH AN ENTITY 1A
		dc.w $1A
		dc.w $2C                
						; 002C FOLLOW ENTITY 7 0 2
		dc.w 7
		dc.w 0
		dc.w 2
		dc.w $31                
						; 0031 MOVE ENTITY ABOVE ENTITY 0 0
		dc.w 0
		dc.w 0
		dc.b $FF                
						; END OF CUTSCENE SCRIPT
		dc.b $FF
		dc.w $24                
						; 0024 SET ENTITY FOLLOWED BY CAMERA 0
		dc.w 0
		dc.w $15                
						; 0015 SET ACTSCRIPT 0 0 44E3E
		dc.b 0
		dc.b 0
		dc.l eas_ControlledCharacter
word_4934A:
		dc.w $18                
						; 0018 FLASH ENTITY WHITE 0 B4
		dc.w 0
		dc.w $B4
		dc.w $B                 
						; 000B JUMP 4934A
		dc.l word_4934A         
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
		dc.w 4                  
						; 0004 INIT TEXT CURSOR 142 : "{NAME} did nothing."
		dc.w $142
		dc.w $15                
						; 0015 SET ACTSCRIPT 1 1 44E3E
		dc.b 1
		dc.b 1
		dc.l eas_ControlledCharacter
		dc.w $1D                
						; 001D SHOW PORTRAIT 0
		dc.w 0
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 8002
		dc.w $8002
		dc.w $33                
						; 0033 SET QUAKE AMOUNT 4002
		dc.w $4002
		dc.w $37                
						; 0037 LOAD MAP AND FADE IN 0 D D
		dc.w 0
		dc.w $D
		dc.w $D
		dc.w $41                
						; 0041 FLASH SCREEN WHITE 3C
		dc.w $3C
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
		dc.w $41
		dc.w $3C
		dc.w $FFFF
		dc.w $1C                
						; 001C STOP ENTITY ANIM 4
		dc.w 4
		dc.w $15                
						; 0015 SET ACTSCRIPT 1 1 493A2
		dc.b 1
		dc.b 1
		dc.l eas_493A2          
		dc.w $16                
						; 0016 WAIT UNTIL IDLE ENTITY 1
		dc.w 1
		dc.w $1D                
						; 001D SHOW PORTRAIT 0
		dc.w 0
		dc.b $80                
						; WAIT 3C
		dc.b $3C
		dc.w $1B                
						; 001B START ENTITY ANIM 4
		dc.w 4
		dc.w $1E                
						; 001E HIDE PORTRAIT
		dc.w $FFFF              
						; END OF CUTSCENE SCRIPT
eas_493A2:
		dc.w $18                
						; 0018 SET 1C BIT 7 $FFFF
		dc.w $FFFF
		dc.w $19                
						; 0019 SET 1C BIT 6 $FFFF
		dc.w $FFFF
		dc.w $1A                
						; 001A SET 1C BIT 5 $FFFF
		dc.w $FFFF
		dc.w $10                
						; 0010 SET SPEED X=$20 Y=$20
		dc.b $20
		dc.b $20
		dc.w $11                
						; 0011  $0
		dc.w 0
		dc.w $12                
						; 0012  $FEFF
		dc.w $FEFF
		dc.w $13                
						; 0013  $FEFF
		dc.w $FEFF
		dc.w $40                
						; 0040 
		dc.w 2                  
						; 0002 BIG ONE RELATED TO CAMERA
		dc.w 1                  
						; 0001 WAIT UNTIL DESTINATION
		dc.w $40                
						; 0040 
		dc.w 0                  
						; 0000 WAIT value $1
		dc.w 1
word_493CA:
		dc.w $30                
						; 0030 BRANCH TO CURRENT ADDR. + $BA74
		dc.w eas_ControlledCharacter+$10000-word_493CA
		dc.w 4                  
						; 0004 SET TEXT INDEX 142
		dc.w $142
		dc.w $1E                
						; 001E HIDE PORTRAIT
		dc.w $A                 
						; 000A EXECUTE SUBROUTINE 493EC
		dc.l sub_493EC
		dc.w 1                  
						; 0001 DISPLAY SINGLE TEXT BOX WITH VARS 0 4
		dc.w 0
		dc.w 4
		dc.w $14                
						; 0014 SET ACTSCRIPT MANUAL 0
		dc.b 0
		dc.b 0
		dc.w 0                  
						; 0000 WAIT value $1D
		dc.w $1D
		dc.w 0                  
						; 0000 WAIT value $FFFF
		dc.w $FFFF

; =============== S U B R O U T I N E =======================================

sub_493EC:
		
		move.w  #$18A,d0        
						; 018A={NAME} found{N}the {ITEM}.{D1}
		jsr     (DisplayText).l 
		moveq   #$78,d0 
		rts

	; End of function sub_493EC

		dc.w $20
		dc.w $1F
		dc.w 7
		dc.w $1F
		dc.w 1
		dc.w $1F
		dc.w 2
		dc.w $1F
		dc.w 6
		dc.w $21
		dc.w $80
		dc.w $21
		dc.w $96
		dc.w $1F
		dc.w 3
		dc.w $1D
		dc.w 0
		dc.w $FFFF
		dc.w $24
		dc.w $FFFF
		dc.w $18
		dc.w 0
		dc.w $28
		dc.w $2E
		dc.w 0
		dc.w $19
		dc.w $60D
		dc.w $1703
		dc.w $18
		dc.w 6
		dc.w $28
		dc.w $22
		dc.w 6
		dc.w 7
		dc.w 5
		dc.w 4
		dc.w $FFFF
		dc.w 4
		dc.w $18A
		dc.w $1D
		dc.w 0
		dc.w 3
		dc.w 0
		dc.w 3
		dc.w $A
		dc.w 1
		dc.w 0
		dc.w 4
		dc.w $14
		dc.w $1D
		dc.w 0
		dc.w $8078
		dc.w $1E
		dc.w 4
		dc.w $142
		dc.w 2
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w $FFFF
		dc.w $14
		dc.w $501
		dc.w $15
		dc.w 0
		dc.w $11
		dc.w 1
		dc.w $10
		dc.b 0
		dc.b $20
		dc.w $12
		dc.w 0
		dc.w $13
		dc.w $FFFF
		dc.w 4
		dc.w 0
		dc.w $FFFF
		dc.w 0
		dc.w 5
		dc.w 4
		dc.w 0
		dc.w 1
		dc.w 0
		dc.w 5
		dc.w 4
		dc.w 0
		dc.w 0
		dc.w 0
		dc.w 5
		dc.w $15
		dc.w $FFFF
		dc.w $30
		dc.w $BD50
		dc.b $80
		dc.b $80
		dc.b 0
		dc.b $1D
		dc.b 0
		dc.b 0
		dc.b $80
		dc.b $3C
		dc.b 0
		dc.b $1E
		dc.b $FF
		dc.b $FF
