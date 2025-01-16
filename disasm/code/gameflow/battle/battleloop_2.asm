
; ASM FILE code\gameflow\battle\battleloop_2.asm :
; 0x23CBA..0x23D98 : Battle loop

; =============== S U B R O U T I N E =======================================


BattleLoop_Victory:
                
                bsr.w   HealLivingAndImmortalAllies
                compareToSavedByte #BATTLE_FAIRY_WOODS, CURRENT_BATTLE   ; HARDCODED Battle check for fairy woods
                bne.s   @Continue
                jsr     j_CloseTimerWindow
@Continue:
                
                getSavedByte CURRENT_MAP, ((MAP_EVENT_PARAM_2-$1000000)).w
                jsr     (UpdateForceAndGetFirstBattlePartyMemberIndex).w
                jsr     j_GetCombatantX
                add.b   ((BATTLE_AREA_X-$1000000)).w,d1
                move.b  d1,((MAP_EVENT_PARAM_3-$1000000)).w
                jsr     j_GetCombatantY
                add.b   ((BATTLE_AREA_Y-$1000000)).w,d1
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
                compareToSavedByte #BATTLE_AMBUSHED_BY_GALAM_SOLDIERS, CURRENT_BATTLE    ; HARDCODED battle 4 upgrade
                bne.s   @Return
                clrFlg  404             ; Battle 4 unlocked - BATTLE_AMBUSHED_BY_GALAM_SOLDIERS
                setFlg  504             ; Battle 4 completed - BATTLE_AMBUSHED_BY_GALAM_SOLDIERS   
                jsr     j_UpgradeBattle
                moveq   #MAP_GALAM_CASTLE_INNER,d0
                clr.w   d4
@Return:
                
                rts


    ; End of function BattleLoop_Defeat

