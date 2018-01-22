
; ASM FILE data\maps\entries\map62\mapsetups\s6.asm :
; 0x5C874..0x5C950 : 

; =============== S U B R O U T I N E =======================================

ms_map62_InitFunction:
		
		rts

	; End of function ms_map62_InitFunction

cs_5C876:       textCursor $E1D         ; 0004 INIT TEXT CURSOR E1D : "Who is it?  Petro?{W1}"
		setActscript $80,$FF,eas_Jump; 0015 SET ACTSCRIPT 80 FF 45E44
		nextSingleText $0,$80   ; "Who is it?  Petro?{W1}"
		setFacing $80,$3        ; 0023 SET ENTITY FACING 80 3
		nextSingleText $0,$80   ; "Well, who are you?{W1}"
		nextSingleText $0,$81   ; "Petro?  Is he back?{W1}"
		setCamDest $1,$5        ; 0032 SET CAMERA DEST 1 5
		nextSingleText $0,$81   ; "Petro!  The Sky Orb is OUR{N}treasure!  Give it back!{W2}"
		moveEntity $81,$FF,$3,$3; 002D MOVE ENTITY 81 FF 3 3
		endMove $8080
		nextSingleText $0,$81   ; "Say something!{N}Petro!{W1}"
		moveEntity $81,$FF,$3,$2; 002D MOVE ENTITY 81 FF 3 2
		endMove $8080
		customActscript $81,$FF ; 0014 SET MANUAL ACTSCRIPT 81
		dc.w $10                ;   0010 SET SPEED X=$10 Y=$10
		dc.b $10
		dc.b $10
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$3,$1; 002D MOVE ENTITY 81 FF 3 1
		endMove $8080
		setCamDest $1,$A        ; 0032 SET CAMERA DEST 1 A
		nextSingleText $0,$81   ; "Oh, you're not Petro.{N}Who...are you?{W1}"
		csc_end
cs_5C8D4:       textCursor $E23         ; 0004 INIT TEXT CURSOR E23 : "Ancient stone?  Yes, my{N}family had it for a long{N}time.{W2}"
		nextText $0,$81         ; "Ancient stone?  Yes, my{N}family had it for a long{N}time.{W2}"
		setFacing $81,$0        ; 0023 SET ENTITY FACING 81 0
		nextSingleText $0,$81   ; "But, it was stolen.{W1}"
		nextSingleText $0,$81   ; "His brother, my grandson,{N}took the stone, the Sky Orb,{N}when he left.{W2}"
		setFacing $81,$3        ; 0023 SET ENTITY FACING 81 3
		nextText $0,$81         ; "I think he went to Grans{N}Island to operate an ancient{N}vehicle.{W2}"
		nextSingleText $0,$81   ; "I've lost my purpose to live.{W1}"
		moveEntity $81,$FF,$1,$6; 002D MOVE ENTITY 81 FF 1 6
		endMove $8080
		csc_end
cs_5C8FE:       textCursor $E2B         ; 0004 INIT TEXT CURSOR E2B : "You need my help?{W1}"
		nextSingleText $0,$81   ; "You need my help?{W1}"
		nextSingleText $0,$81   ; "Come in.  Talk to me.{W1}"
		moveEntity $0,$FF,$1,$1 ; 002D MOVE ENTITY 0 FF 1 1
		endMove $8080
		csc_end
cs_5C914:       textCursor $E2D         ; 0004 INIT TEXT CURSOR E2D : "I came here looking for{N}ancient treasure, and found{N}the Sky Orb.{W2}"
		nextText $0,$81         ; "I came here looking for{N}ancient treasure, and found{N}the Sky Orb.{W2}"
		nextText $0,$81         ; "Also, I discovered how to{N}use the ancient tunnels.{W2}"
		nextSingleText $0,$81   ; "But, most of them are{N}useless, except for the{N}one to Grans.{W1}"
		nextText $0,$7          ; "To Grans?{W1}"
		nextSingleText $0,$7    ; "Can we get to Grans Island{N}through it?{W1}"
		nextSingleText $0,$81   ; "Yes.  Do you want to go{N}there?{W2}"
		nextSingleText $0,$81   ; "Really?{W2}"
		nextSingleText $0,$81   ; "You'll go to Grans with me.{N}Let's go now!{W1}"
		nextSingleText $FF,$FF  ; "{LEADER} decides to go{N}with him.{W1}"
		nextSingleText $0,$81   ; "All I want is the Sky Orb.{N}Just help me get that, and{N}then you can leave.{W1}"
		followEntity $81,$1F,$2 ; 002C FOLLOW ENTITY 81 1F 2
		setF $4D                ; Old man is a follower
		csc_end
