
; ASM FILE code\gameflow\battle\battlescenes\animation\bolt.asm :
; 0x1AA90..0x1AB9E : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Bolt:
                
                bsr.w   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BOLT_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_BOLT,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                lea     loc_1AB4A(pc), a1
                andi.w  #7,d1
                lsl.w   #2,d1
                adda.w  d1,a1
                move.l  (a1),((byte_FFB532-$1000000)).w
                moveq   #$10,d0
                btst    #SPELLANIMATION_BIT_MIRRORED,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.s   loc_1AACC
                addi.w  #$80,d0 
loc_1AACC:
                
                move.w  d0,((dword_FFB536-$1000000)).w
                move.w  (a1),d1
                subq.w  #1,d1
loc_1AAD4:
                
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                moveq   #$20,d6 
                jsr     (GenerateRandomNumber).w
                addq.w  #1,d7
                move.w  d7,4(a0)
                dbf     d1,loc_1AAD4
                move.w  2(a1),d1
                beq.s   loc_1AB2C
                subq.w  #1,d1
                move.w  (a1),d0
                mulu.w  #5,d0
                addi.w  #$26,d0 
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
                bsr.w   sub_19F5E
                dbf     d1,loc_1AB0C
loc_1AB2C:
                
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BOLT,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  1(a1),((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
loc_1AB4A:
                
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Bolt

                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 3
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 4
                dc.b 0
                dc.b 4
table_1AB5E:    dc.b 0
                dc.b $C8
                dc.b 0
                dc.b $C0
                dc.b 5
                dc.b $B3
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $98
                dc.b 0
                dc.b $D8
                dc.b 5
                dc.b $C3
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $F8
                dc.b 0
                dc.b $C8
                dc.b 5
                dc.b $B3
                dc.b $F
                dc.b $20
                dc.b 1
                dc.b $30
                dc.b 0
                dc.b $B8
                dc.b 5
                dc.b $C3
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $F8
                dc.b 0
                dc.b $C8
                dc.b 5
                dc.b $B3
                dc.b $F
                dc.b $20
                dc.b 1
                dc.b $30
                dc.b 0
                dc.b $B8
                dc.b 5
                dc.b $C3
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $C8
                dc.b 0
                dc.b $C0
                dc.b 5
                dc.b $B3
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b $98
                dc.b 0
                dc.b $D8
                dc.b 5
                dc.b $C3
                dc.b $F
                dc.b $20
