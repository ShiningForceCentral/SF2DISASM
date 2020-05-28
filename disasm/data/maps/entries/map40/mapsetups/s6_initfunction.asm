
; ASM FILE data\maps\entries\map40\mapsetups\s6_initfunction.asm :
; 0x53FCA..0x53FE0 : 

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
