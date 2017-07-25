
; ASM FILE data\maps\entries\map31\mapsetups\s4.asm :
; 0x5D574..0x5D60E : 

; =============== S U B R O U T I N E =======================================

ms_map31_AreaDescriptions:
		
		move.w  #$1045,d3
		lea     word_5D584(pc), a0
		nop
		jmp     DisplayAreaDescription

	; End of function ms_map31_AreaDescriptions

word_5D584:
		dc.w $81A
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 0
		dc.w $1416
		dc.b 0
		dc.b 0
		dc.b 4
		dc.b 1
		dc.w $421
		dc.b 0
		dc.b 0
		dc.b 5
		dc.b 2
		dc.w $1912
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 3
		dc.w $1A12
		dc.b 0
		dc.b 0
		dc.b 2
		dc.b 4
		dc.w $1D05
		dc.b 0
		dc.b 1
		dc.w sub_5D5B0-word_5D584
		dc.w $803
		dc.b 1
		dc.b 1
		dc.w sub_5D5BE-word_5D584
		dc.w $FD00

; =============== S U B R O U T I N E =======================================

sub_5D5B0:
		
		trap    #CHECK_FLAG
		dc.w $340
		beq.s   return_5D5BC
		lea     cs_5D732(pc), a0
		trap    #6
return_5D5BC:
		
		rts

	; End of function sub_5D5B0


; =============== S U B R O U T I N E =======================================

sub_5D5BE:
		
		trap    #CHECK_FLAG
		dc.w $342
		beq.s   return_5D60C
		trap    #CHECK_FLAG
		dc.w $343
		bne.s   return_5D60C
		trap    #TEXTBOX
		dc.w $7E1               
						; "{LEADER} found the Arm of{N}Golem.{W2}"
		trap    #TEXTBOX
		dc.w $7E2               
						; "Pick it up?"
		jsr     j_YesNoPrompt
		tst.w   d0
		bne.s   loc_5D608
		move.w  #$75,d0 
		moveq   #0,d1
		jsr     sub_4F48A       
		btst    #0,d0
		bne.s   loc_5D5FE
		trap    #SET_FLAG
		dc.w $343               
						; set after picking up the Arm of Golem in Moun
		move.w  #$89,d0 
		jsr     MoveEntityOutOfMap
		bra.s   loc_5D606
loc_5D5FE:
		
		trap    #TEXTBOX
		dc.w $7E4               
						; "But {LEADER}'s hands{N}are full.{W1}"
		trap    #TEXTBOX
		dc.w $7E7               
						; "{LEADER} looks at the{N}Arm of Golem.{W1}"
loc_5D606:
		
		bra.s   return_5D60C
loc_5D608:
		
		trap    #TEXTBOX
		dc.w $7E7               
						; "{LEADER} looks at the{N}Arm of Golem.{W1}"
return_5D60C:
		
		rts

	; End of function sub_5D5BE

