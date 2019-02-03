
; ASM FILE data\maps\entries\map39\mapsetups\s6_initfunction_33E.asm :
; 0x5E0E0..0x5E22C : 

; =============== S U B R O U T I N E =======================================

ms_map39_flag33E_InitFunction:
		
		 
		chkFlg  $344            ; set after the scene where Zynk stops you as you leave the Moun underground
		bne.s   return_5E0EC
		script  cs_5E0EE
return_5E0EC:
		rts

	; End of function ms_map39_flag33E_InitFunction

cs_5E0EE:       newEntity $1A,4,12,UP,$FF
		csc_end
cs_5E0F8:       textCursor $805
		setCameraEntity $18
		setDest $0,19,7
		entityActionsWait $7
		 moveDown 1
		endActions
		setPos $1F,19,8,RIGHT
		setPos $7,18,8,RIGHT
		setFacing $0,RIGHT
		setFacing $18,LEFT
		nextSingleText $0,$18   ; "Well, you're not from{N}Pacalon, are you?{W1}"
		nextSingleText $0,$1F   ; "We're from Granseal,{N}Mr. {NAME;24}.{W1}"
		nextSingleText $0,$18   ; "Granseal...I've never heard{N}of it....{W1}"
		nextSingleText $0,$1F   ; "It's near Ribble in South{N}Parmecia.{W1}"
		nextSingleText $0,$18   ; "Near my home?{N}Are you sure?{W1}"
		nextSingleText $0,$1F   ; "We settled there just over{N}a year ago.{W1}"
		nextSingleText $0,$18   ; "The blocked tunnel is open{N}now?{W1}"
		nextSingleText $0,$1F   ; "Yes.  Now you can go back{N}home.{W1}"
		nextSingleText $0,$18   ; "I've been waiting for this{N}day!{W1}"
		entityActionsWait $1F
		 moveDown 1
		endActions
		entityActionsWait $0
		 moveDown 1
		endActions
		entityActionsWait $18
		 moveLeft 4
		endActions
		entityActionsWait $0
		 moveUp 1
		endActions
		entityActionsWait $1F
		 moveUp 1
		endActions
		setFacing $0,LEFT
		setFacing $7,UP
		setFacing $18,RIGHT
		csWait 10
		nextSingleText $0,$18   ; "By the way, why did you{N}come to North Parmecia?{W1}"
		nextSingleText $0,$7    ; "To defeat devils!{W1}"
		setFacing $18,DOWN
		nextSingleText $0,$18   ; "Really?{W1}"
		entityActionsWait $0
		 moveRight 1
		endActions
		setFacing $0,LEFT
		entityActionsWait $1F
		 moveUp 1
		endActions
		setFacing $1F,LEFT
		setFacing $18,RIGHT
		nextText $0,$1F         ; "We don't want another{N}tragedy like Moun.{W2}"
		nextSingleText $0,$1F   ; "We're going to Grans Island{N}to kill the King of the{N}Devils.{W1}"
		setFacing $18,LEFT
		setFacing $18,RIGHT
		nextSingleText $0,$18   ; "Hmmm....{W2}"
		setFacing $18,UP
		nextSingleText $0,$18   ; "I can't go back now!{W1}"
		shiver $1F
		nextSingleText $0,$1F   ; "But...your family...{W1}"
		setFacing $18,RIGHT
		nextSingleText $0,$18   ; "I know.  I'll miss them.{W2}"
		setFacing $18,LEFT
		nextSingleText $0,$18   ; "But, I believe they'll{N}understand.{W2}"
		setFacing $18,RIGHT
		nextSingleText $0,$18   ; "Let me go with you!{W1}"
		join $18
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		followEntity $18,$1F,$2
		setPos $1A,4,12,UP
		csc_end
cs_5E20A:       textCursor $819
		nextSingleText $0,$1A   ; "I happened to overhear your{N}conversation with {NAME;24}.{W2}"
		nextSingleText $0,$1A   ; "I want to go to Grans, too.{W1}"
		nextSingleText $0,$80   ; "They decide to take the{N}ancient soldier {NAME;26}{N}with them.{W1}"
		setFacing $1A,DOWN
		shiver $1A
		nextSingleText $0,$1A   ; "There is no time to waste!{W1}"
		addNewFollower $1A
		csc_end
