
; SCRIPT SECTION battlecutscenes\battle00\abcs :
; Cutscene after battle 0
abcs_battle00:      dc.w 4                  ; 0004 SET TEXT INDEX 1D2
										dc.w $1D2
										dc.w 5                  ; 0005 PLAY SOUND MUSIC_ITEM
										dc.w $1B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF
										dc.w $FFFF
										dc.w 9                  ; 0009 HIDE TEXTBOX AND PORTRAIT
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
