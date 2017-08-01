
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

cs_58FA4:       textCursor $8D6         ; Initial text line $8D6 : "Somebody, take that plank{N}from him!{W1}"
		csc46 $8,$7             ; 0046 UNKNOWN
		loadMapEntities ce_59270; Entity data to figure out and format
		setActscript $0,$FF,eas_Init; 0015 SET ACTSCRIPT 0 FF 460CE
		csWait $1               ; WAIT 1
		csc53 $0,$0             ; 0053 UNKNOWN
		csc53 $82,$0            ; 0053 UNKNOWN
		csc53 $85,$FFFF         ; 0053 UNKNOWN
		fadeInB                 ; 0039 FADE IN FROM BLACK
		customActscript $81,$0  ; 0014 SET MANUAL ACTSCRIPT 81
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
		setEntityDir $80,$0     ; 0023 SET ENTITY FACING 80 0
		csWait $1E              ; WAIT 1E
		setEntityDir $80,$2     ; 0023 SET ENTITY FACING 80 2
		csWait $1E              ; WAIT 1E
		setEntityDir $80,$0     ; 0023 SET ENTITY FACING 80 0
		csWait $1E              ; WAIT 1E
		setEntityDir $82,$2     ; 0023 SET ENTITY FACING 82 2
		nextSingleText $0,$82   ; "I got it!{W1}"
		moveEntity $82,$FF,$2,$2; 002D MOVE ENTITY 82 FF 2 2
		endMove $8080
		moveEntity $80,$0,$2,$2 ; 002D MOVE ENTITY 80 0 2 2
		endMove $8080
		moveEntity $82,$FF,$1,$1; 002D MOVE ENTITY 82 FF 1 1
		endMove $8080
		moveEntity $82,$FF,$2,$1; 002D MOVE ENTITY 82 FF 2 1
		endMove $8080
		setEntityDir $80,$0     ; 0023 SET ENTITY FACING 80 0
		setEntityDir $82,$1     ; 0023 SET ENTITY FACING 82 1
		nextSingleText $0,$82   ; "Thank you, boy!{W1}"
		setEntityDir $82,$3     ; 0023 SET ENTITY FACING 82 3
		csWait $1E              ; WAIT 1E
		moveEntity $84,$0,$3,$1 ; 002D MOVE ENTITY 84 0 3 1
		endMove $8080
		moveEntity $85,$0,$3,$1 ; 002D MOVE ENTITY 85 0 3 1
		endMove $8080
		moveEntity $86,$FF,$3,$1; 002D MOVE ENTITY 86 FF 3 1
		endMove $8080
		nextSingleText $FF,$FF  ; "{LEADER} hands over{N}the plank.{W1}"
		csWait $1E              ; WAIT 1E
		nextSingleText $0,$82   ; "We need a lot of planks{N}for our new town!{W1}"
		moveEntity $82,$0,$3,$7 ; 002D MOVE ENTITY 82 0 3 7
		endMove $8080
		moveEntity $84,$0,$3,$7 ; 002D MOVE ENTITY 84 0 3 7
		endMove $8080
		moveEntity $85,$0,$3,$7 ; 002D MOVE ENTITY 85 0 3 7
		endMove $8080
		moveEntity $86,$FF,$3,$7; 002D MOVE ENTITY 86 FF 3 7
		endMove $8080
		hideEntity $82          ; 002E HIDE ENTITY 82
		hideEntity $84          ; 002E HIDE ENTITY 84
		hideEntity $85          ; 002E HIDE ENTITY 85
		hideEntity $86          ; 002E HIDE ENTITY 86
		moveEntity $80,$FF,$0,$2; 002D MOVE ENTITY 80 FF 0 2
		endMove $8080
		moveEntity $80,$FF,$1,$1; 002D MOVE ENTITY 80 FF 1 1
		endMove $8080
		nextText $0,$80         ; "We can't go back to {N}Granseal without a ship...{W2}"
		nextSingleText $0,$80   ; "There's no Granseal on{N}Grans Island now...{N}I know that, but...{W1}"
		csWait $3C              ; WAIT 3C
		nextSingleText $0,$83   ; "Somebody, help!{W1}"
		customActscript $83,$FF ; 0014 SET MANUAL ACTSCRIPT 83
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $83,$FF,$1,$6; 002D MOVE ENTITY 83 FF 1 6
		endMove $8080
		setActscript $83,$FF,eas_Init; 0015 SET ACTSCRIPT 83 FF 460CE
		setEntityDir $80,$3     ; 0023 SET ENTITY FACING 80 3
		entityNod $83           ; 0026 MAKE ENTITY NOD 83
		entityNod $83           ; 0026 MAKE ENTITY NOD 83
		stopEntity $83          ; 001C STOP ENTITY ANIM 83
		moveEntity $80,$FF,$3,$1; 002D MOVE ENTITY 80 FF 3 1
		endMove $8080
		nextSingleText $0,$80   ; "What's wrong?{W1}"
		csWait $1E              ; WAIT 1E
		startEntity $83         ; 001B START ENTITY ANIM 83
		nextText $0,$83         ; "One of my friends has not{N}returned from North Cliff.{W2}"
		nextSingleText $0,$83   ; "He may be in trouble.{W1}"
		nextSingleText $0,$80   ; "This isn't good.{W1}"
		setEntityDir $80,$2     ; 0023 SET ENTITY FACING 80 2
		csWait $1E              ; WAIT 1E
		setEntityDir $80,$0     ; 0023 SET ENTITY FACING 80 0
		csWait $1E              ; WAIT 1E
		setEntityDir $80,$1     ; 0023 SET ENTITY FACING 80 1
		csWait $1E              ; WAIT 1E
		nextText $0,$80         ; "{LEADER}, did you{N}hear that?{W2}"
cs_59122:       textCursor $8E3         ; Initial text line $8E3 : "Would you go to North{N}Cliff and check on his{N}friend?{D1}"
		nextText $0,$80         ; "Would you go to North{N}Cliff and check on his{N}friend?{D1}"
		yesNo                   ; 0011 STORY YESNO PROMPT
		jumpIfFlagSet $59,cs_59142; YES/NO prompt answer
		nextText $0,$80         ; "What did you say?{N}I didn't hear you.{W2}"
		nextText $0,$80         ; "OK, once again!{W1}"
		jump cs_59122           ; 000B JUMP 59122
cs_59142:       textCursor $8E6         ; Initial text line $8E6 : "Oh, you're so brave!{W2}"
		nextText $0,$80         ; "Oh, you're so brave!{W2}"
		nextSingleText $0,$80   ; "Hey, he's going with you!{W1}"
		moveEntity $80,$FF,$2,$1; 002D MOVE ENTITY 80 FF 2 1
		endMove $8080
		setEntityDir $80,$0     ; 0023 SET ENTITY FACING 80 0
		textCursor $8E8         ; Initial text line $8E8 : "{LEADER}, thank you!{W2}"
		moveEntity $83,$FF,$1,$2; 002D MOVE ENTITY 83 FF 1 2
		endMove $8080
		nextText $0,$83         ; "{LEADER}, thank you!{W2}"
		nextSingleText $0,$83   ; "I'll show you to North Cliff.{N}Follow me.{W1}"
		csWait $1E              ; WAIT 1E
		moveEntity $83,$0,$3,$4 ; 002D MOVE ENTITY 83 0 3 4
		endMove $8080
		moveEntity $0,$0,$3,$4  ; 002D MOVE ENTITY 0 0 3 4
		endMove $8080
		moveEntity $3,$FF,$1,$5 ; 002D MOVE ENTITY 3 FF 1 5
		endMove $8080
		setEntityDir $0,$2      ; 0023 SET ENTITY FACING 0 2
		setEntityDir $3,$0      ; 0023 SET ENTITY FACING 3 0
		setCamDest $8,$A        ; 0032 SET CAMERA DEST 8 A
		nextSingleText $0,$3    ; "{LEADER}, wait.  Wait!{W1}"
		csWait $1E              ; WAIT 1E
		nextSingleText $0,$1    ; "Hey, you're all wet.{W1}"
		entityPosDir $4,$D,$A,$3; 0019 SET ENTITY POS AND FACING 4 D A 3
		entityPosDir $2,$D,$9,$3; 0019 SET ENTITY POS AND FACING 2 D 9 3
		entityPosDir $5,$D,$8,$3; 0019 SET ENTITY POS AND FACING 5 D 8 3
		entityPosDir $1,$D,$7,$3; 0019 SET ENTITY POS AND FACING 1 D 7 3
		entityPosDir $6,$D,$6,$3; 0019 SET ENTITY POS AND FACING 6 D 6 3
		moveEntity $4,$0,$3,$4  ; 002D MOVE ENTITY 4 0 3 4
		moreMove $0,$1
		moreMove $3,$1
		endMove $8080
		moveEntity $2,$0,$3,$5  ; 002D MOVE ENTITY 2 0 3 5
		moreMove $0,$1
		endMove $8080
		moveEntity $5,$0,$3,$6  ; 002D MOVE ENTITY 5 0 3 6
		moreMove $2,$1
		endMove $8080
		moveEntity $1,$0,$3,$7  ; 002D MOVE ENTITY 1 0 3 7
		endMove $8080
		moveEntity $6,$FF,$3,$7 ; 002D MOVE ENTITY 6 FF 3 7
		endMove $8080
		setEntityDir $5,$3      ; 0023 SET ENTITY FACING 5 3
		setEntityDir $1,$3      ; 0023 SET ENTITY FACING 1 3
		setEntityDir $6,$3      ; 0023 SET ENTITY FACING 6 3
		setEntityDir $2,$3      ; 0023 SET ENTITY FACING 2 3
		setEntityDir $4,$2      ; 0023 SET ENTITY FACING 4 2
		setEntityDir $0,$1      ; 0023 SET ENTITY FACING 0 1
		setEntityDir $83,$1     ; 0023 SET ENTITY FACING 83 1
		setEntityDir $80,$3     ; 0023 SET ENTITY FACING 80 3
		nextSingleText $0,$1    ; "Are you leaving?{N}Say it isn't so!{W1}"
		nextSingleText $0,$4    ; "I think it's too dangerous{N}out there alone.{W1}"
		nextText $0,$83         ; "And...{W2}"
		nextSingleText $0,$83   ; "It would be safer if we came{N}along.  Let's go.{W1}"
		csWait $3C              ; WAIT 3C
		setCameraEntity $FFFF   ; 0024 SET ENTITY FOLLOWED BY CAMERA FFFF
		moveEntity $83,$0,$3,$7 ; 002D MOVE ENTITY 83 0 3 7
		endMove $8080
		moveEntity $0,$0,$3,$7  ; 002D MOVE ENTITY 0 0 3 7
		endMove $8080
		moveEntity $1,$0,$3,$7  ; 002D MOVE ENTITY 1 0 3 7
		endMove $8080
		moveEntity $2,$0,$3,$7  ; 002D MOVE ENTITY 2 0 3 7
		endMove $8080
		moveEntity $3,$0,$3,$7  ; 002D MOVE ENTITY 3 0 3 7
		endMove $8080
		moveEntity $4,$0,$3,$7  ; 002D MOVE ENTITY 4 0 3 7
		endMove $8080
		moveEntity $5,$0,$3,$7  ; 002D MOVE ENTITY 5 0 3 7
		endMove $8080
		moveEntity $6,$FF,$3,$7 ; 002D MOVE ENTITY 6 FF 3 7
		endMove $8080
		setStoryFlag $8         ; Battle 8 unlocked
		mapSysEvent $48010103   ; 0007 EXECUTE MAP SYSTEM EVENT 48010103
		csc_end                 ; END OF CUTSCENE SCRIPT
ce_59270:       dc.b   0
		dc.b  $D
		dc.b   0
		dc.b  $B
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
