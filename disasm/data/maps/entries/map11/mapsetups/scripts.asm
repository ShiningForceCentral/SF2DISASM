
; ASM FILE data\maps\entries\map11\mapsetups\scripts.asm :
; 0x57AAA..0x57CCC : 
cs_57AAA:       textCursor $C4F
                setActscriptWait $7,eas_Init
                setDest $0,39,11
                entityActionsWait $0
                 moveLeft 1
                endActions
                setCameraEntity $7
                setDest $7,39,11
                setFacing $7,UP
                entityActionsWait $7
                 moveUp 1
                endActions
                entityActionsWait $0
                 moveRight 1
                endActions
                setFacing $0,UP
                entityActionsWait $7
                 moveUp 1
                endActions
                nextSingleText $0,$7    ; "God Volcanon!{N}I'm back!{W1}"
                setCamDest 34,3
                csWait 120
                nextSingleText $0,$80   ; "Welcome back, {NAME;7}.{N}You look well.{W1}"
                nextSingleText $0,$7    ; "Yes, I am!  This trip{N}was very interesting.{W1}"
                nextSingleText $0,$80   ; "That's good.{W2}"
                nextSingleText $0,$80   ; "What made it interesting?{W1}"
                nod $7
                csWait 30
                nextSingleText $0,$7    ; "I met a lot people that live{N}on the ground.{W2}"
                nextSingleText $0,$7    ; "They help each other.{N}I made some friends.{W1}"
                nextSingleText $0,$80   ; "Wonderful.  It must've been{N}a good experience for you.{W1}"
                nod $7
                setCamDest 34,5
                csWait 30
                nextSingleText $0,$7    ; "I've brought a friend.{W1}"
                setFacing $7,DOWN
                entityActionsWait $0
                 moveRight 1
                endActions
                setFacing $0,UP
                entityActionsWait $7
                 moveDown 2
                endActions
                setFacing $7,RIGHT
                entityActionsWait $7
                 moveLeft 1
                endActions
                setFacing $7,UP
                entityActionsWait $0
                 moveLeft 1
                endActions
                setFacing $0,UP
                nextSingleText $0,$7    ; "This is {LEADER}.{N}He's from Granseal.{W1}"
                setCamDest 34,2
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 2
                csWait 90
                setQuake 0
                nextSingleText $0,$80   ; "Granseal!{W1}"
                nextSingleText $0,$80   ; "People of Grans Island{N}caused a serious, deadly{N}problem for the world!{W1}"
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 3
                csWait 90
                setQuake 0
                setCamDest 34,6
                csWait 5
                setActscript $7,eas_461B6
                csWait 120
                setFacing $7,UP
                nextSingleText $0,$7    ; "Volcanon?{W1}"
                setCamDest 34,2
                nextSingleText $0,$80   ; "They awakened Zeon, the{N}legendary devil!{W2}"
                nextSingleText $0,$80   ; "I've been protecting all the{N}ground-dwelling people.{W2}"
                nextSingleText $0,$80   ; "I can't forgive them for{N}this!{W1}"
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 4
                csWait 90
                setQuake 0
                setCamDest 34,5
                entityActionsWait $0
                 moveRight 1
                endActions
                entityActionsWait $7
                 moveRight 1
                endActions
                setFacing $0,UP
                entityActionsWait $7
                 moveUp 3
                endActions
                nextSingleText $0,$7    ; "Volcanon, please calm down!{W2}"
                nextSingleText $0,$7    ; "{LEADER} is not the person{N}who did it!{W1}"
                setCamDest 34,3
                nextSingleText $0,$80   ; "Everybody who lives on the{N}ground is responsibile.{W2}"
                nextSingleText $0,$80   ; "They have to solve this by{N}themselves.{W1}"
                nextSingleText $0,$7    ; "What should {LEADER} do?{W1}"
                nextSingleText $0,$80   ; "My protection ceases now!{W2}"
                nextSingleText $0,$80   ; "He must face the devils on{N}his own.{W1}"
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 4
                csWait 90
                setQuake 0
                setActscriptWait $7,eas_46172
                entityActionsWait $7
                 moveDown 1
                endActions
                setActscriptWait $7,eas_Init
                nextSingleText $0,$7    ; "But...{W2}"
                nextSingleText $0,$7    ; "Even the greater devils{N}are as strong as you!{W1}"
                nextSingleText $0,$80   ; "If all the humans are{N}annihilated, that's OK.{N}It's their destiny.{W2}"
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 4
                csWait 90
                setQuake 0
                nextSingleText $0,$80   ; "I want them to show me{N}courage.{W2}"
                nextSingleText $0,$80   ; "They must reseal the devil{N}again.{W1}"
                entityActionsWait $7
                 moveUp 1
                endActions
                nextSingleText $0,$7    ; "Then, please give some{N}advice to {LEADER}.{W1}"
                nextSingleText $0,$80   ; "{LEADER}, believe in the{N}power of the jewel.{W2}"
                entityActionsWait $0
                 moveLeft 1
                endActions
                entityActionsWait $0
                 moveUp 2
                endActions
                nextSingleText $0,$80   ; "It belongs to both the{N}light and the darkness.{W2}"
                nextSingleText $0,$80   ; "It shows its true power{N}when the light and the{N}darkness are as one.{W2}"
                nextSingleText $0,$80   ; "You may go now.  I don't{N}want to see anybody until{N}Zeon is defeated.{W1}"
                entityActionsWait $7
                 moveUp 1
                endActions
                nextSingleText $0,$7    ; "Volcanon!{W1}"
                csWait 30
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_Jump
                csWait 30
                entityActionsWait $7
                 moveDown 1
                endActions
                nextSingleText $0,$7    ; "{LEADER}, we'll defeat{N}that devil by ourselves!{W1}"
                nextSingleText $0,$7    ; "I didn't know he was such a{N}cold-hearted god.{W2}"
                nextSingleText $0,$7    ; "OK, I'll help you!  I'll{N}go with you to reseal the{N}devil!{W1}"
                join $7
                joinForceAI $7,$0       ; 0054 JOIN FORCE WITH AI
                followEntity $7,$0,$2
                csc_end
