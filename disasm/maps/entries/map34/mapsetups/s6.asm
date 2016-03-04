
; SCRIPT SECTION maps\entries\map34\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map34_InitFunction:
										
										rts

	; End of function ms_map34_InitFunction

cs_5B6C0:           dc.w 4                  ; 0004 SET TEXT INDEX C87
										dc.w $C87
										dc.w $32                ; 0032 SET CAMERA DEST 2 4
										dc.w 2
										dc.w 4
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $18                ; 0018 FLASH ENTITY WHITE 80 64
										dc.w $80
										dc.w $64
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 6 3
										dc.b $82
										dc.b 7
										dc.b 6
										dc.b 3
										dc.b $80                ; WAIT 7
										dc.b 7
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
										dc.b $82
										dc.b $3C
										dc.b $3C
										dc.b 3
										dc.b $80                ; WAIT 50
										dc.b $50
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 6 3
										dc.b $82
										dc.b 7
										dc.b 6
										dc.b 3
										dc.b $80                ; WAIT 7
										dc.b 7
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
										dc.b $82
										dc.b $3C
										dc.b $3C
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 6 3
										dc.b $82
										dc.b 7
										dc.b 6
										dc.b 3
										dc.b $80                ; WAIT 7
										dc.b 7
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
										dc.b $82
										dc.b $3C
										dc.b $3C
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 1
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $32                ; 0032 SET CAMERA DEST 2 2
										dc.w 2
										dc.w 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 6 3
										dc.b $82
										dc.b 7
										dc.b 6
										dc.b 3
										dc.b $80                ; WAIT 7
										dc.b 7
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
										dc.b $82
										dc.b $3C
										dc.b $3C
										dc.b 3
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 6 3
										dc.b $82
										dc.b 7
										dc.b 6
										dc.b 3
										dc.b $80                ; WAIT 7
										dc.b 7
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
										dc.b $82
										dc.b $3C
										dc.b $3C
										dc.b 3
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 6 3
										dc.b $82
										dc.b 7
										dc.b 6
										dc.b 3
										dc.b $80                ; WAIT 7
										dc.b 7
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
										dc.b $82
										dc.b $3C
										dc.b $3C
										dc.b 3
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 6 3
										dc.b $82
										dc.b 7
										dc.b 6
										dc.b 3
										dc.b $80                ; WAIT 7
										dc.b 7
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
										dc.b $82
										dc.b $3C
										dc.b $3C
										dc.b 3
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 6 3
										dc.b $82
										dc.b 7
										dc.b 6
										dc.b 3
										dc.b $80                ; WAIT 7
										dc.b 7
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
										dc.b $82
										dc.b $3C
										dc.b $3C
										dc.b 3
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 6 3
										dc.b $82
										dc.b 7
										dc.b 6
										dc.b 3
										dc.b $80                ; WAIT 7
										dc.b 7
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 3C 3C 3
										dc.b $82
										dc.b $3C
										dc.b $3C
										dc.b 3
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 7 6 3
										dc.b $82
										dc.b 7
										dc.b 6
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FA8
										dc.b $82
										dc.b 0
										dc.l eas_Transparent    
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
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 7 C 1
										dc.b 0
										dc.b 7
										dc.b $C
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 6 C 1
										dc.b 7
										dc.b 6
										dc.b $C
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F 8 C 1
										dc.b $1F
										dc.b 8
										dc.b $C
										dc.b 1
										dc.w $32                ; 0032 SET CAMERA DEST 2 4
										dc.w 2
										dc.w 4
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 1
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $26                ; 0026 MAKE ENTITY NOD 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 82
										dc.w $82
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.w $3F                ; 003F FADE MAP OUT TO WHITE
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
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
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w $40                ; 0040 FADE MAP IN FROM WHITE
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $32                ; 0032 SET CAMERA DEST 2 5
										dc.w 2
										dc.w 5
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 0 2
										dc.b 0
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 1F 2
										dc.b $1F
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
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
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
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
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 461AA
										dc.b $80
										dc.b $FF
										dc.l eas_461AA          
										dc.w $1C                ; 001C STOP ENTITY ANIM 80
										dc.w $80
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $18                ; 0018 FLASH ENTITY WHITE 0 28
										dc.w 0
										dc.w $28
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 80 0 1 1
										dc.b $80
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 461AA
										dc.b $80
										dc.b $FF
										dc.l eas_461AA          
										dc.w $27                ; 0027 MAKE ENTITY SHAKE HEAD 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $32                ; 0032 SET CAMERA DEST 2 4
										dc.w 2
										dc.w 4
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 460CE
										dc.b $80
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 80 0 0 1
										dc.b $80
										dc.b 0
										dc.b 0
										dc.b 1
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 2
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 1
										dc.b $81
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w $18                ; 0018 FLASH ENTITY WHITE 0 28
										dc.w 0
										dc.w $28
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 82
										dc.w $82
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 55EF4
										dc.l sub_55EF4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 55F82
										dc.l sub_55F82
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 55EF4
										dc.l sub_55EF4
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 55F82
										dc.l sub_55F82
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 55EF4
										dc.l sub_55EF4
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 55F82
										dc.l sub_55F82
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 55EF4
										dc.l sub_55EF4
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.b $80                ; WAIT 64
										dc.b $64
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFDA
										dc.l sub_5BFDA
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFD0
										dc.l sub_5BFD0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFDA
										dc.l sub_5BFDA
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFD0
										dc.l sub_5BFD0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 82
										dc.w $82
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFDA
										dc.l sub_5BFDA
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFD0
										dc.l sub_5BFD0
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFDA
										dc.l sub_5BFDA
										dc.w $41                ; 0041 FLASH SCREEN WHITE 28
										dc.w $28
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFE4
										dc.l sub_5BFE4
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
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
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
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 FF 45E44
										dc.b $81
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 83
										dc.w $83
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 83
										dc.w $83
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFDA
										dc.l sub_5BFDA
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFE4
										dc.l sub_5BFE4
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFDA
										dc.l sub_5BFDA
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFE4
										dc.l sub_5BFE4
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFDA
										dc.l sub_5BFDA
										dc.b $80                ; WAIT 8
										dc.b 8
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFE4
										dc.l sub_5BFE4
										dc.b $80                ; WAIT 14
										dc.b $14
										dc.w $41                ; 0041 FLASH SCREEN WHITE 4
										dc.w 4
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 5BFDA
										dc.l sub_5BFDA
										dc.w $33                ; 0033 SET QUAKE AMOUNT 5
										dc.w 5
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 85
										dc.b $85
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 86
										dc.b $86
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 87
										dc.b $87
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 88
										dc.b $88
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 89
										dc.b $89
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8A
										dc.b $8A
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8B
										dc.b $8B
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8C
										dc.b $8C
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8D
										dc.b $8D
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8E
										dc.b $8E
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 8F
										dc.b $8F
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 90
										dc.b $90
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 91
										dc.b $91
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 92
										dc.b $92
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 93
										dc.b $93
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 94
										dc.b $94
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$40 Y=$40
										dc.b $40
										dc.b $40
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8D 8 6 0
										dc.b $8D
										dc.b 8
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8E 7 5 0
										dc.b $8E
										dc.b 7
										dc.b 5
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8F 6 6 0
										dc.b $8F
										dc.b 6
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 90 7 7 0
										dc.b $90
										dc.b 7
										dc.b 7
										dc.b 0
										dc.w $15                ; 0015 SET ACTSCRIPT 8D 0 464BE
										dc.b $8D
										dc.b 0
										dc.l eas_464BE          
										dc.w $15                ; 0015 SET ACTSCRIPT 8E 0 464C6
										dc.b $8E
										dc.b 0
										dc.l eas_464C6          
										dc.w $15                ; 0015 SET ACTSCRIPT 8F 0 464CE
										dc.b $8F
										dc.b 0
										dc.l eas_464CE          
										dc.w $15                ; 0015 SET ACTSCRIPT 90 0 464D6
										dc.b $90
										dc.b 0
										dc.l eas_464D6          
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 91 8 6 2
										dc.b $91
										dc.b 8
										dc.b 6
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 92 7 7 2
										dc.b $92
										dc.b 7
										dc.b 7
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 93 6 6 2
										dc.b $93
										dc.b 6
										dc.b 6
										dc.b 2
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 94 7 5 2
										dc.b $94
										dc.b 7
										dc.b 5
										dc.b 2
										dc.w $2D                ; 002D MOVE ENTITY 91 0 0 1
										dc.b $91
										dc.b 0
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 91 FF 461AA
										dc.b $91
										dc.b $FF
										dc.l eas_461AA          
										dc.w $2D                ; 002D MOVE ENTITY 92 0 3 1
										dc.b $92
										dc.b 0
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 92 FF 461AA
										dc.b $92
										dc.b $FF
										dc.l eas_461AA          
										dc.w $2D                ; 002D MOVE ENTITY 93 0 2 1
										dc.b $93
										dc.b 0
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 93 FF 461AA
										dc.b $93
										dc.b $FF
										dc.l eas_461AA          
										dc.w $2D                ; 002D MOVE ENTITY 94 0 1 1
										dc.b $94
										dc.b 0
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.b $80                ; WAIT 2
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 94 FF 461AA
										dc.b $94
										dc.b $FF
										dc.l eas_461AA          
										dc.w $15                ; 0015 SET ACTSCRIPT 91 0 464E2
										dc.b $91
										dc.b 0
										dc.l eas_464E2          
										dc.w $15                ; 0015 SET ACTSCRIPT 92 0 464EA
										dc.b $92
										dc.b 0
										dc.l eas_464EA          
										dc.w $15                ; 0015 SET ACTSCRIPT 93 0 464F2
										dc.b $93
										dc.b 0
										dc.l eas_464F2          
										dc.w $15                ; 0015 SET ACTSCRIPT 94 0 464FA
										dc.b $94
										dc.b 0
										dc.l eas_464FA          
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 7 6 0
										dc.b $85
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 7 6 0
										dc.b $86
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 7 6 0
										dc.b $87
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 7 6 0
										dc.b $88
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 7 6 0
										dc.b $89
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A 7 6 0
										dc.b $8A
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B 7 6 0
										dc.b $8B
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 7 6 0
										dc.b $8C
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 85 0 0 4
										dc.b $85
										dc.b 0
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 1 4
										dc.b $86
										dc.b 0
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 0 2 4
										dc.b $87
										dc.b 0
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 0 3 4
										dc.b $88
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 0 4 4
										dc.b $89
										dc.b 0
										dc.b 4
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 5 4
										dc.b $8A
										dc.b 0
										dc.b 5
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B 0 6 4
										dc.b $8B
										dc.b 0
										dc.b 6
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 7 4
										dc.b $8C
										dc.b $FF
										dc.b 7
										dc.b 4
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 7 6 0
										dc.b $85
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 7 6 0
										dc.b $86
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 7 6 0
										dc.b $87
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 7 6 0
										dc.b $88
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 7 6 0
										dc.b $89
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A 7 6 0
										dc.b $8A
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B 7 6 0
										dc.b $8B
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 7 6 0
										dc.b $8C
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 85 0 0 4
										dc.b $85
										dc.b 0
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 1 4
										dc.b $86
										dc.b 0
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 0 2 4
										dc.b $87
										dc.b 0
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 0 3 4
										dc.b $88
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 0 4 4
										dc.b $89
										dc.b 0
										dc.b 4
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 5 4
										dc.b $8A
										dc.b 0
										dc.b 5
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B 0 6 4
										dc.b $8B
										dc.b 0
										dc.b 6
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 7 4
										dc.b $8C
										dc.b $FF
										dc.b 7
										dc.b 4
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 7 6 0
										dc.b $85
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 7 6 0
										dc.b $86
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 7 6 0
										dc.b $87
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 7 6 0
										dc.b $88
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 7 6 0
										dc.b $89
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A 7 6 0
										dc.b $8A
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B 7 6 0
										dc.b $8B
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 7 6 0
										dc.b $8C
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 85 0 0 4
										dc.b $85
										dc.b 0
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 1 4
										dc.b $86
										dc.b 0
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 0 2 4
										dc.b $87
										dc.b 0
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 0 3 4
										dc.b $88
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 0 4 4
										dc.b $89
										dc.b 0
										dc.b 4
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 5 4
										dc.b $8A
										dc.b 0
										dc.b 5
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B 0 6 4
										dc.b $8B
										dc.b 0
										dc.b 6
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 7 4
										dc.b $8C
										dc.b $FF
										dc.b 7
										dc.b 4
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 82
										dc.w $82
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 7 6 0
										dc.b $85
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 7 6 0
										dc.b $86
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 7 6 0
										dc.b $87
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 7 6 0
										dc.b $88
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 7 6 0
										dc.b $89
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A 7 6 0
										dc.b $8A
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B 7 6 0
										dc.b $8B
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 7 6 0
										dc.b $8C
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 85 0 0 4
										dc.b $85
										dc.b 0
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 1 4
										dc.b $86
										dc.b 0
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 0 2 4
										dc.b $87
										dc.b 0
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 0 3 4
										dc.b $88
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 0 4 4
										dc.b $89
										dc.b 0
										dc.b 4
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 5 4
										dc.b $8A
										dc.b 0
										dc.b 5
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B 0 6 4
										dc.b $8B
										dc.b 0
										dc.b 6
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 7 4
										dc.b $8C
										dc.b $FF
										dc.b 7
										dc.b 4
										dc.w $8080
										dc.w 5                  ; 0005 PLAY SOUND SFX_BATTLEFIELD_DEATH
										dc.w $74
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 85 7 6 0
										dc.b $85
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 86 7 6 0
										dc.b $86
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 87 7 6 0
										dc.b $87
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 88 7 6 0
										dc.b $88
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 89 7 6 0
										dc.b $89
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8A 7 6 0
										dc.b $8A
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8B 7 6 0
										dc.b $8B
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 7 6 0
										dc.b $8C
										dc.b 7
										dc.b 6
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 85 0 0 4
										dc.b $85
										dc.b 0
										dc.b 0
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 86 0 1 4
										dc.b $86
										dc.b 0
										dc.b 1
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 87 0 2 4
										dc.b $87
										dc.b 0
										dc.b 2
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 88 0 3 4
										dc.b $88
										dc.b 0
										dc.b 3
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 89 0 4 4
										dc.b $89
										dc.b 0
										dc.b 4
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8A 0 5 4
										dc.b $8A
										dc.b 0
										dc.b 5
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8B 0 6 4
										dc.b $8B
										dc.b 0
										dc.b 6
										dc.b 4
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 7 4
										dc.b $8C
										dc.b $FF
										dc.b 7
										dc.b 4
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 85
										dc.w $85
										dc.w $2E                ; 002E HIDE ENTITY 86
										dc.w $86
										dc.w $2E                ; 002E HIDE ENTITY 87
										dc.w $87
										dc.w $2E                ; 002E HIDE ENTITY 88
										dc.w $88
										dc.w $2E                ; 002E HIDE ENTITY 89
										dc.w $89
										dc.w $2E                ; 002E HIDE ENTITY 8A
										dc.w $8A
										dc.w $2E                ; 002E HIDE ENTITY 8B
										dc.w $8B
										dc.w $2E                ; 002E HIDE ENTITY 8C
										dc.w $8C
										dc.b $80                ; WAIT 28
										dc.b $28
										dc.w $2E                ; 002E HIDE ENTITY 8D
										dc.w $8D
										dc.w $2E                ; 002E HIDE ENTITY 8E
										dc.w $8E
										dc.w $2E                ; 002E HIDE ENTITY 8F
										dc.w $8F
										dc.w $2E                ; 002E HIDE ENTITY 90
										dc.w $90
										dc.w $2E                ; 002E HIDE ENTITY 91
										dc.w $91
										dc.w $2E                ; 002E HIDE ENTITY 92
										dc.w $92
										dc.w $2E                ; 002E HIDE ENTITY 93
										dc.w $93
										dc.w $2E                ; 002E HIDE ENTITY 94
										dc.w $94
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4005
										dc.w $4005
										dc.w $A                 ; 000A EXECUTE SUBROUTINE 55F82
										dc.l sub_55F82
										dc.b $80                ; WAIT 3C
										dc.b $3C
										dc.w $23                ; 0023 SET ENTITY FACING 0 3
										dc.b 0
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8080
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8080
										dc.w $8080
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 3 1
										dc.b $80
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 2 1
										dc.b $81
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $23                ; 0023 SET ENTITY FACING 1F 3
										dc.b $1F
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81
										dc.w $81
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
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 5
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 5
										dc.w $8080
										dc.w $2E                ; 002E HIDE ENTITY 81
										dc.w $81
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT

; =============== S U B R O U T I N E =======================================

sub_5BFD0:
										
										moveq   #0,d0
										jsr     sub_20058
										rts

	; End of function sub_5BFD0


; =============== S U B R O U T I N E =======================================

sub_5BFDA:
										
										moveq   #1,d0
										jsr     sub_20058
										rts

	; End of function sub_5BFDA


; =============== S U B R O U T I N E =======================================

sub_5BFE4:
										
										moveq   #2,d0
										jsr     sub_20058
										rts

	; End of function sub_5BFE4

