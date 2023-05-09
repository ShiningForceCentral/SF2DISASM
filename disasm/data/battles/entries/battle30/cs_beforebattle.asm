
; ASM FILE data\battles\entries\battle30\cs_beforebattle.asm :
; 0x4C5E6..0x4C6A8 : Cutscene before battle 30
bbcs_30:        textCursor 2760
                loadMapFadeIn MAP_INSIDE_MITULA,7,21
                loadMapEntities ce_4C690
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,11,28,UP
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,11,27,UP
                playSound MUSIC_BATTLE_THEME_1
                fadeInB
                entityActions ALLY_BOWIE
                 moveUp 2
                endActions
                entityActions FOLLOWER_B
                 moveUp 2
                endActions
                entityActionsWait ALLY_PETER
                 moveUp 2
                endActions
                nextSingleText $0,128   ; "What a pleasure!{N}Nice to meet you.{W1}"
                setActscriptWait ALLY_PETER,eas_Jump
                entityActionsWait FOLLOWER_B
                 moveRight 1
                 moveUp 1
                endActions
                nod FOLLOWER_B
                nextSingleText $C0,FOLLOWER_B ; "Ohhh....{N}He's ugly, isn't he?{W1}"
                setCamDest 7,0
                entityActionsWait 128
                 moveLeft 2
                endActions
                setCameraEntity 128
                entityActionsWait 128
                 moveDown 2
                endActions
                nextText $0,128         ; "What?!{N}You dare insult me?!{W2}"
                nextSingleText $0,128   ; "I've never...{N}For that you will die!{W1}"
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $0,128   ; "Are you ready to die?{W1}"
                playSound SFX_INTRO_LIGHTNING
                flashScreenWhite $28
                csc_end
ce_4C690:       mainEntity 11,26,UP
                entity 11,28,UP,ALLY_PETER,eas_Init
                entity 13,4,DOWN,MAPSPRITE_ZALBARD,eas_Init
                dc.w $FFFF
