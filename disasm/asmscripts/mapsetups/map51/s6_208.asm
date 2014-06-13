
; SCRIPT SECTION mapsetups\map51\s6_208 :
; 

; =============== S U B R O U T I N E =======================================

ms_map51_flag208_InitFunction:
										
										trap    #1
										dc.w $1D6
										bne.s   return_5C3D6
										lea     cs_5C3D8(pc), a0
										trap    #6
return_5C3D6:
										
										rts

	; End of function ms_map51_flag208_InitFunction

cs_5C3D8:           dc.w 4                  ; 0004 SET TEXT INDEX 9F6
										dc.w $9F6
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 0 B 16 1
										dc.b 0
										dc.b $B
										dc.b $16
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 1F A 16 1
										dc.b $1F
										dc.b $A
										dc.b $16
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 7 9 16 1
										dc.b 7
										dc.b 9
										dc.b $16
										dc.b 1
										dc.w $39                ; 0039 FADE IN FROM BLACK
										dc.w $2D                ; 002D MOVE ENTITY 1F FF 1 2
										dc.b $1F
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
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
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F
										dc.w $1F
										dc.w $2D                ; 002D MOVE ENTITY 7 FF 1 2
										dc.b 7
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 2 2
										dc.w 2
										dc.w 2
										dc.b $80                ; WAIT 32
										dc.b $32
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C00D
										dc.w $C00D
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7
										dc.w 7
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 0
										dc.w 0
										dc.w $2C                ; 002C FOLLOW ENTITY 7 0 2
										dc.w 7
										dc.w 0
										dc.w 2
										dc.w $2C                ; 002C FOLLOW ENTITY 1F 7 2
										dc.w $1F
										dc.w 7
										dc.w 2
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
										dc.b $FF
										dc.b $FF
