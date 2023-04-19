
; ASM FILE data\maps\entries\map37\mapsetups\s6_initfunction.asm :
; 0x5FA88..0x5FAA4 : 

; =============== S U B R O U T I N E =======================================


ms_map37_InitFunction:
                
                jsr     InitNazcaShipForceMembers
                chkFlg  836             ; Set after the scene where Zynk stops you as you leave the Moun underground
                beq.s   return_5FA9A
                script  cs_5FA9C
return_5FA9A:
                
                rts

    ; End of function ms_map37_InitFunction

cs_5FA9C:       setPos ALLY_ZYNK,8,10,RIGHT
                csc_end
