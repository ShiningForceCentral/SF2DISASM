
; ASM FILE code\gameflow\battle\battleloop_2.asm :
; 0x23CBA..0x23D98 : Battle loop

; =============== S U B R O U T I N E =======================================


BattleLoop_Victory:
                
                bsr.w   HealLivingAndImmortalAllies
            if (STANDARD_BUILD=1)
                movem.l d1-d2/a0,-(sp)
                lea     table_DisplayTimerBattles(pc), a0
                getSavedByte CURRENT_BATTLE, d1
                moveq   #0,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                movem.l (sp)+,d1-d2/a0
                bcs.s   @Continue
                jsr     CloseTimerWindow
            else
                checkSavedByte #BATTLE_FAIRY_WOODS, CURRENT_BATTLE   ; HARDCODED Battle check for fairy woods
                bne.s   @Continue
                jsr     j_CloseTimerWindow
            endif
@Continue:
                
                getSavedByte CURRENT_MAP, ((MAP_EVENT_PARAM_2-$1000000)).w
                jsr     (UpdateForceAndGetFirstBattlePartyMemberIndex).w
            if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
                jsr     GetCombatantX
                add.b   (BATTLE_AREA_X).l,d1
                move.b  d1,((MAP_EVENT_PARAM_3-$1000000)).w
                jsr     GetCombatantY
                add.b   (BATTLE_AREA_Y).l,d1
            else
                jsr     j_GetCombatantX
                add.b   ((BATTLE_AREA_X-$1000000)).w,d1
                move.b  d1,((MAP_EVENT_PARAM_3-$1000000)).w
                jsr     j_GetCombatantY
                add.b   ((BATTLE_AREA_Y-$1000000)).w,d1
            endif
                move.b  d1,((MAP_EVENT_PARAM_4-$1000000)).w
                bsr.w   GetEntityIndexForCombatant
                lsl.w   #ENTITYDEF_SIZE_BITS,d0
                lea     ((ENTITY_DATA-$1000000)).w,a0
                move.b  ENTITYDEF_OFFSET_FACING(a0,d0.w),((MAP_EVENT_PARAM_5-$1000000)).w
                move.b  #0,((MAP_EVENT_PARAM_1-$1000000)).w
                jsr     j_ExecuteAfterBattleCutscene
                clr.w   d1
                getSavedByte CURRENT_BATTLE, d1
                addi.w  #BATTLE_UNLOCKED_FLAGS_START,d1
                jsr     j_ClearFlag
                addi.w  #BATTLE_UNLOCKED_TO_COMPLETED_FLAGS_OFFSET,d1
                jsr     j_SetFlag
                clr.w   d0
                clr.w   d1
                clr.w   d2
                clr.w   d3
                move.b  ((MAP_EVENT_PARAM_2-$1000000)).w,d0
                move.b  ((MAP_EVENT_PARAM_3-$1000000)).w,d1
                move.b  ((MAP_EVENT_PARAM_4-$1000000)).w,d2
                move.b  ((MAP_EVENT_PARAM_5-$1000000)).w,d3
                moveq   #1,d4
                rts

    ; End of function BattleLoop_Victory


; =============== S U B R O U T I N E =======================================


BattleLoop_Defeat:
                
                bsr.w   UpdateBattleUnlockedFlag
                clr.w   ((DIALOGUE_NAME_INDEX_1-$1000000)).w
                sndCom  MUSIC_SAD_THEME_2
                txt     363             ; "{LEADER} is exhausted.{W1}"
                clsTxt
        if (STANDARD_BUILD=1)
            if (PLAYER_DEFEAT_IS_GAME_OVER=1)
                jmp     (ResetGame).w
            else
                bsr.w   HealLivingAndImmortalAllies
                jsr     GetGold
                lsr.l   #1,d1           ; divide current gold amount by 2
                jsr     SetGold
                jsr     GetEgressPositionForBattle(pc)
                nop
                moveq   #-1,d4
                
                ; Losable battles
                movem.l d1-d2/a0,-(sp)
                clr.w   d1
                lea     table_LosableBattles(pc), a0
                getSavedByte CURRENT_BATTLE, d1
                moveq   #1,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Done
                addi.w  #BATTLE_UNLOCKED_FLAGS_START,d1
                jsr     ClearFlag
                addi.w  #BATTLE_COMPLETED_FLAGS_START-BATTLE_UNLOCKED_FLAGS_START,d1
                jsr     SetFlag
                cmpi.b  #TERMINATOR_BYTE,(a0)
                beq.s   @Done
                move.b  (a0),d0
                clr.w   d4
@Done:          movem.l (sp)+,d1-d2/a0
            endif
        else
                clr.w   d0
                jsr     j_GetMaxHp
                jsr     j_SetCurrentHp
                jsr     j_GetGold
                lsr.l   #1,d1           ; divide current gold amount by 2
                jsr     j_SetGold
                jsr     GetEgressPositionForBattle(pc)
                nop
                moveq   #-1,d4
                
                ; Losable battles
                checkSavedByte #BATTLE_AMBUSHED_BY_GALAM_SOLDIERS, CURRENT_BATTLE    ; HARDCODED battle 4 upgrade
                bne.s   @Return
                clrFlg  404             ; Battle 4 unlocked - BATTLE_AMBUSHED_BY_GALAM_SOLDIERS
                setFlg  504             ; Battle 4 completed - BATTLE_AMBUSHED_BY_GALAM_SOLDIERS   
                jsr     j_UpgradeBattle
                moveq   #MAP_GALAM_CASTLE_INNER,d0
                clr.w   d4
        endif
@Return:
                
                rts


    ; End of function BattleLoop_Defeat

