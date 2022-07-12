
; ASM FILE data\maps\entries\map31\mapsetups\s6_initfunction_830.asm :
; 0x5D61E..0x5D644 : 

; =============== S U B R O U T I N E =======================================


ms_map31_flag830_InitFunction:
                
                 
                chkFlg  832             ; Set after talking to the painter in Moun for the first time
                beq.s   byte_5D62A      
                script  cs_5D63C
byte_5D62A:
                
                chkFlg  834             ; Set after making the Arm of Golem appear in Moun
                beq.s   return_5D63A
                chkFlg  835             ; Set after picking up the Arm of Golem in Moun
                bne.s   return_5D63A
                clrFlg  834             ; Set after making the Arm of Golem appear in Moun
return_5D63A:
                
                rts

    ; End of function ms_map31_flag830_InitFunction

cs_5D63C:       setPos 136,30,6,LEFT
                csc_end
