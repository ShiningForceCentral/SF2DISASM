
; ASM FILE data\maps\entries\map01\mapsetups\scripts.asm :
; 0x5E772..0x5E86C : 
cs_5E772:       textCursor 3649
                csWait 30
                setFacing ALLY_BOWIE,UP
                setDest ALLY_BOWIE,44,27
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                flashScreenWhite $1E
                csWait 30
                flashScreenWhite $1E
                setPos 136,63,62,DOWN
                setPos ALLY_TAYA,44,26,DOWN
                stopEntity ALLY_TAYA
                csWait 30
                flashScreenWhite $1E
                csWait 30
                setDest ALLY_PETER,43,27
                setDest FOLLOWER_B,45,27
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                nextSingleText $80,ALLY_TAYA ; "I feel...a power returning{N}me to human.{W2}"
                nextSingleText $80,ALLY_TAYA ; "Hey!  The evil is gone!{N}Did you chase them away?{W1}"
                startEntity ALLY_TAYA
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                setFacing ALLY_PETER,RIGHT
                nextSingleText $0,ALLY_PETER ; "{LEADER}, who is she?{W1}"
                setFacing ALLY_TAYA,LEFT
                nextSingleText $80,ALLY_TAYA ; "Did you say {LEADER}?{N}Oh, you're from Granseal!{W1}"
                nextSingleText $0,ALLY_PETER ; "Yes, we are, but who are{N}you?{W1}"
                shiver ALLY_TAYA
                nextSingleText $80,ALLY_TAYA ; "Do you know how long I've{N}been here as a stone statue?{W1}"
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                endActions
                entityActionsWait FOLLOWER_B
                 moveLeft 1
                endActions
                setFacing FOLLOWER_B,UP
                entityActionsWait ALLY_BOWIE
                 moveRight 1
                endActions
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                endActions
                setFacing ALLY_BOWIE,UP
                nextSingleText $0,FOLLOWER_B ; "How do you know {LEADER}?{W1}"
                setFacing ALLY_TAYA,DOWN
                nextSingleText $80,ALLY_TAYA ; "Oh, I'm sorry.{W2}"
                nextSingleText $80,ALLY_TAYA ; "I'm {NAME;21}, a sorceress.{N}Goddess Mitula told me about{N}you.{W1}"
                nextSingleText $0,FOLLOWER_B ; "She did?{W1}"
                nextSingleText $80,ALLY_TAYA ; "Yes.  She was worried about{N}you.{W2}"
                nextSingleText $80,ALLY_TAYA ; "You are fated to fight Zeon.{W2}"
                nextSingleText $80,ALLY_TAYA ; "But, she is unable to help{N}you.  It's an order from{N}Volcanon.{W2}"
                nextSingleText $80,ALLY_TAYA ; "But, I'm here for her.{N}I'm here to help you.{W1}"
                join ALLY_TAYA
                nextSingleText $80,ALLY_TAYA ; "You want to go to Grans,{N}right?  Then, I think we{N}can use the ancient ship.{W2}"
                nextSingleText $80,ALLY_TAYA ; "Let's go to Nazca.{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                addNewFollower ALLY_TAYA
                csc_end
