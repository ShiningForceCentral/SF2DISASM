
; ASM FILE data\maps\entries\map43\mapsetups\s6.asm :
; 0x540A6..0x54348 : 

; =============== S U B R O U T I N E =======================================

ms_map43_InitFunction:
		
		lea     cs_540C0(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $264               ; set after event at Hawel's house
		trap    #SET_FLAG
		dc.w $28A               ; set after event at Hawel's house
		trap    #CLEAR_FLAG
		dc.w $48                ; Kazin is a follower
		move.b  #$2B,((EGRESS_MAP_INDEX-$1000000)).w 
return_540BE:
		rts

	; End of function ms_map43_InitFunction

cs_540C0:       textCursor $32B
		setActscriptWait $0,eas_Init
		setActscriptWait $4,eas_Init
		setPos $80,7,4,DOWN
		setPos $0,6,11,UP
		setPos $4,5,11,UP
		customActscriptWait $80
		 ac_setAnimCounter $0   ;   
		 ac_setFlip $1          ;   
		 ac_updateSprite        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		stopEntity $80
		reloadMap 0,4
		fadeInB
		csWait 50
		setFacing $0,LEFT
		setFacing $4,RIGHT
		csWait 30
		nextSingleText $0,$4    ; "This is Hawel's house.{W1}"
		entityActionsWait $4
		 moveLeft 1
		 moveUp 1
		 eaWait 20
		endActions
		nextSingleText $0,$4    ; "Sir Hawel!{N}Granseal friends are here!{W1}"
		csWait 70
		setFacing $4,RIGHT
		csWait 40
		nextSingleText $0,$4    ; "Strange...{N}There's no answer.{W2}{N}Has he gone somewhere?{N}Well, why don't you wait{N}for him inside?{W1}"
		nod $0
		entityActionsWait $0
		 moveLeft 2
		endActions
		roofEvent 4,9
		stepEvent 4,9
		stepEvent 11,9
		entityActions $4
		 moveUp 3
		endActions
		entityActionsWait $0
		 moveUp 3
		endActions
		csWait 30
		customActscriptWait $4
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $4
		 moveRight 1
		endActions
		setFacing $4,UP
		playSound $FE
		nextSingleText $0,$4    ; "Wh...who are you?{N}Oh, Sir Hawel!{W1}"
		playSound MUSIC_ENEMY_ATTACK
		setCamDest 2,0
		setFacing $81,DOWN
		setFacing $82,DOWN
		nextSingleText $0,$81   ; "Oops!  You came back early!{W1}"
		entityActionsWait $4
		 moveUp 1
		endActions
		nextSingleText $0,$4    ; "You!  What did you{N}do to Sir Hawel?!{W1}"
		csWait 30
		setFacing $81,RIGHT
		setFacing $82,LEFT
		csWait 30
		setFacing $81,DOWN
		setFacing $82,DOWN
		csWait 30
		setActscript $81,eas_Jump
		setActscriptWait $82,eas_Jump
		setActscript $81,eas_Jump
		setActscriptWait $82,eas_Jump
		customActscriptWait $81
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		customActscriptWait $82
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		setActscriptWait $4,eas_Init
		entityActions $82
		 moveDown 2
		 moveRight 4
		 moveDown 5
		endActions
		entityActions $81
		 moveRight 1
		 moveDown 2
		 moveRight 4
		 moveDown 5
		endActions
		entityActionsWait $4
		 eaWait 20
		 faceRight 20
		 jumpUp 0
		 moveDown 1
		 moveRight 3
		endActions
		playSound SFX_BLO
		customActscriptWait $4
		 ac_setAnimCounter $0   ;   
		 ac_setFlip $1          ;   
		 ac_updateSprite        ;   
		 ac_jump eas_Idle       ;   
		ac_end
		hide $81
		hide $82
		csWait 60
		setActscriptWait $4,eas_Init
		entityActionsWait $4
		 moveRight 1
		endActions
		playSound $FD
		nextSingleText $0,$80   ; "Ohhh...{NAME;4}....{W1}"
		entityActionsWait $4
		 moveLeft 1
		endActions
		setFacing $4,UP
		nextSingleText $0,$4    ; "Sir...you're alive!{W1}"
		playSound MUSIC_SAD_THEME_1
		nextSingleText $0,$80   ; "...It's no use running after{N}them....{W1}"
		entityActionsWait $4
		 moveLeft 1
		 moveUp 2
		endActions
		nextSingleText $0,$4    ; "Are you OK, sir?{N}Why did they do such a{N}cruel thing?{W1}"
		nextSingleText $0,$80   ; "They were Galam soldiers.{N}They demanded my notes on{N}Ground Seal.{W2}{N}They suddenly snatched at{N}them, and...(cough)...{W1}"
		shiver $80
		stopEntity $80
		entityActionsWait $0
		 moveRight 2
		 moveUp 3
		endActions
		setFacing $0,RIGHT
		setFacing $4,LEFT
		nextSingleText $0,$0    ; "(Whisper)....{W1}"
		nextSingleText $0,$80   ; "Who...is...it?{N}What...did he...say?{W1}"
		setFacing $4,UP
		nextSingleText $0,$4    ; "He's {LEADER} from{N}Granseal.  He said that{N}Ground Seal has opened.{W1}{N}And a serious disaster{N}took place!{W1}{N}He came to see you for{N}more information.{W1}"
		shiver $80
		stopEntity $80
		nextSingleText $0,$80   ; "What?!  The door opened?{N}Who broke the ancient{N}seal?! {W1}"
		nextSingleText $0,$4    ; "Calm down, sir.{N}Why are you so excited?{W1}"
		nextSingleText $0,$80   ; "(Cough, cough)...{NAME;4},{N}listen to me carefully.{N}Grans Island is lost!{W2}{N}That tower is the sacred{N}seal that confines a terrible{N}devil.{W2}{N}Two jewels...(cough)...{N}were...installed to...{W1}"
		shiver $80
		stopEntity $80
		nextSingleText $0,$4    ; "Stop talking, or you'll die.{W1}"
		nextText $0,$80         ; "I'm almost dead anyway...{N}(cough)...(cough)....{W2}"
		nextSingleText $0,$80   ; "{NAME;4}, look for the jewels...{N}to seal...ancient...{W1}"
		playSound $FD
		shiver $80
		stopEntity $80
		setPosFlash $80,63,63,DOWN
		entityActionsWait $4
		 moveUp 1
		endActions
		nextSingleText $0,$4    ; "Sir!  Sir Hawel!{N}Don't leave me alone!{N}Oh, no...!{W1}"
		stopEntity $4
		csWait 60
		entityActionsWait $0
		 moveRight 1
		endActions
		setFacing $0,UP
		csWait 30
		startEntity $4
		setFacing $4,DOWN
		nextText $0,$4          ; "Sir Hawel passed away.{W2}{N}I'm going to seal the tower.{N}It's Sir Hawel's last wish.{W2}"
		nextSingleText $0,$4    ; "{LEADER}, please!{N}His wish is related to{N}your mission, right?{W2}{N}Can you go with me and{N}seal the tower?{W1}"
		join $8004
		nextSingleText $0,$4    ; "Now, let's go to the{N}Ancient Shrine!{W1}"
		followEntity $4,$0,$2
		clearF $48              ; Kazin is a follower
		setStoryFlag $4         ; Battle 4 unlocked
		csc_end
