
; SCRIPT SECTION battles\entries\battle05\cs_afterbattle :
; Cutscene after battle 5
abcs_battle05:      dc.w 4                  ; 0004 SET TEXT INDEX 91C : "This is the Jewel of Light{N}that I stole from the shrine.{W2}"
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
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5 : "This is the Jewel of Light{N}that I stole from the shrine.{W2}"
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5 : "The other jewel is missing.{N}I'll give you this one now.{W1}"
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX FFFF : "{LEADER} received the{N}Jewel of Light...{W2}{N}The jewel fused to{N}{LEADER}'s neck.{W1}"
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
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5 : "{LEADER}, did you use{N}magic?{W2}"
										dc.w 5
										dc.w $10                ; 0010 SET FLAG 180 FFFF
										dc.w $180
										dc.w $FFFF
										dc.b $80                ; WAIT 1E
										dc.b $1E
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5 : "Ummm...I can't remove it!{N}Is it cursed?{W2}"
										dc.w 5
										dc.w $15                ; 0015 SET ACTSCRIPT 5 FF 46172
										dc.b 5
										dc.b $FF
										dc.l eas_46172          
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5 : "We'll go to the church{N}later to see if it's cursed.{N}At least we have it now.{W1}"
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5 : "The knight said that King{N}Galam took the other jewel{N}with him.{W2}"
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5 : "{LEADER}, I'll go to{N}Granseal with you.{W1}"
										dc.w 5
										dc.w 8                  ; 0008 JOIN FORCE 5
										dc.w 5
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 5 : "I have an obligation to find{N}the other jewel!{W2}"
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 5 : "Let's go to Granseal!{W1}"
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
