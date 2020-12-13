
; ASM FILE data\maps\entries\map33\mapsetups\scripts.asm :
; 0x5AC58..0x5B5B6 : 
cs_5AC58:       textCursor 1804
                nextSingleText $0,129   ; "You may go now.{N}I need to talk to fairy.{W1}"
                nextSingleText $0,128   ; "Yes, sir.{W1}"
                setCamDest 12,11
                csWait 30
                stepEvent 17,11
                setPos 128,17,11,DOWN
                entityActionsWait 128
                 moveDown 3
                endActions
                csWait 5
                setActscript 128,eas_2xRightLeft
                csWait 80
                nextSingleText $0,128   ; "Tum-de-dum-dum.  Oh...{N}Time to check the{N}collections.{W1}"
                setCameraEntity 128
                entityActionsWait 128
                 moveLeft 5
                endActions
                setFacing 128,UP
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setPos ALLY_PETER,15,21,UP
                setPos ALLY_BOWIE,15,22,UP
                setPos FOLLOWER_B,15,23,UP
                stepEvent 15,20
                setCamDest 8,12
                csWait 30
                nextSingleText $FF,255  ; "Servant Goliath unlocks the{N}door.{W1}"
                entityActions ALLY_PETER
                 moveUp 4
                 moveLeft 3
                 moveUp 1
                endActions
                entityActions ALLY_BOWIE
                 moveUp 5
                 moveLeft 3
                endActions
                entityActionsWait FOLLOWER_B
                 moveUp 6
                 moveLeft 2
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing FOLLOWER_B,UP
                nextSingleText $0,ALLY_PETER ; "Excuse me.{W1}"
                shiver 128
                nextSingleText $0,128   ; "Yeow!{W1}"
                stopEntity 128
                csWait 30
                setFacing 128,RIGHT
                csWait 60
                setFacing 128,DOWN
                csWait 30
                startEntity 128
                nextSingleText $0,128   ; "Y...yes?{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "We've come to see Mr. Creed.{W1}"
                nextText $0,128         ; "My master?{W2}"
                nextSingleText $0,128   ; "Do you have an appointment?{W1}"
                nextSingleText $0,ALLY_PETER ; "A what?{W1}"
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                headshake ALLY_BOWIE
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "No, not yet, but...{W1}"
                nextText $0,128         ; "I'm sorry, but he's busy now.{W2}"
                nextSingleText $0,128   ; "Please come back later.{W1}"
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                nextSingleText $0,ALLY_PETER ; "We can't see Mr. Creed now.{W1}"
                setFacing ALLY_BOWIE,RIGHT
                setFacing FOLLOWER_B,LEFT
                nextText $0,FOLLOWER_B  ; "No kidding!{W2}"
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, {NAME;7}, let's{N}force our way into the room!{W1}"
                entityActionsWait ALLY_PETER
                 moveRight 1
                endActions
                setFacing ALLY_PETER,DOWN
                setFacing ALLY_BOWIE,UP
                setFacing FOLLOWER_B,UP
                nextText $0,ALLY_PETER  ; "Oddler, you're getting bold.{W2}"
                nextSingleText $0,ALLY_PETER ; "But, it is a good idea.{W1}"
                setFacing 128,UP
                csWait 10
                shiver 128
                entityActionsWait ALLY_PETER
                 moveLeft 1
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                shiver 128
                csWait 10
                nextSingleText $0,128   ; "Hmmmph....{W1}"
                csWait 20
                nextSingleText $0,ALLY_PETER ; "Let's go!{W1}"
                setCameraEntity ALLY_BOWIE
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_PETER
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_PETER
                 moveRight 5
                 moveUp 3
                endActions
                entityActions FOLLOWER_B
                 moveRight 5
                 moveUp 3
                endActions
                entityActions ALLY_BOWIE
                 moveRight 5
                 moveUp 3
                endActions
                csWait 10
                animEntityFX 128,2
                setPos 128,17,12,DOWN
                animEntityFX 128,3
                waitIdle ALLY_BOWIE
                setActscript ALLY_PETER,eas_BumpUp
                setActscript FOLLOWER_B,eas_BumpUp
                setActscriptWait ALLY_BOWIE,eas_BumpUp
                nextSingleText $0,ALLY_PETER ; "How did he do that?{W1}"
                shiver 128
                nextText $0,128         ; "You impolite kids!{N}You can't go in!{W2}"
                nextSingleText $0,128   ; "Mr. Creed is too busy!{N}Go away!{W1}"
                setActscriptWait ALLY_BOWIE,eas_DeactivateAutoFacing
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                setActscriptWait FOLLOWER_B,eas_DeactivateAutoFacing
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_PETER
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_BOWIE
                 moveDown 1
                endActions
                entityActions ALLY_PETER
                 moveDown 1
                endActions
                entityActionsWait FOLLOWER_B
                 moveDown 1
                endActions
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                csWait 25
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 120
                nextText $0,ALLY_PETER  ; "{LEADER}, on our left!{N}That door might lead to{N}Mr. Creed!{W2}"
                setFacing ALLY_PETER,DOWN
                nextSingleText $0,ALLY_PETER ; "Let's ditch this guy and go{N}through that door.{W1}"
                setFacing ALLY_BOWIE,RIGHT
                setFacing FOLLOWER_B,LEFT
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, let's do it!{N}I don't want to fail now!{W1}"
                nod ALLY_BOWIE
                setFacing ALLY_PETER,UP
                nextText $0,ALLY_PETER  ; "OK, OK.  We give up.{W2}"
                nextSingleText $0,ALLY_PETER ; "We'll see Mr. Creed later.{N}Let's get out of here.{W1}"
                setFacing FOLLOWER_B,UP
                setFacing ALLY_BOWIE,UP
                nextSingleText $0,FOLLOWER_B ; "Yeah, maybe later.{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                csc_end
cs_5AF36:       textCursor 1834
                setActscriptWait 128,eas_Init
                setActscriptWait 128,eas_Jump
                customActscriptWait 128
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveDown 2
                 moveLeft 2
                endActions
                setCameraEntity 128
                nextSingleText $0,128   ; "No, don't go in there!{N}That door is...!{W1}"
                flashScreenWhite $4
                csWait 40
                flashScreenWhite $4
                csWait 30
                flashScreenWhite $4
                csWait 5
                setActscript ALLY_BOWIE,eas_2xRightLeft
                csWait 5
                setActscript ALLY_PETER,eas_2xUpDown
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 20
                flashScreenWhite $4
                csWait 10
                flashScreenWhite $1E
                setActscript ALLY_BOWIE,eas_TwirlShrinkDisappear
                setActscript ALLY_PETER,eas_TwirlShrinkDisappear
                setActscript FOLLOWER_B,eas_TwirlShrinkDisappear
                csWait 60
                nextSingleText $0,128   ; "What stupid kids!{W1}"
                setActscriptWait 128,eas_Init
                entityActionsWait 128
                 moveLeft 3
                endActions
                setFacing 128,UP
                nextText $0,128         ; "Whoever passes through this{N}magic door becomes small.{W2}"
                nextSingleText $0,128   ; "That is, anybody who's not{N}protected by Mr. Creed.{W1}"
                stopEntity 128
                csWait 20
                nextSingleText $FF,255  ; "Goliath picks up{N}{LEADER}.{W1}"
                startEntity 128
                nextSingleText $0,128   ; "Now, you're part of the{N}collection!{W1}"
                stepEvent 12,13
                entityActionsWait 128
                 moveUp 2
                 moveLeft 5
                 faceUp 20
                endActions
                setActscriptWait 128,eas_Jump
                csWait 20
                warp MAP_CREED_DESKTOP_WORLD,0,0,DOWN
                csc_end
cs_5B016:       textCursor 1840
                reloadMap 12,2
                setPos ALLY_BOWIE,63,63,DOWN
                setPos ALLY_PETER,63,63,DOWN
                setPos FOLLOWER_B,63,63,DOWN
                fadeInB
                csWait 40
                nextSingleText $80,129  ; "Goliath...Goliath!{W1}"
                entityActionsWait 129
                 moveDown 1
                 moveLeft 2
                endActions
                setFacing 129,DOWN
                nextSingleText $80,129  ; "Goliath!!!{W1}"
                nextSingleText $0,128   ; "I'm here!  I'm coming!{W1}"
                setPos 128,17,14,UP
                setCamDest 12,4
                entityActionsWait 128
                 moveUp 2
                endActions
                stepEvent 17,11
                entityActionsWait 128
                 moveUp 3
                endActions
                nextSingleText $0,128   ; "Yes, Mr. Creed?{W1}"
                nextSingleText $80,129  ; "My collection is rather noisy{N}today.{W1}"
                csWait 10
                shiver 128
                nextSingleText $0,128   ; "Oh, yes...ah...{W1}"
                nextSingleText $80,129  ; "What?{W1}"
                headshake 128
                nextSingleText $0,128   ; "No, I...I added to your{N}collection today.{W1}"
                customActscriptWait 129
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveDown 1
                endActions
                nextSingleText $80,129  ; "You did what?!{W1}"
                setQuake 3
                shiver 128
                setQuake 0
                shiver 128
                nextText $0,128         ; "I'm sorry!{W2}"
                nextSingleText $0,128   ; "I tried to stop them, but they{N}jumped through the magic door.{W1}"
                nextText $80,129        ; "You didn't lock the door, did{N}you?{W2}"
                nextSingleText $80,129  ; "I told you to always lock{N}that door!{W1}"
                setQuake 3
                shiver 128
                setQuake 0
                shiver 128
                csWait 20
                setFacing 129,UP
                csWait 30
                customActscriptWait 129
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveUp 1
                endActions
                csWait 20
                setFacing 129,DOWN
                nextSingleText $80,129  ; "Anyway, I want to see them.{W1}"
                nod 128
                nextSingleText $0,128   ; "Right away, sir!{W1}"
                customActscriptWait 128
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveDown 5
                endActions
                setFacing 129,UP
                csWait 120
                setFacing 129,DOWN
                nextSingleText $80,129  ; "What?{W1}"
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 120
                entityActionsWait 129
                 moveDown 1
                 moveLeft 1
                endActions
                csWait 20
                nextSingleText $FF,255  ; "Ah...{W1}"
                csWait 5
                setActscript 129,eas_2xRightLeft
                nextSingleText $80,129  ; "I heard something.{W1}"
                csWait 30
                entityActionsWait 129
                 moveLeft 1
                endActions
                nextSingleText $0,ALLY_PETER ; "Are you Mr. Creed?{W1}"
                setFacing 129,DOWN
                csWait 20
                setActscriptWait 129,eas_Init
                setActscriptWait 129,eas_Jump
                nextText $80,129        ; "Oh, someone from my{N}collection is talking!{W2}"
                nextSingleText $80,129  ; "You must be one of the people{N}Goliath was talking about.{W1}"
                nextText $0,ALLY_PETER  ; "We came to see you.{W2}"
                nextSingleText $0,ALLY_PETER ; "Please return us to our{N}original size.{W1}"
                nextText $80,129        ; "You came to see me?{W2}"
                nextSingleText $80,129  ; "Hmmm...why?{W1}"
                nextSingleText $0,ALLY_PETER ; "Make us bigger.  My neck{N}hurts from looking up at you!{W1}"
                nextSingleText $80,129  ; "Oh, sorry. {W1}"
                customActscriptWait 129
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 129,eas_DeactivateAutoFacing
                entityActionsWait 129
                 moveUp 1
                endActions
                csWait 40
                shiver 129
                csWait 30
                shiver 129
                csWait 20
                nextSingleText $80,129  ; "Abra kadabra!  1-2-3!{W1}"
                flashScreenWhite $4
                csWait 40
                flashScreenWhite $4
                csWait 30
                flashScreenWhite $4
                csWait 20
                flashScreenWhite $4
                csWait 10
                flashScreenWhite $1E
                setPos ALLY_BOWIE,16,9,DOWN
                setActscript ALLY_BOWIE,eas_TwirlGrow
                setPos ALLY_PETER,15,9,DOWN
                setActscript ALLY_PETER,eas_TwirlGrow
                setPos FOLLOWER_B,17,9,DOWN
                setActscript FOLLOWER_B,eas_TwirlGrow
                csWait 60
                csWait 5
                setActscript ALLY_BOWIE,eas_2xRightLeft
                csWait 5
                setActscript ALLY_PETER,eas_2xUpDown
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 120
                setFacing ALLY_PETER,RIGHT
                nextSingleText $0,ALLY_PETER ; "Wow, we're back to normal!{N}I can't believe we were so{N}small!{W1}"
                nod ALLY_BOWIE
                nod ALLY_BOWIE
                setFacing ALLY_BOWIE,RIGHT
                nod FOLLOWER_B
                nod FOLLOWER_B
                nextSingleText $80,129  ; "Now, why did you want to see{N}me?{W1}"
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                nextSingleText $0,ALLY_PETER ; "Oh, yes!{N}We want to know about Zeon!{W1}"
                nextSingleText $0,130   ; "Zeon?{W1}"
                setPos 130,16,0,DOWN
                entityActionsWait 130
                 moveDown 7
                endActions
                nextSingleText $0,130   ; "You said Zeon?{W1}"
                nextSingleText $80,129  ; "The King of the Devils who is{N}sealed in Arc Valley?{W1}"
                entityActionsWait 130
                 moveDown 1
                endActions
                nextSingleText $0,130   ; "Did something happen to{N}Zeon?  Has he revived?{W1}"
                nod ALLY_BOWIE
                nextSingleText $FF,255  ; "{LEADER} nods.{W1}"
                csWait 5
                setActscript 130,eas_2xRightLeft
                nextSingleText $0,130   ; "No way!  You're kidding!{N}I can't believe it!{W1}"
                setActscriptWait 129,eas_Init
                entityActionsWait 129
                 moveDown 1
                endActions
                setFacing 130,DOWN
                setFacing 129,RIGHT
                nextSingleText $80,129  ; "Noisy fairy!{N}Be quiet!{W1}"
                setActscriptWait 130,eas_DeactivateAutoFacing
                entityActions 130
                 moveRight 1
                endActions
                entityActionsWait 129
                 moveRight 1
                endActions
                setFacing 129,DOWN
                nextSingleText $80,129  ; "Is what you say true?{W1}"
                nod ALLY_BOWIE
                nextSingleText $FF,255  ; "{LEADER} nods again.{W1}"
                customActscriptWait 129
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveUp 1
                endActions
                nextSingleText $80,129  ; "So, Zeon will appear again....{N}He will destroy everything.{W1}"
                setFacing 129,DOWN
                entityActionsWait 128
                 moveUp 4
                 moveRight 1
                 moveUp 3
                endActions
                setFacing 128,LEFT
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                nextSingleText $0,128   ; "Sir, the new additions to{N}your collection are missing!{W1}"
                setFacing 130,UP
                setFacing 129,RIGHT
                nextSingleText $0,129   ; "I know.{W1}"
                setFacing 129,DOWN
                entityActionsWait 128
                 moveLeft 1
                endActions
                nextSingleText $0,128   ; "How...?{W1}"
                setFacing 129,RIGHT
                shiver 129
                nextSingleText $0,129   ; "It doesn't matter how!{N}Now, go away!{W1}"
                setQuake 4
                shiver 128
                setQuake 0
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                entityActionsWait 128
                 moveRight 1
                 moveDown 2
                endActions
                csWait 20
                setActscriptWait 130,eas_InitSlow
                entityActionsWait 130
                 moveUp 1
                endActions
                setFacing 130,LEFT
                nextSingleText $0,130   ; "Wow!  I can't believe this{N}is happening!{W1}"
                setFacing 129,RIGHT
                nextText $0,129         ; "You know, Grans Island is{N}covered by a dark cloud.{W2}"
                nextText $0,129         ; "At the same time, North{N}Parmecia has had no rain.{W2}"
                nextSingleText $0,129   ; "South Parmecia is OK, but....{W1}"
                nextText $0,130         ; "That's because of Volcanon.{W2}"
                nextSingleText $0,130   ; "I fear for Mitula....{W1}"
                nextText $0,129         ; "Volcanon and Mitula are{N}invulnerable to everything, {N}except Zeon!{W2}"
                nextSingleText $0,129   ; "Indeed...Zeon is extremely{N}powerful!{W1}"
                setFacing 128,UP
                shiver 128
                setActscriptWait 128,eas_DeactivateAutoFacing
                customActscriptWait 128
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 128
                 moveDown 1
                endActions
                nextSingleText $0,128   ; "Zeon?  Oh, gosh!{W1}"
                setFacing 129,DOWN
                nextSingleText $0,129   ; "Goliath!  What are you still{N}doing here?!{W1}"
                setQuake 4
                setActscriptWait 128,eas_Init
                entityActionsWait 128
                 moveLeft 1
                endActions
                setFacing 128,UP
                setQuake 0
                nextText $80,129        ; "I have no time to scold you{N}now!{W2}"
                setFacing 129,LEFT
                nextSingleText $80,129  ; "The Evil Spirit may know{N}something.{W1}"
                setActscriptWait 129,eas_Init
                entityActionsWait 129
                 moveLeft 3
                 moveUp 2
                 moveLeft 4
                endActions
                hide 129
                setActscriptWait 130,eas_InitSlow
                entityActionsWait 130
                 moveLeft 1
                 moveDown 1
                endActions
                nextSingleText $0,130   ; "You guys, follow him.{N}Follow him!{W1}"
                entityActionsWait 130
                 moveUp 1
                 moveLeft 3
                 moveUp 2
                 moveLeft 4
                endActions
                hide 130
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                csc_end
cs_5B466:       textCursor 1932
                setCamDest 12,15
                csWait 20
                setFacing ALLY_PETER,UP
                setFacing ALLY_BOWIE,UP
                shiver FOLLOWER_B
                csWait 20
                nextSingleText $0,ALLY_PETER ; "Oddler?{W1}"
                nextSingleText $0,129   ; "I understand you.{W1}"
                setFacing FOLLOWER_B,UP
                setFacing 130,UP
                setPos 129,17,15,DOWN
                setCamDest 12,7
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait 130,eas_Init
                setPos ALLY_BOWIE,15,23,UP
                setPos ALLY_PETER,15,22,UP
                setPos FOLLOWER_B,16,22,UP
                setPos 130,16,23,UP
                hide ALLY_ERIC
                hide ALLY_RANDOLF
                hide ALLY_TYRIN
                hide ALLY_KARNA
                setCameraEntity 129
                entityActionsWait 129
                 moveDown 2
                 moveLeft 2
                 moveDown 4
                endActions
                setCamDest 10,18
                nextSingleText $0,ALLY_PETER ; "Understand what?{W1}"
                nextText $0,129         ; "Oddler will remain here.{W2}"
                entityActionsWait 129
                 moveRight 1
                 faceDown 1
                endActions
                nextSingleText $0,129   ; "Won't you, Oddler?{W1}"
                setFacing ALLY_PETER,RIGHT
                setFacing FOLLOWER_B,LEFT
                nextSingleText $0,ALLY_PETER ; "Oddler, is this true?{W1}"
                nextText $80,FOLLOWER_B ; "I don't know why, but I{N}would like to stay.{W2}"
                nextSingleText $80,FOLLOWER_B ; "No, I must stay here....{N}I must stay here....{W1}"
                entityActionsWait 129
                 moveLeft 1
                 faceDown 1
                endActions
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                nextText $0,129         ; "He's weak.{W2}"
                nextSingleText $0,129   ; "He had better stay.{N}Say farewell.{W1}"
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                setFacing FOLLOWER_B,LEFT
                setFacing 129,RIGHT
                csWait 60
                nod 129
                csWait 30
                entityActionsWait 129
                 moveLeft 1
                 faceDown 1
                endActions
                entityActionsWait FOLLOWER_B
                 moveLeft 1
                 faceDown 1
                endActions
                nextText $80,FOLLOWER_B ; "It was great travelling with{N}you {LEADER}.{W2}"
                nextSingleText $80,FOLLOWER_B ; "Thank you.  Please be{N}careful.{W1}"
                nod FOLLOWER_B
                csWait 30
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                csWait 70
                setFacing FOLLOWER_B,DOWN
                csWait 50
                setFacing FOLLOWER_B,UP
                csWait 30
                entityActionsWait FOLLOWER_B
                 moveUp 3
                endActions
                hide FOLLOWER_B
                entityActionsWait 129
                 moveRight 1
                 faceDown 1
                endActions
                nextText $0,129         ; "{LEADER}, you'll learn{N}the reason why he has to stay{N}here soon enough.{W2}"
                nextSingleText $0,129   ; "Don't think about it now.{N}Go to the north.{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity 130,ALLY_PETER,2
                csc_end
