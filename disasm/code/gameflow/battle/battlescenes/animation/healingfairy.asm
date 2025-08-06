
; ASM FILE code\gameflow\battle\battlescenes\animation\healingfairy.asm :
; 0x1A848..0x1A928 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_HealingFairy:
                
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #HEALING_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_HEALING,d0
                bsr.w   LoadSpellTileset
                move.w  (sp)+,d1
                bclr    #SPELLANIMATION_BIT_MIRRORED,d1
                bne.s   @Enemy
                lea     table_LightFairy(pc), a0
                lea     table_LightFairy_offsets(pc), a1
                moveq   #7,d4
                bra.s   loc_1A87E
@Enemy:
                
                lea     table_EvilFairy(pc), a0
                lea     table_EvilFairy_offsets(pc), a1
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
                
                move.w  d1,(a2) ; number of fairies
                move.b  d1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                subq.w  #1,d1
                moveq   #38,d0   ; offset to sprite_38
@GenerateFairy_Loop:
                
                movem.l d0-d1/a0,-(sp)
                moveq   #2,d1
                clr.w   d2
                moveq   #32,d6 
                jsr     (GenerateRandomNumber).w
                move.w  d7,d3
                bsr.w   ConstructComplexGraphic       
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  d4,2(a0)
                moveq   #30,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,8(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #12,d6
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,4(a0)
                movem.l (sp)+,d0-d1/a0
                addq.w  #2,d0
                dbf     d1,@GenerateFairy_Loop
                
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_HEALING_FAIRY,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                bra.w   StoreBattlespritePalette

    ; End of function spellanimationSetup_HealingFairy

table_LightFairy_offsets:
                dc.w 0     ; fairy graphic 1
                dc.w $10   ; fairy graphic 2
                dc.w $20   ; wings graphic 1
                dc.w $28   ; wings graphic 2
                dc.w $34   ; dust graphic 5
                
table_EvilFairy_offsets:
                dc.w $35
                dc.w $45
                dc.w $55
                dc.w $5D
                dc.w $69
                
table_LightFairy:
                vdpSpell 256, 0, SPELLTILE17, V4|H4|VALUE2
                vdpSpell 256, 0, SPELLTILE33, V2|H4|VALUE2
                
table_EvilFairy:
                vdpSpell -32, 0, SPELLTILE70, V4|H4|VALUE2|MIRRORED
                vdpSpell -32, 0, SPELLTILE86, V2|H4|VALUE2|MIRRORED
