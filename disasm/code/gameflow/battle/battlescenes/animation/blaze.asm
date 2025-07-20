
; ASM FILE code\gameflow\battle\battlescenes\animation\blaze.asm :
; 0x1A47A..0x1A654 : 

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Blaze:
                
                bsr.s   nullsub_1A476
                move.w  d1,-(sp)
                sndCom  SFX_SPELL_CAST
                move.w  #BLAZE_FLASH_COLOR,d0
                bsr.w   ExecuteSpellcastFlashEffect
                bsr.w   ClearSpellanimationProperties
                moveq   #SPELLGRAPHICS_BLAZE,d0
                bsr.w   LoadSpellGraphics
                move.w  (sp)+,d1
                btst    #SPELLANIMATION_BIT_MIRRORED,d1
                bne.s   @Mirrored
                lea     loc_1A58A(pc), a1
                bra.s   @Continue
@Mirrored:
                
                lea     table_1A5B2(pc), a1
@Continue:
                
                andi.w  #7,d1
                add.w   d1,d1
                move.w  d1,d2
                lsl.w   #2,d1
                add.w   d2,d1
                adda.w  d1,a1
                move.l  (a1),((byte_FFB532-$1000000)).w
                move.l  4(a1),((dword_FFB536-$1000000)).w
                move.w  8(a1),((byte_FFB53A-$1000000)).w
                clr.w   d2
                move.b  1(a1),d2
                clr.w   d3
                move.b  2(a1),d3
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #5,2(a0)
                moveq   #2,d0
                bsr.w   sub_1A2F6       
                lea     table_1A5E4(pc), a0
                clr.w   d0
                move.b  (a1),d0
                lsl.w   #NIBBLE_SHIFT_COUNT,d0
                adda.w  d0,a0
                moveq   #$26,d0 
                moveq   #2,d1
                bsr.w   sub_19FAA       
                clr.w   d1
                move.b  5(a1),d1
                beq.s   loc_1A52A
                subq.w  #1,d1
@Loop:
                
                moveq   #$F,d6
                jsr     (GenerateRandomNumber).w
                move.w  d7,d0
                andi.w  #1,d0
                addq.w  #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$10,d6
                jsr     (GenerateRandomNumber).w
                move.w  d1,d4
                lsl.w   #3,d4
                add.w   d4,d7
                addq.w  #1,d7
                move.b  d7,3(a0)
                dbf     d1,@Loop
loc_1A52A:
                
                btst    #2,((SPELLANIMATION_VARIATION_AND_MIRRORED_BIT-$1000000)).w
                beq.w   loc_1A56E
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$40,2(a0) 
                move.w  #$40,4(a0) 
                move.w  #$80,6(a0) 
                moveq   #$1F,d0
                lea     ((byte_FFB496-$1000000)).w,a0
loc_1A552:
                
                move.w  d2,(a0)
                addi.w  #$80,(a0)+ 
                move.w  d3,(a0)
                addi.w  #$80,(a0)+ 
                dbf     d0,loc_1A552
                moveq   #$2C,d0 
                moveq   #8,d1
                lea     table_1A614(pc), a0
                bsr.w   sub_19FAA       
loc_1A56E:
                
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_BLAZE,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  5(a1),d0
                addq.b  #1,d0
                move.b  d0,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
loc_1A58A:
                
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Blaze

table_1A594:    dc.b 0
                dc.b $48
                dc.b $70
                dc.b $70
                dc.b 0
                dc.b 0
                dc.b $50
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b $44
                dc.b $60
                dc.b $80
                dc.b 0
                dc.b $A
                dc.b $50
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b $40
                dc.b $50
                dc.b $70
                dc.b 1
                dc.b $E
                dc.b $50
                dc.b 0
                dc.b 0
                dc.b 0
table_1A5B2:    dc.b 2
                dc.b $40
                dc.b $50
                dc.b $70
                dc.b 1
                dc.b 4
                dc.b $50
                dc.b $20
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b $B0
                dc.b $80
                dc.b $80
                dc.b 0
                dc.b 0
                dc.b $30
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b $AC
                dc.b $70
                dc.b $90
                dc.b 0
                dc.b $A
                dc.b $30
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b $A8
                dc.b $60
                dc.b $80
                dc.b 1
                dc.b $E
                dc.b $30
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 2
                dc.b $A8
                dc.b $60
                dc.b $80
                dc.b 1
                dc.b 4
                dc.b $30
                dc.b $80
                dc.b $20
                dc.b 0
table_1A5E4:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $41
                dc.b 7
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $41
                dc.b 7
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $51
                dc.b $B
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $5D
                dc.b 9
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $75
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b $20
                dc.b 5
                dc.b $85
                dc.b $F
                dc.b $20
table_1A614:    dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $31
                dc.b $F
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $28
                dc.b $A
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $24
                dc.b 5
                dc.b $20
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 0
                dc.b 5
                dc.b $20
                dc.b 5
                dc.b $20
