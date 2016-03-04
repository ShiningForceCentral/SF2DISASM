
; SCRIPT SECTION battles\entries\battle12\abcs :
; Cutscene after battle 12
abcs_battle12:      dc.w 4                  ; 0004 SET TEXT INDEX 9BD
										dc.w $9BD
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 34170802
										dc.l $34170802
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
