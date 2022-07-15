
; ASM FILE data\battles\entries\battle37\cs_afterbattle.asm :
; 0x4DB94..0x4DDA4 : Cutscene after battle 37
abcs_battle37:  textCursor 2972
                loadMapFadeIn MAP_OVERWORLD_GRANS_AROUND_DWARF_VILLAGE,31,54
                loadMapEntities ce_4DD8C
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,33,59,RIGHT
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,34,57,DOWN
                setActscriptWait FOLLOWER_A,eas_Init
                setPos FOLLOWER_A,37,59,LEFT
                jumpIfFlagClear 76,cs_4DBEE ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,63,62,DOWN
cs_4DBEE:       stopEntity ALLY_LEMON
                customActscriptWait ALLY_LEMON
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPriority FOLLOWER_B,$0
                setPriority ALLY_LEMON,$FFFF
                fadeInB
                entityActionsWait ALLY_PETER
                 moveRight 1
                endActions
                csWait 50
                setFacing ALLY_PETER,UP
                nextSingleText $0,ALLY_PETER ; "Sir Astral, he's...crying!{W1}"
                nextSingleText $0,FOLLOWER_B ; "Why would he be crying?{W1}"
                entityActionsWait FOLLOWER_B
                 moveRight 1
                 moveDown 1
                endActions
                csWait 30
                setFacing ALLY_PETER,RIGHT
                nextSingleText $0,FOLLOWER_B ; "I think I've seen his style{N}of fighting before.{N}Let's see his face.{W1}"
                nextSingleText $FF,255  ; "Astral removes the mask.{W1}"
                nextSingleText $C0,ALLY_LEMON ; "Huh?{W1}"
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,FOLLOWER_B ; "It's {NAME;28}!{W1}"
                entityActionsWait ALLY_BOWIE
                 moveDown 2
                endActions
                setFacing ALLY_BOWIE,LEFT
                shiver ALLY_PETER
                nextSingleText $0,ALLY_PETER ; "Let me see him.{W1}"
                shiver ALLY_LEMON
                stopEntity ALLY_LEMON
                entityFlashWhite ALLY_LEMON,$39
                setActscript ALLY_PETER,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,ALLY_PETER ; "Wow, he's alive!{W1}"
                nextSingleText $0,FOLLOWER_B ; "{NAME;28}!  {NAME;28}!{W1}"
                nextSingleText $C0,ALLY_LEMON ; "Where?!{W1}"
                setActscriptWait ALLY_LEMON,eas_Init
                startEntity ALLY_LEMON
                setFacing ALLY_LEMON,DOWN
                nextSingleText $C0,ALLY_LEMON ; "What?!{W1}"
                csWait 5
                setActscript ALLY_LEMON,eas_2xRightLeft
                csWait 120
                setFacing ALLY_LEMON,UP
                nextText $C0,ALLY_LEMON ; "Oh, Sir Astral!  I had an{N}awful nightmare.{W2}"
                nextSingleText $C0,ALLY_LEMON ; "I was controlled by someone{N}and I killed a lot of...{W1}"
                nextSingleText $0,FOLLOWER_B ; "It wasn't a dream.{W1}"
                setActscriptWait ALLY_LEMON,eas_Jump
                nextSingleText $C0,ALLY_LEMON ; "What?!{W1}"
                nextText $0,FOLLOWER_B  ; "You were being controlled{N}by a devil.{W2}"
                nextText $0,FOLLOWER_B  ; "And he made you kill every{N}person you saw.{W2}"
                nextSingleText $0,FOLLOWER_B ; "You recovered your senses{N}when we defeated the devils.{W1}"
                setFacing ALLY_LEMON,DOWN
                nextSingleText $C0,ALLY_LEMON ; "I can't believe it!{N}I'm {NAME;28}, I'm...{W1}"
                entityActionsWait ALLY_LEMON
                 moveDown 2
                endActions
                shiver ALLY_LEMON
                setFacing ALLY_PETER,DOWN
                setFacing ALLY_BOWIE,DOWN
                nextSingleText $C0,ALLY_LEMON ; "What can I do?{N}How can I atone for my sins?{W1}"
                setFacing ALLY_LEMON,DOWN
                nextSingleText $C0,ALLY_LEMON ; "Sir Astral, tell me.{W1}"
                entityActionsWait FOLLOWER_B
                 moveDown 1
                endActions
                nextText $0,FOLLOWER_B  ; "You're not at fault.{W1}"
                nextSingleText $0,FOLLOWER_B ; "It's not your fault.{N}The devils are to blame.{W1}"
                nextSingleText $C0,ALLY_LEMON ; "But...{W1}"
                shiver ALLY_LEMON
                csWait 50
                shiver ALLY_LEMON
                setFacing ALLY_LEMON,UP
                nextSingleText $C0,ALLY_LEMON ; "I have to die for my sins.{N}It will be my atonement.{W2}"
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait ALLY_BOWIE,eas_Jump
                nextSingleText $C0,ALLY_LEMON ; "I have to die!{W1}"
                setFacing ALLY_LEMON,DOWN
                csWait 30
                entityActionsWait ALLY_LEMON
                 moveDown 3
                endActions
                nextSingleText $0,FOLLOWER_B ; "Oh, poor {NAME;28}.{W1}"
                setFacing ALLY_PETER,RIGHT
                nextText $0,ALLY_PETER  ; "Sir Astral, {NAME;28} has{N}fled. {W2}"
                nextSingleText $0,ALLY_PETER ; "Will you let him die?{W1}"
                nextSingleText $0,FOLLOWER_B ; "{NAME;28} is an immortal{N}vampire now.  He can't die{N}very easily.{W1}"
                setFacing FOLLOWER_B,RIGHT
                setFacing ALLY_BOWIE,LEFT
                nextSingleText $0,FOLLOWER_B ; "I think we'll meet him again.{N}{LEADER}, let's go.{W1}"
                csc_end
ce_4DD8C:       mainEntity 36,57,DOWN
                entity 33,59,RIGHT,ALLY_PETER,eas_Init
                entity 35,59,DOWN,ALLY_LEMON,eas_Init
                dc.w $FFFF
