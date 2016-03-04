
; SCRIPT SECTION battles\entries\battle12\edcs :
; Enemy defeated cutscene for battle 12
edcs_battle12:      dc.w 4                  ; 0004 SET TEXT INDEX 9BA
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
