
; ASM FILE data\maps\entries\map45\mapsetups\scripts.asm :
; 0x600CE..0x603AE : 
cs_600CE:       textCursor 2083
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait ALLY_ZYNK,eas_Init
                nextSingleText $0,ALLY_SHEELA ; "Who's there!{W1}"
                setCamDest 1,1
                nextSingleText $0,ALLY_SHEELA ; "This is a sacred place!{W1}"
                setPos ALLY_ZYNK,8,12,LEFT
                setPos FOLLOWER_B,6,11,UP
                setPos ALLY_BOWIE,6,13,UP
                setPos ALLY_PETER,6,14,UP
                setCamDest 1,9
                nextSingleText $80,FOLLOWER_B ; "Oops!{W1}"
                entityActionsWait FOLLOWER_B
                 moveDown 1
                endActions
                nextSingleText $80,FOLLOWER_B ; "She's too beautiful for you!{N}Back, back!{W1}"
                setActscriptWait ALLY_BOWIE,eas_DeactivateAutoFacing
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_PETER
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions FOLLOWER_B
                 moveDown 3
                endActions
                entityActions ALLY_BOWIE
                 eaWait 20
                 moveDown 3
                endActions
                entityActions ALLY_PETER
                 eaWait 40
                 moveDown 3
                endActions
                csWait 50
                headshake ALLY_BOWIE
                headshake ALLY_BOWIE
                csWait 10
                headshake ALLY_BOWIE
                headshake ALLY_BOWIE
                csWait 10
                headshake ALLY_BOWIE
                waitIdle ALLY_BOWIE
                nextText $0,ALLY_SHEELA ; "Wait!{W1}"
                nextSingleText $0,ALLY_SHEELA ; "Is that you...Sir Astral?{W1}"
                setFacing FOLLOWER_B,UP
                nextSingleText $80,FOLLOWER_B ; "What?{W1}"
                setActscriptWait FOLLOWER_B,eas_Init
                entityActionsWait FOLLOWER_B
                 moveUp 4
                endActions
                nextSingleText $80,FOLLOWER_B ; "Who are you?{N}You know me?{W1}"
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                entityActions ALLY_BOWIE
                 moveUp 4
                 moveRight 1
                 moveUp 1
                endActions
                entityActions ALLY_PETER
                 moveUp 4
                 moveLeft 1
                 moveUp 1
                endActions
                setCamDest 1,5
                nextSingleText $0,ALLY_SHEELA ; "Oh...you don't remember me?{W1}"
                setFacing FOLLOWER_B,DOWN
                nextSingleText $80,FOLLOWER_B ; "Well...ah...sorry.{W1}"
                nextSingleText $0,ALLY_SHEELA ; "I'm {NAME;25}.  I was a pupil{N}of yours in Galam.  I was{N}preparing to become a priest.{W1}"
                shiver FOLLOWER_B
                setFacing FOLLOWER_B,UP
                nextSingleText $80,FOLLOWER_B ; "{NAME;25}!  I can't believe it!{W1}"
                nextText $0,ALLY_SHEELA ; "How is that scar on your{N}chest.{W2}"
                nextSingleText $0,ALLY_SHEELA ; "Remember?  You snuck up{N}behind me and tapped my{N}shoulder....{W1}"
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                nextText $80,FOLLOWER_B ; "And you kicked me in the{N}chest...and it left a scar.{N}How could I forget.{W2}"
                nextSingleText $80,FOLLOWER_B ; "Nobody but {NAME;25}{N}knew about that scar....{N}It still aches sometimes.{W1}"
                setActscriptWait FOLLOWER_B,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,ALLY_SHEELA ; "I am sorry I kicked you.{W1}"
                shiver FOLLOWER_B
                nextSingleText $80,FOLLOWER_B ; "That OK. How have...{W1}"
                entityActionsWait ALLY_PETER
                 moveRight 1
                endActions
                setFacing ALLY_PETER,UP
                setFacing ALLY_BOWIE,DOWN
                nextSingleText $0,ALLY_PETER ; "Hey, aren't you going to{N}introduce us?{W1}"
                entityActionsWait FOLLOWER_B
                 moveDown 1
                endActions
                nextSingleText $80,FOLLOWER_B ; "Of course.{W1}"
                setQuake 3
                csWait 40
                setQuake 0
                csWait 20
                setFacing FOLLOWER_B,UP
                setFacing ALLY_PETER,UP
                setFacing ALLY_BOWIE,UP
                nextText $80,FOLLOWER_B ; "All in good time.{W2}"
                nextSingleText $80,FOLLOWER_B ; "By the way, what are you{N}doing here?{W1}"
                shiver ALLY_SHEELA
                nextSingleText $0,ALLY_SHEELA ; "I came to kill Red Baron.{N}He killed my fiance.{W1}"
                nextSingleText $80,FOLLOWER_B ; "Oh....{N}I'm sorry...{W1}"
                nextSingleText $0,ALLY_SHEELA ; "And why did you come back{N}to Grans?{W1}"
                nextSingleText $80,FOLLOWER_B ; "To reseal Zeon.{W1}"
                nextSingleText $0,ALLY_SHEELA ; "The King of the Devils?{W1}"
                nod FOLLOWER_B
                nextText $80,FOLLOWER_B ; "Listen, {NAME;25}.{N}All the killings lately were{N}caused by him.{W2}"
                nextSingleText $80,FOLLOWER_B ; "He'll destroy the entire{N}world.  He must be stopped!{W1}"
                shiver ALLY_SHEELA
                nextSingleText $0,ALLY_SHEELA ; "Is Red Baron his follower?{W1}"
                nextSingleText $80,FOLLOWER_B ; "Could be.{W1}"
                nextSingleText $0,ALLY_SHEELA ; "Hmmm....{W1}"
                csWait 60
                nextSingleText $0,ALLY_SHEELA ; "Ok!  I'll do it!{W1}"
                setPos 134,6,8,UP
                setCameraEntity ALLY_SHEELA
                nextSingleText $0,ALLY_SHEELA ; "Close your eyes!{W1}"
                setActscriptWait ALLY_SHEELA,eas_DeactivateAutoFacing
                setFacing ALLY_SHEELA,LEFT
                entityActionsWait ALLY_SHEELA
                 moveUp 2
                endActions
                setFacing ALLY_SHEELA,DOWN
                startEntity ALLY_SHEELA
                setActscript ALLY_SHEELA,eas_Transparent
                entityActionsWait ALLY_SHEELA
                 moveDown 4
                endActions
                hide 134
                setActscriptWait ALLY_SHEELA,eas_Init
                setSprite ALLY_SHEELA,ALLY_SHEELA
                entityActionsWait ALLY_SHEELA
                 moveDown 2
                endActions
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                startEntity ALLY_SHEELA
                csWait 30
                setActscriptWait ALLY_SHEELA,eas_Init
                setCamDest 1,5
                nextSingleText $0,ALLY_SHEELA ; "Sir Astral, please let me go{N}with you.{W1}"
                nextSingleText $80,FOLLOWER_B ; "We welcome you, but can you{N}fight?{W1}"
                nextSingleText $0,ALLY_SHEELA ; "I've made my body into a{N}weapon.{W1}"
                nextSingleText $80,FOLLOWER_B ; "Where did you learn to do{N}this?  You're a priest.{W1}"
                nextSingleText $0,ALLY_SHEELA ; "I was.  But now I'm a{N}master monk.{W1}"
                setActscriptWait FOLLOWER_B,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $80,FOLLOWER_B ; "We could always use another{N}well-trained fighter!{W1}"
                join ALLY_SHEELA
                nextSingleText $0,ALLY_PETER ; "We've got a strong ally!{W1}"
                setFacing ALLY_SHEELA,LEFT
                nextSingleText $0,ALLY_SHEELA ; "Many Galam soldiers are in{N}the west.{N}We must be careful.{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                followEntity ALLY_ZYNK,FOLLOWER_B,2
                followEntity ALLY_SHEELA,ALLY_BOWIE,5
                csc_end
