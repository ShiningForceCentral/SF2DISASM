
; ASM FILE data\maps\entries\map55\mapsetups\s6_initfunction.asm :
; 0x5E268..0x5E27C : 

; =============== S U B R O U T I N E =======================================


ms_map55_InitFunction:
                
                 
                chkFlg  999             ; Set after the Nazca ship shootdown scene
                beq.s   return_5E27A
                script  cs_5E320
                script  cs_5E346
return_5E27A:
                
                rts

    ; End of function ms_map55_InitFunction

