
; ASM FILE data\maps\entries\map40\mapsetups\s6.asm :
; 0x53FCA..0x53FFE : 

; =============== S U B R O U T I N E =======================================

ms_map40_InitFunction:
		
		trap    #CHECK_FLAG
		dc.w $1FB               ; Battle 7 completed
		beq.s   return_53FD6
		lea     cs_53FD8(pc), a0
		trap    #6
return_53FD6:
		rts

	; End of function ms_map40_InitFunction

cs_53FD8:       playSound MUSIC_BOSS_ATTACK; 0005 PLAY SOUND MUSIC_BOSS_ATTACK
		fadeInB                 ; 0039 FADE IN FROM BLACK
		csc_end
cs_53FE0:       textCursor $3E5         ; 0004 INIT TEXT CURSOR 3E5 : "Oh....{N}Go and save her....{W2}"
		entityShiver $1C        ; 002A MAKE ENTITY SHIVER 1C
		nextText $0,$1C         ; "Oh....{N}Go and save her....{W2}"
		nextText $0,$1C         ; "Sir Astral was right....{N}That's not my King.{N}That's a devil!{W2}"
		nextSingleText $0,$1C   ; "Me?  I'm almost a goner.{N}A strange black cloud{N}enveloped me...(cough)....{W1}"
		entityShiver $1C        ; 002A MAKE ENTITY SHIVER 1C
		stopEntity $1C          ; 001C STOP ENTITY ANIM 1C
		csc_end
