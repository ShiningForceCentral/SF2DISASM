
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
                include "data\stats\allies\classes\promotions.asm"    ; Promotions
                align
                include "code\common\menus\church\churchactions_2.asm"    ; Church functions
                include "code\common\menus\main\mainactions.asm"    ; Main menu functions
                include "code\common\menus\blacksmith\blacksmithactions.asm"    ; Blacksmith functions
                include "data\stats\allies\classes\blacksmitheligibleclasses.asm"    ; Blacksmith eligible classes list
                include "code\common\menus\blacksmith\pickmithrilweapon.asm"    ; Pick Mithril Weapon function
                include "data\stats\items\mithrilweapons.asm"    ; Mithril weapons data
                include "code\common\menus\caravan\caravanactions_1.asm"    ; Caravan menu functions
                include "data\stats\items\specialcaravandescriptions.asm"    ; Special Caravan descriptions
                include "code\common\menus\caravan\caravanactions_2.asm"    ; Caravan menu functions
                include "code\common\menus\item\isitemusableonfield.asm"    ; Item menu function
                include "data\stats\items\usableoutsidebattleitems.asm"    ; Usable outside battle items
                include "code\common\menus\item\fielditemeffects.asm"    ; Functions to perform effects from using items on the exploration field
                include "code\common\menus\getplayerentityposition.asm"    ; Main menu function
                
                ; Battle functions
                include "code\gameflow\battle\battlefunctions\battlefunctions_0.asm"    ; Battle functions
                include "code\gameflow\exploration\explorationfunctions_0.asm"    ; Exploration functions
                include "data\stats\items\chestgoldamounts.asm"    ; Chest gold amounts
                include "code\gameflow\exploration\explorationfunctions_1.asm"    ; Exploration functions
                include "code\gameflow\battle\battlefunctions\battleloop_1.asm"    ; Battle loop main, part 1
                include "code\gameflow\battle\battleloop\killallenemies.asm"    ; Battle loop function
                include "code\gameflow\battle\battleloop\heallivingandimmortalallies.asm"    ; Battle loop function
                include "code\gameflow\battle\battleloop\countremainingcombatants.asm"    ; Battle loop function
                include "code\gameflow\battle\battlefunctions\battleloop_2.asm"    ; Battle loop main, part 2
                include "code\gameflow\battle\battlefunctions\battlefunctions_1.asm"    ; Battle functions
                include "code\gameflow\battle\battleloop\getegresspositionforbattle.asm"    ; Battle loop : Get Egress Position For Battle function
                include "code\gameflow\battle\battlefunctions\executeindividualturn.asm"    ; Execute Individual Turn function
                include "code\gameflow\battle\battleloop\processafterturneffects.asm"    ; Battle loop functions
                include "code\gameflow\battle\battleloop\spawnenemy.asm"    ; Battle loop functions
                include "code\gameflow\battle\battleloop\cleardeadcombatantslist.asm"    ; Battle loop functions
                include "code\gameflow\battle\battleloop\processkilledcombatants.asm"    ; Battle loop functions
                include "code\gameflow\battle\battlefunctions\battlefunctions_2.asm"    ; Battle functions
                include "code\gameflow\battle\battleloop\updateenemyai.asm"    ; Battle loop : Enemy AI update functions
                include "code\gameflow\battle\battleloop\turnorderfunctions.asm"    ; Battle loop : Turn order functions
                include "code\gameflow\battle\battlefunctions\loadBattle.asm"    ; Battle data loading function
                include "code\gameflow\battle\battlefunctions\battlefunctions_3.asm"    ; Battle functions
                include "code\gameflow\battle\battleloop\printdefcons.asm"    ; Battle loop : Debug messages
                include "code\gameflow\battle\battlefunctions\setmovesfx.asm"    ; Set Move Sfx function
                include "code\gameflow\exploration\explorationfunctions_2.asm"    ; Exploration functions
                include "code\gameflow\battle\battlevints.asm"    ; Battle VInt functions
                include "code\gameflow\exploration\explorationvints.asm"    ; Exploration VInt functions
                
                include "data\graphics\specialsprites\pointers.asm"    ; Special Sprites pointers
                include "code\common\tech\graphics\specialsprites.asm"    ; Special Sprites functions
                includeIfVanillaRom "data\graphics\specialsprites\entries.asm"    ; Special Sprites entries
                include "code\common\tech\graphics\specialspritesanims.asm"    ; Special Sprites Animations
                include "code\specialscreens\suspend\suspend.asm"    ; Suspend functions
                include "code\specialscreens\witchend\witchend.asm"    ; Witch end functions
                align $28000
