
; GAME SECTION 05 :
; 0x020000..0x028000 : Battle Engine, Special Sprites, Shop/Church/Blacksmith/Caravan engine, Battle Engine, Exploration Engine, Special Sprites
; FREE SPACE : 626 bytes.


                include "code\common\tech\jumpinterfaces\s05_jumpinterface.asm"    ; Game Section 05 Jump Interface
                
                ; Menu actions
                include "code\common\menus\shop\shopactions.asm"    ; Shop functions
                include "data\stats\items\shopinventories.asm"    ; Shop inventories
                include "data\stats\items\debugshop.asm"    ; Debug shop
                align
                include "code\common\menus\church\churchactions_1.asm"    ; Church functions
                includeIfStandard "data\stats\allies\classes\promotions-standard.asm"
                includeIfVanilla "data\stats\allies\classes\promotions.asm"    ; Promotions
                align
                include "code\common\menus\church\churchactions_2.asm"    ; Church functions
                includeIfStandard "code\common\menus\main\mainactions-standard.asm"
                includeIfVanilla "code\common\menus\main\mainactions.asm"    ; Main menu functions
                include "code\common\menus\blacksmith\blacksmithactions.asm"    ; Blacksmith functions
                include "data\stats\allies\classes\blacksmitheligibleclasses.asm"    ; Blacksmith eligible classes list
                include "code\common\menus\blacksmith\pickmithrilweapon.asm"    ; Pick Mithril Weapon function
                include "data\stats\items\mithrilweapons.asm"    ; Mithril weapons data
                includeIfStandard "code\common\menus\caravan\caravanactions-standard.asm"
                includeIfVanilla "code\common\menus\caravan\caravanactions_1.asm"    ; Caravan functions
                includeIfVanilla "data\stats\items\specialcaravandescriptions.asm"    ; Special Caravan descriptions
                includeIfVanilla "code\common\menus\caravan\caravanactions_2.asm"    ; Caravan menu functions
                include "code\common\menus\item\isitemusableonfield.asm"    ; Item menu functions
                includeIfVanilla "data\stats\items\usableoutsidebattleitems.asm"    ; Usable outside battle items
                include "code\common\menus\item\fielditemeffects.asm"    ; Functions to perform effects from using items on an exploration field.
                include "code\common\menus\getplayerentityposition.asm"    ; Main menu function
                
                ; Battle loop (standard)
                includeIfStandard "code\gameflow\battle\battleloop-standard.asm"
                includeIfStandard "code\gameflow\battle\battleloop-standard\loadbattle.asm"
                includeIfStandard "code\gameflow\battle\battleloop-standard\killallenemies.asm"
                includeIfStandard "code\gameflow\battle\battleloop-standard\heallivingandimmortalallies.asm"
                includeIfStandard "code\gameflow\battle\battleloop-standard\initializecombatants.asm"
                includeIfStandard "code\gameflow\battle\battleloop-standard\upgradeenemies.asm"
                includeIfStandard "code\gameflow\battle\battleloop-standard\triggerregionsandactivateenemies.asm"
                includeIfStandard "code\gameflow\battle\battleloop-standard\printdefcons.asm"
                includeIfStandard "code\gameflow\battle\battleloop-standard\spawnenemies.asm"
                includeIfStandard "code\gameflow\battle\battleloop-standard\turnorderfunctions.asm"
                includeIfStandard "code\gameflow\battle\battleloop-standard\processafterturneffectsandkilledcombatants.asm"
                includeIfStandard "code\gameflow\battle\battleloop-standard\getegresspositionforbattle.asm"
                
                ; Battle functions
                includeIfStandard "code\gameflow\battle\battlefunctions\executeindividualturn-standard.asm"
                includeIfStandard "code\gameflow\battle\battlefunctions\setmovesfx-standard.asm"
                includeIfStandard "code\gameflow\battle\battlefunctions\resetaijaro-standard.asm"
                includeIfStandard "code\gameflow\battle\battlemusic-standard.asm"
                includeIfStandard "code\common\tech\graphics\findspecialsprite-standard.asm"
                
                include "code\gameflow\battle\battlefunctions\battlefunctions_0.asm"    ; Battle functions
                include "code\gameflow\exploration\explorationfunctions_0.asm"    ; Exploration functions
                includeIfVanilla "data\stats\items\chestgoldamounts.asm"    ; Chest gold amounts
                include "code\gameflow\exploration\explorationfunctions_1.asm"    ; Exploration functions
                includeIfVanilla "code\gameflow\battle\battleloop_1.asm"    ; Battle loop main, part 1
                includeIfVanilla "code\gameflow\battle\battleloop\killallenemies.asm"    ; Battle loop function
                includeIfVanilla "code\gameflow\battle\battleloop\heallivingandimmortalallies.asm"    ; Battle loop function
                includeIfVanilla "code\gameflow\battle\battleloop\countremainingcombatants.asm"    ; Battle loop function
                includeIfVanilla "code\gameflow\battle\battleloop_2.asm"    ; Battle loop main, part 2
                include "code\gameflow\battle\battlefunctions\battlefunctions_1.asm"    ; Battle functions
                includeIfVanilla "code\gameflow\battle\battleloop\getegresspositionforbattle.asm"    ; Battle loop : Get Egress Position For Battle function
                includeIfVanilla "code\gameflow\battle\battlefunctions\executeindividualturn.asm"    ; Execute Individual Turn function
                includeIfVanilla "code\gameflow\battle\battleloop\processafterturneffects.asm"    ; Battle loop functions
                includeIfVanilla "code\gameflow\battle\battleloop\spawnenemy.asm"    ; Battle loop functions
                includeIfVanilla "code\gameflow\battle\battleloop\cleardeadcombatantslist.asm"    ; Battle loop functions
                includeIfVanilla "code\gameflow\battle\battleloop\processkilledcombatants.asm"    ; Battle loop functions
                include "code\gameflow\battle\battlefunctions\battlefunctions_2.asm"    ; Battle functions
                includeIfVanilla "code\gameflow\battle\battleloop\updateenemyai.asm"    ; Battle loop : Enemy AI update functions
                includeIfVanilla "code\gameflow\battle\battleloop\turnorderfunctions.asm"    ; Battle loop : Turn order functions
                includeIfVanilla "code\gameflow\battle\battleloop\loadbattle.asm"    ; Battle data loading function
                include "code\gameflow\battle\battlefunctions\battlefunctions_3.asm"    ; Battle functions
                includeIfVanilla "code\gameflow\battle\battleloop\printdefcons.asm"    ; Battle loop : Debug messages
                includeIfVanilla "code\gameflow\battle\battlefunctions\setmovesfx.asm"    ; Set Move Sfx function
                include "code\gameflow\exploration\explorationfunctions_2.asm"    ; Exploration functions
                include "code\gameflow\battle\battlevints.asm"    ; Battle VInt functions
                include "code\gameflow\exploration\explorationvints.asm"    ; Exploration VInt functions
                include "code\common\tech\graphics\specialsprites.asm"    ; Special Sprites functions
                include "code\common\tech\graphics\specialspritesentries.asm"    ; Special Sprites Entries
                include "code\common\tech\graphics\specialspritesanims.asm"    ; Special Sprites Animations
                
                includeIfStandard "data\battles\global\displaytimerbattles-standard.asm"
                includeIfStandard "data\stats\items\afterturnrecovery-standard.asm"
                includeIfStandard "data\stats\allies\immortalallies-standard.asm"
                includeIfStandard "data\battles\global\egresspositionsforbattles-standard.asm"
                includeIfStandard "data\battles\global\losablebattles-standard.asm"
                includeIfStandard "data\stats\egressitemsandspells-standard.asm"
                includeIfStandard "data\stats\randomattackspells-standard.asm"
                includeIfStandard "data\stats\enemies\enemybattlescenemusics-standard.asm"
                includeIfStandard "data\stats\items\movesfxforequippedring-standard.asm"
                includeIfStandard "data\battles\global\explorationtobattlemusics-standard.asm"
                includeIfStandard "data\stats\specialsprites-standard.asm"
                alignIfStandard
                
                ; Witch functions
                includeIfVanilla "code\specialscreens\suspend\suspend.asm"    ; Suspend functions
                includeIfVanilla "code\specialscreens\witchend\witchend.asm"    ; Witch end functions
                alignIfVanilla $28000
