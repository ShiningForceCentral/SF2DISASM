
; SCRIPT SECTION battles\entries\battle27\cs_battlestart :
; Start cutscene for battle 27
bscs_battle27:      dc.w 4                  ; 0004 SET TEXT INDEX A62
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
