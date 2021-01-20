
; ASM FILE data\maps\entries\map06\mapsetups\s6_initfunction.asm :
; 0x54E54..0x54E86 : 

; =============== S U B R O U T I N E =======================================


ms_map6_InitFunction:
                
                 
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                beq.s   byte_54E62      
                script  cs_54E70
                rts
byte_54E62:
                
                chkFlg  706             ; Set after the scene with the sailor and soldier in New Granseal (Peter intro)
                beq.s   return_54E6E
                script  cs_54E78
return_54E6E:
                
                rts

    ; End of function ms_map6_InitFunction

cs_54E70:       setPos 132,11,18,DOWN
                csc_end
cs_54E78:       setPos 138,63,63,DOWN
                setPos 139,15,23,DOWN
                csc_end
