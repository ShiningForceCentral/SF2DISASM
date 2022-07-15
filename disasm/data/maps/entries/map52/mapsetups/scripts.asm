
; ASM FILE data\maps\entries\map52\mapsetups\scripts.asm :
; 0x5C4EE..0x5C638 : 
cs_5C4EE:       textCursor 1397
                cameraSpeed $30
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setDest ALLY_BOWIE,5,23
                setDest ALLY_PETER,4,22
                entityActionsWait ALLY_PETER
                 moveRight 1
                endActions
                nextSingleText $0,ALLY_PETER ; "Who are they?{W1}"
                setCamDest 16,4
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 5
                setActscript 130,eas_2xRightLeft
                nextSingleText $0,ALLY_PETER ; "They're looking for something.{W1}"
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 5
                setActscript 130,eas_2xRightLeft
                entityActionsWait 131
                 moveUp 6
                endActions
                csWait 40
                nextSingleText $0,131   ; "He's not here...not under{N}the cliff....{W1}"
                entityActionsWait 129
                 moveUp 2
                 moveRight 1
                endActions
                setFacing 128,LEFT
                nextText $0,129         ; "There are marks of a battle{N}here and there!{W2}"
                nextSingleText $0,129   ; "Against the birdmen of{N}Bedoe?{W1}"
                nod 128
                nextText $0,128         ; "Could be...{W2}"
                nextSingleText $0,128   ; "see those volcanic rocks?{W1}"
                csWait 5
                setActscript 129,eas_2xUpDown
                csWait 60
                nextText $0,128         ; "Nobody but Volcanon can do{N}that!{W2}"
                setFacing 129,RIGHT
                nextSingleText $0,128   ; "He has never before killed{N}birdmen, but...{W1}"
                entityActionsWait 131
                 moveDown 1
                endActions
                csWait 40
                customActscriptWait 131
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 131
                 moveDown 2
                 moveLeft 1
                endActions
                nextSingleText $0,131   ; "Who's that?{W1}"
                setFacing 131,DOWN
                setCamDest 0,17
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,DOWN
                csWait 50
                setCamDest 16,7
                setActscriptWait 131,eas_Init
                setActscriptWait 131,eas_DeactivateAutoFacing
                entityActionsWait 131
                 moveUp 1
                endActions
                nextSingleText $0,131   ; "Stupid Polca kids!{W1}"
                entityActionsWait 128
                 moveDown 2
                 moveLeft 2
                 moveDown 1
                endActions
                nextText $0,128         ; "Polcan people are cowards that{N}live in peace.{W2}"
                setFacing 128,UP
                setFacing 131,UP
                nextSingleText $0,128   ; "They shall never return{N}alive!{W1}"
                setStoryFlag 12         ; Battle 12 unlocked - BATTLE_MOUNT_VOLCANO             
                warp MAP_PATH_TO_MOUNT_VOLCANON,0,0,RIGHT
                csc_end
cs_5C622:       setPos ALLY_PETER,22,8,RIGHT
                textCursor 2493
                fadeInB
                nextText $0,ALLY_PETER  ; "{LEADER}, did you hear{N}that?  He said, he had{N}been waiting for you.{W2}"
                nextSingleText $0,ALLY_PETER ; "Why do the devils want you?{W1}"
                csc_end
