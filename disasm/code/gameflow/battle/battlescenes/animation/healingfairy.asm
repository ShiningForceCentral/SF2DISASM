
; ASM FILE code\gameflow\battle\battlescenes\animation\healingfairy.asm :
; 0x1A848..0x1A928 : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_HealingFairy:
                
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #HEALING_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_HEALING,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                bclr    #7,d1
                bne.s   loc_1A874
                lea     table_1A908(pc), a0
                lea     table_1A8F4(pc), a1
                moveq   #7,d4
                bra.s   loc_1A87E
loc_1A874:
                
                lea     table_1A918(pc), a0
                lea     table_1A8FE(pc), a1
                moveq   #3,d4
loc_1A87E:
                
                lea     ((byte_FFB532-$1000000)).w,a2
                move.l  (a1)+,(a2)+
                move.l  (a1)+,(a2)+
                move.w  (a1),(a2)+
                subq.w  #1,d1
                bne.s   loc_1A88E
                moveq   #1,d1
loc_1A88E:
                
                move.w  d1,(a2)
                move.b  d1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                subq.w  #1,d1
                moveq   #$26,d0 
loc_1A898:
                
                movem.l d0-d1/a0,-(sp)
                moveq   #2,d1
                clr.w   d2
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                move.w  d7,d3
                bsr.w   sub_19FAA       
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  d4,2(a0)
                moveq   #$1E,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,8(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #$C,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,4(a0)
                movem.l (sp)+,d0-d1/a0
                addq.w  #2,d0
                dbf     d1,loc_1A898
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_HEALING_FAIRY,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_HealingFairy

table_1A8F4:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b $10
                dc.b 0
                dc.b $20
                dc.b 0
                dc.b $28
                dc.b 0
                dc.b $34
table_1A8FE:    dc.b 0
                dc.b $35
                dc.b 0
                dc.b $45
                dc.b 0
                dc.b $55
                dc.b 0
                dc.b $5D
                dc.b 0
                dc.b $69
table_1A908:    dc.b 1
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $30
                dc.b $F
                dc.b $20
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $40
                dc.b $D
                dc.b $20
table_1A918:    dc.b $FF
                dc.b $E0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $65
                dc.b $F
                dc.b $21
                dc.b $FF
                dc.b $E0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $75
                dc.b $D
                dc.b $21
