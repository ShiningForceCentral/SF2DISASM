
; ASM FILE code\gameflow\battle\battlescenes\animation\debuff.asm :
; 0x1ABF4..0x1ACD8 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Debuff1:
                
                lea     palette_Debuff1(pc), a0
                bra.w   spellanimationSetup_Debuff

    ; End of function spellanimationSetup_Debuff1


; =============== S U B R O U T I N E =======================================


spellanimationSetup_Debuff2:
                
                lea     palette_Debuff2(pc), a0
                bra.w   spellanimationSetup_Debuff

    ; End of function spellanimationSetup_Debuff2


; =============== S U B R O U T I N E =======================================


spellanimationSetup_Debuff3:
                
                lea     palette_Debuff3(pc), a0

    ; End of function spellanimationSetup_Debuff3


; =============== S U B R O U T I N E =======================================

; In: a0 = palette location


spellanimationSetup_Debuff:
                
                move.l  a0,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #DEBUFF_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_DEBUFF,d0
                bsr.w   LoadSpellTileset
                movea.l (sp)+,a0
                lea     ((PALETTE_3_CURRENT-$1000000)).w,a1
                lea     ((PALETTE_3_BASE-$1000000)).w,a2
                move.w  (a0),$12(a1)
                move.w  (a0)+,$12(a2)
                move.w  (a0),$1A(a1)
                move.w  (a0)+,$1A(a2)
                move.w  (a0),$1C(a1)
                move.w  (a0),$1C(a2)
                jsr     (ApplyVIntCramDma).w
                lea     ((byte_FFB532-$1000000)).w,a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                bne.s   @Mirror
				
                move.w  #$40,(a0)+ ; x parameter
                move.w  #$20,(a0)  ; y parameter
                bra.s   @loc_2
@Mirror:
                
                move.w  #$A8,(a0)+ 
                move.w  #$30,(a0) 
@loc_2:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #1,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #4,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #6,d7
                move.w  d7,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #4,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #12,d7
                move.w  d7,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #4,d6
                jsr     (GenerateRandomNumber).w
                addi.w  #$12,d7
                move.w  d7,4(a0)
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DEBUFF1,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #4,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                bra.w   StoreBattlespritePalette

    ; End of function spellanimationSetup_Debuff

palette_Debuff1:    dc.w $888, $BBB, $DDD
palette_Debuff2:    dc.w $84E, $EC6, $FDA
palette_Debuff3:    dc.w $84E, $98E, $DBF
