
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
		setActscript $0,$FF,eas_Init
		csWait 1
		setPriority $0,$0
		setPriority $82,$0
		setPriority $85,$FFFF
		fadeInB
		customActscript $81,$0
		dc.w 0                  ;   0000 WAIT value $4B0
		dc.w $4B0
		dc.w 4                  ;   0004 MOVE TO RELATIVE DEST X=X+$1 Y=Y+$0
		dc.w 1
		dc.w 0
		dc.w 1                  ;   0001 WAIT UNTIL DESTINATION
		dc.w 4                  ;   0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$1
		dc.w 0
		dc.w 1
		dc.w 1                  ;   0001 WAIT UNTIL DESTINATION
		dc.w 0                  ;   0000 WAIT value $258
		dc.w $258
		dc.w 4                  ;   0004 MOVE TO RELATIVE DEST X=X+$0 Y=Y+$FFF9
		dc.w 0
		dc.w $FFF9
		dc.w 1                  ;   0001 WAIT UNTIL DESTINATION
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		nextSingleText $0,$80   ; "Somebody, take that plank{N}from him!{W1}"
		setFacing $80,RIGHT
		csWait 30
		setFacing $80,LEFT
		csWait 30
		setFacing $80,RIGHT
		csWait 30
		setFacing $82,LEFT
		nextSingleText $0,$82   ; "I got it!{W1}"
		moveEntity $82,$FF,$2,$2
		endMove $8080
		moveEntity $80,$0,$2,$2
		endMove $8080
		moveEntity $82,$FF,$1,$1
		endMove $8080
		moveEntity $82,$FF,$2,$1
		endMove $8080
		setFacing $80,RIGHT
		setFacing $82,UP
		nextSingleText $0,$82   ; "Thank you, boy!{W1}"
		setFacing $82,DOWN
		csWait 30
		moveEntity $84,$0,$3,$1
		endMove $8080
		moveEntity $85,$0,$3,$1
		endMove $8080
		moveEntity $86,$FF,$3,$1
		endMove $8080
		nextSingleText $FF,$FF  ; "{LEADER} hands over{N}the plank.{W1}"
		csWait 30
		nextSingleText $0,$82   ; "We need a lot of planks{N}for our new town!{W1}"
		moveEntity $82,$0,$3,$7
		endMove $8080
		moveEntity $84,$0,$3,$7
		endMove $8080
		moveEntity $85,$0,$3,$7
		endMove $8080
		moveEntity $86,$FF,$3,$7
		endMove $8080
		hideEntity $82
		hideEntity $84
		hideEntity $85
		hideEntity $86
		moveEntity $80,$FF,$0,$2
		endMove $8080
		moveEntity $80,$FF,$1,$1
		endMove $8080
		nextText $0,$80         ; "We can't go back to {N}Granseal without a ship...{W2}"
		nextSingleText $0,$80   ; "There's no Granseal on{N}Grans Island now...{N}I know that, but...{W1}"
		csWait 60
		nextSingleText $0,$83   ; "Somebody, help!{W1}"
		customActscript $83,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $83,$FF,$1,$6
		endMove $8080
		setActscript $83,$FF,eas_Init
		setFacing $80,DOWN
		entityNod $83
		entityNod $83
		stopEntity $83
		moveEntity $80,$FF,$3,$1
		endMove $8080
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
		moveEntity $80,$FF,$2,$1
		endMove $8080
		setFacing $80,RIGHT
		textCursor $8E8
		moveEntity $83,$FF,$1,$2
		endMove $8080
		nextText $0,$83         ; "{LEADER}, thank you!{W2}"
		nextSingleText $0,$83   ; "I'll show you to North Cliff.{N}Follow me.{W1}"
		csWait 30
		moveEntity $83,$0,$3,$4
		endMove $8080
		moveEntity $0,$0,$3,$4
		endMove $8080
		moveEntity $3,$FF,$1,$5
		endMove $8080
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
		moveEntity $4,$0,$3,$4
		moreMove $0,$1
		moreMove $3,$1
		endMove $8080
		moveEntity $2,$0,$3,$5
		moreMove $0,$1
		endMove $8080
		moveEntity $5,$0,$3,$6
		moreMove $2,$1
		endMove $8080
		moveEntity $1,$0,$3,$7
		endMove $8080
		moveEntity $6,$FF,$3,$7
		endMove $8080
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
		moveEntity $83,$0,$3,$7
		endMove $8080
		moveEntity $0,$0,$3,$7
		endMove $8080
		moveEntity $1,$0,$3,$7
		endMove $8080
		moveEntity $2,$0,$3,$7
		endMove $8080
		moveEntity $3,$0,$3,$7
		endMove $8080
		moveEntity $4,$0,$3,$7
		endMove $8080
		moveEntity $5,$0,$3,$7
		endMove $8080
		moveEntity $6,$FF,$3,$7
		endMove $8080
		setStoryFlag $8         ; Battle 8 unlocked
		mapSysEvent $48,$1,$1,$3
		csc_end
ce_59270:       dc.w $D
		dc.w $B
		dc.w 3
		dc.b $C
		dc.b $14
		dc.b 1
		dc.b 3
		dc.l eas_Init           
		dc.b $E
		dc.b $14
		dc.b 1
		dc.b 5
		dc.l eas_Init           
		dc.b $E
		dc.b $15
		dc.b 1
		dc.b 1
		dc.l eas_Init           
		dc.b $E
		dc.b $16
		dc.b 1
		dc.b 6
		dc.l eas_Init           
		dc.b $E
		dc.b $17
		dc.b 1
		dc.b 2
		dc.l eas_Init           
		dc.b $E
		dc.b $18
		dc.b 1
		dc.b 4
		dc.l eas_Init           
		dc.b $D
		dc.b $D
		dc.b 1
		dc.b $C1
		dc.l eas_Init           
		dc.b 9
		dc.b $D
		dc.b 2
		dc.b $C4
		dc.l eas_Init           
		dc.b $10
		dc.b $D
		dc.b 0
		dc.b $C2
		dc.l eas_Init           
		dc.b $D
		dc.b $14
		dc.b 1
		dc.b $CA
		dc.l eas_Init           
		dc.b $C
		dc.b $B
		dc.b 0
		dc.b $B3
		dc.l eas_Init3          
		dc.b $D
		dc.b $B
		dc.b 3
		dc.b $B3
		dc.l eas_Init3          
		dc.b $E
		dc.b $B
		dc.b 2
		dc.b $B3
		dc.l eas_Init3          
		dc.w $FFFF
