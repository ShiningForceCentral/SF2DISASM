
; SCRIPT SECTION maps\entries\map11\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map11_InitFunction:
										
										rts

	; End of function ms_map11_InitFunction

cs_57AAA:           dc.w 4                  ; 0004 SET TEXT INDEX C4F
										dc.w $C4F
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $29                ; 0029 SET ENTITY DEST 0 27 B
										dc.w 0
										dc.w $27
										dc.w $B
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 2 1
										dc.b 0
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 7
										dc.w 7
										dc.w $29                ; 0029 SET ENTITY DEST 7 27 B
										dc.w 7
										dc.w $27
										dc.w $B
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
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
										dc.w $32                ; 0032 SET CAMERA DEST 22 3
										dc.w $22
										dc.w 3
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $26                ; 0026 MAKE ENTITY NOD 7
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 22 5
										dc.w $22
										dc.w 5
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $23                ; 0023 SET ENTITY FACING 7 3
										dc.b 7
										dc.b 3
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 2
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 0
										dc.b 7
										dc.b 0
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 2 1
										dc.b 7
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 2 1
										dc.b 0
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 22 2
										dc.w $22
										dc.w 2
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 2
										dc.w 2
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 3
										dc.w 3
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $32                ; 0032 SET CAMERA DEST 22 6
										dc.w $22
										dc.w 6
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w $23                ; 0023 SET ENTITY FACING 7 1
										dc.b 7
										dc.b 1
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 22 2
										dc.w $22
										dc.w 2
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $32                ; 0032 SET CAMERA DEST 22 5
										dc.w $22
										dc.w 5
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 0 1
										dc.b 0
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 0 1
										dc.b 7
										dc.b $FF
										dc.b 0
										dc.b 1
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 0 1
										dc.b 0
										dc.b 1
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 3
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 22 3
										dc.w $22
										dc.w 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 46172
										dc.b 7
										dc.b $FF
										dc.l eas_46172          
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 5                  ; 0005 PLAY SOUND SFX_BIG_DOOR_RUMBLE
										dc.w $5D
										dc.w $33                ; 0033 SET QUAKE AMOUNT 4
										dc.w 4
										dc.b $80                ; WAIT 5A
										dc.b $5A
										dc.w $33                ; 0033 SET QUAKE AMOUNT 0
										dc.w 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
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
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 2 1
										dc.b 0
										dc.b $FF
										dc.b 2
										dc.b 1
										dc.w $8080
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 2
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80
										dc.w $80
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 1
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
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
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 3 1
										dc.b 7
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w 8                  ; 0008 JOIN FORCE 7
										dc.w 7
										dc.w $54                ; 0054  7 0
										dc.w 7
										dc.w 0
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
