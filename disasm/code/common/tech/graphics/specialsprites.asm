
; ASM FILE code\common\tech\graphics\specialsprites.asm :
; 0x25BFC..0x25DF6 : Special Sprites functions
pt_SpecialSprites:
                dc.l SpecialSprites_Taros
                dc.l SpecialSprites_Kraken
                dc.l SpecialSprites_NazcaShip
                dc.l SpecialSprites_EvilSpirit
                dc.l SpecialSprites_Zeon
                dc.l SpecialSprites_Zeon
                dc.l SpecialSprites_Kraken
                dc.l SpecialSprites_Kraken
                dc.l SpecialSprites_Kraken
                dc.l SpecialSprites_Kraken

; =============== S U B R O U T I N E =======================================


LoadSpecialSprite:
                
                movem.l d0-a1,-(sp)
                move.b  #$FF,d0
                sub.b   d1,d0
                andi.w  #$FF,d0
                move.w  d0,d1
                lsl.w   #2,d0
                movea.l pt_SpecialSprites(pc,d0.w),a0
                lea     (PALETTE_4_BASE).l,a1
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                move.l  (a0)+,(a1)+
                add.w   d1,d1
                move.w  rjt_25C5A(pc,d1.w),d1
                jmp     rjt_25C5A(pc,d1.w)

    ; End of function LoadSpecialSprite

rjt_25C5A:      dc.w LoadBattleSpecialSprite-rjt_25C5A
                dc.w LoadBattleSpecialSprite-rjt_25C5A
                dc.w LoadExplorationSpecialSprite-rjt_25C5A
                dc.w LoadBattleSpecialSprite-rjt_25C5A
                dc.w LoadBattleSpecialSprite-rjt_25C5A
                dc.w LoadBattleSpecialSprite-rjt_25C5A
                dc.w LoadBattleSpecialSprite-rjt_25C5A
                dc.w LoadBattleSpecialSprite-rjt_25C5A
                dc.w LoadBattleSpecialSprite-rjt_25C5A

; =============== S U B R O U T I N E =======================================


LoadBattleSpecialSprite:
                
                lea     (FF8002_LOADING_SPACE).l,a1
                move.l  a1,-(sp)
                jsr     (LoadCompressedData).w
                movea.l (sp)+,a0
                lea     ($AF00).l,a1
                move.w  #$480,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                bra.w   loc_25CB0

    ; End of function LoadBattleSpecialSprite


; =============== S U B R O U T I N E =======================================


LoadExplorationSpecialSprite:
                
                lea     (FF4D00_LOADING_SPACE).l,a1
                move.l  a1,-(sp)
                jsr     (LoadCompressedData).w
                movea.l (sp)+,a0
                lea     ($A3C0).l,a1
                move.w  #$A20,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                bra.w   *+4
loc_25CB0:
                
                movem.l (sp)+,d0-a1
                rts

    ; End of function LoadExplorationSpecialSprite


; =============== S U B R O U T I N E =======================================


sub_25CB6:
                
                movem.l d0-d2/a0-a1,-(sp)
                conditionalPc lea,(SpecialSprites_EvilSpirit+$20),a0
                tst.w   d0
                beq.s   loc_25CD2
                cmpi.b  #1,d0
                bne.s   loc_25CCE
                conditionalPc lea,SpecialSprites_EvilSpiritAlt,a0
                bra.s   loc_25CD2
loc_25CCE:
                
                conditionalPc lea,(SpecialSprites_Zeon+$20),a0
loc_25CD2:
                
                lea     (FF6802_LOADING_SPACE).l,a1
                move.l  a1,-(sp)
                jsr     (LoadCompressedData).w
                movea.l (sp)+,a0
                lea     ($AF00).l,a1
                move.w  #$480,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0-d2/a0-a1
                rts

    ; End of function sub_25CB6


; =============== S U B R O U T I N E =======================================


UpdateSpecialSprites:
                
                movem.l d0-d2/d7-a2,-(sp)
                move.b  ((WINDOW_IS_PRESENT-$1000000)).w,d7
                cmp.b   d5,d7
                bge.s   loc_25D0C
                move.w  #$8000,d5
                bra.s   loc_25D0E
loc_25D0C:
                
                clr.w   d5
loc_25D0E:
                
                cmpi.b  #$F0,ENTITYDEF_OFFSET_MAPSPRITE(a0)
                bcs.w   loc_25DF0
                move.b  #$FF,d6
                sub.b   ENTITYDEF_OFFSET_MAPSPRITE(a0),d6
                andi.w  #$F,d6
                add.w   d6,d6
                move.w  rjt_SpecialSpriteUpdate(pc,d6.w),d6
                jmp     rjt_SpecialSpriteUpdate(pc,d6.w)

    ; End of function UpdateSpecialSprites

rjt_SpecialSpriteUpdate:
                dc.w UpdateBattleSpecialSprite-rjt_SpecialSpriteUpdate
                dc.w UpdateBattleSpecialSprite-rjt_SpecialSpriteUpdate
                dc.w UpdateExplorationSpecialSprite-rjt_SpecialSpriteUpdate
                dc.w UpdateBattleSpecialSprite-rjt_SpecialSpriteUpdate
                dc.w UpdateBattleSpecialSprite-rjt_SpecialSpriteUpdate
                dc.w UpdateBattleSpecialSprite-rjt_SpecialSpriteUpdate
                dc.w UpdateBattleSpecialSprite-rjt_SpecialSpriteUpdate
                dc.w UpdateBattleSpecialSprite-rjt_SpecialSpriteUpdate
                dc.w UpdateBattleSpecialSprite-rjt_SpecialSpriteUpdate

; =============== S U B R O U T I N E =======================================


UpdateBattleSpecialSprite:
                
                lea     (SPRITE_60).l,a1
                move.b  ENTITYDEF_OFFSET_ANIMCOUNTER(a0),d2
                cmpi.b  #$F,d2
                ble.s   loc_25D56
                lea     word_2784C(pc), a2
                bra.s   loc_25D5A
loc_25D56:
                
                lea     word_2786C(pc), a2
loc_25D5A:
                
                btst    #4,ENTITYDEF_OFFSET_FLAGS_B(a0)
                beq.s   loc_25D64
                addq.b  #2,d2
loc_25D64:
                
                btst    #0,((FRAME_COUNTER-$1000000)).w
                beq.s   loc_25D7A
                addq.b  #1,d2
                cmpi.b  #$1E,d2
                ble.s   loc_25D76
                clr.w   d2
loc_25D76:
                
                move.b  d2,ENTITYDEF_OFFSET_ANIMCOUNTER(a0)
loc_25D7A:
                
                movea.l a2,a0
                moveq   #3,d7
loc_25D7E:
                
                move.w  (a0)+,d2
                add.w   d1,d2
                move.w  d2,(a1)+
                move.w  (a0)+,(a1)+
                move.w  (a0)+,(a1)
                or.w    d5,(a1)+
                move.w  (a0)+,d2
                add.w   d0,d2
                move.w  d2,(a1)+
                dbf     d7,loc_25D7E
                bra.w   loc_25DF0

    ; End of function UpdateBattleSpecialSprite


; =============== S U B R O U T I N E =======================================


UpdateExplorationSpecialSprite:
                
                clr.w   d6
                move.b  $11(a0),d6
                lea     (SPRITE_46).l,a1
                lea     SpecialSpriteData_NazcaShip(pc), a0
                movem.l d0-d1,-(sp)
                sub.w   d6,d1
                moveq   #8,d7
loc_25DB0:
                
                move.w  (a0)+,d2
                add.w   d1,d2
                move.w  d2,(a1)+
                move.w  (a0)+,(a1)+
                move.w  (a0)+,(a1)+
                move.w  (a0)+,d2
                add.w   d0,d2
                move.w  d2,(a1)+
                dbf     d7,loc_25DB0
                movem.l (sp)+,d0-d1
                sub.w   d6,d0
                btst    #0,((FRAME_COUNTER-$1000000)).w
                bne.s   loc_25DD6
                move.w  #$180,d0
loc_25DD6:
                
                moveq   #8,d7
loc_25DD8:
                
                move.w  (a0)+,d2
                add.w   d1,d2
                move.w  d2,(a1)+
                move.w  (a0)+,(a1)+
                move.w  (a0)+,(a1)+
                move.w  (a0)+,d2
                add.w   d0,d2
                move.w  d2,(a1)+
                dbf     d7,loc_25DD8
                bra.w   *+4
loc_25DF0:
                
                movem.l (sp)+,d0-d2/d7-a2
                rts

    ; End of function UpdateExplorationSpecialSprite

