
; ASM FILE data\maps\entries\map17\mapsetups\s6_initfunction.asm :
; 0x52450..0x52A80 : 

; =============== S U B R O U T I N E =======================================

ms_map17_InitFunction:
                
                 
                chkFlg  $294            ; Set after initial wake-up in prison sequence
                bne.s   byte_52460      
                script  cs_5249E
                setFlg  $294            ; Set after initial wake-up in prison sequence
byte_52460:
                
                chkFlg  $297            ; Set after Galam and Lemon leave with their army
                beq.s   byte_52476      
                move.w  #$83,d0 
                jsr     MoveEntityOutOfMap
                script  cs_5247C
byte_52476:
                
                setFlg  $263            ; Set after prison wake-up sequence IF 0297 is *not* also set
                rts

	; End of function ms_map17_InitFunction

cs_5247C:       setBlocks 48,7,1,1,48,8
                setBlocks 62,20,1,2,48,20
                setBlocks 57,7,1,1,57,8
                setBlocks 62,20,1,2,57,20
                csc_end
cs_5249E:       playSound $FD
                resetForceBattleStats
                resetMap
                loadEntitiesFromMapSetup 0,0,RIGHT
                csWait 60
                fadeInB
                textCursor $370
                reloadMap 52,1
                setPos $0,59,4,UP
                nextSingleText $0,$1    ; "Impossible!{N}Galam and Granseal are{N}allies!{W1}"
                nextSingleText $C0,$84  ; "But it's true.  I'm a scholar.{N}I'm here because I tried{N}to stop him.{W1}"
                nextText $C0,$85        ; "I'm a leader of the Galam{N}Army.  I disagreed with{N}the war and now I'm here.{W2}"
                nextText $C0,$85        ; "What did your kingdom{N}do to Galam?{W2}"
                nextSingleText $C0,$85  ; "What is the reason for this{N}war?{W1}"
                nextText $0,$4          ; "What about Sir Hawel?{N}He was killed by Galam!{W2}"
                nextSingleText $0,$4    ; "What did Galam want?{N}What is Ground Seal?{W1}"
                nextSingleText $C0,$84  ; "Ground Seal...do you know{N}what Ground Seal is?{W1}"
                nextSingleText $0,$2    ; "What is Ground Seal?{N}Please tell me!{W1}"
                nextText $C0,$84        ; "I heard King Galam say{N}those words.{W2}"
                nextSingleText $C0,$84  ; "I just know that something{N}is being concealed.{W1}"
                loadMapFadeIn 17,52,1
                csWait 1
                playSound MUSIC_CASTLE
                fadeInB
                csWait 30
                setDest $0,59,5
                headshake $0
                nod $0
                nextSingleText $0,$0    ; "(Yawn){W1}"
                setFacing $0,LEFT
                csWait 40
                setFacing $2,RIGHT
                textCursor $37C
                nextText $0,$2          ; "{LEADER}!{N}You finally woke up!{W2}"
                nextSingleText $0,$2    ; "We're talking about{N}Ground Seal.{N}Please, join in.{W1}"
                setFacing $2,LEFT
                csc_end
cs_52530:       textCursor $385
                setCamDest 48,0
                setFacing $0,DOWN
                nextSingleText $C0,$84  ; "What's wrong with the seal?{W1}"
                entityActionsWait $2
                 moveLeft 1
                endActions
                nextSingleText $C0,$2   ; "Somebody broke the sacred{N}seal?{W1}"
                nextSingleText $0,$1    ; "We're not sure.{N}It seems that somebody{N}stole the two jewels.{W1}"
                setCamDest 43,0
                startEntity $5
                nextSingleText $0,$5    ; "...ancient...shrine...{N}two...jewels...!{W1}"
                entityActionsWait $85
                 moveLeft 1
                endActions
                nextSingleText $0,$85   ; "Oh, you woke up!{N}Are you OK?{W1}"
                setFacing $0,LEFT
                setFacing $2,LEFT
                setFacing $3,LEFT
                setFacing $1,LEFT
                setFacing $4,LEFT
                setFacing $84,LEFT
                setFacing $85,LEFT
                entityActionsWait $5
                 moveRight 1
                endActions
                csWait 5
                setActscript $5,eas_461B6
                csWait 30
                nextSingleText $0,$5    ; "Where...?{N}...I...why am I...?{W1}"
                setFacing $5,DOWN
                nextText $C0,$84        ; "This is a jail in the{N}basement of Galam Castle.{W2}"
                nextSingleText $C0,$84  ; "Say, you mustn't move yet!{W1}"
                headshake $5
                csWait 30
                nextSingleText $0,$5    ; "Yes, I remember!{N}I was caught by Galam{N}soldiers.{W1}"
                setFacing $85,UP
                nextSingleText $0,$85   ; "They took my jewels and{N}brought me here!{W1}"
                shiver $5
                nextSingleText $0,$5    ; "They...they killed my{N}friends!{W1}"
                customActscriptWait $5
                 ac_setSpeed 14,14      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $5
                 moveDown 1
                 eaWait 40
                 moveLeft 1
                 eaWait 40
                 moveDown 1
                endActions
                setFacing $5,UP
                customActscriptWait $5
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $2          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                stopEntity $5
                setFacing $85,LEFT
                csWait 50
                nextSingleText $0,$5    ; "Ouch!{N}I can hardly move.{W1}"
                entityActionsWait $85
                 moveLeft 1
                endActions
                nextSingleText $0,$85   ; "Stay here for a while.{N}You need to rest.{W1}"
                csWait 20
                entityActionsWait $85
                 moveRight 2
                endActions
                setCamDest 47,0
                setFacing $1,RIGHT
                setFacing $85,RIGHT
                setFacing $0,DOWN
                setFacing $3,DOWN
                setFacing $4,DOWN
                setFacing $84,DOWN
                nextText $C0,$84        ; "What were we talking{N}about?{W2}"
                nextSingleText $C0,$84  ; "Oh, yes.  Why is King Galam{N}interested in Ground Seal?{W1}"
                nextSingleText $0,$1    ; "Is it related to the opened{N}door?{W1}"
                nextSingleText $0,$5    ; "Hey!{W1}"
                customActscriptWait $5
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $0          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setSprite $5,$3B
                csWait 20
                nextSingleText $0,$4    ; "Does he want the jewels?{W1}"
                nextSingleText $0,$5    ; "What?{W1}"
                shiver $5
                csWait 20
                nextSingleText $0,$3    ; "The man that broke the seal{N}is to blame for everything!{W1}"
                nextSingleText $0,$5    ; "Oh, no!{W1}"
                shiver $5
                entityActionsWait $85
                 moveLeft 1
                endActions
                nextSingleText $0,$85   ; "Are you OK?{N}You know something?{W1}"
                nextSingleText $0,$5    ; "Uhh...nope!{W1}"
                shiver $5
                nextText $0,$4          ; "We can't stay here!{W2}"
                setFacing $1,RIGHT
                nextSingleText $0,$4    ; "We must escape!{W1}"
                entityActionsWait $85
                 moveRight 1
                endActions
                nextText $0,$1          ; "I know, but how can we{N}open that locked door?{W2}"
                nextSingleText $0,$1    ; "Oh, Galam is invading{N}Granseal while we're{N}sitting here!{W1}"
                setCamDest 43,0
                setActscriptWait $5,eas_Init
                startEntity $5
                setSprite $5,$5
                setActscriptWait $5,eas_Jump
                entityActionsWait $5
                 moveRight 1
                endActions
                nextSingleText $0,$5    ; "I'll open the door for you!{W1}"
                setCameraEntity $5
                entityActionsWait $85
                 moveLeft 1
                endActions
                setFacing $1,DOWN
                nextSingleText $0,$85   ; "Oh, yes!  You're a thief and{N}you can open locked doors.{W1}"
                nextSingleText $0,$5    ; "Yes, of course!{N}I'm the great thief, {NAME;5}!{W1}"
                entityActionsWait $5
                 moveLeft 1
                 moveDown 1
                endActions
                setFacing $5,DOWN
                nextSingleText $FF,$FF  ; "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
                playSound SFX_SECRET_PATH_ROCK
                setBlocks 48,7,1,1,48,8
                setBlocks 62,20,1,2,48,20
                textCursor $3A3
                entityActionsWait $5
                 moveDown 2
                 moveRight 9
                endActions
                setFacing $5,UP
                nextSingleText $FF,$FF  ; "{NAME;5} sticks a short wire{N}into the keyhole.{W1}"
                playSound SFX_SECRET_PATH_ROCK
                setBlocks 57,7,1,1,57,8
                setBlocks 62,20,1,2,57,20
                entityActionsWait $5
                 moveUp 2
                endActions
                nextSingleText $C0,$5   ; "OK, it's done.{N}Hurry to your country and{N}save them!{W1}"
                entityActionsWait $2
                 moveRight 1
                endActions
                setFacing $2,DOWN
                nextText $0,$2          ; "Thank you!{W2}"
                setFacing $2,LEFT
                nextSingleText $0,$2    ; "{LEADER}, let's get back{N}to Granseal!{W1}"
                csWait 30
                setActscript $0,eas_Jump
                setActscript $3,eas_Jump
                setActscriptWait $4,eas_Jump
                setActscript $0,eas_Jump
                setActscript $3,eas_Jump
                setActscriptWait $4,eas_Jump
                csWait 30
                nextSingleText $0,$1    ; "Why are you being so nice{N}to us?  You don't know us.{W1}"
                shiver $5
                csWait 5
                setActscript $5,eas_461B6
                nextSingleText $C0,$5   ; "Ah, that's because...{N}well...{W1}"
                csWait 20
                setFacing $5,UP
                setActscriptWait $5,eas_46172
                customActscriptWait $5
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $5
                 moveDown 2
                 moveLeft 1
                endActions
                entityActionsWait $1
                 moveLeft 3
                 moveDown 4
                 moveRight 4
                endActions
                setFacing $5,LEFT
                nextSingleText $0,$1    ; "Is it...?{N}Are you the thief who broke{N}the seal?{W1}"
                shiver $5
                nextSingleText $C0,$5   ; "I...ah...{W1}"
                entityActionsWait $1
                 moveRight 3
                endActions
                nextText $0,$1          ; "You are!{W2}"
                nextSingleText $0,$1    ; "Hey, you!{N}Do you know what you've done?{W1}"
                setActscript $1,eas_BumpRight
                entityActionsWait $5
                 moveRight 1
                endActions
                nextSingleText $0,$1    ; "A big problem was created{N}because you stole the{N}jewels!{W1}"
                customActscriptWait $1
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1
                 moveRight 1
                endActions
                setActscript $1,eas_BumpRight
                customActscriptWait $5
                 ac_setSpeed 14,14      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $5
                 moveRight 1
                endActions
                customActscriptWait $5
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $5
                 moveRight 1
                endActions
                stopEntity $5
                setFacing $5,UP
                setSprite $5,$3B
                csWait 40
                nextText $0,$1          ; "I know the thief {NAME;5}{N}always steals for poor{N}people, but you made a{W2}"
                nextText $0,$1          ; "serious mistake this time!!{W2}"
                nextSingleText $0,$1    ; "All these disasters...{N}everything is YOUR fault!{W1}"
                nextSingleText $C0,$5   ; "I didn't mean to...{W1}"
                entityActionsWait $1
                 moveRight 1
                 moveUp 2
                 moveLeft 4
                endActions
                setFacing $1,UP
                nextSingleText $0,$1    ; "That's enough!{N}{LEADER}, let's go!{W1}"
                followEntity $3,$0,$2
                followEntity $4,$3,$2
                followEntity $2,$4,$2
                followEntity $1,$2,$2
                csc_end
cs_528CA:       entityActionsWait $0
                 moveRight 1
                endActions
                csc_end
cs_528D4:       textCursor $3B3
                nextSingleText $0,$5    ; "Wait!{W1}"
                setCamDest 50,3
                csWait 30
                setActscriptWait $5,eas_Init
                startEntity $5
                setSprite $5,$5
                entityActionsWait $5
                 moveLeft 2
                endActions
                nextText $0,$5          ; "You'll be captured if you go{N}that way.{W2}"
                nextSingleText $0,$5    ; "I know this castle very{N}well.  I know a short cut.{W1}"
                entityActionsWait $5
                 moveUp 4
                endActions
                csWait 30
                nextSingleText $FF,$FF  ; "{NAME;5} pulls up some tiles{N}with a short wire.{W1}"
                csWait 30
                playSound SFX_DOOR_OPEN
                setBlocks 63,2,1,1,57,4
                csWait 20
                entityActionsWait $5
                 moveRight 1
                 moveUp 1
                endActions
                setFacing $5,DOWN
                nextSingleText $0,$5    ; "Now, go out through this{N}short cut!{W1}"
                csc_end
cs_52938:       textCursor $3B8
                entityActionsWait $5
                 moveDown 1
                endActions
                setFacing $5,LEFT
                setFacing $0,RIGHT
                nextText $0,$5          ; "You're right.  I did it.{W2}"
                nextText $0,$5          ; "But, I didn't know all this{N}would happen.{W2}"
                nextSingleText $0,$5    ; "Please take me with you.{W1}"
                nextSingleText $FF,$FF  ; "{CLEAR}{LEADER} decides to take{N}{NAME;5} with him.{W1}{CLEAR}"
                setActscriptWait $5,eas_Jump
                setActscript $5,eas_Jump
                nextText $0,$5          ; "Thanks.  I promise to help{N}you.{W2}"
                nextSingleText $0,$5    ; "This tunnel leads to the{N}kitchen.{N}We can escape safely.{W1}"
                entityActionsWait $0
                 moveUp 1
                endActions
                fadeOutB
                reloadMap 24,14
                setActscriptWait $1,eas_Init
                setActscriptWait $2,eas_Init
                setActscriptWait $3,eas_Init
                setActscriptWait $4,eas_Init
                setActscriptWait $5,eas_Init
                hide $1
                hide $2
                hide $3
                hide $4
                setPos $0,29,12,DOWN
                setPos $5,29,11,DOWN
                stopEntity $0
                stopEntity $5
                fadeInB
                customActscriptWait $0
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $5
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscript $0,eas_RotateRight
                setActscript $5,eas_RotateRight
                setDest $8000,29,18
                setDest $5,29,17
                setFacing $0,DOWN
                setFacing $5,DOWN
                startEntity $0
                startEntity $5
                setActscriptWait $0,eas_Init
                setActscriptWait $5,eas_Init
                followEntity $5,$0,$2
                csc_end
cs_52A3C:       setActscriptWait $0,eas_Init
                setFacing $83,LEFT
                textCursor $3BE
                nextText $0,$83         ; "Hey, it's noisy next door.{W2}"
                nextSingleText $0,$83   ; "It sounds like...{N}Mr. {NAME;28} and the King{N}are arguing.{W1}"
                csWait 20
                setFacing $83,RIGHT
                nextText $0,$83         ; "Who are you?{W2}"
                nextSingleText $0,$83   ; "Now, I have to get back{N}to work.{W1}"
                csWait 20
                entityActionsWait $0
                 moveRight 1
                endActions
                setFacing $0,LEFT
                csWait 20
                entityActionsWait $83
                 moveRight 1
                 moveUp 1
                 moveRight 1
                endActions
                csc_end
