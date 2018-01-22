
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
		setActscript $0,$FF,eas_Init
		setActscript $4,$FF,eas_Init
		entityPosDir $80,$7,$4,$3
		entityPosDir $0,$6,$B,$1
		entityPosDir $4,$5,$B,$1
		customActscript $80,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		stopEntity $80
		reloadMap $0,$4
		fadeInB
		csWait $32
		setFacing $0,$2
		setFacing $4,$0
		csWait $1E
		nextSingleText $0,$4    ; "This is Hawel's house.{W1}"
		moveEntity $4,$FF,$2,$1
		moreMove $1,$1
		moreMove $C,$14
		endMove $8080
		nextSingleText $0,$4    ; "Sir Hawel!{N}Granseal friends are here!{W1}"
		csWait $46
		setFacing $4,$0
		csWait $28
		nextSingleText $0,$4    ; "Strange...{N}There's no answer.{W2}{N}Has he gone somewhere?{N}Well, why don't you wait{N}for him inside?{W1}"
		entityNod $0
		moveEntity $0,$FF,$2,$2
		endMove $8080
		roofEvent $4,$9
		stepEvent $4,$9
		stepEvent $B,$9
		moveEntity $4,$0,$1,$3
		endMove $8080
		moveEntity $0,$FF,$1,$3
		endMove $8080
		csWait $1E
		customActscript $4,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $4,$FF,$0,$1
		endMove $8080
		setFacing $4,$1
		playSound $FE
		nextSingleText $0,$4    ; "Wh...who are you?{N}Oh, Sir Hawel!{W1}"
		playSound MUSIC_ENEMY_ATTACK
		setCamDest $2,$0
		setFacing $81,$3
		setFacing $82,$3
		nextSingleText $0,$81   ; "Oops!  You came back early!{W1}"
		moveEntity $4,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$4    ; "You!  What did you{N}do to Sir Hawel?!{W1}"
		csWait $1E
		setFacing $81,$0
		setFacing $82,$2
		csWait $1E
		setFacing $81,$3
		setFacing $82,$3
		csWait $1E
		setActscript $81,$0,eas_Jump
		setActscript $82,$FF,eas_Jump
		setActscript $81,$0,eas_Jump
		setActscript $82,$FF,eas_Jump
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $4,$FF,eas_Init
		moveEntity $82,$0,$3,$2
		moreMove $0,$4
		moreMove $3,$5
		endMove $8080
		moveEntity $81,$0,$0,$1
		moreMove $3,$2
		moreMove $0,$4
		moreMove $3,$5
		endMove $8080
		moveEntity $4,$FF,$C,$14
		moreMove $8,$14
		moreMove $D,$0
		moreMove $3,$1
		moreMove $0,$3
		endMove $8080
		playSound SFX_BLO
		customActscript $4,$FF
		dc.w $14                ;   0014 SET ANIM COUNTER $0
		dc.w 0
		dc.w $1B                ;   001B SET FLIPPING $1
		dc.w 1
		dc.w $A                 ;   000A UPDATE SPRITE
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		hideEntity $81
		hideEntity $82
		csWait $3C
		setActscript $4,$FF,eas_Init
		moveEntity $4,$FF,$0,$1
		endMove $8080
		playSound $FD
		nextSingleText $0,$80   ; "Ohhh...{NAME;4}....{W1}"
		moveEntity $4,$FF,$2,$1
		endMove $8080
		setFacing $4,$1
		nextSingleText $0,$4    ; "Sir...you're alive!{W1}"
		playSound MUSIC_SAD_THEME_1
		nextSingleText $0,$80   ; "...It's no use running after{N}them....{W1}"
		moveEntity $4,$FF,$2,$1
		moreMove $1,$2
		endMove $8080
		nextSingleText $0,$4    ; "Are you OK, sir?{N}Why did they do such a{N}cruel thing?{W1}"
		nextSingleText $0,$80   ; "They were Galam soldiers.{N}They demanded my notes on{N}Ground Seal.{W2}{N}They suddenly snatched at{N}them, and...(cough)...{W1}"
		entityShiver $80
		stopEntity $80
		moveEntity $0,$FF,$0,$2
		moreMove $1,$3
		endMove $8080
		setFacing $0,$0
		setFacing $4,$2
		nextSingleText $0,$0    ; "(Whisper)....{W1}"
		nextSingleText $0,$80   ; "Who...is...it?{N}What...did he...say?{W1}"
		setFacing $4,$1
		nextSingleText $0,$4    ; "He's {LEADER} from{N}Granseal.  He said that{N}Ground Seal has opened.{W1}{N}And a serious disaster{N}took place!{W1}{N}He came to see you for{N}more information.{W1}"
		entityShiver $80
		stopEntity $80
		nextSingleText $0,$80   ; "What?!  The door opened?{N}Who broke the ancient{N}seal?! {W1}"
		nextSingleText $0,$4    ; "Calm down, sir.{N}Why are you so excited?{W1}"
		nextSingleText $0,$80   ; "(Cough, cough)...{NAME;4},{N}listen to me carefully.{N}Grans Island is lost!{W2}{N}That tower is the sacred{N}seal that confines a terrible{N}devil.{W2}{N}Two jewels...(cough)...{N}were...installed to...{W1}"
		entityShiver $80
		stopEntity $80
		nextSingleText $0,$4    ; "Stop talking, or you'll die.{W1}"
		nextText $0,$80         ; "I'm almost dead anyway...{N}(cough)...(cough)....{W2}"
		nextSingleText $0,$80   ; "{NAME;4}, look for the jewels...{N}to seal...ancient...{W1}"
		playSound $FD
		entityShiver $80
		stopEntity $80
		entityPosDirFlash $80,$3F,$3F,$3
		moveEntity $4,$FF,$1,$1
		endMove $8080
		nextSingleText $0,$4    ; "Sir!  Sir Hawel!{N}Don't leave me alone!{N}Oh, no...!{W1}"
		stopEntity $4
		csWait $3C
		moveEntity $0,$FF,$0,$1
		endMove $8080
		setFacing $0,$1
		csWait $1E
		startEntity $4
		setFacing $4,$3
		nextText $0,$4          ; "Sir Hawel passed away.{W2}{N}I'm going to seal the tower.{N}It's Sir Hawel's last wish.{W2}"
		nextSingleText $0,$4    ; "{LEADER}, please!{N}His wish is related to{N}your mission, right?{W2}{N}Can you go with me and{N}seal the tower?{W1}"
		join $8004
		nextSingleText $0,$4    ; "Now, let's go to the{N}Ancient Shrine!{W1}"
		followEntity $4,$0,$2
		clearF $48              ; Kazin is a follower
		setStoryFlag $4         ; Battle 4 unlocked
		csc_end
