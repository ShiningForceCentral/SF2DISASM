
; GAME SECTION 04 :
; 0x018000..0x020000 : BattleScene Engine
; FREE SPACE : 532 bytes.


                include "code\common\tech\jumpinterfaces\s04_jumpinterface.asm"    ; Game Section 04 Jump Interface
                include "code\gameflow\battle\battlescenes\battlesceneengine_0.asm"    ; Battlescene engine
                includeIfStandard "code\gameflow\battle\battlescenes\getallyanimation-standard.asm"
                includeIfStandard "data\graphics\battles\battlesprites\spearthrowanimations-standard.asm"
                alignIfStandard
                includeIfVanilla "code\gameflow\battle\battlescenes\getallyanimation.asm"    ; Get ally battlescene animation function
                include "code\gameflow\battle\battlescenes\battlesceneengine_1.asm"    ; Battlescene engine
                includeIfStandard "code\gameflow\battle\battlescenes\getweaponspriteandpalette-standard.asm"
                includeIfVanilla "code\gameflow\battle\battlescenes\getweaponspriteandpalette.asm"    ; Weapon sprite and palette getter function
                include "code\gameflow\battle\battlescenes\getbattlescenebackground.asm"    ; Get battlescene background function
                include "data\battles\global\terrainbackgrounds.asm"    ; Terrain backgrounds table
                include "code\gameflow\battle\battlescenes\battlesceneengine_2.asm"    ; Battlescene engine
                include "data\stats\allies\allybattlesprites.asm"    ; Ally battlesprites table
                include "data\stats\enemies\enemybattlesprites.asm"    ; Enemy battlesprites table
                includeIfStandard "data\stats\items\weapongraphics-standard.asm"
                alignIfStandard
                includeIfVanilla "data\stats\items\weapongraphics.asm"    ; Weapon graphics table
                include "data\battles\global\custombackgrounds.asm"    ; Battle custom backgrounds table
                align
                include "data\battles\global\backgroundenemyswitch.asm"    ; Background enemy switch table
                include "data\graphics\battles\battlesprites\allyidlebattlesprites.asm"    ; Ally Idle Battle Sprites
                include "data\graphics\battles\battlesprites\enemyidlebattlesprites.asm"    ; Enemy Idle Battle Sprites
                align
                includeIfVanilla "data\graphics\tech\backgroundlayout.asm"    ; Battlescene Background Layout
                alignIfVanilla $20000
