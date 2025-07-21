
; ASM FILE code\common\stats-standard\newgame.asm :
; 0x9736..0x98B4 : New game initialization functions

; =============== S U B R O U T I N E =======================================


NewGame:
                
                movem.l d0-d1/d7,-(sp)
                bsr.w   InitializeGameSettings
                moveq   #COMBATANT_ALLIES_COUNTER,d7
@Loop:
                
                moveq   #COMBATANT_ALLIES_COUNTER,d0
                sub.w   d7,d0
                bsr.s   InitializeAllyCombatantEntry
            if (ALL_ALLIES_JOINED|(TEST_BUILD&TEST_BUILD_ALL_ALLIES_JOINED)=1)
                bsr.w   JoinForceSkipBattleParty
            endif
                dbf     d7,@Loop
                
                move.l  #GAMESTART_GOLD,d1 ; starting gold value
                bsr.w   SetGold
                moveq   #ALLY_BOWIE,d0  ; starting character
                bsr.w   JoinForce       
                movem.l (sp)+,d0-d1/d7
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
                bra.s   @FindName
@FindName_Loop:
                
                clr.w   d2
                move.b  (a0)+,d2
                lea     (a0,d2.w),a0
@FindName:      dbf     d1,@FindName_Loop
@GetNameCounter:
                
                move.b  (a0)+,d2
                moveq   #ALLYNAME_MAX_LENGTH,d3
                sub.w   d2,d3
                bra.s   @LoadName
@LoadName_Loop:
                
                setSavedByteWithPostIncrement (a0)+, a1
@LoadName:      dbf     d2,@LoadName_Loop
                
                bra.s   @ClearRemainingNameBytes
@ClearRemainingNameBytes_Loop:
                
                clearSavedByteWithPostIncrement a1
@ClearRemainingNameBytes:
                
                dbf     d3,@ClearRemainingNameBytes_Loop
@LoadAllyStartData:
                
                move.w  d0,d1
                mulu.w  #ALLYSTARTDEF_ENTRY_SIZE,d1
                getPointer p_table_AllyStartDefinitions, a0
                adda.w  d1,a0
                suba.w  #(ALLYNAME_MAX_LENGTH*SAVED_DATA_BYTE_SIZE),a1
                move.b  (a0)+,d1
                move.b  d1,COMBATANT_OFFSET_CLASS(a1)
                move.b  (a0)+,d2
            if (ALL_ALLIES_JOINED=1)
                moveq   #1,d2
            elseif (TEST_BUILD&TEST_BUILD_ALL_ALLIES_JOINED=1)
                moveq   #TEST_BUILD_ALLIES_START_LEVEL,d2
            endif
                move.b  d2,COMBATANT_OFFSET_LEVEL(a1)
                ext.w   d2
                move.w  d2,-(sp)        ; -> push starting level
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
                setSavedLong d3, a1, COMBATANT_OFFSET_SPELLS ; spell entries default to nothing
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
                
                movem.l d0/a0-a1,-(sp)
                bsr.s   GetClassDefinitionAddress
                mulu.w  #COMBATANT_DATA_ENTRY_SIZE,d0
                loadSavedDataAddress COMBATANT_DATA, a1
                adda.w  d0,a1
                move.b  (a0)+,COMBATANT_OFFSET_MOV_BASE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_RESIST_BASE_LOW_BYTE(a1)
                move.b  (a0)+,COMBATANT_OFFSET_MOVETYPE_AND_AI(a1)
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
@Increase:
                
                neg.b   d1
                bsr.w   IncreaseBaseMov
@Continue:
                ; Get modified base MOV and reapply it after loading class data
                bsr.w   GetBaseMov
                bsr.s   LoadAllyClassData
                bsr.w   SetBaseMov
            else
                bsr.s   LoadAllyClassData
            endif
            if (EXPANDED_SAVED_DATA=1)
                ; Set promoted at level as current level (before promotion)
                bsr.w   GetLevel
                andi.w  #BYTE_MASK,d0
                loadSavedDataAddress PROMOTED_AT_LEVELS, a0
                addToSavedBytePointer d0, a0
                move.b  d1,(a0)
            endif
                bra.w   UpdateCombatantStats

    ; End of function Promote


; =============== S U B R O U T I N E =======================================

; Clear all flags and important game variables.


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
                
            if (EXPANDED_SAVED_DATA=1)
                moveq   #LONGWORD_PROMOTED_AT_LEVELS_INITVALUE,d0
                loadSavedDataAddress PROMOTED_AT_LEVELS, a0
                moveq   #LONGWORD_PROMOTED_AT_LEVELS_COUNTER,d7
@ClearPromotedAtLevels_Loop:
                
                setSavedLongWithPostIncrement d0, a0
                dbf     d7,@ClearPromotedAtLevels_Loop
            endif
                
                moveq   #0,d0
                loadSavedDataAddress COMBATANT_DATA, a0
                setSavedWord d0, a0, SAVED_DATA_OFFSET_CARAVAN_ITEMS_NUMBER
                setSavedWord d0, a0, SAVED_DATA_OFFSET_CURRENT_GOLD
                move.b  d0,SAVED_DATA_OFFSET_PLAYER_TYPE(a0)
                move.b  d0,SAVED_DATA_OFFSET_CURRENT_MAP(a0)
                move.b  d0,SAVED_DATA_OFFSET_CURRENT_BATTLE(a0)
                move.b  d0,SAVED_DATA_OFFSET_NO_BATTLE_MESSAGES_TOGGLE(a0)
                move.b  d0,SAVED_DATA_OFFSET_EGRESS_MAP(a0)
                
            if (FIX_COPY_SWAP_EXPLOIT=1)
                setSavedLong d0, a0, SAVED_DATA_OFFSET_ENEMY_ITEM_DROPPED_FLAGS
                setSavedLong d0, a0, SAVED_DATA_OFFSET_MITHRIL_WEAPONS_ON_ORDER
                setSavedLong d0, a0, SAVED_DATA_OFFSET_MITHRIL_WEAPONS_ON_ORDER+(SAVED_DATA_BYTE_SIZE*4)
            endif
                
                move.l  #359999,d0
                setSavedLong d0, a0, SAVED_DATA_OFFSET_SPECIAL_BATTLE_RECORD
                move.b  #2,SAVED_DATA_OFFSET_MESSAGE_SPEED(a0)
                
                ; Clear exploration entities and followers list
                lea     ((EXPLORATION_ENTITIES-$1000000)).w, a0
                moveq   #-1,d0
                moveq   #7,d7
@ClearFollowersList_Loop:
                
                move.l  d0,(a0)+
                dbf     d7,@ClearFollowersList_Loop
                
                movem.l (sp)+,d0/d7-a0
                rts

    ; End of function InitializeGameSettings

