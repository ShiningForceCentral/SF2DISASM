
; SCRIPT SECTION maps\entries\map27\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map27_InitFunction:
										
										rts

	; End of function ms_map27_InitFunction

cs_59FB8:           dc.w 4                  ; 0004 SET TEXT INDEX 6C5 : "(Sniff, sniff)...{N}It smells like a ditch!{W1}"
										dc.w $6C5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $32                ; 0032 SET CAMERA DEST 16 F
										dc.w $16
										dc.w $F
										dc.w $29                ; 0029 SET ENTITY DEST 1F 1A 14
										dc.w $1F
										dc.w $1A
										dc.w $14
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 461B6
										dc.b $1F
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 1F : "(Sniff, sniff)...{N}It smells like a ditch!{W1}"
										dc.w $1F
										dc.w $29                ; 0029 SET ENTITY DEST 7 1B 14
										dc.w 7
										dc.w $1B
										dc.w $14
										dc.w $23                ; 0023 SET ENTITY FACING 1F 0
										dc.b $1F
										dc.b 0
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 7
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Is this the smell of the{N}devils that they were{N}talking about?{W1}"
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 24 11
										dc.w $24
										dc.w $11
										dc.w $29                ; 0029 SET ENTITY DEST 81 29 15
										dc.w $81
										dc.w $29
										dc.w $15
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "Hee, hee!{W1}"
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45FF0
										dc.b $80
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45FF0
										dc.b $81
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.w $15                ; 0015 SET ACTSCRIPT 82 0 45FF0
										dc.b $82
										dc.b 0
										dc.l eas_RotateRightHighSpeed
										dc.b $80                ; WAIT 28
										dc.b $28
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
										dc.w $23                ; 0023 SET ENTITY FACING 80 2
										dc.b $80
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 81 2
										dc.b $81
										dc.b 2
										dc.w $23                ; 0023 SET ENTITY FACING 82 2
										dc.b $82
										dc.b 2
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E44
										dc.b $82
										dc.b $FF
										dc.l eas_Jump           
										dc.w $1B                ; 001B START ENTITY ANIM 80
										dc.w $80
										dc.w $1B                ; 001B START ENTITY ANIM 81
										dc.w $81
										dc.w $1B                ; 001B START ENTITY ANIM 82
										dc.w $82
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "What huge rats!{W1}"
										dc.w 7
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C081 : "Welcome!{W2}"
										dc.w $C081
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C081 : "It's dinner time!{W1}"
										dc.w $C081
										dc.w $15                ; 0015 SET ACTSCRIPT 80 0 45E44
										dc.b $80
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E44
										dc.b $82
										dc.b $FF
										dc.l eas_Jump           
										dc.w $13                ; 0013 SET STORY FLAG 17 : Battle 23 unlocked
										dc.w $17
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 1B000000
										dc.l $1B000000
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
