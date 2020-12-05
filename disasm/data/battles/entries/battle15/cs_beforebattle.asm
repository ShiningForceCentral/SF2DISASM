
; ASM FILE data\battles\entries\battle15\cs_beforebattle.asm :
; 0x4ADA6..0x4AE72 : Cutscene before battle 15
bbcs_15:        textCursor 2503
                loadMapFadeIn MAP_ACHILLES_SHRINES,9,15
                loadMapEntities ce_4AE42
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait FOLLOWER_A,eas_Init
                setPos FOLLOWER_A,14,19,UP
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,15,20,UP
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,13,20,UP
                fadeInB
                cameraSpeed $30
                nextSingleText $0,FOLLOWER_A ; "This is the Ancient Hall{N}that leads to the Ancient{N}Tunnel...{W1}"
                entityActionsWait FOLLOWER_A
                 moveUp 1
                endActions
                setCamDest 9,4
                csWait 30
                setActscript 128,eas_Jump
                setActscript 129,eas_Jump
                setActscript 130,eas_Jump
                setActscript 131,eas_Jump
                setActscriptWait 132,eas_Jump
                csWait 30
                setCamDest 9,15
                nextSingleText $0,FOLLOWER_A ; "There are more monsters here!{W2}"
                setFacing FOLLOWER_A,DOWN
                nextSingleText $0,FOLLOWER_A ; "{LEADER}, take 'em out!{W1}"
                csc_end
ce_4AE42:       mainEntity 14,20,UP
                entity 14,7,DOWN,MAPSPRITE_GOLEM,eas_Init
                entity 15,6,DOWN,MAPSPRITE_GARGOYLE,eas_Init
                entity 13,6,DOWN,MAPSPRITE_MASTER_MAGE,eas_Init
                entity 16,7,DOWN,MAPSPRITE_BLACK_MONK,eas_Init
                entity 12,7,DOWN,MAPSPRITE_ARROW_LAUNCHER,eas_Init
                dc.w $FFFF
