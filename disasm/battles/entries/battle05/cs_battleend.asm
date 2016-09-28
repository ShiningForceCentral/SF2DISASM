
; SCRIPT SECTION battles\entries\battle05\cs_battleend :
; Enemy defeated cutscene for battle 5
edcs_battle5:       dc.w 4                  ; 0004 SET TEXT INDEX 913 : "You, rat!  I threw you into{N}jail after I took your{N}jewels....{W1}"
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
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "You, rat!  I threw you into{N}jail after I took your{N}jewels....{W1}"
										dc.w $80
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5 : "Hee, hee!  You expect a thief{N}to stay in jail?{W2}"
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5 : "Give me the jewels.{W1}"
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
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;5} searched the tool{N}bag of the Galam Knight.{W1}"
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
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5 : "Yes!  I found one!{W1}"
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{NAME;5} has the Jewel{N}of Light.{W1}"
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
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5 : "Where is the other jewel?{W1}"
										dc.w 5
										dc.w $2A                ; 002A MAKE ENTITY SHIVER 80
										dc.w $80
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 80 : "K...King Galam...took it into{N}battle.{W2}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Take the jewel.  You won't{N}have it long.  We'll get it{N}back!{W1}"
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
