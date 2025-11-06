
; ASM FILE code\common\tech\jumpinterfaces\s02_jumpinterface.asm :
; 0x8000..0x82C4 : Game Section 02 Jump Interface

; =============== S U B R O U T I N E =======================================


j_GetCombatantName:
                
                jmp     GetCombatantName(pc)

    ; End of function j_GetCombatantName


; =============== S U B R O U T I N E =======================================


j_GetClass:
                
                jmp     GetClass(pc)    

    ; End of function j_GetClass


; =============== S U B R O U T I N E =======================================


j_GetCombatantY:
                
                jmp     GetCombatantY(pc)

    ; End of function j_GetCombatantY


; =============== S U B R O U T I N E =======================================


j_GetMaxMp:
                
                jmp     GetMaxMp(pc)

    ; End of function j_GetMaxMp


; =============== S U B R O U T I N E =======================================


j_GetMaxHp:
                
                jmp     GetMaxHp(pc)

    ; End of function j_GetMaxHp


; =============== S U B R O U T I N E =======================================


j_GetCombatantX:
                
                jmp     GetCombatantX(pc)

    ; End of function j_GetCombatantX


; =============== S U B R O U T I N E =======================================


j_GetMovetype:
                
                jmp     GetMovetype(pc) 

    ; End of function j_GetMovetype


; =============== S U B R O U T I N E =======================================


j_GetStatusEffects:
                
                jmp     GetStatusEffects(pc)

    ; End of function j_GetStatusEffects


; =============== S U B R O U T I N E =======================================

; unused


j_GetCurrentProwess:
                
            if (VANILLA_BUILD=1)
                jmp     GetCurrentProwess(pc)
            endif

    ; End of function j_GetCurrentProwess


; =============== S U B R O U T I N E =======================================

; unused


j_GetBaseProwess:
                
            if (VANILLA_BUILD=1)
                jmp     GetBaseProwess(pc)
            endif

    ; End of function j_GetBaseProwess


; =============== S U B R O U T I N E =======================================


j_GetBaseMov:
                
                jmp     GetBaseMov(pc)

    ; End of function j_GetBaseMov


; =============== S U B R O U T I N E =======================================


j_GetBaseDef:
                
                jmp     GetBaseDef(pc)

    ; End of function j_GetBaseDef


; =============== S U B R O U T I N E =======================================

; unused


j_GetBaseResistance:
                
            if (VANILLA_BUILD=1)
                jmp     GetBaseResistance(pc)
            endif

    ; End of function j_GetBaseResistance


; =============== S U B R O U T I N E =======================================


j_GetBaseAtt:
                
                jmp     GetBaseAtt(pc)

    ; End of function j_GetBaseAtt


; =============== S U B R O U T I N E =======================================


j_GetBaseAgi:
                
                jmp     GetBaseAgi(pc)

    ; End of function j_GetBaseAgi


; =============== S U B R O U T I N E =======================================


j_GetCurrentMov:
                
                jmp     GetCurrentMov(pc)

    ; End of function j_GetCurrentMov


; =============== S U B R O U T I N E =======================================


j_GetCurrentMp:
                
                jmp     GetCurrentMp(pc)

    ; End of function j_GetCurrentMp


; =============== S U B R O U T I N E =======================================


j_GetLevel:
                
                jmp     GetLevel(pc)    

    ; End of function j_GetLevel


; =============== S U B R O U T I N E =======================================


j_GetCurrentHp:
                
                jmp     GetCurrentHp(pc)

    ; End of function j_GetCurrentHp


; =============== S U B R O U T I N E =======================================


j_GetCurrentExp:
                
                jmp     GetCurrentExp(pc)

    ; End of function j_GetCurrentExp


; =============== S U B R O U T I N E =======================================


j_GetCurrentDef:
                
                jmp     GetCurrentDef(pc)

    ; End of function j_GetCurrentDef


; =============== S U B R O U T I N E =======================================

; unused


j_GetCurrentResistance:
                
            if (VANILLA_BUILD=1)
                jmp     GetCurrentResistance(pc)
            endif

    ; End of function j_GetCurrentResistance


; =============== S U B R O U T I N E =======================================


j_GetCurrentAtt:
                
                jmp     GetCurrentAtt(pc)

    ; End of function j_GetCurrentAtt


; =============== S U B R O U T I N E =======================================


j_GetMoveOrders:
                
                jmp     GetMoveOrders(pc)

    ; End of function j_GetMoveOrders


; =============== S U B R O U T I N E =======================================


j_GetTriggerRegions:
                
                jmp     GetTriggerRegions(pc) 

    ; End of function j_GetTriggerRegions


; =============== S U B R O U T I N E =======================================


j_GetActivationBitfield:
                
                jmp     GetActivationBitfield(pc)

    ; End of function j_GetActivationBitfield


; =============== S U B R O U T I N E =======================================


j_GetCurrentAgi:
                
                jmp     GetCurrentAgi(pc)

    ; End of function j_GetCurrentAgi


; =============== S U B R O U T I N E =======================================


j_GetEnemy:
                
                jmp     GetEnemy(pc)    

    ; End of function j_GetEnemy


; =============== S U B R O U T I N E =======================================

; unused


j_GetCombatantType:
                
            if (VANILLA_BUILD=1)
                jmp     GetCombatantType(pc)
            endif

    ; End of function j_GetCombatantType


; =============== S U B R O U T I N E =======================================


j_GetKills:
                
                jmp     GetKills(pc)

    ; End of function j_GetKills


; =============== S U B R O U T I N E =======================================


j_GetDefeats:
                
                jmp     GetDefeats(pc)

    ; End of function j_GetDefeats


; =============== S U B R O U T I N E =======================================


j_LoadAllyName:
                
                jmp     LoadAllyName(pc)

    ; End of function j_LoadAllyName


; =============== S U B R O U T I N E =======================================


j_SetCombatantY:
                
                jmp     SetCombatantY(pc)

    ; End of function j_SetCombatantY


; =============== S U B R O U T I N E =======================================

; unused


j_SetMaxMp:
                
            if (VANILLA_BUILD=1)
                jmp     SetMaxMp(pc)
            endif

    ; End of function j_SetMaxMp


; =============== S U B R O U T I N E =======================================


j_SetMaxHp:
                
                jmp     SetMaxHp(pc)

    ; End of function j_SetMaxHp


; =============== S U B R O U T I N E =======================================


j_SetCombatantX:
                
                jmp     SetCombatantX(pc)

    ; End of function j_SetCombatantX


; =============== S U B R O U T I N E =======================================


j_SetMovetypeAndAiCommandset:
                
                jmp     SetMovetypeAndAiCommandset(pc)

    ; End of function j_SetMovetypeAndAiCommandset


; =============== S U B R O U T I N E =======================================


j_SetStatusEffects:
                
                jmp     SetStatusEffects(pc)

    ; End of function j_SetStatusEffects


; =============== S U B R O U T I N E =======================================


j_SetCurrentProwess:
                
                jmp     SetCurrentProwess(pc)

    ; End of function j_SetCurrentProwess


; =============== S U B R O U T I N E =======================================


j_SetBaseProwess:
                
                jmp     SetBaseProwess(pc)

    ; End of function j_SetBaseProwess


; =============== S U B R O U T I N E =======================================

; unused


j_SetBaseMov:
                
            if (VANILLA_BUILD=1)
                jmp     SetBaseMov(pc)
            endif

    ; End of function j_SetBaseMov


; =============== S U B R O U T I N E =======================================


j_SetBaseDef:
                
                jmp     SetBaseDef(pc)

    ; End of function j_SetBaseDef


; =============== S U B R O U T I N E =======================================

; unused


j_SetBaseResistance:
                
            if (VANILLA_BUILD=1)
                jmp     SetBaseResistance(pc)
            endif

    ; End of function j_SetBaseResistance


; =============== S U B R O U T I N E =======================================


j_SetBaseAtt:
                
                jmp     SetBaseAtt(pc)

    ; End of function j_SetBaseAtt


; =============== S U B R O U T I N E =======================================


j_SetBaseAgi:
                
                jmp     SetBaseAgi(pc)

    ; End of function j_SetBaseAgi


; =============== S U B R O U T I N E =======================================

; unused


j_SetCurrentMov:
                
            if (VANILLA_BUILD=1)
                jmp     SetCurrentMov(pc)
            endif

    ; End of function j_SetCurrentMov


; =============== S U B R O U T I N E =======================================


j_SetCurrentMp:
                
                jmp     SetCurrentMp(pc)

    ; End of function j_SetCurrentMp


; =============== S U B R O U T I N E =======================================


j_SetLevel:
                
                jmp     SetLevel(pc)

    ; End of function j_SetLevel


; =============== S U B R O U T I N E =======================================


j_SetCurrentHp:
                
                jmp     SetCurrentHp(pc)

    ; End of function j_SetCurrentHp


; =============== S U B R O U T I N E =======================================


j_SetCurrentExp:
                
                jmp     SetCurrentExp(pc)

    ; End of function j_SetCurrentExp


; =============== S U B R O U T I N E =======================================


j_SetCurrentDef:
                
                jmp     SetCurrentDef(pc)

    ; End of function j_SetCurrentDef


; =============== S U B R O U T I N E =======================================


j_SetClass:
                
                jmp     SetClass(pc)

    ; End of function j_SetClass


; =============== S U B R O U T I N E =======================================

; unused


j_SetCurrentResistance:
                
            if (VANILLA_BUILD=1)
                jmp     SetCurrentResistance(pc)
            endif

    ; End of function j_SetCurrentResistance


; =============== S U B R O U T I N E =======================================


j_SetCurrentAtt:
                
                jmp     SetCurrentAtt(pc)

    ; End of function j_SetCurrentAtt


; =============== S U B R O U T I N E =======================================


j_SetMoveOrders:
                
                jmp     SetMoveOrders(pc)

    ; End of function j_SetMoveOrders


; =============== S U B R O U T I N E =======================================


j_SetTriggerRegions:
                
                jmp     SetTriggerRegions(pc)

    ; End of function j_SetTriggerRegions


; =============== S U B R O U T I N E =======================================


j_SetActivationBitfield:
                
                jmp     SetActivationBitfield(pc)

    ; End of function j_SetActivationBitfield


; =============== S U B R O U T I N E =======================================


j_SetCurrentAgi:
                
                jmp     SetCurrentAgi(pc)

    ; End of function j_SetCurrentAgi


; =============== S U B R O U T I N E =======================================


j_SetEnemyIndex:
                
                jmp     SetEnemyIndex(pc)

    ; End of function j_SetEnemyIndex


; =============== S U B R O U T I N E =======================================


j_IncreaseMaxMp:
                
                jmp     IncreaseMaxMp(pc)

    ; End of function j_IncreaseMaxMp


; =============== S U B R O U T I N E =======================================


j_IncreaseMaxHp:
                
                jmp     IncreaseMaxHp(pc)

    ; End of function j_IncreaseMaxHp


; =============== S U B R O U T I N E =======================================


j_IncreaseBaseMov:
                
                jmp     IncreaseBaseMov(pc)

    ; End of function j_IncreaseBaseMov


; =============== S U B R O U T I N E =======================================


j_IncreaseBaseDef:
                
                jmp     IncreaseBaseDef(pc)

    ; End of function j_IncreaseBaseDef


; =============== S U B R O U T I N E =======================================


j_IncreaseBaseAtt:
                
                jmp     IncreaseBaseAtt(pc)

    ; End of function j_IncreaseBaseAtt


; =============== S U B R O U T I N E =======================================


j_IncreaseBaseAgi:
                
                jmp     IncreaseBaseAgi(pc)

    ; End of function j_IncreaseBaseAgi


; =============== S U B R O U T I N E =======================================


j_IncreaseCurrentMov:
                
                jmp     IncreaseCurrentMov(pc)

    ; End of function j_IncreaseCurrentMov


; =============== S U B R O U T I N E =======================================


j_IncreaseCurrentMp:
                
                jmp     IncreaseCurrentMp(pc)

    ; End of function j_IncreaseCurrentMp


; =============== S U B R O U T I N E =======================================

; unused


j_IncreaseLevel:
                
            if (VANILLA_BUILD=1)
                jmp     IncreaseLevel(pc)
            endif

    ; End of function j_IncreaseLevel


; =============== S U B R O U T I N E =======================================


j_IncreaseCurrentHp:
                
                jmp     IncreaseCurrentHp(pc)

    ; End of function j_IncreaseCurrentHp


; =============== S U B R O U T I N E =======================================


j_IncreaseExp:
                
                jmp     IncreaseExp(pc)

    ; End of function j_IncreaseExp


; =============== S U B R O U T I N E =======================================


j_IncreaseCurrentDef:
                
                jmp     IncreaseCurrentDef(pc)

    ; End of function j_IncreaseCurrentDef


; =============== S U B R O U T I N E =======================================


j_IncreaseCurrentAtt:
                
                jmp     IncreaseCurrentAtt(pc)

    ; End of function j_IncreaseCurrentAtt


; =============== S U B R O U T I N E =======================================


j_IncreaseCurrentAgi:
                
                jmp     IncreaseCurrentAgi(pc)

    ; End of function j_IncreaseCurrentAgi


; =============== S U B R O U T I N E =======================================


j_IncreaseKills:
                
                jmp     IncreaseKills(pc)

    ; End of function j_IncreaseKills


; =============== S U B R O U T I N E =======================================


j_IncreaseDefeats:
                
                jmp     IncreaseDefeats(pc)

    ; End of function j_IncreaseDefeats


; =============== S U B R O U T I N E =======================================

; unused


j_DecreaseBaseMov:
                
            if (VANILLA_BUILD=1)
                jmp     DecreaseBaseMov(pc)
            endif

    ; End of function j_DecreaseBaseMov


; =============== S U B R O U T I N E =======================================

; unused


j_DecreaseBaseDef:
                
            if (VANILLA_BUILD=1)
                jmp     DecreaseBaseDef(pc)
            endif

    ; End of function j_DecreaseBaseDef


; =============== S U B R O U T I N E =======================================

; unused


j_DecreaseBaseAgi:
                
            if (VANILLA_BUILD=1)
                jmp     DecreaseBaseAgi(pc)
            endif

    ; End of function j_DecreaseBaseAgi


; =============== S U B R O U T I N E =======================================

; unused


j_DecreaseCurrentMov:
                
            if (VANILLA_BUILD=1)
                jmp     DecreaseCurrentMov(pc)
            endif

    ; End of function j_DecreaseCurrentMov


; =============== S U B R O U T I N E =======================================


j_DecreaseCurrentMp:
                
                jmp     DecreaseCurrentMp(pc)

    ; End of function j_DecreaseCurrentMp


; =============== S U B R O U T I N E =======================================


j_DecreaseCurrentHp:
                
                jmp     DecreaseCurrentHp(pc)

    ; End of function j_DecreaseCurrentHp


; =============== S U B R O U T I N E =======================================

; unused


j_DecreaseCurrentDef:
                
            if (VANILLA_BUILD=1)
                jmp     DecreaseCurrentDef(pc)
            endif

    ; End of function j_DecreaseCurrentDef


; =============== S U B R O U T I N E =======================================

; unused


j_DecreaseCurrentAtt:
                
            if (VANILLA_BUILD=1)
                jmp     DecreaseCurrentAtt(pc)
            endif

    ; End of function j_DecreaseCurrentAtt


; =============== S U B R O U T I N E =======================================

; unused


j_DecreaseCurrentAgi:
                
            if (VANILLA_BUILD=1)
                jmp     DecreaseCurrentAgi(pc)
            endif

    ; End of function j_DecreaseCurrentAgi


; =============== S U B R O U T I N E =======================================


j_GetClassName:
                
                jmp     GetClassName(pc)

    ; End of function j_GetClassName


; =============== S U B R O U T I N E =======================================


j_SetGold:
                
                jmp     SetGold(pc)

    ; End of function j_SetGold


; =============== S U B R O U T I N E =======================================


j_GetGold:
                
                jmp     GetGold(pc)

    ; End of function j_GetGold


; =============== S U B R O U T I N E =======================================


j_IncreaseGold:
                
                jmp     IncreaseGold(pc)

    ; End of function j_IncreaseGold


; =============== S U B R O U T I N E =======================================


j_DecreaseGold:
                
                jmp     DecreaseGold(pc)

    ; End of function j_DecreaseGold


; =============== S U B R O U T I N E =======================================


j_UpdateCombatantStats:
                
                jmp     UpdateCombatantStats(pc)

    ; End of function j_UpdateCombatantStats


; =============== S U B R O U T I N E =======================================

; unused


j_ApplyItemOnStats:
                
            if (VANILLA_BUILD=1)
                jmp     ApplyItemOnStats(pc)
            endif

    ; End of function j_ApplyItemOnStats


; =============== S U B R O U T I N E =======================================


j_GetItemName:
                
                jmp     GetItemName(pc) 

    ; End of function j_GetItemName


; =============== S U B R O U T I N E =======================================


j_GetItemDefinitionAddress:
                
                jmp     GetItemDefinitionAddress(pc)

    ; End of function j_GetItemDefinitionAddress


; =============== S U B R O U T I N E =======================================


j_GetItemBySlotAndHeldItemsNumber:
                
                jmp     GetItemBySlotAndHeldItemsNumber(pc)

    ; End of function j_GetItemBySlotAndHeldItemsNumber


; =============== S U B R O U T I N E =======================================


j_GetEquipmentType:
                
                jmp     GetEquipmentType(pc)

    ; End of function j_GetEquipmentType


; =============== S U B R O U T I N E =======================================


j_GetEquippedWeapon:
                
                jmp     GetEquippedWeapon(pc)

    ; End of function j_GetEquippedWeapon


; =============== S U B R O U T I N E =======================================


j_GetEquippedRing:
                
                jmp     GetEquippedRing(pc)

    ; End of function j_GetEquippedRing


; =============== S U B R O U T I N E =======================================

; unused


j_BreakItemBySlot:
                
            if (VANILLA_BUILD=1)
                jmp     BreakItemBySlot(pc)
            endif

    ; End of function j_BreakItemBySlot


; =============== S U B R O U T I N E =======================================


j_RepairItemBySlot:
                
                jmp     RepairItemBySlot(pc)

    ; End of function j_RepairItemBySlot


; =============== S U B R O U T I N E =======================================


j_EquipItemBySlot:
                
                jmp     EquipItemBySlot(pc)

    ; End of function j_EquipItemBySlot


; =============== S U B R O U T I N E =======================================


j_UnequipItemBySlotIfNotCursed:
                
                jmp     UnequipItemBySlotIfNotCursed(pc)

    ; End of function j_UnequipItemBySlotIfNotCursed


; =============== S U B R O U T I N E =======================================


j_UnequipItemBySlot:
                
                jmp     UnequipItemBySlot(pc)

    ; End of function j_UnequipItemBySlot


; =============== S U B R O U T I N E =======================================


j_AddItem:
                
                jmp     AddItem(pc)     

    ; End of function j_AddItem


; =============== S U B R O U T I N E =======================================


j_RemoveItemBySlot:
                
                jmp     RemoveItemBySlot(pc)

    ; End of function j_RemoveItemBySlot


; =============== S U B R O U T I N E =======================================


j_DropItemBySlot:
                
                jmp     DropItemBySlot(pc)

    ; End of function j_DropItemBySlot


; =============== S U B R O U T I N E =======================================


j_UnequipWeapon:
                
                jmp     UnequipWeapon(pc)

    ; End of function j_UnequipWeapon


; =============== S U B R O U T I N E =======================================


j_UnequipRing:
                
                jmp     UnequipRing(pc)

    ; End of function j_UnequipRing


; =============== S U B R O U T I N E =======================================


j_GetEquippableWeapons:
                
                jmp     GetEquippableWeapons(pc)

    ; End of function j_GetEquippableWeapons


; =============== S U B R O U T I N E =======================================


j_GetEquippableRings:
                
                jmp     GetEquippableRings(pc)

    ; End of function j_GetEquippableRings


; =============== S U B R O U T I N E =======================================


j_IsWeaponOrRingEquippable:
                
                jmp     IsWeaponOrRingEquippable(pc)

    ; End of function j_IsWeaponOrRingEquippable


; =============== S U B R O U T I N E =======================================


j_GetEquipNewAttAndDef:
                
                jmp     GetEquipNewAttAndDef(pc)

    ; End of function j_GetEquipNewAttAndDef


; =============== S U B R O U T I N E =======================================

; unused

j_OrderItems:
                
            if (VANILLA_BUILD=1)
                jmp     OrderItems(pc)
            endif

    ; End of function j_OrderItems


; =============== S U B R O U T I N E =======================================


j_IsItemCursed:
                
                jmp     IsItemCursed(pc)

    ; End of function j_IsItemCursed


; =============== S U B R O U T I N E =======================================


j_IsItemUsableInBattle:
                
                jmp     IsItemUsableInBattle(pc)

    ; End of function j_IsItemUsableInBattle


; =============== S U B R O U T I N E =======================================


j_IsItemUsableByCombatant:
                
                jmp     IsItemUsableByCombatant(pc)

    ; End of function j_IsItemUsableByCombatant


; =============== S U B R O U T I N E =======================================


j_UnequipAllItemsIfNotCursed:
                
                jmp     UnequipAllItemsIfNotCursed(pc)

    ; End of function j_UnequipAllItemsIfNotCursed


; =============== S U B R O U T I N E =======================================


j_GetItemInventoryLocation:
                
                jmp     GetItemInventoryLocation(pc)

    ; End of function j_GetItemInventoryLocation


; =============== S U B R O U T I N E =======================================

; unused


j_GetItemSlotContainingIndex:
                
            if (VANILLA_BUILD=1)
                jmp     GetItemSlotContainingIndex(pc)
            endif

    ; End of function j_GetItemSlotContainingIndex


; =============== S U B R O U T I N E =======================================


j_GetSpellName:
                
                jmp     GetSpellName(pc)

    ; End of function j_GetSpellName


; =============== S U B R O U T I N E =======================================


j_GetSpellDefinitionAddress:
                
                jmp     GetSpellDefinitionAddress(pc)

    ; End of function j_GetSpellDefinitionAddress


; =============== S U B R O U T I N E =======================================


j_GetSpellAndNumberOfSpells:
                
                jmp     GetSpellAndNumberOfSpells(pc)

    ; End of function j_GetSpellAndNumberOfSpells


; =============== S U B R O U T I N E =======================================


j_GetSpellCost:
                
                jmp     GetSpellCost(pc)

    ; End of function j_GetSpellCost


; =============== S U B R O U T I N E =======================================


j_LearnSpell:
                
                jmp     LearnSpell(pc)  

    ; End of function j_LearnSpell


; =============== S U B R O U T I N E =======================================


j_GetCombatantEntryAddress_0:
                
            if (VANILLA_BUILD=1)
                jmp     GetCombatantEntryAddress(pc)
            endif

    ; End of function j_GetCombatantEntryAddress_0


; =============== S U B R O U T I N E =======================================

; unused


j_GetDistanceBetweenCombatants:
                
            if (VANILLA_BUILD=1)
                jmp     GetDistanceBetweenCombatants(pc)
            endif

    ; End of function j_GetDistanceBetweenCombatants


; =============== S U B R O U T I N E =======================================

; unused


j_nullsub_9482:
                
            if (VANILLA_BUILD=1)
                jmp     nullsub_9482(pc)
            endif

    ; End of function j_nullsub_9482


; =============== S U B R O U T I N E =======================================


j_GetCombatantEntryAddress:
                
                jmp     GetCombatantEntryAddress(pc)

    ; End of function j_GetCombatantEntryAddress


; =============== S U B R O U T I N E =======================================


j_NewGame:
                
                jmp     NewGame(pc)

    ; End of function j_NewGame


; =============== S U B R O U T I N E =======================================


j_LevelUp:
                
                jmp     LevelUp(pc)     

    ; End of function j_LevelUp


; =============== S U B R O U T I N E =======================================


j_Promote:
                
                jmp     Promote(pc)

    ; End of function j_Promote


; =============== S U B R O U T I N E =======================================


j_DebugModeActionSelect:
                
                jmp     DebugModeActionSelect(pc)

    ; End of function j_DebugModeActionSelect


; =============== S U B R O U T I N E =======================================


j_WriteBattlesceneScript:
                
                jmp     WriteBattlesceneScript(pc)

    ; End of function j_WriteBattlesceneScript


; =============== S U B R O U T I N E =======================================


j_BuildAttackRangeGrid:
                
                jmp     BuildAttackRangeGrid(pc)

    ; End of function j_BuildAttackRangeGrid


; =============== S U B R O U T I N E =======================================


j_BuildSpellRangeGrid:
                
                jmp     BuildSpellRangeGrid(pc)

    ; End of function j_BuildSpellRangeGrid


; =============== S U B R O U T I N E =======================================


j_BuildSpellRangeGridForItemUse:
                
                jmp     BuildSpellRangeGridForItemUse(pc)

    ; End of function j_BuildSpellRangeGridForItemUse


; =============== S U B R O U T I N E =======================================


j_BuildSpellRangeGridForItemGive:
                
                jmp     BuildSpellRangeGridForItemGive(pc)

    ; End of function j_BuildSpellRangeGridForItemGive


; =============== S U B R O U T I N E =======================================

; unused


j_PopulateTargetsListForItemUse:
                
            if (VANILLA_BUILD=1)
                jmp     PopulateTargetsListForItemUse(pc)
            endif

    ; End of function j_PopulateTargetsListForItemUse


; =============== S U B R O U T I N E =======================================

; unused


j_unusedsub_C5FA:
                
            if (VANILLA_BUILD=1)
                jmp     unusedsub_C5FA(pc)      
            endif

    ; End of function j_unusedsub_C5FA


; =============== S U B R O U T I N E =======================================

; unused


j_PopulateTargetsListForSpell:
                
            if (VANILLA_BUILD=1)
                jmp     PopulateTargetsListForSpell(pc)
            endif

    ; End of function j_PopulateTargetsListForSpell


; =============== S U B R O U T I N E =======================================

; unused


j_PopulateTargetsList:
                
            if (VANILLA_BUILD=1)
                jmp     PopulateTargetsList(pc)
            endif

    ; End of function j_PopulateTargetsList


; =============== S U B R O U T I N E =======================================

; unused


j_BuildTargetsArrayWithTeammatesOfTarget:
                
            if (VANILLA_BUILD=1)
                jmp     BuildTargetsArrayWithTeammatesOfTarget(pc)
            endif

    ; End of function j_BuildTargetsArrayWithTeammatesOfTarget


; =============== S U B R O U T I N E =======================================

; unused


j_BuildTargetsArrayWithAllies:
                
            if (VANILLA_BUILD=1)
                jmp     BuildTargetsArrayWithAllies(pc)
            endif

    ; End of function j_BuildTargetsArrayWithAllies


; =============== S U B R O U T I N E =======================================

; unused


j_BuildTargetsArrayWithEnemies:
                
            if (VANILLA_BUILD=1)
                jmp     BuildTargetsArrayWithEnemies(pc)
            endif

    ; End of function j_BuildTargetsArrayWithEnemies


; =============== S U B R O U T I N E =======================================

; unused


j_BuildTargetsArrayWithAllCombatants:
                
            if (VANILLA_BUILD=1)
                jmp     BuildTargetsArrayWithAllCombatants(pc)
            endif

    ; End of function j_BuildTargetsArrayWithAllCombatants


; =============== S U B R O U T I N E =======================================


j_UpdateOccupiedByAlliesTerrain:
                
                jmp     UpdateOccupiedByAlliesTerrain(pc)

    ; End of function j_UpdateOccupiedByAlliesTerrain


; =============== S U B R O U T I N E =======================================


j_UpdateOccupiedByEnemiesTerrain:
                
                jmp     UpdateOccupiedByEnemiesTerrain(pc)

    ; End of function j_UpdateOccupiedByEnemiesTerrain


; =============== S U B R O U T I N E =======================================


j_ConvertCoordinatesToAddress:
                
                jmp     ConvertCoordinatesToAddress(pc)

    ; End of function j_ConvertCoordinatesToAddress


; =============== S U B R O U T I N E =======================================


j_ClearTotalMovecostsAndMovableGridArrays:
                
                jmp     ClearTotalMovecostsAndMovableGridArrays(pc)

    ; End of function j_ClearTotalMovecostsAndMovableGridArrays


; =============== S U B R O U T I N E =======================================

; unused


j_ClearTargetsArray:
                
            if (VANILLA_BUILD=1)
                jmp     ClearTargetsArray(pc)
            endif

    ; End of function j_ClearTargetsArray


; =============== S U B R O U T I N E =======================================


j_GetCombatantOccupyingSpace:
                
                jmp     GetCombatantOccupyingSpace(pc)

    ; End of function j_GetCombatantOccupyingSpace


; =============== S U B R O U T I N E =======================================


j_GetLandEffectSetting:
                
                jmp     GetLandEffectSetting(pc)

    ; End of function j_GetLandEffectSetting


; =============== S U B R O U T I N E =======================================


j_GetCurrentTerrainType:
                
                jmp     GetCurrentTerrainType(pc)

    ; End of function j_GetCurrentTerrainType


; =============== S U B R O U T I N E =======================================


j_SetMovableSpace:
                
                jmp     SetMovableSpace(pc)

    ; End of function j_SetMovableSpace


; =============== S U B R O U T I N E =======================================


j_CheckFlag:
                
                jmp     CheckFlag(pc)

    ; End of function j_CheckFlag


; =============== S U B R O U T I N E =======================================


j_SetFlag:
                
                jmp     SetFlag(pc)

    ; End of function j_SetFlag


; =============== S U B R O U T I N E =======================================


j_ClearFlag:
                
                jmp     ClearFlag(pc)

    ; End of function j_ClearFlag


; =============== S U B R O U T I N E =======================================


j_UpdateForce:
                
                jmp     UpdateForce(pc) 

    ; End of function j_UpdateForce


; =============== S U B R O U T I N E =======================================


j_JoinForce:
                
                jmp     JoinForce(pc)   

    ; End of function j_JoinForce


; =============== S U B R O U T I N E =======================================

; unused


j_LeaveForce:
                
            if (VANILLA_BUILD=1)
                jmp     LeaveForce(pc)  
            endif

    ; End of function j_LeaveForce


; =============== S U B R O U T I N E =======================================


j_IsInBattleParty:
                
                jmp     IsInBattleParty(pc)

    ; End of function j_IsInBattleParty


; =============== S U B R O U T I N E =======================================


j_JoinBattleParty:
                
                jmp     JoinBattleParty(pc)

    ; End of function j_JoinBattleParty


; =============== S U B R O U T I N E =======================================


j_LeaveBattleParty:
                
                jmp     LeaveBattleParty(pc)

    ; End of function j_LeaveBattleParty


; =============== S U B R O U T I N E =======================================


j_GetDealsItemAmount:
                
                jmp     GetDealsItemAmount(pc)

    ; End of function j_GetDealsItemAmount


; =============== S U B R O U T I N E =======================================


j_AddItemToDeals:
                
                jmp     AddItemToDeals(pc)

    ; End of function j_AddItemToDeals


; =============== S U B R O U T I N E =======================================


j_RemoveItemFromDeals:
                
                jmp     RemoveItemFromDeals(pc)

    ; End of function j_RemoveItemFromDeals


; =============== S U B R O U T I N E =======================================


j_AddItemToCaravan:
                
                jmp     AddItemToCaravan(pc)

    ; End of function j_AddItemToCaravan


; =============== S U B R O U T I N E =======================================


j_RemoveItemFromCaravan:
                
                jmp     RemoveItemFromCaravan(pc)

    ; End of function j_RemoveItemFromCaravan


; =============== S U B R O U T I N E =======================================

; unused


j_AddAllToStack:
                
            if (VANILLA_BUILD=1)
                jmp     AddAllToStack(pc)
            endif

    ; End of function j_AddAllToStack


; =============== S U B R O U T I N E =======================================


j_StartAiControl:
                
                jmp     StartAiControl(pc)

    ; End of function j_StartAiControl


; =============== S U B R O U T I N E =======================================


j_BuildMovementArrays:
                
                jmp     BuildMovementArrays(pc)

    ; End of function j_BuildMovementArrays


; =============== S U B R O U T I N E =======================================


j_BuildMovementRangeGrid:
                
                jmp     BuildMovementRangeGrid(pc)

    ; End of function j_BuildMovementRangeGrid


; =============== S U B R O U T I N E =======================================


j_BuildCancelMoveString:
                
                jmp     BuildCancelMoveString(pc)

    ; End of function j_BuildCancelMoveString


; =============== S U B R O U T I N E =======================================


j_GetTerrain:
                
                jmp     GetTerrain(pc)  

    ; End of function j_GetTerrain


; =============== S U B R O U T I N E =======================================


j_SetTerrain:
                
                jmp     SetTerrain(pc)  

    ; End of function j_SetTerrain


; =============== S U B R O U T I N E =======================================


j_ClearAiMemory:
                
            if (VANILLA_BUILD=1)
                jmp     ClearAiMemory(pc)
            endif

    ; End of function j_ClearAiMemory


; =============== S U B R O U T I N E =======================================


j_InitializeMovementArrays:
                
                jmp     InitializeMovementArrays(pc)

    ; End of function j_InitializeMovementArrays


; =============== S U B R O U T I N E =======================================


j_GetDifficulty:
                
                jmp     GetDifficulty(pc)

    ; End of function j_GetDifficulty

