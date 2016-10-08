
; SCRIPT SECTION maps\entries\map62\mapsetups\s6 :
; 

; =============== S U B R O U T I N E =======================================

ms_map62_InitFunction:
										
										rts

	; End of function ms_map62_InitFunction

cs_5C876:           dc.w 4                  ; 0004 INIT TEXT CURSOR E1D : "Who is it?  Petro?{W1}"
										dc.w $E1D
										dc.w $15                ; 0015 SET ACTSCRIPT 80 FF 45E44
										dc.b $80
										dc.b $FF
										dc.l eas_Jump           
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Who is it?  Petro?{W1}"
										dc.w $80
										dc.w $23                ; 0023 SET ENTITY FACING 80 3
										dc.b $80
										dc.b 3
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 80 : "Well, who are you?{W1}"
										dc.w $80
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Petro?  Is he back?{W1}"
										dc.w $81
										dc.w $32                ; 0032 SET CAMERA DEST 1 5
										dc.w 1
										dc.w 5
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Petro!  The Sky Orb is OUR{N}treasure!  Give it back!{W2}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 3
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 3
										dc.w $8080
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Say something!{N}Petro!{W1}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 2
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 2
										dc.w $8080
										dc.w $14                ; 0014 SET MANUAL ACTSCRIPT 81
										dc.b $81
										dc.b $FF
										dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
										dc.b $10
										dc.b $10
										dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
										dc.l eas_Idle           
										dc.w $8080              ; 0014 END OF MANUAL ACTSCRIPT
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 3 1
										dc.b $81
										dc.b $FF
										dc.b 3
										dc.b 1
										dc.w $8080
										dc.w $32                ; 0032 SET CAMERA DEST 1 A
										dc.w 1
										dc.w $A
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Oh, you're not Petro.{N}Who...are you?{W1}"
										dc.w $81
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5C8D4:           dc.w 4                  ; 0004 INIT TEXT CURSOR E23 : "Ancient stone?  Yes, my{N}family had it for a long{N}time.{W2}"
										dc.w $E23
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "Ancient stone?  Yes, my{N}family had it for a long{N}time.{W2}"
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 81 0
										dc.b $81
										dc.b 0
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "But, it was stolen.{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "His brother, my grandson,{N}took the stone, the Sky Orb,{N}when he left.{W2}"
										dc.w $81
										dc.w $23                ; 0023 SET ENTITY FACING 81 3
										dc.b $81
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "I think he went to Grans{N}Island to operate an ancient{N}vehicle.{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "I've lost my purpose to live.{W1}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 81 FF 1 6
										dc.b $81
										dc.b $FF
										dc.b 1
										dc.b 6
										dc.w $8080
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5C8FE:           dc.w 4                  ; 0004 INIT TEXT CURSOR E2B : "You need my help?{W1}"
										dc.w $E2B
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "You need my help?{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Come in.  Talk to me.{W1}"
										dc.w $81
										dc.w $2D                ; 002D MOVE ENTITY 0 FF 1 1
										dc.b 0
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.w $8080
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_5C914:           dc.w 4                  ; 0004 INIT TEXT CURSOR E2D : "I came here looking for{N}ancient treasure, and found{N}the Sky Orb.{W2}"
										dc.w $E2D
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "I came here looking for{N}ancient treasure, and found{N}the Sky Orb.{W2}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 81 : "Also, I discovered how to{N}use the ancient tunnels.{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "But, most of them are{N}useless, except for the{N}one to Grans.{W1}"
										dc.w $81
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 7 : "To Grans?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 7 : "Can we get to Grans Island{N}through it?{W1}"
										dc.w 7
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Yes.  Do you want to go{N}there?{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "Really?{W2}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "You'll go to Grans with me.{N}Let's go now!{W1}"
										dc.w $81
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX FFFF : "{LEADER} decides to go{N}with him.{W1}"
										dc.w $FFFF
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 81 : "All I want is the Sky Orb.{N}Just help me get that, and{N}then you can leave.{W1}"
										dc.w $81
										dc.w $2C                ; 002C FOLLOW ENTITY 81 1F 2
										dc.w $81
										dc.w $1F
										dc.w 2
										dc.w $10                ; 0010 SET FLAG 4D FFFF : Old man is a follower
										dc.w $4D
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
