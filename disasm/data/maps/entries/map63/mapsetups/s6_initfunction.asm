
; ASM FILE data\maps\entries\map63\mapsetups\s6_initfunction.asm :
; 0x5CA50..0x5CA6E : 

; =============== S U B R O U T I N E =======================================


ms_map63_InitFunction:
                
                 
                chkFlg  29              ; Claude joined
                bne.s   return_5CA5C
                script  cs_5CA5E
return_5CA5C:
                
                rts

    ; End of function ms_map63_InitFunction

cs_5CA5E:       setSprite ALLY_CLAUDE,MAPSPRITE_POSE3
                setFacing ALLY_CLAUDE,DOWN
                stopEntity ALLY_CLAUDE
                csc_end
