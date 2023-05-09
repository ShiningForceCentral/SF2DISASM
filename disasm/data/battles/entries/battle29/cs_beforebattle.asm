
; ASM FILE data\battles\entries\battle29\cs_beforebattle.asm :
; 0x4C3DC..0x4C5E6 : Cutscene before battle 29
bbcs_29:        textCursor 2718
                loadMapFadeIn MAP_OUTSIDE_MITULA,10,28
                loadMapEntities ce_4C5AE
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,16,34,UP
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,14,34,UP
                playSound MUSIC_MITULA_SHRINE
                fadeInB
                cameraSpeed $30
                entityActions ALLY_BOWIE
                 moveUp 1
                endActions
                entityActions ALLY_PETER
                 moveUp 1
                endActions
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                nextSingleText $0,128   ; "You can't enter Mitula{N}Shrine now.{W1}"
                setFacing ALLY_PETER,LEFT
                nextSingleText $0,ALLY_PETER ; "Sir Astral, what do we do{N}now?{W1}"
                nextSingleText $0,FOLLOWER_B ; "Hmmm....{W1}"
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                setFacing FOLLOWER_B,RIGHT
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, what do you{N}think?{W1}"
                setFacing ALLY_BOWIE,LEFT
                nextSingleText $0,ALLY_BOWIE ; "I'm not sure.{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                setFacing ALLY_PETER,LEFT
                nextSingleText $0,ALLY_PETER ; "{LEADER}, it's obvious!{W1}"
                setFacing ALLY_BOWIE,RIGHT
                nod FOLLOWER_B
                nextText $0,FOLLOWER_B  ; "I agree.  We have to see the{N}storytellers and listen to{N}the legends.{W2}"
                nextSingleText $0,FOLLOWER_B ; "Make a break for it!{W1}"
                setCamDest 10,26
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_PETER
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions FOLLOWER_B
                 moveUp 3
                endActions
                entityActions ALLY_BOWIE
                 moveLeft 1
                 moveUp 2
                endActions
                entityActions ALLY_PETER
                 moveLeft 2
                 moveUp 1
                endActions
                csWait 10
                customActscriptWait 128
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 128
                 moveUp 2
                 moveLeft 1
                endActions
                waitIdle 128
                setFacing 128,DOWN
                waitIdle ALLY_PETER
                nextText $0,128         ; "Wait, wait.  You must not{N}enter the holy shrine.{W2}"
                nextSingleText $0,128   ; "So be it!  Let the truth be{N}known!{W1}"
                playSound $FD
                animEntityFX 128,6
                setCamDest 12,19
                setPos 128,16,23,DOWN
                animEntityFX 128,7
                csWait 40
                animEntityFX 128,6
                setCamDest 8,15
                setPos 128,12,18,DOWN
                animEntityFX 128,7
                csWait 40
                animEntityFX 128,6
                setCamDest 9,9
                setPos 128,14,13,DOWN
                animEntityFX 128,7
                csWait 40
                entityFlashWhite 128,$1E
                playSound MUSIC_BATTLE_THEME_1
                stopEntity 128
                setSprite 128,MAPSPRITE_EFFECT2
                setFacing 128,UP
                csWait 8
                setFacing 128,LEFT
                csWait 8
                setFacing 128,DOWN
                csWait 8
                setSprite 128,MAPSPRITE_DARK_KNIGHT
                startEntity 128
                setPos 129,14,12,DOWN
                csWait 30
                setPos 130,15,13,DOWN
                csWait 30
                setPos 131,15,14,DOWN
                csWait 30
                setPos 132,11,14,DOWN
                csWait 30
                nextSingleText $0,128   ; "Go away!  The devils already{N}occupy this shrine!{W1}"
                nextText $0,FOLLOWER_B  ; "Devils again!{W2}"
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, attack!{W1}"
                csc_end
ce_4C5AE:       mainEntity 15,33,UP
                entity 16,34,UP,ALLY_PETER,eas_Init
                entity 15,30,DOWN,MAPSPRITE_PRIEST,eas_Init
                entity 63,63,DOWN,MAPSPRITE_DEATH_MONK,eas_Init
                entity 63,63,DOWN,MAPSPRITE_ORC_LORD,eas_Init
                entity 63,63,DOWN,MAPSPRITE_WIZARD,eas_Init
                entity 63,63,DOWN,MAPSPRITE_WORM,eas_Init
                dc.w $FFFF
