
; ASM FILE data\maps\entries\map31\mapsetups\s6_33E.asm :
; 0x5D61E..0x5D756 : 

; =============== S U B R O U T I N E =======================================

ms_map31_flag33E_InitFunction:
		
		 
		chkFlg  $340            ; set after talking to the painter in Moun for the first time
		beq.s   byte_5D62A      
		script  cs_5D63C
byte_5D62A:
		chkFlg  $342            ; set after making the Arm of Golem appear in Moun
		beq.s   return_5D63A
		chkFlg  $343            ; set after picking up the Arm of Golem in Moun
		bne.s   return_5D63A
		clrFlg  $342            ; set after making the Arm of Golem appear in Moun
return_5D63A:
		rts

	; End of function ms_map31_flag33E_InitFunction

cs_5D63C:       setPos $88,30,6,LEFT
		csc_end
cs_5D644:       setPos $89,8,3,LEFT
		animEntityFX $89,5
		csc_end
cs_5D652:       textCursor $7E8
		nextSingleText $0,$88   ; "Oh, you're cute!{N}(Cough)...well...{W1}"
		nextText $0,$88         ; "May I paint your portrait?"
cs_5D65E:       textCursor $7EB
		yesNo
		jumpIfFlagClear $59,cs_5D712; YES/NO prompt answer
		hideText
		nextSingleText $0,$88   ; "Excellent!{W1}"
		nextSingleText $0,$88   ; "Then, would you stand over{N}there, in front of the{N}flowers?{W1}"
		setActscriptWait $7,eas_Init
		setActscriptWait $1F,eas_Init
		setDest $0,28,3
		setFacing $0,DOWN
		setDest $7,27,4
		setDest $1F,27,5
		setFacing $88,UP
		setActscriptWait $88,eas_46172
		entityActionsWait $88
		 moveLeft 1
		endActions
		entityActionsWait $88
		 moveRight 1
		endActions
		csWait 60
		entityActionsWait $88
		 moveLeft 1
		endActions
		csWait 30
		entityActionsWait $88
		 moveRight 1
		endActions
		entityActionsWait $88
		 moveLeft 1
		endActions
		entityActionsWait $88
		 moveRight 1
		endActions
		csWait 60
		setActscriptWait $88,eas_Init2
		setFacing $88,UP
		nextSingleText $0,$88   ; "Finished!{W1}"
		entityActionsWait $88
		 moveRight 1
		endActions
		setFacing $88,LEFT
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		csc_end
cs_5D712:       textCursor $7EA
		hideText
		nextText $0,$88         ; "Oh, please!  It won't take{N}long.  Will you pose{N}for me?"
		jump cs_5D65E
		csc_end
cs_5D724:       textCursor $7EE
		nextText $0,$88         ; "It's you!{W2}"
		nextSingleText $0,$88   ; "Ah, how talented I am!{N}Hmmmm?{W1}"
		csc_end
cs_5D732:       executeSubroutine sub_5D73E
		csWait 180
		hideText
		csc_end

; =============== S U B R O U T I N E =======================================

sub_5D73E:
		movem.l d0-d2/a0,-(sp)
		move.w  #$34,d0 
		moveq   #$FFFFFFFF,d1
		clr.w   d2
		jsr     j_InitPortraitWindow
		movem.l (sp)+,d0-d2/a0
		rts

	; End of function sub_5D73E

