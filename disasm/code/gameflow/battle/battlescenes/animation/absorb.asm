
; ASM FILE code\gameflow\battle\battlescenes\animation\absorb.asm :
; 0x1ACD8..0x1ACE4 : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Absorb:
                
                 
                sndCom  SFX_WARP
                move.w  #ABSORB_FLASH_COLOR,d0
                bra.w   ExecuteSpellcastFlashEffect

    ; End of function spellanimationSetup_Absorb

