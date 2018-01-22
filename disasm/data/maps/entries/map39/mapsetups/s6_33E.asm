
; ASM FILE data\maps\entries\map39\mapsetups\s6_33E.asm :
; 0x5E0E0..0x5E22C : 

; =============== S U B R O U T I N E =======================================

ms_map39_flag33E_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $344
		bne.s   return_5E0EC
		lea     cs_5E0EE(pc), a0
		trap    #6
return_5E0EC:
		rts

	; End of function ms_map39_flag33E_InitFunction

cs_5E0EE:       newEntity $1A,$4,$C,$1,$FF; 002B  1A 4 C 1 FF
		csc_end
cs_5E0F8:       textCursor $805         ; 0004 INIT TEXT CURSOR 805 : "Well, you're not from{N}Pacalon, are you?{W1}"
		setCameraEntity $18     ; 0024 SET ENTITY FOLLOWED BY CAMERA 18
		setEntityDest $0,$13,$7 ; 0029 SET ENTITY DEST 0 13 7
		moveEntity $7,$FF,$3,$1 ; 002D MOVE ENTITY 7 FF 3 1
		endMove $8080
		entityPosDir $1F,$13,$8,$0; 0019 SET ENTITY POS AND FACING 1F 13 8 0
		entityPosDir $7,$12,$8,$0; 0019 SET ENTITY POS AND FACING 7 12 8 0
		setFacing $0,$0         ; 0023 SET ENTITY FACING 0 0
		setFacing $18,$2        ; 0023 SET ENTITY FACING 18 2
		nextSingleText $0,$18   ; "Well, you're not from{N}Pacalon, are you?{W1}"
		nextSingleText $0,$1F   ; "We're from Granseal,{N}Mr. {NAME;24}.{W1}"
		nextSingleText $0,$18   ; "Granseal...I've never heard{N}of it....{W1}"
		nextSingleText $0,$1F   ; "It's near Ribble in South{N}Parmecia.{W1}"
		nextSingleText $0,$18   ; "Near my home?{N}Are you sure?{W1}"
		nextSingleText $0,$1F   ; "We settled there just over{N}a year ago.{W1}"
		nextSingleText $0,$18   ; "The blocked tunnel is open{N}now?{W1}"
		nextSingleText $0,$1F   ; "Yes.  Now you can go back{N}home.{W1}"
		nextSingleText $0,$18   ; "I've been waiting for this{N}day!{W1}"
		moveEntity $1F,$FF,$3,$1; 002D MOVE ENTITY 1F FF 3 1
		endMove $8080
		moveEntity $0,$FF,$3,$1 ; 002D MOVE ENTITY 0 FF 3 1
		endMove $8080
		moveEntity $18,$FF,$2,$4; 002D MOVE ENTITY 18 FF 2 4
		endMove $8080
		moveEntity $0,$FF,$1,$1 ; 002D MOVE ENTITY 0 FF 1 1
		endMove $8080
		moveEntity $1F,$FF,$1,$1; 002D MOVE ENTITY 1F FF 1 1
		endMove $8080
		setFacing $0,$2         ; 0023 SET ENTITY FACING 0 2
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		setFacing $18,$0        ; 0023 SET ENTITY FACING 18 0
		csWait $A
		nextSingleText $0,$18   ; "By the way, why did you{N}come to North Parmecia?{W1}"
		nextSingleText $0,$7    ; "To defeat devils!{W1}"
		setFacing $18,$3        ; 0023 SET ENTITY FACING 18 3
		nextSingleText $0,$18   ; "Really?{W1}"
		moveEntity $0,$FF,$0,$1 ; 002D MOVE ENTITY 0 FF 0 1
		endMove $8080
		setFacing $0,$2         ; 0023 SET ENTITY FACING 0 2
		moveEntity $1F,$FF,$1,$1; 002D MOVE ENTITY 1F FF 1 1
		endMove $8080
		setFacing $1F,$2        ; 0023 SET ENTITY FACING 1F 2
		setFacing $18,$0        ; 0023 SET ENTITY FACING 18 0
		nextText $0,$1F         ; "We don't want another{N}tragedy like Moun.{W2}"
		nextSingleText $0,$1F   ; "We're going to Grans Island{N}to kill the King of the{N}Devils.{W1}"
		setFacing $18,$2        ; 0023 SET ENTITY FACING 18 2
		setFacing $18,$0        ; 0023 SET ENTITY FACING 18 0
		nextSingleText $0,$18   ; "Hmmm....{W2}"
		setFacing $18,$1        ; 0023 SET ENTITY FACING 18 1
		nextSingleText $0,$18   ; "I can't go back now!{W1}"
		entityShiver $1F        ; 002A MAKE ENTITY SHIVER 1F
		nextSingleText $0,$1F   ; "But...your family...{W1}"
		setFacing $18,$0        ; 0023 SET ENTITY FACING 18 0
		nextSingleText $0,$18   ; "I know.  I'll miss them.{W2}"
		setFacing $18,$2        ; 0023 SET ENTITY FACING 18 2
		nextSingleText $0,$18   ; "But, I believe they'll{N}understand.{W2}"
		setFacing $18,$0        ; 0023 SET ENTITY FACING 18 0
		nextSingleText $0,$18   ; "Let me go with you!{W1}"
		join $18                ; 0008 JOIN FORCE 18
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  ; 002C FOLLOW ENTITY 1F 7 2
		followEntity $18,$1F,$2 ; 002C FOLLOW ENTITY 18 1F 2
		entityPosDir $1A,$4,$C,$1; 0019 SET ENTITY POS AND FACING 1A 4 C 1
		csc_end
cs_5E20A:       textCursor $819         ; 0004 INIT TEXT CURSOR 819 : "I happened to overhear your{N}conversation with {NAME;24}.{W2}"
		nextSingleText $0,$1A   ; "I happened to overhear your{N}conversation with {NAME;24}.{W2}"
		nextSingleText $0,$1A   ; "I want to go to Grans, too.{W1}"
		nextSingleText $0,$80   ; "They decide to take the{N}ancient soldier {NAME;26}{N}with them.{W1}"
		setFacing $1A,$3        ; 0023 SET ENTITY FACING 1A 3
		entityShiver $1A        ; 002A MAKE ENTITY SHIVER 1A
		nextSingleText $0,$1A   ; "There is no time to waste!{W1}"
		addNewFollower $1A      ; 0056 SOMETHING WITH AN ENTITY 1A
		csc_end
