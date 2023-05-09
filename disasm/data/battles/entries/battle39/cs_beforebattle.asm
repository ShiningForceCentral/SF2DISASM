
; ASM FILE data\battles\entries\battle39\cs_beforebattle.asm :
; 0x4E3D2..0x4E4DC : Cutscene before battle 39
bbcs_39:        textCursor 3029
                loadMapFadeIn MAP_OVERWORLD_GRANS_GRANSEAL,3,5
                loadMapEntities ce_4E4AC
                setActscriptWait ALLY_BOWIE,eas_Init
                setPos ALLY_PETER,9,8,DOWN
                setPos FOLLOWER_B,7,8,DOWN
                setPos FOLLOWER_A,8,8,DOWN
                jumpIfFlagClear 76,cs_4E40C ; Zynk is a follower
                setPos ALLY_ZYNK,8,7,DOWN
cs_4E40C:       jumpIfFlagClear 71,cs_4E41A ; Lemon is a follower
                setPos ALLY_LEMON,63,62,DOWN
cs_4E41A:       fadeInB
                cameraSpeed $30
                setCamDest 3,18
                nextText $0,128         ; "I just heard that Geshp{N}lost.{W2}"
                nextSingleText $0,128   ; "All greater devils have been{N}defeated except for Odd Eye.{W1}"
                entityActionsWait 128
                 moveDown 1
                endActions
                nextText $0,128         ; "This is a good chance for us{N}to become greater devils!{W2}"
                nextSingleText $0,128   ; "I'm sure Zeon will promote{N}us if we can get the jewel.{W1}"
                setActscript 129,eas_Jump
                setActscript 130,eas_Jump
                setActscript 131,eas_Jump
                setActscriptWait 132,eas_Jump
                csWait 50
                entityActionsWait 131
                 moveUp 1
                endActions
                nextSingleText $0,131   ; "Look over there!{W1}"
                entityActionsWait 132
                 moveUp 1
                endActions
                setFacing 128,UP
                setCamDest 3,5
                csWait 60
                setCamDest 3,18
                nextSingleText $0,131   ; "They're coming!{W1}"
                customActscriptWait 128
                 ac_setSpeed 24,24      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveDown 3
                endActions
                setFacing 128,UP
                nextSingleText $0,128   ; "Excellent!{N}Welcome to your graveyard!{W1}"
                csc_end
ce_4E4AC:       mainEntity 8,9,DOWN
                entity 8,20,DOWN,MAPSPRITE_HYDRA,eas_Init
                entity 7,23,UP,MAPSPRITE_CHAOS_WIZARD,eas_Init
                entity 9,23,UP,MAPSPRITE_EVIL_BISHOP,eas_Init
                entity 6,23,UP,MAPSPRITE_DARK_GUNNER,eas_Init
                entity 10,23,UP,MAPSPRITE_CYCLOPS,eas_Init
                dc.w $FFFF
