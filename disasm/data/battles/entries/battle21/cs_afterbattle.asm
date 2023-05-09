
; ASM FILE data\battles\entries\battle21\cs_afterbattle.asm :
; 0x4B88C..0x4B958 : Cutscene after battle 21
abcs_battle21:  textCursor 2583
                loadMapFadeIn MAP_OVERWORLD_DEVILS_TAIL,4,18
                loadMapEntities ce_4B948
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,11,23,LEFT
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,11,21,LEFT
                setPos FOLLOWER_A,11,22,LEFT
                fadeInB
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 28,28      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 120
                entityActionsWait FOLLOWER_B
                 moveLeft 3
                 moveDown 1
                 moveLeft 1
                endActions
                csWait 40
                setFacing FOLLOWER_B,RIGHT
                nextSingleText $0,FOLLOWER_B ; "Hurry!  Let's go into{N}Creed's mansion.{W1}"
                nextSingleText $C0,ALLY_PETER ; "Oddler, can you see?{W1}"
                nextSingleText $0,FOLLOWER_B ; "No, why?{W1}"
                nextSingleText $C0,ALLY_PETER ; "You're moving around as{N}if you can see.{W1}"
                nextSingleText $0,FOLLOWER_B ; "Am I?  Maybe my other{N}senses have sharpened{N}since I lost my sight.{W1}"
                nextSingleText $C0,ALLY_PETER ; "Oh, I see.{W1}"
                entityActionsWait ALLY_PETER
                 moveLeft 1
                endActions
                setFacing ALLY_PETER,UP
                nextSingleText $C0,ALLY_PETER ; "{LEADER}, let's go see{N}Mr. Creed!{W1}"
                setFacing ALLY_BOWIE,DOWN
                nod ALLY_BOWIE
                followEntity FOLLOWER_A,ALLY_BOWIE,2
                followEntity ALLY_PETER,FOLLOWER_A,1
                followEntity FOLLOWER_B,FOLLOWER_A,3
                warp MAP_OVERWORLD_DEVILS_TAIL,26,23,DOWN
                csc_end
ce_4B948:       mainEntity 10,22,LEFT
                entity 11,23,LEFT,ALLY_PETER,eas_Init
                dc.w $FFFF
