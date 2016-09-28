
; SCRIPT SECTION battles\entries\battle12\cs_afterbattle :
; Cutscene after battle 12
abcs_battle12:      dc.w 4                  ; 0004 SET TEXT INDEX 9BD : "{LEADER}, did you hear{N}that?  He said, he had{N}been waiting for you.{W2}"
										dc.w $9BD
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 34170802
										dc.l $34170802
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
