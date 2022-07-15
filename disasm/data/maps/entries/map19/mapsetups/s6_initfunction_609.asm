
; ASM FILE data\maps\entries\map19\mapsetups\s6_initfunction_609.asm :
; 0x5310C..0x5311E : 

; =============== S U B R O U T I N E =======================================


ms_map19_flag609_InitFunction:
                
                 
                chkFlg  610             ; Set after you agree to go to see Hawel
                bne.s   return_5311C
                script  cs_53176
                setFlg  610             ; Set after you agree to go to see Hawel
return_5311C:
                
                rts

    ; End of function ms_map19_flag609_InitFunction

