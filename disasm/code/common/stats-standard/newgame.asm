
; ASM FILE code\common\stats-standard\newgame.asm :
; 0x9736..0x98B4 : New game initialization functions

; =============== S U B R O U T I N E =======================================

; Clear all story progression flags and other important game variables,
;   then initialize allies combatant data.


NewGame:
                
                movem.l d0-d4/d7-a1,-(sp)
                moveq   #0,d0
                
                ; Clear game progression flags
                loadSavedDataAddress GAME_FLAGS, a0
                moveq   #LONGWORD_GAMEFLAGS_COUNTER,d7
                
@ClearGameFlags_Loop:
                setSavedLongWithPostIncrement d0, a0
                dbf     d7,@ClearGameFlags_Loop
                
                ; Clear shop deals inventory
                loadSavedDataAddress DEALS_ITEMS, a0
                moveq   #LONGWORD_DEALS_COUNTER,d7
                
@ClearDealsItems_Loop:
                setSavedLongWithPostIncrement d0, a0
                dbf     d7,@ClearDealsItems_Loop
                
            if (FIX_COPY_SWAP_EXPLOIT=1)
                ; Clear mithril weapons on order
                loadSavedDataAddress MITHRIL_WEAPONS_ON_ORDER, a0
                moveq   #LONGWORD_MITHRIL_ORDERS_COUNTER,d7
                
@ClearMithrilOrders_Loop:
                setSavedLongWithPostIncrement d0, a0
                dbf     d7,@ClearMithrilOrders_Loop
            endif
                
            if (EXPANDED_SAVED_DATA=1)
                ; Clear "promoted at" levels table if saved data is expanded
                loadSavedDataAddress PROMOTED_AT_LEVELS, a0
                moveq   #LONGWORD_PROMOTED_AT_LEVELS_COUNTER,d7
                
@ClearPromotedAtLevels_Loop:
                setSavedLongWithPostIncrement d0, a0
                dbf     d7,@ClearPromotedAtLevels_Loop
            endif
                
                ; Clear Caravan items number, player type, current map, current battle, egress map
                loadSavedDataAddress COMBATANT_DATA, a0
                
                setSavedWord d0, a0, SAVED_DATA_OFFSET_CARAVAN_ITEMS_NUMBER
                move.b  d0,SAVED_DATA_OFFSET_PLAYER_TYPE(a0)
                move.b  d0,SAVED_DATA_OFFSET_CURRENT_MAP(a0)
                move.b  d0,SAVED_DATA_OFFSET_CURRENT_BATTLE(a0)
                move.b  d0,SAVED_DATA_OFFSET_EGRESS_MAP(a0)
                
            if (FIX_COPY_SWAP_EXPLOIT=1)
                ; Clear item dropped flags
                setSavedLong d0, a0, SAVED_DATA_OFFSET_ENEMY_ITEM_DROPPED_FLAGS
            endif
                
                ; Set special battle record time, message speed, no battle messages toggle
                move.l  #LONGWORD_SPECIAL_BATTLE_RECORD_INITVALUE,d0
                setSavedLong d0, a0, SAVED_DATA_OFFSET_SPECIAL_BATTLE_RECORD
                
                moveq   #GAMESTART_MESSAGE_SPEED,d0
                move.b  d0,SAVED_DATA_OFFSET_MESSAGE_SPEED(a0)
                
                moveq   #GAMESTART_NO_BATTLE_MESSAGES,d0
                move.b  d0,SAVED_DATA_OFFSET_NO_BATTLE_MESSAGES_TOGGLE(a0)
                
                ; Initialize Caravan depot inventory with NOTHING item entries
                move.l  #LONGWORD_CARAVAN_INITVALUE,d0
                loadSavedDataAddress CARAVAN_ITEMS, a0
                moveq   #LONGWORD_CARAVAN_COUNTER,d7
                
@InitializeCaravanItems_Loop:
                setSavedLongWithPostIncrement d0, a0
                dbf     d7,@InitializeCaravanItems_Loop
                
                ; Initialize exploration entities and followers list with null entries
                moveq   #-1,d0
                lea     ((EXPLORATION_ENTITIES-$1000000)).w,a0
                moveq   #LONGWORD_FOLLOWERS_COUNTER,d7
                
@InitializeFollowersList_Loop:
                move.l  d0,(a0)+
                dbf     d7,@InitializeFollowersList_Loop
                
                ; Initialize allies combatant data
                moveq   #COMBATANT_ALLIES_COUNTER,d7
                
@InitializeCombatants_Loop:
                moveq   #COMBATANT_ALLIES_COUNTER,d0
                sub.w   d7,d0
                bsr.s   InitializeAllyCombatantEntry
                bcs.s   @Next           ; skip join if a dummy ally entry was encountered
                
                lea     table_NewGameAllies(pc), a0
                move.w  d0,d1
                moveq   #0,d2
                jsr     (FindSpecialPropertyBytesAddressForObject).w
                bcs.s   @Next
                
                bsr.w   JoinForce
            if (ALL_ALLIES_JOINED|(TEST_BUILD&TEST_BUILD_ALL_ALLIES_JOINED)=1)
                bra.s   @Continue
                
@Next:          bsr.w   JoinForceSkipBattleParty
@Continue:      
            else
@Next:          
            endif
                dbf     d7,@InitializeCombatants_Loop
                
                ; Set initial gold
                move.l  #GAMESTART_GOLD,d1
                bsr.w   SetGold
                
                movem.l (sp)+,d0-d4/d7-a1
                rts

    ; End of function NewGame


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index  Out: a0

GetAllyStartDefinitionAddress:
                
                move.w  d0,d1
                mulu.w  #ALLYSTARTDEF_ENTRY_SIZE,d1
                getPointer p_table_AllyStartDefinitions, a0
                adda.w  d1,a0
                rts

    ; End of function GetAllyStartDefinitionAddress


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index  Out: CCR carry-bit set if a dummy ally entry was encountered


InitializeAllyCombatantEntry:
                
                ; Check if a valid entry is present, otherwise skip initialization
                bsr.s   GetAllyStartDefinitionAddress
                tst.b   (a0)
                bpl.s   @Continue
                
                ori.w   #1,ccr
                rts
                
@Continue:      move.w  d0,d1
                mulu.w  #COMBATANT_DATA_ENTRY_SIZE,d1
                loadSavedDataAddress COMBATANT_DATA, a1
                adda.w  d1,a1
                getPointer p_table_AllyNames, a0
                move.w  d0,d1
                bra.s   @FindName
                
@FindName_Loop: clr.w   d2
                move.b  (a0)+,d2
                lea     (a0,d2.w),a0
@FindName:      dbf     d1,@FindName_Loop
                
@GetNameCounter:
                move.b  (a0)+,d2
                moveq   #ALLYNAME_MAX_LENGTH,d3
                sub.w   d2,d3
                bra.s   @LoadName
                
@LoadName_Loop: setSavedByteWithPostIncrement (a0)+, a1
@LoadName:      dbf     d2,@LoadName_Loop
                
                bra.s   @ClearRemainingNameBytes
                
@ClearRemainingNameBytes_Loop:
                clearSavedByteWithPostIncrement a1
                
@ClearRemainingNameBytes:
                dbf     d3,@ClearRemainingNameBytes_Loop
                
@LoadAllyStartData:
                bsr.s   GetAllyStartDefinitionAddress
                suba.w  #(ALLYNAME_MAX_LENGTH*SAVED_DATA_BYTE_SIZE),a1
                move.b  (a0)+,d2
                move.b  d2,COMBATANT_OFFSET_CLASS(a1)
                move.b  (a0)+,d4
            if (ALL_ALLIES_JOINED=1)
                moveq   #1,d4
            elseif (TEST_BUILD&TEST_BUILD_ALL_ALLIES_JOINED=1)
                moveq   #TEST_BUILD_ALLIES_START_LEVEL,d4
                bsr.w   GetClassType
                beq.s   @LoadLevel
                
                subi.w  #CHAR_CLASS_EXTRALEVEL,d4 ; subtract 10 if character starts already promoted
@LoadLevel:
            endif
                move.b  d4,COMBATANT_OFFSET_LEVEL(a1)
                clr.w   d3
                
            if (FIX_COPY_SWAP_EXPLOIT=1)
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
                move.l  #LONGWORD_SPELLS_INITVALUE,d3
                setSavedLong d3, a1, COMBATANT_OFFSET_SPELLS    ; spell entries default to nothing
                move.w  d2,d1                                   ; d1.w = class index
                moveq   #0,d3                                   ; clear automatic promotion toggle
                pea     UpdateCombatantStats(pc)
                pea     InitializeAllyStats(pc)                 ; In: d4.w = starting level
                
                ; Flow into LoadAllyClassData below

    ; End of function InitializeAllyCombatantEntry


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index
;     d1.w = class index


LoadAllyClassData:
                
                movem.l d0/a0-a1,-(sp)
                bsr.s   GetClassDefinitionAddress
                mulu.w  #COMBATANT_DATA_ENTRY_SIZE,d0
                loadSavedDataAddress COMBATANT_DATA, a1
                adda.w  d0,a1
                move.b  (a0)+,COMBATANT_OFFSET_MOV_BASE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE_LOW_BYTE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_MOVETYPE_AND_AI_COMMANDSET(a1)
                move.b  (a0)+,COMBATANT_OFFSET_PROWESS_BASE(a1)
                movem.l (sp)+,d0/a0-a1
                rts

    ; End of function LoadAllyClassData


; =============== S U B R O U T I N E =======================================

; Out: a0 = pointer to definition for class d1


GetClassDefinitionAddress:
                
                move.l  d1,-(sp)
                andi.w  #CLASS_MASK_INDEX,d1
                mulu.w  #CLASSDEF_ENTRY_SIZE,d1
                getPointer p_table_ClassDefinitions, a0
                adda.w  d1,a0
                move.l  (sp)+,d1
                rts

    ; End of function GetClassDefinitionAddress


; =============== S U B R O U T I N E =======================================

; In: d0.w = ally index, d1.w = new class, d2.w = current class


Promote:
                
                bsr.w   SetClass
            if (MODIFY_MOV_STAT_ON_PROMOTION=1)
                ; Calculate difference between current and new class MOV stats
                bsr.s   GetClassDefinitionAddress
                move.w  d2,d1
                move.b  (a0),d2
                bsr.s   GetClassDefinitionAddress
                move.b  (a0),d1
                sub.b   d2,d1
                beq.s   @Continue
                blt.s   @Increase
                
                bsr.w   DecreaseBaseMov ; modify the character's base MOV
                bra.s   @Continue
                
@Increase:      neg.b   d1
                bsr.w   IncreaseBaseMov
                
                ; Get modified base MOV and reapply it after loading class data
@Continue:      bsr.w   GetBaseMov
                move.w  d1,d2
                bsr.w   GetClass
                bsr.s   LoadAllyClassData
                move.w  d2,d1
                bsr.w   SetBaseMov
            else
                bsr.s   LoadAllyClassData
            endif
            if (EXPANDED_SAVED_DATA=1)
                ; Set promoted at level as current level (before promotion)
                move.w  d0,-(sp)
                bsr.w   GetLevel
                andi.w  #BYTE_MASK,d0
                loadSavedDataAddress PROMOTED_AT_LEVELS, a0
                addToSavedBytePointer d0, a0
                move.b  d1,(a0)
                move.w  (sp)+,d0
            endif
                bra.w   UpdateCombatantStats

    ; End of function Promote

