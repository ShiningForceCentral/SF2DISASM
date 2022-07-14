
; ASM FILE data\maps\entries\map22\mapsetups\scripts.asm :
; 0x5994E..0x59AC0 : 
cs_5994E:       textCursor 1792
                csWait 50
                setCamDest 10,0
                nextText $0,134         ; "Are you ready?{W2}"
                nextSingleText $0,134   ; "Now, start the battle!{N}Do your best!{W1}"
                setStoryFlag 22         ; Battle 22 unlocked - BATTLE_CHESSBOARD                
                warp MAP_CREED_DESKTOP_WORLD,0,0,RIGHT
                csc_end
cs_5996E:       textCursor 1794
                setCameraEntity 65535
                reloadMap 10,0
                setPos ALLY_BOWIE,25,12,UP
                setPos ALLY_PETER,24,13,UP
                setPos FOLLOWER_B,25,13,UP
                fadeInB
                nextSingleText $0,134   ; "Checkmate!{N}This is for you.{W1}"
                setCamDest 20,7
                nextText $0,134         ; "A Cotton Balloon is inside.{W2}"
                nextSingleText $0,134   ; "With it you can leave{N}Desktop Kingdom safely.{N}Good luck!{W1}"
                csc_end
cs_599A4:       entityActionsWait 136
                 moveUp 1
                endActions
                setFacing 136,DOWN
                csc_end
cs_599B2:       setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setDest ALLY_BOWIE,35,24
                setDest ALLY_PETER,34,24
                setDest FOLLOWER_B,33,24
                entityActions ALLY_BOWIE
                 jumpRight 1
                 faceDown 1
                 moveDown 2
                endActions
                entityActions ALLY_PETER
                 moveRight 1
                 jumpRight 1
                 moveDownRight 1
                 faceDown 1
                endActions
                entityActionsWait FOLLOWER_B
                 moveRight 1
                 jumpRight 1
                 faceDown 1
                 moveDown 1
                endActions
                setPos 137,36,25,UP
                setPos 138,37,24,UP
                setPos 139,35,24,UP
                stopEntity ALLY_BOWIE
                stopEntity ALLY_PETER
                stopEntity FOLLOWER_B
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_PETER
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 137
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 138
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 139
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_BOWIE
                 moveDown 6
                endActions
                entityActions ALLY_PETER
                 moveDown 6
                endActions
                entityActions FOLLOWER_B
                 moveDown 6
                endActions
                entityActions 137
                 moveDown 6
                endActions
                entityActions 138
                 moveDown 6
                endActions
                entityActionsWait 139
                 moveDown 6
                endActions
                warp MAP_CREED_FLOOR_WORLD,26,8,DOWN
                csc_end
