
; SCRIPT SECTION maps\entries\map51\mapsetups\s3 :
; 
ms_map51_ZoneEvents:dc.b 9
										dc.b 6
										dc.w sub_5C2F2-ms_map51_ZoneEvents
										dc.b 9
										dc.b 7
										dc.w sub_5C2F2-ms_map51_ZoneEvents
										dc.b 9
										dc.b 8
										dc.w sub_5C2F2-ms_map51_ZoneEvents
										dc.b 9
										dc.b 9
										dc.w sub_5C2F2-ms_map51_ZoneEvents
										dc.b 9
										dc.b $18
										dc.w sub_5C304-ms_map51_ZoneEvents
										dc.b $A
										dc.b $18
										dc.w sub_5C304-ms_map51_ZoneEvents
										dc.w $FD00
										dc.w return_5C310-ms_map51_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5C2F2:
										
										trap    #CHECK_FLAG
										dc.w $1D6
										bne.s   return_5C302
										lea     cs_5C312(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $1D6               ; set after you approach the pond to rescue Elric at the Harpy Pond
return_5C302:
										
										rts

	; End of function sub_5C2F2


; =============== S U B R O U T I N E =======================================

sub_5C304:
										
										trap    #CHECK_FLAG
										dc.w $1D6
										bne.s   return_5C310
										lea     cs_5C3AA(pc), a0
										trap    #6
return_5C310:
										
										rts

	; End of function sub_5C304

cs_5C312:           dc.w 4                  ; 0004 INIT TEXT CURSOR 9FB : "Did you come to help me?{N}Oh, thank you!{W2}"
										dc.w $9FB
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 460CE
										dc.b 7
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 1F FF 460CE
										dc.b $1F
										dc.b $FF
										dc.l eas_Init           
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 80 7 10 1
										dc.b $80
										dc.b 7
										dc.b $10
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 81 6 11 1
										dc.b $81
										dc.b 6
										dc.b $11
										dc.b 1
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 82 8 11 1
										dc.b $82
										dc.b 8
										dc.b $11
										dc.b 1
										dc.w 2                  ; 0002 DISPLAY TEXT BOX D : "Did you come to help me?{N}Oh, thank you!{W2}"
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX D : "I might have been eaten by{N}monsters if you hadn't come.{W1}"
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "My dinner is escaping!{W1}"
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 1F 0 45E44
										dc.b $1F
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 7 FF 45E44
										dc.b 7
										dc.b $FF
										dc.l eas_Jump           
										dc.b $80                ; WAIT 5
										dc.b 5
										dc.w $15                ; 0015 SET ACTSCRIPT 7 0 461B6
										dc.b 7
										dc.b 0
										dc.l eas_461B6          
										dc.b $80                ; WAIT 78
										dc.b $78
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Who said that?{W1}"
										dc.w 7
										dc.w $32                ; 0032 SET CAMERA DEST 3 C
										dc.w 3
										dc.w $C
										dc.w 2                  ; 0002 DISPLAY TEXT BOX C080 : "That pond catches my food.{N}Hey elf boy, good trap, huh?{W2}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Those who get stuck in the{N}pond are mine.  It's my{N}rule.{W1}"
										dc.w $C080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX D : "Then, all the missing people{N}were eaten by you?{W1}"
										dc.w $D
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "They were in my pond.{W1}"
										dc.w $C080
										dc.w $2D                ; 002D MOVE ENTITY 80 FF 1 2
										dc.b $80
										dc.b $FF
										dc.b 1
										dc.b 2
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "And this elf is my dinner{N}for tonight.  Got it?{W1}"
										dc.w $C080
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX C080 : "Did you guys bring the{N}ketchup? No? Oh, well.{W1}"
										dc.w $C080
										dc.w $15                ; 0015 SET ACTSCRIPT 81 0 45E44
										dc.b $81
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 82 FF 45E44
										dc.b $82
										dc.b $FF
										dc.l eas_Jump           
										dc.w $13                ; 0013 SET STORY FLAG 14 : Battle 20 unlocked
										dc.w $14
										dc.w 7                  ; 0007 EXECUTE MAP SYSTEM EVENT 33000000
										dc.l $33000000
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5C3AA:           dc.w 4                  ; 0004 INIT TEXT CURSOR A05 : "{LEADER}, we have to{N}save him!{W1}"
										dc.w $A05
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "{LEADER}, we have to{N}save him!{W1}"
										dc.w 7
										dc.w $26                ; 0026 MAKE ENTITY NOD 0
										dc.w 0
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
