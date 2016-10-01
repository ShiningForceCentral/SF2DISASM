
; SCRIPT SECTION maps\entries\map30\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map30_InitFunction:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2F9
										beq.s   loc_5A2FE
										lea     cs_5A30C(pc), a0
										trap    #6
loc_5A2FE:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2F8
										bne.s   return_5A30A
										lea     cs_5A31E(pc), a0
										trap    #6
return_5A30A:
										
										rts

	; End of function ms_map30_InitFunction

cs_5A30C:           dc.w $34                ; 0034 SET BLOCKS 1506 202 705
										dc.w $1506
										dc.w $202
										dc.w $705
										dc.w $34                ; 0034 SET BLOCKS 1500 404 600
										dc.w $1500
										dc.w $404
										dc.w $600
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A31E:           dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $3
										dc.w 3
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1C                ; 001C STOP ENTITY ANIM 82
										dc.w $82
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A33A:           dc.w 4                  ; 0004 SET TEXT INDEX 6AF : "Where is the sick dwarf?{W1}"
										dc.w $6AF
										dc.w $32                ; 0032 SET CAMERA DEST 0 7
										dc.w 0
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 9E FF 46102
										dc.b $9E
										dc.b $FF
										dc.l eas_Init2          
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 9E
										dc.b $9E
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$0 Y=$0
										dc.b 0
										dc.b 0
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $29                ; 0029 SET ENTITY DEST 9E 8 B
										dc.w $9E
										dc.w 8
										dc.w $B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 9E : "Where is the sick dwarf?{W1}"
										dc.w $9E
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 9E 0 461B6
										dc.b $9E
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $32                ; 0032 SET CAMERA DEST 5 7
										dc.w 5
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 9E 0
										dc.b $9E
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Oh, thank goodness.{N}I sure am glad to see you.{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 3
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Here, please examine him.{W1}"
										dc.w $80
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 9E
										dc.w $9E
										dc.w $2D                ; 002D MOVE ENTITY 9E FF 0 4
										dc.b $9E
										dc.b $FF
										dc.b 0
										dc.b 4
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST A 7
										dc.w $A
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 9E : "Oh, I hope I'm not too late.{W2}"
										dc.w $9E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 9E : "Ok, let's see.{W1}"
										dc.w $9E
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 9E
										dc.w $9E
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 9E
										dc.w $9E
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $18                ; 0018 FLASH ENTITY WHITE 9E 78
										dc.w $9E
										dc.w $78
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.w $18                ; 0018 FLASH ENTITY WHITE 9E 64
										dc.w $9E
										dc.w $64
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 64
										dc.b $64
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "How is he?{W1}"
										dc.w $81
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 84
										dc.w $84
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 84 : "I don't know yet....{W1}"
										dc.w $84
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 460CE
										dc.b $82
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E44
										dc.b $82
										dc.b $FF
										dc.l eas_Jump           
										dc.w $1B                ; 001B START ENTITY ANIM 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "Whoa!{W1}"
										dc.w $82
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 461B6
										dc.b $82
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 64
										dc.b $64
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "What?{W1}"
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 82 0
										dc.b $82
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Hey, are you OK?{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82 : "I'm OK.  I'm fine.{N}I feel great!{W1}"
										dc.w $82
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 83 2
										dc.b $83
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 84 2
										dc.b $84
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 9E 1
										dc.b $9E
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Oh, how can we thank you?{W1}"
										dc.w $80
										dc.w $26                ; 0026 MAKE ENTITY NOD 82
										dc.w $82
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 9E : "I don't need anything.{W2}"
										dc.w $9E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 9E : "But, why don't you help{N}{LEADER}?{W1}"
										dc.w $9E
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 7 B 0
										dc.b $1F
										dc.b 7
										dc.b $B
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 7 A 0
										dc.b 7
										dc.b 7
										dc.b $A
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 8 B 0
										dc.b 0
										dc.b 8
										dc.b $B
										dc.b 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 9E
										dc.w $9E
										dc.w $2D                ; 002D MOVE ENTITY 9E FF 2 2
										dc.b $9E
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 9E : "{LEADER}, I'm  going now.{W2}{N}I hope your journey is safe{N}and uneventful.  Bye!{W1}"
										dc.w $9E
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 9E FF 1 2
										dc.b $9E
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 3
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 9E FF 0 1
										dc.b $9E
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 9E
										dc.w $9E
										dc.w $32                ; 0032 SET CAMERA DEST 4 7
										dc.w 4
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 2
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 3
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5A4FE:           dc.w 4                  ; 0004 SET TEXT INDEX 6C2 : "We use it to destroy large{N}rocks.{W1}"
										dc.w $6C2
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 83 2
										dc.b $83
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 84 2
										dc.b $84
										dc.b 2
										dc.w $32                ; 0032 SET CAMERA DEST 6 7
										dc.w 6
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "We use it to destroy large{N}rocks.{W1}"
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "OK, guys!{N}Let's go back to Grans{N}Island!{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Everybody dig!{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45E44
										dc.b $82
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45E44
										dc.b $83
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 45E44
										dc.b $84
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45E44
										dc.b $82
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45E44
										dc.b $83
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 45E44
										dc.b $84
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 2 1
										dc.b 0
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $29                ; 0029 SET ENTITY DEST 7 8 A
										dc.w 7
										dc.w 8
										dc.w $A
										dc.w $2D                ; 002D MOVE ENTITY 80 0 2 2
										dc.b $80
										dc.b 0
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 2 1
										dc.b $81
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 0 2 1
										dc.b $82
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 83 0 2 1
										dc.b $83
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 2 2
										dc.b $84
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 2
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 83 0 2 3
										dc.b $83
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 0 1 2
										dc.b $84
										dc.b 0
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 1 1
										dc.b $81
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 5
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 FF C 28
										dc.b $82
										dc.b $FF
										dc.b $C
										dc.b $28
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 4
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 3 1
										dc.b $82
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w $26                ; 0026 MAKE ENTITY NOD 82
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 7 3 1
										dc.b $80
										dc.b 7
										dc.b 3
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 8 3 1
										dc.b $81
										dc.b 8
										dc.b 3
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 4 1
										dc.b $82
										dc.b 7
										dc.b 4
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 8 4 1
										dc.b $83
										dc.b 8
										dc.b 4
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 7 5 1
										dc.b $84
										dc.b 7
										dc.b 5
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 1506 202 705
										dc.w $1506
										dc.w $202
										dc.w $705
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
