
; ASM FILE code\gameflow\battle\battlescenes\animation\dao.asm :
; 0x1B012..0x1B0D0 : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Dao:
                
                bsr.w   ClearSpellanimationProperties
                bclr    #6,((byte_FFB56E-$1000000)).w
                clr.w   d0
                bsr.w   LoadInvocationSpell
                moveq   #1,d1
                moveq   #6,d2
loc_1B026:
                
                movem.w d1-d2,-(sp)
                cmpi.w  #1,d2
                beq.s   byte_1B036
                jsr     (WaitForVInt).w
                bra.s   loc_1B040
byte_1B036:
                
                sndCom  SFX_INTRO_LIGHTNING
                moveq   #20,d0
                jsr     (Sleep).w       
loc_1B040:
                
                clr.w   d0
                bsr.w   LoadInvocationSpriteFrameToVram
                bchg    #6,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1A3E8
                movem.w (sp)+,d1-d2
                addq.w  #1,d1
                dbf     d2,loc_1B026
                
                moveq   #SPELLGRAPHICS_DAO,d0
                bsr.w   LoadSpellGraphics
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #$5A,((byte_FFB532-$1000000)).w 
                lea     (FF8804_LOADING_SPACE).l,a0
                move.w  #1023,d0
@ClearLoadingSpace_Loop:
                
                clr.l   (a0)+
                dbf     d0,@ClearLoadingSpace_Loop
                
                move.l  #table_DaoBackgroundModification,((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.l  #table_DaoBattlespriteModification,((BATTLESCENE_BATTLESPRITE_MODIFICATION_POINTER-$1000000)).w
                move.w  #$A,((word_FFB3CA-$1000000)).w
                move.b  #$F,((byte_FFB583-$1000000)).w
                move.b  #1,((byte_FFB56B-$1000000)).w
                bclr    #3,((byte_FFB56E-$1000000)).w
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_DAO,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #1,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Dao

table_DaoBackgroundModification:
                dc.b 4
                dc.b 1
table_DaoBattlespriteModification:
                dc.b 3
                dc.b 20
