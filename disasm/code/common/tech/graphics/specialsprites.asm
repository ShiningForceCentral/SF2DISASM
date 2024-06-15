
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

; In: d1.w = entity mapsprite index


LoadSpecialSprite:
                
                
                module                  ; Start of special sprite loading module
                movem.l d0-a1,-(sp)
            if (STANDARD_BUILD=1)
                bsr.w   GetSpecialSpriteIndex
                move.w  d1,d0
            else
                move.b  #MAPSPRITES_SPECIALS_END,d0
                sub.b   d1,d0
                andi.w  #MAPSPRITE_MASK,d0
                move.w  d0,d1
            endif
                lsl.w   #INDEX_SHIFT_COUNT,d0
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
                move.w  rjt_SpecialSpriteFunctions(pc,d1.w),d1
                jmp     rjt_SpecialSpriteFunctions(pc,d1.w)

    ; End of function LoadSpecialSprite

rjt_SpecialSpriteFunctions:
                dc.w specialSprite_Battle-rjt_SpecialSpriteFunctions
                dc.w specialSprite_Battle-rjt_SpecialSpriteFunctions
                dc.w specialSprite_Exploration-rjt_SpecialSpriteFunctions
                dc.w specialSprite_Battle-rjt_SpecialSpriteFunctions
                dc.w specialSprite_Battle-rjt_SpecialSpriteFunctions
                dc.w specialSprite_Battle-rjt_SpecialSpriteFunctions
                dc.w specialSprite_Battle-rjt_SpecialSpriteFunctions
                dc.w specialSprite_Battle-rjt_SpecialSpriteFunctions
                dc.w specialSprite_Battle-rjt_SpecialSpriteFunctions

; START OF FUNCTION CHUNK FOR LoadSpecialSprite

specialSprite_Battle:
                
                lea     (FF8002_LOADING_SPACE).l,a1
                move.l  a1,-(sp)
                jsr     (LoadStackCompressedData).w
                movea.l (sp)+,a0
                lea     ($AF00).l,a1
                move.w  #$480,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                bra.w   @Done
specialSprite_Exploration:
                
                lea     (FF4D00_LOADING_SPACE).l,a1
                move.l  a1,-(sp)
                jsr     (LoadStackCompressedData).w
                movea.l (sp)+,a0
                lea     ($A3C0).l,a1
                move.w  #$A20,d0
                moveq   #2,d1
                jsr     (ApplyImmediateVramDma).w
                bra.w   *+4
@Done:
                
                movem.l (sp)+,d0-a1
                rts

; END OF FUNCTION CHUNK FOR LoadSpecialSprite

                modend                  ; End of special sprite loading module

; =============== S U B R O U T I N E =======================================

; In: d0.w = 0. Evil Spirit, 1. Evil Spirit (alt.), 2. Zeon


AnimateSpecialSprite:
                
                movem.l d0-d2/a0-a1,-(sp)
                lea     (SpecialSprites_EvilSpirit+$20)(pc), a0
                tst.w   d0
                beq.s   @Continue
                cmpi.b  #1,d0
                bne.s   @Zeon
                lea     SpecialSprites_EvilSpiritAlt(pc), a0
                bra.s   @Continue
@Zeon:
                
                lea     (SpecialSprites_Zeon+$20)(pc), a0
@Continue:
                
                lea     (FF6802_LOADING_SPACE).l,a1
                move.l  a1,-(sp)
                jsr     (LoadStackCompressedData).w
                movea.l (sp)+,a0
                lea     ($AF00).l,a1
                move.w  #$480,d0
                moveq   #2,d1
                jsr     (ApplyVIntVramDma).w
                jsr     (EnableDmaQueueProcessing).w
                movem.l (sp)+,d0-d2/a0-a1
                rts

    ; End of function AnimateSpecialSprite


; =============== S U B R O U T I N E =======================================

; In: a0 = entity data pointer


UpdateSpecialSprite:
                
                module                  ; Start of special sprite update module
                movem.l d0-d2/d7-a2,-(sp)
                move.b  ((WINDOW_IS_PRESENT-$1000000)).w,d7
                cmp.b   d5,d7
                bge.s   loc_25D0C
                move.w  #$8000,d5
                bra.s   loc_25D0E
loc_25D0C:
                
                clr.w   d5
loc_25D0E:
                
            if (STANDARD_BUILD=1)
                move.w  d1,-(sp)
              if (EXPANDED_MAPSPRITES=1)
                move.w  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
              else
                clr.w   d1
                move.b  ENTITYDEF_OFFSET_MAPSPRITE(a0),d1
              endif
                bsr.w   GetSpecialSpriteIndex
                move.w  d1,d6
                movem.w (sp)+,d1 ; MOVEM to pull value back from the stack without affecting the CCR
                bmi.w   @Done    ; branch if an invalid index was returned
            else
                cmpi.b  #MAPSPRITES_SPECIALS_START,ENTITYDEF_OFFSET_MAPSPRITE(a0)
                blo.w   @Done
                move.b  #MAPSPRITES_SPECIALS_END,d6
                sub.b   ENTITYDEF_OFFSET_MAPSPRITE(a0),d6
            endif
                andi.w  #BYTE_LOWER_NIBBLE_MASK,d6
                add.w   d6,d6
                move.w  rjt_SpecialSpriteUpdates(pc,d6.w),d6
                jmp     rjt_SpecialSpriteUpdates(pc,d6.w)

    ; End of function UpdateSpecialSprite

rjt_SpecialSpriteUpdates:
                dc.w specialSpriteUpdate_Battle-rjt_SpecialSpriteUpdates
                dc.w specialSpriteUpdate_Battle-rjt_SpecialSpriteUpdates
                dc.w specialSpriteUpdate_Exploration-rjt_SpecialSpriteUpdates
                dc.w specialSpriteUpdate_Battle-rjt_SpecialSpriteUpdates
                dc.w specialSpriteUpdate_Battle-rjt_SpecialSpriteUpdates
                dc.w specialSpriteUpdate_Battle-rjt_SpecialSpriteUpdates
                dc.w specialSpriteUpdate_Battle-rjt_SpecialSpriteUpdates
                dc.w specialSpriteUpdate_Battle-rjt_SpecialSpriteUpdates
                dc.w specialSpriteUpdate_Battle-rjt_SpecialSpriteUpdates

; =============== S U B R O U T I N E =======================================


specialSpriteUpdate_Battle:
                
                lea     (SPRITE_60).l,a1
                move.b  ENTITYDEF_OFFSET_ANIMCOUNTER(a0),d2
                cmpi.b  #$F,d2
                ble.s   loc_25D56
                lea     table_2784C(pc), a2
                bra.s   loc_25D5A
loc_25D56:
                
                lea     table_2786C(pc), a2
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
                
                bra.w   @Done

    ; End of function specialSpriteUpdate_Battle


; =============== S U B R O U T I N E =======================================


specialSpriteUpdate_Exploration:
                
                clr.w   d6
                move.b  ENTITYDEF_OFFSET_LAYER(a0),d6
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
                move.w  #MAP_TILE_SIZE,d0
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
@Done:
                
                movem.l (sp)+,d0-d2/d7-a2
                rts

    ; End of function specialSpriteUpdate_Exploration

                modend                  ; End of special sprite update module
