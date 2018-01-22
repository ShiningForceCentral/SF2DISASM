
; ASM FILE data\maps\entries\map31\mapsetups\s6_33E.asm :
; 0x5D61E..0x5D756 : 

; =============== S U B R O U T I N E =======================================

ms_map31_flag33E_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $340
		beq.s   loc_5D62A
		lea     cs_5D63C(pc), a0
		trap    #6
loc_5D62A:
		trap    #CHECK_FLAG
		dc.w $342
		beq.s   return_5D63A
		trap    #CHECK_FLAG
		dc.w $343
		bne.s   return_5D63A
		trap    #CLEAR_FLAG
		dc.w $342               ; set after making the Arm of Golem appear in Moun
return_5D63A:
		rts

	; End of function ms_map31_flag33E_InitFunction

cs_5D63C:       setPos $88,30,6,LEFT
		csc_end
cs_5D644:       setPos $89,8,3,LEFT
		animEntityFadeInOut $89,$5
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
		setActscript $7,$FF,eas_Init
		setActscript $1F,$FF,eas_Init
		setEntityDest $0,28,3
		setFacing $0,DOWN
		setEntityDest $7,27,4
		setEntityDest $1F,27,5
		setFacing $88,UP
		setActscript $88,$FF,eas_46172
		moveEntity $88,$FF,$2,$1
		endMove $8080
		moveEntity $88,$FF,$0,$1
		endMove $8080
		csWait 60
		moveEntity $88,$FF,$2,$1
		endMove $8080
		csWait 30
		moveEntity $88,$FF,$0,$1
		endMove $8080
		moveEntity $88,$FF,$2,$1
		endMove $8080
		moveEntity $88,$FF,$0,$1
		endMove $8080
		csWait 60
		setActscript $88,$FF,eas_Init2
		setFacing $88,UP
		nextSingleText $0,$88   ; "Finished!{W1}"
		moveEntity $88,$FF,$0,$1
		endMove $8080
		setFacing $88,LEFT
		followEntity $7,$0,$2
		followEntity $1F,$7,$2
		csc_end
cs_5D712:       textCursor $7EA
		hideText
		nextText $0,$88         ; "Oh, please!  It won't take{N}long.  Will you pose{N}for me?"
		jump cs_5D65E
		csc_end
byte_5D724:     textCursor $7EE
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

