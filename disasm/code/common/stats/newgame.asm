
; ASM FILE code\common\stats\newgame.asm :
; 0x9736..0x98B4 : New game initialization functions

; =============== S U B R O U T I N E =======================================


NewGame:
                
                movem.w d0-d1/d7,-(sp)
                bsr.w   InitializeGameSettings
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                
                moveq   #COMBATANT_ALLIES_COUNTER,d0
                sub.w   d7,d0
                bsr.w   InitializeAllyCombatantEntry
                dbf     d7,@Loop
                
                moveq   #GAMESTART_GOLD,d1 ; starting gold value
                bsr.w   SetGold
                moveq   #ALLY_BOWIE,d0  ; starting character
                bsr.w   JoinForce       
                movem.w (sp)+,d0-d1/d7
                rts

    ; End of function NewGame


; =============== S U B R O U T I N E =======================================

; In: D0 = ally index


InitializeAllyCombatantEntry:
                
                movem.l d0-d3/a0-a1,-(sp)
                move.w  d0,d1
                mulu.w  #COMBATANT_DATA_ENTRY_SIZE,d1
                loadSavedDataAddress COMBATANT_DATA, a1
                adda.w  d1,a1
                getPointer p_table_AllyNames, a0
                move.w  d0,d1
                subq.w  #1,d1
                blt.s   @GetNameCounter
@FindName_Loop:
                
                clr.w   d2
                move.b  (a0)+,d2
                lea     (a0,d2.w),a0
                dbf     d1,@FindName_Loop
@GetNameCounter:
                
                move.b  (a0)+,d2
                moveq   #ALLYNAME_MAX_LENGTH,d3
                sub.w   d2,d3
                subq.w  #1,d2
                blt.s   @GetRemainingNameBytesCounter
@LoadName_Loop:
                
                setSavedByteWithPostIncrement (a0)+, a1
                dbf     d2,@LoadName_Loop
@GetRemainingNameBytesCounter:
                
                subq.w  #1,d3
                blt.s   @LoadAllyStartData
@ClearRemainingNameBytes_Loop:
                
                clr.b   (a1)+
                dbf     d3,@ClearRemainingNameBytes_Loop
@LoadAllyStartData:
                
                move.w  d0,d1
                mulu.w  #ALLYSTARTDEF_ENTRY_SIZE,d1
                getPointer p_table_AllyStartDefinitions, a0
                adda.w  d1,a0
                suba.w  #ALLYNAME_MAX_LENGTH,a1
                move.b  (a0)+,d1
                move.b  d1,COMBATANT_OFFSET_CLASS(a1)
                move.b  (a0)+,d2
                move.b  d2,COMBATANT_OFFSET_LEVEL(a1)
                ext.w   d2
                move.w  d2,-(sp)        ; -> push starting level
                clr.w   d3
            if (STANDARD_BUILD&FIX_COPY_SWAP_EXPLOIT=1)
                move.b  d3,COMBATANT_OFFSET_EXP(a1)
                setSavedWord d3, a1, COMBATANT_OFFSET_ALLY_KILLS
                setSavedWord d3, a1, COMBATANT_OFFSET_ALLY_DEFEATS
            endif
                getStartingItem (a0)+, d3
                setSavedWord d3, a1, COMBATANT_OFFSET_ITEM_0
                getStartingItem (a0)+, d3
                setSavedWord d3, a1, COMBATANT_OFFSET_ITEM_1
                getStartingItem (a0)+, d3
                setSavedWord d3, a1, COMBATANT_OFFSET_ITEM_2
                getStartingItem (a0)+, d3
                setSavedWord d3, a1, COMBATANT_OFFSET_ITEM_3
                move.l  #LONGWORD_SPELLS_INITVALUE,COMBATANT_OFFSET_SPELLS(a1) 
                                                        ; spell entries default to nothing
                bsr.w   LoadAllyClassData
                move.w  (sp)+,d1        ; D1 <- pull starting level
                bsr.w   InitializeAllyStats
                bsr.w   UpdateCombatantStats
                movem.l (sp)+,d0-d3/a0-a1
                rts

    ; End of function InitializeAllyCombatantEntry


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index
;     d1.w = class index


LoadAllyClassData:
                
                movem.l d0-d1/a0-a1,-(sp)
                mulu.w  #COMBATANT_DATA_ENTRY_SIZE,d0
                loadSavedDataAddress COMBATANT_DATA, a1
                adda.w  d0,a1
                getPointer p_table_ClassDefinitions, a0
                andi.w  #CLASS_MASK_INDEX,d1
                mulu.w  #CLASSDEF_ENTRY_SIZE,d1
                adda.w  d1,a0
                move.b  (a0)+,COMBATANT_OFFSET_MOV_BASE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE_LOW_BYTE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_MOVETYPE_AND_AI_COMMANDSET(a1)
                move.b  (a0)+,COMBATANT_OFFSET_PROWESS_BASE(a1)
                movem.l (sp)+,d0-d1/a0-a1
                rts

    ; End of function LoadAllyClassData


; =============== S U B R O U T I N E =======================================


Promote:
                
                movem.w d1,-(sp)
                bsr.w   GetClass        
                bsr.s   LoadAllyClassData
                bsr.w   UpdateCombatantStats
                movem.w (sp)+,d1
                rts

    ; End of function Promote


; =============== S U B R O U T I N E =======================================

; Clear all flags and important game variables.

mithrilOrders1and2 = MITHRIL_WEAPONS_ON_ORDER
mithrilOrders3and4 = MITHRIL_WEAPONS_ON_ORDER+4

InitializeGameSettings:
                
                movem.l d0/d7-a0,-(sp)
                moveq   #LONGWORD_GAMEFLAGS_INITVALUE,d0
                loadSavedDataAddress GAME_FLAGS, a0
                moveq   #LONGWORD_GAMEFLAGS_COUNTER,d7
@ClearGameFlags_Loop:
                
                setSavedLongWithPostIncrement d0, a0
                dbf     d7,@ClearGameFlags_Loop
                
                loadSavedDataAddress DEALS_ITEMS, a0
                moveq   #LONGWORD_DEALS_COUNTER,d7
@ClearDealsItems_Loop:
                
                setSavedLongWithPostIncrement d0, a0
                dbf     d7,@ClearDealsItems_Loop
                
                move.l  #LONGWORD_CARAVAN_INITVALUE,d0
                loadSavedDataAddress CARAVAN_ITEMS, a0
                moveq   #LONGWORD_CARAVAN_COUNTER,d7
@ClearCaravanItems_Loop:
                
                setSavedLongWithPostIncrement d0, a0
                dbf     d7,@ClearCaravanItems_Loop
                
                moveq   #0,d0
                move.w  d0,((CARAVAN_ITEMS_NUMBER-$1000000)).w ; number of items in caravan
                move.w  d0,((CURRENT_GOLD-$1000000)).w
                move.b  d0,((PLAYER_TYPE-$1000000)).w
                move.b  d0,((CURRENT_MAP-$1000000)).w
                move.b  d0,((CURRENT_BATTLE-$1000000)).w
                move.b  d0,((NO_BATTLE_MESSAGES_TOGGLE-$1000000)).w
                move.b  d0,((EGRESS_MAP-$1000000)).w
            if (STANDARD_BUILD&FIX_COPY_SWAP_EXPLOIT=1)
                move.l  d0,((ENEMY_ITEM_DROPPED_FLAGS-$1000000)).w
                move.l  d0,((mithrilOrders1and2-$1000000)).w 
                move.l  d0,((mithrilOrders3and4-$1000000)).w 
            endif
                move.l  #359999,((SPECIAL_BATTLE_RECORD-$1000000)).w
                move.b  #GAMESTART_MESSAGE_SPEED,((MESSAGE_SPEED-$1000000)).w
                move.l  #-1,((EXPLORATION_ENTITIES-$1000000)).w
                move.w  #-1,((byte_FFAF26-$1000000)).w
                movem.l (sp)+,d0/d7-a0
                rts

    ; End of function InitializeGameSettings

