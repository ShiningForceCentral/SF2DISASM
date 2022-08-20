
; ASM FILE code\common\menus\blacksmith\pickmithrilweapon.asm :
; 0x21ED6..0x21F62 : Pick Mithril Weapon function

; =============== S U B R O U T I N E =======================================

characterClass = -24
ordersCounter = -22
fulfillOrdersFlag = -20
readyToFulfillOrdersNumber = -18
fulfilledOrdersNumber = -16
pendingOrdersNumber = -14
itemSlot = -12
itemIndex = -10
targetMember = -8
member = -6
currentGold = -4

PickMithrilWeapon:
                
                movem.l d0-a0,-(sp)
                clr.w   d0
                lea     tbl_MithrilWeaponClasses(pc), a0
                move.w  #MITHRILWEAPON_CLASSES_COUNTER,d7
@FindWeaponClass_Loop:
                
                move.w  (a0)+,d6        ; D6 = number of character classes
                subq.w  #1,d6
@FindCharacterClass_Loop:
                
                move.w  (a0)+,d1        ; D1 = weapon class
                move.w  characterClass(a6),d2 ; D2 = character class
                cmp.w   d1,d2
                beq.w   @GetWeaponsEntryAddress ; found character class belonging to weapon class
                dbf     d6,@FindCharacterClass_Loop
                
                addi.w  #1,d0
                dbf     d7,@FindWeaponClass_Loop
                
                ; Randomly determine weapon class for classes BRN and RDBN
                clr.w   d0
                move.w  #2,d6
                jsr     (GenerateRandomNumber).w
                cmpi.w  #0,d7
                bne.w   @GetWeaponsEntryAddress
                move.w  #2,d0
@GetWeaponsEntryAddress:
                
                lsl.w   #3,d0           ; D0 = weapon class index * 8 (weapons entry size)
                lea     tbl_MithrilWeapons(pc), a0
                adda.w  d0,a0
                move.w  #MITHRILWEAPONS_PER_CLASS_COUNTER,d5
@PickWeapon_Loop:
                
                clr.w   d0
                clr.w   d1
                move.b  (a0)+,d0        ; D0 = parameter
                move.b  (a0)+,d1        ; D1 = item index
                move.w  d0,d6
                jsr     (GenerateRandomNumber).w
                cmpi.w  #0,d7
                beq.w   @LoadIndex
                dbf     d5,@PickWeapon_Loop
@LoadIndex:
                
                loadSavedDataAddress MITHRIL_WEAPONS_ON_ORDER, a0
                move.w  #BLACKSMITH_ORDERS_COUNTER,d7
@LoadIndex_Loop:
                
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                movep.w 0(a0),d0
                bne.s   @Next
                movep.w d1,0(a0)
                bra.s   @Done
            else
                cmpi.w  #0,(a0)
                bne.w   @Next           ; check next weapon slot if current one is occupied
                move.w  d1,(a0)
                bra.w   @Done           ; move item index to current weapon slot in RAM, and we're done
            endif
@Next:
                
                move.w  #2,d0
                adda.w  d0,a0
                dbf     d7,@LoadIndex_Loop
@Done:
                
                movem.l (sp)+,d0-a0
                rts

    ; End of function PickMithrilWeapon

