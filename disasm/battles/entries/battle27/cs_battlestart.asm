
; SCRIPT SECTION battles\entries\battle27\cs_battlestart :
; Start cutscene for battle 27
bscs_battle27:      dc.w 4                  ; 0004 INIT TEXT CURSOR A62 : "Where did you come from?{N}What are you doing here?{W1}"
										dc.w $A62
										dc.w $45                ; 0045 RELATED TO CAMERA ADJUST TO PLAYER 30
										dc.w $30
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 85
										dc.w $85
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 85 : "Where did you come from?{N}What are you doing here?{W1}"
										dc.w $85
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 84
										dc.w $84
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 84 : "Don't you know about the{N}restrictions?{W1}"
										dc.w $84
										dc.w $24                ; 0024 SET ENTITY FOLLOWED BY CAMERA 80
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Even if you didn't know,{N}that's just to bad.{W1}"
										dc.w $80
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
