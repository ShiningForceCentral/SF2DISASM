
; ASM FILE data\battles\entries\battle35\cs_beforebattle.asm :
; 0x4D6CE..0x4D88A : Cutscene before battle 35
bbcs_35:        textCursor 2934
                loadMapFadeIn MAP_OVERWORLD_GRANS_RETURN_PATH,37,5
                loadMapEntities ce_4D832
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,44,10,LEFT
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,44,8,LEFT
                setActscriptWait FOLLOWER_A,eas_Init
                setPos FOLLOWER_A,44,9,LEFT
                jumpIfFlagClear 76,cs_4D728 ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,63,62,DOWN
cs_4D728:       fadeInB
                cameraSpeed $30
                nextSingleText $0,128   ; "You're still alive?{W1}"
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $C0,FOLLOWER_B ; "Geshp!{W1}"
                setCamDest 22,11
                setFacing 128,RIGHT
                nextSingleText $0,128   ; "Unbelievable!{N}You really are persistent.{W1}"
                nextText $C0,ALLY_PETER ; "We'll never stop!{W2}"
                nextSingleText $C0,ALLY_PETER ; "We will not die until we{N}destroy all of you.{W1}"
                nextText $C0,FOLLOWER_B ; "{LEADER}, kill him!{W2}"
                nextSingleText $C0,FOLLOWER_B ; "We have to kill him now!{W1}"
                csWait 40
                nextSingleText $0,128   ; "I'm very sorry, but I have{N}to go.{W1}"
                animEntityFX 128,6
                setCamDest 22,20
                setPos 128,28,24,DOWN
                animEntityFX 128,7
                csWait 40
                setFacing 129,DOWN
                setFacing 130,DOWN
                setFacing 131,LEFT
                setFacing 133,RIGHT
                setFacing 134,RIGHT
                setFacing 135,RIGHT
                setFacing 136,RIGHT
                csWait 20
                setFacing 128,LEFT
                csWait 30
                setFacing 128,UP
                csWait 30
                setFacing 128,RIGHT
                csWait 30
                setFacing 128,DOWN
                nextSingleText $0,128   ; "Don't let them advance!{W1}"
                setActscript 129,eas_Jump
                setActscript 130,eas_Jump
                setActscript 131,eas_Jump
                setActscript 132,eas_Jump
                setActscript 133,eas_Jump
                setActscript 134,eas_Jump
                setActscript 135,eas_Jump
                setActscript 136,eas_Jump
                animEntityFX 128,6
                csWait 50
                setCamDest 37,5
                entityActionsWait ALLY_PETER
                 moveDown 1
                 moveLeft 1
                endActions
                nextSingleText $0,ALLY_PETER ; "He escaped again!{W1}"
                entityActionsWait FOLLOWER_B
                 moveLeft 1
                endActions
                nextText $0,FOLLOWER_B  ; "Geshp sure is a tricky{N}devil.{W2}"
                nextSingleText $0,FOLLOWER_B ; "After him, now!{W1}"
                csc_end
ce_4D832:       mainEntity 43,9,LEFT
                entity 44,10,LEFT,ALLY_PETER,eas_Init
                entity 27,16,UP,MAPSPRITE_GESHP,eas_Init
                entity 26,21,UP,MAPSPRITE_MUD_MAN,eas_Init
                entity 29,21,UP,MAPSPRITE_MUD_MAN,eas_Init
                entity 31,24,UP,MAPSPRITE_MUD_MAN,eas_Init
                entity 28,28,UP,MAPSPRITE_MUD_MAN,eas_Init
                entity 24,24,UP,MAPSPRITE_DRAGONEWT,eas_Init
                entity 24,25,UP,MAPSPRITE_PURPLE_WORM,eas_Init
                entity 24,26,UP,MAPSPRITE_GRIFFIN,eas_Init
                entity 24,27,UP,MAPSPRITE_MIST_DEMON,eas_Init
                dc.w $FFFF
