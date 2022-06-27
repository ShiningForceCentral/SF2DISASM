
; ASM FILE data\maps\entries\map38\mapsetups\scripts.asm :
; 0x5DE2E..0x5DF84 : 
cs_5DE2E:       textCursor 2154
                stopEntity 142
                playSound $FD
                setCamDest 8,0
                shiver 137
                playSound MUSIC_SAD_THEME_3
                nextSingleText $0,137   ; "Sir Petro, don't leave me{N}alone!{W1}"
                nextSingleText $0,142   ; "Paseran...I'm sorry.{W1}"
                shiver 137
                nextSingleText $0,137   ; "You promised to fly me in{N}the sky!{W1}"
                nextText $0,142         ; "I know...with the Nazca{N}Ship...I promised...{W2}"
                nextText $0,142         ; "I'd fly home...to see my{N}family....{W2}"
                nextSingleText $0,142   ; "To show them how wonderful{N}the ancients were....{W1}"
                shiver 137
                playSound $FD
                nextSingleText $0,137   ; "Petro!  No!{W1}"
                playSound $FB
                csc_end
cs_5DE76:       textCursor 2169
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setCameraEntity ALLY_ZYNK
                setDest ALLY_BOWIE,12,9
                setDest ALLY_PETER,12,8
                setDest ALLY_PETER,13,8
                setDest FOLLOWER_B,12,8
                setDest FOLLOWER_B,14,8
                setActscriptWait ALLY_ZYNK,eas_Init
                setDest ALLY_ZYNK,11,8
                setFacing ALLY_BOWIE,LEFT
                setFacing ALLY_PETER,LEFT
                setFacing FOLLOWER_B,LEFT
                entityActionsWait ALLY_ZYNK
                 moveLeft 2
                endActions
                entityActionsWait ALLY_PETER
                 moveLeft 2
                endActions
                entityActionsWait FOLLOWER_B
                 moveLeft 1
                endActions
                entityActionsWait ALLY_ZYNK
                 moveDown 1
                endActions
                entityActionsWait ALLY_ZYNK
                 moveRight 1
                endActions
                entityActionsWait ALLY_ZYNK
                 moveUp 1
                endActions
                entityActionsWait ALLY_ZYNK
                 moveLeft 2
                endActions
                setActscriptWait ALLY_ZYNK,eas_Jump
                setActscript ALLY_ZYNK,eas_Jump
                nextSingleText $0,ALLY_PETER ; "What's wrong with {NAME;26}?{W1}"
                nextSingleText $0,FOLLOWER_B ; "I have no idea, but he's{N}obviously disturbed!{W1}"
                entityActionsWait ALLY_ZYNK
                 moveUp 1
                endActions
                entityActionsWait ALLY_ZYNK
                 moveRight 1
                endActions
                entityActionsWait ALLY_ZYNK
                 moveDown 1
                endActions
                entityActionsWait ALLY_ZYNK
                 moveLeft 2
                endActions
                csWait 30
                nod ALLY_ZYNK
                setFacing ALLY_ZYNK,RIGHT
                nextSingleText $0,ALLY_ZYNK ; "{LEADER}, Sir Astral!{N}I am angry!{W2}"
                nextSingleText $0,ALLY_ZYNK ; "I cannot forgive the{N}devils!{W2}"
                nextSingleText $0,ALLY_ZYNK ; "I have overridden my{N}restrictions on fighting.{W2}"
                nextSingleText $0,ALLY_ZYNK ; "I am joining your force as{N}a soldier!{W1}"
                join ALLY_ZYNK
                clearF 76               ; Zynk is a follower
                nextSingleText $0,ALLY_ZYNK ; "Let us go defeat the Devil{N}Army!{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                followEntity ALLY_ZYNK,FOLLOWER_B,2
                csc_end
