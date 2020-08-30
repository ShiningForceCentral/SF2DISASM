
; GAME SECTION 04 :
; 0x018000..0x020000 : BattleScene Engine
; FREE SPACE : 532 bytes.


                include "code\gameflow\battle\battlescenes\battlesceneengine_0.asm"    ; Battlescene engine
                include "data\battles\global\terrainbackgrounds.asm"    ; Terrain backgrounds table
                include "code\gameflow\battle\battlescenes\battlesceneengine_1.asm"    ; Battlescene engine
                include "data\stats\allies\allybattlesprites.asm"    ; Ally battle sprites table
                include "data\stats\enemies\enemybattlesprites.asm"    ; Enemy battle sprites table
                include "data\stats\items\weapongraphics.asm"    ; Weapon graphics table
                include "data\battles\global\custombackgrounds.asm"    ; Battle custom backgrounds table
                
                wordAlign
                include "data\battles\global\backgroundenemyswitch.asm"    ; Background enemy switch table
                include "data\graphics\battles\battlesprites\allyidlebattlesprites.asm"    ; Ally Idle Battle Sprites
                include "data\graphics\battles\battlesprites\enemyidlebattlesprites.asm"    ; Enemy Idle Battle Sprites
BackgroundLayout:
                incbin "data/graphics/tech/backgroundlayout.bin"
                align $20000
