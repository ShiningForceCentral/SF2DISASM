
; ASM FILE data\maps\entries\map42\mapsetups\s6.asm :
; 0x5FE98..0x5FF62 : 

; =============== S U B R O U T I N E =======================================

ms_map42_InitFunction:
		
		rts

	; End of function ms_map42_InitFunction

cs_5FE9A:       textCursor $D09
		nextText $FF,$FF        ; "The Jewel of Light begins{N}to glow.{W2}"
		nextSingleText $FF,$FF  ; "The light seems to pull{N}{LEADER}.{D3}"
		setActscriptWait $0,eas_Init
		entityActionsWait $0
		 moveDown 1
		 moveDown 1
		 moveRight 1
		 moveRight 1
		 moveRight 1
		 moveRight 1
		endActions
		entityActionsWait $0
		 moveRight 1
		 moveRight 1
		 moveRight 1
		 moveUp 1
		 moveUp 1
		endActions
		entityActionsWait $0
		 moveUp 1
		 moveUp 1
		endActions
		csWait 60
		nextSingleText $FF,$FF  ; "The jewel glows even{N}brighter.{W1}"
		hideText
		csWait 40
		flashScreenWhite $14
		playSound SFX_BATTLEFIELD_DEATH
		setQuake 2
		setBlocks 33,1,1,1,26,18
		csWait 20
		setQuake 0
		csWait 60
		nextSingleText $0,$1F   ; "Oh, an opening!{N}The light is leading us!{W1}"
		csc_end
cs_5FF06:       textCursor $D07
		hideText
		entityFlashWhite $0,$3C
		setBlocks 33,2,1,1,39,2
		newEntity $80,39,2,DOWN,$B4
		setActscript $80,eas_AnimSpeedx2
		executeSubroutine csub_5FF56
		hide $80
		setQuake 2
		setBlocks 0,32,7,6,0,0
		csWait 60
		playSound SFX_BATTLEFIELD_DEATH
		csWait 20
		setQuake 0
		nextSingleText $FF,$FF  ; "Sounds like something opened{N}somewhere.{W1}"
		nextSingleText $0,$1F   ; "You got it!  All we have to{N}do is find the door to the{N}tower!{W1}"
		csc_end

; =============== S U B R O U T I N E =======================================

csub_5FF56:
		move.w  #$43,d0 
		moveq   #1,d1
		jmp     sub_4F48A

	; End of function csub_5FF56

