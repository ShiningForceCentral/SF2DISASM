
; ASM FILE code\gameflow\battle\battlescenes\animation\buff.asm :
; 0x1AB9E..0x1ABF4 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Buff1:
                
                move.w  #-2,d0
                moveq   #30,d1
                bra.w   loc_1ABAC

    ; End of function spellanimationSetup_Buff1


; =============== S U B R O U T I N E =======================================


spellanimationSetup_Buff2:
                
                moveq   #2,d0
                moveq   #2,d1

    ; End of function spellanimationSetup_Buff2


; START OF FUNCTION CHUNK FOR spellanimationSetup_Buff1

loc_1ABAC:
                
                movem.w d0-d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BUFF_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                movem.w (sp)+,d0-d1
                move.w  d0,((byte_FFB532-$1000000)).w
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #1,2(a0)
                move.w  d1,4(a0)
                move.w  #$11D,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BUFF1,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   sub_1A028

; END OF FUNCTION CHUNK FOR spellanimationSetup_Buff1

