
; ASM FILE data\maps\entries\map40\mapsetups\s6_initfunction.asm :
; 0x53FCA..0x53FFE : 

; =============== S U B R O U T I N E =======================================

ms_map40_InitFunction:
                
                 
                chkFlg  $1FB            ; Battle 7 completed
                beq.s   return_53FD6
                script  cs_53FD8
return_53FD6:
                
                rts

	; End of function ms_map40_InitFunction

cs_53FD8:       playSound MUSIC_BOSS_ATTACK
                fadeInB
                csc_end
cs_53FE0:       textCursor $3E5
                shiver $1C
                nextText $0,$1C         ; "Oh....{N}Go and save her....{W2}"
                nextText $0,$1C         ; "Sir Astral was right....{N}That's not my King.{N}That's a devil!{W2}"
                nextSingleText $0,$1C   ; "Me?  I'm almost a goner.{N}A strange black cloud{N}enveloped me...(cough)....{W1}"
                shiver $1C
                stopEntity $1C
                csc_end
