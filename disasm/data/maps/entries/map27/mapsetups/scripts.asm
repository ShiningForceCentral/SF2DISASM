
; ASM FILE data\maps\entries\map27\mapsetups\scripts.asm :
; 0x59FB8..0x5A09E : 
cs_59FB8:       textCursor 1733
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                cameraSpeed $30
                setCamDest 22,15
                setDest FOLLOWER_B,26,20
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 120
                nextSingleText $0,FOLLOWER_B ; "(Sniff, sniff)...{N}It smells like a ditch!{W1}"
                setDest ALLY_PETER,27,20
                setFacing FOLLOWER_B,RIGHT
                shiver ALLY_PETER
                nextSingleText $0,ALLY_PETER ; "Is this the smell of the{N}devils that they were{N}talking about?{W1}"
                setCamDest 36,17
                setDest 129,41,21
                nextSingleText $C0,129  ; "Hee, hee!{W1}"
                setActscript 128,eas_RotateRightHighSpeed
                setActscript 129,eas_RotateRightHighSpeed
                setActscript 130,eas_RotateRightHighSpeed
                csWait 40
                setActscriptWait 128,eas_Init
                setActscriptWait 129,eas_Init
                setActscriptWait 130,eas_Init
                setFacing 128,LEFT
                setFacing 129,LEFT
                setFacing 130,LEFT
                setActscript 128,eas_Jump
                setActscript 129,eas_Jump
                setActscriptWait 130,eas_Jump
                startEntity 128
                startEntity 129
                startEntity 130
                nextSingleText $0,ALLY_PETER ; "What huge rats!{W1}"
                nextText $C0,129        ; "Welcome!{W2}"
                nextSingleText $C0,129  ; "It's dinner time!{W1}"
                setActscript 128,eas_Jump
                setActscriptWait 130,eas_Jump
                setStoryFlag 23         ; Battle 23 unlocked - BATTLE_VERSUS_WILLARD            
                warp MAP_CREED_WILLARD_CAVE,0,0,RIGHT
                csc_end
