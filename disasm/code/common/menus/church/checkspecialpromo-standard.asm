
; ASM FILE code\common\menus\church\checkspecialpromo-standard.asm :

; ChurchMenu:@CheckSpecialPromo
                
                lea     table_PromotionItems(pc), a1
                clr.w   promotionItem(a6)
                
                ; Do we possess a special promotion item?
@Start_Loop:    clr.w   d1
                cmpi.b  #TERMINATOR_BYTE,(a1)
                beq.w   @CheckRegularPromo
                move.b  (a1)+,d1                    ; d1.w = special promo item
                move.w  d1,promotionItem(a6)
                jsr     GetItemInventoryLocation
                bpl.s   @FoundItem
                
                addq.w  #2,a1
                bra.s   @Start_Loop
                
                ; Is current class eligible to use this item to promote?
@FoundItem:     move.w  currentClass(a6),d1
                clr.w   d2
                move.b  (a1)+,d2                    ; d2.w = base classes section
                bsr.w   GetPromotionData
                tst.w   cannotPromoteFlag(a6)
                beq.s   @CanPromote
                
                addq.w  #1,a1
                bra.s   @Start_Loop
                
                ; Get new class
@CanPromote:    move.w  promotionSectionOffset(a6),d7
                subq.w  #1,d7
                move.b  (a1)+,d2                    ; d2.w = promoted classes section
                bsr.w   FindPromotionSection
                addq.w  #1,a0
                clr.w   d0
@GetSpecialClass_Loop:
                
                move.b  (a0)+,d0
                dbf     d7,@GetSpecialClass_Loop
                
                ; Confirm action
                move.w  d0,newClass(a6)
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  promotionItem(a6),((DIALOGUE_NAME_INDEX_3-$1000000)).w
                move.w  newClass(a6),((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     143             ; "{NAME} can be promoted{N}to {CLASS} with the{N}{ITEM}.{W2}"
                txt     147             ; "OK?"
                jsr     alt_YesNoPrompt
                beq.s   @ChangeSpells
                txt     144             ; "Then"
                bra.s   @Start_Loop
                
@ChangeSpells:  lea     table_LoseAllSpellsClasses(pc), a0
                move.w  newClass(a6),d1
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @RemoveItem
                move.w  member(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                txt     145             ; "{NAME} loses all spells{N}that were learned.{N}OK?"
                jsr     alt_YesNoPrompt
                bne.w   @Start_Loop
                
@RemoveItem:    move.w  promotionItem(a6),d0
                jsr     RemoveItemFromInventory
                bra.s   @DoPromo
                
; ChurchMenu:@CheckRegularPromo
