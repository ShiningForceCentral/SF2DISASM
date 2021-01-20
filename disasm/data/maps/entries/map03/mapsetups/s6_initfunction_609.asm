
; ASM FILE data\maps\entries\map03\mapsetups\s6_initfunction_609.asm :
; 0x513C0..0x513D6 : 

; =============== S U B R O U T I N E =======================================


ms_map3_flag609_InitFunction:
                
                 
                chkFlg  3               ; Jaha joined
                beq.s   return_513CC
                script  cs_513CE
return_513CC:
                
                rts

    ; End of function ms_map3_flag609_InitFunction

cs_513CE:       hide ALLY_JAHA
                csc_end

; =============== S U B R O U T I N E =======================================


nullsub_513D4:
                
                rts

    ; End of function nullsub_513D4

