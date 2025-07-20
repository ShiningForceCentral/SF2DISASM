
; GAME SECTION 04 :
; 0x018000..0x020000 : Battlescene Engine
; FREE SPACE : 532 bytes.


                include "code\common\tech\jumpinterfaces\s04_jumpinterface.asm"    ; Game Section 04 Jump Interface
                includeIfStandard "code\gameflow\battle\battlescenes\initializebattlescene-standard.asm"    ; Battlescene engine
                includeIfVanilla "code\gameflow\battle\battlescenes\nullsub_18010.asm"    ; Battlescene engine
                includeIfVanilla "code\gameflow\battle\battlescenes\initializebattlescene.asm"    ; Battlescene engine
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
                include "code\gameflow\battle\battlescenes\tintscreen.asm"    ; Battlescene engine
                include "code\gameflow\battle\battlescenes\battlesceneengine_3.asm"    ; Battlescene engine
                include "code\gameflow\battle\battlescenes\animation\nothing.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\blaze.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\freeze.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\desoul.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\healingfairy.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\blast.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\detox.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\bolt.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\buff.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\debuff.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\absorb.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\demonbreath.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\flamebreath.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\arrowsandspears.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\cannonfire.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\shotfire.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\gunnerblast.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\dao.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\apollo.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\neptun.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\atlas.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\prismlaser.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\bubblebreath.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\cutoff.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\attackspell.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\snowbreath.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\phoenixattack.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\burstrock.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\oddeyebeam.asm"    ; 
                include "code\gameflow\battle\battlescenes\updatespellanimation.asm"    ; Battlescene engine
                include "code\gameflow\battle\battlescenes\animation\update\blaze.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\freeze.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\desoul.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\healingfairy.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\blast.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\detox.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\bolt.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\buff.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\debuff.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\demonbreath.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\flamebreath.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\arrowsandspears.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\cannonfire.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\shotfire.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\gunnerblast.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\dao.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\apollo.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\neptun.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\atlas.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\prismlaser.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\bubblebreath.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\snowbreath.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\attackspell.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\phoenixattack.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\burstrock.asm"    ; 
                include "code\gameflow\battle\battlescenes\animation\update\oddeyebeam.asm"    ; 
                include "code\gameflow\battle\battlescenes\battlesceneengine_4.asm"    ; Battlescene engine
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
