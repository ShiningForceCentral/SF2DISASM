
; ASM FILE code\gameflow\battle\battlefunctions\battlefunctions_1.asm :
; 0x23D98..0x23E50 : Battle functions

; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

ExecuteBattleaction_AngelWing:
                
                move.w  combatant(a6),d0
                move.w  ((BATTLEACTION_ITEM_SLOT-$1000000)).w,d1
                jsr     j_RemoveItemBySlot
                bsr.w   CloseBattlefieldWindows
                move.w  combatant(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                andi.w  #ITEMENTRY_MASK_INDEX,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                txt     275             ; "{NAME} used{N}{ITEM}!"
                bra.w   byte_23DFA

    ; End of function ExecuteBattleaction_AngelWing


; =============== S U B R O U T I N E =======================================

itemOrSpellIndex = -4
combatant = -2

ExecuteBattleaction_Egress:
                
                move.w  combatant(a6),d0
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,d1
                jsr     j_GetSpellCost
                jsr     j_DecreaseCurrentMp
                bsr.w   CloseBattlefieldWindows
                move.w  combatant(a6),((DIALOGUE_NAME_INDEX_1-$1000000)).w
                move.w  ((BATTLEACTION_ITEM_OR_SPELL-$1000000)).w,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                andi.w  #SPELLENTRY_MASK_INDEX,((DIALOGUE_NAME_INDEX_2-$1000000)).w
                move.l  #1,((DIALOGUE_NUMBER-$1000000)).w
                txt     274             ; "{NAME} cast{N}{SPELL} level {#}!"
byte_23DFA:
                
                sndCom  SFX_SPELL_CAST
                jsr     j_ExecuteFlashScreenScript
                clsTxt
                bsr.w   UpdateBattleUnlockedFlag
                unlk    a6
                movem.l (sp)+,d0
                bsr.w   GetEgressPositionForBattle
                clr.w   d4
                rts

    ; End of function ExecuteBattleaction_Egress


; =============== S U B R O U T I N E =======================================


UpdateBattleUnlockedFlag:
                
                clr.w   d1
                getSavedByte CURRENT_BATTLE, d1
                addi.w  #BATTLE_COMPLETED_FLAGS_START,d1
                jsr     j_CheckFlag     ; Check whether current battle is marked as completed
                beq.s   @Return
                subi.w  #BATTLE_UNLOCKED_TO_COMPLETED_FLAGS_OFFSET,d1
                jsr     j_ClearFlag     ; ...and if so, mark it as "locked".
@Return:
                
                rts

    ; End of function UpdateBattleUnlockedFlag


; =============== S U B R O U T I N E =======================================


CloseBattlefieldWindows:
                
                jsr     j_CloseLandEffectWindow
                jsr     j_CloseBattlefieldMiniStatusWindow
                clr.b   ((IS_TARGETING-$1000000)).w
                jsr     j_CloseBattlefieldMiniStatusWindow
                rts

    ; End of function CloseBattlefieldWindows

