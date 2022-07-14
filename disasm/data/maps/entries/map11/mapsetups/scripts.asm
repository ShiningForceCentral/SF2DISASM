
; ASM FILE data\maps\entries\map11\mapsetups\scripts.asm :
; 0x57AAA..0x57CCC : 
cs_57AAA:       textCursor 3151
                setActscriptWait ALLY_PETER,eas_Init
                setDest ALLY_BOWIE,39,11
                entityActionsWait ALLY_BOWIE
                 moveLeft 1
                endActions
                setCameraEntity ALLY_PETER
                setDest ALLY_PETER,39,11
                setFacing ALLY_PETER,UP
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                entityActionsWait ALLY_BOWIE
                 moveRight 1
                endActions
                setFacing ALLY_BOWIE,UP
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "God Volcanon!{N}I'm back!{W1}"
                setCamDest 34,3
                csWait 120
                nextSingleText $0,128   ; "Welcome back, {NAME;7}.{N}You look well.{W1}"
                nextSingleText $0,ALLY_PETER ; "Yes, I am!  This trip{N}was very interesting.{W1}"
                nextSingleText $0,128   ; "That's good.{W2}"
                nextSingleText $0,128   ; "What made it interesting?{W1}"
                nod ALLY_PETER
                csWait 30
                nextSingleText $0,ALLY_PETER ; "I met a lot people that live{N}on the ground.{W2}"
                nextSingleText $0,ALLY_PETER ; "They help each other.{N}I made some friends.{W1}"
                nextSingleText $0,128   ; "Wonderful.  It must've been{N}a good experience for you.{W1}"
                nod ALLY_PETER
                setCamDest 34,5
                csWait 30
                nextSingleText $0,ALLY_PETER ; "I've brought a friend.{W1}"
                setFacing ALLY_PETER,DOWN
                entityActionsWait ALLY_BOWIE
                 moveRight 1
                endActions
                setFacing ALLY_BOWIE,UP
                entityActionsWait ALLY_PETER
                 moveDown 2
                endActions
                setFacing ALLY_PETER,RIGHT
                entityActionsWait ALLY_PETER
                 moveLeft 1
                endActions
                setFacing ALLY_PETER,UP
                entityActionsWait ALLY_BOWIE
                 moveLeft 1
                endActions
                setFacing ALLY_BOWIE,UP
                nextSingleText $0,ALLY_PETER ; "This is {LEADER}.{N}He's from Granseal.{W1}"
                setCamDest 34,2
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 2
                csWait 90
                setQuake 0
                nextSingleText $0,128   ; "Granseal!{W1}"
                nextSingleText $0,128   ; "People of Grans Island{N}caused a serious, deadly{N}problem for the world!{W1}"
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 3
                csWait 90
                setQuake 0
                setCamDest 34,6
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 120
                setFacing ALLY_PETER,UP
                nextSingleText $0,ALLY_PETER ; "Volcanon?{W1}"
                setCamDest 34,2
                nextSingleText $0,128   ; "They awakened Zeon, the{N}legendary devil!{W2}"
                nextSingleText $0,128   ; "I've been protecting all the{N}ground-dwelling people.{W2}"
                nextSingleText $0,128   ; "I can't forgive them for{N}this!{W1}"
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 4
                csWait 90
                setQuake 0
                setCamDest 34,5
                entityActionsWait ALLY_BOWIE
                 moveRight 1
                endActions
                entityActionsWait ALLY_PETER
                 moveRight 1
                endActions
                setFacing ALLY_BOWIE,UP
                entityActionsWait ALLY_PETER
                 moveUp 3
                endActions
                nextSingleText $0,ALLY_PETER ; "Volcanon, please calm down!{W2}"
                nextSingleText $0,ALLY_PETER ; "{LEADER} is not the person{N}who did it!{W1}"
                setCamDest 34,3
                nextSingleText $0,128   ; "Everybody who lives on the{N}ground is responsibile.{W2}"
                nextSingleText $0,128   ; "They have to solve this by{N}themselves.{W1}"
                nextSingleText $0,ALLY_PETER ; "What should {LEADER} do?{W1}"
                nextSingleText $0,128   ; "My protection ceases now!{W2}"
                nextSingleText $0,128   ; "He must face the devils on{N}his own.{W1}"
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 4
                csWait 90
                setQuake 0
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                setActscriptWait ALLY_PETER,eas_Init
                nextSingleText $0,ALLY_PETER ; "But...{W2}"
                nextSingleText $0,ALLY_PETER ; "Even the greater devils{N}are as strong as you!{W1}"
                nextSingleText $0,128   ; "If all the humans are{N}annihilated, that's OK.{N}It's their destiny.{W2}"
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 4
                csWait 90
                setQuake 0
                nextSingleText $0,128   ; "I want them to show me{N}courage.{W2}"
                nextSingleText $0,128   ; "They must reseal the devil{N}again.{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "Then, please give some{N}advice to {LEADER}.{W1}"
                nextSingleText $0,128   ; "{LEADER}, believe in the{N}power of the jewel.{W2}"
                entityActionsWait ALLY_BOWIE
                 moveLeft 1
                endActions
                entityActionsWait ALLY_BOWIE
                 moveUp 2
                endActions
                nextSingleText $0,128   ; "It belongs to both the{N}light and the darkness.{W2}"
                nextSingleText $0,128   ; "It shows its true power{N}when the light and the{N}darkness are as one.{W2}"
                nextSingleText $0,128   ; "You may go now.  I don't{N}want to see anybody until{N}Zeon is defeated.{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "Volcanon!{W1}"
                csWait 30
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                csWait 30
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                nextSingleText $0,ALLY_PETER ; "{LEADER}, we'll defeat{N}that devil by ourselves!{W1}"
                nextSingleText $0,ALLY_PETER ; "I didn't know he was such a{N}cold-hearted god.{W2}"
                nextSingleText $0,ALLY_PETER ; "OK, I'll help you!  I'll{N}go with you to reseal the{N}devil!{W1}"
                join ALLY_PETER
                joinForceAI ALLY_PETER,$0 ; 0054 JOIN FORCE WITH AI
                followEntity ALLY_PETER,ALLY_BOWIE,2
                csc_end
