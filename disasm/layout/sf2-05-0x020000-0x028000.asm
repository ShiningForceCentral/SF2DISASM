
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
            if (STANDARD_BUILD=1)
                include "data\stats\allies\classes\promotions-standard.asm"
            else
                include "data\stats\allies\classes\promotions.asm"    ; Promotions
            endif
                align
                include "code\common\menus\church\churchactions_2.asm"    ; Church functions
            if (STANDARD_BUILD=1)
                include "code\common\menus\main\mainactions-standard.asm"
            else
                include "code\common\menus\main\mainactions.asm"    ; Main menu functions
            endif
                include "code\common\menus\blacksmith\blacksmithactions.asm"    ; Blacksmith functions
                include "data\stats\allies\classes\blacksmitheligibleclasses.asm"    ; Blacksmith eligible classes list
                include "code\common\menus\blacksmith\pickmithrilweapon.asm"    ; Pick Mithril Weapon function
                include "data\stats\items\mithrilweapons.asm"    ; Mithril weapons data
                include "code\common\menus\caravan\caravanactions_1.asm"    ; Caravan functions
                include "data\stats\items\specialcaravandescriptions.asm"    ; Special Caravan descriptions
                include "code\common\menus\caravan\choosecaravanportrait.asm"    ; Choose Caravan Portrait function
                include "code\common\menus\caravan\caravanactions_2.asm"    ; Caravan functions
                include "code\common\stats\items\itemactions_1.asm"    ; Item functions
                include "data\stats\items\usableoutsidebattleitems.asm"    ; Usable outside battle items
                include "code\common\stats\items\itemactions_2.asm"    ; Item functions
                
                ; Battle functions
                include "code\gameflow\battle\battlefunctions\battlefunctions_0.asm"    ; Battle functions
                include "code\gameflow\exploration\explorationfunctions_0.asm"    ; Exploration functions
                include "data\stats\items\chestgoldamounts.asm"    ; Chest gold amounts
                include "code\gameflow\exploration\explorationfunctions_1.asm"    ; Exploration functions
                include "code\gameflow\battle\battlefunctions\battlefunctions_1.asm"    ; Battle functions
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battlefunctions\getegresspositionforbattle-standard.asm"
                include "code\gameflow\battle\battlefunctions\executeindividualturn-standard.asm"
                include "code\gameflow\battle\battlefunctions\handleafterturneffects-standard.asm"
                include "data\battles\global\egresspositionsforbattles-standard.asm"
                include "data\stats\randomattackspells-standard.asm"
                include "data\battles\global\enemybattlescenemusics-standard.asm"
                include "data\stats\items\afterturnrecovery-standard.asm"
                align
            else
                include "code\gameflow\battle\battlefunctions\getegresspositionforbattle.asm"    ; Get Egress Position For Battle function
                include "code\gameflow\battle\battlefunctions\executeindividualturn.asm"    ; Execute Individual Turn function
                include "code\gameflow\battle\battlefunctions\handleafterturneffects.asm"    ; Handle After Turn Effects function
            endif
                include "code\gameflow\battle\battlefunctions\battlefunctions_2.asm"    ; Battle functions
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battlefunctions\updateenemyaifunctions-standard.asm"
                include "code\gameflow\battle\battlefunctions\turnorderfunctions-standard.asm"
            else
                include "code\gameflow\battle\battlefunctions\updateenemyaifunctions.asm"    ; Update Enemy AI functions
                include "code\gameflow\battle\battlefunctions\turnorderfunctions.asm"    ; Battle turn order functions
            endif
                include "code\gameflow\battle\battlefunctions\battlefunctions_3.asm"    ; Battle functions
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battlefunctions\setmovesfx-standard.asm"
                include "code\gameflow\battle\battlemusic-standard.asm"
                include "data\stats\allies\immortalallies-standard.asm"
                include "data\battles\global\displaytimerbattles-standard.asm"
                include "data\battles\global\losablebattles-standard.asm"
                include "data\stats\items\movesfxforequippedring-standard.asm"
                include "data\battles\global\explorationtobattlemusics-standard.asm"
                align
            else
                include "code\gameflow\battle\battlefunctions\setmovesfx.asm"    ; Set Move Sfx function
            endif
                include "code\gameflow\exploration\explorationfunctions_2.asm"    ; Exploration functions
                include "code\gameflow\battle\battlevints.asm"    ; Battle VInt functions
                include "code\gameflow\exploration\explorationvints.asm"    ; Exploration VInt functions
                
                include "code\common\tech\graphics\specialsprites.asm"    ; Special Sprites functions
                includeIfVanillaRom "code\common\tech\graphics\specialspritesentries.asm"    ; Special Sprites Entries
                include "code\common\tech\graphics\specialspritesanims.asm"    ; Special Sprites Animations
                include "code\specialscreens\suspend\suspend.asm"    ; Suspend functions
                include "code\specialscreens\witchend\witchend.asm"    ; Witch end functions
                alignIfVanillaLayout $28000
