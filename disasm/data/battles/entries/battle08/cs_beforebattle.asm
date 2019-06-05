
; ASM FILE data\battles\entries\battle08\cs_beforebattle.asm :
; 0x4A952..0x4AA74 : Cutscene before battle 8
bbcs_08:        textCursor $99D
                loadMapFadeIn 72,1,46
                loadMapEntities ce_4AA14
                setActscriptWait ALLY_BOWIE,eas_Init
                stopEntity 129
                customActscriptWait 129
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                jumpIfFlagSet $6,cs_4A994 ; Kiwi joined
                setPos ALLY_KIWI,63,63,DOWN
cs_4A994:       playSound MUSIC_MAIN_THEME
                fadeInB
                nextSingleText $0,128   ; "The game will be suspended.{N}OK?"
                entityActionsWait 128
                 moveRight 2
                endActions
                setFacing 128,UP
                entityActionsWait 128
                 moveUp 1
                endActions
                setCameraEntity 129
                nextSingleText $0,128   ; "....{W1}"
                playSound MUSIC_ENEMY_ATTACK
                setCamDest 7,32
                setPos 131,12,35,DOWN
                csWait 20
                setPos 132,11,35,DOWN
                csWait 20
                setPos 133,13,35,DOWN
                csWait 30
                setPos 130,12,37,DOWN
                nextSingleText $C0,130  ; "{LEADER}, are you ready{N}for battle?{D3}"
                nextSingleText $C0,130  ; "Do you need more preparations?"
                nextText $C0,130        ; "Did you change your mind?{W2}"
                nextSingleText $C0,130  ; "Be careful.{D1}{N}Haste makes waste.{D1}"
                setFacing 130,UP
                nextSingleText $C0,130  ; "{LEADER}, you had better{N}take a rest now.{D3}"
                setActscript 131,eas_Jump
                setActscript 132,eas_Jump
                setActscriptWait 133,eas_Jump
                csc_end
ce_4AA14:       mainEntity 4,50,RIGHT
                entity 5,50,RIGHT,MAPSPRITE_WORKER,eas_Init
                entity 4,49,RIGHT,ALLY_SARAH,eas_Init
                entity 4,51,RIGHT,ALLY_JAHA,eas_Init
                entity 3,50,RIGHT,ALLY_KAZIN,eas_Init
                entity 2,50,RIGHT,ALLY_CHESTER,eas_Init
                entity 1,50,RIGHT,ALLY_KIWI,eas_Init
                entity 14,34,DOWN,MAPSPRITE_WORKER,eas_Init
                entity 63,63,DOWN,MAPSPRITE_WITCH,eas_Init
                entity 63,63,DOWN,MAPSPRITE_GOBLIN,eas_Init
                entity 63,63,DOWN,MAPSPRITE_GREEN_OOZE,eas_Init
                entity 63,63,DOWN,MAPSPRITE_HUNTER_GOBLIN,eas_Init
                dc.w $FFFF
