
; ASM FILE data\battles\entries\battle05\cs_afterbattle.asm :
; 0x49B48..0x49BCA : Cutscene after battle 5
abcs_battle05:  textCursor $91C
		setActscript $5,$FF,eas_Init
		entityActions $5,$FF
		 moveDown 1
		 moveLeft 2
		endActions
		setFacing $5,DOWN
		nextText $0,$5          ; "This is the Jewel of Light{N}that I stole from the shrine.{W2}"
		nextSingleText $0,$5    ; "The other jewel is missing.{N}I'll give you this one now.{W1}"
		nextText $FF,$FF        ; "{LEADER} received the{N}Jewel of Light...{W2}{N}The jewel fused to{N}{LEADER}'s neck.{W1}"
		csWait 10
		setActscript $5,$FF,eas_Jump
		setActscript $5,$FF,eas_Jump
		nextText $0,$5          ; "{LEADER}, did you use{N}magic?{W2}"
		setF $180               ; set after Bowie obtains the jewel of light/evil... whichever it is
		csWait 30
		nextText $0,$5          ; "Ummm...I can't remove it!{N}Is it cursed?{W2}"
		setActscript $5,$FF,eas_46172
		nextText $0,$5          ; "We'll go to the church{N}later to see if it's cursed.{N}At least we have it now.{W1}"
		nextText $0,$5          ; "The knight said that King{N}Galam took the other jewel{N}with him.{W2}"
		nextSingleText $0,$5    ; "{LEADER}, I'll go to{N}Granseal with you.{W1}"
		join $5
		nextText $0,$5          ; "I have an obligation to find{N}the other jewel!{W2}"
		nextSingleText $0,$5    ; "Let's go to Granseal!{W1}"
		clearF $49              ; Slade is a follower
		setStoryFlag $6         ; Battle 6 unlocked
		followEntity $5,$0,$2
		mapSysEvent $10,$10,$12,$3
		csc_end
