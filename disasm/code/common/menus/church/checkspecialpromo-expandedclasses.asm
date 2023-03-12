
; ASM FILE code\common\menus\church\checkspecialpromo-expandedclasses.asm :

; ChurchMenuActions:@CheckSpecialPromo
                
                move.w  currentClass(a6),d1
                move.w  #PROMOTIONSECTION_VIGOR_BASE,d2
                bsr.w   GetPromotionData
                tst.w   cannotPromoteFlag(a6)
                bne.s   @CheckSpecialPromo2
                
                clr.w   promotionItem(a6)
                move.w  promotionSectionOffset(a6),d7
                subq.w  #1,d7
                move.w  #PROMOTIONSECTION_VIGOR_PROMO,d2
                bsr.w   FindPromotionSection
                addq.w  #1,a0
                move.w  #ITEM_VIGOR_BALL,d1
                jsr     GetItemInventoryLocation
                cmpi.w  #-1,d0
                beq.s   @CheckSpecialPromo2
                
                move.w  #ITEM_VIGOR_BALL,promotionItem(a6)
                clr.w   d0
                bsr.w   PromoWithItem
                jsr     YesNoChoiceBox
                beq.w   @ChangeSpells
                txt     144             ; "Then"
                
@CheckSpecialPromo2:
                move.w  currentClass(a6),d1
                move.w  #PROMOTIONSECTION_WING_BASE,d2
                bsr.w   GetPromotionData
                tst.w   cannotPromoteFlag(a6)
                bne.s   @CheckSpecialPromo3
                
                clr.w   promotionItem(a6)
                move.w  promotionSectionOffset(a6),d7
                subq.w  #1,d7
                move.w  #PROMOTIONSECTION_WING_PROMO,d2
                bsr.w   FindPromotionSection
                addq.w  #1,a0
                move.w  #ITEM_PEGASUS_WING,d1
                jsr     GetItemInventoryLocation
                cmpi.w  #-1,d0
                beq.s   @CheckSpecialPromo3
                
                move.w  #ITEM_PEGASUS_WING,promotionItem(a6)
                clr.w   d0
                bsr.w   PromoWithItem
                jsr     YesNoChoiceBox
                beq.w   @ChangeSpells
                txt     144             ; "Then"
                
@CheckSpecialPromo3:
                move.w  currentClass(a6),d1
                move.w  #PROMOTIONSECTION_PRIDE_BASE,d2
                bsr.w   GetPromotionData
                tst.w   cannotPromoteFlag(a6)
                bne.s   @CheckSpecialPromo4
                
                clr.w   promotionItem(a6)
                move.w  promotionSectionOffset(a6),d7
                subq.w  #1,d7
                move.w  #PROMOTIONSECTION_PRIDE_PROMO,d2
                bsr.w   FindPromotionSection
                addq.w  #1,a0
                move.w  #ITEM_WARRIORS_PRIDE,d1
                jsr     GetItemInventoryLocation
                cmpi.w  #-1,d0
                beq.s   @CheckSpecialPromo4
                
                move.w  #ITEM_WARRIORS_PRIDE,promotionItem(a6)
                clr.w   d0
                bsr.w   PromoWithItem
                jsr     YesNoChoiceBox
                beq.w   @ChangeSpells
                txt     144             ; "Then"
                
@CheckSpecialPromo4:
                move.w  currentClass(a6),d1
                move.w  #PROMOTIONSECTION_TOME_BASE,d2
                bsr.w   GetPromotionData
                tst.w   cannotPromoteFlag(a6)
                bne.s   @CheckSpecialPromo5
                
                clr.w   promotionItem(a6)
                move.w  promotionSectionOffset(a6),d7
                subq.w  #1,d7
                move.w  #PROMOTIONSECTION_TOME_PROMO,d2
                bsr.w   FindPromotionSection
                addq.w  #1,a0
                move.w  #ITEM_SECRET_BOOK,d1
                jsr     GetItemInventoryLocation
                cmpi.w  #-1,d0
                beq.s   @CheckSpecialPromo5
                
                move.w  #ITEM_SECRET_BOOK,promotionItem(a6)
                clr.w   d0
                bsr.w   PromoWithItem
                jsr     YesNoChoiceBox
                beq.s   @ChangeSpells
                txt     144             ; "Then"
                
@CheckSpecialPromo5:
                move.w  currentClass(a6),d1
                move.w  #PROMOTIONSECTION_TANK_BASE,d2
                bsr.w   GetPromotionData
                tst.w   cannotPromoteFlag(a6)
                bne.s   @CheckRegularPromo
                
                clr.w   promotionItem(a6)
                move.w  promotionSectionOffset(a6),d7
                subq.w  #1,d7
                move.w  #PROMOTIONSECTION_TANK_PROMO,d2
                bsr.w   FindPromotionSection
                addq.w  #1,a0
                move.w  #ITEM_SILVER_TANK,d1
                jsr     GetItemInventoryLocation
                cmpi.w  #-1,d0
                beq.s   @CheckRegularPromo
                
                move.w  #ITEM_SILVER_TANK,promotionItem(a6)
                clr.w   d0
                bsr.w   PromoWithItem
                jsr     YesNoChoiceBox
                beq.s   @ChangeSpells
                txt     144             ; "Then"
                bra.s   @CheckRegularPromo
@ChangeSpells:
                
                cmpi.w  #CLASS_SORC,newClass(a6)
                bne.s   @RemovePromoItem
                move.w  member(a6),((TEXT_NAME_INDEX_1-$1000000)).w
                txt     145             ; "{NAME} loses all spells{N}that were learned.{N}OK?"
                jsr     YesNoChoiceBox
                bne.w   @RestartPromo
@RemovePromoItem:
                
                move.w  promotionItem(a6),d0
                jsr     RemoveItemFromInventory
