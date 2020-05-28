
; ASM FILE data\maps\entries\map39\mapsetups\s6_initfunction_33E.asm :
; 0x5E0E0..0x5E0F8 : 

; =============== S U B R O U T I N E =======================================

ms_map39_flag33E_InitFunction:
                
                 
                chkFlg  $344            ; Set after the scene where Zynk stops you as you leave the Moun underground
                bne.s   return_5E0EC
                script  cs_5E0EE
return_5E0EC:
                
                rts

    ; End of function ms_map39_flag33E_InitFunction

cs_5E0EE:       newEntity ALLY_ZYNK,4,12,UP,MAPSPRITE_TAROS
                csc_end
