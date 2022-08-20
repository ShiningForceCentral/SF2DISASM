
; GAME SECTION 04 :
; 0x018000..0x020000 : BattleScene Engine
; FREE SPACE : 532 bytes.


                include "code\common\tech\jumpinterfaces\s04_jumpinterface.asm"    ; Game Section 04 Jump Interface
                include "code\gameflow\battle\battlescenes\battlesceneengine_0.asm"    ; Battlescene engine
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battlescenes\getallyanimation-standard.asm"
                include "data\graphics\battles\battlesprites\spearthrowanimations-standard.asm"
                align
            else
                include "code\gameflow\battle\battlescenes\getallyanimation.asm"    ; Get ally battlescene animation function
            endif
                include "code\gameflow\battle\battlescenes\battlesceneengine_1.asm"    ; Battlescene engine
            if (STANDARD_BUILD=1)
                include "code\gameflow\battle\battlescenes\getweaponspriteandpalette-standard.asm"
            else
                include "code\gameflow\battle\battlescenes\getweaponspriteandpalette.asm"    ; Weapon sprite and palette getter function
            endif
                include "code\gameflow\battle\battlescenes\getbattlescenebackground.asm"    ; Get battlescene background function
                include "data\battles\global\terrainbackgrounds.asm"    ; Terrain backgrounds table
                include "code\gameflow\battle\battlescenes\battlesceneengine_2.asm"    ; Battlescene engine
                include "data\stats\allies\allybattlesprites.asm"    ; Ally battlesprites table
                include "data\stats\enemies\enemybattlesprites.asm"    ; Enemy battlesprites table
            if (STANDARD_BUILD=1)
                include "data\stats\items\weapongraphics-standard.asm"
                align
            else
                include "data\stats\items\weapongraphics.asm"    ; Weapon graphics table
            endif
                include "data\battles\global\custombackgrounds.asm"    ; Battle custom backgrounds table
                align
                include "data\battles\global\backgroundenemyswitch.asm"    ; Background enemy switch table
                include "data\graphics\battles\battlesprites\allyidlebattlesprites.asm"    ; Ally Idle Battle Sprites
                include "data\graphics\battles\battlesprites\enemyidlebattlesprites.asm"    ; Enemy Idle Battle Sprites
                align
                includeIfVanillaRom "data\graphics\tech\backgroundlayout.asm"    ; Battlescene Background Layout
                alignIfVanillaLayout $20000
