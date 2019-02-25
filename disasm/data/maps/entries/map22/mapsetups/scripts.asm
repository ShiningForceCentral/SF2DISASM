
; ASM FILE data\maps\entries\map22\mapsetups\scripts.asm :
; 0x5994E..0x59AC0 : 
cs_5994E:       textCursor $700
                csWait 50
                setCamDest 10,0
                nextText $0,$86         ; "Are you ready?{W2}"
                nextSingleText $0,$86   ; "Now, start the battle!{N}Do your best!{W1}"
                setStoryFlag $16        ; Battle 22 unlocked
                warp $16,$0,$0,$0
                csc_end
cs_5996E:       textCursor $702
                setCameraEntity $FFFF
                reloadMap 10,0
                setPos $0,25,12,UP
                setPos $7,24,13,UP
                setPos $1F,25,13,UP
                fadeInB
                nextSingleText $0,$86   ; "Checkmate!{N}This is for you.{W1}"
                setCamDest 20,7
                nextText $0,$86         ; "A Cotton Balloon is inside.{W2}"
                nextSingleText $0,$86   ; "With it you can leave{N}Desktop Kingdom safely.{N}Good luck!{W1}"
                csc_end
cs_599A4:       entityActionsWait $88
                 moveUp 1
                endActions
                setFacing $88,DOWN
                csc_end
cs_599B2:       setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                setDest $0,35,24
                setDest $7,34,24
                setDest $1F,33,24
                entityActions $0
                 jumpRight 1
                 faceDown 1
                 moveDown 2
                endActions
                entityActions $7
                 moveRight 1
                 jumpRight 1
                 moveDownRight 1
                 faceDown 1
                endActions
                entityActionsWait $1F
                 moveRight 1
                 jumpRight 1
                 faceDown 1
                 moveDown 1
                endActions
                setPos $89,36,25,UP
                setPos $8A,37,24,UP
                setPos $8B,35,24,UP
                stopEntity $0
                stopEntity $7
                stopEntity $1F
                customActscriptWait $0
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $7
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $1F
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $89
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $8A
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $8B
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $0
                 moveDown 6
                endActions
                entityActions $7
                 moveDown 6
                endActions
                entityActions $1F
                 moveDown 6
                endActions
                entityActions $89
                 moveDown 6
                endActions
                entityActions $8A
                 moveDown 6
                endActions
                entityActionsWait $8B
                 moveDown 6
                endActions
                warp $1A,$1A,$8,$3
                csc_end
