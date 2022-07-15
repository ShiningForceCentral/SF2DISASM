
; ASM FILE data\maps\entries\map25\mapsetups\s6_initfunction.asm :
; 0x5D39C..0x5D3B8 : 

; =============== S U B R O U T I N E =======================================


ms_map25_InitFunction:
                
                 
                chkFlg  800             ; Set after the merchant in Ketto runs to his store
                beq.s   return_5D3A8
                script  cs_5D3AA
return_5D3A8:
                
                rts

    ; End of function ms_map25_InitFunction

cs_5D3AA:       setPos 133,25,18,RIGHT
                setPos 135,25,17,RIGHT
                csc_end
