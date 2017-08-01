
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

cs_5D63C:       entityPosDir $88,$1E,$6,$2; 0019 SET ENTITY POS AND FACING 88 1E 6 2
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_5D644:       entityPosDir $89,$8,$3,$2; 0019 SET ENTITY POS AND FACING 89 8 3 2
		animEntityFadeInOut $89,$5; 0022 ANIMATE ENTITY FADE INOUT 89
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_5D652:       textCursor $7E8         ; Initial text line $7E8 : "Oh, you're cute!{N}(Cough)...well...{W1}"
		nextSingleText $0,$88   ; "Oh, you're cute!{N}(Cough)...well...{W1}"
		nextText $0,$88         ; "May I paint your portrait?"
cs_5D65E:       textCursor $7EB         ; Initial text line $7EB : "Excellent!{W1}"
		yesNo                   ; 0011 STORY YESNO PROMPT
		jumpIfFlagClear $59,cs_5D712; YES/NO prompt answer
		hideText                ; 0009 HIDE TEXTBOX AND PORTRAIT
		nextSingleText $0,$88   ; "Excellent!{W1}"
		nextSingleText $0,$88   ; "Then, would you stand over{N}there, in front of the{N}flowers?{W1}"
		setActscript $7,$FF,eas_Init; 0015 SET ACTSCRIPT 7 FF 460CE
		setActscript $1F,$FF,eas_Init; 0015 SET ACTSCRIPT 1F FF 460CE
		setEntityDest $0,$1C,$3 ; 0029 SET ENTITY DEST 0 1C 3
		setEntityDir $0,$3      ; 0023 SET ENTITY FACING 0 3
		setEntityDest $7,$1B,$4 ; 0029 SET ENTITY DEST 7 1B 4
		setEntityDest $1F,$1B,$5; 0029 SET ENTITY DEST 1F 1B 5
		setEntityDir $88,$1     ; 0023 SET ENTITY FACING 88 1
		setActscript $88,$FF,eas_46172; 0015 SET ACTSCRIPT 88 FF 46172
		moveEntity $88,$FF,$2,$1; 002D MOVE ENTITY 88 FF 2 1
		endMove $8080
		moveEntity $88,$FF,$0,$1; 002D MOVE ENTITY 88 FF 0 1
		endMove $8080
		csWait $3C              ; WAIT 3C
		moveEntity $88,$FF,$2,$1; 002D MOVE ENTITY 88 FF 2 1
		endMove $8080
		csWait $1E              ; WAIT 1E
		moveEntity $88,$FF,$0,$1; 002D MOVE ENTITY 88 FF 0 1
		endMove $8080
		moveEntity $88,$FF,$2,$1; 002D MOVE ENTITY 88 FF 2 1
		endMove $8080
		moveEntity $88,$FF,$0,$1; 002D MOVE ENTITY 88 FF 0 1
		endMove $8080
		csWait $3C              ; WAIT 3C
		setActscript $88,$FF,eas_Init2; 0015 SET ACTSCRIPT 88 FF 46102
		setEntityDir $88,$1     ; 0023 SET ENTITY FACING 88 1
		nextSingleText $0,$88   ; "Finished!{W1}"
		moveEntity $88,$FF,$0,$1; 002D MOVE ENTITY 88 FF 0 1
		endMove $8080
		setEntityDir $88,$2     ; 0023 SET ENTITY FACING 88 2
		followEntity $7,$0,$2   ; 002C FOLLOW ENTITY 7 0 2
		followEntity $1F,$7,$2  ; 002C FOLLOW ENTITY 1F 7 2
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_5D712:       textCursor $7EA         ; Initial text line $7EA : "Oh, please!  It won't take{N}long.  Will you pose{N}for me?"
		hideText                ; 0009 HIDE TEXTBOX AND PORTRAIT
		nextText $0,$88         ; "Oh, please!  It won't take{N}long.  Will you pose{N}for me?"
		jump cs_5D65E           ; 000B JUMP 5D65E
		csc_end                 ; END OF CUTSCENE SCRIPT
byte_5D724:     textCursor $7EE         ; Initial text line $7EE : "It's you!{W2}"
		nextText $0,$88         ; "It's you!{W2}"
		nextSingleText $0,$88   ; "Ah, how talented I am!{N}Hmmmm?{W1}"
		csc_end                 ; END OF CUTSCENE SCRIPT
cs_5D732:       executeSubroutine sub_5D73E; 000A EXECUTE SUBROUTINE 5D73E
		csWait $B4              ; WAIT B4
		hideText                ; 0009 HIDE TEXTBOX AND PORTRAIT
		csc_end                 ; END OF CUTSCENE SCRIPT

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

