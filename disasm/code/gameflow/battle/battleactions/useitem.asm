
; ASM FILE code\gameflow\battle\battleactions\useitem.asm :
; 0xBBB8..0xBBE4 : Write Battlescene Script : Use Item

; =============== S U B R O U T I N E =======================================


battlesceneScript_UseItem:
                
                move.w  ((BATTLESCENE_ITEM-$1000000)).w,d1
                jsr     GetItemDefAddress
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d0
                move.w  d0,BATTLEACTION_OFFSET_ITEM_OR_SPELL(a3)
                andi.w  #SPELLENTRY_MASK_INDEX,d0
                move.w  d0,((BATTLESCENE_SPELL_INDEX-$1000000)).w
                move.b  ITEMDEF_OFFSET_USE_SPELL(a0),d0
                lsr.b   #SPELLENTRY_OFFSET_LV,d0
                andi.w  #SPELLENTRY_LOWERMASK_LV,d0
                move.w  d0,((BATTLESCENE_SPELL_LEVEL-$1000000)).w
                bra.w   battlesceneScript_CastSpell

    ; End of function battlesceneScript_UseItem

