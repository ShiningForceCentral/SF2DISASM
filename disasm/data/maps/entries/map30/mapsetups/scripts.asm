
; ASM FILE data\maps\entries\map30\mapsetups\scripts.asm :
; 0x5A33A..0x5A646 : 
cs_5A33A:       textCursor 1711
                setCamDest 0,7
                setActscriptWait 158,eas_InitSlow
                followEntity FOLLOWER_B,ALLY_PETER,2
                customActscriptWait 158
                 ac_setSpeed 0,0        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setDest 158,8,11
                nextSingleText $0,158   ; "Where is the sick dwarf?{W1}"
                csWait 5
                setActscript 158,eas_2xRightLeft
                csWait 50
                setCamDest 5,7
                entityActionsWait 128
                 moveLeft 1
                endActions
                setFacing 158,RIGHT
                nextSingleText $0,128   ; "Oh, thank goodness.{N}I sure am glad to see you.{W1}"
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                entityActionsWait 128
                 moveRight 3
                endActions
                setFacing 128,LEFT
                nextSingleText $0,128   ; "Here, please examine him.{W1}"
                setCameraEntity 158
                entityActionsWait 158
                 moveRight 4
                 moveDown 1
                 moveRight 2
                endActions
                setCamDest 10,7
                setFacing 128,RIGHT
                csWait 60
                nextText $0,158         ; "Oh, I hope I'm not too late.{W2}"
                nextSingleText $0,158   ; "Ok, let's see.{W1}"
                csWait 50
                shiver 158
                csWait 30
                shiver 158
                csWait 20
                entityFlashWhite 158,$78
                mapFadeOutToWhite
                entityFlashWhite 158,$64
                mapFadeInFromWhite
                csWait 50
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 100
                entityActionsWait 129
                 moveDown 1
                endActions
                setFacing 129,LEFT
                nextSingleText $0,129   ; "How is he?{W1}"
                csWait 15
                headshake 132
                nextSingleText $0,132   ; "I don't know yet....{W1}"
                csWait 60
                setActscriptWait 130,eas_Init
                setActscriptWait 130,eas_Jump
                startEntity 130
                nextSingleText $0,130   ; "Whoa!{W1}"
                csWait 5
                setActscript 130,eas_2xRightLeft
                csWait 100
                setFacing 130,UP
                nextSingleText $0,130   ; "What?{W1}"
                entityActionsWait 129
                 moveUp 1
                endActions
                setFacing 129,LEFT
                setFacing 130,RIGHT
                nextSingleText $0,129   ; "Hey, are you OK?{W1}"
                nextSingleText $0,130   ; "I'm OK.  I'm fine.{N}I feel great!{W1}"
                csWait 20
                entityActionsWait 128
                 moveRight 1
                endActions
                setFacing 128,DOWN
                setFacing 129,LEFT
                setFacing 130,LEFT
                setFacing 131,LEFT
                setFacing 132,LEFT
                setFacing 158,UP
                nextSingleText $0,128   ; "Oh, how can we thank you?{W1}"
                nod 130
                nextText $0,158         ; "I don't need anything.{W2}"
                nextSingleText $0,158   ; "But, why don't you help{N}{LEADER}?{W1}"
                csWait 15
                setPos FOLLOWER_B,7,11,RIGHT
                setPos ALLY_PETER,7,10,RIGHT
                setPos ALLY_BOWIE,8,11,RIGHT
                setCameraEntity 158
                entityActionsWait 158
                 moveLeft 2
                 moveUp 1
                 moveLeft 3
                endActions
                nextSingleText $0,158   ; "{LEADER}, I'm  going now.{W2}{N}I hope your journey is safe{N}and uneventful.  Bye!{W1}"
                setCameraEntity 65535
                entityActionsWait 158
                 moveUp 2
                 moveLeft 3
                 moveDown 3
                endActions
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_PETER,DOWN
                setFacing FOLLOWER_B,DOWN
                entityActionsWait 158
                 moveRight 1
                 moveDown 5
                endActions
                hide 158
                setCamDest 4,7
                entityActions ALLY_BOWIE
                 moveRight 2
                endActions
                entityActionsWait 128
                 moveLeft 3
                endActions
                csc_end
cs_5A4FE:       textCursor 1730
                setFacing 129,LEFT
                setFacing 130,LEFT
                setFacing 131,LEFT
                setFacing 132,LEFT
                setCamDest 6,7
                nextSingleText $0,128   ; "We use it to destroy large{N}rocks.{W1}"
                entityActionsWait 128
                 moveRight 1
                endActions
                nextSingleText $0,128   ; "OK, guys!{N}Let's go back to Grans{N}Island!{W2}"
                nextSingleText $0,128   ; "Everybody dig!{W1}"
                setActscript 129,eas_Jump
                setActscript 130,eas_Jump
                setActscript 131,eas_Jump
                setActscriptWait 132,eas_Jump
                setActscript 129,eas_Jump
                setActscript 130,eas_Jump
                setActscript 131,eas_Jump
                setActscriptWait 132,eas_Jump
                setActscriptWait ALLY_BOWIE,eas_Init
                entityActionsWait ALLY_BOWIE
                 moveLeft 1
                endActions
                setDest ALLY_PETER,8,10
                entityActions 128
                 moveLeft 2
                endActions
                entityActions 129
                 moveLeft 1
                endActions
                entityActions 130
                 moveLeft 1
                endActions
                entityActions 131
                 moveLeft 1
                endActions
                entityActionsWait 132
                 moveLeft 2
                endActions
                setFacing ALLY_BOWIE,RIGHT
                setFacing ALLY_PETER,RIGHT
                setFacing FOLLOWER_B,RIGHT
                entityActions 128
                 moveUp 2
                 moveLeft 1
                 moveUp 3
                endActions
                entityActions 131
                 moveLeft 3
                 moveUp 2
                 moveLeft 1
                 moveUp 3
                endActions
                entityActions 132
                 moveUp 2
                 moveLeft 3
                 moveUp 2
                 moveLeft 1
                 moveUp 3
                endActions
                entityActions 129
                 moveUp 1
                 moveLeft 5
                 moveUp 2
                 moveLeft 1
                 moveUp 3
                endActions
                entityActionsWait 130
                 eaWait 40
                 moveUp 1
                 moveLeft 4
                 moveUp 1
                endActions
                csWait 30
                entityActionsWait 130
                 moveDown 1
                endActions
                setFacing 130,LEFT
                nod 130
                entityActionsWait 130
                 moveUp 2
                 moveLeft 1
                 moveUp 3
                endActions
                setPos 128,7,3,UP
                setPos 129,8,3,UP
                setPos 130,7,4,UP
                setPos 131,8,4,UP
                setPos 132,7,5,UP
                setBlocks 21,6,2,2,7,5
                csc_end
