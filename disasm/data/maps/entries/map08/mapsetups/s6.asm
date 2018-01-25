
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
		setActscriptWait $81,eas_46172
		entityActionsWait $81
		 moveRight 4
		endActions
		nextSingleText $0,$81   ; "Hmmm?{W1}"
		customActscriptWait $81
		 ac_setSpeed 40,40      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		entityActionsWait $81
		 moveLeft 2
		endActions
		setFacing $81,DOWN
		nextSingleText $0,$81   ; "You're a spy from the new{N}town, aren't you?{W1}"
		entityActionsWait $81
		 moveUp 2
		endActions
		nextSingleText $0,$81   ; "You're back again!{N}Mayor!  Mayor!{W1}"
		setActscriptWait $81,eas_Init
		customActscriptWait $81
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		setFacing $81,UP
		entityActionsWait $81
		 moveUp 8
		endActions
		setPos $81,15,7,DOWN
		csc_end
cs_56422:       textCursor $50E
		setActscriptWait $7,eas_Init
		setEntityDest $7,14,10
		setFacing $7,UP
		setActscriptWait $0,eas_46172
		setActscriptWait $7,eas_46172
		customActscriptWait $81
		 ac_setSpeed 48,48      ;   
		 ac_jump eas_Idle       ;   
		ac_end
		csWait 30
		entityActions $0
		 moveDown 1
		endActions
		setActscriptWait $80,eas_BumpDown
		entityActionsWait $80
		 moveDown 1
		endActions
		csWait 30
		entityActions $0
		 moveDown 1
		endActions
		entityActions $7
		 moveDown 1
		endActions
		setActscriptWait $80,eas_BumpDown
		entityActionsWait $80
		 moveDown 1
		endActions
		csWait 30
		entityActions $0
		 moveDown 1
		endActions
		entityActions $7
		 moveDown 1
		endActions
		setActscriptWait $80,eas_BumpDown
		entityActionsWait $80
		 moveDown 1
		endActions
		csWait 30
		entityActions $0
		 moveDown 1
		endActions
		entityActions $7
		 moveDown 1
		endActions
		setActscriptWait $80,eas_BumpDown
		entityActionsWait $80
		 moveDown 1
		endActions
		csWait 30
		entityActions $0
		 moveDown 1
		endActions
		entityActions $7
		 moveDown 1
		endActions
		setActscriptWait $80,eas_BumpDown
		entityActionsWait $80
		 moveDown 1
		endActions
		nextSingleText $0,$80   ; "Who are you?{N}What are you?{W1}"
		entityActionsWait $81
		 moveLeft 1
		 moveDown 4
		 moveRight 1
		 moveDown 1
		endActions
		nextText $0,$81         ; "A group of soldiers were{N}just here.{W2}"
		nextSingleText $0,$81   ; "Soldiers must be waiting{N}beyond the gate.{N}Be careful!{W1}"
		nextText $0,$80         ; "You're so persistent.{N}What do you want?!{W2}"
		nextText $0,$80         ; "You suddenly appear in{N}Parmecia, and build a castle?{W2}"
		nextText $0,$80         ; "I don't know who you are,{N}but all big cities like war!{W2}"
		nextSingleText $0,$80   ; "I've never seen such{N}impolite and violent guests!{W1}"
		nextText $0,$81         ; "He's right!{W2}"
		nextSingleText $0,$81   ; "You came here to capture{N}Parmecia!{W1}"
		nextSingleText $0,$80   ; "We'll never obey you!{N}Go away!{W1}"
		setActscriptWait $81,eas_Init
		setActscriptWait $0,eas_Init
		setActscriptWait $7,eas_Init
		entityActions $80
		 moveUp 1
		endActions
		entityActionsWait $81
		 moveUp 1
		endActions
		setActscriptWait $7,eas_Jump
		nextSingleText $0,$7    ; "You talk too much!{W1}"
		setFacing $0,DOWN
		nextText $0,$7          ; "Hey, {LEADER}!{N}Why don't you say something?{W2}"
		nextSingleText $0,$7    ; "I can't stand this!{W1}"
		entityActionsWait $7
		 moveLeft 1
		 moveUp 1
		endActions
		setFacing $0,UP
		nextSingleText $0,$7    ; "Hey, you!  I think I{N}understand how you feel,{N}but listen to me!{W1}"
		setFacing $80,DOWN
		setFacing $81,DOWN
		nextSingleText $0,$80   ; "Why?{W1}"
		entityActionsWait $7
		 moveUp 1
		endActions
		nextText $0,$7          ; "I'm not from Granseal.{N}I just visited there....{W2}"
		nextText $0,$7          ; "You think they came to{N}Parmecia to conquer it?{N}Well, you're wrong.{W2}"
		nextText $0,$7          ; "They were forced to leave{N}their island due to a{N}disaster.{W2}"
		nextSingleText $0,$7    ; "They're good people!{N}You don't have to be so{N}paranoid!{W1}"
		nextSingleText $0,$80   ; "Who are you?{W1}"
		nextSingleText $0,$7    ; "I'm {NAME;7}!{N}I'm a phoenix that lives in{N}Mt. Volcano.{W1}"
		setActscript $80,eas_Jump
		setActscriptWait $81,eas_Jump
		setActscript $80,eas_Jump
		setActscriptWait $81,eas_Jump
		nextSingleText $0,$80   ; "A phoenix!{N}The legendary bird?{W1}"
		nextSingleText $0,$7    ; "I don't know if we're{N}legendary or not....{W1}"
		nextText $0,$80         ; "I'm very glad to meet{N}you!{W2}"
		nextSingleText $0,$80   ; "Oh, they're friends of yours.{N}My, my!{W1}"
		nextText $0,$81         ; "Of course, we of Ribble{N}will become allies of{N}Granseal.{W2}"
		nextSingleText $0,$81   ; "I promise that we will{N}welcome you when you visit{N}us again!{W1}"
		fadeOutB
		loadMapEntities ce_55FBE
		setActscriptWait $0,eas_Init
		setBlocks 32,2,1,1,25,12
		setBlocks 32,2,1,1,22,24
		setBlocks 32,2,1,1,7,25
		setBlocks 32,3,2,1,6,15
		setF $2C5               ; set after the mayor in Ribble scene... this flag unlocks the doors
		executeSubroutine sub_56632
		followEntity $7,$0,$2
		csWait 50
		fadeInB
		csc_end

; =============== S U B R O U T I N E =======================================

sub_56632:
		jmp     (sub_40F2).w

	; End of function sub_56632

