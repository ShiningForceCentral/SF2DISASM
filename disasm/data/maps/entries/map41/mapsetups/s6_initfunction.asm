
; ASM FILE data\maps\entries\map41\mapsetups\s6_initfunction.asm :
; 0x5F4A0..0x5F4B8 : 

; =============== S U B R O U T I N E =======================================


ms_map41_InitFunction:
                
                 
                chkFlg  930             ; Set after opening Devil's Head with the Force Sword
                beq.s   return_5F4AC
                script  cs_5F4AE
return_5F4AC:
                
                rts

    ; End of function ms_map41_InitFunction

cs_5F4AE:       setBlocks 13,0,3,5,5,4
                csc_end
