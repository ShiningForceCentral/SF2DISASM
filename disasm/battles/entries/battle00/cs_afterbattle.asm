
; SCRIPT SECTION battles\entries\battle00\cs_afterbattle :
; Cutscene after battle 0
abcs_battle00:      dc.w 4                  ; 0004 INIT TEXT CURSOR 1D2 : "Game over!{W1}"
										dc.w $1D2
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ITEM
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "Game over!{W1}"
										dc.w $FFFF
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
