
; GAME SECTION 05 :
; 0x020000..0x028000 : Battle Engine, Special Sprites, Shop/Church/Blacksmith/Caravan engine, Battle Engine, Exploration Engine, Special Sprites
; FREE SPACE : 626 bytes.


j_ShopMenuActions:                
                jmp     ShopMenuActions(pc)
j_ChurchMenuActions:                
                jmp     ChurchMenuActions(pc)
j_MainMenuActions:                
                jmp     MainMenuActions(pc)
j_BlacksmithActions:                
                jmp     BlacksmithActions(pc)
j_CaravanActions:                
                jmp     CaravanMenuActions(pc)
j_LevelUpCutscene:                
                jmp     LevelUpCutscene(pc)
j_ExplorationLoop:                
                jmp     ExplorationLoop(pc)
j_LoadUnitCursorTileData:                
                jmp     LoadUnitCursorTileData(pc)
sub_20020:                
                jmp     sub_23554(pc)
sub_20024:                
                jmp     sub_2364C(pc)
j_ControlUnitCursor:                
                jmp     ControlUnitCursor(pc)
j_SetUnitCursorDestinationToNextBattleEntity:                
                jmp     SetUnitCursorDestinationToNextBattleEntity(pc)
j_SetCameraDestInTiles:                
                jmp     SetCameraDestInTiles(pc)
j_BattleLoop:                
                jmp     BattleLoop(pc)  
j_BattleLoop_Unused:                
                jmp     BattleLoop(pc)  
j_GetEntityEventIndex:                
                jmp     GetEntityEventIndex(pc)
j_GetEntityIndex:                
                jmp     GetEntityIndexForCombatant(pc)
j_FadeOut_WaitForP1Input:                
                jmp     FadeOut_WaitForP1Input(pc)
j_SetEntityPosition:                
                jmp     SetEntityPosition(pc)
j_CheckArea:                
                jmp     CheckArea(pc)   
j_UpdateSpecialSprites:                
                jmp     UpdateSpecialSprites(pc)
j_LoadSpecialSprite:                
                jmp     LoadSpecialSprite(pc)
sub_20058:                
                jmp     sub_25CB6(pc)
j_EndGame:                
                jmp     EndGame(pc)
j_SuspendGame:                
                jmp     SuspendGame(pc)
                include "code\common\menus\shop\shopactions.asm"    ; Shop functions
                include "data\stats\items\shopinventories.asm"    ; Shop inventories
                wordAlign
                include "code\common\menus\church\churchactions_1.asm"    ; Church functions
                include "data\stats\allies\promotions.asm"    ; Promotions
                wordAlign
                include "code\common\menus\church\churchactions_2.asm"    ; Church functions
                include "code\common\menus\main\mainactions.asm"    ; Main menu functions
                include "code\common\menus\blacksmith\blacksmithactions.asm"    ; Blacksmith functions
                include "data\stats\allies\classes\mithrilweaponclasses.asm"    ; Mithril weapon class lists
                include "data\stats\items\mithrilweapons.asm"    ; Mithril weapon lists
                include "code\common\menus\caravan\caravanactions_1.asm"    ; Caravan functions
                include "data\stats\items\specialcaravandescriptions.asm"    ; Special Caravan descriptions
                include "code\common\menus\caravan\caravanactions_2.asm"    ; Caravan functions
                include "code\common\stats\items\itemactions_1.asm"    ; Item functions
                include "data\stats\items\usableoutsidebattleitems.asm"    ; Usable outside battle items
                include "code\common\stats\items\itemactions_2.asm"    ; Item functions
                include "code\gameflow\battle\battlefunctions_0.asm"    ; Battle functions
                include "code\gameflow\exploration\explorationfunctions_0.asm"    ; Exploration functions
                include "data\stats\items\chestgoldamounts.asm"    ; Chest gold amounts
                include "code\gameflow\exploration\explorationfunctions_1.asm"    ; Exploration functions
                include "code\gameflow\battle\battlefunctions_1.asm"    ; Battle functions
                include "code\gameflow\exploration\explorationfunctions_2.asm"    ; Exploration functions
                include "code\gameflow\battle\battlevints.asm"    ; Battle VInt functions
                include "code\gameflow\exploration\explorationvints.asm"    ; Exploration VInt functions
                include "code\common\tech\graphics\specialsprites.asm"    ; Special Sprites functions
                includeIfVanillaRom "code\common\tech\graphics\specialspritesentries.asm"    ; Special Sprites Entries
                include "code\common\tech\graphics\specialspritesanims.asm"    ; Special Sprites Animations
                include "code\specialscreens\suspend\suspend.asm"    ; Suspend functions
                include "code\specialscreens\witchend\witchend.asm"    ; Witch end functions
                align $28000
