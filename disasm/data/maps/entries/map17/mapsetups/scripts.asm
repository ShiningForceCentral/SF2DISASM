
; ASM FILE data\maps\entries\map17\mapsetups\scripts.asm :
; 0x52530..0x52A80 : 
cs_52530:       textCursor 901
                setCamDest 48,0
                setFacing ALLY_BOWIE,DOWN
                nextSingleText $C0,132  ; "What's wrong with the seal?{W1}"
                entityActionsWait ALLY_CHESTER
                 moveLeft 1
                endActions
                nextSingleText $C0,ALLY_CHESTER ; "Somebody broke the sacred{N}seal?{W1}"
                nextSingleText $0,ALLY_SARAH ; "We're not sure.{N}It seems that somebody{N}stole the two jewels.{W1}"
                setCamDest 43,0
                startEntity ALLY_SLADE
                nextSingleText $0,ALLY_SLADE ; "...ancient...shrine...{N}two...jewels...!{W1}"
                entityActionsWait 133
                 moveLeft 1
                endActions
                nextSingleText $0,133   ; "Oh, you woke up!{N}Are you OK?{W1}"
                setFacing ALLY_BOWIE,LEFT
                setFacing ALLY_CHESTER,LEFT
                setFacing ALLY_JAHA,LEFT
                setFacing ALLY_SARAH,LEFT
                setFacing ALLY_KAZIN,LEFT
                setFacing 132,LEFT
                setFacing 133,LEFT
                entityActionsWait ALLY_SLADE
                 moveRight 1
                endActions
                csWait 5
                setActscript ALLY_SLADE,eas_2xRightLeft
                csWait 30
                nextSingleText $0,ALLY_SLADE ; "Where...?{N}...I...why am I...?{W1}"
                setFacing ALLY_SLADE,DOWN
                nextText $C0,132        ; "This is a jail in the{N}basement of Galam Castle.{W2}"
                nextSingleText $C0,132  ; "Say, you mustn't move yet!{W1}"
                headshake ALLY_SLADE
                csWait 30
                nextSingleText $0,ALLY_SLADE ; "Yes, I remember!{N}I was caught by Galam{N}soldiers.{W1}"
                setFacing 133,UP
                nextSingleText $0,133   ; "They took my jewels and{N}brought me here!{W1}"
                shiver ALLY_SLADE
                nextSingleText $0,ALLY_SLADE ; "They...they killed my{N}friends!{W1}"
                customActscriptWait ALLY_SLADE
                 ac_setSpeed 14,14      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_SLADE
                 moveDown 1
                 eaWait 40
                 moveLeft 1
                 eaWait 40
                 moveDown 1
                endActions
                setFacing ALLY_SLADE,UP
                customActscriptWait ALLY_SLADE
                 ac_motion OFF          ;   
                 ac_orientDown          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                stopEntity ALLY_SLADE
                setFacing 133,LEFT
                csWait 50
                nextSingleText $0,ALLY_SLADE ; "Ouch!{N}I can hardly move.{W1}"
                entityActionsWait 133
                 moveLeft 1
                endActions
                nextSingleText $0,133   ; "Stay here for a while.{N}You need to rest.{W1}"
                csWait 20
                entityActionsWait 133
                 moveRight 2
                endActions
                setCamDest 47,0
                setFacing ALLY_SARAH,RIGHT
                setFacing 133,RIGHT
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_JAHA,DOWN
                setFacing ALLY_KAZIN,DOWN
                setFacing 132,DOWN
                nextText $C0,132        ; "What were we talking{N}about?{W2}"
                nextSingleText $C0,132  ; "Oh, yes.  Why is King Galam{N}interested in Ground Seal?{W1}"
                nextSingleText $0,ALLY_SARAH ; "Is it related to the opened{N}door?{W1}"
                nextSingleText $0,ALLY_SLADE ; "Hey!{W1}"
                customActscriptWait ALLY_SLADE
                 ac_motion OFF          ;   
                 ac_orientUp            ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setSprite ALLY_SLADE,MAPSPRITE_POSE1
                csWait 20
                nextSingleText $0,ALLY_KAZIN ; "Does he want the jewels?{W1}"
                nextSingleText $0,ALLY_SLADE ; "What?{W1}"
                shiver ALLY_SLADE
                csWait 20
                nextSingleText $0,ALLY_JAHA ; "The man that broke the seal{N}is to blame for everything!{W1}"
                nextSingleText $0,ALLY_SLADE ; "Oh, no!{W1}"
                shiver ALLY_SLADE
                entityActionsWait 133
                 moveLeft 1
                endActions
                nextSingleText $0,133   ; "Are you OK?{N}You know something?{W1}"
                nextSingleText $0,ALLY_SLADE ; "Uhh...nope!{W1}"
                shiver ALLY_SLADE
                nextText $0,ALLY_KAZIN  ; "We can't stay here!{W2}"
                setFacing ALLY_SARAH,RIGHT
                nextSingleText $0,ALLY_KAZIN ; "We must escape!{W1}"
                entityActionsWait 133
                 moveRight 1
                endActions
                nextText $0,ALLY_SARAH  ; "I know, but how can we{N}open that locked door?{W2}"
                nextSingleText $0,ALLY_SARAH ; "Oh, Galam is invading{N}Granseal while we're{N}sitting here!{W1}"
                setCamDest 43,0
                setActscriptWait ALLY_SLADE,eas_Init
                startEntity ALLY_SLADE
                setSprite ALLY_SLADE,ALLY_SLADE
                setActscriptWait ALLY_SLADE,eas_Jump
                entityActionsWait ALLY_SLADE
                 moveRight 1
                endActions
                nextSingleText $0,ALLY_SLADE ; "I'll open the door for you!{W1}"
                setCameraEntity ALLY_SLADE
                entityActionsWait 133
                 moveLeft 1
                endActions
                setFacing ALLY_SARAH,DOWN
                nextSingleText $0,133   ; "Oh, yes!  You're a thief and{N}you can open locked doors.{W1}"
                nextSingleText $0,ALLY_SLADE ; "Yes, of course!{N}I'm the great thief, {NAME;5}!{W1}"
                entityActionsWait ALLY_SLADE
                 moveLeft 1
                 moveDown 1
                endActions
                setFacing ALLY_SLADE,DOWN
                nextSingleText $FF,255  ; "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
                playSound SFX_SECRET_PATH_ROCK
                setBlocks 48,7,1,1,48,8
                setBlocks 62,20,1,2,48,20
                textCursor 931
                entityActionsWait ALLY_SLADE
                 moveDown 2
                 moveRight 9
                endActions
                setFacing ALLY_SLADE,UP
                nextSingleText $FF,255  ; "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
                playSound SFX_SECRET_PATH_ROCK
                setBlocks 57,7,1,1,57,8
                setBlocks 62,20,1,2,57,20
                entityActionsWait ALLY_SLADE
                 moveUp 2
                endActions
                nextSingleText $C0,ALLY_SLADE ; "OK, it's done.{N}Hurry to your country and{N}save them!{W1}"
                entityActionsWait ALLY_CHESTER
                 moveRight 1
                endActions
                setFacing ALLY_CHESTER,DOWN
                nextText $0,ALLY_CHESTER ; "Thank you!{W2}"
                setFacing ALLY_CHESTER,LEFT
                nextSingleText $0,ALLY_CHESTER ; "{LEADER}, let's get back{N}to Granseal!{W1}"
                csWait 30
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_JAHA,eas_Jump
                setActscriptWait ALLY_KAZIN,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_JAHA,eas_Jump
                setActscriptWait ALLY_KAZIN,eas_Jump
                csWait 30
                nextSingleText $0,ALLY_SARAH ; "Why are you being so nice{N}to us?  You don't know us.{W1}"
                shiver ALLY_SLADE
                csWait 5
                setActscript ALLY_SLADE,eas_2xRightLeft
                nextSingleText $C0,ALLY_SLADE ; "Ah, that's because...{N}well...{W1}"
                csWait 20
                setFacing ALLY_SLADE,UP
                setActscriptWait ALLY_SLADE,eas_DeactivateAutoFacing
                customActscriptWait ALLY_SLADE
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_SLADE
                 moveDown 2
                 moveLeft 1
                endActions
                entityActionsWait ALLY_SARAH
                 moveLeft 3
                 moveDown 4
                 moveRight 4
                endActions
                setFacing ALLY_SLADE,LEFT
                nextSingleText $0,ALLY_SARAH ; "Is it...?{N}Are you the thief who broke{N}the seal?{W1}"
                shiver ALLY_SLADE
                nextSingleText $C0,ALLY_SLADE ; "I...ah...{W1}"
                entityActionsWait ALLY_SARAH
                 moveRight 3
                endActions
                nextText $0,ALLY_SARAH  ; "You are!{W2}"
                nextSingleText $0,ALLY_SARAH ; "Hey, you!{N}Do you know what you've done?{W1}"
                setActscript ALLY_SARAH,eas_BumpRight
                entityActionsWait ALLY_SLADE
                 moveRight 1
                endActions
                nextSingleText $0,ALLY_SARAH ; "A big problem was created{N}because you stole the{N}jewels!{W1}"
                customActscriptWait ALLY_SARAH
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_SARAH
                 moveRight 1
                endActions
                setActscript ALLY_SARAH,eas_BumpRight
                customActscriptWait ALLY_SLADE
                 ac_setSpeed 14,14      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_SLADE
                 moveRight 1
                endActions
                customActscriptWait ALLY_SLADE
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_SLADE
                 moveRight 1
                endActions
                stopEntity ALLY_SLADE
                setFacing ALLY_SLADE,UP
                setSprite ALLY_SLADE,MAPSPRITE_POSE1
                csWait 40
                nextText $0,ALLY_SARAH  ; "I know the thief {NAME;5}{N}always steals for poor{N}people, but you made a{W2}"
                nextText $0,ALLY_SARAH  ; "serious mistake this time!!{W2}"
                nextSingleText $0,ALLY_SARAH ; "All these disasters...{N}everything is YOUR fault!{W1}"
                nextSingleText $C0,ALLY_SLADE ; "I didn't mean to...{W1}"
                entityActionsWait ALLY_SARAH
                 moveRight 1
                 moveUp 2
                 moveLeft 4
                endActions
                setFacing ALLY_SARAH,UP
                nextSingleText $0,ALLY_SARAH ; "That's enough!{N}{LEADER}, let's go!{W1}"
                followEntity ALLY_JAHA,ALLY_BOWIE,2
                followEntity ALLY_KAZIN,ALLY_JAHA,2
                followEntity ALLY_CHESTER,ALLY_KAZIN,2
                followEntity ALLY_SARAH,ALLY_CHESTER,2
                csc_end
cs_528CA:       entityActionsWait ALLY_BOWIE
                 moveRight 1
                endActions
                csc_end
cs_528D4:       textCursor 947
                nextSingleText $0,ALLY_SLADE ; "Wait!{W1}"
                setCamDest 50,3
                csWait 30
                setActscriptWait ALLY_SLADE,eas_Init
                startEntity ALLY_SLADE
                setSprite ALLY_SLADE,ALLY_SLADE
                entityActionsWait ALLY_SLADE
                 moveLeft 2
                endActions
                nextText $0,ALLY_SLADE  ; "You'll be captured if you go{N}that way.{W2}"
                nextSingleText $0,ALLY_SLADE ; "I know this castle very{N}well.  I know a short cut.{W1}"
                entityActionsWait ALLY_SLADE
                 moveUp 4
                endActions
                csWait 30
                nextSingleText $FF,255  ; "{NAME;5} pulls up some tiles{N}with a short wire.{W1}"
                csWait 30
                playSound SFX_DOOR_OPEN
                setBlocks 63,2,1,1,57,4
                csWait 20
                entityActionsWait ALLY_SLADE
                 moveRight 1
                 moveUp 1
                endActions
                setFacing ALLY_SLADE,DOWN
                nextSingleText $0,ALLY_SLADE ; "Now, go out through this{N}short cut!{W1}"
                csc_end
cs_52938:       textCursor 952
                entityActionsWait ALLY_SLADE
                 moveDown 1
                endActions
                setFacing ALLY_SLADE,LEFT
                setFacing ALLY_BOWIE,RIGHT
                nextText $0,ALLY_SLADE  ; "You're right.  I did it.{W2}"
                nextText $0,ALLY_SLADE  ; "But, I didn't know all this{N}would happen.{W2}"
                nextSingleText $0,ALLY_SLADE ; "Please take me with you.{W1}"
                nextSingleText $FF,255  ; "{CLEAR}{LEADER} decides to take{N}{NAME;5} with him.{W1}{CLEAR}"
                setActscriptWait ALLY_SLADE,eas_Jump
                setActscript ALLY_SLADE,eas_Jump
                nextText $0,ALLY_SLADE  ; "Thanks.  I promise to help{N}you.{W2}"
                nextSingleText $0,ALLY_SLADE ; "This tunnel leads to the{N}kitchen.{N}We can escape safely.{W1}"
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                endActions
                fadeOutB
                reloadMap 24,14
                setActscriptWait ALLY_SARAH,eas_Init
                setActscriptWait ALLY_CHESTER,eas_Init
                setActscriptWait ALLY_JAHA,eas_Init
                setActscriptWait ALLY_KAZIN,eas_Init
                setActscriptWait ALLY_SLADE,eas_Init
                hide ALLY_SARAH
                hide ALLY_CHESTER
                hide ALLY_JAHA
                hide ALLY_KAZIN
                setPos ALLY_BOWIE,29,12,DOWN
                setPos ALLY_SLADE,29,11,DOWN
                stopEntity ALLY_BOWIE
                stopEntity ALLY_SLADE
                fadeInB
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_SLADE
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscript ALLY_BOWIE,eas_RotateRight
                setActscript ALLY_SLADE,eas_RotateRight
                setDest 32768,29,18
                setDest ALLY_SLADE,29,17
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_SLADE,DOWN
                startEntity ALLY_BOWIE
                startEntity ALLY_SLADE
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_SLADE,eas_Init
                followEntity ALLY_SLADE,ALLY_BOWIE,2
                csc_end
cs_52A3C:       setActscriptWait ALLY_BOWIE,eas_Init
                setFacing 131,LEFT
                textCursor 958
                nextText $0,131         ; "Hey, it's noisy next door.{W2}"
                nextSingleText $0,131   ; "It sounds like...{N}Mr. {NAME;28} and the King{N}are arguing.{W1}"
                csWait 20
                setFacing 131,RIGHT
                nextText $0,131         ; "Who are you?{W2}"
                nextSingleText $0,131   ; "Now, I have to get back{N}to work.{W1}"
                csWait 20
                entityActionsWait ALLY_BOWIE
                 moveRight 1
                endActions
                setFacing ALLY_BOWIE,LEFT
                csWait 20
                entityActionsWait 131
                 moveRight 1
                 moveUp 1
                 moveRight 1
                endActions
                csc_end
