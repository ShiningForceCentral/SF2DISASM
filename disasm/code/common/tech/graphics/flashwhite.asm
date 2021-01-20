
; ASM FILE code\common\tech\graphics\flashwhite.asm :
; 0x47EEA..0x47EF8 : Flash white function and script

; =============== S U B R O U T I N E =======================================


ExecuteFlashScreenScript:
                
                 
                script  cs_FlashScreen
                rts

    ; End of function ExecuteFlashScreenScript

cs_FlashScreen: dc.w $41
                dc.w $1E
                dc.w $FFFF
