
; ASM FILE code\gameflow\battle\battlescenes\animation\debuff.asm :
; 0x1ABF4..0x1ACD8 : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Debuff1:
                
                lea     table_1ACC6(pc), a0
                bra.w   loc_1AC08

    ; End of function spellanimationSetup_Debuff1


; =============== S U B R O U T I N E =======================================


spellanimationSetup_Debuff2:
                
                lea     table_1ACCC(pc), a0
                bra.w   loc_1AC08

    ; End of function spellanimationSetup_Debuff2


; =============== S U B R O U T I N E =======================================


spellanimationSetup_Debuff3:
                
                lea     table_1ACD2(pc), a0

    ; End of function spellanimationSetup_Debuff3


; START OF FUNCTION CHUNK FOR spellanimationSetup_Debuff1

loc_1AC08:
                
                move.l  a0,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #DEBUFF_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_DEBUFF,d0
                bsr.w   LoadSpellGraphics
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
                bne.s   loc_1AC5C
                move.w  #$40,(a0)+ 
                move.w  #$20,(a0) 
                bra.s   loc_1AC64
loc_1AC5C:
                
                move.w  #$A8,(a0)+ 
                move.w  #$30,(a0) 
loc_1AC64:
                
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
                addi.w  #$C,d7
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
                bra.w   sub_1A028

; END OF FUNCTION CHUNK FOR spellanimationSetup_Debuff1

table_1ACC6:    dc.w $888
                dc.w $BBB
                dc.w $DDD
table_1ACCC:    dc.w $84E
                dc.w $EC6
                dc.w $FDA
table_1ACD2:    dc.w $84E
                dc.w $98E
                dc.w $DBF
