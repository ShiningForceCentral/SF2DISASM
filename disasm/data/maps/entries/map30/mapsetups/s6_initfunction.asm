
; ASM FILE data\maps\entries\map30\mapsetups\s6_initfunction.asm :
; 0x5A2F2..0x5A33A : 

; =============== S U B R O U T I N E =======================================


ms_map30_InitFunction:
                
                 
                chkFlg  761             ; Set after the dwarf gives Bowie the cannon
                beq.s   byte_5A2FE      
                script  cs_5A30C
byte_5A2FE:
                
                chkFlg  760             ; Set after the fairy cures the sick dwarf in the mine
                bne.s   return_5A30A
                script  cs_5A31E
return_5A30A:
                
                rts

    ; End of function ms_map30_InitFunction

cs_5A30C:       setBlocks 21,6,2,2,7,5
                setBlocks 21,0,4,4,6,0
                csc_end
cs_5A31E:       customActscriptWait 130
                 ac_motion OFF          ;   
                 ac_orientRight         ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                stopEntity 130
                csc_end
