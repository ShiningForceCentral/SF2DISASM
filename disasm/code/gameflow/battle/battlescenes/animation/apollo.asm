
; ASM FILE code\gameflow\battle\battlescenes\animation\apollo.asm :
; 0x1B0D0..0x1B21A : Battlescene engine

; =============== S U B R O U T I N E =======================================


spellanimationSetup_Apollo:
                
                bsr.w   ClearSpellanimationProperties
                bclr    #6,((byte_FFB56E-$1000000)).w
                moveq   #SUMMON_APOLLO,d0
                bsr.w   LoadInvocationSpell
                sndCom  SFX_INTRO_LIGHTNING
                lea     ((SPRITE_20-$1000000)).w,a0
                moveq   #$15,d0
loc_1B0EA:
                
                move.l  a0,-(sp)
                moveq   #$F,d1
loc_1B0EE:
                
                addq.w  #8,(a0)
                addq.w  #8,a0
                dbf     d1,loc_1B0EE
				
                movea.l (sp)+,a0
                jsr     (WaitForVInt).w
                dbf     d0,loc_1B0EA
                moveq   #SUMMON_APOLLO,d0
                moveq   #1,d1
                bsr.w   LoadInvocationSpriteFrameToVram
                moveq   #30,d0
                jsr     (Sleep).w       
                bchg    #6,((byte_FFB56E-$1000000)).w
                bsr.w   sub_1A3E8
                moveq   #SUMMON_APOLLO,d0
                moveq   #2,d1
                bsr.w   LoadInvocationSpriteFrameToVram
                moveq   #SPELLGRAPHICS_APOLLO,d0
                bsr.w   LoadSpellGraphicsForInvocation
                lea     (FF8B04_LOADING_SPACE).l,a0
                lea     ($3000).w,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                lea     (FF8D04_LOADING_SPACE).l,a0
                lea     ($4200).w,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                lea     (FF8F04_LOADING_SPACE).l,a0
                lea     ($B400).l,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                lea     (FF9104_LOADING_SPACE).l,a0
                lea     ($DE00).l,a1
                move.w  #$100,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (WaitForDmaQueueProcessing).w
                moveq   #$26,d0 ; offset to sprite_38
                lea     table_1B1FA(pc), a0
                bsr.w   sub_19F5E
                jsr     (WaitForVInt).w
                sndCom  SFX_BATTLEFIELD_DEATH
                lea     ((SPRITE_38-$1000000)).w,a0
                moveq   #$13,d0
                moveq   #1,d1
loc_1B1A4:
                
                move.w  (a0),d2
                exg     d1,d2
                move.w  d2,(a0)
                jsr     (WaitForVInt).w
                dbf     d0,loc_1B1A4
				
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.w  #2,4(a0)
                moveq   #1,d0
                bsr.w   sub_1A2F6       
                move.l  #table_ApolloBackgroundModification,((BATTLESCENE_BACKGROUND_MODIFICATION_POINTER-$1000000)).w
                move.w  #1,((word_FFB3C4-$1000000)).w
                move.b  #5,((byte_FFB583-$1000000)).w
                move.w  #-1,((byte_FFB404-$1000000)).w
                move.b  #SPELLANIMATION_APOLLO,((CURRENT_SPELLANIMATION-$1000000)).w
                move.b  #1,((byte_FFB585-$1000000)).w
                move.b  #2,((UPDATE_SPELLANIMATION_TOGGLE-$1000000)).w
                move.b  #1,((byte_FFB588-$1000000)).w
                bra.w   sub_1A028

    ; End of function spellanimationSetup_Apollo

table_1B1FA:    vdpSpell 274, 203, TILE1920, V2|H2|32
                
table_ApolloBackgroundModification:
                dc.b 0
                dc.b 56
                dc.b 8
                dc.b 96
                dc.b 0
                dc.b 1
                dc.b -78
                dc.b 10
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 2
                dc.b 0
                dc.b 1
                dc.b 0
                dc.b 0
                dc.b -1
                dc.b -1
                dc.b -1
                dc.b -2
                dc.b -1
                dc.b -1
                dc.b 0
                dc.b 0
