
; ASM FILE code\common\stats\statsengine.asm :
; 0x8000..0x9A9A : Character stats engine

; =============== S U B R O U T I N E =======================================

j_GetCharName:
		
		jmp     GetCharName(pc) 

	; End of function j_GetCharName


; =============== S U B R O U T I N E =======================================

; get entity's class index ?

j_GetClass:
		jmp     GetClass(pc)

	; End of function j_GetClass


; =============== S U B R O U T I N E =======================================

j_GetYPos:
		jmp     GetYPos(pc)

	; End of function j_GetYPos


; =============== S U B R O U T I N E =======================================

j_GetMaxMP:
		jmp     GetMaxMP(pc)

	; End of function j_GetMaxMP


; =============== S U B R O U T I N E =======================================

j_GetMaxHP:
		jmp     GetMaxHP(pc)

	; End of function j_GetMaxHP


; =============== S U B R O U T I N E =======================================

j_GetXPos:
		jmp     GetXPos(pc)

	; End of function j_GetXPos


; =============== S U B R O U T I N E =======================================

j_GetUpperMoveType:
		
		jmp     GetUpperMoveType(pc)

	; End of function j_GetUpperMoveType


; =============== S U B R O U T I N E =======================================

j_GetStatus:
		jmp     GetStatus(pc)

	; End of function j_GetStatus


; =============== S U B R O U T I N E =======================================

j_GetCurrentSpecialAbility:
		
		jmp     GetCurrentProwess(pc)

	; End of function j_GetCurrentSpecialAbility


; =============== S U B R O U T I N E =======================================

j_GetBaseSpecialAbility:
		
		jmp     GetBaseProwess(pc)

	; End of function j_GetBaseSpecialAbility


; =============== S U B R O U T I N E =======================================

j_GetBaseMOV:
		jmp     GetBaseMOV(pc)

	; End of function j_GetBaseMOV


; =============== S U B R O U T I N E =======================================

j_GetBaseDEF:
		jmp     GetBaseDEF(pc)

	; End of function j_GetBaseDEF


; =============== S U B R O U T I N E =======================================

j_GetBaseResistance:
		
		jmp     GetBaseResistance(pc)

	; End of function j_GetBaseResistance


; =============== S U B R O U T I N E =======================================

j_GetBaseATK:
		jmp     GetBaseATK(pc)

	; End of function j_GetBaseATK


; =============== S U B R O U T I N E =======================================

j_GetBaseAGI:
		jmp     GetBaseAGI(pc)

	; End of function j_GetBaseAGI


; =============== S U B R O U T I N E =======================================

j_GetCurrentMOV:
		
		jmp     GetCurrentMOV(pc)

	; End of function j_GetCurrentMOV


; =============== S U B R O U T I N E =======================================

j_GetCurrentMP:
		
		jmp     GetCurrentMP(pc)

	; End of function j_GetCurrentMP


; =============== S U B R O U T I N E =======================================

j_GetCurrentLevel:
		
		jmp     GetCurrentLevel(pc)

	; End of function j_GetCurrentLevel


; =============== S U B R O U T I N E =======================================

j_GetCurrentHP:
		
		jmp     GetCurrentHP(pc)

	; End of function j_GetCurrentHP


; =============== S U B R O U T I N E =======================================

j_GetCurrentEXP:
		
		jmp     GetCurrentEXP(pc)

	; End of function j_GetCurrentEXP


; =============== S U B R O U T I N E =======================================

j_GetCurrentDEF:
		
		jmp     GetCurrentDEF(pc)

	; End of function j_GetCurrentDEF


; =============== S U B R O U T I N E =======================================

j_GetCurrentResistance:
		
		jmp     GetCurrentResistance(pc)

	; End of function j_GetCurrentResistance


; =============== S U B R O U T I N E =======================================

j_GetCurrentATK:
		
		jmp     GetCurrentATK(pc)

	; End of function j_GetCurrentATK


; =============== S U B R O U T I N E =======================================

j_GetEnemyAISetting3233:
		
		jmp     GetEnemyAISetting3233(pc)

	; End of function j_GetEnemyAISetting3233


; =============== S U B R O U T I N E =======================================

j_GetEnemyAISetting36:
		
		jmp     GetEnemyAISetting36(pc)

	; End of function j_GetEnemyAISetting36


; =============== S U B R O U T I N E =======================================

; related to AI control on 0x0004 ?

j_GetCharacterWord34:
		
		jmp     GetCharacterWord34(pc)

	; End of function j_GetCharacterWord34


; =============== S U B R O U T I N E =======================================

j_GetCurrentAGI:
		
		jmp     GetCurrentAGI(pc)

	; End of function j_GetCurrentAGI


; =============== S U B R O U T I N E =======================================

j_GetEnemyID:
		jmp     GetEnemyID(pc)

	; End of function j_GetEnemyID


; =============== S U B R O U T I N E =======================================

j_GetSomethingClassType:
		
		jmp     GetSomethingClassType(pc)

	; End of function j_GetSomethingClassType


; =============== S U B R O U T I N E =======================================

j_GetKills:
		jmp     GetKills(pc)

	; End of function j_GetKills


; =============== S U B R O U T I N E =======================================

j_GetDefeats:
		jmp     GetDefeats(pc)

	; End of function j_GetDefeats


; =============== S U B R O U T I N E =======================================

j_CopyCharNameToRAM:
		
		jmp     CopyCharNameToRAM(pc)

	; End of function j_CopyCharNameToRAM


; =============== S U B R O U T I N E =======================================

j_SetYPos:
		jmp     SetYPos(pc)

	; End of function j_SetYPos


; =============== S U B R O U T I N E =======================================

j_SetMaxMP:
		jmp     SetMaxMP(pc)

	; End of function j_SetMaxMP


; =============== S U B R O U T I N E =======================================

j_SetMaxHP:
		jmp     SetMaxHP(pc)

	; End of function j_SetMaxHP


; =============== S U B R O U T I N E =======================================

j_SetXPos:
		jmp     SetXPos(pc)

	; End of function j_SetXPos


; =============== S U B R O U T I N E =======================================

j_SetMoveType:
		
		jmp     SetMoveType(pc)

	; End of function j_SetMoveType


; =============== S U B R O U T I N E =======================================

j_SetStatus:
		jmp     SetStatus(pc)

	; End of function j_SetStatus


; =============== S U B R O U T I N E =======================================

j_SetCurrentSomething:
		
		jmp     SetCurrentSomething(pc)

	; End of function j_SetCurrentSomething


; =============== S U B R O U T I N E =======================================

j_SetBaseSomething:
		
		jmp     SetBaseSomething(pc)

	; End of function j_SetBaseSomething


; =============== S U B R O U T I N E =======================================

j_SetBaseMOV:
		jmp     SetBaseMOV(pc)

	; End of function j_SetBaseMOV


; =============== S U B R O U T I N E =======================================

j_SetBaseDEF:
		jmp     SetBaseDEF(pc)

	; End of function j_SetBaseDEF


; =============== S U B R O U T I N E =======================================

j_SetBaseResistance:
		
		jmp     SetBaseResistance(pc)

	; End of function j_SetBaseResistance


; =============== S U B R O U T I N E =======================================

j_SetBaseATK:
		jmp     SetBaseATK(pc)

	; End of function j_SetBaseATK


; =============== S U B R O U T I N E =======================================

j_SetBaseAGI:
		jmp     SetBaseAGI(pc)

	; End of function j_SetBaseAGI


; =============== S U B R O U T I N E =======================================

j_SetCurrentMOV:
		
		jmp     SetCurrentMOV(pc)

	; End of function j_SetCurrentMOV


; =============== S U B R O U T I N E =======================================

j_SetCurrentMP:
		
		jmp     SetCurrentMP(pc)

	; End of function j_SetCurrentMP


; =============== S U B R O U T I N E =======================================

j_SetLevel:
		jmp     SetLevel(pc)

	; End of function j_SetLevel


; =============== S U B R O U T I N E =======================================

j_SetCurrentHP:
		
		jmp     SetCurrentHP(pc)

	; End of function j_SetCurrentHP


; =============== S U B R O U T I N E =======================================

j_SetCurrentEXP:
		
		jmp     SetCurrentEXP(pc)

	; End of function j_SetCurrentEXP


; =============== S U B R O U T I N E =======================================

j_SetCurrentDEF:
		
		jmp     SetCurrentDEF(pc)

	; End of function j_SetCurrentDEF


; =============== S U B R O U T I N E =======================================

j_SetClass:
		jmp     SetClass(pc)

	; End of function j_SetClass


; =============== S U B R O U T I N E =======================================

j_SetCurrentResistance:
		
		jmp     SetCurrentResistance(pc)

	; End of function j_SetCurrentResistance


; =============== S U B R O U T I N E =======================================

j_SetCurrentATK:
		
		jmp     SetCurrentATK(pc)

	; End of function j_SetCurrentATK


; =============== S U B R O U T I N E =======================================

j_SetKills:
		jmp     SetKills(pc)    

	; End of function j_SetKills


; =============== S U B R O U T I N E =======================================

j_SetDefeats:
		jmp     SetDefeats(pc)  

	; End of function j_SetDefeats


; =============== S U B R O U T I N E =======================================

j_SetCharacterWord34:
		
		jmp     SetCharacterWord34(pc)

	; End of function j_SetCharacterWord34


; =============== S U B R O U T I N E =======================================

j_SetCurrentAGI:
		
		jmp     SetCurrentAGI(pc)

	; End of function j_SetCurrentAGI


; =============== S U B R O U T I N E =======================================

j_SetEnemyID:
		jmp     SetEnemyID(pc)

	; End of function j_SetEnemyID


; =============== S U B R O U T I N E =======================================

j_IncreaseMP:
		jmp     IncreaseMaxMP(pc)

	; End of function j_IncreaseMP


; =============== S U B R O U T I N E =======================================

j_IncreaseMaxHP:
		
		jmp     IncreaseMaxHP(pc)

	; End of function j_IncreaseMaxHP


; =============== S U B R O U T I N E =======================================

j_IncreaseBaseMOV:
		
		jmp     IncreaseBaseMOV(pc)

	; End of function j_IncreaseBaseMOV


; =============== S U B R O U T I N E =======================================

j_IncreaseBaseDEF:
		
		jmp     IncreaseBaseDEF(pc)

	; End of function j_IncreaseBaseDEF


; =============== S U B R O U T I N E =======================================

j_IncreaseBaseATK:
		
		jmp     IncreaseBaseATK(pc)

	; End of function j_IncreaseBaseATK


; =============== S U B R O U T I N E =======================================

j_IncreaseAGI:
		
		jmp     IncreaseBaseAGI(pc)

	; End of function j_IncreaseAGI


; =============== S U B R O U T I N E =======================================

j_IncreaseCurrentMOV:
		
		jmp     IncreaseCurrentMOV(pc)

	; End of function j_IncreaseCurrentMOV


; =============== S U B R O U T I N E =======================================

j_IncreaseCurrentMP:
		
		jmp     IncreaseCurrentMP(pc)

	; End of function j_IncreaseCurrentMP


; =============== S U B R O U T I N E =======================================

j_IncreaseLevel:
		
		jmp     IncreaseLevel(pc)

	; End of function j_IncreaseLevel


; =============== S U B R O U T I N E =======================================

j_IncreaseCurrentHP:
		
		jmp     IncreaseCurrentHP(pc)

	; End of function j_IncreaseCurrentHP


; =============== S U B R O U T I N E =======================================

j_IncreaseEXP:
		
		jmp     IncreaseEXP(pc)

	; End of function j_IncreaseEXP


; =============== S U B R O U T I N E =======================================

j_IncreaseCurrentDEF:
		
		jmp     IncreaseCurrentDEF(pc)

	; End of function j_IncreaseCurrentDEF


; =============== S U B R O U T I N E =======================================

j_IncreaseCurrentATK:
		
		jmp     IncreaseCurrentATK(pc)

	; End of function j_IncreaseCurrentATK


; =============== S U B R O U T I N E =======================================

j_IncreaseCurrentAGI:
		
		jmp     IncreaseCurrentAGI(pc)

	; End of function j_IncreaseCurrentAGI


; =============== S U B R O U T I N E =======================================

j_IncreaseKills:
		
		jmp     IncreaseKills(pc)

	; End of function j_IncreaseKills


; =============== S U B R O U T I N E =======================================

j_IncreaseDefeats:
		
		jmp     IncreaseDefeats(pc)

	; End of function j_IncreaseDefeats


; =============== S U B R O U T I N E =======================================

j_DecreaseBaseMOV:
		
		jmp     DecreaseBaseMOV(pc)

	; End of function j_DecreaseBaseMOV


; =============== S U B R O U T I N E =======================================

j_DecreaseBaseDEF:
		
		jmp     DecreaseBaseDEF(pc)

	; End of function j_DecreaseBaseDEF


; =============== S U B R O U T I N E =======================================

j_DecreaseBaseAGI:
		
		jmp     DecreaseBaseAGI(pc)

	; End of function j_DecreaseBaseAGI


; =============== S U B R O U T I N E =======================================

j_DecreaseCurrentMOV:
		
		jmp     DecreaseCurrentMOV(pc)

	; End of function j_DecreaseCurrentMOV


; =============== S U B R O U T I N E =======================================

j_DecreaseCurrentMP:
		
		jmp     DecreaseCurrentMP(pc)

	; End of function j_DecreaseCurrentMP


; =============== S U B R O U T I N E =======================================

j_DecreaseCurrentHP:
		
		jmp     DecreaseCurrentHP(pc)

	; End of function j_DecreaseCurrentHP


; =============== S U B R O U T I N E =======================================

j_DecreaseCurrentDEF:
		
		jmp     DecreaseCurrentDEF(pc)

	; End of function j_DecreaseCurrentDEF


; =============== S U B R O U T I N E =======================================

j_DecreaseCurrentATK:
		
		jmp     DecreaseCurrentATK(pc)

	; End of function j_DecreaseCurrentATK


; =============== S U B R O U T I N E =======================================

j_DecreaseCurrentAGI:
		
		jmp     DecreaseCurrentAGI(pc)

	; End of function j_DecreaseCurrentAGI


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

j_ApplyStatusAndItemsOnStats:
		
		jmp     ApplyStatusAndItemsOnStats(pc)

	; End of function j_ApplyStatusAndItemsOnStats


; =============== S U B R O U T I N E =======================================

j_ApplyItemOnStats:
		
		jmp     ApplyItemOnStats(pc)

	; End of function j_ApplyItemOnStats


; =============== S U B R O U T I N E =======================================

j_FindItemName:
		
		jmp     FindItemName(pc)

	; End of function j_FindItemName


; =============== S U B R O U T I N E =======================================

j_GetItemDefAddress:
		
		jmp     GetItemDefAddress(pc)

	; End of function j_GetItemDefAddress


; =============== S U B R O U T I N E =======================================

j_GetItemAndNumberOfItems:
		
		jmp     GetCharItemAtSlotAndNumberOfItems(pc)

	; End of function j_GetItemAndNumberOfItems


; =============== S U B R O U T I N E =======================================

j_GetItemType:
		
		jmp     GetItemType(pc) 

	; End of function j_GetItemType


; =============== S U B R O U T I N E =======================================

j_GetEquippedWeapon:
		
		jmp     GetEquippedWeapon(pc)

	; End of function j_GetEquippedWeapon


; =============== S U B R O U T I N E =======================================

j_GetEquippedRing:
		
		jmp     GetEquippedRing(pc)

	; End of function j_GetEquippedRing


; =============== S U B R O U T I N E =======================================

j_BreakItem:
		jmp     BreakItem(pc)   

	; End of function j_BreakItem


; =============== S U B R O U T I N E =======================================

j_RepairItemBySlot:
		
		jmp     RepairItemBySlot(pc)

	; End of function j_RepairItemBySlot


; =============== S U B R O U T I N E =======================================

j_EquipItem:
		jmp     EquipItemBySlot(pc)

	; End of function j_EquipItem


; =============== S U B R O U T I N E =======================================

j_UnequipItemIfNotCursed:
		
		jmp     UnequipItemBySlotIfNotCursed(pc)

	; End of function j_UnequipItemIfNotCursed


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

j_GetWeaponNewATKandDEF:
		
		jmp     GetWeaponNewATKandDEF(pc)

	; End of function j_GetWeaponNewATKandDEF


; =============== S U B R O U T I N E =======================================

j_OrderItems:
		jmp     OrderItems(pc)

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

j_IsItemUsableWeaponInBattle:
		
		jmp     IsItemUsableWeaponInBattle(pc)

	; End of function j_IsItemUsableWeaponInBattle


; =============== S U B R O U T I N E =======================================

j_UnequipAllItemsIfNotCursed:
		
		jmp     UnequipAllItemsIfNotCursed(pc)

	; End of function j_UnequipAllItemsIfNotCursed


; =============== S U B R O U T I N E =======================================

j_sub_9146:
		jmp     j_sub_9146_0(pc)

	; End of function j_sub_9146


; =============== S U B R O U T I N E =======================================

j_GetItemSlotContainingIndex:
		
		jmp     GetItemSlotContainingIndex(pc)

	; End of function j_GetItemSlotContainingIndex


; =============== S U B R O U T I N E =======================================

j_FindSpellName:
		
		jmp     FindSpellName(pc)

	; End of function j_FindSpellName


; =============== S U B R O U T I N E =======================================

j_GetSpellDefAddress:
		
		jmp     GetSpellDefAddress(pc)

	; End of function j_GetSpellDefAddress


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

j_GetCharacterRAMAddress_0:
		
		jmp     GetCharEntryAddress(pc)

	; End of function j_GetCharacterRAMAddress_0


; =============== S U B R O U T I N E =======================================

j_GetDistanceBetweenEntities:
		
		jmp     GetDistanceBetweenEntities(pc)

	; End of function j_GetDistanceBetweenEntities


; =============== S U B R O U T I N E =======================================

j_nullsub_6:
		jmp     nullsub_6(pc)

	; End of function j_nullsub_6


; =============== S U B R O U T I N E =======================================

j_GetCharEntryAddress:
		
		jmp     GetCharEntryAddress(pc)

	; End of function j_GetCharEntryAddress


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

j_DebugModeSelectAction:
		
		jmp     DebugModeSelectAction(pc)

	; End of function j_DebugModeSelectAction


; =============== S U B R O U T I N E =======================================

j_WriteSkirmishScript:
		
		jmp     WriteSkirmishScript(pc)

	; End of function j_WriteSkirmishScript


; =============== S U B R O U T I N E =======================================

j_sub_C404:
		jmp     j_sub_C404_0(pc)

	; End of function j_sub_C404


; =============== S U B R O U T I N E =======================================

j_CreateSpellRangeGrid:
		
		jmp     CreateSpellRangeGrid(pc)

	; End of function j_CreateSpellRangeGrid


; =============== S U B R O U T I N E =======================================

j_CreateItemRangeGrid:
		
		jmp     CreateItemRangeGrid(pc)

	; End of function j_CreateItemRangeGrid


; =============== S U B R O U T I N E =======================================

j_sub_C4E8:
		jmp     j_sub_C4E8_0(pc)

	; End of function j_sub_C4E8


; =============== S U B R O U T I N E =======================================

j_sub_C5D6:
		jmp     j_sub_C5D6_0(pc)

	; End of function j_sub_C5D6


; =============== S U B R O U T I N E =======================================

j_sub_C5FA:
		jmp     j_sub_C5FA_0(pc)

	; End of function j_sub_C5FA


; =============== S U B R O U T I N E =======================================

j_CreateTargetGridFromSpell:
		
		jmp     CreateTargetGridFromSpell(pc)

	; End of function j_CreateTargetGridFromSpell


; =============== S U B R O U T I N E =======================================

j_CreateTargetGrid:
		
		jmp     CreateTargetGrid(pc)

	; End of function j_CreateTargetGrid


; =============== S U B R O U T I N E =======================================

j_MakeTargetList:
		
		jmp     MakeTargetList(pc)

	; End of function j_MakeTargetList


; =============== S U B R O U T I N E =======================================

j_MakeTargetListAllies:
		
		jmp     MakeTargetListAllies(pc)

	; End of function j_MakeTargetListAllies


; =============== S U B R O U T I N E =======================================

j_MakeTargetListMonsters:
		
		jmp     MakeTargetListMonsters(pc)

	; End of function j_MakeTargetListMonsters


; =============== S U B R O U T I N E =======================================

j_MakeTargetListEverybody:
		
		jmp     MakeTargetListEverybody(pc)

	; End of function j_MakeTargetListEverybody


; =============== S U B R O U T I N E =======================================

j_UpdateTargetListCharacters:
		
		jmp     UpdateTargetListCharacters(pc)

	; End of function j_UpdateTargetListCharacters


; =============== S U B R O U T I N E =======================================

j_UpdateTargetListMonsters:
		
		jmp     UpdateTargetListMonsters(pc)

	; End of function j_UpdateTargetListMonsters


; =============== S U B R O U T I N E =======================================

j_ConvertCoordToOffset:
		
		jmp     ConvertCoordToOffset(pc)

	; End of function j_ConvertCoordToOffset


; =============== S U B R O U T I N E =======================================

j_ClearMovableGrid:
		
		jmp     ClearMovableGrid(pc)

	; End of function j_ClearMovableGrid


; =============== S U B R O U T I N E =======================================

j_ClearTargetGrid:
		
		jmp     ClearTargetGrid(pc)

	; End of function j_ClearTargetGrid


; =============== S U B R O U T I N E =======================================

j_GetTargetAtCoordOffset:
		
		jmp     GetTargetAtCoordOffset(pc)

	; End of function j_GetTargetAtCoordOffset


; =============== S U B R O U T I N E =======================================

j_GetMoveCost:
		
		jmp     GetMoveCost(pc)

	; End of function j_GetMoveCost


; =============== S U B R O U T I N E =======================================

j_GetCurrentTerrainType:
		
		jmp     GetCurrentTerrainType(pc)

	; End of function j_GetCurrentTerrainType


; =============== S U B R O U T I N E =======================================

j_SetMovableAtCoord:
		
		jmp     SetMovableAtCoord(pc)

	; End of function j_SetMovableAtCoord


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

j_LeaveForce:
		jmp     LeaveForce(pc)

	; End of function j_LeaveForce


; =============== S U B R O U T I N E =======================================

; In: D0 = character idx

j_IsInBattleParty:
		
		jmp     IsInBattleParty(pc)

	; End of function j_IsInBattleParty


; =============== S U B R O U T I N E =======================================

; In: D0 = character idx

j_JoinBattleParty:
		
		jmp     JoinBattleParty(pc)

	; End of function j_JoinBattleParty


; =============== S U B R O U T I N E =======================================

; In: D0 = character idx

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

j_AddAllToStack:
		
		jmp     AddAllToStack(pc)

	; End of function j_AddAllToStack


; =============== S U B R O U T I N E =======================================

j_sub_DEFC:
		jmp     j_sub_DEFC_0(pc)

	; End of function j_sub_DEFC


; =============== S U B R O U T I N E =======================================

j_MakeRangeLists:
		
		jmp     MakeRangeLists(pc)

	; End of function j_MakeRangeLists


; =============== S U B R O U T I N E =======================================

j_GenerateTargetRangeLists:
		
		jmp     GenerateTargetRangeLists(pc)

	; End of function j_GenerateTargetRangeLists


; =============== S U B R O U T I N E =======================================

MakeBattleEntityCancelMoveString:
		
		jmp     MakeBattleEntityCancelMoveString_0(pc)

	; End of function MakeBattleEntityCancelMoveString


; =============== S U B R O U T I N E =======================================

j_GetTerrain:
		jmp     GetTerrain(pc)  

	; End of function j_GetTerrain


; =============== S U B R O U T I N E =======================================

j_SetTerrain:
		jmp     SetTerrain(pc)

	; End of function j_SetTerrain


; =============== S U B R O U T I N E =======================================

j_ClearEnemyMoveInfo:
		
		jmp     ClearEnemyMoveInfo(pc)

	; End of function j_ClearEnemyMoveInfo


; =============== S U B R O U T I N E =======================================

; entity D0's current MOV*2, X, Y -> D0, D3, D4

j_GetMoveInfo:
		
		jmp     GetMoveInfo(pc) 

	; End of function j_GetMoveInfo


; =============== S U B R O U T I N E =======================================

j_GetDifficulty:
		
		jmp     GetDifficulty(pc)

	; End of function j_GetDifficulty

p_SpellNames:   dc.l SpellNames
p_AllyNames:    dc.l AllyNames
p_EnemyNames:   dc.l EnemyNames

; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
; Out: A0 = address of name
;      D7 = length of name

GetCharName:
		movem.l d0-d1,-(sp)
		btst    #CHAR_BIT_ENEMY,d0
		bne.s   loc_82F0
		bsr.w   GetCharEntryAddress
		moveq   #CHAR_NAME_COUNTER,d0
		clr.w   d7
loc_82E2:
		tst.b   (a0,d7.w)
		beq.s   loc_82EE
		addq.w  #1,d7
		dbf     d0,loc_82E2
loc_82EE:
		bra.s   loc_8300
loc_82F0:
		clr.w   d1
		bsr.w   GetEnemyID
		movea.l (p_EnemyNames).l,a0
		bsr.w   FindName        
loc_8300:
		movem.l (sp)+,d0-d1
		rts

	; End of function GetCharName


; =============== S U B R O U T I N E =======================================

GetClass:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_CLASS_IDX,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetClass


; =============== S U B R O U T I N E =======================================

GetCurrentLevel:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_LEVEL,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetCurrentLevel


; =============== S U B R O U T I N E =======================================

GetMaxHP:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_HP_MAX,d7
		bsr.w   GetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function GetMaxHP


; =============== S U B R O U T I N E =======================================

GetCurrentHP:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_HP_CURRENT,d7
		bsr.w   GetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function GetCurrentHP


; =============== S U B R O U T I N E =======================================

GetMaxMP:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_MP_MAX,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetMaxMP


; =============== S U B R O U T I N E =======================================

GetCurrentMP:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_MP_CURRENT,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetCurrentMP


; =============== S U B R O U T I N E =======================================

GetBaseATK:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_ATK_MAX,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetBaseATK


; =============== S U B R O U T I N E =======================================

GetCurrentATK:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_ATK_CURRENT,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetCurrentATK


; =============== S U B R O U T I N E =======================================

GetBaseDEF:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_DEF_MAX,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetBaseDEF


; =============== S U B R O U T I N E =======================================

GetCurrentDEF:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_DEF_CURRENT,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetCurrentDEF


; =============== S U B R O U T I N E =======================================

GetBaseAGI:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_AGI_MAX,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetBaseAGI


; =============== S U B R O U T I N E =======================================

GetCurrentAGI:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_AGI_CURRENT,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetCurrentAGI


; =============== S U B R O U T I N E =======================================

GetBaseMOV:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_MOV_MAX,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetBaseMOV


; =============== S U B R O U T I N E =======================================

GetCurrentMOV:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_MOV_CURRENT,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetCurrentMOV


; =============== S U B R O U T I N E =======================================

GetBaseResistance:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_RESIST_BASE,d7
loc_83EC:
		bsr.w   GetCharacterWord
loc_83F0:
		movem.l (sp)+,d7-a0
		rts

	; End of function GetBaseResistance


; =============== S U B R O U T I N E =======================================

GetCurrentResistance:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_RESIST_CURRENT,d7
		bsr.w   GetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function GetCurrentResistance


; =============== S U B R O U T I N E =======================================

GetBaseProwess:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_SPECIAL_BASE,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetBaseProwess


; =============== S U B R O U T I N E =======================================

GetCurrentProwess:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_PROWESS_CURRENT,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetCurrentProwess


; =============== S U B R O U T I N E =======================================

GetStatus:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_STATUS,d7
		bsr.w   GetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function GetStatus


; =============== S U B R O U T I N E =======================================

GetXPos:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_X,d7
loc_843C:
		bsr.w   GetCharacterByte
		ext.w   d1
		movem.l (sp)+,d7-a0
		rts

	; End of function GetXPos


; =============== S U B R O U T I N E =======================================

GetYPos:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_Y,d7
		bsr.w   GetCharacterByte
		ext.w   d1
		movem.l (sp)+,d7-a0
		rts

	; End of function GetYPos


; =============== S U B R O U T I N E =======================================

GetCurrentEXP:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_EXP,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetCurrentEXP


; =============== S U B R O U T I N E =======================================

GetUpperMoveType:
		
		movem.l d7-a0,-(sp)
		moveq   #$31,d7 
		bsr.w   GetCharacterByte
		lsr.w   #4,d1
		andi.w  #$F,d1
		movem.l (sp)+,d7-a0
		rts

	; End of function GetUpperMoveType


; =============== S U B R O U T I N E =======================================

GetLowerMoveType:
		
		movem.l d7-a0,-(sp)
		moveq   #$31,d7 
		bsr.w   GetCharacterByte
		andi.w  #$F,d1
		movem.l (sp)+,d7-a0
		rts

	; End of function GetLowerMoveType


; =============== S U B R O U T I N E =======================================

GetEnemyAISetting3233:
		
		movem.l d7-a0,-(sp)
		moveq   #$32,d7 
		bsr.w   GetCharacterWord
		move.w  d1,d2
		lsr.w   #8,d1
		andi.w  #$FF,d1
		andi.w  #$FF,d2
		movem.l (sp)+,d7-a0
		rts

	; End of function GetEnemyAISetting3233


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
; Out: D1 = high 4 bits
;      D2 = low 4 bits

GetEnemyAISetting36:
		
		movem.l d7-a0,-(sp)
		moveq   #$36,d7 
		bsr.w   GetCharacterByte
		move.w  d1,d2
		lsr.w   #4,d1
		andi.w  #$F,d1
		andi.w  #$F,d2
		movem.l (sp)+,d7-a0
		rts

	; End of function GetEnemyAISetting36


; =============== S U B R O U T I N E =======================================

GetCharacterWord34:
		
		movem.l d7-a0,-(sp)
		moveq   #$34,d7 
		bsr.w   GetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function GetCharacterWord34


; =============== S U B R O U T I N E =======================================

GetEnemyID:
		btst    #CHAR_BIT_ENEMY,d0
		bne.s   loc_84EA
		move.w  #CODE_NOTHING_WORD,d1
		rts
		bra.s   GetKills
loc_84EA:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_ENEMYIDX,d7
		bsr.w   GetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function GetEnemyID


; =============== S U B R O U T I N E =======================================

GetKills:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_KILLS,d7
		bsr.w   GetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function GetKills


; =============== S U B R O U T I N E =======================================

GetDefeats:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_DEFEATS,d7
		bsr.w   GetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function GetDefeats


; =============== S U B R O U T I N E =======================================

GetSomethingClassType:
		
		btst    #CHAR_BIT_ENEMY,d0
		bne.s   loc_8536
		moveq   #0,d1
		bsr.w   GetClass
		move.b  ClassTypes(pc,d1.w),d1
		mulu.w  #$1E,d1
		add.w   d0,d1
		bset    #$F,d1
		bra.s   return_8538
loc_8536:
		bsr.s   GetEnemyID
return_8538:
		rts

	; End of function GetSomethingClassType

ClassTypes:     incbin "data/stats/allies/classes/classtypes.bin"
						; 0,1,2 = base class, promoted class, special promoted class

; =============== S U B R O U T I N E =======================================

CopyCharNameToRAM:
		
		tst.b   (a0)
		beq.s   return_8574
		movem.l d0/a0-a1,-(sp)
		lea     (a0),a1
		bsr.w   GetCharEntryAddress
		moveq   #CHAR_NAME_COUNTER,d0
loc_856A:
		move.b  (a1)+,(a0)+
		dbf     d0,loc_856A
		movem.l (sp)+,d0/a0-a1
return_8574:
		rts

	; End of function CopyCharNameToRAM


; =============== S U B R O U T I N E =======================================

SetClass:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_CLASS_IDX,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetClass


; =============== S U B R O U T I N E =======================================

SetLevel:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_LEVEL,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetLevel


; =============== S U B R O U T I N E =======================================

SetMaxHP:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_HP_MAX,d7
		bsr.w   SetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function SetMaxHP


; =============== S U B R O U T I N E =======================================

SetCurrentHP:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_HP_CURRENT,d7
		bsr.w   SetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function SetCurrentHP


; =============== S U B R O U T I N E =======================================

SetMaxMP:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_MP_MAX,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetMaxMP


; =============== S U B R O U T I N E =======================================

SetCurrentMP:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_MP_CURRENT,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetCurrentMP


; =============== S U B R O U T I N E =======================================

SetBaseATK:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_ATK_MAX,d7
loc_85DC:
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetBaseATK


; =============== S U B R O U T I N E =======================================

SetCurrentATK:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_ATK_CURRENT,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetCurrentATK


; =============== S U B R O U T I N E =======================================

SetBaseDEF:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_DEF_MAX,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetBaseDEF


; =============== S U B R O U T I N E =======================================

SetCurrentDEF:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_DEF_CURRENT,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetCurrentDEF


; =============== S U B R O U T I N E =======================================

SetBaseAGI:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_AGI_MAX,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetBaseAGI


; =============== S U B R O U T I N E =======================================

SetCurrentAGI:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_AGI_CURRENT,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetCurrentAGI


; =============== S U B R O U T I N E =======================================

SetBaseMOV:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_MOV_MAX,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetBaseMOV


; =============== S U B R O U T I N E =======================================

SetCurrentMOV:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_MOV_CURRENT,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetCurrentMOV


; =============== S U B R O U T I N E =======================================

SetBaseResistance:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_RESIST_BASE,d7
		bsr.w   SetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function SetBaseResistance


; =============== S U B R O U T I N E =======================================

SetCurrentResistance:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_RESIST_CURRENT,d7
		bsr.w   SetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function SetCurrentResistance


; =============== S U B R O U T I N E =======================================

SetBaseSomething:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_SPECIAL_BASE,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetBaseSomething


; =============== S U B R O U T I N E =======================================

SetCurrentSomething:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_PROWESS_CURRENT,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetCurrentSomething


; =============== S U B R O U T I N E =======================================

SetStatus:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_STATUS,d7
		bsr.w   SetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function SetStatus


; =============== S U B R O U T I N E =======================================

SetXPos:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_X,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetXPos


; =============== S U B R O U T I N E =======================================

SetYPos:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_Y,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetYPos


; =============== S U B R O U T I N E =======================================

SetCurrentEXP:
		
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_EXP,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetCurrentEXP


; =============== S U B R O U T I N E =======================================

SetMoveType:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_MOVETYPE,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetMoveType


; =============== S U B R O U T I N E =======================================

; actually seems to only be used for monster AI, not kills

SetKills:
		movem.l d1-d2/d7-a0,-(sp)
		lsl.w   #8,d1
		andi.w  #$FF,d2
		or.w    d2,d1
		moveq   #CHAR_OFFSET_KILLS,d7
		bsr.w   SetCharacterWord
		movem.l (sp)+,d1-d2/d7-a0
		rts

	; End of function SetKills


; =============== S U B R O U T I N E =======================================

; actually seems to only be used for monster AI, not kills

SetDefeats:
		movem.l d1-d2/d7-a0,-(sp)
		lsl.b   #4,d1
		andi.b  #$F,d2
		or.b    d2,d1
		moveq   #$36,d7 
		bsr.w   SetCharacterByte
		movem.l (sp)+,d1-d2/d7-a0
		rts

	; End of function SetDefeats


; =============== S U B R O U T I N E =======================================

SetCharacterWord34:
		
		movem.l d7-a0,-(sp)
		moveq   #$34,d7 
		bsr.w   SetCharacterWord
		movem.l (sp)+,d7-a0
		rts

	; End of function SetCharacterWord34


; =============== S U B R O U T I N E =======================================

SetEnemyID:
		movem.l d7-a0,-(sp)
		moveq   #CHAR_OFFSET_ENEMYIDX,d7
		bsr.w   SetCharacterByte
		movem.l (sp)+,d7-a0
		rts

	; End of function SetEnemyID


; =============== S U B R O U T I N E =======================================

IncreaseLevel:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_LEVEL,d6
		moveq   #CHAR_OFFSET_LEVEL,d7
		bsr.w   IncreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseLevel


; =============== S U B R O U T I N E =======================================

IncreaseMaxHP:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_HP,d6
		moveq   #CHAR_OFFSET_HP_MAX,d7
		bsr.w   ClampWordIncreasing
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseMaxHP


; =============== S U B R O U T I N E =======================================

IncreaseCurrentHP:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		bsr.w   GetCharEntryAddress
		move.w  CHAR_OFFSET_HP_MAX(a0),d6
		moveq   #CHAR_OFFSET_HP_CURRENT,d7
		bsr.w   ClampWordIncreasing
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseCurrentHP


; =============== S U B R O U T I N E =======================================

IncreaseMaxMP:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_MP,d6
		moveq   #CHAR_OFFSET_MP_MAX,d7
		bsr.w   IncreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseMaxMP


; =============== S U B R O U T I N E =======================================

IncreaseCurrentMP:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		bsr.w   GetCharEntryAddress
		move.b  CHAR_OFFSET_MP_MAX(a0),d6
		moveq   #CHAR_OFFSET_MP_CURRENT,d7
		bsr.w   IncreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseCurrentMP


; =============== S U B R O U T I N E =======================================

IncreaseBaseATK:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_ATK,d6
		moveq   #CHAR_OFFSET_ATK_MAX,d7
		bsr.w   IncreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseBaseATK


; =============== S U B R O U T I N E =======================================

IncreaseCurrentATK:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_ATK,d6
		moveq   #CHAR_OFFSET_ATK_CURRENT,d7
		bsr.w   IncreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseCurrentATK


; =============== S U B R O U T I N E =======================================

IncreaseBaseDEF:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_DEF,d6
		moveq   #CHAR_OFFSET_DEF_MAX,d7
		bsr.w   IncreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseBaseDEF


; =============== S U B R O U T I N E =======================================

IncreaseCurrentDEF:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_DEF,d6
		moveq   #CHAR_OFFSET_DEF_CURRENT,d7
		bsr.w   IncreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseCurrentDEF


; =============== S U B R O U T I N E =======================================

IncreaseBaseAGI:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		moveq   #CHAR_STATCAP_AGI_BASE,d6
		moveq   #CHAR_OFFSET_AGI_MAX,d7
		bsr.w   Clamp7BitIncreasing
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseBaseAGI


; =============== S U B R O U T I N E =======================================

IncreaseCurrentAGI:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		moveq   #CHAR_STATCAP_AGI_CURRENT,d6
		moveq   #CHAR_OFFSET_AGI_CURRENT,d7
		bsr.w   Clamp7BitIncreasing
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseCurrentAGI


; =============== S U B R O U T I N E =======================================

IncreaseBaseMOV:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_MOV,d6
		moveq   #CHAR_OFFSET_MOV_MAX,d7
		bsr.w   IncreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseBaseMOV


; =============== S U B R O U T I N E =======================================

IncreaseCurrentMOV:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_MOV,d6
		moveq   #CHAR_OFFSET_MOV_CURRENT,d7
		bsr.w   IncreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseCurrentMOV


; =============== S U B R O U T I N E =======================================

IncreaseEXP:
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_EXP,d6
		moveq   #CHAR_OFFSET_EXP,d7
		bsr.w   IncreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function IncreaseEXP


; =============== S U B R O U T I N E =======================================

IncreaseKills:
		
		tst.b   d0
		blt.s   return_8886
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #$270F,d6
		moveq   #$32,d7 
		bsr.w   ClampWordIncreasing
		movem.l (sp)+,d5-a0
return_8886:
		rts

	; End of function IncreaseKills


; =============== S U B R O U T I N E =======================================

IncreaseDefeats:
		
		tst.b   d0
		blt.s   return_88A0
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #$270F,d6
		moveq   #$36,d7 
		bsr.w   ClampWordIncreasing
		movem.l (sp)+,d5-a0
return_88A0:
		rts

	; End of function IncreaseDefeats


; =============== S U B R O U T I N E =======================================

DecreaseCurrentHP:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		bsr.w   GetCharEntryAddress
		move.w  CHAR_OFFSET_HP_MAX(a0),d6
		moveq   #CHAR_OFFSET_HP_CURRENT,d7
		bsr.w   ClampWordDecreasing
		movem.l (sp)+,d5-a0
		rts

	; End of function DecreaseCurrentHP


; =============== S U B R O U T I N E =======================================

DecreaseCurrentMP:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		bsr.w   GetCharEntryAddress
		move.b  CHAR_OFFSET_MP_MAX(a0),d6
		moveq   #CHAR_OFFSET_MP_CURRENT,d7
		bsr.w   DecreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function DecreaseCurrentMP


; =============== S U B R O U T I N E =======================================

DecreaseCurrentATK:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_ATK,d6
		moveq   #CHAR_OFFSET_ATK_CURRENT,d7
		bsr.w   DecreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function DecreaseCurrentATK


; =============== S U B R O U T I N E =======================================

DecreaseBaseDEF:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_DEF,d6
		moveq   #CHAR_OFFSET_DEF_MAX,d7
		bsr.w   DecreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function DecreaseBaseDEF


; =============== S U B R O U T I N E =======================================

DecreaseCurrentDEF:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_DEF,d6
		moveq   #CHAR_OFFSET_DEF_CURRENT,d7
		bsr.w   DecreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function DecreaseCurrentDEF


; =============== S U B R O U T I N E =======================================

DecreaseBaseAGI:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #$C8,d6
		moveq   #CHAR_OFFSET_AGI_MAX,d7
		bsr.w   DecreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function DecreaseBaseAGI


; =============== S U B R O U T I N E =======================================

DecreaseCurrentAGI:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #$C8,d6
		moveq   #CHAR_OFFSET_AGI_CURRENT,d7
		bsr.w   DecreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function DecreaseCurrentAGI


; =============== S U B R O U T I N E =======================================

DecreaseBaseMOV:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_MOV,d6
		moveq   #CHAR_OFFSET_MOV_MAX,d7
		bsr.w   DecreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function DecreaseBaseMOV


; =============== S U B R O U T I N E =======================================

DecreaseCurrentMOV:
		
		movem.l d5-a0,-(sp)
		clr.w   d5
		move.w  #CHAR_STATCAP_MOV,d6
		moveq   #CHAR_OFFSET_MOV_CURRENT,d7
		bsr.w   DecreaseAndClampByte
		movem.l (sp)+,d5-a0
		rts

	; End of function DecreaseCurrentMOV


; =============== S U B R O U T I N E =======================================

GetClassName:
		movea.l (p_ClassNames).l,a0

	; End of function GetClassName


; =============== S U B R O U T I N E =======================================

; In: A0 = address of names list
;     D1 = name idx
; Out: A0 = address of entry in names list
;      D7 = length of name

FindName:
		move.w  d0,-(sp)
		subq.w  #1,d1
		bmi.s   loc_8986
		clr.w   d0
loc_897E:
		move.b  (a0)+,d0
		adda.w  d0,a0
		dbf     d1,loc_897E
loc_8986:
		clr.w   d7
		move.b  (a0)+,d7
		move.w  (sp)+,d0
		rts

	; End of function FindName


; =============== S U B R O U T I N E =======================================

SetGold:
		move.l  d1,((CURRENT_GOLD-$1000000)).w
						; puts d1's value at F600 in RAM
		rts

	; End of function SetGold


; =============== S U B R O U T I N E =======================================

GetGold:
		move.l  ((CURRENT_GOLD-$1000000)).w,d1
		rts

	; End of function GetGold


; =============== S U B R O U T I N E =======================================

IncreaseGold:
		add.l   ((CURRENT_GOLD-$1000000)).w,d1
		bcs.s   loc_89A8
		cmpi.l  #FORCE_MAX_GOLD,d1
		bls.s   loc_89AE
loc_89A8:
		move.l  #FORCE_MAX_GOLD,d1
loc_89AE:
		move.l  d1,((CURRENT_GOLD-$1000000)).w
		rts

	; End of function IncreaseGold


; =============== S U B R O U T I N E =======================================

DecreaseGold:
		movem.l d0,-(sp)
		move.l  ((CURRENT_GOLD-$1000000)).w,d0
		sub.l   d1,d0
		bcc.s   loc_89C2
		moveq   #0,d0
loc_89C2:
		move.l  d0,((CURRENT_GOLD-$1000000)).w
		move.l  d0,d1
		movem.l (sp)+,d0
		rts

	; End of function DecreaseGold


; =============== S U B R O U T I N E =======================================

ApplyStatusAndItemsOnStats:
		
		movem.l d0-d3/a0-a2,-(sp)
		move.w  d0,-(sp)
		bsr.w   GetStatus
		move.w  d1,d3
		andi.w  #$FFFB,d3
		bsr.w   InitCurrentStats
		bsr.w   GetCharEntryAddress
		lea     CHAR_OFFSET_ITEM_0(a0),a1
		lea     CHAR_OFFSET_PROWESS_CURRENT(a0),a2
		bsr.w   ApplyMagicOnStats
		moveq   #CHAR_ITEMSLOTS_COUNTER,d2
loc_89F4:
		move.w  (a1),d1
		andi.w  #ITEM_MASK_IDX,d1
		cmpi.w  #ITEMIDX_NOTHING,d1
		beq.s   loc_8A12
		btst    #ITEM_BIT_EQUIPPED,ITEM_OFFSET_IDXANDEQUIPBYTE(a1)
		beq.s   loc_8A12
		bsr.w   ApplyItemOnStats
		beq.s   loc_8A12
		ori.w   #4,d3
loc_8A12:
		addq.w  #2,a1
		dbf     d2,loc_89F4
		move.w  (sp)+,d0
		move.w  d3,d1
		bsr.w   SetStatus
		movem.l (sp)+,d0-d3/a0-a2
		rts

	; End of function ApplyStatusAndItemsOnStats


; =============== S U B R O U T I N E =======================================

; In: D0 = char index
;     D3 = status bitfield

ApplyMagicOnStats:
		
		clr.l   d1
		move.w  d3,d2
		andi.w  #$C000,d2
		rol.w   #2,d2
		bsr.w   GetBaseATK
		mulu.w  d2,d1
		lsr.l   #3,d1
		bsr.w   IncreaseCurrentATK
		move.w  d3,d2
		andi.w  #$3000,d2
		rol.w   #4,d2
		bsr.w   GetBaseDEF
		mulu.w  d2,d1
		lsr.l   #3,d1
		bsr.w   IncreaseCurrentDEF
		bsr.w   GetBaseAGI
		mulu.w  d2,d1
		lsr.l   #3,d1
		bsr.w   IncreaseCurrentAGI
		move.w  d3,d2
		andi.w  #$C00,d2
		rol.w   #6,d2
		bsr.w   GetBaseDEF
		mulu.w  d2,d1
		lsr.l   #3,d1
		bsr.w   DecreaseCurrentDEF
		bsr.w   GetBaseAGI
		mulu.w  d2,d1
		lsr.l   #3,d1
		bsr.w   DecreaseCurrentAGI
		btst    #0,d3
		beq.s   return_8A8E
		moveq   #1,d1
		bsr.w   DecreaseCurrentMOV
		moveq   #5,d1
		bsr.w   DecreaseCurrentAGI
return_8A8E:
		rts

	; End of function ApplyMagicOnStats


; =============== S U B R O U T I N E =======================================

; In: A2 = address in RAM of char's prowess
;     D0 = char idx
;     D1 = item idx

ApplyItemOnStats:
		
		bsr.w   GetItemDefAddress
		btst    #CHAR_BIT_ENEMY,d0
		bne.s   loc_8AA2
		btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
		bra.s   loc_8AA4
loc_8AA2:
		clr.w   d2
loc_8AA4:
		move    sr,-(sp)
		movem.l d1-d2/d7-a1,-(sp)
		lea     ITEMDEF_OFFSET_STATINFO1(a0),a0
		clr.w   d2
		moveq   #1,d7
loc_8AB2:
		move.b  1(a0),d1
		move.b  (a0),d2
		cmpi.b  #$FF,d2
		beq.w   loc_8AD2
		cmpi.b  #$11,d2
		bcs.s   loc_8AC8
loc_8AC6:
		bra.s   loc_8AC6
loc_8AC8:
		lsl.w   #2,d2
		lea     pt_EquipEffectFunctions(pc,d2.w),a1
		movea.l (a1),a1
		jsr     (a1)
loc_8AD2:
		addq.w  #2,a0
		dbf     d7,loc_8AB2
		movem.l (sp)+,d1-d2/d7-a1
		rtr

	; End of function ApplyItemOnStats

pt_EquipEffectFunctions:
		dc.l nullsub_7
		dc.l nullsub_7
		dc.l EquipEffect_IncreaseCriticalProwess
		dc.l EquipEffect_IncreaseDoubleAttackProwess
		dc.l EquipEffect_IncreaseCounterAttackProwess
		dc.l nullsub_7
		dc.l IncreaseCurrentATK
		dc.l IncreaseCurrentDEF
		dc.l IncreaseCurrentAGI
		dc.l IncreaseCurrentMOV
		dc.l DecreaseCurrentATK
		dc.l DecreaseCurrentDEF
		dc.l DecreaseCurrentAGI
		dc.l DecreaseCurrentMOV
		dc.l EquipEffect_SetCriticalProwess
		dc.l EquipEffect_SetDoubleAttackProwess
		dc.l EquipEffect_SetCounterAttackProwess

; =============== S U B R O U T I N E =======================================

nullsub_7:
		rts

	; End of function nullsub_7


; =============== S U B R O U T I N E =======================================

EquipEffect_IncreaseCriticalProwess:
		
		move.b  (a2),d2
		andi.b  #CHAR_PROWESS_MASK_CRIT,d2
		cmpi.b  #8,d2
		bcc.s   loc_8B3A
		add.b   d1,d2
		cmpi.b  #8,d2
		bcs.s   loc_8B3A
		moveq   #7,d2
loc_8B3A:
		andi.b  #$F0,(a2)
		or.b    d2,(a2)
		rts

	; End of function EquipEffect_IncreaseCriticalProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_IncreaseDoubleAttackProwess:
		
		move.b  (a2),d2
		lsr.b   #4,d2
		andi.b  #3,d2
		add.b   d1,d2
		cmpi.b  #4,d2
		bcs.s   loc_8B54
		moveq   #3,d2
loc_8B54:
		lsl.b   #4,d2
		andi.b  #$F,(a2)
		or.b    d2,(a2)
		rts

	; End of function EquipEffect_IncreaseDoubleAttackProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_IncreaseCounterAttackProwess:
		
		move.b  (a2),d2
		lsr.b   #6,d2
		andi.b  #3,d2
		add.b   d1,d2
		cmpi.b  #4,d2
		bcs.s   loc_8B70
		moveq   #3,d2
loc_8B70:
		lsl.b   #6,d2
		andi.b  #$3F,(a2) 
		or.b    d2,(a2)
		rts

	; End of function EquipEffect_IncreaseCounterAttackProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_SetCriticalProwess:
		
		andi.b  #$F,d1
		andi.b  #$F0,(a2)
		or.b    d1,(a2)
		rts

	; End of function EquipEffect_SetCriticalProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_SetDoubleAttackProwess:
		
		andi.b  #3,d1
		lsl.b   #4,d1
		andi.b  #$CF,(a2)
		or.b    d1,(a2)
		rts

	; End of function EquipEffect_SetDoubleAttackProwess


; =============== S U B R O U T I N E =======================================

EquipEffect_SetCounterAttackProwess:
		
		andi.b  #3,d1
		lsl.b   #6,d1
		andi.b  #$3F,(a2) 
		or.b    d1,(a2)
		rts

	; End of function EquipEffect_SetCounterAttackProwess


; =============== S U B R O U T I N E =======================================

InitCurrentStats:
		
		move.l  a0,-(sp)
		bsr.w   GetCharEntryAddress
		move.b  CHAR_OFFSET_ATK_MAX(a0),CHAR_OFFSET_ATK_CURRENT(a0)
		move.b  CHAR_OFFSET_DEF_MAX(a0),CHAR_OFFSET_DEF_CURRENT(a0)
		move.b  CHAR_OFFSET_AGI_MAX(a0),CHAR_OFFSET_AGI_CURRENT(a0)
		move.b  CHAR_OFFSET_MOV_MAX(a0),CHAR_OFFSET_MOV_CURRENT(a0)
		move.w  CHAR_OFFSET_RESIST_BASE(a0),CHAR_OFFSET_RESIST_CURRENT(a0)
		move.b  CHAR_OFFSET_SPECIAL_BASE(a0),CHAR_OFFSET_PROWESS_CURRENT(a0)
		movea.l (sp)+,a0
		rts

	; End of function InitCurrentStats


; =============== S U B R O U T I N E =======================================

; In: D1 = item entry
; Out: A0 = address of name
;      D7 = length of name

FindItemName:
		move.w  d1,-(sp)
		andi.w  #ITEM_MASK_IDX,d1
		movea.l (p_ItemNames).l,a0
		bsr.w   FindName        
		move.w  (sp)+,d1
		rts

	; End of function FindItemName


; =============== S U B R O U T I N E =======================================

; In: D1 = item idx
; Out: A0 = item definition address in ROM

GetItemDefAddress:
		
		move.l  d1,-(sp)
		andi.w  #ITEM_MASK_IDX,d1
		mulu.w  #SIZE_ITEMDEF,d1
		movea.l (p_ItemDefs).l,a0
		adda.w  d1,a0
		move.l  (sp)+,d1
		rts

	; End of function GetItemDefAddress


; =============== S U B R O U T I N E =======================================

; In: D0 = char entry idx
;     D1 = item slot idx
; Out: D1 = item idx
;      D2 = number of items held

GetCharItemAtSlotAndNumberOfItems:
		
		movem.l d0/d3/a0,-(sp)
		bsr.w   GetCharEntryAddress
		lea     CHAR_OFFSET_ITEM_0(a0),a0
		add.w   d1,d1
		move.w  (a0,d1.w),d1    ; move item d1 word in d1
		moveq   #0,d2
		moveq   #CHAR_ITEMSLOTS_COUNTER,d3
loc_8C10:
		move.w  (a0)+,d0
		andi.w  #ITEM_MASK_IDX,d0
		cmpi.w  #ITEMIDX_NOTHING,d0
		beq.s   loc_8C1E
		addq.w  #1,d2
loc_8C1E:
		dbf     d3,loc_8C10
		movem.l (sp)+,d0/d3/a0
		rts

	; End of function GetCharItemAtSlotAndNumberOfItems


; =============== S U B R O U T I N E =======================================

; In: D1 = item idx
; Out: D2 = item type (0 = item, 1 = weapon, FFFF = ring)

GetItemType:
		move.l  a0,-(sp)
		bsr.s   GetItemDefAddress
		addq.w  #ITEMDEF_OFFSET_TYPE,a0
		btst    #ITEMTYPE_BIT_WEAPON,(a0)
		bne.s   loc_8C44        
		btst    #ITEMTYPE_BIT_RING,(a0)
		bne.s   loc_8C3E        
		clr.w   d2              ; other
		bra.s   loc_8C42
loc_8C3E:
		move.w  #$FFFF,d2       ; ring
loc_8C42:
		bra.s   loc_8C48
loc_8C44:
		move.w  #ITEMTYPE_IDX_WEAPON,d2; weapon
loc_8C48:
		movea.l (sp)+,a0
		rts

	; End of function GetItemType


; =============== S U B R O U T I N E =======================================

GetEquippedWeapon:
		
		movem.l d3-d4/a0-a1,-(sp)
		move.w  #ITEMTYPE_MASK_WEAPON,d4
		bra.s   GetEquippedItemByType
GetEquippedRing:
		
		movem.l d3-d4/a0-a1,-(sp)
		move.w  #ITEMTYPE_MASK_RING,d4
GetEquippedItemByType:
		
		bsr.w   GetCharEntryAddress
		lea     CHAR_OFFSET_ITEM_0(a0),a1
		clr.w   d2
		moveq   #CHAR_ITEMSLOTS_COUNTER,d3
loc_8C6A:
		move.w  (a1)+,d1
		btst    #ITEM_BIT_EQUIPPED,d1
		beq.s   loc_8C88        
		andi.w  #ITEM_MASK_IDX,d1
		cmpi.w  #ITEMIDX_NOTHING,d1
		beq.s   loc_8C88        
		bsr.w   GetItemDefAddress
		move.b  ITEMDEF_OFFSET_TYPE(a0),d1
		and.b   d4,d1
		bne.s   loc_8C96
loc_8C88:
		addq.w  #1,d2           ; d2 seems unused here?
		dbf     d3,loc_8C6A
		move.w  #CODE_NOTHING_WORD,d1
		move.w  d1,d2
		bra.s   loc_8C9C
loc_8C96:
		move.w  -(a1),d1
		andi.w  #ITEM_MASK_IDX,d1
loc_8C9C:
		movem.l (sp)+,d3-d4/a0-a1
		rts

	; End of function GetEquippedWeapon


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D1 = item entry

AddItem:
		movem.l d0/a0,-(sp)
		bsr.w   GetCharEntryAddress
		lea     CHAR_OFFSET_ITEM_0(a0),a0
		moveq   #CHAR_ITEMSLOTS_COUNTER,d0
loc_8CB0:
		move.w  (a0)+,d2
		andi.w  #ITEM_MASK_IDX,d2
		cmpi.w  #ITEMIDX_NOTHING,d2
		beq.s   loc_8CC6
		dbf     d0,loc_8CB0     ; loop over all items to make sure there's a slot open
		move.w  #1,d2           ; no empty slot available
		bra.s   loc_8CCE
loc_8CC6:
		andi.w  #ITEM_MASK_IDXANDBROKEN,d1
		move.w  d1,-(a0)        ; move item in empty slot
		clr.w   d2
loc_8CCE:
		movem.l (sp)+,d0/a0
		rts

	; End of function AddItem


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D1 = item slot

BreakItem:
		movem.l d1/a0,-(sp)
		bsr.w   GetCharEntryAddress
		add.w   d1,d1
		lea     CHAR_OFFSET_ITEM_0(a0,d1.w),a0
		move.w  (a0),d1
		andi.w  #ITEM_MASK_IDX,d1
		cmpi.w  #ITEMIDX_NOTHING,d1
		beq.s   loc_8CF6
		bset    #ITEM_UPPERBIT_BROKEN,(a0)
		clr.w   d2
		bra.s   loc_8CFA
loc_8CF6:
		move.w  #3,d2
loc_8CFA:
		movem.l (sp)+,d1/a0
		rts

	; End of function BreakItem


; =============== S U B R O U T I N E =======================================

RepairItemBySlot:
		
		movem.l d1/a0,-(sp)
		bsr.w   GetCharEntryAddress
		add.w   d1,d1
		lea     CHAR_OFFSET_ITEM_0(a0,d1.w),a0
		move.w  (a0),d1
		andi.w  #ITEM_MASK_IDX,d1
		cmpi.w  #ITEMIDX_NOTHING,d1
		beq.s   loc_8D2A        
		bclr    #7,(a0)
		beq.s   loc_8D24
		clr.w   d2
		bra.s   loc_8D28
loc_8D24:
		move.w  #1,d1
loc_8D28:
		bra.s   loc_8D2E
loc_8D2A:
		move.w  #3,d2           ; code 3: nothing
loc_8D2E:
		movem.l (sp)+,d1/a0
		rts

	; End of function RepairItemBySlot


; =============== S U B R O U T I N E =======================================

; In: D0 = char entry idx
;     D1 = item slot idx
; Out: D2 = 0 if equipped, 1 if not, 2 if equipped and cursed, 3 if item is nothing

EquipItemBySlot:
		
		movem.l d0-d1/a0,-(sp)
		bsr.w   GetCharEntryAddress
		add.w   d1,d1           ; item slot -> additional offset
		lea     CHAR_OFFSET_ITEM_0(a0,d1.w),a0
		move.w  (a0),d1         ; get item entry
		andi.w  #ITEM_MASK_IDX,d1
		cmpi.w  #ITEMIDX_NOTHING,d1; test if item is "nothing"
		beq.s   loc_8D5E        
		bsr.s   IsItemEquippableAndCursed
		cmpi.w  #1,d2
		beq.s   loc_8D5C
loc_8D56:
		bset    #ITEM_BIT_EQUIPPED,ITEM_OFFSET_IDXANDEQUIPBYTE(a0)
loc_8D5C:
		bra.s   loc_8D62
loc_8D5E:
		move.w  #3,d2           ; code 3: item is "nothing"
loc_8D62:
		movem.l (sp)+,d0-d1/a0
		bra.w   ApplyStatusAndItemsOnStats

	; End of function EquipItemBySlot


; =============== S U B R O U T I N E =======================================

; Checks if item is equippable by char D0's class, and whether or not it's a cursed item.
; In: D0 = char idx
; Out: D2 = 0 if equippable, 1 if not, 2 if equippable and cursed

IsItemEquippableAndCursed:
		
		movem.l d0-d1/a0,-(sp)
		bsr.w   GetCharEntryAddress
		move.b  CHAR_OFFSET_CLASS_IDX(a0),d0
		addq.b  #1,d0
		bsr.w   GetItemDefAddress
		move.l  (a0),d1         ; get class-equippable bitfield
		lsr.l   d0,d1           ; push relevant class-equippable bit into carry
		bcc.s   loc_8D94        
		btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
						; test cursed bit of itemdef's misc byte
		bne.s   loc_8D8E        
		clr.w   d2              ; code 0: equippable
		bra.s   loc_8D92
loc_8D8E:
		move.w  #2,d2           ; code 2: equippable, but cursed
loc_8D92:
		bra.s   loc_8D98
loc_8D94:
		move.w  #1,d2           ; code 1: not equippable
loc_8D98:
		movem.l (sp)+,d0-d1/a0
		rts

	; End of function IsItemEquippableAndCursed


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D1 = item slot idx

UnequipItemBySlotIfNotCursed:
		
		movem.l d0-d1/a0,-(sp)
		bsr.s   IsItemInSlotEquippedAndCursed
		tst.w   d2
		bne.s   loc_8DAE
		bclr    #ITEM_BIT_EQUIPPED,ITEM_OFFSET_IDXANDEQUIPBYTE(a0)
loc_8DAE:
		movem.l (sp)+,d0-d1/a0
		bra.w   ApplyStatusAndItemsOnStats

	; End of function UnequipItemBySlotIfNotCursed


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D1 = item slot idx
; Out: A0 = address of char entry item slot idx in RAM
;      D2 = 0 = equipped and cursed, 1 = not equipped, 2 = equipped, 3 = nothing

IsItemInSlotEquippedAndCursed:
		
		bsr.w   GetCharEntryAddress
		add.w   d1,d1
loc_8DBC:
		lea     CHAR_OFFSET_ITEM_0(a0,d1.w),a0
		move.w  (a0),d1
		andi.w  #ITEM_MAX_IDX,d1
		cmpi.w  #ITEMIDX_NOTHING,d1
		beq.s   loc_8DF8        
		btst    #ITEM_BIT_EQUIPPED,ITEM_OFFSET_IDXANDEQUIPBYTE(a0)
		beq.s   loc_8DF2        
		movem.l a0,-(sp)
		bsr.w   GetItemDefAddress
		btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
		movem.l (sp)+,a0
		bne.s   loc_8DEC        
		clr.w   d2              ; cursed
		bra.s   loc_8DF0
loc_8DEC:
		move.w  #2,d2           ; not cursed
loc_8DF0:
		bra.s   loc_8DF6
loc_8DF2:
		move.w  #1,d2           ; not equipped
loc_8DF6:
		bra.s   return_8DFC
loc_8DF8:
		move.w  #3,d2           ; empty slot
return_8DFC:
		rts

	; End of function IsItemInSlotEquippedAndCursed


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D1 = item slot idx

UnequipItemBySlot:
		
		movem.l d0-d1/a0,-(sp)
		bsr.s   IsItemInSlotEquippedAndCursed
		bclr    #ITEM_BIT_EQUIPPED,ITEM_OFFSET_IDXANDEQUIPBYTE(a0)
		movem.l (sp)+,d0-d1/a0
		bra.w   ApplyStatusAndItemsOnStats

	; End of function UnequipItemBySlot


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D1 = item slot
; Out: D2 = 2 if not dropped, 3 if dropped or nothing

DropItemBySlot:
		
		movem.l d0/a0,-(sp)
		bsr.w   GetCharEntryAddress
		move.w  d1,d0
		add.w   d1,d1
		lea     CHAR_OFFSET_ITEM_0(a0,d1.w),a0
		move.w  (a0),d1
		move.w  #3,d2
		andi.w  #ITEM_MASK_IDX,d1
		cmpi.w  #ITEMIDX_NOTHING,d1
		beq.s   loc_8E54
		movem.l a0,-(sp)
		bsr.w   GetItemDefAddress
		btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
		movem.l (sp)+,a0
		beq.s   loc_8E52
		move.w  #2,d2           ; item cursed
		btst    #ITEM_BIT_EQUIPPED,ITEM_OFFSET_IDXANDEQUIPBYTE(a0)
		bne.s   loc_8E54        ; item equipped and cursed, so can't drop it
loc_8E52:
		bsr.s   RemoveAndArrangeItems
loc_8E54:
		movem.l (sp)+,d0/a0
loc_8E58:
		bra.w   ApplyStatusAndItemsOnStats

	; End of function DropItemBySlot


; =============== S U B R O U T I N E =======================================

; In: A0 = char entry address + offset to items
;     D0 = item slot

RemoveAndArrangeItems:
		
		move.w  #2,d2
		sub.w   d0,d2           ; subtract item slot from 2 to make loop counter
		bmi.s   loc_8E6E        ; no items to rearrange, so skip to removal
loc_8E64:
		move.w  SIZE_ITEM(a0),(a0); shift item -1 slots
		addq.w  #SIZE_ITEM,a0
		dbf     d2,loc_8E64     
loc_8E6E:
		move.w  #ITEMIDX_NOTHING,(a0); replace item with nothing
		clr.w   d2
		rts

	; End of function RemoveAndArrangeItems


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D1 = item slot

RemoveItemBySlot:
		
		movem.l d0/a0,-(sp)
		bsr.w   GetCharEntryAddress
		move.w  d1,d0
		add.w   d1,d1
		lea     CHAR_OFFSET_ITEM_0(a0,d1.w),a0
		move.w  (a0),d1
		move.w  d1,d2
		andi.w  #ITEM_MASK_IDX,d2
		cmpi.w  #ITEMIDX_NOTHING,d2
		beq.s   loc_8E9A
		bsr.s   RemoveAndArrangeItems
		bra.w   loc_8E9E
loc_8E9A:
		move.w  #3,d2
loc_8E9E:
		movem.l (sp)+,d0/a0
		bra.w   ApplyStatusAndItemsOnStats

	; End of function RemoveItemBySlot


; =============== S U B R O U T I N E =======================================

UnequipWeapon:
		
		movem.l d0-d2/a0-a1,-(sp)
		move.w  #ITEMTYPE_MASK_WEAPON,d2; weapon
		bra.s   UnequipItemByType

	; End of function UnequipWeapon


; =============== S U B R O U T I N E =======================================

UnequipRing:
		movem.l d0-d2/a0-a1,-(sp)
		move.w  #ITEMTYPE_MASK_RING,d2; ring
UnequipItemByType:
		
		bsr.w   GetCharEntryAddress
		lea     CHAR_OFFSET_ITEM_0(a0),a1
		moveq   #CHAR_ITEMSLOTS_COUNTER,d0
loc_8EC2:
		move.w  (a1),d1
		btst    #ITEM_BIT_EQUIPPED,d1
		beq.s   loc_8EE0
		andi.w  #ITEM_MASK_IDX,d1
		bsr.w   GetItemDefAddress
		move.b  ITEMDEF_OFFSET_TYPE(a0),d1
		and.b   d2,d1
		beq.s   loc_8EE0
		bclr    #ITEM_BIT_EQUIPPED,ITEM_OFFSET_IDXANDEQUIPBYTE(a1)
loc_8EE0:
		addq.w  #SIZE_ITEM,a1
		dbf     d0,loc_8EC2
		movem.l (sp)+,d0-d2/a0-a1
		bra.w   ApplyStatusAndItemsOnStats

	; End of function UnequipRing


; =============== S U B R O U T I N E =======================================

GetEquippableWeapons:
		
		movem.l d0/d2-d6/a1-a2,-(sp)
		move.w  #2,d2
		bra.s   loc_8F00
GetEquippableRings:
		
		movem.l d0/d2-d6/a1-a2,-(sp)
		move.w  #4,d2
loc_8F00:
		bsr.w   GetCharEntryAddress
		move.b  CHAR_OFFSET_CLASS_IDX(a0),d0
		moveq   #1,d3
		lsl.l   d0,d3           ; place class bit in long value
		lea     CHAR_OFFSET_ITEM_0(a0),a1
		lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a2
		move.l  #$7F0004,(a2)
		move.l  #$7F0004,4(a2)
		move.l  #$7F0004,8(a2)
		move.l  #$800004,$C(a2)
		clr.w   d0
		moveq   #0,d4
		moveq   #3,d5
loc_8F38:
		move.w  (a1)+,d1
		andi.w  #ITEM_MASK_IDX,d1
		cmpi.w  #ITEMIDX_NOTHING,d1; skip if empty slot
		beq.s   loc_8F4E
		bsr.s   IsItemEquippable
		bcc.s   loc_8F4E
		move.w  d1,(a2)+
		move.w  d4,(a2)+
		addq.w  #1,d0
loc_8F4E:
		addq.w  #1,d4
		dbf     d5,loc_8F38
		move.w  d0,d1
		movem.l (sp)+,d0/d2-d6/a1-a2
		lea     ((EQUIPPABLE_ITEMS-$1000000)).w,a0
		rts

	; End of function GetEquippableWeapons


; =============== S U B R O U T I N E =======================================

; In: D1 = item idx
;     D2 = item type bitmask (for ANDing the item type bitfield)
;     D3 = class equip bitmask (for ANDing the item equip bitfield)

IsItemEquippable:
		
		movem.l a0,-(sp)
		bsr.w   GetItemDefAddress
		move.b  ITEMDEF_OFFSET_TYPE(a0),d6
		and.b   d2,d6
		beq.s   loc_8F7A        ; skip if not a weapon/ring
		move.l  (a0),d6
		and.l   d3,d6
		beq.s   loc_8F7A
		ori     #1,ccr          ; set carry flag : Item is Equippable !
loc_8F7A:
		movem.l (sp)+,a0
		rts

	; End of function IsItemEquippable


; =============== S U B R O U T I N E =======================================

IsWeaponOrRingEquippable:
		
		movem.l d0/d2-d6/a0,-(sp)
		move.w  #ITEMTYPE_MASK_WEAPONORRING,d2
		bsr.w   GetCharEntryAddress
		move.b  CHAR_OFFSET_CLASS_IDX(a0),d0
		moveq   #1,d3
		lsl.l   d0,d3
		bsr.s   IsItemEquippable
		movem.l (sp)+,d0/d2-d6/a0
		rts

	; End of function IsWeaponOrRingEquippable


; =============== S U B R O U T I N E =======================================

GetWeaponNewATKandDEF:
		
		movem.l d0/d4-d6/a0,-(sp)
loc_8FA0:
		bsr.w   GetCharEntryAddress
		clr.w   d2
		move.b  CHAR_OFFSET_ATK_CURRENT(a0),d2
						; current ATK
		clr.w   d3
		move.b  CHAR_OFFSET_DEF_CURRENT(a0),d3
						; current DEF
		movem.w d0/d2-d3,-(sp)
		move.w  #ITEMTYPE_MASK_WEAPONORRING,d2
		clr.w   d0
		move.b  CHAR_OFFSET_CLASS_IDX(a0),d0
		moveq   #1,d3
		lsl.l   d0,d3
		bsr.s   IsItemEquippable
		movem.w (sp)+,d0/d2-d3
		bcc.w   loc_8FE8
		movem.l d1/a0,-(sp)
		andi.w  #ITEM_MASK_IDX,d1
		bsr.w   GetItemDefAddress
		move.b  ITEMDEF_OFFSET_TYPE(a0),d2
		movem.l (sp)+,d1/a0
		andi.w  #ITEMTYPE_MASK_WEAPONORRING,d2
						; get weapon/ring type
		bsr.w   GetCharATKandDEFWithSpecificWeapon
loc_8FE8:
		movem.l (sp)+,d0/d4-d6/a0
		rts

	; End of function GetWeaponNewATKandDEF


; =============== S U B R O U T I N E =======================================

; In: A0 = char entry address
;     D1 = item idx
; Out: D2 = char ATK with item equipped
;      D3 = char DEF with item equipped

GetCharATKandDEFWithSpecificWeapon:
		
		movem.l d0-d1/d4-a0,-(sp)
		moveq   #CHAR_ITEMSLOTS_COUNTER,d7
		clr.w   d4
loc_8FF6:
		move.w  CHAR_OFFSET_ITEM_0(a0,d4.w),d5
		btst    #ITEM_BIT_EQUIPPED,d5
		beq.s   loc_901C
		movem.l d0-d1/a0,-(sp)  ; it's equipped
		move.w  d5,d1
		andi.w  #ITEM_MASK_IDX,d1
		bsr.w   GetItemDefAddress
		move.b  ITEMDEF_OFFSET_TYPE(a0),d0
		and.b   d2,d0           ; it's a weapon or a ring
		movem.l (sp)+,d0-d1/a0
		bne.w   loc_903A
loc_901C:
		addq.w  #SIZE_ITEM,d4
		dbf     d7,loc_8FF6
		moveq   #CHAR_ITEMSLOTS_COUNTER,d7
		clr.w   d4
loc_9026:
		move.w  CHAR_OFFSET_ITEM_0(a0,d4.w),d5
		btst    #ITEM_BIT_EQUIPPED,d5
		beq.w   loc_903A
		addq.w  #2,d4
		dbf     d7,loc_9026
		clr.w   d4
loc_903A:
		move.w  CHAR_OFFSET_ITEM_0(a0,d4.w),d5
		movem.l d4-d5/a0,-(sp)
		bset    #ITEM_BIT_EQUIPPED,d1
		move.w  d1,CHAR_OFFSET_ITEM_0(a0,d4.w)
						; equip item
		bsr.w   ApplyStatusAndItemsOnStats
		clr.w   d2
		move.b  CHAR_OFFSET_ATK_CURRENT(a0),d2
		clr.w   d3
		move.b  CHAR_OFFSET_DEF_CURRENT(a0),d3
		movem.l (sp)+,d4-d5/a0
		movem.w d2-d3,-(sp)
		move.w  d5,CHAR_OFFSET_ITEM_0(a0,d4.w)
						; and unequip
		bsr.w   ApplyStatusAndItemsOnStats
		movem.w (sp)+,d2-d3
		movem.l (sp)+,d0-d1/d4-a0
		rts

	; End of function GetCharATKandDEFWithSpecificWeapon


; =============== S U B R O U T I N E =======================================

OrderItems:
		movem.l d0-d3/a0-a1,-(sp)
		bsr.w   GetCharEntryAddress
		lea     CHAR_OFFSET_ITEM_0(a0),a0
		moveq   #2,d1
loc_9082:
		lea     SIZE_ITEM(a0),a1
		move.w  d1,d2
loc_9088:
		move.w  (a0),d0
		andi.w  #ITEM_MASK_IDX,d0
		move.w  (a1),d3
		andi.w  #ITEM_MASK_IDX,d3
		cmp.w   d0,d3
		bcc.s   loc_90A0
		move.w  (a0),d0         ; if d0 > d3 ?
		move.w  (a1),d3
		move.w  d0,(a3)         ; wtf a3 ?! unused bugged subroutine ?
		move.w  d3,(a0)
loc_90A0:
		addq.w  #SIZE_ITEM,a1
loc_90A2:
		dbf     d2,loc_9088
		addq.w  #SIZE_ITEM,a0
		dbf     d1,loc_9082
		movem.l (sp)+,d0-d3/a0-a1
		rts

	; End of function OrderItems


; =============== S U B R O U T I N E =======================================

IsItemCursed:
		move.l  a0,-(sp)
		bsr.w   GetItemDefAddress
		btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
		beq.s   loc_90C6        
		ori     #1,ccr          ; item is cursed
		bra.s   loc_90C8
loc_90C6:
		tst.b   d0              ; clear carry flag
loc_90C8:
		movea.l (sp)+,a0
		rts

	; End of function IsItemCursed


; =============== S U B R O U T I N E =======================================

; carry set : YES

IsItemUsableInBattle:
		
		move.l  a0,-(sp)
		bsr.w   GetItemDefAddress
loc_90D2:
		cmpi.b  #$FF,ITEMDEF_OFFSET_SPELL(a0)
		beq.s   loc_90E0
loc_90DA:
		ori     #1,ccr
		bra.s   loc_90E2
loc_90E0:
		tst.b   d0
loc_90E2:
		movea.l (sp)+,a0
		rts

	; End of function IsItemUsableInBattle


; =============== S U B R O U T I N E =======================================

; carry set : NO

IsItemUsableWeaponInBattle:
		
		move.l  a0,-(sp)
		bsr.w   GetItemType     
		tst.w   d2
		beq.s   loc_90FA
		bsr.w   IsWeaponOrRingEquippable
		bcc.s   loc_9100
		bsr.s   IsItemUsableInBattle
		bcc.s   loc_9100
loc_90FA:
		ori     #1,ccr
		bra.s   loc_9102
loc_9100:
		tst.b   d0
loc_9102:
		movea.l (sp)+,a0
		rts

	; End of function IsItemUsableWeaponInBattle


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx

UnequipAllItemsIfNotCursed:
		
		movem.l d0-d1/a0-a1,-(sp)
		bsr.w   GetCharEntryAddress
		lea     CHAR_OFFSET_ITEM_0(a0),a1
		moveq   #CHAR_ITEMSLOTS_COUNTER,d0
loc_9114:
		move.w  (a1),d1
		btst    #ITEM_BIT_EQUIPPED,d1
		beq.s   loc_9138
		andi.w  #ITEM_MASK_IDX,d1
		cmpi.w  #ITEMIDX_NOTHING,d1
		beq.s   loc_9138
		bsr.w   GetItemDefAddress
		btst    #ITEMTYPE_BIT_CURSED,ITEMDEF_OFFSET_TYPE(a0)
		beq.s   loc_9138
		bclr    #ITEM_BIT_EQUIPPED,ITEM_OFFSET_IDXANDEQUIPBYTE(a1)
loc_9138:
		addq.w  #2,a1
		dbf     d0,loc_9114
		movem.l (sp)+,d0-d1/a0-a1
		bra.w   ApplyStatusAndItemsOnStats

	; End of function UnequipAllItemsIfNotCursed


; =============== S U B R O U T I N E =======================================

j_sub_9146_0:
		movem.l d2-d3/d6-a0,-(sp)
		move.w  d1,d3
		bsr.w   UpdateForce     
		lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a0
		move.w  ((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w,d6
		subq.w  #1,d6           ; one enemy down ?
loc_915A:
		move.b  (a0)+,d0
		clr.w   d1
		bsr.w   GetCharItemAtSlotAndNumberOfItems
		tst.w   d2
		beq.s   loc_9182
		move.w  d2,d7           ; number of items
		subq.w  #1,d7
loc_916A:
		move.w  d7,d1
		bsr.w   GetCharItemAtSlotAndNumberOfItems
		andi.w  #$7F,d1 
		cmp.w   d3,d1
		bne.s   loc_917E
		move.w  d7,d1
		bra.w   loc_918E
loc_917E:
		dbf     d7,loc_916A
loc_9182:
		dbf     d6,loc_915A
		move.w  #$FFFF,d0
		move.w  #$FFFF,d1
loc_918E:
		movem.l (sp)+,d2-d3/d6-a0
		rts

	; End of function j_sub_9146_0


; =============== S U B R O U T I N E =======================================

; In: D0 = entity idx
;     D1 = item idx
; Out: D2 = item slot (FFFF if not held)

GetItemSlotContainingIndex:
		
		movem.l d1/d3/d7,-(sp)
		move.w  d1,d3
		andi.w  #$7F,d3 
		moveq   #0,d2
		moveq   #3,d7
loc_91A2:
		move.w  d2,d1
		move.l  d2,-(sp)
		jsr     GetCharItemAtSlotAndNumberOfItems(pc)
		move.l  (sp)+,d2
		andi.w  #$7F,d1 
		cmp.b   d3,d1
		beq.w   loc_91C0
		addq.w  #1,d2
		dbf     d7,loc_91A2
		move.w  #$FFFF,d2
loc_91C0:
		movem.l (sp)+,d1/d3/d7
		rts

	; End of function GetItemSlotContainingIndex


; =============== S U B R O U T I N E =======================================

; In: D1 = spell entry
; Out: A0 = address of name
;      D7 = length of name

FindSpellName:
		
		move.w  d1,-(sp)
		andi.w  #$3F,d1 
		movea.l (p_SpellNames).l,a0
		bsr.w   FindName        
		move.w  (sp)+,d1
		rts

	; End of function FindSpellName


; =============== S U B R O U T I N E =======================================

;     Get address of entry in spell definition table.
;     In: D1 = spell index
;     Out: A0 = address of spell #D1 definition

GetSpellDefAddress:
		
		move.l  d0,-(sp)
loc_91DC:
		movea.l (p_SpellData).l,a0
		moveq   #$63,d0 
loc_91E4:
		cmp.b   (a0),d1
		beq.s   loc_91F6
		lea     SPELLDEF_SIZE(a0),a0
		dbf     d0,loc_91E4
		movea.l (p_SpellData).l,a0
loc_91F6:
		move.l  (sp)+,d0
		rts

	; End of function GetSpellDefAddress


; =============== S U B R O U T I N E =======================================

; In: D0 = entity #
;     D1 = spell slot
; Out: D1 = spell idx
;      D2 = number of spells

GetSpellAndNumberOfSpells:
		
		movem.l d0/d3/a0,-(sp)
		bsr.w   GetCharEntryAddress
		lea     CHAR_OFFSET_SPELL_0(a0),a0
		move.b  (a0,d1.w),d1
		moveq   #3,d3
		clr.w   d2
loc_920E:
		move.b  (a0)+,d0
		andi.b  #SPELL_MASK_IDX,d0
		cmpi.b  #SPELLIDX_NOTHING,d0
		beq.s   loc_921C
		addq.w  #1,d2
loc_921C:
		dbf     d3,loc_920E
		movem.l (sp)+,d0/d3/a0
		rts

	; End of function GetSpellAndNumberOfSpells


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D1 = spell idx
; Out: D2 = result (0 = learned new spell, 1 = upgraded spell, 2 = no room)

LearnSpell:
		movem.l d0/d3-d5/a0,-(sp)
		bsr.w   GetCharEntryAddress
		lea     CHAR_OFFSET_STATUS(a0),a0
		move.w  d1,d4
		move.w  d1,d5
		move.w  #1,d2
		moveq   #CHAR_SPELLSLOTS_COUNTER,d3
		andi.w  #SPELL_MASK_IDX,d4; get spell index ?
		lsr.w   #SPELL_OFFSET_LV,d5
loc_9242:
		move.b  -(a0),d0        ; loop through spells to see if we already know a lower level
		andi.b  #SPELL_MASK_IDX,d0
		cmp.b   d4,d0
		bne.s   loc_9258
		move.b  (a0),d0
		lsr.b   #SPELL_OFFSET_LV,d0
		cmp.b   d0,d5
		bls.s   loc_9278
		move.b  d1,(a0)         ; replace existing spell with new one (higher level)
		bra.s   loc_9276
loc_9258:
		dbf     d3,loc_9242     
		moveq   #CHAR_SPELLSLOTS_COUNTER,d3
loc_925E:
		move.b  (a0)+,d0        ; loop through spells to find the next empty slot
		andi.b  #SPELL_MASK_IDX,d0
		cmpi.b  #SPELLIDX_NOTHING,d0
		beq.s   loc_9274
		dbf     d3,loc_925E     
		move.w  #2,d2
		bra.s   loc_9278
loc_9274:
		move.b  d1,-(a0)
loc_9276:
		clr.w   d2
loc_9278:
		movem.l (sp)+,d0/d3-d5/a0
		rts

	; End of function LearnSpell


; =============== S U B R O U T I N E =======================================

;     Get MP cost of spell.
;     In: D1 = spell index
;     Out: D1 = spell MP cost

GetSpellCost:
		move.l  a0,-(sp)
		bsr.w   GetSpellDefAddress
		clr.w   d1
		move.b  SPELLDEF_OFFSET_MPCOST(a0),d1
		movea.l (sp)+,a0
		rts

	; End of function GetSpellCost


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
; Out: A0 = char RAM address

GetCharEntryAddress:
		
		movem.w d0-d1,-(sp)
		cmpi.b  #COM_ENEMY_START,d0
		bcc.s   loc_92A0
		cmpi.b  #COM_ALLY_SPACEEND,d0
		bhi.s   loc_92C2
		bra.s   loc_92AA
loc_92A0:
		cmpi.b  #COM_ENEMY_SPACEEND,d0
		bhi.s   loc_92C2
		subi.b  #COM_ALLYENDENEMYSTARTDIFFERENCE,d0
loc_92AA:
		andi.w  #$FF,d0
		lsl.w   #3,d0
		move.w  d0,d1
		lsl.w   #3,d0
		sub.w   d1,d0
		lea     ((CHARACTER_DATA-$1000000)).w,a0
		adda.w  d0,a0
		movem.w (sp)+,d0-d1
		rts
loc_92C2:
		movem.w (sp)+,d0-d1
		move.l  #'CNUM',(ERRCODE_BYTE0).l
		move.l  (sp),(ERRCODE_BYTE4).l
		trap    #VINT_FUNCTIONS
		dc.w VINTS_DEACTIVATE
		dc.l 0
loc_92DE:
		bra.s   loc_92DE

	; End of function GetCharEntryAddress


; =============== S U B R O U T I N E =======================================

SetCharacterByte:
		
		bsr.s   GetCharEntryAddress
		move.b  d1,(a0,d7.w)
		rts

	; End of function SetCharacterByte


; =============== S U B R O U T I N E =======================================

SetCharacterWord:
		
		bsr.s   GetCharEntryAddress
		move.w  d1,(a0,d7.w)
		rts

	; End of function SetCharacterWord


; =============== S U B R O U T I N E =======================================

SetCharacterLong:
		
		bsr.s   GetCharEntryAddress
		move.l  d1,(a0,d7.w)
		rts

	; End of function SetCharacterLong


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D7 = char byte offset
; Out: D1 = byte

GetCharacterByte:
		
		bsr.s   GetCharEntryAddress
		clr.w   d1
		move.b  (a0,d7.w),d1
		rts

	; End of function GetCharacterByte


; =============== S U B R O U T I N E =======================================

; In: D0 = char idx
;     D7 = char byte offset
; Out: D1 = word

GetCharacterWord:
		
		bsr.s   GetCharEntryAddress
		move.w  (a0,d7.w),d1
		rts

	; End of function GetCharacterWord


; =============== S U B R O U T I N E =======================================

dup_GetCharacterWord:
		
		bsr.s   GetCharEntryAddress
		move.w  (a0,d7.w),d1
		rts

	; End of function dup_GetCharacterWord


; =============== S U B R O U T I N E =======================================

; clamp byte # D7 of entity D0's information + D1 between D5 and D6

IncreaseAndClampByte:
		
		bsr.w   GetCharEntryAddress
		add.b   (a0,d7.w),d1
		bcs.s   loc_9320
		cmp.b   d6,d1
		bcs.s   loc_9324
loc_9320:
		move.b  d6,d1
		bra.s   loc_932A
loc_9324:
		cmp.b   d5,d1
		bcc.s   loc_932A
		move.b  d5,d1
loc_932A:
		move.b  d1,(a0,d7.w)
		andi.w  #$FF,d1
		rts

	; End of function IncreaseAndClampByte


; =============== S U B R O U T I N E =======================================

Clamp7BitIncreasing:
		
		bsr.w   GetCharEntryAddress
		movem.w d2-d3,-(sp)
		move.b  (a0,d7.w),d2
		move.b  d2,d3
		andi.b  #$80,d3
		andi.b  #$7F,d2 
		add.b   d2,d1
		bcs.s   loc_9352
		cmp.b   d6,d1
		bcs.s   loc_9356
loc_9352:
		move.b  d6,d1
		bra.s   loc_935C
loc_9356:
		cmp.b   d5,d1
		bcc.s   loc_935C
		move.b  d5,d1
loc_935C:
		or.b    d3,d1
		move.b  d1,(a0,d7.w)
		andi.w  #$FF,d1
		movem.w (sp)+,d2-d3
		rts

	; End of function Clamp7BitIncreasing


; =============== S U B R O U T I N E =======================================

; clamp byte # D7 of entity D0's information - D1 between D5 and D6

DecreaseAndClampByte:
		
		move.w  d4,-(sp)
		bsr.w   GetCharEntryAddress
		move.b  d1,d4
		move.b  (a0,d7.w),d1
		sub.b   d4,d1
		bcs.s   loc_9380
		cmp.b   d5,d1
		bcc.s   loc_9384
loc_9380:
		move.b  d5,d1
		bra.s   loc_938A
loc_9384:
		cmp.b   d6,d1
		bcs.s   loc_938A
		move.b  d6,d1
loc_938A:
		move.b  d1,(a0,d7.w)
		move.w  (sp)+,d4
		andi.w  #$FF,d1
		rts

	; End of function DecreaseAndClampByte


; =============== S U B R O U T I N E =======================================

ClampWordIncreasing:
		
		bsr.w   GetCharEntryAddress
		add.w   (a0,d7.w),d1
		bmi.s   loc_93A4
		cmp.w   d6,d1
		bcs.s   loc_93A8
loc_93A4:
		move.w  d6,d1
		bra.s   loc_93AE
loc_93A8:
		cmp.w   d5,d1
		bcc.s   loc_93AE
		move.w  d5,d1
loc_93AE:
		move.w  d1,(a0,d7.w)
		rts

	; End of function ClampWordIncreasing


; =============== S U B R O U T I N E =======================================

ClampWordDecreasing:
		
		move.w  d4,-(sp)
		bsr.w   GetCharEntryAddress
		move.w  d1,d4
		move.w  (a0,d7.w),d1
		sub.w   d4,d1
		bmi.s   loc_93C8
		cmp.w   d5,d1
		bhi.s   loc_93CC
loc_93C8:
		move.w  d5,d1
		bra.s   loc_93D2
loc_93CC:
		cmp.w   d6,d1
		bls.s   loc_93D2
		move.w  d6,d1
loc_93D2:
		move.w  d1,(a0,d7.w)
		move.w  (sp)+,d4
		rts

	; End of function ClampWordDecreasing


; =============== S U B R O U T I N E =======================================

sub_93DA:
		bsr.w   GetCharEntryAddress
		add.l   (a0,d7.w),d1
		bmi.s   loc_93E8
		cmp.l   d6,d1
		bcs.s   loc_93EC
loc_93E8:
		move.l  d6,d1
		bra.s   loc_93F2
loc_93EC:
		cmp.l   d5,d1
		bcc.s   loc_93F2
		move.l  d5,d1
loc_93F2:
		move.l  d1,(a0,d7.w)
		rts

	; End of function sub_93DA


; =============== S U B R O U T I N E =======================================

sub_93F8:
		move.l  d4,-(sp)
		bsr.w   GetCharEntryAddress
		move.l  d1,d4
		move.l  (a0,d7.w),d1
		sub.l   d4,d1
		bmi.s   loc_940C
		cmp.l   d5,d1
		bhi.s   loc_9410
loc_940C:
		move.l  d5,d1
		bra.s   loc_9416
loc_9410:
		cmp.l   d6,d1
		bls.s   loc_9416
		move.l  d6,d1
loc_9416:
		move.l  d1,(a0,d7.w)
		move.l  (sp)+,d4
		rts

	; End of function sub_93F8


; =============== S U B R O U T I N E =======================================

; Gets distance between two entities (simple X and Y calculation, no obstructions)
; In: D0 = from entity
;     D1 = to entity
; Out: D2 = distance

GetDistanceBetweenEntities:
		
		movem.l d0-d1/d3-d5,-(sp)
		move.w  d1,d5           ; d0 and d1 are character indexes
		clr.w   d1
		clr.w   d2
		clr.w   d3
		clr.w   d4
		bsr.w   GetXPos
		cmpi.b  #$FF,d1
		beq.w   loc_9478
		move.w  d1,d2           ; keep 1st character XPos
		bsr.w   GetYPos
		cmpi.b  #$FF,d1
		beq.w   loc_9478
		move.w  d1,d3           ; keep 1st character YPos
		move.w  d5,d0
		bsr.w   GetXPos
		cmpi.b  #$FF,d1
		beq.w   loc_9478
		move.w  d1,d4
		bsr.w   GetYPos
		cmpi.b  #$FF,d1
		beq.w   loc_9478
		move.w  d1,d5
		sub.w   d4,d2
		bcc.s   loc_946C
		neg.w   d2
loc_946C:
		sub.w   d5,d3
		bcc.s   loc_9472
		neg.w   d3
loc_9472:
		add.w   d3,d2
		bra.w   loc_947C
loc_9478:
		move.w  #$FFFF,d2
loc_947C:
		movem.l (sp)+,d0-d1/d3-d5
		rts

	; End of function GetDistanceBetweenEntities


; =============== S U B R O U T I N E =======================================

nullsub_6:
		rts

	; End of function nullsub_6


; =============== S U B R O U T I N E =======================================

LevelUp:
		movem.l d0-a1,-(sp)
		link    a6,#-$10
		move.w  d0,-2(a6)
		bsr.w   GetClass
		move.w  d1,d3
		bsr.w   GetCurrentLevel
		moveq   #$63,d2 
		cmpi.w  #$C,d3
		bge.s   loc_94A4
		moveq   #$28,d2 
loc_94A4:
		lsl.w   #2,d0
		movea.l (p_pt_CharacterStats).l,a0
		movea.l (a0,d0.w),a0
loc_94B0:
		tst.b   (a0)
		bmi.w   loc_94C6
		cmp.b   (a0)+,d3
		beq.s   loc_94C2
loc_94BA:
		cmpi.b  #$FE,(a0)+
		bcs.s   loc_94BA
		bra.s   loc_94B0
loc_94C2:
		cmp.w   d2,d1
		blt.s   loc_94E2
loc_94C6:
		lea     (byte_FFAF82).l,a1
		move.b  #$FF,(a1)+
		clr.b   (a1)+
		clr.b   (a1)+
		clr.b   (a1)+
		clr.b   (a1)+
		clr.b   (a1)+
		move.b  #$FF,(a1)
		bra.w   loc_95BE
loc_94E2:
		lea     (byte_FFAF82).l,a1
		move.w  -2(a6),d0
		bsr.w   GetCurrentLevel
		move.w  d1,d5
		moveq   #0,d2
		moveq   #0,d3
		moveq   #0,d4
		move.b  (a0)+,d2
		move.b  (a0)+,d3
		move.b  (a0)+,d4
loc_94FE:
		bsr.w   GetMaxHP
		bsr.w   sub_96BA
		move.b  d1,1(a1)
		bsr.w   IncreaseMaxHP
		move.b  (a0)+,d2
		move.b  (a0)+,d3
		move.b  (a0)+,d4
		bsr.w   GetMaxMP
		bsr.w   sub_96BA
		move.b  d1,2(a1)
loc_9520:
		bsr.w   IncreaseMaxMP
		move.b  (a0)+,d2
		move.b  (a0)+,d3
		move.b  (a0)+,d4
		bsr.w   GetBaseATK
		bsr.w   sub_96BA
		move.b  d1,3(a1)
		bsr.w   IncreaseBaseATK
		move.b  (a0)+,d2
		move.b  (a0)+,d3
		move.b  (a0)+,d4
		bsr.w   GetBaseDEF
		bsr.w   sub_96BA
		move.b  d1,4(a1)
		bsr.w   IncreaseBaseDEF
		move.b  (a0)+,d2
		move.b  (a0)+,d3
		move.b  (a0)+,d4
		bsr.w   GetBaseAGI
		bsr.w   sub_96BA
		move.b  d1,5(a1)
		bsr.w   IncreaseBaseAGI
		addq.w  #1,d5
		move.w  d5,d1
		bsr.w   SetLevel
		move.b  d5,(a1)
		bsr.w   GetClass
		cmpi.w  #$B,d1
		blt.s   loc_957E
loc_957A:
		addi.w  #CHAR_CLASS_EXTRALEVEL,d5
loc_957E:
		move.b  #$FF,6(a1)
loc_9584:
		move.b  (a0)+,d2
		move.b  (a0)+,d1
		cmpi.b  #$FE,d2
		bne.s   loc_95A2
		move.w  d0,d2
		lsl.w   #2,d2
		movea.l (p_pt_CharacterStats).l,a0
		movea.l (a0,d2.w),a0
		lea     $10(a0),a0
		bra.s   loc_9584
loc_95A2:
		cmpi.b  #$FF,d2
		beq.w   loc_95BA
		cmp.b   d2,d5
		bne.s   loc_9584
		bsr.w   LearnSpell      
		tst.w   d2
		bne.s   loc_95BA
		move.b  d1,6(a1)
loc_95BA:
		bsr.w   ApplyStatusAndItemsOnStats
loc_95BE:
		unlk    a6
		movem.l (sp)+,d0-a1
		rts

	; End of function LevelUp


; =============== S U B R O U T I N E =======================================

InitCharacterStats:
		
		movem.l d0-d2/a0,-(sp)
		move.w  d1,-(sp)
		move.w  d0,d2
		lsl.w   #2,d2
loc_95D0:
		movea.l (p_pt_CharacterStats).l,a0
		movea.l (a0,d2.w),a0
		clr.w   d1
		addq.l  #2,a0
		move.b  (a0)+,d1
		bsr.w   SetMaxHP
loc_95E4:
		bsr.w   SetCurrentHP
		clr.w   d1
		addq.l  #2,a0
		move.b  (a0)+,d1
		bsr.w   SetMaxMP
		bsr.w   SetCurrentMP
		clr.w   d1
		addq.l  #2,a0
		move.b  (a0)+,d1
		bsr.w   SetBaseATK
		clr.w   d1
		addq.l  #2,a0
		move.b  (a0)+,d1
		bsr.w   SetBaseDEF
		clr.w   d1
		addq.l  #2,a0
		move.b  (a0)+,d1
		bsr.w   SetBaseAGI
		moveq   #1,d1
		bsr.w   SetLevel
		move.w  (sp)+,d4
		move.w  d4,d5
		bsr.w   GetClass
		cmpi.w  #$B,d1
		blt.s   loc_962C
		addi.w  #$14,d5
loc_962C:
		move.w  d0,d2
		lsl.w   #2,d2
		movea.l (p_pt_CharacterStats).l,a0
		movea.l (a0,d2.w),a0
loc_963A:
		tst.b   (a0)
		bmi.w   loc_96B4
		cmp.b   (a0)+,d1
		beq.s   loc_964C
loc_9644:
		cmpi.b  #$FE,(a0)+
		bcs.s   loc_9644
		bra.s   loc_963A
loc_964C:
		lea     $F(a0),a0
loc_9650:
		move.b  (a0)+,d2
		move.b  (a0)+,d1
		cmpi.b  #$FE,d2
		bne.s   loc_966E
		move.w  d0,d2
		lsl.w   #2,d2
		movea.l (p_pt_CharacterStats).l,a0
		movea.l (a0,d2.w),a0
		lea     $10(a0),a0
		bra.s   loc_9650
loc_966E:
		cmpi.b  #$FF,d2
		beq.w   loc_96A6
		cmp.b   d2,d5
		blt.s   loc_9650
		cmpi.b  #$80,d1
		bne.s   loc_96A0
		bsr.w   GetBaseProwess
		move.w  d1,d2
		andi.w  #$F,d1
		lsr.w   #4,d2
		addq.w  #1,d2
		cmpi.w  #8,d2
		bne.s   loc_9696
		moveq   #7,d2
loc_9696:
		lsl.w   #4,d2
		or.w    d2,d1
		bsr.w   SetBaseSomething
		bra.s   loc_96A4
loc_96A0:
		bsr.w   LearnSpell      
loc_96A4:
		bra.s   loc_9650
loc_96A6:
		subq.w  #2,d4
		blt.w   loc_96B4
loc_96AC:
		bsr.w   LevelUp
		dbf     d4,loc_96AC
loc_96B4:
		movem.l (sp)+,d0-d2/a0
		rts

	; End of function InitCharacterStats


; =============== S U B R O U T I N E =======================================

sub_96BA:
		tst.b   d2
		bne.s   loc_96C4
		move.w  #0,d1
		rts
loc_96C4:
		movem.l d0/d2-a0,-(sp)
		movem.w d1-d5,-(sp)
		cmpi.w  #$1E,d5
		blt.s   loc_96DC
		move.w  #$100,d0
		move.w  #$180,d4
		bra.s   loc_96FE
loc_96DC:
		andi.w  #7,d2
		subq.w  #1,d2
		muls.w  #$74,d2 
		movea.l (p_StatGrowthCurves).l,a0
		adda.w  d2,a0
		move.w  d5,d2
		subq.w  #1,d2
		lsl.w   #2,d2
		adda.w  d2,a0
		move.w  (a0)+,d0
		move.w  (a0)+,d7
		sub.w   d3,d4
		mulu.w  d7,d4
loc_96FE:
		move.w  #$80,d6 
		jsr     (UpdateRandomSeed).w
		add.w   d7,d4
		jsr     (UpdateRandomSeed).w
		sub.w   d7,d4
		addi.w  #$80,d4 
		lsr.w   #8,d4
		move.w  d4,d6
		movem.w (sp)+,d1-d5
		sub.w   d3,d4
		mulu.w  d4,d0
		addi.w  #$80,d0 
		lsr.w   #8,d0
		add.w   d3,d0
		add.w   d6,d1
		cmp.w   d0,d1
		bge.s   loc_972E
		addq.w  #1,d6
loc_972E:
		move.w  d6,d1
		movem.l (sp)+,d0/d2-a0
		rts

	; End of function sub_96BA


; =============== S U B R O U T I N E =======================================

NewGame:
		movem.w d0-d1/d7,-(sp)
		bsr.w   InitGameSettings
		moveq   #COM_ALLIES_COUNTER,d7
loc_9740:
		moveq   #COM_ALLIES_COUNTER,d0
		sub.w   d7,d0
		bsr.w   InitCharacterDataInRAM
		dbf     d7,loc_9740
		moveq   #GOLD_STARTING_AMOUNT,d1; starting gold value
		bsr.w   SetGold
		moveq   #CHAR_IDX_BOWIE,d0; starting character
		bsr.w   JoinForce
		movem.w (sp)+,d0-d1/d7
		rts

	; End of function NewGame


; =============== S U B R O U T I N E =======================================

InitCharacterDataInRAM:
		
		movem.l d0-d3/a0-a1,-(sp)
		move.w  d0,d1
		mulu.w  #CHAR_ENTRY_SIZE,d1
		lea     ((CHARACTER_DATA-$1000000)).w,a1
		adda.w  d1,a1
		movea.l (p_AllyNames).l,a0
		move.w  d0,d1
		subq.w  #1,d1
		blt.s   loc_9786
loc_977A:
		clr.w   d2
		move.b  (a0)+,d2
		lea     (a0,d2.w),a0
		dbf     d1,loc_977A
loc_9786:
		move.b  (a0)+,d2
		moveq   #CHAR_NAMELENGTH,d3
		sub.w   d2,d3
		subq.w  #1,d2
		blt.s   loc_9796
loc_9790:
		move.b  (a0)+,(a1)+
		dbf     d2,loc_9790
loc_9796:
		subq.w  #1,d3
		blt.s   loc_97A0
loc_979A:
		clr.b   (a1)+
		dbf     d3,loc_979A
loc_97A0:
		move.w  d0,d1
		mulu.w  #CHARDEF_STARTDATA_ENTRYSIZE,d1
		movea.l (p_CharacterStartData).l,a0
		adda.w  d1,a0
		suba.w  #$A,a1
		move.b  (a0)+,d1
		move.b  d1,$A(a1)
		move.b  (a0)+,d2
		move.b  d2,$B(a1)
		ext.w   d2
		move.w  d2,-(sp)
		clr.w   d3
		move.b  (a0)+,d3
		move.w  d3,CHAR_OFFSET_ITEM_0(a1)
		move.b  (a0)+,d3
		move.w  d3,CHAR_OFFSET_ITEM_1(a1)
		move.b  (a0)+,d3
		move.w  d3,CHAR_OFFSET_ITEM_2(a1)
		move.b  (a0)+,d3
		move.w  d3,CHAR_OFFSET_ITEM_3(a1)
		move.l  #$3F3F3F3F,CHAR_OFFSET_SPELL_0(a1)
		bsr.w   SetCharacterClassData
		move.w  (sp)+,d1
		bsr.w   InitCharacterStats
		bsr.w   ApplyStatusAndItemsOnStats
		movem.l (sp)+,d0-d3/a0-a1
		rts

	; End of function InitCharacterDataInRAM


; =============== S U B R O U T I N E =======================================

SetCharacterClassData:
		
		movem.l d0-d1/a0-a1,-(sp)
		mulu.w  #$38,d0 
		lea     ((CHARACTER_DATA-$1000000)).w,a1
		adda.w  d0,a1
		movea.l (p_ClassData).l,a0
loc_980C:
		andi.w  #$1F,d1
		mulu.w  #5,d1
		adda.w  d1,a0
		move.b  (a0)+,$18(a1)
		move.b  (a0)+,$1A(a1)
		move.b  (a0)+,$1B(a1)
		move.b  (a0)+,$31(a1)
		move.b  (a0)+,$1E(a1)
		movem.l (sp)+,d0-d1/a0-a1
		rts

	; End of function SetCharacterClassData


; =============== S U B R O U T I N E =======================================

Promote:
		movem.w d1,-(sp)
		bsr.w   GetClass
		bsr.s   SetCharacterClassData
		bsr.w   ApplyStatusAndItemsOnStats
		movem.w (sp)+,d1
		rts

	; End of function Promote


; =============== S U B R O U T I N E =======================================

; Clear all flags and important game variables.

InitGameSettings:
		
		movem.l d0/d7-a0,-(sp)
		moveq   #0,d0
		lea     ((GAME_FLAGS-$1000000)).w,a0
		moveq   #$1F,d7
loc_9850:
		move.l  d0,(a0)+
		dbf     d7,loc_9850
		lea     ((DEALS_ITEMS-$1000000)).w,a0
		moveq   #$F,d7
loc_985C:
		move.l  d0,(a0)+
		dbf     d7,loc_985C
		move.l  #$7F7F7F7F,d0
		lea     ((CARAVAN_ITEMS-$1000000)).w,a0
		moveq   #$F,d7
loc_986E:
		move.l  d0,(a0)+
		dbf     d7,loc_986E
		moveq   #0,d0
		move.w  d0,((NUM_ITEMS_IN_CARAVAN-$1000000)).w
		move.w  d0,((CURRENT_GOLD-$1000000)).w
		move.b  d0,((PLAYER_TYPE-$1000000)).w
		move.b  d0,((CURRENT_MAP-$1000000)).w
		move.b  d0,((CURRENT_BATTLE-$1000000)).w
		move.b  d0,((DISPLAY_BATTLE_MESSAGES-$1000000)).w
		move.b  d0,((EGRESS_MAP_INDEX-$1000000)).w
		move.l  #359999,((SPECIAL_BATTLE_RECORD-$1000000)).w
		move.b  #2,((MESSAGE_SPEED-$1000000)).w
		move.l  #$FFFFFFFF,((FOLLOWERS_LIST-$1000000)).w
		move.w  #$FFFF,((byte_FFAF26-$1000000)).w
		movem.l (sp)+,d0/d7-a0
		rts

	; End of function InitGameSettings


; =============== S U B R O U T I N E =======================================

CheckFlag:
		movem.l d0-d1/a0,-(sp)
		bsr.w   GetFlag         
		and.b   (a0),d0
		movem.l (sp)+,d0-d1/a0
		rts

	; End of function CheckFlag


; =============== S U B R O U T I N E =======================================

SetFlag:
		movem.l d0-d1/a0,-(sp)
		bsr.w   GetFlag         
		or.b    d0,(a0)
		movem.l (sp)+,d0-d1/a0
		rts

	; End of function SetFlag


; =============== S U B R O U T I N E =======================================

ClearFlag:
		movem.l d0-d1/a0,-(sp)
		bsr.w   GetFlag         
		eori.b  #$FF,d0
		and.b   d0,(a0)
		movem.l (sp)+,d0-d1/a0
		rts

	; End of function ClearFlag


; =============== S U B R O U T I N E =======================================

; flag bit check pattern based on bit number D1 -> D0

GetFlag:
		andi.l  #FLAG_MASK,d1
		divu.w  #8,d1           ; get the byte in which the flag is stored
		lea     ((GAME_FLAGS-$1000000)).w,a0
						; go to the flag location in RAM
		adda.w  d1,a0           ; go to the concerned byte
		swap    d1
		moveq   #$FFFFFF80,d0
		lsr.b   d1,d0
		rts

	; End of function GetFlag


; =============== S U B R O U T I N E =======================================

; determine who is in the force or not based on flags and update RAM lists

UpdateForce:
		movem.l d0-d4/d7/a2-a4,-(sp)
		lea     ((TARGET_CHARACTERS_INDEX_LIST-$1000000)).w,a2
		lea     ((BATTLE_PARTY_MEMBERS-$1000000)).w,a3
		lea     ((RESERVE_MEMBERS-$1000000)).w,a4
		moveq   #0,d2
		moveq   #0,d3
		moveq   #0,d4
		moveq   #0,d0
		moveq   #COM_ALLIES_COUNTER,d7; loop 30 times
loc_991A:
		move.w  d0,d1
		addi.w  #0,d1
		bsr.s   CheckFlag
		beq.w   loc_993E
		move.b  d0,(a2)+
		addq.w  #1,d2
		move.w  d0,d1
		addi.w  #$20,d1 
		bsr.s   CheckFlag
		beq.s   loc_993A
		move.b  d0,(a3)+
		addq.w  #1,d3
		bra.s   loc_993E
loc_993A:
		move.b  d0,(a4)+
		addq.w  #1,d4
loc_993E:
		addq.b  #1,d0
		dbf     d7,loc_991A
		move.w  d2,((TARGET_CHARACTERS_INDEX_LIST_SIZE-$1000000)).w
		move.w  d3,((NUMBER_OF_BATTLE_PARTY_MEMBERS-$1000000)).w
		move.w  d4,((NUMBER_OF_OTHER_PARTY_MEMBERS-$1000000)).w
		movem.l (sp)+,d0-d4/d7/a2-a4
		rts

	; End of function UpdateForce


; =============== S U B R O U T I N E =======================================

JoinForce:
		move.l  d1,-(sp)
		clr.w   d1
		move.b  d0,d1
		addi.w  #0,d1
		bsr.w   SetFlag
		bsr.s   UpdateForce     
		cmpi.w  #FORCE_MAX_SIZE,((NUMBER_OF_BATTLE_PARTY_MEMBERS-$1000000)).w
		bcc.s   loc_9972
		bsr.w   JoinBattleParty
loc_9972:
		move.l  (sp)+,d1
		rts

	; End of function JoinForce


; =============== S U B R O U T I N E =======================================

LeaveForce:
		move.l  d1,-(sp)
		move.b  d0,d1
		andi.b  #$FF,d1
		addi.w  #0,d1
		bsr.w   ClearFlag
		move.w  #MAP_NULLPOSITION,d1
		jsr     SetXPos
		move.l  (sp)+,d1
		rts

	; End of function LeaveForce


; =============== S U B R O U T I N E =======================================

IsInBattleParty:
		
		movem.l d1,-(sp)
		move.b  d0,d1
		andi.b  #$FF,d1
		addi.w  #FLAG_COUNT_FORCEMEMBERS_JOINED,d1
		bsr.w   CheckFlag
		movem.l (sp)+,d1
		rts

	; End of function IsInBattleParty


; =============== S U B R O U T I N E =======================================

JoinBattleParty:
		
		move.l  d1,-(sp)
		move.b  d0,d1
		andi.b  #$FF,d1
		addi.w  #FLAG_COUNT_FORCEMEMBERS_JOINED,d1
		bsr.w   SetFlag
		move.l  (sp)+,d1
		rts

	; End of function JoinBattleParty


; =============== S U B R O U T I N E =======================================

LeaveBattleParty:
		
		move.l  d1,-(sp)
		move.b  d0,d1
		andi.b  #$FF,d1
		addi.w  #FLAG_COUNT_FORCEMEMBERS_JOINED,d1
		bsr.w   ClearFlag
		move.w  #$FFFF,d1
		jsr     SetXPos
		move.l  (sp)+,d1
		rts

	; End of function LeaveBattleParty


; =============== S U B R O U T I N E =======================================

; In: D1 = item idx
; Out: D2 = number of item idx in deals

GetDealsItemAmount:
		
		movem.l d0-d1/a0,-(sp)
		bsr.w   GetDealsItemInfo
		movem.l (sp)+,d0-d1/a0
		rts

	; End of function GetDealsItemAmount


; =============== S U B R O U T I N E =======================================

; In: D1 = item idx

AddItemToDeals:
		
		movem.l d0-d2/a0,-(sp)
		bsr.w   GetDealsItemInfo
		cmpi.b  #DEALS_MAX_NUM_PER_ITEM,d2
		beq.s   loc_99FC
		add.b   d0,(a0)
loc_99FC:
		movem.l (sp)+,d0-d2/a0
		rts

	; End of function AddItemToDeals


; =============== S U B R O U T I N E =======================================

; In: D1 = item idx

RemoveItemFromDeals:
		
		movem.l d0-d2/a0,-(sp)
		bsr.w   GetDealsItemInfo
		tst.b   d2
		beq.s   loc_9A10
		sub.b   d0,(a0)
loc_9A10:
		movem.l (sp)+,d0-d2/a0
		rts

	; End of function RemoveItemFromDeals


; =============== S U B R O U T I N E =======================================

; In: D1 = item idx
; Out: A0 = RAM address of deals slot
;      D0 = amt to add to deals slot (0x10 or 0x01)
;      D2 = number of item idx in deals

GetDealsItemInfo:
		
		andi.l  #ITEM_MASK_IDX,d1
		lea     ((DEALS_ITEMS-$1000000)).w,a0
		divu.w  #2,d1
		adda.w  d1,a0
		move.b  (a0),d2
		btst    #DEALS_BIT_REMAINDER,d1
		bne.s   loc_9A34
		lsr.b   #BITS_HALFBYTE,d2
		moveq   #DEALS_ADDAMT_ODD,d0
		bra.s   return_9A3A
loc_9A34:
		andi.b  #DEALS_MAX_NUM_PER_ITEM,d2
		moveq   #DEALS_ADDAMT_EVEN,d0
return_9A3A:
		rts

	; End of function GetDealsItemInfo


; =============== S U B R O U T I N E =======================================

; In: D1 = item idx (only the actual item idx is used, the status bits are cut out)

AddItemToCaravan:
		
		movem.l d0-d1/a0,-(sp)
		moveq   #CARAVAN_MAX_ITEMS,d0
		cmp.w   ((NUM_ITEMS_IN_CARAVAN-$1000000)).w,d0
		bcs.s   loc_9A5C
		lea     ((CARAVAN_ITEMS-$1000000)).w,a0
		move.w  ((NUM_ITEMS_IN_CARAVAN-$1000000)).w,d0
		andi.w  #ITEM_MAX_IDX,d1
		move.b  d1,(a0,d0.w)
		addq.w  #1,((NUM_ITEMS_IN_CARAVAN-$1000000)).w
loc_9A5C:
		movem.l (sp)+,d0-d1/a0
		rts

	; End of function AddItemToCaravan


; =============== S U B R O U T I N E =======================================

RemoveItemFromCaravan:
		
		movem.l d0/d7-a1,-(sp)
		moveq   #0,d0
		lea     ((CARAVAN_ITEMS-$1000000)).w,a0
		movea.l a0,a1
		move.w  ((NUM_ITEMS_IN_CARAVAN-$1000000)).w,d7
		subq.w  #1,d7
		bcs.w   loc_9A94
loc_9A78:
		cmp.w   d0,d1
		bne.s   loc_9A84
		addq.l  #1,a1
		subq.w  #1,((NUM_ITEMS_IN_CARAVAN-$1000000)).w
		bra.s   loc_9A86
loc_9A84:
		move.b  (a1)+,(a0)+
loc_9A86:
		addq.w  #1,d0
		dbf     d7,loc_9A78
		cmpa.l  a1,a0
		beq.s   loc_9A94
		move.b  #ITEMIDX_NOTHING,(a0)
loc_9A94:
		movem.l (sp)+,d0/d7-a1
		rts

	; End of function RemoveItemFromCaravan

