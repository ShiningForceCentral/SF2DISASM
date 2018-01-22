
; ASM FILE data\maps\entries\map09\mapsetups\s6.asm :
; 0x568C4..0x56B84 : 

; =============== S U B R O U T I N E =======================================

ms_map9_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $206               ; Battle 18 completed
		bne.s   loc_568D4
		move.w  #$89,d0 
		jsr     MoveEntityOutOfMap
loc_568D4:
		trap    #CHECK_FLAG
		dc.w $41                ; Caravan is unlocked (0x4428A..0x44337, 0x44338..0x44403)
		beq.s   loc_568E4
		move.w  #$B,d0
		jsr     MoveEntityOutOfMap
loc_568E4:
		trap    #CHECK_FLAG
		dc.w $C                 ; Rick joined
		beq.s   return_568F4
		move.w  #$C,d0
		jsr     MoveEntityOutOfMap
return_568F4:
		rts

	; End of function ms_map9_InitFunction

cs_568F6:       textCursor $55C
		setFacing $0,0
		csWait 20
		moveEntity $82,$FF,$2,$1
		moreMove $1,$1
		endMove $8080
		setFacing $82,2
		nextSingleText $C0,$82  ; "Where are you from?{W1}"
		csWait 20
		setEntityDest $7,4,58
		setFacing $7,0
		nextSingleText $0,$7    ; "{LEADER} came from{N}Grans Island.{W1}"
		customActscript $82,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $82,$FF,$2,$1
		endMove $8080
		nextSingleText $C0,$82  ; "Then we could be related.{W1}"
		csWait 20
		setFacing $7,1
		csWait 20
		nextSingleText $0,$7    ; "What do you mean?{W1}"
		csWait 40
		setActscript $82,$FF,eas_Init2
		setFacing $82,3
		csWait 30
		setFacing $82,2
		csWait 40
		moveEntity $82,$0,$0,$1
		moreMove $3,$1
		endMove $8080
		csWait 20
		moveEntity $0,$FF,$0,$1
		endMove $8080
		csWait 10
		setFacing $0,3
		setFacing $7,0
		setFacing $82,2
		nextText $C0,$82        ; "Our ancestors came to{N}Parmecia to chase after{N}a soldier called Max.{W2}"
		nextText $C0,$82        ; "They lost his trail at the{N}shore and then split into{N}two groups.{W2}"
		nextSingleText $C0,$82  ; "One group went back to{N}Grans by way of Devil's Tail.{W1}"
		csWait 20
		nextSingleText $0,$7    ; "Hmmm...and what happened{N}to Max?{W1}"
		csWait 20
		nextText $C0,$82        ; "He wasn't found in Parmecia,{N}so maybe he went to Grans.{N}I'm not really sure.{W2}"
		nextSingleText $C0,$82  ; "I think I'll take a nap{N}now.  Bye.{W1}"
		csWait 30
		moveEntity $7,$FF,$1,$1
		endMove $8080
		setFacing $7,0
		setFacing $0,2
		followEntity $7,$0,$2
		csc_end
cs_569BC:       textCursor $566
		setEntityDest $7,15,57
		setFacing $7,3
		setFacing $0,3
		nextText $C0,$B         ; "(Sniff)...(sniff)...I smell{N}something old....{W1}"
		setFacing $B,1
		nextSingleText $C0,$B   ; "That sword must be really{N}old.  Oh, my!{N}It's the Achilles Sword!{W2}"
		customActscript $B,$FF
		dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $0,$FF
		dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $0,$FF,eas_46172
		moveEntity $B,$0,$1,$1
		endMove $8080
		csWait 3
		moveEntity $0,$FF,$1,$1
		endMove $8080
		nextText $C0,$B         ; "You're an adventurer, right?{N}Don't you need a vehicle?{N}Huh?{W2}"
		nextSingleText $C0,$B   ; "You can get the Ancient{N}Caravan with that sword!{W1}"
		setEntityDest $7,15,58
		setFacing $7,0
		nextSingleText $0,$7    ; "You wouldn't listen to us{N}just a short time ago!{W1}"
		setFacing $B,2
		nextText $C0,$B         ; "I was busy and...{W1}"
		setFacing $B,1
		nextText $C0,$B         ; "Let me join you!{W2}"
		nextText $C0,$B         ; "I'm the only one who can{N}drive it!{W2}"
		nextText $C0,$B         ; "You are going to get the{N}Caravan, aren't you?!{W1}"
		yesNo
		jumpIfFlagSet $59,cs_56A82; YES/NO prompt answer
		customActscript $B,$FF
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $B,$FF,eas_46172
		moveEntity $B,$FF,$3,$1
		endMove $8080
cs_56A70:       textCursor $56F
		nextSingleText $C0,$B   ; "You don't know what you'll{N}be missing!{W1}"
		setFacing $B,3
		jump cs_56AD4
cs_56A82:       textCursor $572
		nextSingleText $C0,$B   ; "Great!  Good lad!{W1}"
		nextSingleText $FF,$FF  ; "{CLEAR}{LEADER} decides to take{N}Dr. {NAME;11} with him.{W1}{CLEAR}"
		setActscript $B,$FF,eas_Init
		setPriority $B,$FFFF
		setPriority $0,$0
		setActscript $B,$FF,eas_Jump
		setActscript $B,$0,eas_Jump
		nextSingleText $C0,$B   ; "Let's go!{W1}"
		setPriority $0,$FFFF
		setF $2D5               ; set after telling Rohde that you're going to get the Caravan
		setF $54                ; Rohde is a follower
		setStoryFlag $12        ; Battle 18 unlocked
		followEntity $B,$1F,$2
cs_56AD4:       setActscript $0,$FF,eas_Init
		followEntity $7,$0,$2
		csc_end
cs_56AE6:       textCursor $570
		nextText $C0,$B         ; "You again?!{W1}"
		nextText $C0,$B         ; "You changed your mind?{N}Hmmm....{W1}"
		yesNo
		jumpIfFlagSet $59,cs_56A82; YES/NO prompt answer
		jump cs_56A70
cs_56B02:       textCursor $583
		setPriority $C,$FFFF
		setPriority $0,$0
		nextText $0,$C          ; "Are you the boy who killed{N}the legendary Kraken?{W2}"
		nextText $0,$C          ; "I got to Hassan thanks to{N}you.{W2}"
		nextSingleText $0,$C    ; "I didn't know this was such a{N}dull town.{W1}"
		csWait 20
		setFacing $C,1
		csWait 30
		setActscript $C,$FF,eas_Jump
		csWait 20
		faceEntity $C,$0
		nextSingleText $0,$C    ; "Wh...what's that?!{W1}"
		faceEntity $7,$C
		faceEntity $C,$7
		nextSingleText $C0,$7   ; "It's the Caravan...an ancient{N}vehicle found in the shrine.{W1}"
		csWait 20
		faceEntity $C,$0
		nextText $0,$C          ; "I love interesting{N}things like that!{W2}"
		nextText $0,$C          ; "Wow!  You found it?!{W2}"
		nextSingleText $0,$C    ; "I want to go with you to{N}see some more interesting{N}things!{W1}"
		join $C
		nextSingleText $0,$C    ; "Adventure!{N}Yo Ho!  Let's go!{W1}"
		setActscript $C,$FF,eas_Jump
		setActscript $C,$FF,eas_Jump
		csWait 20
		setPriority $0,$FFFF
		addNewFollower $C
		csc_end
