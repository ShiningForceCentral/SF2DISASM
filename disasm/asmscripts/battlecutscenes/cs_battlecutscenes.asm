
; SCRIPT SECTION battlecutscenes\cs_battlecutscenes :
; To be split later
bbcs_01:            dc.w 4                  ; 0004 SET TEXT INDEX 8F4
										dc.w $8F4
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 39 2 A
										dc.w $39
										dc.w 2
										dc.w $A
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 49694
										dc.l word_49694
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 8 11 1
										dc.b 1
										dc.b 8
										dc.b $11
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 2 7 11 1
										dc.b 2
										dc.b 7
										dc.b $11
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1 FF 460CE
										dc.b 1
										dc.b $FF
										dc.l eas_Init           
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $32                ; 0032 SET CAMERA DEST 2 8
										dc.w 2
										dc.w 8
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 87 3
										dc.b $87
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87
										dc.w $87
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 87
										dc.w $87
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 1 1
										dc.b $87
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 461B6
										dc.b $87
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87
										dc.w $87
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 1 1
										dc.b $87
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b $C
										dc.b $3C
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87
										dc.w $87
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 1 3
										dc.b $87
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87
										dc.w $87
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 461B6
										dc.b $87
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 2 A
										dc.w 2
										dc.w $A
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 2 0 461B6
										dc.b 2
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 2
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 1 FF 1 1
										dc.b 1
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1
										dc.w 1
										dc.w $23                ; 0023 SET ENTITY FACING 87 1
										dc.b $87
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 2 1
										dc.w 2
										dc.w 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 7 4 3
										dc.b $80
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 46172
										dc.b $87
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 3 1
										dc.b $87
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87
										dc.w $87
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 0 1
										dc.b $87
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87
										dc.w $87
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 2 1
										dc.b $87
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87
										dc.w $87
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 7 4 3
										dc.b $81
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 4 3
										dc.b $82
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 7 4 3
										dc.b $83
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 7 4 3
										dc.b $84
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 7 4 3
										dc.b $85
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 7 4 3
										dc.b $86
										dc.b 7
										dc.b 4
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46172
										dc.b $83
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 46172
										dc.b $84
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 46172
										dc.b $85
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46172
										dc.b $86
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 81 0 1 1
										dc.b $81
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 0 2 1
										dc.b $82
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 83 0 3 1
										dc.b $83
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 0 0 2
										dc.b $84
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 0 0 3
										dc.b $85
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 0 3
										dc.b $86
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87
										dc.w $87
										dc.w $23                ; 0023 SET ENTITY FACING 87 3
										dc.b $87
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87
										dc.w $87
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_49694:         dc.w 7
										dc.w $10
										dc.w 1
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $72
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $67
										dc.l eas_Init           
										dc.b 7
										dc.b $B
										dc.b 1
										dc.b $D1
										dc.l eas_Init           
										dc.w $FFFF
word_496DC:         dc.w 4                  ; 0004 SET TEXT INDEX 901
										dc.w $901
										dc.w $55                ; 0055 RESET FORCE BATTLE STATS
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 39 2 0
										dc.w $39
										dc.w 2
										dc.w 0
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 497F6
										dc.l word_497F6
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 8 7 1
										dc.b 1
										dc.b 8
										dc.b 7
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 2 8 8 1
										dc.b 2
										dc.b 8
										dc.b 8
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 3C
										dc.w $80
										dc.w $3C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 7 A 3
										dc.b $80
										dc.b 7
										dc.b $A
										dc.b 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 72
										dc.w $80
										dc.w $72
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1 3
										dc.b 1
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 2 3
										dc.b 2
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST 2 3
										dc.w 2
										dc.w 3
										dc.b $80                ; WAIT 46
										dc.b $46
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 3C
										dc.w $80
										dc.w $3C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 7 10 3
										dc.b $80
										dc.b 7
										dc.b $10
										dc.b 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 72
										dc.w $80
										dc.w $72
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $32                ; 0032 SET CAMERA DEST 2 A
										dc.w 2
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 4
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 2 2
										dc.w 2
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 6
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 6
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_497F6:         dc.w 8
										dc.w 6
										dc.w 1
										dc.b 7
										dc.b 4
										dc.b 3
										dc.b $72
										dc.l eas_Init           
										dc.b 7
										dc.b 6
										dc.b 0
										dc.b $D1
										dc.l eas_Init           
										dc.w $FFFF
bbcs_03:            dc.w $A                 ; 000A EXECUTE SUBROUTINE 49816
										dc.l sub_49816
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_49816:
										
										move.b  #5,((RAM_EgressMapIdx-$1000000)).w
										rts

	; End of function sub_49816

bbcs_04:            dc.w 4                  ; 0004 SET TEXT INDEX 907
										dc.w $907
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 42 1 5
										dc.w $42
										dc.w 1
										dc.w 5
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4989E
										dc.l word_4989E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 4 6 9 3
										dc.b 4
										dc.b 6
										dc.b 9
										dc.b 3
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $15                ; 0015 SET ACTSCRIPT 4 FF 45E44
										dc.b 4
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w $32                ; 0032 SET CAMERA DEST 7 D
										dc.w 7
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 4
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 4
										dc.w 4
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 3 1
										dc.b $1C
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 2
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 0 2
										dc.b $1C
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4989E:         dc.w 5
										dc.w 9
										dc.w 3
										dc.b 6
										dc.b 9
										dc.b 3
										dc.b 4
										dc.l eas_Init           
										dc.b 5
										dc.b 8
										dc.b 3
										dc.b 1
										dc.l eas_Init           
										dc.b 5
										dc.b 7
										dc.b 3
										dc.b 2
										dc.l eas_Init           
										dc.b 6
										dc.b 8
										dc.b 3
										dc.b 3
										dc.l eas_Init           
										dc.b $D
										dc.b $11
										dc.b 1
										dc.b $1C
										dc.l eas_Init           
										dc.b $E
										dc.b $11
										dc.b 1
										dc.b $78
										dc.l eas_Init           
										dc.b $B
										dc.b $12
										dc.b 1
										dc.b $42
										dc.l eas_Init           
										dc.b $C
										dc.b $12
										dc.b 1
										dc.b $42
										dc.l eas_Init           
										dc.b $E
										dc.b $10
										dc.b 1
										dc.b $42
										dc.l eas_Init           
										dc.w $FFFF
word_498EE:         dc.w 4                  ; 0004 SET TEXT INDEX 90F
										dc.w $90F
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 42 9 10
										dc.w $42
										dc.w 9
										dc.w $10
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 49A6A
										dc.l word_49A6A
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1 E 15 3
										dc.b 1
										dc.b $E
										dc.b $15
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 2 C 15 3
										dc.b 2
										dc.b $C
										dc.b $15
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 3 D 16 3
										dc.b 3
										dc.b $D
										dc.b $16
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 4 B 16 3
										dc.b 4
										dc.b $B
										dc.b $16
										dc.b 3
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 3 0 461B6
										dc.b 3
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 4 0 461B6
										dc.b 4
										dc.b 0
										dc.l eas_461B6          
										dc.w $15                ; 0015 SET ACTSCRIPT 1 0 45E44
										dc.b 1
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 45E44
										dc.b 2
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1 0 45E44
										dc.b 1
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 2 FF 45E44
										dc.b 2
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C 12 16 1
										dc.b $1C
										dc.b $12
										dc.b $16
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 2
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1C 2
										dc.b $1C
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1 0
										dc.b 1
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 2 0
										dc.b 2
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 3 0
										dc.b 3
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 4 0
										dc.b 4
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 2 4
										dc.b $1C
										dc.b $FF
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 2 1
										dc.b 0
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45FBC
										dc.b 0
										dc.b 0
										dc.l eas_RotateRight    
										dc.w $23                ; 0023 SET ENTITY FACING 1 1
										dc.b 1
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 2 1
										dc.b 2
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 3 1
										dc.b 3
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 4 1
										dc.b 4
										dc.b 1
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 0 1
										dc.b $1C
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 82 0 1 1
										dc.b $82
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 2 3
										dc.b $81
										dc.b 0
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 5
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 5
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 0 1
										dc.b $1C
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 11000000
										dc.l $11000000
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_49A6A:         dc.w $D
										dc.w $14
										dc.w 3
										dc.b $E
										dc.b $15
										dc.b 3
										dc.b 1
										dc.l eas_Init           
										dc.b $C
										dc.b $15
										dc.b 3
										dc.b 2
										dc.l eas_Init           
										dc.b $D
										dc.b $16
										dc.b 3
										dc.b 3
										dc.l eas_Init           
										dc.b $B
										dc.b $16
										dc.b 3
										dc.b 4
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $1C
										dc.l eas_Init           
										dc.b $11
										dc.b $12
										dc.b 2
										dc.b $78
										dc.l eas_Init           
										dc.b $11
										dc.b $13
										dc.b 2
										dc.b $42
										dc.l eas_Init           
										dc.b $11
										dc.b $15
										dc.b 2
										dc.b $42
										dc.l eas_Init           
										dc.w $FFFF
word_49AB2:         dc.w 4                  ; 0004 SET TEXT INDEX 913
										dc.w $913
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 5 1
										dc.b 5
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $32                ; 0032 SET CAMERA DEST C 0
										dc.w $C
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 0 1
										dc.b 5
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 2
										dc.b 5
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 45E44
										dc.b 5
										dc.b 0
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $23                ; 0023 SET ENTITY FACING 5 2
										dc.b 5
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45EE4
										dc.b 5
										dc.b $FF
										dc.l eas_BumpLeft       
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_49B48:         dc.w 4                  ; 0004 SET TEXT INDEX 91C
										dc.w $91C
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 3 1
										dc.b 5
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w $10                ; 0010 SET FLAG 180 FFFF
										dc.w $180
										dc.w $FFFF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 46172
										dc.b 5
										dc.b $FF
										dc.l eas_46172          
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w 8                  ; 0008 JOIN FORCE 5
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $10                ; 0010 SET FLAG 49 0
										dc.w $49
										dc.w 0
										dc.w $13                ; 0013 SET STORY FLAG 6
										dc.w 6
										dc.w $2C                ; 002C FOLLOW ENTITY 5 0 2
										dc.w 5
										dc.w 0
										dc.w 2
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 10101203
										dc.l $10101203
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
bbcs_06:            dc.w 4                  ; 0004 SET TEXT INDEX 926
										dc.w $926
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 42 19 5
										dc.w $42
										dc.w $19
										dc.w 5
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 49CBA
										dc.l word_49CBA
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 460CE
										dc.b $82
										dc.b $FF
										dc.l eas_Init           
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_MAIN_THEME
										dc.w 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 5 0 45E44
										dc.b 5
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45E44
										dc.b 0
										dc.b $FF
										dc.l eas_Jump           
										dc.w $32                ; 0032 SET CAMERA DEST 1F 9
										dc.w $1F
										dc.w 9
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C005
										dc.w $C005
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 82
										dc.w $82
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 5
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C005
										dc.w $C005
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 2
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C005
										dc.w $C005
										dc.w $13                ; 0013 SET STORY FLAG 7
										dc.w 7
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_49CBA:         dc.w $1E
										dc.w 9
										dc.w 3
										dc.b $1D
										dc.b 8
										dc.b 3
										dc.b 5
										dc.l eas_Init           
										dc.b $20
										dc.b $14
										dc.b 1
										dc.b $42
										dc.l eas_Init           
										dc.b $24
										dc.b $D
										dc.b 2
										dc.b $42
										dc.l eas_Init           
										dc.b $25
										dc.b $E
										dc.b 1
										dc.b $78
										dc.l eas_Init           
										dc.w $FFFF
bbcs_07:            dc.w 4                  ; 0004 SET TEXT INDEX 935
										dc.w $935
										dc.w $10                ; 0010 SET FLAG 53 0
										dc.w $53
										dc.w 0
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 3A 8 1D
										dc.w $3A
										dc.w 8
										dc.w $1D
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 49F36
										dc.l word_49F36
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 85
										dc.w $85
										dc.w 4
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 28
										dc.w $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 8 F
										dc.w 8
										dc.w $F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $32                ; 0032 SET CAMERA DEST 8 D
										dc.w 8
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 3 1
										dc.b $82
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E44
										dc.b $82
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 1
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 8 F
										dc.w 8
										dc.w $F
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45F34
										dc.b $80
										dc.b $FF
										dc.l eas_BumpDown       
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_LIGHTNING_1
										dc.w $51
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45F0C
										dc.b $81
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45F34
										dc.b $80
										dc.b 0
										dc.l eas_BumpDown       
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_LIGHTNING_2
										dc.w $52
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45F0C
										dc.b $81
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45F34
										dc.b $81
										dc.b $FF
										dc.l eas_BumpDown       
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN
										dc.w $5C
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45F0C
										dc.b $80
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45F34
										dc.b $80
										dc.b 0
										dc.l eas_BumpDown       
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_HIT_2
										dc.w $54
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45F0C
										dc.b $81
										dc.b $FF
										dc.l eas_BumpUp         
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 1
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $32                ; 0032 SET CAMERA DEST 8 D
										dc.w 8
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 82 0 3 3
										dc.b $82
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 C 12 1
										dc.b $85
										dc.b $C
										dc.b $12
										dc.b 1
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 85
										dc.w $85
										dc.w 5
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E44
										dc.b $82
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 8 F
										dc.w 8
										dc.w $F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 E 12 3
										dc.b $86
										dc.b $E
										dc.b $12
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 F 12 3
										dc.b $87
										dc.b $F
										dc.b $12
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 85 3
										dc.b $85
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 45E44
										dc.b $86
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 45E44
										dc.b $87
										dc.b $FF
										dc.l eas_Jump           
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_49F36:         dc.w $D
										dc.w $23
										dc.w 1
										dc.b $D
										dc.b $11
										dc.b 3
										dc.b $A4
										dc.l eas_Init           
										dc.b $D
										dc.b $15
										dc.b 1
										dc.b $D1
										dc.l eas_Init           
										dc.b $C
										dc.b $E
										dc.b 3
										dc.b $CC
										dc.l eas_Init           
										dc.b $C
										dc.b $23
										dc.b 1
										dc.b $CB
										dc.l eas_Init           
										dc.b $E
										dc.b $23
										dc.b 1
										dc.b $CD
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $83
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $78
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $43
										dc.l eas_Init           
										dc.w $FFFF
word_49F7E:         dc.w 4                  ; 0004 SET TEXT INDEX 951
										dc.w $951
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 3A 8 10
										dc.w $3A
										dc.w 8
										dc.w $10
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4A912
										dc.l word_4A912
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $34                ; 0034 SET BLOCKS 717 102 D16
										dc.w $717
										dc.w $102
										dc.w $D16
										dc.w $34                ; 0034 SET BLOCKS 717 102 D18
										dc.w $717
										dc.w $102
										dc.w $D18
										dc.w $34                ; 0034 SET BLOCKS 717 102 D1D
										dc.w $717
										dc.w $102
										dc.w $D1D
										dc.w $1C                ; 001C STOP ENTITY ANIM 82
										dc.w $82
										dc.w $1C                ; 001C STOP ENTITY ANIM 83
										dc.w $83
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45FB2
										dc.b $80
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45FB2
										dc.b $81
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 28
										dc.w $28
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 85 0 1 6
										dc.b $85
										dc.b 0
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 1 6
										dc.b $86
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $32                ; 0032 SET CAMERA DEST 8 D
										dc.w 8
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 84
										dc.w $84
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 3 1
										dc.b $84
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1B                ; 001B START ENTITY ANIM 82
										dc.w $82
										dc.w $2D                ; 002D MOVE ENTITY 84 0 3 1
										dc.b $84
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 1
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 84
										dc.w $84
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 45E44
										dc.b $84
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 84
										dc.w $84
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 46172
										dc.b $84
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 1 1
										dc.b $84
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $32                ; 0032 SET CAMERA DEST 8 F
										dc.w 8
										dc.w $F
										dc.w $2D                ; 002D MOVE ENTITY 85 0 1 1
										dc.b $85
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 1 1
										dc.b $86
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E44
										dc.b $86
										dc.b $FF
										dc.l eas_Jump           
										dc.w $32                ; 0032 SET CAMERA DEST 8 E
										dc.w 8
										dc.w $E
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 0 1
										dc.b $82
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C082
										dc.w $C082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 1 1
										dc.b $85
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 1 1
										dc.b $86
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $23                ; 0023 SET ENTITY FACING 84 0
										dc.b $84
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 45E44
										dc.b $84
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 84 3
										dc.b $84
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 84
										dc.w $84
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 D 10 0
										dc.b $80
										dc.b $D
										dc.b $10
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 D 10 0
										dc.b $81
										dc.b $D
										dc.b $10
										dc.b 0
										dc.w 5                  ; 0005 PLAY SOUND SFX_DEMON_BREATH
										dc.w $75
										dc.w $2D                ; 002D MOVE ENTITY 80 0 6 1
										dc.b $80
										dc.b 0
										dc.b 6
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 7 1
										dc.b $81
										dc.b $FF
										dc.b 7
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 8
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 8
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 3 8
										dc.b $81
										dc.b 0
										dc.b 3
										dc.b 8
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 46172
										dc.b $85
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46172
										dc.b $86
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 85 0 3 3
										dc.b $85
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 3 3
										dc.b $86
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $1C                ; 001C STOP ENTITY ANIM 85
										dc.w $85
										dc.w $1C                ; 001C STOP ENTITY ANIM 86
										dc.w $86
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 84
										dc.w $84
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 460CE
										dc.b $85
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 460CE
										dc.b $86
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 85
										dc.w $85
										dc.w $1B                ; 001B START ENTITY ANIM 86
										dc.w $86
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 3F 3F 3
										dc.b $80
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 3F 3F 3
										dc.b $81
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $32                ; 0032 SET CAMERA DEST 8 11
										dc.w 8
										dc.w $11
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1B                ; 001B START ENTITY ANIM 83
										dc.w $83
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 83
										dc.w $83
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $32                ; 0032 SET CAMERA DEST 8 D
										dc.w 8
										dc.w $D
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $18                ; 0018 FLASH ENTITY WHITE 82 32
										dc.w $82
										dc.w $32
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $32                ; 0032 SET CAMERA DEST 8 3
										dc.w 8
										dc.w 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $34                ; 0034 SET BLOCKS 27 303 C04
										dc.w $27
										dc.w $303
										dc.w $C04
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $34                ; 0034 SET BLOCKS 2B 303 C04
										dc.w $2B
										dc.w $303
										dc.w $C04
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $34                ; 0034 SET BLOCKS 2F 303 C04
										dc.w $2F
										dc.w $303
										dc.w $C04
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $32                ; 0032 SET CAMERA DEST 8 D
										dc.w 8
										dc.w $D
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w $18                ; 0018 FLASH ENTITY WHITE 82 28
										dc.w $82
										dc.w $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $32                ; 0032 SET CAMERA DEST 8 3
										dc.w 8
										dc.w 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 B4
										dc.w $80
										dc.w $B4
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 C 5 1
										dc.b $80
										dc.b $C
										dc.b 5
										dc.b 1
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.w $1A                ; 001A SET ENTITY SPRITE 81 B4
										dc.w $81
										dc.w $B4
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 D 5 1
										dc.b $81
										dc.b $D
										dc.b 5
										dc.b 1
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 7
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 5
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 5
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 8 8
										dc.w 8
										dc.w 8
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 5
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 84 1
										dc.b $84
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E44
										dc.b $84
										dc.b 0
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 5
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 8 D
										dc.w 8
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$2 Y=$2
										dc.b 2
										dc.b 2
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 84
										dc.b $84
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$2 Y=$2
										dc.b 2
										dc.b 2
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$2 Y=$2
										dc.b 2
										dc.b 2
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$2 Y=$2
										dc.b 2
										dc.b 2
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 2
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 1 2
										dc.b $81
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 0 1 2
										dc.b $82
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 0 1 2
										dc.b $84
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $32                ; 0032 SET CAMERA DEST 8 11
										dc.w 8
										dc.w $11
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 461B6
										dc.b $83
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 83 3
										dc.b $83
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 3 1
										dc.b $83
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 83 0
										dc.b $83
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $23                ; 0023 SET ENTITY FACING 86 2
										dc.b $86
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45E44
										dc.b 0
										dc.b $FF
										dc.l eas_Jump           
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 2 1
										dc.b $85
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 2 1
										dc.b $83
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 3 1
										dc.b $86
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 83
										dc.w $83
										dc.w $23                ; 0023 SET ENTITY FACING 85 0
										dc.b $85
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 83 0
										dc.b $83
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 86 2
										dc.b $86
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46172
										dc.b $83
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46172
										dc.b $86
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 83 0 3 3
										dc.b $83
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 3 3
										dc.b $86
										dc.b 0
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 3
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 38
										dc.w $38
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 83 0 1 5
										dc.b $83
										dc.b 0
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 1 5
										dc.b $86
										dc.b 0
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 5
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 3
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 8
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 8
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 1 8
										dc.b $81
										dc.b 0
										dc.b 1
										dc.b 8
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 0 1 8
										dc.b $82
										dc.b 0
										dc.b 1
										dc.b 8
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 84 0 1 8
										dc.b $84
										dc.b 0
										dc.b 1
										dc.b 8
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 5
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$2 Y=$2
										dc.b 2
										dc.b 2
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $1A                ; 001A SET ENTITY SPRITE 0 B1
										dc.w 0
										dc.w $B1
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 8
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 8
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C082
										dc.w $C082
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 0
										dc.w 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C082
										dc.w $C082
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 0
										dc.w 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 0
										dc.w 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 84
										dc.w $84
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $18                ; 0018 FLASH ENTITY WHITE 0 14
										dc.w 0
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_VALIDATION
										dc.w $43
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 38
										dc.w $38
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $1A                ; 001A SET ENTITY SPRITE 0 0
										dc.w 0
										dc.w 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $29                ; 0029 SET ENTITY DEST 0 D A
										dc.w 0
										dc.w $D
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $23                ; 0023 SET ENTITY FACING 83 1
										dc.b $83
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 86 1
										dc.b $86
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 5
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 40
										dc.w $40
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND SFX_DOOR_OPEN
										dc.w $5C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $1A                ; 001A SET ENTITY SPRITE 0 B1
										dc.w 0
										dc.w $B1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 0
										dc.w 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 28
										dc.w $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 181 FFFF
										dc.w $181
										dc.w $FFFF
										dc.w $32                ; 0032 SET CAMERA DEST 8 3
										dc.w 8
										dc.w 3
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 82
										dc.w $82
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 84 3
										dc.b $84
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 463AE
										dc.b $82
										dc.b 0
										dc.l eas_463AE          
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 84
										dc.w $84
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 463AE
										dc.b $84
										dc.b $FF
										dc.l eas_463AE          
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 460CE
										dc.b $83
										dc.b $FF
										dc.l eas_Init           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 460CE
										dc.b $86
										dc.b $FF
										dc.l eas_Init           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $32                ; 0032 SET CAMERA DEST 8 11
										dc.w 8
										dc.w $11
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_SAD_THEME_1
										dc.w $10
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $1A                ; 001A SET ENTITY SPRITE 0 0
										dc.w 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C000
										dc.w $C000
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $26                ; 0026 MAKE ENTITY NOD 83
										dc.w $83
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 461B6
										dc.b $86
										dc.b 0
										dc.l eas_461B6          
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BOSS_ATTACK
										dc.w 6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 3 1
										dc.b $86
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 86 2
										dc.b $86
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C085
										dc.w $C085
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 2 2
										dc.b $86
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 86 1
										dc.b $86
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86
										dc.w $86
										dc.w $23                ; 0023 SET ENTITY FACING 83 3
										dc.b $83
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $23                ; 0023 SET ENTITY FACING 83 2
										dc.b $83
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C085
										dc.w $C085
										dc.w $23                ; 0023 SET ENTITY FACING 83 3
										dc.b $83
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $26                ; 0026 MAKE ENTITY NOD 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 83 0 2 1
										dc.b $83
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 3 1
										dc.b $86
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 46172
										dc.b $85
										dc.b $FF
										dc.l eas_46172          
										dc.w $23                ; 0023 SET ENTITY FACING 83 3
										dc.b $83
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 85
										dc.w $85
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 83 0 0 2
										dc.b $83
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 0 2
										dc.b $86
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 0 2
										dc.b $85
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 83 0 0 1
										dc.b $83
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 2 1
										dc.b $86
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 85
										dc.w $85
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 20
										dc.w $20
										dc.w $2D                ; 002D MOVE ENTITY 83 0 3 D
										dc.b $83
										dc.b 0
										dc.b 3
										dc.b $D
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 3 D
										dc.b $86
										dc.b 0
										dc.b 3
										dc.b $D
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 3 D
										dc.b $85
										dc.b $FF
										dc.b 3
										dc.b $D
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 45E44
										dc.b $83
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 83 1
										dc.b $83
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 3A0D2303
										dc.l $3A0D2303
										dc.w $2C                ; 002C FOLLOW ENTITY 83 0 2
										dc.w $83
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 85 83 2
										dc.w $85
										dc.w $83
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 86 85 2
										dc.w $86
										dc.w $85
										dc.w 2
										dc.w $10                ; 0010 SET FLAG 4A FFFF
										dc.w $4A
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 280 FFFF
										dc.w $280
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4A912:         dc.w $D
										dc.w $17
										dc.w 1
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $B2
										dc.l eas_Init           
										dc.b $D
										dc.b $11
										dc.b 1
										dc.b $A4
										dc.l eas_Init           
										dc.b $D
										dc.b $15
										dc.b 1
										dc.b $D1
										dc.l eas_Init           
										dc.b $C
										dc.b $E
										dc.b 3
										dc.b $CC
										dc.l eas_Init           
										dc.b $C
										dc.b $1B
										dc.b 1
										dc.b $CB
										dc.l eas_Init           
										dc.b $E
										dc.b $1B
										dc.b 1
										dc.b $CD
										dc.l eas_Init           
										dc.w $FFFF
bbcs_08:            dc.w 4                  ; 0004 SET TEXT INDEX 99D
										dc.w $99D
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 48 1 2E
										dc.w $48
										dc.w 1
										dc.w $2E
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4AA14
										dc.l word_4AA14
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 6 4A994
										dc.w 6
										dc.l word_4A994         
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 6 3F 3F 3
										dc.b 6
										dc.b $3F
										dc.b $3F
										dc.b 3
word_4A994:         dc.w 5                  ; 0005 PLAY SOUND MUSIC_MAIN_THEME
										dc.w 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 2
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ENEMY_ATTACK
										dc.w 5
										dc.w $32                ; 0032 SET CAMERA DEST 7 20
										dc.w 7
										dc.w $20
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 C 23 3
										dc.b $83
										dc.b $C
										dc.b $23
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 B 23 3
										dc.b $84
										dc.b $B
										dc.b $23
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 D 23 3
										dc.b $85
										dc.b $D
										dc.b $23
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 C 25 3
										dc.b $82
										dc.b $C
										dc.b $25
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C082
										dc.w $C082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $23                ; 0023 SET ENTITY FACING 82 1
										dc.b $82
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45E44
										dc.b $83
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E44
										dc.b $84
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 45E44
										dc.b $85
										dc.b $FF
										dc.l eas_Jump           
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4AA14:         dc.w 4
										dc.w $32
										dc.w 0
										dc.b 5
										dc.b $32
										dc.b 0
										dc.b $CA
										dc.l eas_Init           
										dc.b 4
										dc.b $31
										dc.b 0
										dc.b 1
										dc.l eas_Init           
										dc.b 4
										dc.b $33
										dc.b 0
										dc.b 3
										dc.l eas_Init           
										dc.b 3
										dc.b $32
										dc.b 0
										dc.b 4
										dc.l eas_Init           
										dc.b 2
										dc.b $32
										dc.b 0
										dc.b 2
										dc.l eas_Init           
										dc.b 1
										dc.b $32
										dc.b 0
										dc.b 6
										dc.l eas_Init           
										dc.b $E
										dc.b $22
										dc.b 3
										dc.b $CA
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $84
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $44
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $45
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $79
										dc.l eas_Init           
										dc.w $FFFF
word_4AA74:         dc.w 4                  ; 0004 SET TEXT INDEX 9A4
										dc.w $9A4
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 48 8 20
										dc.w $48
										dc.w 8
										dc.w $20
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4ABBE
										dc.l word_4ABBE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 6 4AAB6
										dc.w 6
										dc.l word_4AAB6         
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 6 3F 3F 3
										dc.b 6
										dc.b $3F
										dc.b $3F
										dc.b 3
word_4AAB6:         dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $1A                ; 001A SET ENTITY SPRITE 81 3B
										dc.w $81
										dc.w $3B
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $1A                ; 001A SET ENTITY SPRITE 81 CA
										dc.w $81
										dc.w $CA
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 461B6
										dc.b $81
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w $1B                ; 001B START ENTITY ANIM 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45EBC
										dc.b $80
										dc.b 0
										dc.l eas_BumpRight      
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 4618A
										dc.b $81
										dc.b $FF
										dc.l eas_4618A          
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 6 0
										dc.b 6
										dc.b 0
										dc.w $32                ; 0032 SET CAMERA DEST 16 20
										dc.w $16
										dc.w $20
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 8 20
										dc.w 8
										dc.w $20
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 493E3102
										dc.l $493E3102
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4ABBE:         dc.w $E
										dc.w $25
										dc.w 1
										dc.b $E
										dc.b $23
										dc.b 1
										dc.b $CA
										dc.l eas_Init           
										dc.b $D
										dc.b $24
										dc.b 1
										dc.b 1
										dc.l eas_Init           
										dc.b $C
										dc.b $23
										dc.b 1
										dc.b 3
										dc.l eas_Init           
										dc.b $F
										dc.b $24
										dc.b 1
										dc.b 4
										dc.l eas_Init           
										dc.b $10
										dc.b $23
										dc.b 1
										dc.b 2
										dc.l eas_Init           
										dc.b $10
										dc.b $22
										dc.b 2
										dc.b 6
										dc.l eas_Init           
										dc.b $E
										dc.b $22
										dc.b 3
										dc.b $CA
										dc.l eas_Init           
										dc.w $FFFF
bbcs_11:            dc.w 4                  ; 0004 SET TEXT INDEX 9B3
										dc.w $9B3
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 30 8 13
										dc.w $30
										dc.w 8
										dc.w $13
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4ACA0
										dc.l word_4ACA0
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 458E
										dc.l sub_458E
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ENEMY_ATTACK
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461E4
										dc.b 7
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 20
										dc.w $20
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4ACA0:         dc.w $F
										dc.w $18
										dc.w 1
										dc.b $F
										dc.b $19
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $F
										dc.b 3
										dc.b 3
										dc.b $47
										dc.l eas_Init           
										dc.b $10
										dc.b 4
										dc.b 3
										dc.b $69
										dc.l eas_Init           
										dc.b $E
										dc.b 4
										dc.b 3
										dc.b $84
										dc.l eas_Init           
										dc.w $FFFF
word_4ACC8:         dc.w 4                  ; 0004 SET TEXT INDEX 9BA
										dc.w $9BA
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 20
										dc.w $20
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $10                ; 0010 SET FLAG 2CA FFFF
										dc.w $2CA
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4ACEC:         dc.w 4                  ; 0004 SET TEXT INDEX 9BD
										dc.w $9BD
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 34170802
										dc.l $34170802
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4ACF8:         dc.w 4                  ; 0004 SET TEXT INDEX 9BF
										dc.w $9BF
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $37                ; 0037 LOAD MAP AND FADE IN D B 8
										dc.w $D
										dc.w $B
										dc.w 8
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4AD96
										dc.l word_4AD96
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F D 0
										dc.b 7
										dc.b $F
										dc.b $D
										dc.b 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT A
										dc.b $A
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_TOWN
										dc.w 8
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 460CE
										dc.b $A
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT A FF 45E44
										dc.b $A
										dc.b $FF
										dc.l eas_Jump           
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD A
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00A
										dc.w $C00A
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT A 0 461B6
										dc.b $A
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00A
										dc.w $C00A
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00A
										dc.w $C00A
										dc.w $23                ; 0023 SET ENTITY FACING A 2
										dc.b $A
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C00A
										dc.w $C00A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00A
										dc.w $C00A
										dc.w $23                ; 0023 SET ENTITY FACING A 1
										dc.b $A
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 4B FFFF
										dc.w $4B
										dc.w $FFFF
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT D100C03
										dc.l $D100C03
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4AD96:         dc.w $10
										dc.w $C
										dc.w 3
										dc.b $10
										dc.b $D
										dc.b 3
										dc.b $A
										dc.l eas_Init           
										dc.w $FFFF
bbcs_15:            dc.w 4                  ; 0004 SET TEXT INDEX 9C7
										dc.w $9C7
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 32 9 F
										dc.w $32
										dc.w 9
										dc.w $F
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4AE42
										dc.l word_4AE42
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E E 13 1
										dc.b $1E
										dc.b $E
										dc.b $13
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F F 14 1
										dc.b $1F
										dc.b $F
										dc.b $14
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 14 1
										dc.b 7
										dc.b $D
										dc.b $14
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 1 1
										dc.b $1E
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 9 4
										dc.w 9
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
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
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 9 F
										dc.w 9
										dc.w $F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1E 3
										dc.b $1E
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4AE42:         dc.w $E
										dc.w $14
										dc.w 1
										dc.b $E
										dc.b 7
										dc.b 3
										dc.b $49
										dc.l eas_Init           
										dc.b $F
										dc.b 6
										dc.b 3
										dc.b $6B
										dc.l eas_Init           
										dc.b $D
										dc.b 6
										dc.b 3
										dc.b $85
										dc.l eas_Init           
										dc.b $10
										dc.b 7
										dc.b 3
										dc.b $8E
										dc.l eas_Init           
										dc.b $C
										dc.b 7
										dc.b 3
										dc.b $7C
										dc.l eas_Init           
										dc.w $FFFF
word_4AE72:         dc.w 4                  ; 0004 SET TEXT INDEX 9CA
										dc.w $9CA
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 32 9 A
										dc.w $32
										dc.w 9
										dc.w $A
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4AFB6
										dc.l word_4AFB6
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
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
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E E 13 1
										dc.b $1E
										dc.b $E
										dc.b $13
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 1 5
										dc.b $1E
										dc.b $FF
										dc.b 1
										dc.b 5
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1E 0
										dc.b $1E
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 0 2
										dc.b $1E
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 6
										dc.w $8080
										dc.w $3A                ; 003A FADE OUT TO BLACK
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 1B A 1
										dc.b 0
										dc.b $1B
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 1C A 1
										dc.b 7
										dc.b $1C
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 1A A 1
										dc.b $1F
										dc.b $1A
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 1B 7 1
										dc.b $1E
										dc.b $1B
										dc.b 7
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 15 5
										dc.w $15
										dc.w 5
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1E
										dc.w $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $18                ; 0018 FLASH ENTITY WHITE 1E 28
										dc.w $1E
										dc.w $28
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 45E44
										dc.b $1E
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $18                ; 0018 FLASH ENTITY WHITE 1E 32
										dc.w $1E
										dc.w $32
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1E
										dc.b $1E
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 3 1
										dc.b $1E
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1E
										dc.w $1E
										dc.w $2D                ; 002D MOVE ENTITY 1E 0 3 2
										dc.b $1E
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 1
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 1
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 1E
										dc.w $1E
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 2 3
										dc.b $1E
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 1E FF 2 5
										dc.b $1E
										dc.b $FF
										dc.b 2
										dc.b 5
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 1E
										dc.w $1E
										dc.w $10                ; 0010 SET FLAG 4D 0
										dc.w $4D
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 2DC FFFF
										dc.w $2DC
										dc.w $FFFF
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 321B0B01
										dc.l $321B0B01
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4AFB6:         dc.w $E
										dc.w 5
										dc.w 3
										dc.w $FFFF
bbcs_16:            dc.w 4                  ; 0004 SET TEXT INDEX 9D1
										dc.w $9D1
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 31 9 A
										dc.w $31
										dc.w 9
										dc.w $A
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 4B1CA
										dc.l sub_4B1CA
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B15C
										dc.l word_4B15C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $34                ; 0034 SET BLOCKS D04 303 0
										dc.w $D04
										dc.w $303
										dc.w 0
										dc.w $34                ; 0034 SET BLOCKS 1F04 303 D04
										dc.w $1F04
										dc.w $303
										dc.w $D04
										dc.w $25                ; 0025 CLONE ENTITY 81 82
										dc.w $81
										dc.w $82
										dc.w $25                ; 0025 CLONE ENTITY 83 84
										dc.w $83
										dc.w $84
										dc.w $25                ; 0025 CLONE ENTITY 83 85
										dc.w $83
										dc.w $85
										dc.w $25                ; 0025 CLONE ENTITY 83 86
										dc.w $83
										dc.w $86
										dc.w $25                ; 0025 CLONE ENTITY 83 87
										dc.w $83
										dc.w $87
										dc.w $25                ; 0025 CLONE ENTITY 83 88
										dc.w $83
										dc.w $88
										dc.w $25                ; 0025 CLONE ENTITY 83 89
										dc.w $83
										dc.w $89
										dc.w $25                ; 0025 CLONE ENTITY 83 8A
										dc.w $83
										dc.w $8A
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F F 2
										dc.b 7
										dc.b $F
										dc.b $F
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F D E 3
										dc.b $1F
										dc.b $D
										dc.b $E
										dc.b 3
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $32                ; 0032 SET CAMERA DEST 9 0
										dc.w 9
										dc.w 0
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 8002
										dc.w $8002
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 E 5 3
										dc.b $80
										dc.b $E
										dc.b 5
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $34                ; 0034 SET BLOCKS 0 303 D04
										dc.w 0
										dc.w $303
										dc.w $D04
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 C 4 3
										dc.b $81
										dc.b $C
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 10 4 3
										dc.b $82
										dc.b $10
										dc.b 4
										dc.b 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 5
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 D 2 3
										dc.b $83
										dc.b $D
										dc.b 2
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 F 2 3
										dc.b $84
										dc.b $F
										dc.b 2
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 11 3 3
										dc.b $85
										dc.b $11
										dc.b 3
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 B 4 3
										dc.b $86
										dc.b $B
										dc.b 4
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 C 5 3
										dc.b $87
										dc.b $C
										dc.b 5
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 D 5 3
										dc.b $88
										dc.b $D
										dc.b 5
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 10 5 3
										dc.b $89
										dc.b $10
										dc.b 5
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A E 6 3
										dc.b $8A
										dc.b $E
										dc.b 6
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 83
										dc.w $83
										dc.w 5
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4002
										dc.w $4002
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B15C:         dc.w $F
										dc.w $E
										dc.w 0
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $FE
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $7B
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $7B
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $4A
										dc.l eas_Init           
										dc.w $FFFF
word_4B1BC:         dc.w $A                 ; 000A EXECUTE SUBROUTINE 4B1D0
										dc.l sub_4B1D0
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 451D3302
										dc.l $451D3302
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_4B1CA:
										
										clr.b   ((PLAYER_TYPE-$1000000)).w
										rts

	; End of function sub_4B1CA


; =============== S U B R O U T I N E =======================================

sub_4B1D0:
										
										move.b  #2,((PLAYER_TYPE-$1000000)).w
										rts

	; End of function sub_4B1D0

bbcs_18:            dc.w 4                  ; 0004 SET TEXT INDEX 9D8
										dc.w $9D8
										dc.w $37                ; 0037 LOAD MAP AND FADE IN C 7 16
										dc.w $C
										dc.w 7
										dc.w $16
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B2DA
										dc.l word_4B2DA
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 460CE
										dc.b $B
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 21 1
										dc.b 7
										dc.b $D
										dc.b $21
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F C 21 1
										dc.b $1F
										dc.b $C
										dc.b $21
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B B 21 1
										dc.b $B
										dc.b $B
										dc.b $21
										dc.b 1
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_SHRINE
										dc.w $23
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 40
										dc.w $40
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 6
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 6
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY B 0 1 6
										dc.b $B
										dc.b 0
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 6
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT B 0 461E4
										dc.b $B
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $2D                ; 002D MOVE ENTITY B FF 1 1
										dc.b $B
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 7 16
										dc.w 7
										dc.w $16
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING B 0
										dc.b $B
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B2DA:         dc.w $C
										dc.w $20
										dc.w 1
										dc.b $C
										dc.b 8
										dc.b 3
										dc.b $FF
										dc.l eas_Init           
										dc.b $C
										dc.b 5
										dc.b 3
										dc.b $3E
										dc.l eas_Init           
										dc.w $FFFF
word_4B2F2:         dc.w 4                  ; 0004 SET TEXT INDEX 9E0
										dc.w $9E0
										dc.w $37                ; 0037 LOAD MAP AND FADE IN C 7 5
										dc.w $C
										dc.w 7
										dc.w 5
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B6BE
										dc.l word_4B6BE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 460CE
										dc.b $B
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 9 1
										dc.b 7
										dc.b $D
										dc.b 9
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F E 9 1
										dc.b $1F
										dc.b $E
										dc.b 9
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 5 9 0
										dc.b $B
										dc.b 5
										dc.b 9
										dc.b 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA B
										dc.w $B
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY B FF 0 6
										dc.b $B
										dc.b $FF
										dc.b 0
										dc.b 6
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY B FF 1 4
										dc.b $B
										dc.b $FF
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING B 0
										dc.b $B
										dc.b 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $32                ; 0032 SET CAMERA DEST 7 1
										dc.w 7
										dc.w 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B C 6 1
										dc.b $B
										dc.b $C
										dc.b 6
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B D 5 2
										dc.b $B
										dc.b $D
										dc.b 5
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B C 6 1
										dc.b $B
										dc.b $C
										dc.b 6
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B B 5 0
										dc.b $B
										dc.b $B
										dc.b 5
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B C 6 1
										dc.b $B
										dc.b $C
										dc.b 6
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B D 5 2
										dc.b $B
										dc.b $D
										dc.b 5
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY B 0 2 1
										dc.b $B
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT B 0 452BA
										dc.b $B
										dc.b 0
										dc.l eas_452BA          
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 3F 3F 3
										dc.b $B
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 9
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 9
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 46172
										dc.b 0
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 0 0 2 1
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $32                ; 0032 SET CAMERA DEST 7 4
										dc.w 7
										dc.w 4
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.b $80                ; WAIT 96
										dc.b $96
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 9
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 9
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_FALLING
										dc.w $58
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 7
										dc.w 7
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45EE4
										dc.b $1F
										dc.b $FF
										dc.l eas_BumpLeft       
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45EE4
										dc.b $1F
										dc.b $FF
										dc.l eas_BumpLeft       
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B C 5 0
										dc.b $B
										dc.b $C
										dc.b 5
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 4536C
										dc.b $B
										dc.b $FF
										dc.l eas_4536C          
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $1B                ; 001B START ENTITY ANIM 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY B FF 3 3
										dc.b $B
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY B FF 2 2
										dc.b $B
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING B 3
										dc.b $B
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY B FF 0 1
										dc.b $B
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING B 1
										dc.b $B
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY B FF 1 2
										dc.b $B
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING B 3
										dc.b $B
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY B FF 3 1
										dc.b $B
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY B FF 1 1
										dc.b $B
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING B 3
										dc.b $B
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 45E44
										dc.b $B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT B FF 45E44
										dc.b $B
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX B
										dc.w $B
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY B 0 1 1
										dc.b $B
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT B 0 452BA
										dc.b $B
										dc.b 0
										dc.l eas_452BA          
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING B 3F 3F 3
										dc.b $B
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 9
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 9
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.b $80                ; WAIT B4
										dc.b $B4
										dc.w $10                ; 0010 SET FLAG 41 FFFF
										dc.w $41
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 54 0
										dc.w $54
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B6BE:         dc.w $C
										dc.w 9
										dc.w 1
										dc.b $C
										dc.b 5
										dc.b 3
										dc.b $3E
										dc.l eas_Init           
										dc.w $FFFF
word_4B6CE:         dc.w 4                  ; 0004 SET TEXT INDEX A06
										dc.w $A06
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 33 2 6
										dc.w $33
										dc.w 2
										dc.w 6
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B780
										dc.l word_4B780
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 5 A 1
										dc.b 7
										dc.b 5
										dc.b $A
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 7 A 1
										dc.b $1F
										dc.b 7
										dc.b $A
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 2                  ; 0002 DISPLAY TEXT BOX D
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX D
										dc.w $D
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C007
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX D
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX D
										dc.w $D
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $2D                ; 002D MOVE ENTITY D FF 3 1
										dc.b $D
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX D
										dc.w $D
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 8                  ; 0008 JOIN FORCE D
										dc.w $D
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY D 1F 2
										dc.w $D
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B780:         dc.w 6
										dc.w $A
										dc.w 1
										dc.b 6
										dc.b 8
										dc.b 3
										dc.b $D
										dc.l eas_Init           
										dc.w $FFFF
bbcs_21:            dc.w 4                  ; 0004 SET TEXT INDEX A10
										dc.w $A10
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 43 5 12
										dc.w $43
										dc.w 5
										dc.w $12
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B84C
										dc.l word_4B84C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 1C 18 2
										dc.b 7
										dc.b $1C
										dc.b $18
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 1C 16 2
										dc.b $1F
										dc.b $1C
										dc.b $16
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 1C 17 2
										dc.b $1E
										dc.b $1C
										dc.b $17
										dc.b 2
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 82 0
										dc.b $82
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 17 12
										dc.w $17
										dc.w $12
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 2
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 5 12
										dc.w 5
										dc.w $12
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 1
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 A 18 0
										dc.b $83
										dc.b $A
										dc.b $18
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 A 14 0
										dc.b $84
										dc.b $A
										dc.b $14
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 A 16 0
										dc.b $85
										dc.b $A
										dc.b $16
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45E44
										dc.b $83
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E44
										dc.b $84
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 45E44
										dc.b $85
										dc.b $FF
										dc.l eas_Jump           
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B84C:         dc.w $1B
										dc.w $17
										dc.w 2
										dc.b $1C
										dc.b $18
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.b 8
										dc.b $16
										dc.b 2
										dc.b $51
										dc.l eas_Init           
										dc.b 9
										dc.b $15
										dc.b 2
										dc.b $8C
										dc.l eas_Init           
										dc.b 9
										dc.b $17
										dc.b 2
										dc.b $86
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $7C
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $6C
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $4C
										dc.l eas_Init           
										dc.w $FFFF
word_4B88C:         dc.w 4                  ; 0004 SET TEXT INDEX A17
										dc.w $A17
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 43 4 12
										dc.w $43
										dc.w 4
										dc.w $12
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4B948
										dc.l word_4B948
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 B 17 2
										dc.b 7
										dc.b $B
										dc.b $17
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B 15 2
										dc.b $1F
										dc.b $B
										dc.b $15
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E B 16 2
										dc.b $1E
										dc.b $B
										dc.b $16
										dc.b 2
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$1C Y=$1C
										dc.b $1C
										dc.b $1C
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 3
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2C                ; 002C FOLLOW ENTITY 1E 0 2
										dc.w $1E
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 1E 1
										dc.w 7
										dc.w $1E
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 1E 3
										dc.w $1F
										dc.w $1E
										dc.w 3
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 431A1703
										dc.l $431A1703
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4B948:         dc.w $A
										dc.w $16
										dc.w 2
										dc.b $B
										dc.b $17
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.w $FFFF
bbcs_26:            dc.w 4                  ; 0004 SET TEXT INDEX A24
										dc.w $A24
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 48 2 14
										dc.w $48
										dc.w 2
										dc.w $14
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4BC5A
										dc.l word_4BC5A
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 6 1A 0
										dc.b 7
										dc.b 6
										dc.b $1A
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 6 18 0
										dc.b $1F
										dc.b 6
										dc.b $18
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 6 19 0
										dc.b $1E
										dc.b 6
										dc.b $19
										dc.b 0
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST D 9
										dc.w $D
										dc.w 9
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 1 2
										dc.b $85
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 85 1
										dc.b $85
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C085
										dc.w $C085
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 45E44
										dc.b $85
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C085
										dc.w $C085
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 85 0 1 3
										dc.b $85
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 85
										dc.w $85
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 461B6
										dc.b $85
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 83 2
										dc.b $83
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 85 3
										dc.b $85
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 83 0 2 1
										dc.b $83
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 45E6C
										dc.b $85
										dc.b $FF
										dc.l eas_JumpLeft       
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 45E6C
										dc.b $85
										dc.b $FF
										dc.l eas_JumpLeft       
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C085
										dc.w $C085
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 46024
										dc.b $85
										dc.b $FF
										dc.l eas_Die            
										dc.w $32                ; 0032 SET CAMERA DEST D D
										dc.w $D
										dc.w $D
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 12 13 1
										dc.b $80
										dc.b $12
										dc.b $13
										dc.b 1
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E44
										dc.b $86
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 2 1
										dc.b $86
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C086
										dc.w $C086
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C086
										dc.w $C086
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C086
										dc.w $C086
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 D 12 0
										dc.b $81
										dc.b $D
										dc.b $12
										dc.b 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 86 0 3 2
										dc.b $86
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 0 4
										dc.b $81
										dc.b 0
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E94
										dc.b $86
										dc.b $FF
										dc.l eas_JumpRight      
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E94
										dc.b $86
										dc.b $FF
										dc.l eas_JumpRight      
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C086
										dc.w $C086
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46024
										dc.b $86
										dc.b $FF
										dc.l eas_Die            
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C013
										dc.w $C013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 84
										dc.w $84
										dc.w 4
										dc.w $18                ; 0018 FLASH ENTITY WHITE 80 1E
										dc.w $80
										dc.w $1E
										dc.w $32                ; 0032 SET CAMERA DEST D B
										dc.w $D
										dc.w $B
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 12 C 3
										dc.b $84
										dc.b $12
										dc.b $C
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 84
										dc.w $84
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 3 1
										dc.b $84
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 84
										dc.w $84
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 13
										dc.w $13
										dc.w $1C                ; 001C STOP ENTITY ANIM 13
										dc.w $13
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 13
										dc.w $13
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 13
										dc.b $13
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$20 Y=$20
										dc.b $20
										dc.b $20
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $32                ; 0032 SET CAMERA DEST D F
										dc.w $D
										dc.w $F
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 3
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461B6
										dc.b $80
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 2 14
										dc.w 2
										dc.w $14
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $32                ; 0032 SET CAMERA DEST D F
										dc.w $D
										dc.w $F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 2
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4BC5A:         dc.w 7
										dc.w $19
										dc.w 0
										dc.b 6
										dc.b $1A
										dc.b 0
										dc.b 7
										dc.l eas_Init           
										dc.b $12
										dc.b $E
										dc.b 1
										dc.b $13
										dc.l eas_Init           
										dc.b $12
										dc.b $B
										dc.b 3
										dc.b $9F
										dc.l eas_Init           
										dc.b $11
										dc.b $B
										dc.b 3
										dc.b $6D
										dc.l eas_Init           
										dc.b $13
										dc.b $B
										dc.b 3
										dc.b $91
										dc.l eas_Init           
										dc.b $14
										dc.b $A
										dc.b 3
										dc.b $53
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $6A
										dc.l eas_Init           
										dc.b $11
										dc.b $F
										dc.b 1
										dc.b $E9
										dc.l eas_Init           
										dc.b $13
										dc.b $F
										dc.b 1
										dc.b $E9
										dc.l eas_Init           
										dc.w $FFFF
word_4BCAA:         dc.w 4                  ; 0004 SET TEXT INDEX A4D
										dc.w $A4D
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 48 D B
										dc.w $48
										dc.w $D
										dc.w $B
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4BE4A
										dc.l word_4BE4A
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 13
										dc.b $13
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 11 E 0
										dc.b 7
										dc.b $11
										dc.b $E
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 12 10 1
										dc.b $1F
										dc.b $12
										dc.b $10
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 13 11 1
										dc.b $1E
										dc.b $13
										dc.b $11
										dc.b 1
										dc.w $53                ; 0053  13 0
										dc.w $13
										dc.w 0
										dc.w $53                ; 0053  80 FFFF
										dc.w $80
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $18                ; 0018 FLASH ENTITY WHITE 1F 3C
										dc.w $1F
										dc.w $3C
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $32                ; 0032 SET CAMERA DEST D 9
										dc.w $D
										dc.w 9
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 4
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 12 D 3
										dc.b $80
										dc.b $12
										dc.b $D
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 3
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 4509E
										dc.b $80
										dc.b 0
										dc.l eas_4509E          
										dc.b $80                ; WAIT C8
										dc.b $C8
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46024
										dc.b $80
										dc.b $FF
										dc.l eas_Die            
										dc.w $32                ; 0032 SET CAMERA DEST D B
										dc.w $D
										dc.w $B
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 13
										dc.b $13
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 13
										dc.w $13
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w $2D                ; 002D MOVE ENTITY 13 FF 1 1
										dc.b $13
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 13 FF 45E44
										dc.b $13
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w $2D                ; 002D MOVE ENTITY 13 FF 3 2
										dc.b $13
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C013
										dc.w $C013
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C013
										dc.w $C013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 13 2
										dc.b $13
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w $26                ; 0026 MAKE ENTITY NOD 13
										dc.w $13
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 13 2
										dc.b $13
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C013
										dc.w $C013
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C013
										dc.w $C013
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w 8                  ; 0008 JOIN FORCE 13
										dc.w $13
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w $15                ; 0015 SET ACTSCRIPT 13 0 45FBC
										dc.b $13
										dc.b 0
										dc.l eas_RotateRight    
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 13 FF 45E44
										dc.b $13
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 13 3
										dc.b $13
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 13 FF 45E44
										dc.b $13
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 13 FF 460CE
										dc.b $13
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 13
										dc.w $13
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C013
										dc.w $C013
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 13
										dc.w $13
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4BE4A:         dc.w $13
										dc.w $10
										dc.w 1
										dc.b $11
										dc.b $E
										dc.b 3
										dc.b 7
										dc.l eas_Init           
										dc.b $12
										dc.b $E
										dc.b 3
										dc.b $13
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $6A
										dc.l eas_Init           
										dc.w $FFFF
word_4BE6A:         dc.w 4                  ; 0004 SET TEXT INDEX A62
										dc.w $A62
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85
										dc.w $85
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 84
										dc.w $84
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 84
										dc.w $84
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
bbcs_28:            dc.w 4                  ; 0004 SET TEXT INDEX A65
										dc.w $A65
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 2F 0 4
										dc.w $2F
										dc.w 0
										dc.w 4
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4C03C
										dc.l word_4C03C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 0 9 0
										dc.b 7
										dc.b 0
										dc.b 9
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 0 7 0
										dc.b $1F
										dc.b 0
										dc.b 7
										dc.b 0
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_3
										dc.w $21
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 3
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 0 3
										dc.b $1F
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 0 3
										dc.b 7
										dc.b 0
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 0 3
										dc.b $80
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 2
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $32                ; 0032 SET CAMERA DEST 7 B
										dc.w 7
										dc.w $B
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 82
										dc.w $82
										dc.w 5                  ; 0005 PLAY SOUND SFX_MONSTER_SCREAM
										dc.w $5E
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 83
										dc.w $83
										dc.w 5                  ; 0005 PLAY SOUND SFX_MONSTER_SCREAM
										dc.w $5E
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $32                ; 0032 SET CAMERA DEST 0 6
										dc.w 0
										dc.w 6
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 45E44
										dc.b $1F
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461E4
										dc.b 7
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 64
										dc.b $64
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 3 2
										dc.b $1F
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $1C                ; 001C STOP ENTITY ANIM 0
										dc.w 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_HIT_2
										dc.w $54
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $2
										dc.w 2
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 0
										dc.w 0
										dc.w $32                ; 0032 SET CAMERA DEST 7 15
										dc.w 7
										dc.w $15
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $32                ; 0032 SET CAMERA DEST 0 6
										dc.w 0
										dc.w 6
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 0
										dc.w 0
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4C03C:         dc.w 1
										dc.w 8
										dc.w 0
										dc.b 0
										dc.b 9
										dc.b 0
										dc.b 7
										dc.l eas_Init           
										dc.b 0
										dc.b 8
										dc.b 0
										dc.b $3E
										dc.l eas_Init           
										dc.b $C
										dc.b $18
										dc.b 1
										dc.b $B0
										dc.l eas_Init           
										dc.b $D
										dc.b $D
										dc.b 2
										dc.b $54
										dc.l eas_Init           
										dc.b $C
										dc.b $11
										dc.b 1
										dc.b $54
										dc.l eas_Init           
										dc.b $B
										dc.b $16
										dc.b 3
										dc.b $54
										dc.l eas_Init           
										dc.b $B
										dc.b $19
										dc.b 0
										dc.b $54
										dc.l eas_Init           
										dc.w $FFFF
word_4C07C:         dc.w 4                  ; 0004 SET TEXT INDEX A6E
										dc.w $A6E
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 2F 7 19
										dc.w $2F
										dc.w 7
										dc.w $19
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4C3B4
										dc.l word_4C3B4
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 1C 3
										dc.b 7
										dc.b $D
										dc.b $1C
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B 1C 3
										dc.b $1F
										dc.b $B
										dc.b $1C
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $1C                ; 001C STOP ENTITY ANIM 82
										dc.w $82
										dc.w $53                ; 0053  1F 0
										dc.w $1F
										dc.w 0
										dc.w $53                ; 0053  7 0
										dc.w 7
										dc.w 0
										dc.w $53                ; 0053  80 FFFF
										dc.w $80
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 39
										dc.b $39
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 3 1
										dc.b $1F
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT F
										dc.b $F
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45E94
										dc.b 0
										dc.b $FF
										dc.l eas_JumpRight      
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 C5
										dc.w $80
										dc.w $C5
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 2
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT E
										dc.b $E
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 461AA
										dc.b $80
										dc.b $FF
										dc.l eas_461AA          
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 1
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 0 1
										dc.b $81
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST A 19
										dc.w $A
										dc.w $19
										dc.w $2D                ; 002D MOVE ENTITY 0 0 0 2
										dc.b 0
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 0 3
										dc.b $81
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 4
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 4
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 8 19
										dc.w 8
										dc.w $19
										dc.w $18                ; 0018 FLASH ENTITY WHITE 80 28
										dc.w $80
										dc.w $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 B 1E 0
										dc.b $80
										dc.b $B
										dc.b $1E
										dc.b 0
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 AF
										dc.w $80
										dc.w $AF
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 9C
										dc.w $80
										dc.w $9C
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 7 0 2 1
										dc.b 7
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 1
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $18                ; 0018 FLASH ENTITY WHITE 1F 28
										dc.w $1F
										dc.w $28
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 C 1E 2
										dc.b $82
										dc.b $C
										dc.b $1E
										dc.b 2
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 82 0 2 8
										dc.b $82
										dc.b 0
										dc.b 2
										dc.b 8
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_JUMP
										dc.w $57
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 A
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b $A
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.w $32                ; 0032 SET CAMERA DEST 8 1A
										dc.w 8
										dc.w $1A
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 2
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $32                ; 0032 SET CAMERA DEST 7 10
										dc.w 7
										dc.w $10
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 1
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E6C
										dc.b $80
										dc.b $FF
										dc.l eas_JumpLeft       
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 463AE
										dc.b $80
										dc.b $FF
										dc.l eas_463AE          
										dc.w $32                ; 0032 SET CAMERA DEST 8 1A
										dc.w 8
										dc.w $1A
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2C                ; 002C FOLLOW ENTITY 81 0 2
										dc.w $81
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 81 1
										dc.w $1F
										dc.w $81
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 7 81 3
										dc.w 7
										dc.w $81
										dc.w 3
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT FF101E00
										dc.l $FF101E00
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4C3B4:         dc.w $C
										dc.w $1C
										dc.w 3
										dc.b $C
										dc.b $1F
										dc.b 1
										dc.b $B0
										dc.l eas_Init           
										dc.b $D
										dc.b $1C
										dc.b 3
										dc.b 7
										dc.l eas_Init           
										dc.b $C
										dc.b $1B
										dc.b 3
										dc.b $3E
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B2
										dc.l eas_Init           
										dc.w $FFFF
bbcs_29:            dc.w 4                  ; 0004 SET TEXT INDEX A9E
										dc.w $A9E
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 0 A 1C
										dc.w 0
										dc.w $A
										dc.w $1C
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4C5AE
										dc.l word_4C5AE
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 10 22 1
										dc.b 7
										dc.b $10
										dc.b $22
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F E 22 1
										dc.b $1F
										dc.b $E
										dc.b $22
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_MITULA_SHRINE
										dc.w $28
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 1
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 1
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $32                ; 0032 SET CAMERA DEST A 1A
										dc.w $A
										dc.w $1A
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 0
										dc.b 0
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1F
										dc.b $1F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 3
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 2 1
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 2 2
										dc.b 7
										dc.b 0
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 2
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $32                ; 0032 SET CAMERA DEST C 13
										dc.w $C
										dc.w $13
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 10 17 3
										dc.b $80
										dc.b $10
										dc.b $17
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $32                ; 0032 SET CAMERA DEST 8 F
										dc.w 8
										dc.w $F
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 C 12 3
										dc.b $80
										dc.b $C
										dc.b $12
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $32                ; 0032 SET CAMERA DEST 9 9
										dc.w 9
										dc.w 9
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 E D 3
										dc.b $80
										dc.b $E
										dc.b $D
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $18                ; 0018 FLASH ENTITY WHITE 80 1E
										dc.w $80
										dc.w $1E
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 AF
										dc.w $80
										dc.w $AF
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 55
										dc.w $80
										dc.w $55
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 E C 3
										dc.b $81
										dc.b $E
										dc.b $C
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 F D 3
										dc.b $82
										dc.b $F
										dc.b $D
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 F E 3
										dc.b $83
										dc.b $F
										dc.b $E
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 B E 3
										dc.b $84
										dc.b $B
										dc.b $E
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4C5AE:         dc.w $F
										dc.w $21
										dc.w 1
										dc.b $10
										dc.b $22
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $F
										dc.b $1E
										dc.b 3
										dc.b $C0
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $8D
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $56
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $88
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $54
										dc.l eas_Init           
										dc.w $FFFF
bbcs_30:            dc.w 4                  ; 0004 SET TEXT INDEX AC8
										dc.w $AC8
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 1 7 15
										dc.w 1
										dc.w 7
										dc.w $15
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4C690
										dc.l word_4C690
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 B 1C 1
										dc.b 7
										dc.b $B
										dc.b $1C
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B 1B 1
										dc.b $1F
										dc.b $B
										dc.b $1B
										dc.b 1
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 2
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 2
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $32                ; 0032 SET CAMERA DEST 7 0
										dc.w 7
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 2 2
										dc.b $80
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 2
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $41                ; 0041 FLASH SCREEN WHITE 28
										dc.w $28
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4C690:         dc.w $B
										dc.w $1A
										dc.w 1
										dc.b $B
										dc.b $1C
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $D
										dc.b 4
										dc.b 3
										dc.b $9B
										dc.l eas_Init           
										dc.w $FFFF
word_4C6A8:         dc.w 4                  ; 0004 SET TEXT INDEX ACD
										dc.w $ACD
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 1 5 8
										dc.w 1
										dc.w 5
										dc.w 8
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4C96C
										dc.l word_4C96C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 C D 1
										dc.b 7
										dc.b $C
										dc.b $D
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B D 1
										dc.b $1F
										dc.b $B
										dc.b $D
										dc.b 1
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $1C                ; 001C STOP ENTITY ANIM 82
										dc.w $82
										dc.w $53                ; 0053  7 0
										dc.w 7
										dc.w 0
										dc.w $53                ; 0053  1F FFFF
										dc.w $1F
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 B A 1
										dc.b $82
										dc.b $B
										dc.b $A
										dc.b 1
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $29                ; 0029 SET ENTITY DEST 82 9 B
										dc.w $82
										dc.w 9
										dc.w $B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $18                ; 0018 FLASH ENTITY WHITE 82 3C
										dc.w $82
										dc.w $3C
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46024
										dc.b $80
										dc.b $FF
										dc.l eas_Die            
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $18                ; 0018 FLASH ENTITY WHITE 82 3C
										dc.w $82
										dc.w $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 5 0
										dc.w 5
										dc.w 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 B 3 3
										dc.b $81
										dc.b $B
										dc.b 3
										dc.b 3
										dc.w $18                ; 0018 FLASH ENTITY WHITE 81 3C
										dc.w $81
										dc.w $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 4
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 4
										dc.b 2
										dc.b 2
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $18                ; 0018 FLASH ENTITY WHITE 81 3C
										dc.w $81
										dc.w $3C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 38
										dc.w $38
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 82
										dc.w $82
										dc.w $29                ; 0029 SET ENTITY DEST 82 B 2
										dc.w $82
										dc.w $B
										dc.w 2
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 82
										dc.w $82
										dc.w 4
										dc.w $32                ; 0032 SET CAMERA DEST 5 8
										dc.w 5
										dc.w 8
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $18                ; 0018 FLASH ENTITY WHITE 81 32
										dc.w $81
										dc.w $32
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $18                ; 0018 FLASH ENTITY WHITE 81 1E
										dc.w $81
										dc.w $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 6
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 2
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461E4
										dc.b $1F
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 0 2
										dc.w $1F
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 1F 2
										dc.w 7
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4C96C:         dc.w $A
										dc.w $D
										dc.w 1
										dc.b $C
										dc.b $D
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $B
										dc.b $A
										dc.b 3
										dc.b $9B
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $D7
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $AC
										dc.l eas_Init           
										dc.w $FFFF
bbcs_31:            dc.w 4                  ; 0004 SET TEXT INDEX AFB
										dc.w $AFB
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 2 10 2
										dc.w 2
										dc.w $10
										dc.w 2
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4CB92
										dc.l word_4CB92
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 14 3 3
										dc.b 7
										dc.b $14
										dc.b 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 16 3 3
										dc.b $1F
										dc.b $16
										dc.b 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 16 FF 460CE
										dc.b $16
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 16 15 3 3
										dc.b $16
										dc.b $15
										dc.b 3
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 6
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FB2
										dc.b $82
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 10 5
										dc.w $10
										dc.w 5
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 10 2
										dc.w $10
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 10 0
										dc.w $10
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 1 1
										dc.b $16
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $41                ; 0041 FLASH SCREEN WHITE 2
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 15 1 2
										dc.b $82
										dc.b $15
										dc.b 1
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 16 FF 45E44
										dc.b $16
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 16 FF 46172
										dc.b $16
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 3 1
										dc.b $16
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 10 6
										dc.w $10
										dc.w 6
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 6
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $32                ; 0032 SET CAMERA DEST 10 D
										dc.w $10
										dc.w $D
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 13 12 1
										dc.b $83
										dc.b $13
										dc.b $12
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 15 13 1
										dc.b $84
										dc.b $15
										dc.b $13
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 16 12 1
										dc.b $85
										dc.b $16
										dc.b $12
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 17 F 1
										dc.b $86
										dc.b $17
										dc.b $F
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45E44
										dc.b $83
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E44
										dc.b $84
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E44
										dc.b $86
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST 10 6
										dc.w $10
										dc.w 6
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4CB92:         dc.w $15
										dc.w 4
										dc.w 3
										dc.b $14
										dc.b 3
										dc.b 3
										dc.b 7
										dc.l eas_Init           
										dc.b $15
										dc.b 3
										dc.b 3
										dc.b $16
										dc.l eas_Init           
										dc.b $15
										dc.b 8
										dc.b 1
										dc.b $9F
										dc.l eas_Init           
										dc.b $15
										dc.b $B
										dc.b 1
										dc.b $9C
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $AB
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $8D
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $91
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $56
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $6F
										dc.l eas_Init           
										dc.w $FFFF
bbcs_32:            dc.w 4                  ; 0004 SET TEXT INDEX B1D
										dc.w $B1D
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 4A A 26
										dc.w $4A
										dc.w $A
										dc.w $26
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4CCC0
										dc.l word_4CCC0
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 10 2D 1
										dc.b 7
										dc.b $10
										dc.b $2D
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F E 2D 1
										dc.b $1F
										dc.b $E
										dc.b $2D
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 16 FF 460CE
										dc.b $16
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 16 F 2E 1
										dc.b $16
										dc.b $F
										dc.b $2E
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E F 2D 1
										dc.b $1E
										dc.b $F
										dc.b $2D
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 3
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 3
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 3
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1E 0 1 3
										dc.b $1E
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 1 3
										dc.b $16
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST A 12
										dc.w $A
										dc.w $12
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
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
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E44
										dc.b $84
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E44
										dc.b $86
										dc.b $FF
										dc.l eas_Jump           
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4CCC0:         dc.w $F
										dc.w $2C
										dc.w 1
										dc.b $10
										dc.b $2D
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $F
										dc.b $2E
										dc.b 1
										dc.b $16
										dc.l eas_Init           
										dc.b $E
										dc.b $15
										dc.b 3
										dc.b $7A
										dc.l eas_Init           
										dc.b $C
										dc.b $15
										dc.b 3
										dc.b $89
										dc.l eas_Init           
										dc.b $D
										dc.b $14
										dc.b 3
										dc.b $8D
										dc.l eas_Init           
										dc.b $10
										dc.b $16
										dc.b 3
										dc.b $70
										dc.l eas_Init           
										dc.b $E
										dc.b $18
										dc.b 3
										dc.b $57
										dc.l eas_Init           
										dc.b $10
										dc.b $18
										dc.b 3
										dc.b $58
										dc.l eas_Init           
										dc.b $12
										dc.b $17
										dc.b 3
										dc.b $89
										dc.l eas_Init           
										dc.w $FFFF
cs_4CD10:           dc.w 4                  ; 0004 SET TEXT INDEX B21
										dc.w $B21
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 4CD56
										dc.l sub_4CD56
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 38
										dc.w $38
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 17
										dc.w $17
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 17
										dc.w $17
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 17
										dc.w $17
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 17 1
										dc.b $17
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 17
										dc.w $17
										dc.w $23                ; 0023 SET ENTITY FACING 17 3
										dc.b $17
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 17
										dc.w $17
										dc.w $54                ; 0054  17 FFFF
										dc.w $17
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 182 FFFF
										dc.w $182
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_4CD56:
										
										move.w  #$8F,d0 
										jsr     j_GetXPos
										move.w  d1,d7
										jsr     j_GetYPos
										move.w  d1,d6
										clr.w   d1
										jsr     j_SetCurrentHP
										move.w  #$FFFF,d1
										jsr     j_SetXPos
										move.w  #$FFFF,d1
										jsr     j_SetYPos
										moveq   #$17,d0
										move.w  d7,d1
										jsr     j_SetXPos
										move.w  d6,d1
										jsr     j_SetYPos
										moveq   #$17,d0
										jsr     j_JoinForce
										moveq   #$17,d0
										jsr     j_JoinBattleParty
										move.b  ((byte_FFB160+$F)).l,(ENTITY_EVENT_IDX_LIST+$17).l
										rts

	; End of function sub_4CD56

word_4CDB4:         dc.w 4                  ; 0004 SET TEXT INDEX B25
										dc.w $B25
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 4A 5 14
										dc.w $4A
										dc.w 5
										dc.w $14
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4CEEC
										dc.l word_4CEEC
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 B 19 1
										dc.b 7
										dc.b $B
										dc.b $19
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 9 19 1
										dc.b $1F
										dc.b 9
										dc.b $19
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 16 FF 460CE
										dc.b $16
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 16 B 1A 1
										dc.b $16
										dc.b $B
										dc.b $1A
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E A 1A 1
										dc.b $1E
										dc.b $A
										dc.b $1A
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 17 FF 460CE
										dc.b $17
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 17 A 16 3
										dc.b $17
										dc.b $A
										dc.b $16
										dc.b 3
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 17 FF 3 1
										dc.b $17
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C017
										dc.w $C017
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C017
										dc.w $C017
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 17 0
										dc.b $17
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C017
										dc.w $C017
										dc.w $23                ; 0023 SET ENTITY FACING 17 3
										dc.b $17
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C017
										dc.w $C017
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w 8                  ; 0008 JOIN FORCE 17
										dc.w $17
										dc.w $54                ; 0054  17 0
										dc.w $17
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 17 FF 3 1
										dc.b $17
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C017
										dc.w $C017
										dc.w $15                ; 0015 SET ACTSCRIPT 17 FF 45E44
										dc.b $17
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 17 FF 45E44
										dc.b $17
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C017
										dc.w $C017
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 4CEE4
										dc.l sub_4CEE4
										dc.w $2C                ; 002C FOLLOW ENTITY 1E 0 2
										dc.w $1E
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 1E 1
										dc.w 7
										dc.w $1E
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 1E 3
										dc.w $1F
										dc.w $1E
										dc.w 3
										dc.w $2C                ; 002C FOLLOW ENTITY 16 1E 2
										dc.w $16
										dc.w $1E
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 17 16 2
										dc.w $17
										dc.w $16
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_4CEE4:
										
										moveq   #$17,d0
										jmp     j_LeaveBattleParty

	; End of function sub_4CEE4

word_4CEEC:         dc.w $A
										dc.w $19
										dc.w 1
										dc.b $B
										dc.b $19
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $B
										dc.b $1A
										dc.b 1
										dc.b $16
										dc.l eas_Init           
										dc.b $A
										dc.b $16
										dc.b 3
										dc.b $17
										dc.l eas_Init           
										dc.w $FFFF
bbcs_33:            dc.w 4                  ; 0004 SET TEXT INDEX B32
										dc.w $B32
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 1F 16 1D
										dc.w $1F
										dc.w $16
										dc.w $1D
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4D048
										dc.l word_4D048
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 1B 26 2
										dc.b 7
										dc.b $1B
										dc.b $26
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 1B 25 2
										dc.b $1F
										dc.b $1B
										dc.b $25
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 16 FF 460CE
										dc.b $16
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 16 1B 24 2
										dc.b $16
										dc.b $1B
										dc.b $24
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 1008 101 2001
										dc.w $1008
										dc.w $101
										dc.w $2001
										dc.w $34                ; 0034 SET BLOCKS 327 101 1008
										dc.w $327
										dc.w $101
										dc.w $1008
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_3
										dc.w $21
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 1 1
										dc.b $16
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 16 3
										dc.b $16
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 16
										dc.w $16
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 1 1
										dc.b $16
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w $34                ; 0034 SET BLOCKS 127 202 1A20
										dc.w $127
										dc.w $202
										dc.w $1A20
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 16 0 1 6
										dc.b $16
										dc.b 0
										dc.b 1
										dc.b 6
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 7
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 7
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 6
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 6
										dc.b 2
										dc.b 2
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 8
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 8
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $32                ; 0032 SET CAMERA DEST 5 8
										dc.w 5
										dc.w 8
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 16
										dc.w $16
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 16
										dc.w $16
										dc.w $32                ; 0032 SET CAMERA DEST 15 19
										dc.w $15
										dc.w $19
										dc.w $2D                ; 002D MOVE ENTITY 16 FF 3 1
										dc.b $16
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 16
										dc.w $16
										dc.w 8                  ; 0008 JOIN FORCE 16
										dc.w $16
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $51                ; 0051  16
										dc.w $16
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 4D078
										dc.l sub_4D078
										dc.w 4                  ; 0004 SET TEXT INDEX B3B
										dc.w $B3B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $10                ; 0010 SET FLAG 33F FFFF
										dc.w $33F
										dc.w $FFFF
										dc.w $10                ; 0010 SET FLAG 52 0
										dc.w $52
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4D048:         dc.w $1A
										dc.w $25
										dc.w 2
										dc.b $1B
										dc.b $26
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.b $1B
										dc.b $24
										dc.b 2
										dc.b $16
										dc.l eas_Init           
										dc.b $A
										dc.b $A
										dc.b 3
										dc.b $93
										dc.l eas_Init           
										dc.b 9
										dc.b $A
										dc.b 3
										dc.b $57
										dc.l eas_Init           
										dc.b $B
										dc.b $A
										dc.b 3
										dc.b $57
										dc.l eas_Init           
										dc.w $FFFF

; =============== S U B R O U T I N E =======================================

sub_4D078:
										
										cmp.w   #$FFFF,(RAM_Dialogue_NameIdx1).l
										beq.s   return_4D098
										jsr     (hideTextBox).l 
										move.w  #$B3A,d0
										jsr     (DisplayText).l 
										jsr     (hideTextBox).l 
return_4D098:
										
										rts

	; End of function sub_4D078

word_4D09A:         dc.w 4                  ; 0004 SET TEXT INDEX B3C
										dc.w $B3C
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 1F 8 6
										dc.w $1F
										dc.w 8
										dc.w 6
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4D322
										dc.l word_4D322
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D B 1
										dc.b 7
										dc.b $D
										dc.b $B
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F C 9 3
										dc.b $1F
										dc.b $C
										dc.b 9
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 327 101 1008
										dc.w $327
										dc.w $101
										dc.w $1008
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 1
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 461AA
										dc.b $80
										dc.b $FF
										dc.l eas_461AA          
										dc.w $2D                ; 002D MOVE ENTITY 1A 0 3 1
										dc.b $1A
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 461AA
										dc.b $1A
										dc.b $FF
										dc.l eas_461AA          
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 45F9C
										dc.b $1A
										dc.b $FF
										dc.l word_45F9C         
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461B6
										dc.b 0
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461E4
										dc.b $1F
										dc.b 0
										dc.l eas_461E4          
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 1
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 1
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 1
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 1
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 461AA
										dc.b $80
										dc.b $FF
										dc.l eas_461AA          
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 3
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$18 Y=$18
										dc.b $18
										dc.b $18
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 1
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 461AA
										dc.b $80
										dc.b $FF
										dc.l eas_461AA          
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 1
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 461AA
										dc.b $80
										dc.b $FF
										dc.l eas_461AA          
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 7
										dc.b 7
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST A 6
										dc.w $A
										dc.w 6
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$18 Y=$18
										dc.b $18
										dc.b $18
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 1
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 461AA
										dc.b $80
										dc.b $FF
										dc.l eas_461AA          
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 0 3
										dc.b $1F
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 4
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E94
										dc.b $80
										dc.b $FF
										dc.l eas_JumpRight      
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$38 Y=$38
										dc.b $38
										dc.b $38
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 1
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 10 8 3
										dc.b $1A
										dc.b $10
										dc.b 8
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 461AA
										dc.b $80
										dc.b $FF
										dc.l eas_461AA          
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01A
										dc.w $C01A
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01A
										dc.w $C01A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3F 3
										dc.b $1A
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 0 2
										dc.w $1F
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 1F 2
										dc.w 7
										dc.w $1F
										dc.w 2
										dc.w $10                ; 0010 SET FLAG 341 FFFF
										dc.w $341
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4D322:         dc.w $B
										dc.w $B
										dc.w 1
										dc.b $D
										dc.b $B
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $10
										dc.b 8
										dc.b 1
										dc.b $B3
										dc.l eas_Init           
										dc.b $10
										dc.b 8
										dc.b 3
										dc.b $1A
										dc.l eas_Init           
										dc.w $FFFF
bbcs_34:            dc.w 4                  ; 0004 SET TEXT INDEX B4F
										dc.w $B4F
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 37 15 16
										dc.w $37
										dc.w $15
										dc.w $16
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4D48E
										dc.l word_4D48E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 1E 1C 2
										dc.b 7
										dc.b $1E
										dc.b $1C
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 1E 1E 2
										dc.b $1F
										dc.b $1E
										dc.b $1E
										dc.b 2
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D38E
										dc.w $4C
										dc.l word_4D38E         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 1F 1D 2
										dc.b $1A
										dc.b $1F
										dc.b $1D
										dc.b 2
word_4D38E:         dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 6
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 2 3
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 2 3
										dc.b 7
										dc.b 0
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 82 0 2 3
										dc.b $82
										dc.b 0
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D3C6
										dc.w $4C
										dc.l word_4D3C6         
										dc.w $2D                ; 002D MOVE ENTITY 1A 0 2 3
										dc.b $1A
										dc.b 0
										dc.b 2
										dc.b 3
										dc.w $8080
word_4D3C6:         dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 3
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $32                ; 0032 SET CAMERA DEST 7 5
										dc.w 7
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 7 4
										dc.w 7
										dc.w 4
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 4
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 81
										dc.w $81
										dc.w 6
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461B6
										dc.b $80
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $3D                ; 003D TINT MAP
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $3E                ; 003E SIMILAR TO TINT MAP
										dc.w $32                ; 0032 SET CAMERA DEST 7 3
										dc.w 7
										dc.w 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 15 16
										dc.w $15
										dc.w $16
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4D48E:         dc.w $1D
										dc.w $1D
										dc.w 2
										dc.b $1E
										dc.b $1C
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.b $B
										dc.b $A
										dc.b 3
										dc.b $9C
										dc.l eas_Init           
										dc.b $B
										dc.b 6
										dc.b 3
										dc.b $9F
										dc.l eas_Init           
										dc.b $1E
										dc.b $1D
										dc.b 2
										dc.b $3E
										dc.l eas_Init           
										dc.w $FFFF
word_4D4B6:         dc.w 4                  ; 0004 SET TEXT INDEX B5F
										dc.w $B5F
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 37 2 7
										dc.w $37
										dc.w 2
										dc.w 7
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4D69E
										dc.l word_4D69E
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 9 B 1
										dc.b 7
										dc.b 9
										dc.b $B
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 5 B 1
										dc.b $1F
										dc.b 5
										dc.b $B
										dc.b 1
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D502
										dc.w $4C
										dc.l word_4D502         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 8 C 1
										dc.b $1A
										dc.b 8
										dc.b $C
										dc.b 1
word_4D502:         dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1C                ; 001C STOP ENTITY ANIM 83
										dc.w $83
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46172
										dc.b $83
										dc.b $FF
										dc.l eas_46172          
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 7 A 2
										dc.b $83
										dc.b 7
										dc.b $A
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $3D                ; 003D TINT MAP
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $41                ; 0041 FLASH SCREEN WHITE 2
										dc.w 2
										dc.w $3D                ; 003D TINT MAP
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 B4
										dc.w $80
										dc.w $B4
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45FB2
										dc.b $80
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D592
										dc.w $4C
										dc.l word_4D592         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A 0 45E44
										dc.b $1A
										dc.b 0
										dc.l eas_Jump           
word_4D592:         dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 9C
										dc.w $80
										dc.w $9C
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46024
										dc.b $80
										dc.b $FF
										dc.l eas_Die            
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $3E                ; 003E SIMILAR TO TINT MAP
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D620
										dc.w $4C
										dc.l word_4D620         
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1A
										dc.b $1A
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$18 Y=$18
										dc.b $18
										dc.b $18
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 1 1
										dc.b $1A
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A
										dc.w $1A
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A
										dc.w $1A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1A 1
										dc.b $1A
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1A
										dc.w $1A
word_4D620:         dc.w 4                  ; 0004 SET TEXT INDEX B74
										dc.w $B74
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D654
										dc.w $4C
										dc.l word_4D654         
										dc.w $2D                ; 002D MOVE ENTITY 1A FF 0 1
										dc.b $1A
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1A 2
										dc.b $1A
										dc.b 2
word_4D654:         dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 4D694
										dc.l sub_4D694
										dc.w $2C                ; 002C FOLLOW ENTITY 82 0 2
										dc.w $82
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 82 1
										dc.w 7
										dc.w $82
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 82 3
										dc.w $1F
										dc.w $82
										dc.w 3
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D692
										dc.w $4C
										dc.l word_4D692         
										dc.w $2C                ; 002C FOLLOW ENTITY 1A 82 2
										dc.w $1A
										dc.w $82
										dc.w 2
word_4D692:         dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_4D694:
										
										moveq   #$71,d0 
										moveq   #1,d1
										jmp     sub_4F48A

	; End of function sub_4D694

word_4D69E:         dc.w 7
										dc.w $C
										dc.w 1
										dc.b 9
										dc.b $B
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b 7
										dc.b 9
										dc.b 3
										dc.b $9C
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $9F
										dc.l eas_Init           
										dc.b 6
										dc.b $C
										dc.b 1
										dc.b $3E
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $AC
										dc.l eas_Init           
										dc.w $FFFF
bbcs_35:            dc.w 4                  ; 0004 SET TEXT INDEX B76
										dc.w $B76
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 4C 25 5
										dc.w $4C
										dc.w $25
										dc.w 5
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4D832
										dc.l word_4D832
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 2C A 2
										dc.b 7
										dc.b $2C
										dc.b $A
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 2C 8 2
										dc.b $1F
										dc.b $2C
										dc.b 8
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 2C 9 2
										dc.b $1E
										dc.b $2C
										dc.b 9
										dc.b 2
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D728
										dc.w $4C
										dc.l word_4D728         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4D728:         dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $32                ; 0032 SET CAMERA DEST 16 B
										dc.w $16
										dc.w $B
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C007
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C01F
										dc.w $C01F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $32                ; 0032 SET CAMERA DEST 16 14
										dc.w $16
										dc.w $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 1C 18 3
										dc.b $80
										dc.b $1C
										dc.b $18
										dc.b 3
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 82 3
										dc.b $82
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 83 2
										dc.b $83
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 85 0
										dc.b $85
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 86 0
										dc.b $86
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 87 0
										dc.b $87
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 88 0
										dc.b $88
										dc.b 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 0
										dc.b $80
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
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
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E44
										dc.b $84
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E44
										dc.b $85
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 45E44
										dc.b $86
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 45E44
										dc.b $87
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 45E44
										dc.b $88
										dc.b 0
										dc.l eas_Jump           
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $32                ; 0032 SET CAMERA DEST 25 5
										dc.w $25
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4D832:         dc.w $2B
										dc.w 9
										dc.w 2
										dc.b $2C
										dc.b $A
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.b $1B
										dc.b $10
										dc.b 1
										dc.b $9F
										dc.l eas_Init           
										dc.b $1A
										dc.b $15
										dc.b 1
										dc.b $59
										dc.l eas_Init           
										dc.b $1D
										dc.b $15
										dc.b 1
										dc.b $59
										dc.l eas_Init           
										dc.b $1F
										dc.b $18
										dc.b 1
										dc.b $59
										dc.l eas_Init           
										dc.b $1C
										dc.b $1C
										dc.b 1
										dc.b $59
										dc.l eas_Init           
										dc.b $18
										dc.b $18
										dc.b 1
										dc.b $5A
										dc.l eas_Init           
										dc.b $18
										dc.b $19
										dc.b 1
										dc.b $5B
										dc.l eas_Init           
										dc.b $18
										dc.b $1A
										dc.b 1
										dc.b $71
										dc.l eas_Init           
										dc.b $18
										dc.b $1B
										dc.b 1
										dc.b $72
										dc.l eas_Init           
										dc.w $FFFF
bbcs_36:            dc.w 4                  ; 0004 SET TEXT INDEX B82
										dc.w $B82
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 35 F 0
										dc.w $35
										dc.w $F
										dc.w 0
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4D964
										dc.l word_4D964
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 12 0 3
										dc.b 7
										dc.b $12
										dc.b 0
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 14 0 3
										dc.b $1F
										dc.b $14
										dc.b 0
										dc.b 3
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D8D6
										dc.w $4C
										dc.l word_4D8D6         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4D8D6:         dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 4
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 4
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 3 4
										dc.b $1F
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 4
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST A E
										dc.w $A
										dc.w $E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FB2
										dc.b $82
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45FB2
										dc.b $83
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45FB2
										dc.b $84
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45FB2
										dc.b $85
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $32                ; 0032 SET CAMERA DEST E 2
										dc.w $E
										dc.w 2
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4D964:         dc.w $13
										dc.w 1
										dc.w 3
										dc.b $12
										dc.b 0
										dc.b 3
										dc.b 7
										dc.l eas_Init           
										dc.b $10
										dc.b $10
										dc.b 1
										dc.b $9F
										dc.l eas_Init           
										dc.b $13
										dc.b 0
										dc.b 3
										dc.b $3E
										dc.l eas_Init           
										dc.b $C
										dc.b $10
										dc.b 0
										dc.b $9D
										dc.l eas_Init           
										dc.b $D
										dc.b $11
										dc.b 1
										dc.b $9D
										dc.l eas_Init           
										dc.b $E
										dc.b $13
										dc.b 2
										dc.b $9D
										dc.l eas_Init           
										dc.b $F
										dc.b $14
										dc.b 1
										dc.b $9D
										dc.l eas_Init           
										dc.w $FFFF
word_4D9A4:         dc.w 4                  ; 0004 SET TEXT INDEX B89
										dc.w $B89
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 35 6 11
										dc.w $35
										dc.w 6
										dc.w $11
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4DA46
										dc.l word_4DA46
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 A 13 3
										dc.b 7
										dc.b $A
										dc.b $13
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F C 13 3
										dc.b $1F
										dc.b $C
										dc.b $13
										dc.b 3
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4D9F0
										dc.w $4C
										dc.l word_4D9F0         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4D9F0:         dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 461B6
										dc.b $80
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $2C                ; 002C FOLLOW ENTITY 81 0 2
										dc.w $81
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 81 1
										dc.w 7
										dc.w $81
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 81 3
										dc.w $1F
										dc.w $81
										dc.w 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4DA46:         dc.w $B
										dc.w $14
										dc.w 3
										dc.b $A
										dc.b $13
										dc.b 3
										dc.b 7
										dc.l eas_Init           
										dc.b $B
										dc.b $17
										dc.b 3
										dc.b $9F
										dc.l eas_Init           
										dc.b $B
										dc.b $13
										dc.b 3
										dc.b $3E
										dc.l eas_Init           
										dc.w $FFFF
bbcs_37:            dc.w 4                  ; 0004 SET TEXT INDEX B8C
										dc.w $B8C
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 4D 32 21
										dc.w $4D
										dc.w $32
										dc.w $21
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4DB74
										dc.l word_4DB74
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 38 25 2
										dc.b 7
										dc.b $38
										dc.b $25
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 38 23 2
										dc.b $1F
										dc.b $38
										dc.b $23
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 38 24 2
										dc.b $1E
										dc.b $38
										dc.b $24
										dc.b 2
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4DAB8
										dc.w $4C
										dc.l word_4DAB8         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4DAB8:         dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $32                ; 0032 SET CAMERA DEST 28 2C
										dc.w $28
										dc.w $2C
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 2D 2F 1
										dc.b $80
										dc.b $2D
										dc.b $2F
										dc.b 1
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 1E 36
										dc.w $1E
										dc.w $36
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 28 2C
										dc.w $28
										dc.w $2C
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $32                ; 0032 SET CAMERA DEST 32 21
										dc.w $32
										dc.w $21
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4DB74:         dc.w $37
										dc.w $24
										dc.w 2
										dc.b $38
										dc.b $25
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $9F
										dc.l eas_Init           
										dc.b $23
										dc.b $3C
										dc.b 1
										dc.b $9E
										dc.l eas_Init           
										dc.w $FFFF
word_4DB94:         dc.w 4                  ; 0004 SET TEXT INDEX B9C
										dc.w $B9C
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 4D 1F 36
										dc.w $4D
										dc.w $1F
										dc.w $36
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4DD8C
										dc.l word_4DD8C
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 21 3B 0
										dc.b 7
										dc.b $21
										dc.b $3B
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 22 39 3
										dc.b $1F
										dc.b $22
										dc.b $39
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 25 3B 2
										dc.b $1E
										dc.b $25
										dc.b $3B
										dc.b 2
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4DBEE
										dc.w $4C
										dc.l word_4DBEE         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4DBEE:         dc.w $1C                ; 001C STOP ENTITY ANIM 1C
										dc.w $1C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 1C
										dc.b $1C
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $53                ; 0053  1F 0
										dc.w $1F
										dc.w 0
										dc.w $53                ; 0053  1C FFFF
										dc.w $1C
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 3 2
										dc.b 0
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.w $1C                ; 001C STOP ENTITY ANIM 1C
										dc.w $1C
										dc.w $18                ; 0018 FLASH ENTITY WHITE 1C 39
										dc.w $1C
										dc.w $39
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $1B                ; 001B START ENTITY ANIM 1C
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1C 0 461B6
										dc.b $1C
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C01C
										dc.w $C01C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 3 2
										dc.b $1C
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 1
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1C
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45E44
										dc.b 0
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01C
										dc.w $C01C
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 3 3
										dc.b $1C
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4DD8C:         dc.w $24
										dc.w $39
										dc.w 3
										dc.b $21
										dc.b $3B
										dc.b 0
										dc.b 7
										dc.l eas_Init           
										dc.b $23
										dc.b $3B
										dc.b 3
										dc.b $1C
										dc.l eas_Init           
										dc.w $FFFF
bbcs_38:            dc.w 4                  ; 0004 SET TEXT INDEX BBB
										dc.w $BBB
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 42 9 6
										dc.w $42
										dc.w 9
										dc.w 6
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4DE74
										dc.l word_4DE74
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 8 3
										dc.b 7
										dc.b $D
										dc.b 8
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F F 8 3
										dc.b $1F
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E E 8 3
										dc.b $1E
										dc.b $E
										dc.b 8
										dc.b 3
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4DDFE
										dc.w $4C
										dc.l word_4DDFE         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3F 3
										dc.b $1A
										dc.b $3F
										dc.b $3F
										dc.b 3
word_4DDFE:         dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_1
										dc.w $22
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 3 2
										dc.b 0
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 3 2
										dc.b 7
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1E 0 3 2
										dc.b $1E
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 2
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $32                ; 0032 SET CAMERA DEST 9 13
										dc.w 9
										dc.w $13
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C01F
										dc.w $C01F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $41                ; 0041 FLASH SCREEN WHITE 32
										dc.w $32
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4DE74:         dc.w $E
										dc.w 9
										dc.w 3
										dc.b $D
										dc.b 8
										dc.b 3
										dc.b 7
										dc.l eas_Init           
										dc.b $D
										dc.b $17
										dc.b 1
										dc.b $9F
										dc.l eas_Init           
										dc.w $FFFF
word_4DE8C:         dc.w 4                  ; 0004 SET TEXT INDEX BC4
										dc.w $BC4
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 42 3 16
										dc.w $42
										dc.w 3
										dc.w $16
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4E372
										dc.l word_4E372
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 5 19 0
										dc.b 7
										dc.b 5
										dc.b $19
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 8 1C 1
										dc.b $1F
										dc.b 8
										dc.b $1C
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1E FF 460CE
										dc.b $1E
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 9 18 3
										dc.b $1E
										dc.b 9
										dc.b $18
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 88
										dc.w $88
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4DF00
										dc.w $4C
										dc.l word_4DF00         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4DF00:         dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 83 FF 46172
										dc.b $83
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 84 FF 46172
										dc.b $84
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 85 FF 46172
										dc.b $85
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 46172
										dc.b $86
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 87 FF 46172
										dc.b $87
										dc.b $FF
										dc.l eas_46172          
										dc.w $53                ; 0053  0 0
										dc.w 0
										dc.w 0
										dc.w $53                ; 0053  88 FFFF
										dc.w $88
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 88
										dc.w $88
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1B                ; 001B START ENTITY ANIM 88
										dc.w $88
										dc.w $23                ; 0023 SET ENTITY FACING 88 1
										dc.b $88
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 0 1
										dc.b $88
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 1
										dc.b 3
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 0 1 1
										dc.b $88
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT C
										dc.b $C
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 461AA
										dc.b $88
										dc.b $FF
										dc.l eas_461AA          
										dc.w $33                ; 0033 SET QUAKE AMOUNT 1
										dc.w 1
										dc.w $1C                ; 001C STOP ENTITY ANIM 88
										dc.w $88
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 8 18 2
										dc.b $88
										dc.b 8
										dc.b $18
										dc.b 2
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 46172
										dc.b $88
										dc.b $FF
										dc.l eas_46172          
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
										dc.b $28
										dc.b $28
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 3 1
										dc.b $88
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 3 1
										dc.b $88
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 0
										dc.b $88
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 3 1
										dc.b $88
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 1
										dc.b $88
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 88
										dc.w $88
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $0
										dc.w 0
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 88
										dc.w $88
										dc.w $1B                ; 001B START ENTITY ANIM 88
										dc.w $88
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 45E44
										dc.b $88
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 46172
										dc.b $88
										dc.b $FF
										dc.l eas_46172          
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 2
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 1
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C01F
										dc.w $C01F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w $23                ; 0023 SET ENTITY FACING 88 2
										dc.b $88
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 460CE
										dc.b $88
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 88 1
										dc.b $88
										dc.b 1
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 88
										dc.w $88
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 8
										dc.w 8
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$8 Y=$8
										dc.b 8
										dc.b 8
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 1
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 2
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 2
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 3
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 461B6
										dc.b $88
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w $3D                ; 003D TINT MAP
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C089
										dc.w $C089
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 45E44
										dc.b $88
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 45E44
										dc.b $88
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 46172
										dc.b $88
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 88 FF 1 1
										dc.b $88
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C089
										dc.w $C089
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 88
										dc.w $88
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C089
										dc.w $C089
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C089
										dc.w $C089
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 88
										dc.w $88
										dc.w $53                ; 0053  88 0
										dc.w $88
										dc.w 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 8 D 0
										dc.b $80
										dc.b 8
										dc.b $D
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 A E 2
										dc.b $81
										dc.b $A
										dc.b $E
										dc.b 2
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 461B6
										dc.b $88
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 B 10 0
										dc.b $82
										dc.b $B
										dc.b $10
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 83 A 12 2
										dc.b $83
										dc.b $A
										dc.b $12
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 84 8 13 0
										dc.b $84
										dc.b 8
										dc.b $13
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 6 12 2
										dc.b $85
										dc.b 6
										dc.b $12
										dc.b 2
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 5 10 0
										dc.b $86
										dc.b 5
										dc.b $10
										dc.b 0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 6 E 2
										dc.b $87
										dc.b 6
										dc.b $E
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $3D                ; 003D TINT MAP
										dc.w $23                ; 0023 SET ENTITY FACING 88 3
										dc.b $88
										dc.b 3
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 82
										dc.b $82
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 84
										dc.b $84
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 87
										dc.b $87
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$50 Y=$50
										dc.b $50
										dc.b $50
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 3
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 88 2
										dc.b $88
										dc.b 2
										dc.w $1A                ; 001A SET ENTITY SPRITE 88 B4
										dc.w $88
										dc.w $B4
										dc.w $15                ; 0015 SET ACTSCRIPT 88 0 45FB2
										dc.b $88
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E6C
										dc.b $80
										dc.b 0
										dc.l eas_JumpLeft       
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 6 2
										dc.b $81
										dc.b $FF
										dc.b 6
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E94
										dc.b $81
										dc.b 0
										dc.l eas_JumpRight      
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 2 3
										dc.b $82
										dc.b $FF
										dc.b 2
										dc.b 3
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45E6C
										dc.b $82
										dc.b 0
										dc.l eas_JumpLeft       
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 5 2
										dc.b $83
										dc.b $FF
										dc.b 5
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 83 0 45E94
										dc.b $83
										dc.b 0
										dc.l eas_JumpRight      
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 1 3
										dc.b $84
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 84 0 45E6C
										dc.b $84
										dc.b 0
										dc.l eas_JumpLeft       
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 85 FF 4 2
										dc.b $85
										dc.b $FF
										dc.b 4
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 85 0 45E94
										dc.b $85
										dc.b 0
										dc.l eas_JumpRight      
										dc.w $2E                ; 002E HIDE ENTITY 84
										dc.w $84
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 86 FF 0 3
										dc.b $86
										dc.b $FF
										dc.b 0
										dc.b 3
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 86 0 45E6C
										dc.b $86
										dc.b 0
										dc.l eas_JumpLeft       
										dc.w $2E                ; 002E HIDE ENTITY 85
										dc.w $85
										dc.w 5                  ; 0005 PLAY SOUND SFX_BOLT_SPELL
										dc.w $77
										dc.w $2D                ; 002D MOVE ENTITY 87 FF 7 2
										dc.b $87
										dc.b $FF
										dc.b 7
										dc.b 2
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 45E94
										dc.b $87
										dc.b 0
										dc.l eas_JumpRight      
										dc.w $2E                ; 002E HIDE ENTITY 86
										dc.w $86
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2E                ; 002E HIDE ENTITY 87
										dc.w $87
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $1A                ; 001A SET ENTITY SPRITE 88 9F
										dc.w $88
										dc.w $9F
										dc.w $15                ; 0015 SET ACTSCRIPT 88 FF 46024
										dc.b $88
										dc.b $FF
										dc.l eas_Die            
										dc.w $3E                ; 003E SIMILAR TO TINT MAP
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $32                ; 0032 SET CAMERA DEST 3 14
										dc.w 3
										dc.w $14
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 3
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2C                ; 002C FOLLOW ENTITY 1E 0 2
										dc.w $1E
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 7 1E 1
										dc.w 7
										dc.w $1E
										dc.w 1
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 1E 3
										dc.w $1F
										dc.w $1E
										dc.w 3
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4E372:         dc.w 8
										dc.w $17
										dc.w 3
										dc.b 5
										dc.b $19
										dc.b 0
										dc.b 7
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 0
										dc.b $B2
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.b $B2
										dc.l eas_Init           
										dc.b 6
										dc.b $1B
										dc.b 3
										dc.b $9F
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $A2
										dc.l eas_Init           
										dc.w $FFFF
bbcs_39:            dc.w 4                  ; 0004 SET TEXT INDEX BD5
										dc.w $BD5
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 42 3 5
										dc.w $42
										dc.w 3
										dc.w 5
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4E4AC
										dc.l word_4E4AC
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 9 8 3
										dc.b 7
										dc.b 9
										dc.b 8
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 7 8 3
										dc.b $1F
										dc.b 7
										dc.b 8
										dc.b 3
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1E 8 8 3
										dc.b $1E
										dc.b 8
										dc.b 8
										dc.b 3
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4E40C
										dc.w $4C
										dc.l word_4E40C         
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 8 7 3
										dc.b $1A
										dc.b 8
										dc.b 7
										dc.b 3
word_4E40C:         dc.w $D                 ; 000D JUMP IF CLEAR FLAG 47 4E41A
										dc.w $47
										dc.l word_4E41A         
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C 3F 3E 3
										dc.b $1C
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4E41A:         dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $32                ; 0032 SET CAMERA DEST 3 12
										dc.w 3
										dc.w $12
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
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
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $2D                ; 002D MOVE ENTITY 83 FF 1 1
										dc.b $83
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 84 FF 1 1
										dc.b $84
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 3 5
										dc.w 3
										dc.w 5
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $32                ; 0032 SET CAMERA DEST 3 12
										dc.w 3
										dc.w $12
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$18 Y=$18
										dc.b $18
										dc.b $18
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 3
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4E4AC:         dc.w 8
										dc.w 9
										dc.w 3
										dc.b 8
										dc.b $14
										dc.b 3
										dc.b $61
										dc.l eas_Init           
										dc.b 7
										dc.b $17
										dc.b 1
										dc.b $8A
										dc.l eas_Init           
										dc.b 9
										dc.b $17
										dc.b 1
										dc.b $94
										dc.l eas_Init           
										dc.b 6
										dc.b $17
										dc.b 1
										dc.b $81
										dc.l eas_Init           
										dc.b $A
										dc.b $17
										dc.b 1
										dc.b $5F
										dc.l eas_Init           
										dc.w $FFFF
bbcs_40:            dc.w 4                  ; 0004 SET TEXT INDEX BDC
										dc.w $BDC
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 36 B 22
										dc.w $36
										dc.w $B
										dc.w $22
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4E878
										dc.l word_4E878
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F 28 1
										dc.b 7
										dc.b $F
										dc.b $28
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 10 28 1
										dc.b $1F
										dc.b $10
										dc.b $28
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C F 29 1
										dc.b $1C
										dc.b $F
										dc.b $29
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 10 29 1
										dc.b $80
										dc.b $10
										dc.b $29
										dc.b 1
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4E544
										dc.w $4C
										dc.l word_4E544         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4E544:         dc.w $34                ; 0034 SET BLOCKS B06 B1D 2C00
										dc.w $B06
										dc.w $B1D
										dc.w $2C00
										dc.w $34                ; 0034 SET BLOCKS 2000 B1D B06
										dc.w $2000
										dc.w $B1D
										dc.w $B06
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $20
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 3
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 3
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 3
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 3
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 3
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 1
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 2
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 1 1
										dc.b $1F
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C 0 1 1
										dc.b $1C
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $32                ; 0032 SET CAMERA DEST B 2
										dc.w $B
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_3
										dc.w $21
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $18                ; 0018 FLASH ENTITY WHITE 81 1E
										dc.w $81
										dc.w $1E
										dc.w $3D                ; 003D TINT MAP
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $3E                ; 003E SIMILAR TO TINT MAP
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $3D                ; 003D TINT MAP
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $3E                ; 003E SIMILAR TO TINT MAP
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FB2
										dc.b $82
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 10 8 1
										dc.b $82
										dc.b $10
										dc.b 8
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1006
										dc.w $60F
										dc.w $101
										dc.w $1006
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3F 3F 1
										dc.b $82
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 F 8 1
										dc.b $82
										dc.b $F
										dc.b 8
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F06
										dc.w $60F
										dc.w $101
										dc.w $F06
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3F 3F 1
										dc.b $82
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 11 9 1
										dc.b $82
										dc.b $11
										dc.b 9
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1107
										dc.w $60F
										dc.w $101
										dc.w $1107
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 10 9 1
										dc.b $82
										dc.b $10
										dc.b 9
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 82 FF 1 2
										dc.b $82
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1007
										dc.w $60F
										dc.w $101
										dc.w $1007
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F07
										dc.w $60F
										dc.w $101
										dc.w $F07
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS 60F 101 E07
										dc.w $60F
										dc.w $101
										dc.w $E07
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1208
										dc.w $60F
										dc.w $101
										dc.w $1208
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1108
										dc.w $60F
										dc.w $101
										dc.w $1108
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1008
										dc.w $60F
										dc.w $101
										dc.w $1008
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F08
										dc.w $60F
										dc.w $101
										dc.w $F08
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 E08
										dc.w $60F
										dc.w $101
										dc.w $E08
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 D08
										dc.w $60F
										dc.w $101
										dc.w $D08
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1309
										dc.w $60F
										dc.w $101
										dc.w $1309
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1209
										dc.w $60F
										dc.w $101
										dc.w $1209
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1109
										dc.w $60F
										dc.w $101
										dc.w $1109
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 1009
										dc.w $60F
										dc.w $101
										dc.w $1009
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F09
										dc.w $60F
										dc.w $101
										dc.w $F09
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 E09
										dc.w $60F
										dc.w $101
										dc.w $E09
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 D09
										dc.w $60F
										dc.w $101
										dc.w $D09
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 C09
										dc.w $60F
										dc.w $101
										dc.w $C09
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS 60F 101 130A
										dc.w $60F
										dc.w $101
										dc.w $130A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 120A
										dc.w $60F
										dc.w $101
										dc.w $120A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 110A
										dc.w $60F
										dc.w $101
										dc.w $110A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 100A
										dc.w $60F
										dc.w $101
										dc.w $100A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F0A
										dc.w $60F
										dc.w $101
										dc.w $F0A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 E0A
										dc.w $60F
										dc.w $101
										dc.w $E0A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 D0A
										dc.w $60F
										dc.w $101
										dc.w $D0A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 C0A
										dc.w $60F
										dc.w $101
										dc.w $C0A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS 60F 101 150B
										dc.w $60F
										dc.w $101
										dc.w $150B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 130B
										dc.w $60F
										dc.w $101
										dc.w $130B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 120B
										dc.w $60F
										dc.w $101
										dc.w $120B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 110B
										dc.w $60F
										dc.w $101
										dc.w $110B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 100B
										dc.w $60F
										dc.w $101
										dc.w $100B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 F0B
										dc.w $60F
										dc.w $101
										dc.w $F0B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 E0B
										dc.w $60F
										dc.w $101
										dc.w $E0B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 D0B
										dc.w $60F
										dc.w $101
										dc.w $D0B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 60F 101 C0B
										dc.w $60F
										dc.w $101
										dc.w $C0B
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS 2C00 B1D B06
										dc.w $2C00
										dc.w $B1D
										dc.w $B06
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $32                ; 0032 SET CAMERA DEST B 1F
										dc.w $B
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 2 1
										dc.b $1F
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4E878:         dc.w $10
										dc.w $27
										dc.w 1
										dc.b $F
										dc.b $28
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $F
										dc.b $29
										dc.b 1
										dc.b $1C
										dc.l eas_Init           
										dc.b $10
										dc.b $29
										dc.b 1
										dc.b $3E
										dc.l eas_Init           
										dc.b $10
										dc.b 4
										dc.b 3
										dc.b $A0
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 1
										dc.b $B2
										dc.l eas_Init           
										dc.w $FFFF
cs_4E8A8:           dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $32                ; 0032 SET CAMERA DEST A 11
										dc.w $A
										dc.w $11
										dc.w $34                ; 0034 SET BLOCKS B0B 101 F15
										dc.w $B0B
										dc.w $101
										dc.w $F15
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1114
										dc.w $B0B
										dc.w $101
										dc.w $1114
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS B0B 101 D13
										dc.w $B0B
										dc.w $101
										dc.w $D13
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS B0B 101 B16
										dc.w $B0B
										dc.w $101
										dc.w $B16
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1015
										dc.w $B0B
										dc.w $101
										dc.w $1015
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS B0B 101 F16
										dc.w $B0B
										dc.w $101
										dc.w $F16
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS B0B 101 E14
										dc.w $B0B
										dc.w $101
										dc.w $E14
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS B0B 101 F14
										dc.w $B0B
										dc.w $101
										dc.w $F14
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1016
										dc.w $B0B
										dc.w $101
										dc.w $1016
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1017
										dc.w $B0B
										dc.w $101
										dc.w $1017
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS B0B 101 E16
										dc.w $B0B
										dc.w $101
										dc.w $E16
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS B0B 101 A17
										dc.w $B0B
										dc.w $101
										dc.w $A17
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1014
										dc.w $B0B
										dc.w $101
										dc.w $1014
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS B0B 101 D14
										dc.w $B0B
										dc.w $101
										dc.w $D14
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS B0B 101 E15
										dc.w $B0B
										dc.w $101
										dc.w $E15
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1115
										dc.w $B0B
										dc.w $101
										dc.w $1115
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1216
										dc.w $B0B
										dc.w $101
										dc.w $1216
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1013
										dc.w $B0B
										dc.w $101
										dc.w $1013
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1116
										dc.w $B0B
										dc.w $101
										dc.w $1116
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1117
										dc.w $B0B
										dc.w $101
										dc.w $1117
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS B0B 101 C13
										dc.w $B0B
										dc.w $101
										dc.w $C13
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1214
										dc.w $B0B
										dc.w $101
										dc.w $1214
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS B0B 101 D16
										dc.w $B0B
										dc.w $101
										dc.w $D16
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS B0B 101 F13
										dc.w $B0B
										dc.w $101
										dc.w $F13
										dc.b $80                ; WAIT 1
										dc.b 1
										dc.w $34                ; 0034 SET BLOCKS B0B 101 1316
										dc.w $B0B
										dc.w $101
										dc.w $1316
										dc.w $10                ; 0010 SET FLAG 183 FFFF
										dc.w $183
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_4E9B2:           dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $32                ; 0032 SET CAMERA DEST D 8
										dc.w $D
										dc.w 8
										dc.w $34                ; 0034 SET BLOCKS B0B 101 130A
										dc.w $B0B
										dc.w $101
										dc.w $130A
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS B0B 101 130B
										dc.w $B0B
										dc.w $101
										dc.w $130B
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS B0B 101 140C
										dc.w $B0B
										dc.w $101
										dc.w $140C
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS B0B 101 150B
										dc.w $B0B
										dc.w $101
										dc.w $150B
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS B0B 101 150C
										dc.w $B0B
										dc.w $101
										dc.w $150C
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $34                ; 0034 SET BLOCKS B0B 101 160C
										dc.w $B0B
										dc.w $101
										dc.w $160C
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS B0B 101 130C
										dc.w $B0B
										dc.w $101
										dc.w $130C
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS B0B 101 120B
										dc.w $B0B
										dc.w $101
										dc.w $120B
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS B0B 101 140D
										dc.w $B0B
										dc.w $101
										dc.w $140D
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS B0B 101 130D
										dc.w $B0B
										dc.w $101
										dc.w $130D
										dc.b $80                ; WAIT 4
										dc.b 4
										dc.w $34                ; 0034 SET BLOCKS B0B 101 120A
										dc.w $B0B
										dc.w $101
										dc.w $120A
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS B0B 101 120C
										dc.w $B0B
										dc.w $101
										dc.w $120C
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS B0B 101 120D
										dc.w $B0B
										dc.w $101
										dc.w $120D
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS B0B 101 110C
										dc.w $B0B
										dc.w $101
										dc.w $110C
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS B0B 101 130E
										dc.w $B0B
										dc.w $101
										dc.w $130E
										dc.b $80                ; WAIT 3
										dc.b 3
										dc.w $34                ; 0034 SET BLOCKS B0B 101 140E
										dc.w $B0B
										dc.w $101
										dc.w $140E
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS B0B 101 150E
										dc.w $B0B
										dc.w $101
										dc.w $150E
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS B0B 101 110A
										dc.w $B0B
										dc.w $101
										dc.w $110A
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS B0B 101 100C
										dc.w $B0B
										dc.w $101
										dc.w $100C
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS B0B 101 110D
										dc.w $B0B
										dc.w $101
										dc.w $110D
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $34                ; 0034 SET BLOCKS B0B 101 D0E
										dc.w $B0B
										dc.w $101
										dc.w $D0E
										dc.w $10                ; 0010 SET FLAG 184 FFFF
										dc.w $184
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4EA94:         dc.w 4                  ; 0004 SET TEXT INDEX BF9
										dc.w $BF9
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 36 A 4
										dc.w $36
										dc.w $A
										dc.w 4
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4ECD6
										dc.l word_4ECD6
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 8 0
										dc.b 7
										dc.b $D
										dc.b 8
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F F 6 3
										dc.b $1F
										dc.b $F
										dc.b 6
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C 11 8 2
										dc.b $1C
										dc.b $11
										dc.b 8
										dc.b 2
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4EAEE
										dc.w $4C
										dc.l word_4EAEE         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4EAEE:         dc.w $34                ; 0034 SET BLOCKS B06 B1D 2C00
										dc.w $B06
										dc.w $B1D
										dc.w $2C00
										dc.w $34                ; 0034 SET BLOCKS 34 A07 D0A
										dc.w $34
										dc.w $A07
										dc.w $D0A
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 83
										dc.b $83
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $1C                ; 001C STOP ENTITY ANIM 83
										dc.w $83
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 46172
										dc.b $81
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 46172
										dc.b $82
										dc.b $FF
										dc.l eas_46172          
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45FB2
										dc.b $80
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45FB2
										dc.b $81
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FB2
										dc.b $82
										dc.b 0
										dc.l eas_AnimSpeedx2    
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_SAD_THEME_1
										dc.w $10
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C000
										dc.w $C000
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C000
										dc.w $C000
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C007
										dc.w $C007
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 1
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $18                ; 0018 FLASH ENTITY WHITE 83 1E
										dc.w $83
										dc.w $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 F 8 3
										dc.b $80
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 0 0 2
										dc.b $80
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 F 8 3
										dc.b $81
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 81 0 7 2
										dc.b $81
										dc.b 0
										dc.b 7
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 F 8 3
										dc.b $82
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 82 0 3 2
										dc.b $82
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 F 8 3
										dc.b $80
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 0 7 2
										dc.b $80
										dc.b 0
										dc.b 7
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 F 8 3
										dc.b $81
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 81 0 0 2
										dc.b $81
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 F 8 3
										dc.b $82
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 82 0 7 2
										dc.b $82
										dc.b 0
										dc.b 7
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 F 8 3
										dc.b $80
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 80 0 3 2
										dc.b $80
										dc.b 0
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 F 8 3
										dc.b $81
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 81 0 7 2
										dc.b $81
										dc.b 0
										dc.b 7
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 F 8 3
										dc.b $82
										dc.b $F
										dc.b 8
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 82 0 0 2
										dc.b $82
										dc.b 0
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w $18                ; 0018 FLASH ENTITY WHITE 83 78
										dc.w $83
										dc.w $78
										dc.w $2E                ; 002E HIDE ENTITY 83
										dc.w $83
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_SAD_THEME_3
										dc.w $F
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 2 1
										dc.b $1C
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1C 2
										dc.b $1C
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 3 2
										dc.b $1F
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1C 1F 2
										dc.w $1C
										dc.w $1F
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4ECD6:         dc.w $F
										dc.w $A
										dc.w 1
										dc.b $D
										dc.b 8
										dc.b 0
										dc.b 7
										dc.l eas_Init           
										dc.b $11
										dc.b 8
										dc.b 2
										dc.b $1C
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $AD
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $AD
										dc.l eas_Init           
										dc.b $3F
										dc.b $3F
										dc.b 3
										dc.b $AD
										dc.l eas_Init           
										dc.b $F
										dc.b 8
										dc.b 3
										dc.b $A0
										dc.l eas_Init           
										dc.w $FFFF
bbcs_41:            dc.w 4                  ; 0004 SET TEXT INDEX C0B
										dc.w $C0B
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 38 C 15
										dc.w $38
										dc.w $C
										dc.w $15
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4ED76
										dc.l word_4ED76
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 10 18 0
										dc.b 7
										dc.b $10
										dc.b $18
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F F 18 0
										dc.b $1F
										dc.b $F
										dc.b $18
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C E 18 0
										dc.b $1C
										dc.b $E
										dc.b $18
										dc.b 0
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4ED48
										dc.w $4C
										dc.l word_4ED48         
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A D 18 0
										dc.b $1A
										dc.b $D
										dc.b $18
										dc.b 0
word_4ED48:         dc.w 5                  ; 0005 PLAY SOUND MUSIC_BATTLE_THEME_3
										dc.w $21
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST C 4
										dc.w $C
										dc.w 4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 2
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4ED76:         dc.w $11
										dc.w $18
										dc.w 0
										dc.b $10
										dc.b $18
										dc.b 0
										dc.b 7
										dc.l eas_Init           
										dc.b $10
										dc.b 6
										dc.b 3
										dc.b $63
										dc.l eas_Init           
										dc.w $FFFF
bbcs_42:            dc.w 4                  ; 0004 SET TEXT INDEX C10
										dc.w $C10
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 3B 8 1D
										dc.w $3B
										dc.w 8
										dc.w $1D
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4EEDC
										dc.l word_4EEDC
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 C 24 1
										dc.b 7
										dc.b $C
										dc.b $24
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F E 24 1
										dc.b $1F
										dc.b $E
										dc.b $24
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C D 24 1
										dc.b $1C
										dc.b $D
										dc.b $24
										dc.b 1
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4EDE8
										dc.w $4C
										dc.l word_4EDE8         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4EDE8:         dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_WITCH
										dc.w $A
										dc.w $4A                ; 004A FADE IN FROM BLACK HALF
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 45E44
										dc.b 0
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 45E44
										dc.b 7
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 45E44
										dc.b $1F
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 45E44
										dc.b $1C
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 3
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 2
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 2
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 0 0 2 1
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 1
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 1
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $32                ; 0032 SET CAMERA DEST 8 D
										dc.w 8
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4EEDC:         dc.w $D
										dc.w $23
										dc.w 1
										dc.b $C
										dc.b $24
										dc.b 1
										dc.b 7
										dc.l eas_Init           
										dc.b $D
										dc.b $24
										dc.b 1
										dc.b $1C
										dc.l eas_Init           
										dc.b $D
										dc.b $12
										dc.b 3
										dc.b $A4
										dc.l eas_Init           
										dc.b $D
										dc.b $F
										dc.b 3
										dc.b $CC
										dc.l eas_Init           
										dc.w $FFFF
word_4EF04:         dc.w 4                  ; 0004 SET TEXT INDEX C22
										dc.w $C22
										dc.w $37                ; 0037 LOAD MAP AND FADE IN 3B 8 D
										dc.w $3B
										dc.w 8
										dc.w $D
										dc.w $42                ; 0042 RELATED TO LOADING MAP ENTITIES 4F328
										dc.l word_4F328
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 460CE
										dc.b 0
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 F F 2
										dc.b 7
										dc.b $F
										dc.b $F
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F B F 0
										dc.b $1F
										dc.b $B
										dc.b $F
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 1C FF 460CE
										dc.b $1C
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1C C 13 0
										dc.b $1C
										dc.b $C
										dc.b $13
										dc.b 0
										dc.w $D                 ; 000D JUMP IF CLEAR FLAG 4C 4EF5E
										dc.w $4C
										dc.l word_4EF5E         
										dc.w $15                ; 0015 SET ACTSCRIPT 1A FF 460CE
										dc.b $1A
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1A 3F 3E 3
										dc.b $1A
										dc.b $3F
										dc.b $3E
										dc.b 3
word_4EF5E:         dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 46172
										dc.b $80
										dc.b $FF
										dc.l eas_46172          
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $53                ; 0053  1F 0
										dc.w $1F
										dc.w 0
										dc.w $53                ; 0053  1C 0
										dc.w $1C
										dc.w 0
										dc.w $53                ; 0053  80 FFFF
										dc.w $80
										dc.w $FFFF
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080
										dc.w $C080
										dc.w $23                ; 0023 SET ENTITY FACING 80 1
										dc.b $80
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $2D                ; 002D MOVE ENTITY 1F 0 0 1
										dc.b $1F
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 1 1
										dc.b $1C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 460CE
										dc.b $81
										dc.b $FF
										dc.l eas_Init           
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $1A                ; 001A SET ENTITY SPRITE 81 D8
										dc.w $81
										dc.w $D8
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $1A                ; 001A SET ENTITY SPRITE 81 CC
										dc.w $81
										dc.w $CC
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $1B                ; 001B START ENTITY ANIM 81
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$18 Y=$18
										dc.b $18
										dc.b $18
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081
										dc.w $C081
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D 12 1
										dc.b 7
										dc.b $D
										dc.b $12
										dc.b 1
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 E 10 2
										dc.b 7
										dc.b $E
										dc.b $10
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 D F 3
										dc.b 7
										dc.b $D
										dc.b $F
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 E 11 2
										dc.b 7
										dc.b $E
										dc.b $11
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1C 0 461B6
										dc.b $1C
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.w $2D                ; 002D MOVE ENTITY 0 0 2 2
										dc.b 0
										dc.b 0
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 0 0 461E4
										dc.b 0
										dc.b 0
										dc.l eas_461E4          
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 2
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 2
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 0 1
										dc.b $1F
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 0 0 1 2
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 2
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 1C 0 1 1
										dc.b $1C
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 0 1 2
										dc.b 7
										dc.b 0
										dc.b 1
										dc.b 2
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 81 0 1 1
										dc.b $81
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $16                ; 0016 WAIT UNTIL IDLE ENTITY 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 0 0
										dc.b 0
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w $26                ; 0026 MAKE ENTITY NOD 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 1C 1
										dc.b $1C
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 8 3
										dc.w 8
										dc.w 3
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $34                ; 0034 SET BLOCKS C27 704 A03
										dc.w $C27
										dc.w $704
										dc.w $A03
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $34                ; 0034 SET BLOCKS C2C 704 A03
										dc.w $C2C
										dc.w $704
										dc.w $A03
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $34                ; 0034 SET BLOCKS C31 704 A03
										dc.w $C31
										dc.w $704
										dc.w $A03
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 0
										dc.w 0
										dc.w 5                  ; 0005 PLAY SOUND SFX_DEMON_BREATH
										dc.w $75
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $34                ; 0034 SET BLOCKS C36 704 A03
										dc.w $C36
										dc.w $704
										dc.w $A03
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 D 6 3
										dc.b $82
										dc.b $D
										dc.b 6
										dc.b 3
										dc.w $3D                ; 003D TINT MAP
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 80
										dc.b $80
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
										dc.b $30
										dc.b $30
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.b $80                ; WAIT 6E
										dc.b $6E
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ZEON_ATTACK
										dc.w 7
										dc.w $1A                ; 001A SET ENTITY SPRITE 80 B2
										dc.w $80
										dc.w $B2
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 D
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b $D
										dc.w $8080
										dc.w $22                ; 0022 ANIMATE ENTITY FADE INOUT 80
										dc.w $80
										dc.w 6
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C082
										dc.w $C082
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C082
										dc.w $C082
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $1C                ; 001C STOP ENTITY ANIM 81
										dc.w $81
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $14                ;   0014 SET ANIM COUNTER $0
										dc.w 0
										dc.w $1B                ;   001B SET FLIPPING $1
										dc.w 1
										dc.w $A                 ;   000A UPDATE SPRITE
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_INTRO_LIGHTNING
										dc.w $76
										dc.w $41                ; 0041 FLASH SCREEN WHITE 1E
										dc.w $1E
										dc.w $3D                ; 003D TINT MAP
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $32                ; 0032 SET CAMERA DEST 8 C
										dc.w 8
										dc.w $C
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 7 2
										dc.b 7
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1C 2
										dc.b $1C
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 45E44
										dc.b $1F
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 0 FF 45E44
										dc.b 0
										dc.b $FF
										dc.l eas_Jump           
										dc.w $2D                ; 002D MOVE ENTITY 1C FF 3 1
										dc.b $1C
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 1C 0
										dc.b $1C
										dc.b 0
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1C 2
										dc.b $1C
										dc.b 2
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $23                ; 0023 SET ENTITY FACING 1C 3
										dc.b $1C
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1C
										dc.w $1C
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 1F 1
										dc.b $1F
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 1F
										dc.w $1F
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $13                ; 0013 SET STORY FLAG 2B
										dc.w $2B
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4F328:         dc.w $D
										dc.w $11
										dc.w 1
										dc.b $F
										dc.b $F
										dc.b 2
										dc.b 7
										dc.l eas_Init           
										dc.b $C
										dc.b $13
										dc.b 0
										dc.b $1C
										dc.l eas_Init           
										dc.b $D
										dc.b $13
										dc.b 3
										dc.b $A4
										dc.l eas_Init           
										dc.b $D
										dc.b $F
										dc.b 3
										dc.b $CC
										dc.l eas_Init           
										dc.b $3E
										dc.b $3E
										dc.b 3
										dc.b $FB
										dc.l eas_Init           
										dc.w $FFFF
word_4F358:         dc.w $21                ; 0021 REVIVE FORCE MEMBER 80
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4F35E:         dc.w $32                ; 0032 SET CAMERA DEST 8 2
										dc.w 8
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND 
										dc.w $FD
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $34                ; 0034 SET BLOCKS C36 704 A03
										dc.w $C36
										dc.w $704
										dc.w $A03
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $34                ; 0034 SET BLOCKS C31 704 A03
										dc.w $C31
										dc.w $704
										dc.w $A03
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $34                ; 0034 SET BLOCKS C2C 704 A03
										dc.w $C2C
										dc.w $704
										dc.w $A03
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $34                ; 0034 SET BLOCKS C27 704 A03
										dc.w $C27
										dc.w $704
										dc.w $A03
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w 5                  ; 0005 PLAY SOUND SFX_BLAST_SPELL
										dc.w $72
										dc.w $41                ; 0041 FLASH SCREEN WHITE 14
										dc.w $14
										dc.w $33                ; 0033 SET QUAKE AMOUNT 5
										dc.w 5
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 3B0C0B01
										dc.l $3B0C0B01
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 43 0
										dc.w $43
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 46 0
										dc.w $46
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 47 0
										dc.w $47
										dc.w 0
										dc.w $10                ; 0010 SET FLAG 4C 0
										dc.w $4C
										dc.w 0
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
word_4F47A:         dc.w 4                  ; 0004 SET TEXT INDEX 1D2
										dc.w $1D2
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ITEM
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_4F48A:
										
										movem.l d1-d5/a0,-(sp)
										move.w  d0,d4
										move.w  d1,d5
										jsr     j_UpdateForce
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d3
										subq.w  #1,d3
loc_4F4A2:
										
										clr.w   d0
										move.b  (a0)+,d0
										clr.w   d1
										jsr     j_GetItemAndNumberOfItems
										cmp.w   #4,d2
										bcs.w   loc_4F510
										dbf     d3,loc_4F4A2
										moveq   #1,d0
										tst.w   d5
										beq.w   loc_4F53C
										move.w  d4,(RAM_Dialogue_NameIdx1).l
										trap    #5
										dc.w $D6
										trap    #5
										dc.w $FFFF
										movem.w d4,-(sp)
										bsr.w   sub_4F570
										movem.w (sp)+,d1
										move.w  d0,(RAM_Dialogue_NameIdx1).l
										move.w  d2,(RAM_Dialogue_NameIdx2).l
										jsr     j_AddItem
										move.w  d1,(RAM_Dialogue_NameIdx3).l
										trap    #0
										dc.w MUSIC_ITEM
										trap    #5
										dc.w $D7
										jsr     j_fadeOut_WaitForP2Input
										jsr     (WaitForPlayerInput).w
										trap    #5
										dc.w $FFFF
										moveq   #2,d0
										bra.w   loc_4F53C
loc_4F510:
										
										move.w  d4,d1
										jsr     j_AddItem
										move.w  d0,(RAM_Dialogue_NameIdx1).l
										move.w  d1,(RAM_Dialogue_NameIdx2).l
										trap    #0
										dc.w MUSIC_ITEM
										trap    #5
										dc.w $D5
										jsr     j_fadeOut_WaitForP2Input
										jsr     (WaitForPlayerInput).w
										trap    #5
										dc.w $FFFF
										clr.w   d0
loc_4F53C:
										
										movem.l (sp)+,d1-d5/a0
										rts

	; End of function sub_4F48A


; =============== S U B R O U T I N E =======================================

sub_4F542:
										
										movem.w d1-d2,-(sp)
										move.w  d0,d1
										jsr     sub_81D0
										cmp.w   #$FFFF,d0
										beq.w   loc_4F56A
										jsr     j_RemoveItemBySlot
										move.w  #$FFFF,d0
										cmp.w   #3,d2
										beq.w   loc_4F56A
										clr.w   d0
loc_4F56A:
										
										movem.w (sp)+,d1-d2
										rts

	; End of function sub_4F542


; =============== S U B R O U T I N E =======================================

sub_4F570:
										
										movem.l d7-a1,-(sp)
										link    a6,#-$C
										jsr     j_UpdateForce
										lea     ((RAM_CharIdxList-$1000000)).w,a0
										lea     (byte_FFB0AE).l,a1
										move.w  ((RAM_CharIdxListSize-$1000000)).w,(word_FFB12E).l
										move.w  ((RAM_CharIdxListSize-$1000000)).w,d7
										subq.w  #1,d7
loc_4F596:
										
										move.b  (a0)+,(a1)+
										dbf     d7,loc_4F596
loc_4F59C:
										
										move.b  #1,(byte_FFB13C).l
										jsr     sub_10044
										cmp.w   #$FFFF,d0
										bne.w   loc_4F5B6
										bra.w   loc_4F6CA
loc_4F5B6:
										
										move.w  d0,-2(a6)
										move.w  d1,-6(a6)
										move.w  d2,-4(a6)
										move.w  -4(a6),d1
										jsr     j_GetItemDefAddress
										move.l  8(a0),-$A(a6)
										move.b  -$A(a6),d1
										and.b   #$10,d1
										cmp.b   #0,d1
										beq.s   loc_4F5F0
										move.w  -4(a6),(RAM_Dialogue_NameIdx1).l
										trap    #5
										dc.w $25
										bra.w   loc_4F6CA
loc_4F5F0:
										
										move.w  -4(a6),(RAM_Dialogue_NameIdx1).l
										trap    #5
										dc.w $2C
										jsr     j_YesNoChoiceBox
										trap    #5
										dc.w $FFFF
										cmp.w   #0,d0
										beq.w   loc_4F610
										bra.s   loc_4F59C
loc_4F610:
										
										move.w  -4(a6),d1
										jsr     j_GetItemType
										cmp.w   #1,d2
										bne.s   loc_4F65C
										move.w  -2(a6),d0
										jsr     j_GetEquippedWeapon
										cmp.w   #$FFFF,d1
										beq.w   loc_4F69C
										cmp.w   -6(a6),d2
										bne.w   loc_4F69C
										move.w  -4(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_4F69C
										move.w  -4(a6),(RAM_Dialogue_NameIdx1).l
										trap    #5
										dc.w $1E
										trap    #5
										dc.w $FFFF
										bra.w   loc_4F6CA
loc_4F65C:
										
										cmp.w   #0,d2
										beq.w   loc_4F69C
										move.w  -2(a6),d0
										jsr     j_GetEquippedRing
										cmp.w   #$FFFF,d1
										beq.w   loc_4F69C
										cmp.w   -6(a6),d2
										bne.w   loc_4F69C
										move.w  -4(a6),d1
										jsr     j_isItemCursed
										bcc.w   loc_4F69C
										move.w  -4(a6),(RAM_Dialogue_NameIdx1).l
										trap    #5
										dc.w $1E
										bra.w   loc_4F6CA
loc_4F69C:
										
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										jsr     j_RemoveItemBySlot
										move.w  -4(a6),(RAM_Dialogue_NameIdx1).l
										move.b  -$A(a6),d1
										and.b   #8,d1
										cmp.b   #0,d1
										beq.s   loc_4F6CE
										move.w  -4(a6),d1
										jsr     j_AddItemToDeals
loc_4F6CA:
										
										bra.w   loc_4F59C
loc_4F6CE:
										
										move.w  -2(a6),d0
										move.w  -6(a6),d1
										move.w  -4(a6),d2
										unlk    a6
										movem.l (sp)+,d7-a1
										rts

	; End of function sub_4F570

