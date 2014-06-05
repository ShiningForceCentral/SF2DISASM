
; SCRIPT SECTION battlecutscenes\battle05\abcs :
; Cutscene after battle 5
abcs_battle05:      dc.w 4                  ; 0004 SET TEXT INDEX 91C
										dc.w $91C
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 460CE
										dc.b 5
										dc.b $FF
										dc.l eas_Init           
										dc.w $2D                ; 002D MOVE ENTITY 5 FF 3 1
										dc.b 5
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.b 2
										dc.b 2
										dc.w $8080
										dc.w $23                ; 0023 SET ENTITY FACING 5 3
										dc.b 5
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX FFFF
										dc.w $FFFF
										dc.b $80                ; WAIT A
										dc.b $A
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 45E44
										dc.b 5
										dc.b $FF
										dc.l eas_Jump           
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w $10                ; 0010 SET FLAG 180 FFFF
										dc.w $180
										dc.w $FFFF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 46172
										dc.b 5
										dc.b $FF
										dc.l eas_46172          
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w 8                  ; 0008 JOIN FORCE 5
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5
										dc.w 5
										dc.w $10                ; 0010 SET FLAG 49 0
										dc.w $49
										dc.w 0
										dc.w $13                ; 0013 SET STORY FLAG 6
										dc.w 6
										dc.w $2C                ; 002C FOLLOW ENTITY 5 0 2
										dc.w 5
										dc.w 0
										dc.w 2
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 10101203
										dc.l $10101203
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
