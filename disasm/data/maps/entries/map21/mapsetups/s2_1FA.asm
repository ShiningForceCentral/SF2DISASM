
; ASM FILE data\maps\entries\map21\mapsetups\s2_1FA.asm :
; 0x53EAA..0x53F06 : 
ms_map21_flag1FA_EntityEvents:
		dc.w $FD00
		dc.w nullsub_126-ms_map21_flag1FA_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_53EAE:
		trap    #CHECK_FLAG
		dc.w $260               ; set after agreeing to go to the tower with Astral
		bne.s   loc_53EC8
		trap    #CHECK_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
		bne.s   loc_53EC2
		trap    #TEXTBOX
		dc.w $238               ; "This west tower leads to{N}the Ancient Tower.{W2}"
		trap    #SET_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
loc_53EC2:
		trap    #TEXTBOX
		dc.w $239               ; "The Ancient Tower is a{N}sacred place where only the{N}King can go.{W1}"
		bra.s   return_53EDC
loc_53EC8:
		trap    #TEXTBOX
		dc.w $243               ; "Sir Astral is already{N}inside the tower.  Hurry!{W1}"
		trap    #CHECK_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
		bne.s   return_53EDC
		lea     cs_53EF4(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
return_53EDC:
		rts

	; End of function sub_53EAE


; =============== S U B R O U T I N E =======================================

sub_53EDE:
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
		trap    #TEXTBOX
		dc.w $244               ; "He's fainted.{W1}"
		rts

	; End of function sub_53EDE


; =============== S U B R O U T I N E =======================================

sub_53EEE:
		trap    #TEXTBOX
		dc.w $245               ; "It was a devil!{N}I don't want to stand{N}here any more!{W2}{N}Hey, you!  Can you stand{N}guard for me here?{W1}"
nullsub_126:
		rts

	; End of function sub_53EEE

cs_53EF4:       moveEntity $80,$FF,$0,$1; 002D MOVE ENTITY 80 FF 0 1
		endMove $8080
		setEntityDir $87,$3     ; 0023 SET ENTITY FACING 87 3
		setStoryFlag $1         ; Battle 1 unlocked
		csc_end                 ; END OF CUTSCENE SCRIPT
