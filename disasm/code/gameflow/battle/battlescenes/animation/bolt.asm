
; ASM FILE code\gameflow\battle\battlescenes\animation\bolt.asm :
; 0x1AA90..0x1AB9E : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Bolt:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BOLT_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLTILESET_BOLT,d0
                bsr.w   LoadSpellTileset
                move.w  (sp)+,d1
                lea     (table_1AB4E-4)(pc), a1
                andi.w  #7,d1
                lsl.w   #2,d1
                adda.w  d1,a1 ; offset 4x variation #
                move.l  (a1),((byte_FFB532-$1000000)).w
                moveq   #$10,d0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   @Mirrored
                addi.w  #$80,d0 
@Mirrored:
                
                move.w  d0,((dword_FFB536-$1000000)).w
                move.w  (a1),d1
                subq.w  #1,d1
loc_1AAD4:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #32,d6 
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,4(a0)
                dbf     d1,loc_1AAD4
                
                move.w  2(a1),d1
                beq.s   loc_1AB2C
                subq.w  #1,d1
                move.w  (a1),d0
                mulu.w  #5,d0
                addi.w  #38,d0 ; add offset to sprite_38
                lea     table_1AB5E(pc), a0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1AB0C
                lea     $20(a0),a0
loc_1AB0C:
                
                movem.l d0/a0,-(sp)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #8,d6
                jsr     (GenerateRandomNumber).w
                move.w  d7,2(a0)
                movem.l (sp)+,d0/a0
                bsr.w   ConstructSimpleGraphic
                dbf     d1,loc_1AB0C
loc_1AB2C:
                
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BOLT,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  1(a1),((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   StoreBattlespritePalette

    ; End of function spellanimationSetup_Bolt

table_1AB4E:    ; Variation 1
                dc.w $1 ; max concurrent bolt strikes
                dc.w $0 ; number of lightning orbs
                
                ; Variation 2
                dc.w $2
                dc.w $1
                
                ; Variation 3
                dc.w $3
                dc.w $2
                
                ; Variation 4
                dc.w $4
                dc.w $4
                
table_1AB5E:    vdpSpell 200, 192, SPELLTILE148, V4|H4|VALUE2
                vdpSpell 152, 216, SPELLTILE164, V4|H4|VALUE2
                vdpSpell 248, 200, SPELLTILE148, V4|H4|VALUE2
                vdpSpell 304, 184, SPELLTILE164, V4|H4|VALUE2
                
                ; mirror animation
                vdpSpell 248, 200, SPELLTILE148, V4|H4|VALUE2
                vdpSpell 304, 184, SPELLTILE164, V4|H4|VALUE2
                vdpSpell 200, 192, SPELLTILE148, V4|H4|VALUE2
                vdpSpell 152, 216, SPELLTILE164, V4|H4|VALUE2
