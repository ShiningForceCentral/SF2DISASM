
; ASM FILE data\maps\entries\map20\mapsetups\s6_initfunction_543.asm :
; 0x633A2..0x633C4 : 

; =============== S U B R O U T I N E =======================================


ms_map20_flag543_InitFunction:
                
                 
                chkFlg  982
                beq.s   byte_633BA
                script  cs_633B2
                bra.w   byte_633BA
cs_633B2:
                
                setPos 128,27,50,LEFT
                csc_end
byte_633BA:
                
                sndCom  MUSIC_TOWN
                jsr     (FadeInFromBlack).w
                rts

    ; End of function ms_map20_flag543_InitFunction

