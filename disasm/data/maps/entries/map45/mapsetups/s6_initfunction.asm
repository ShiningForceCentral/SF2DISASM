
; ASM FILE data\maps\entries\map45\mapsetups\s6_initfunction.asm :
; 0x60098..0x600CE : 

; =============== S U B R O U T I N E =======================================


ms_map45_InitFunction:
                
                 
                chkFlg  25              ; Shiela joined
                beq.s   byte_600AA
                move.w  #$19,d0
                jsr     MoveEntityOutOfMap
                bra.s   return_600B0
byte_600AA:
                
                script  cs_600B2
return_600B0:
                
                rts

    ; End of function ms_map45_InitFunction

cs_600B2:       setActscriptWait ALLY_SHEELA,eas_Immersed
                setSprite ALLY_SHEELA,MAPSPRITE_POSE7
                setActscriptWait ALLY_SHEELA,eas_InitFixedSprite
                setFacing ALLY_SHEELA,UP
                csc_end
