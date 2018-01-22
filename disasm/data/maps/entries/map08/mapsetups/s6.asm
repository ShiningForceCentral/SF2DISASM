
; ASM FILE data\maps\entries\map08\mapsetups\s6.asm :
; 0x563A2..0x56636 : 

; =============== S U B R O U T I N E =======================================

ms_map8_InitFunction:
		
		trap    #1
		dc.w 8
		beq.s   return_563B0
		moveq   #8,d0
		jsr     MoveEntityOutOfMap
return_563B0:
		rts

	; End of function ms_map8_InitFunction

cs_563B2:       textCursor $50B
		setActscript $81,$FF,eas_46172
		moveEntity $81,$FF,$0,$4
		endMove $8080
		nextSingleText $0,$81   ; "Hmmm?{W1}"
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$28 Y=$28
		dc.b $28
		dc.b $28
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		moveEntity $81,$FF,$2,$2
		endMove $8080
		setFacing $81,$3
		nextSingleText $0,$81   ; "You're a spy from the new{N}town, aren't you?{W1}"
		moveEntity $81,$FF,$1,$2
		endMove $8080
		nextSingleText $0,$81   ; "You're back again!{N}Mayor!  Mayor!{W1}"
		setActscript $81,$FF,eas_Init
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		setFacing $81,$1
		moveEntity $81,$FF,$1,$8
		endMove $8080
		entityPosDir $81,$F,$7,$3
		csc_end
cs_56422:       textCursor $50E
		setActscript $7,$FF,eas_Init
		setEntityDest $7,$E,$A
		setFacing $7,$1
		setActscript $0,$FF,eas_46172
		setActscript $7,$FF,eas_46172
		customActscript $81,$FF
		dc.w $10                ;   0010 SET SPEED X=$30 Y=$30
		dc.b $30
		dc.b $30
		dc.w $34                ;   0034 JUMP TO ABSOLUTE ADDR. 0x451FC
		dc.l eas_Idle           
		dc.w $8080              ; 0014 END OF CUSTOM ACTSCRIPT
		csWait $1E
		moveEntity $0,$0,$3,$1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
		moveEntity $80,$FF,$3,$1
		endMove $8080
		csWait $1E
		moveEntity $0,$0,$3,$1
		endMove $8080
		moveEntity $7,$0,$3,$1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
		moveEntity $80,$FF,$3,$1
		endMove $8080
		csWait $1E
		moveEntity $0,$0,$3,$1
		endMove $8080
		moveEntity $7,$0,$3,$1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
		moveEntity $80,$FF,$3,$1
		endMove $8080
		csWait $1E
		moveEntity $0,$0,$3,$1
		endMove $8080
		moveEntity $7,$0,$3,$1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
		moveEntity $80,$FF,$3,$1
		endMove $8080
		csWait $1E
		moveEntity $0,$0,$3,$1
		endMove $8080
		moveEntity $7,$0,$3,$1
		endMove $8080
		setActscript $80,$FF,eas_BumpDown
		moveEntity $80,$FF,$3,$1
		endMove $8080
		nextSingleText $0,$80   ; "Who are you?{N}What are you?{W1}"
		moveEntity $81,$FF,$2,$1
		moreMove $3,$4
		moreMove $0,$1
		moreMove $3,$1
		endMove $8080
		nextText $0,$81         ; "A group of soldiers were{N}just here.{W2}"
		nextSingleText $0,$81   ; "Soldiers must be waiting{N}beyond the gate.{N}Be careful!{W1}"
		nextText $0,$80         ; "You're so persistent.{N}What do you want?!{W2}"
		nextText $0,$80         ; "You suddenly appear in{N}Parmecia, and build a castle?{W2}"
		nextText $0,$80         ; "I don't know who you are,{N}but all big cities like war!{W2}"
		nextSingleText $0,$80   ; "I've never seen such{N}impolite and violent guests!{W1}"
		nextText $0,$81         ; "He's right!{W2}"
		nextSingleText $0,$81   ; "You came here to capture{N}Parmecia!{W1}"
		nextSingleText $0,$80   ; "We'll never obey you!{N}Go away!{W1}"
		setActscript $81,$FF,eas_Init
		setActscript $0,$FF,eas_Init
		setActscript $7,$FF,eas_Init
		moveEntity $80,$0,$1,$1
		endMove $8080
		moveEntity $81,$FF,$1,$1
		endMove $8080
		setActscript $7,$FF,eas_Jump
		nextSingleText $0,$7    ; "You talk too much!{W1}"
		setFacing $0,$3
		nextText $0,$7          ; "Hey, {LEADER}!{N}Why don't you say something?{W2}"
		nextSingleText $0,$7    ; "I can't stand this!{W1}"
		moveEntity $7,$FF,$2,$1
		moreMove $1,$1
		endMove $8080
		setFacing $0,$1
		nextSingleText $0,$7    ; "Hey, you!  I think I{N}understand how you feel,{N}but listen to me!{W1}"
		setFacing $80,$3
		setFacing $81,$3
		nextSingleText $0,$80   ; "Why?{W1}"
		moveEntity $7,$FF,$1,$1
		endMove $8080
		nextText $0,$7          ; "I'm not from Granseal.{N}I just visited there....{W2}"
		nextText $0,$7          ; "You think they came to{N}Parmecia to conquer it?{N}Well, you're wrong.{W2}"
		nextText $0,$7          ; "They were forced to leave{N}their island due to a{N}disaster.{W2}"
		nextSingleText $0,$7    ; "They're good people!{N}You don't have to be so{N}paranoid!{W1}"
		nextSingleText $0,$80   ; "Who are you?{W1}"
		nextSingleText $0,$7    ; "I'm {NAME;7}!{N}I'm a phoenix that lives in{N}Mt. Volcano.{W1}"
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		setActscript $80,$0,eas_Jump
		setActscript $81,$FF,eas_Jump
		nextSingleText $0,$80   ; "A phoenix!{N}The legendary bird?{W1}"
		nextSingleText $0,$7    ; "I don't know if we're{N}legendary or not....{W1}"
		nextText $0,$80         ; "I'm very glad to meet{N}you!{W2}"
		nextSingleText $0,$80   ; "Oh, they're friends of yours.{N}My, my!{W1}"
		nextText $0,$81         ; "Of course, we of Ribble{N}will become allies of{N}Granseal.{W2}"
		nextSingleText $0,$81   ; "I promise that we will{N}welcome you when you visit{N}us again!{W1}"
		fadeOutB
		loadMapEntities ce_55FBE
		setActscript $0,$FF,eas_Init
		setBlocks $20,$2,$1,$1,$19,$C
		setBlocks $20,$2,$1,$1,$16,$18
		setBlocks $20,$2,$1,$1,$7,$19
		setBlocks $20,$3,$2,$1,$6,$F
		setF $2C5               ; set after the mayor in Ribble scene... this flag unlocks the doors
		executeSubroutine sub_56632
		followEntity $7,$0,$2
		csWait $32
		fadeInB
		csc_end

; =============== S U B R O U T I N E =======================================

sub_56632:
		jmp     (sub_40F2).w

	; End of function sub_56632

