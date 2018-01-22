
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

cs_568F6:       textCursor $55C         ; 0004 INIT TEXT CURSOR 55C : "Where are you from?{W1}"
		setFacing $0,$0         ; 0023 SET ENTITY FACING 0 0
		csWait $14
		moveEntity $82,$FF,$2,$1; 002D MOVE ENTITY 82 FF 2 1
		moreMove $1,$1
		endMove $8080
		setFacing $82,$2        ; 0023 SET ENTITY FACING 82 2
		nextSingleText $C0,$82  ; "Where are you from?{W1}"
		csWait $14
		setEntityDest $7,$4,$3A ; 0029 SET ENTITY DEST 7 4 3A
		setFacing $7,$0         ; 0023 SET ENTITY FACING 7 0
		nextSingleText $0,$7    ; "{LEADER} came from{N}Grans Island.{W1}"
		customActscript $82,$FF ; 0014 SET MANUAL ACTSCRIPT 82
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $82,$FF,$2,$1; 002D MOVE ENTITY 82 FF 2 1
		endMove $8080
		nextSingleText $C0,$82  ; "Then we could be related.{W1}"
		csWait $14
		setFacing $7,$1         ; 0023 SET ENTITY FACING 7 1
		csWait $14
		nextSingleText $0,$7    ; "What do you mean?{W1}"
		csWait $28
		setActscript $82,$FF,eas_Init2; 0015 SET ACTSCRIPT 82 FF 46102
		setFacing $82,$3        ; 0023 SET ENTITY FACING 82 3
		csWait $1E
		setFacing $82,$2        ; 0023 SET ENTITY FACING 82 2
		csWait $28
		moveEntity $82,$0,$0,$1 ; 002D MOVE ENTITY 82 0 0 1
		moreMove $3,$1
		endMove $8080
		csWait $14
		moveEntity $0,$FF,$0,$1 ; 002D MOVE ENTITY 0 FF 0 1
		endMove $8080
		csWait $A
		setFacing $0,$3         ; 0023 SET ENTITY FACING 0 3
		setFacing $7,$0         ; 0023 SET ENTITY FACING 7 0
		setFacing $82,$2        ; 0023 SET ENTITY FACING 82 2
		nextText $C0,$82        ; "Our ancestors came to{N}Parmecia to chase after{N}a soldier called Max.{W2}"
		nextText $C0,$82        ; "They lost his trail at the{N}shore and then split into{N}two groups.{W2}"
		nextSingleText $C0,$82  ; "One group went back to{N}Grans by way of Devil's Tail.{W1}"
		csWait $14
		nextSingleText $0,$7    ; "Hmmm...and what happened{N}to Max?{W1}"
		csWait $14
		nextText $C0,$82        ; "He wasn't found in Parmecia,{N}so maybe he went to Grans.{N}I'm not really sure.{W2}"
		nextSingleText $C0,$82  ; "I think I'll take a nap{N}now.  Bye.{W1}"
		csWait $1E
		moveEntity $7,$FF,$1,$1 ; 002D MOVE ENTITY 7 FF 1 1
		endMove $8080
		setFacing $7,$0         ; 0023 SET ENTITY FACING 7 0
		setFacing $0,$2         ; 0023 SET ENTITY FACING 0 2
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		csc_end
cs_569BC:       textCursor $566         ; 0004 INIT TEXT CURSOR 566 : "(Sniff)...(sniff)...I smell{N}something old....{W1}"
		setEntityDest $7,$F,$39 ; 0029 SET ENTITY DEST 7 F 39
		setFacing $7,$3         ; 0023 SET ENTITY FACING 7 3
		setFacing $0,$3         ; 0023 SET ENTITY FACING 0 3
		nextText $C0,$B         ; "(Sniff)...(sniff)...I smell{N}something old....{W1}"
		setFacing $B,$1         ; 0023 SET ENTITY FACING B 1
		nextSingleText $C0,$B   ; "That sword must be really{N}old.  Oh, my!{N}It's the Achilles Sword!{W2}"
		customActscript $B,$FF  ; 0014 SET MANUAL ACTSCRIPT B
		dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		customActscript $0,$FF  ; 0014 SET MANUAL ACTSCRIPT 0
		dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $0,$FF,eas_46172; 0015 SET ACTSCRIPT 0 FF 46172
		moveEntity $B,$0,$1,$1  ; 002D MOVE ENTITY B 0 1 1
		endMove $8080
		csWait $3
		moveEntity $0,$FF,$1,$1 ; 002D MOVE ENTITY 0 FF 1 1
		endMove $8080
		nextText $C0,$B         ; "You're an adventurer, right?{N}Don't you need a vehicle?{N}Huh?{W2}"
		nextSingleText $C0,$B   ; "You can get the Ancient{N}Caravan with that sword!{W1}"
		setEntityDest $7,$F,$3A ; 0029 SET ENTITY DEST 7 F 3A
		setFacing $7,$0         ; 0023 SET ENTITY FACING 7 0
		nextSingleText $0,$7    ; "You wouldn't listen to us{N}just a short time ago!{W1}"
		setFacing $B,$2         ; 0023 SET ENTITY FACING B 2
		nextText $C0,$B         ; "I was busy and...{W1}"
		setFacing $B,$1         ; 0023 SET ENTITY FACING B 1
		nextText $C0,$B         ; "Let me join you!{W2}"
		nextText $C0,$B         ; "I'm the only one who can{N}drive it!{W2}"
		nextText $C0,$B         ; "You are going to get the{N}Caravan, aren't you?!{W1}"
		yesNo                   ; 0011 STORY YESNO PROMPT
		jumpIfFlagSet $59,cs_56A82; YES/NO prompt answer
		customActscript $B,$FF  ; 0014 SET MANUAL ACTSCRIPT B
		dc.w $10                ;   0010 SET SPEED X=$A Y=$A
		dc.b $A
		dc.b $A
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setActscript $B,$FF,eas_46172; 0015 SET ACTSCRIPT B FF 46172
		moveEntity $B,$FF,$3,$1 ; 002D MOVE ENTITY B FF 3 1
		endMove $8080
cs_56A70:       textCursor $56F         ; 0004 INIT TEXT CURSOR 56F : "You don't know what you'll{N}be missing!{W1}"
		nextSingleText $C0,$B   ; "You don't know what you'll{N}be missing!{W1}"
		setFacing $B,$3         ; 0023 SET ENTITY FACING B 3
		jump cs_56AD4           ; 000B JUMP 56AD4
cs_56A82:       textCursor $572         ; 0004 INIT TEXT CURSOR 572 : "Great!  Good lad!{W1}"
		nextSingleText $C0,$B   ; "Great!  Good lad!{W1}"
		nextSingleText $FF,$FF  ; "{CLEAR}{LEADER} decides to take{N}Dr. {NAME;11} with him.{W1}{CLEAR}"
		setActscript $B,$FF,eas_Init; 0015 SET ACTSCRIPT B FF 460CE
		setPriority $B,$FFFF    ; 0053  B FFFF
		setPriority $0,$0       ; 0053  0 0
		setActscript $B,$FF,eas_Jump; 0015 SET ACTSCRIPT B FF 45E44
		setActscript $B,$0,eas_Jump; 0015 SET ACTSCRIPT B 0 45E44
		nextSingleText $C0,$B   ; "Let's go!{W1}"
		setPriority $0,$FFFF    ; 0053  0 FFFF
		setF $2D5               ; set after telling Rohde that you're going to get the Caravan
		setF $54                ; Rohde is a follower
		setStoryFlag $12        ; Battle 18 unlocked
		followEntity $B,$1F,$2  ; 002C FOLLOW ENTITY B 1F 2
cs_56AD4:       setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		csc_end
cs_56AE6:       textCursor $570         ; 0004 INIT TEXT CURSOR 570 : "You again?!{W1}"
		nextText $C0,$B         ; "You again?!{W1}"
		nextText $C0,$B         ; "You changed your mind?{N}Hmmm....{W1}"
		yesNo                   ; 0011 STORY YESNO PROMPT
		jumpIfFlagSet $59,cs_56A82; YES/NO prompt answer
		jump cs_56A70           ; 000B JUMP 56A70
cs_56B02:       textCursor $583         ; 0004 INIT TEXT CURSOR 583 : "Are you the boy who killed{N}the legendary Kraken?{W2}"
		setPriority $C,$FFFF    ; 0053  C FFFF
		setPriority $0,$0       ; 0053  0 0
		nextText $0,$C          ; "Are you the boy who killed{N}the legendary Kraken?{W2}"
		nextText $0,$C          ; "I got to Hassan thanks to{N}you.{W2}"
		nextSingleText $0,$C    ; "I didn't know this was such a{N}dull town.{W1}"
		csWait $14
		setFacing $C,$1         ; 0023 SET ENTITY FACING C 1
		csWait $1E
		setActscript $C,$FF,eas_Jump; 0015 SET ACTSCRIPT C FF 45E44
		csWait $14
		faceEntity $C,$0        ; 0052 RELATED TO TWO ENTITIES C 0
		nextSingleText $0,$C    ; "Wh...what's that?!{W1}"
		faceEntity $7,$C        ; 0052 RELATED TO TWO ENTITIES 7 C
		faceEntity $C,$7        ; 0052 RELATED TO TWO ENTITIES C 7
		nextSingleText $C0,$7   ; "It's the Caravan...an ancient{N}vehicle found in the shrine.{W1}"
		csWait $14
		faceEntity $C,$0        ; 0052 RELATED TO TWO ENTITIES C 0
		nextText $0,$C          ; "I love interesting{N}things like that!{W2}"
		nextText $0,$C          ; "Wow!  You found it?!{W2}"
		nextSingleText $0,$C    ; "I want to go with you to{N}see some more interesting{N}things!{W1}"
		join $C                 ; 0008 JOIN FORCE C
		nextSingleText $0,$C    ; "Adventure!{N}Yo Ho!  Let's go!{W1}"
		setActscript $C,$FF,eas_Jump; 0015 SET ACTSCRIPT C FF 45E44
		setActscript $C,$FF,eas_Jump; 0015 SET ACTSCRIPT C FF 45E44
		csWait $14
		setPriority $0,$FFFF    ; 0053  0 FFFF
		addNewFollower $C       ; 0056 SOMETHING WITH AN ENTITY C
		csc_end
