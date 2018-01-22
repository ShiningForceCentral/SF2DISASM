
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

cs_5E0EE:       newEntity $1A,4,12,1,$FF
		csc_end
cs_5E0F8:       textCursor $805
		setCameraEntity $18
		setEntityDest $0,19,7
		moveEntity $7,$FF,$3,$1
		endMove $8080
		setPos $1F,19,8,0
		setPos $7,18,8,0
		setFacing $0,0
		setFacing $18,2
		nextSingleText $0,$18   ; "Well, you're not from{N}Pacalon, are you?{W1}"
		nextSingleText $0,$1F   ; "We're from Granseal,{N}Mr. {NAME;24}.{W1}"
		nextSingleText $0,$18   ; "Granseal...I've never heard{N}of it....{W1}"
		nextSingleText $0,$1F   ; "It's near Ribble in South{N}Parmecia.{W1}"
		nextSingleText $0,$18   ; "Near my home?{N}Are you sure?{W1}"
		nextSingleText $0,$1F   ; "We settled there just over{N}a year ago.{W1}"
		nextSingleText $0,$18   ; "The blocked tunnel is open{N}now?{W1}"
		nextSingleText $0,$1F   ; "Yes.  Now you can go back{N}home.{W1}"
		nextSingleText $0,$18   ; "I've been waiting for this{N}day!{W1}"
		moveEntity $1F,$FF,$3,$1
		endMove $8080
		moveEntity $0,$FF,$3,$1
		endMove $8080
		moveEntity $18,$FF,$2,$4
		endMove $8080
		moveEntity $0,$FF,$1,$1
		endMove $8080
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		setFacing $0,2
		setFacing $7,1
		setFacing $18,0
		csWait 10
		nextSingleText $0,$18   ; "By the way, why did you{N}come to North Parmecia?{W1}"
		nextSingleText $0,$7    ; "To defeat devils!{W1}"
		setFacing $18,3
		nextSingleText $0,$18   ; "Really?{W1}"
		moveEntity $0,$FF,$0,$1
		endMove $8080
		setFacing $0,2
		moveEntity $1F,$FF,$1,$1
		endMove $8080
		setFacing $1F,2
		setFacing $18,0
		nextText $0,$1F         ; "We don't want another{N}tragedy like Moun.{W2}"
		nextSingleText $0,$1F   ; "We're going to Grans Island{N}to kill the King of the{N}Devils.{W1}"
		setFacing $18,2
		setFacing $18,0
		nextSingleText $0,$18   ; "Hmmm....{W2}"
		setFacing $18,1
		nextSingleText $0,$18   ; "I can't go back now!{W1}"
		entityShiver $1F
		nextSingleText $0,$1F   ; "But...your family...{W1}"
		setFacing $18,0
		nextSingleText $0,$18   ; "I know.  I'll miss them.{W2}"
		setFacing $18,2
		nextSingleText $0,$18   ; "But, I believe they'll{N}understand.{W2}"
		setFacing $18,0
		nextSingleText $0,$18   ; "Let me go with you!{W1}"
		join $18
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $18,$1F,$2
		setPos $1A,4,12,1
		csc_end
cs_5E20A:       textCursor $819
		nextSingleText $0,$1A   ; "I happened to overhear your{N}conversation with {NAME;24}.{W2}"
		nextSingleText $0,$1A   ; "I want to go to Grans, too.{W1}"
		nextSingleText $0,$80   ; "They decide to take the{N}ancient soldier {NAME;26}{N}with them.{W1}"
		setFacing $1A,3
		entityShiver $1A
		nextSingleText $0,$1A   ; "There is no time to waste!{W1}"
		addNewFollower $1A
		csc_end
