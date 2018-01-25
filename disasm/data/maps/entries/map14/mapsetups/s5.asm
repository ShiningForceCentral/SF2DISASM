
; ASM FILE data\maps\entries\map14\mapsetups\s5.asm :
; 0x58F9C..0x592E0 : 
ms_map14_Section5:
		dc.b $FD 
		dc.b   0
		dc.b 0
		dc.b 0
		dc.w nullsub_178-ms_map14_Section5

; =============== S U B R O U T I N E =======================================

nullsub_178:
		rts

	; End of function nullsub_178

cs_58FA4:       textCursor $8D6
		reloadMap 8,7
		loadMapEntities ce_59270
		setActscriptWait $0,eas_Init
		csWait 1
		setPriority $0,$0
		setPriority $82,$0
		setPriority $85,$FFFF
		fadeInB
		customActscript $81
		 ac_wait 1200           ;   
		 ac_moveRel 1,0         ;   
		 ac_waitDest            ;   
		 ac_moveRel 0,1         ;   
		 ac_waitDest            ;   
		 ac_wait 600            ;   
		 ac_moveRel 0,65529     ;   
		 ac_waitDest            ;   
		 ac_jump eas_Idle       ;   
		ac_end
		nextSingleText $0,$80   ; "Somebody, take that plank{N}from him!{W1}"
		setFacing $80,RIGHT
		csWait 30
		setFacing $80,LEFT
		csWait 30
		setFacing $80,RIGHT
		csWait 30
		setFacing $82,LEFT
		nextSingleText $0,$82   ; "I got it!{W1}"
		entityActionsWait $82
		 moveLeft 2
		endActions
		entityActions $80
		 moveLeft 2
		endActions
		entityActionsWait $82
		 moveUp 1
		endActions
		entityActionsWait $82
		 moveLeft 1
		endActions
		setFacing $80,RIGHT
		setFacing $82,UP
		nextSingleText $0,$82   ; "Thank you, boy!{W1}"
		setFacing $82,DOWN
		csWait 30
		entityActions $84
		 moveDown 1
		endActions
		entityActions $85
		 moveDown 1
		endActions
		entityActionsWait $86
		 moveDown 1
		endActions
		nextSingleText $FF,$FF  ; "{LEADER} hands over{N}the plank.{W1}"
		csWait 30
		nextSingleText $0,$82   ; "We need a lot of planks{N}for our new town!{W1}"
		entityActions $82
		 moveDown 7
		endActions
		entityActions $84
		 moveDown 7
		endActions
		entityActions $85
		 moveDown 7
		endActions
		entityActionsWait $86
		 moveDown 7
		endActions
		hideEntity $82
		hideEntity $84
		hideEntity $85
		hideEntity $86
		entityActionsWait $80
		 moveRight 2
		endActions
		entityActionsWait $80
		 moveUp 1
		endActions
		nextText $0,$80         ; "We can't go back to {N}Granseal without a ship...{W2}"
		nextSingleText $0,$80   ; "There's no Granseal on{N}Grans Island now...{N}I know that, but...{W1}"
		csWait 60
		nextSingleText $0,$83   ; "Somebody, help!{W1}"
		customActscriptWait $83
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $83
		 moveUp 6
		endActions
		setActscriptWait $83,eas_Init
		setFacing $80,DOWN
		entityNod $83
		entityNod $83
		stopEntity $83
		entityActionsWait $80
		 moveDown 1
		endActions
		nextSingleText $0,$80   ; "What's wrong?{W1}"
		csWait 30
		startEntity $83
		nextText $0,$83         ; "One of my friends has not{N}returned from North Cliff.{W2}"
		nextSingleText $0,$83   ; "He may be in trouble.{W1}"
		nextSingleText $0,$80   ; "This isn't good.{W1}"
		setFacing $80,LEFT
		csWait 30
		setFacing $80,RIGHT
		csWait 30
		setFacing $80,UP
		csWait 30
		nextText $0,$80         ; "{LEADER}, did you{N}hear that?{W2}"
cs_59122:       textCursor $8E3
		nextText $0,$80         ; "Would you go to North{N}Cliff and check on his{N}friend?{D1}"
		yesNo
		jumpIfFlagSet $59,cs_59142; YES/NO prompt answer
		nextText $0,$80         ; "What did you say?{N}I didn't hear you.{W2}"
		nextText $0,$80         ; "OK, once again!{W1}"
		jump cs_59122
cs_59142:       textCursor $8E6
		nextText $0,$80         ; "Oh, you're so brave!{W2}"
		nextSingleText $0,$80   ; "Hey, he's going with you!{W1}"
		entityActionsWait $80
		 moveLeft 1
		endActions
		setFacing $80,RIGHT
		textCursor $8E8
		entityActionsWait $83
		 moveUp 2
		endActions
		nextText $0,$83         ; "{LEADER}, thank you!{W2}"
		nextSingleText $0,$83   ; "I'll show you to North Cliff.{N}Follow me.{W1}"
		csWait 30
		entityActions $83
		 moveDown 4
		endActions
		entityActions $0
		 moveDown 4
		endActions
		entityActionsWait $3
		 moveUp 5
		endActions
		setFacing $0,LEFT
		setFacing $3,RIGHT
		setCamDest 8,10
		nextSingleText $0,$3    ; "{LEADER}, wait.  Wait!{W1}"
		csWait 30
		nextSingleText $0,$1    ; "Hey, you're all wet.{W1}"
		setPos $4,13,10,DOWN
		setPos $2,13,9,DOWN
		setPos $5,13,8,DOWN
		setPos $1,13,7,DOWN
		setPos $6,13,6,DOWN
		entityActions $4
		 moveDown 4
		 moveRight 1
		 moveDown 1
		endActions
		entityActions $2
		 moveDown 5
		 moveRight 1
		endActions
		entityActions $5
		 moveDown 6
		 moveLeft 1
		endActions
		entityActions $1
		 moveDown 7
		endActions
		entityActionsWait $6
		 moveDown 7
		endActions
		setFacing $5,DOWN
		setFacing $1,DOWN
		setFacing $6,DOWN
		setFacing $2,DOWN
		setFacing $4,LEFT
		setFacing $0,UP
		setFacing $83,UP
		setFacing $80,DOWN
		nextSingleText $0,$1    ; "Are you leaving?{N}Say it isn't so!{W1}"
		nextSingleText $0,$4    ; "I think it's too dangerous{N}out there alone.{W1}"
		nextText $0,$83         ; "And...{W2}"
		nextSingleText $0,$83   ; "It would be safer if we came{N}along.  Let's go.{W1}"
		csWait 60
		setCameraEntity $FFFF
		entityActions $83
		 moveDown 7
		endActions
		entityActions $0
		 moveDown 7
		endActions
		entityActions $1
		 moveDown 7
		endActions
		entityActions $2
		 moveDown 7
		endActions
		entityActions $3
		 moveDown 7
		endActions
		entityActions $4
		 moveDown 7
		endActions
		entityActions $5
		 moveDown 7
		endActions
		entityActionsWait $6
		 moveDown 7
		endActions
		setStoryFlag $8         ; Battle 8 unlocked
		mapSysEvent $48,$1,$1,$3
		csc_end
ce_59270:       mainEntity 13,11,DOWN
		entity 12,20,UP,3,eas_Init
		entity 14,20,UP,5,eas_Init
		entity 14,21,UP,1,eas_Init
		entity 14,22,UP,6,eas_Init
		entity 14,23,UP,2,eas_Init
		entity 14,24,UP,4,eas_Init
		entity 13,13,UP,193,eas_Init
		entity 9,13,LEFT,196,eas_Init
		entity 16,13,RIGHT,194,eas_Init
		entity 13,20,UP,202,eas_Init
		entity 12,11,RIGHT,179,eas_Init3
		entity 13,11,DOWN,179,eas_Init3
		entity 14,11,LEFT,179,eas_Init3
		dc.w $FFFF
