
; GAME SECTION 04 :
; 0x018000..0x020000 : BattleScene Engine
; FREE SPACE : 532 bytes.


                include "code\common\tech\jumpinterfaces\s04_jumpinterface.asm"    ; Game Section 04 Jump Interface
                include "code\gameflow\battle\battlescenes\nullsub_18010.asm"
                include "code\gameflow\battle\battlescenes\initializebattlescene.asm"
                include "code\gameflow\battle\battlescenes\battlesceneengine_0.asm" 
                include "code\gameflow\battle\battlescenes\getallyanimation.asm"    ; Get ally battlescene animation function
                include "code\gameflow\battle\battlescenes\battlesceneengine_1.asm"    ; Battlescene engine
                include "code\gameflow\battle\battlescenes\getweaponspriteandpalette.asm"    ; Weapon sprite and palette getter function
                include "code\gameflow\battle\battlescenes\getbattlescenebackground.asm"    ; Get battlescene background function
                include "data\battles\global\terrainbackgrounds.asm"    ; Terrain backgrounds table   ; Battlescene engine
                include "code\gameflow\battle\battlescenes\battlesceneengine_2.asm"    ; Battlescene engine
                include "code\gameflow\battle\battlescenes\tintscreen.asm"
                include "code\gameflow\battle\battlescenes\animation\blaze.asm"
                include "code\gameflow\battle\battlescenes\animation\freeze.asm"
                include "code\gameflow\battle\battlescenes\animation\desoul.asm"
                include "code\gameflow\battle\battlescenes\animation\healingfairy.asm"
                include "code\gameflow\battle\battlescenes\animation\blast.asm"
                include "code\gameflow\battle\battlescenes\animation\detox.asm"
                include "code\gameflow\battle\battlescenes\animation\bolt.asm"
                include "code\gameflow\battle\battlescenes\animation\buff.asm"
                include "code\gameflow\battle\battlescenes\animation\debuff.asm"
                include "code\gameflow\battle\battlescenes\animation\absorb.asm"
                include "code\gameflow\battle\battlescenes\animation\demonbreath.asm"
                include "code\gameflow\battle\battlescenes\animation\flamebreath.asm"
                include "code\gameflow\battle\battlescenes\animation\arrowsandspears.asm"
                include "code\gameflow\battle\battlescenes\animation\cannonfire.asm"
                include "code\gameflow\battle\battlescenes\animation\shotfire.asm"
                include "code\gameflow\battle\battlescenes\animation\gunnerblast.asm"
                include "code\gameflow\battle\battlescenes\animation\dao.asm"
                include "code\gameflow\battle\battlescenes\animation\apollo.asm"
                include "code\gameflow\battle\battlescenes\animation\neptun.asm"
                include "code\gameflow\battle\battlescenes\animation\atlas.asm"
                include "code\gameflow\battle\battlescenes\animation\prismlaser.asm"
                include "code\gameflow\battle\battlescenes\animation\bubblebreath.asm"
                include "code\gameflow\battle\battlescenes\animation\execution.asm"
                include "code\gameflow\battle\battlescenes\animation\attack.asm"
                include "code\gameflow\battle\battlescenes\animation\snowbreath.asm"
                include "code\gameflow\battle\battlescenes\animation\phoenixattack.asm"
                include "code\gameflow\battle\battlescenes\animation\burstrock.asm"
                include "code\gameflow\battle\battlescenes\animation\oddeyebeam.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\updatespellanimation.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\blaze.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\freeze.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\desoul.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\healingfairy.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\blast.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\detox.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\bolt.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\buff.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\debuff.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\demonbreath.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\flamebreath.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\arrowsandspears.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\cannonfire.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\shotfire.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\gunnerblast.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\dao.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\apollo.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\neptun.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\atlas.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\prismlaser.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\bubblebreath.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\snowbreath.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\attack.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\phoenixattack.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\burstrock.asm"
                include "code\gameflow\battle\battlescenes\updateanimation\oddeyebeam.asm"
                include "code\gameflow\battle\battlescenes\battlesceneengine_3.asm"
                include "data\stats\allies\allybattlesprites.asm"    ; Ally battlesprites table
                include "data\stats\enemies\enemybattlesprites.asm"    ; Enemy battlesprites table
                include "data\stats\items\weapongraphics.asm"    ; Weapon graphics table
                include "data\battles\global\custombackgrounds.asm"    ; Battle custom backgrounds table
                align
                include "data\battles\global\backgroundenemyswitch.asm"    ; Background enemy switch table
                include "data\graphics\battles\battlesprites\allyidlebattlesprites.asm"    ; Ally Idle Battlesprites
                include "data\graphics\battles\battlesprites\enemyidlebattlesprites.asm"    ; Enemy Idle Battlesprites
                align
                include "data\graphics\tech\backgroundlayout.asm"    ; Battlescene Background Layout
                align $20000
