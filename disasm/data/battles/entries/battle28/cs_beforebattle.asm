
; ASM FILE data\battles\entries\battle28\cs_beforebattle.asm :
; 0x4BE8C..0x4C07C : Cutscene before battle 28
bbcs_28:        textCursor 2661
                loadMapFadeIn MAP_PANGOAT_VALLEY_BRIDGE,0,4
                loadMapEntities ce_4C03C
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,0,9,RIGHT
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,0,7,RIGHT
                stopEntity 129
                playSound MUSIC_BATTLE_THEME_3
                fadeInB
                cameraSpeed $30
                entityActions ALLY_BOWIE
                 moveRight 3
                endActions
                entityActions FOLLOWER_B
                 moveRight 3
                endActions
                entityActions ALLY_PETER
                 moveRight 3
                endActions
                entityActionsWait 128
                 moveRight 3
                endActions
                csWait 40
                setActscriptWait FOLLOWER_B,eas_Jump
                entityActionsWait FOLLOWER_B
                 moveRight 2
                 moveDown 1
                endActions
                setFacing FOLLOWER_B,RIGHT
                nextSingleText $0,FOLLOWER_B ; "Wow, look at that?{W1}"
                setCamDest 7,11
                shiver 130
                playSound SFX_MONSTER_SCREAM
                csWait 30
                shiver 131
                playSound SFX_MONSTER_SCREAM
                csWait 40
                setCamDest 0,6
                entityActionsWait ALLY_PETER
                 moveDown 1
                 moveRight 1
                endActions
                nextSingleText $0,ALLY_PETER ; "Those monsters are eating{N}the bridge.{W1}"
                nextSingleText $0,129   ; "Help!  Help me!{W1}"
                setActscript ALLY_BOWIE,eas_Jump
                setActscript FOLLOWER_B,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                 moveRight 1
                 moveDown 1
                endActions
                csWait 5
                setActscript ALLY_BOWIE,eas_2xRightLeft
                csWait 5
                setActscript ALLY_PETER,eas_2xUpDown
                csWait 100
                setActscriptWait FOLLOWER_B,eas_Jump
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions FOLLOWER_B
                 moveDown 2
                endActions
                csWait 10
                stopEntity ALLY_BOWIE
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setQuake 2
                playSound SFX_HIT_2
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                endActions
                setFacing ALLY_BOWIE,UP
                customActscriptWait ALLY_BOWIE
                 ac_motion OFF          ;   
                 ac_orientDown          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                waitIdle FOLLOWER_B
                setFacing FOLLOWER_B,RIGHT
                setQuake 0
                nextText $0,FOLLOWER_B  ; "Look!{W2}"
                nextSingleText $0,FOLLOWER_B ; "She's stranded on the{N}bridge.{W1}"
                setFacing ALLY_PETER,RIGHT
                shiver ALLY_BOWIE
                setCamDest 7,21
                nextSingleText $0,ALLY_PETER ; "Get away from the bridge{N}before it falls into the{N}river!{W1}"
                nextText $0,129         ; "I sprained my ankle!{N}Please help me!{W2}"
                nextSingleText $0,129   ; "I can't stand up!{W1}"
                setCamDest 0,6
                setFacing FOLLOWER_B,DOWN
                setActscriptWait FOLLOWER_B,eas_Jump
                csWait 30
                setActscriptWait ALLY_BOWIE,eas_Init
                startEntity ALLY_BOWIE
                headshake ALLY_BOWIE
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, defeat all the{N}monsters!  Hurry!{W1}"
                setActscript ALLY_PETER,eas_Jump
                nod ALLY_BOWIE
                csc_end
ce_4C03C:       mainEntity 1,8,RIGHT
                entity 0,9,RIGHT,ALLY_PETER,eas_Init
                entity 0,8,RIGHT,MAPSPRITE_CARAVAN,eas_Init
                entity 12,24,UP,MAPSPRITE_POSE3,eas_Init
                entity 13,13,LEFT,MAPSPRITE_WORM,eas_Init
                entity 12,17,UP,MAPSPRITE_WORM,eas_Init
                entity 11,22,DOWN,MAPSPRITE_WORM,eas_Init
                entity 11,25,RIGHT,MAPSPRITE_WORM,eas_Init
                dc.w $FFFF
