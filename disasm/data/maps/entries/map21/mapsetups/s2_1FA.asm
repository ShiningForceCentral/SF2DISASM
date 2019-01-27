
; ASM FILE data\maps\entries\map21\mapsetups\s2_1FA.asm :
; 0x53EAA..0x53F06 : 
ms_map21_flag1FA_EntityEvents:
		msDefaultEntityEvent 0, nullsub_126-ms_map21_flag1FA_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_53EAE:
		 
		chkFlg  $260            ; set after agreeing to go to the tower with Astral
		bne.s   byte_53EC8      
		chkFlg  $100            ; Temporary map setup flag 00
		bne.s   byte_53EC2      
		txt     $238            ; "This west tower leads to{N}the Ancient Tower.{W2}"
		setFlg  $100            ; Temporary map setup flag 00
byte_53EC2:
		txt     $239            ; "The Ancient Tower is a{N}sacred place where only the{N}King can go.{W1}"
		bra.s   return_53EDC
byte_53EC8:
		txt     $243            ; "Sir Astral is already{N}inside the tower.  Hurry!{W1}"
		chkFlg  $100            ; Temporary map setup flag 00
		bne.s   return_53EDC
		script  cs_53EF4
		setFlg  $100            ; Temporary map setup flag 00
return_53EDC:
		rts

	; End of function sub_53EAE


; =============== S U B R O U T I N E =======================================

sub_53EDE:
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		clr.w   ((CURRENT_SPEAK_SOUND-$1000000)).w
		txt     $244            ; "He's fainted.{W1}"
		rts

	; End of function sub_53EDE


; =============== S U B R O U T I N E =======================================

sub_53EEE:
		 
		txt     $245            ; "It was a devil!{N}I don't want to stand{N}here any more!{W2}{N}Hey, you!  Can you stand{N}guard for me here?{W1}"
nullsub_126:
		rts

	; End of function sub_53EEE

cs_53EF4:       entityActionsWait $80
		 moveRight 1
		endActions
		setFacing $87,DOWN
		setStoryFlag $1         ; Battle 1 unlocked
		csc_end
