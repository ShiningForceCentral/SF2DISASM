
; ASM FILE data\maps\entries\map21\mapsetups\s6_initfunction.asm :
; 0x53F10..0x53F48 : 

; =============== S U B R O U T I N E =======================================

ms_map21_InitFunction:
                
                 
                chkFlg  $1F5            ; Battle 1 completed
                beq.s   byte_53F1C      
                script  cs_53F2A
byte_53F1C:
                
                chkFlg  $1FB            ; Battle 7 completed
                beq.s   return_53F28
                script  cs_53FD8
return_53F28:
                
                rts

    ; End of function ms_map21_InitFunction

cs_53F2A:       customActscriptWait 128
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPos 128,6,16,DOWN
                csc_end
