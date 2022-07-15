
; ASM FILE data\maps\entries\map10\mapsetups\scripts.asm :
; 0x570B0..0x579CA : 
cs_570B0:       textCursor 1616
                reloadMap 6,19
                setPos ALLY_BOWIE,11,25,UP
                setPos ALLY_PETER,11,26,UP
                setPos 150,10,21,RIGHT
                setPos 151,13,21,LEFT
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait ALLY_BOWIE,eas_Init
                customActscriptWait 150
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 151
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                fadeInB
                csWait 30
                entityActionsWait 150
                 moveRight 1
                 faceDown 1
                endActions
                nextSingleText $0,150   ; "Who are you?{W1}"
                entityActionsWait 151
                 moveLeft 1
                 faceDown 1
                endActions
                nextSingleText $0,151   ; "Bedoe is only for birdmen!{W1}"
                entityActionsWait ALLY_PETER
                 moveRight 1
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "Don't be so uppity!{W1}"
                setActscript 150,eas_Jump
                setActscriptWait 151,eas_Jump
                setActscript 150,eas_Jump
                setActscriptWait 151,eas_Jump
                csWait 30
                entityActionsWait 150
                 moveDown 1
                endActions
                nextSingleText $0,150   ; "Oh, you're...{W1}"
                entityActionsWait 151
                 moveDown 1
                endActions
                nextText $0,151         ; "Sir {NAME;7}!{N}Sorry, Sir {NAME;7}!{W2}"
                nextSingleText $0,151   ; "Welcome back!{N}Volcanon is waiting!{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                csWait 30
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 120
                entityActionsWait ALLY_PETER
                 moveRight 2
                endActions
                nextSingleText $0,ALLY_PETER ; "That's strange...{W2}"
                entityActionsWait ALLY_PETER
                 moveLeft 4
                endActions
                nextSingleText $0,ALLY_PETER ; "I just realized...{N}Why are you flying guard?{W2}"
                entityActionsWait ALLY_PETER
                 moveRight 2
                 faceUp 10
                endActions
                nextSingleText $0,ALLY_PETER ; "Did something happen?{W1}"
                nextSingleText $0,151   ; "Well, the devils invaded{N}recently.{W1}"
                customActscriptWait ALLY_PETER
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "Devils?{W1}"
                entityActionsWait 150
                 moveDown 1
                 faceRight 1
                endActions
                setFacing ALLY_PETER,LEFT
                nextText $0,150         ; "Yes, the Devil Army.{W2}"
                nextText $0,150         ; "Strong greater devils broke{N}Volcanon's sacred barrier.{W2}"
                nextSingleText $0,150   ; "But don't worry, Volcanon{N}defeated all the devils.{W1}"
                setActscriptWait ALLY_PETER,eas_Init
                entityActionsWait ALLY_PETER
                 moveDown 2
                 faceLeft 1
                endActions
                setFacing ALLY_BOWIE,RIGHT
                nextSingleText $0,ALLY_PETER ; "The devils we fought must{N}have been part of that army!{W1}"
                setFacing 150,DOWN
                entityActionsWait 151
                 moveDown 1
                endActions
                nextSingleText $0,150   ; "You met some other devils?{W1}"
                setFacing 150,RIGHT
                setFacing 151,LEFT
                nod 150
                nod 151
                setFacing 150,DOWN
                setFacing 151,DOWN
                customActscriptWait 150
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 151
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 150,eas_DeactivateAutoFacing
                setActscriptWait 151,eas_DeactivateAutoFacing
                entityActions 150
                 moveUp 1
                endActions
                entityActionsWait 151
                 moveUp 1
                endActions
                customActscriptWait 150
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 151
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 150
                 moveLeft 1
                 moveDown 5
                endActions
                entityActions 151
                 moveRight 1
                 moveDown 5
                endActions
                csWait 30
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_PETER,DOWN
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                nextText $0,ALLY_PETER  ; "Stop, stop!{W2}"
                setFacing 150,RIGHT
                setFacing 151,LEFT
                nextSingleText $0,ALLY_PETER ; "We already defeated them.{W1}"
                nod ALLY_BOWIE
                setCamDest 6,22
                customActscriptWait 150
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 151
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 150
                 moveDown 1
                endActions
                entityActionsWait 151
                 moveDown 1
                endActions
                setActscriptWait 150,eas_Init
                setActscriptWait 151,eas_Init
                entityActionsWait 150
                 moveRight 1
                 faceUp 1
                endActions
                nextSingleText $0,150   ; "That's great!  But...{W2}"
                entityActionsWait 151
                 moveLeft 1
                 faceUp 1
                endActions
                nextSingleText $0,151   ; "We'll go and make sure...{W1}"
                setFacing 150,RIGHT
                setFacing 151,LEFT
                nextSingleText $0,150   ; "Just in case.{W1}"
                nod 151
                setFacing 150,UP
                setFacing 151,UP
                nextText $0,151         ; "We're going to Polca Village{N}to patrol.{W2}"
                nextSingleText $0,151   ; "{NAME;7}, please see{N}King Bedoe.{W1}"
                setFacing 150,DOWN
                setFacing 151,DOWN
                customActscriptWait 150
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 151
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 150,eas_DeactivateAutoFacing
                setActscriptWait 151,eas_DeactivateAutoFacing
                entityActions 150
                 moveUp 1
                endActions
                entityActionsWait 151
                 moveUp 1
                endActions
                csWait 50
                customActscriptWait 150
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 151
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 150
                 moveDown 5
                endActions
                entityActionsWait 151
                 moveDown 5
                endActions
                csWait 40
                setFacing ALLY_PETER,LEFT
                setFacing ALLY_BOWIE,RIGHT
                nextText $0,ALLY_PETER  ; "{LEADER}, let's go.{W2}"
                nextSingleText $0,ALLY_PETER ; "I'll introduce you to{N}King Bedoe.{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                setPos 150,34,51,UP
                setPos 151,35,51,UP
                csc_end
cs_573EC:       textCursor 1641
                setCamDest 31,47
                nextText $0,148         ; "Yes, the greater devil was{N}very strong.{W1}"
                nextSingleText $0,148   ; "But, God Volcanon swept{N}away all the devils.{W1}"
                nextSingleText $0,147   ; "What about the greater{N}devil?{W1}"
                entityActionsWait 148
                 moveLeft 1
                 faceUp 1
                endActions
                nextSingleText $0,148   ; "He fled.{W1}"
                nextText $0,147         ; "Can't you track him?{W2}"
                nextSingleText $0,147   ; "We must capture him before{N}he regains his strength.{W1}"
                nextSingleText $0,148   ; "Did they come from Grans{N}Island?{W1}"
                nod 147
                nextText $0,147         ; "I think so.{W2}"
                nextText $0,147         ; "Maybe he died.{N}But beware of another attack.{W2}"
                csWait 10
                setFacing 148,DOWN
                nextSingleText $0,147   ; "Watch carefully!{W1}"
                csWait 40
                entityActions 150
                 moveDown 1
                 moveLeft 3
                 moveDown 3
                endActions
                entityActions 152
                 moveDown 1
                 moveRight 5
                endActions
                entityActions 153
                 moveRight 2
                 moveDown 3
                endActions
                entityActions 154
                 moveRight 1
                 moveDown 3
                endActions
                entityActions 155
                 moveRight 2
                 moveDown 3
                endActions
                entityActions 156
                 moveRight 2
                 moveDown 3
                endActions
                entityActionsWait 151
                 moveDown 1
                 moveLeft 4
                 moveDown 3
                endActions
                hide 150
                hide 151
                hide 152
                hide 153
                hide 154
                hide 155
                hide 156
                entityActionsWait 148
                 moveRight 1
                 faceDown 1
                endActions
                csc_end
cs_574A6:       textCursor 1651
                setCamDest 34,47
                entityActionsWait ALLY_LUKE
                 moveDown 1
                 faceLeft 1
                endActions
                setActscriptWait ALLY_LUKE,eas_Jump
                setActscriptWait ALLY_LUKE,eas_Jump
                nextSingleText $80,ALLY_LUKE ; "{NAME;7}, {NAME;7}!{W1}"
                setPos ALLY_PETER,33,52,RIGHT
                setPos ALLY_BOWIE,33,53,RIGHT
                setCamDest 31,47
                entityActionsWait ALLY_PETER
                 moveRight 3
                endActions
                nextText $0,ALLY_PETER  ; "{NAME;10}, how have you been?{W2}"
                setFacing ALLY_PETER,UP
                nextSingleText $0,ALLY_PETER ; "King Bedoe, you look well.{W1}"
                customActscriptWait 147
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 147
                 moveDown 1
                endActions
                nextSingleText $80,147  ; "{NAME;7}, my friend, how{N}was your journey?{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                csWait 30
                nod ALLY_PETER
                csWait 20
                setFacing ALLY_PETER,LEFT
                csWait 30
                setFacing ALLY_PETER,UP
                nextSingleText $0,ALLY_PETER ; "Let me introduce my friend.{W1}"
                entityActionsWait ALLY_PETER
                 moveDown 2
                 moveLeft 2
                endActions
                csWait 40
                nod ALLY_BOWIE
                entityActions ALLY_PETER
                 moveRight 3
                 faceUp 1
                endActions
                entityActionsWait ALLY_BOWIE
                 moveRight 3
                 faceUp 1
                endActions
                nod ALLY_BOWIE
                nextSingleText $0,ALLY_PETER ; "This is {LEADER}.{N}He's from Grans and...{W1}"
                entityActionsWait ALLY_LUKE
                 moveDown 1
                 faceLeft 1
                endActions
                setFacing ALLY_PETER,RIGHT
                setFacing ALLY_BOWIE,RIGHT
                nextSingleText $80,ALLY_LUKE ; "I know.  He is a pupil of{N}Astral of Granseal.{W1}"
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                nextSingleText $0,ALLY_PETER ; "How do you know that?{W1}"
                nextSingleText $80,ALLY_LUKE ; "Sir Astral told me.{W1}"
                nextSingleText $0,ALLY_PETER ; "What?!  Did you go to{N}Granseal?{W1}"
                nod ALLY_LUKE
                nextSingleText $80,ALLY_LUKE ; "As Volcanon's messenger.{W1}"
                entityActionsWait 147
                 moveDown 1
                endActions
                setFacing ALLY_LUKE,UP
                setFacing ALLY_PETER,UP
                setFacing ALLY_BOWIE,UP
                nextText $80,147        ; "And I heard that somebody{N}unsealed Zeon.{W2}"
                nextText $80,147        ; "Grans people caused a big,{N}big problem.{W2}"
                customActscriptWait 147
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 147
                 moveUp 2
                 faceDown 1
                endActions
                nextSingleText $80,147  ; "Zeon might destroy the{N}world...{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                 moveLeft 1
                 faceUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "Sorry to interrupt, but is{N}he that strong?{W1}"
                nextSingleText $80,147  ; "Zeon is King of the Devils.{W1}"
                entityActionsWait 148
                 moveDown 1
                endActions
                nextText $0,148         ; "{NAME;7}, you had better{N}go see Volcanon.{W2}"
                nextSingleText $0,148   ; "It may calm him down to see{N}{NAME;7}.{W1}"
                nextSingleText $0,ALLY_PETER ; "Oh, is he angry?{N}Maybe later...{W1}"
                entityActionsWait ALLY_LUKE
                 moveUp 1
                 moveLeft 1
                endActions
                setFacing ALLY_PETER,RIGHT
                nextSingleText $80,ALLY_LUKE ; "Never mind later.{N}He has been waiting for you.{W1}"
                nextText $0,ALLY_PETER  ; "Oh, yeah?  OK, I'm going.{W2}"
                setFacing ALLY_PETER,DOWN
                nextSingleText $0,ALLY_PETER ; "{LEADER}, follow me.{W1}"
                setActscriptWait 147,eas_Init
                entityActionsWait 147
                 moveDown 1
                endActions
                nextSingleText $80,147  ; "{NAME;7}, are you taking{N}{LEADER} with you?{W1}"
                setFacing ALLY_PETER,UP
                setFacing ALLY_LUKE,UP
                nextSingleText $0,ALLY_PETER ; "Of course.  Why not?{W1}"
                nextSingleText $80,147  ; "He thinks the people of{N}Granseal are...{W1}"
                entityActionsWait 148
                 moveLeft 1
                 faceUp 1
                endActions
                nextText $0,148         ; "King Bedoe, I think{N}{LEADER} has to see{N}Volcanon.{W2}"
                nextSingleText $0,148   ; "He should talk to him.{W1}"
                nod 147
                nextSingleText $80,147  ; "Hmmm...you're right.{N}{NAME;7}, go ahead.{W1}"
                setFacing 148,DOWN
                setFacing ALLY_LUKE,DOWN
                setFacing ALLY_PETER,DOWN
                nextSingleText $0,ALLY_PETER ; "OK.{N}Anyway, let's go.{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                csc_end
cs_5766C:       textCursor 1680
                setCameraEntity 153
                nextText $0,153         ; "I had a dream last night.{N}I flew!{W2}"
                nextSingleText $0,153   ; "Watch!  I can fly!{W1}"
                setFacing 153,RIGHT
                csWait 40
                nod 153
                entityActionsWait 153
                 jumpRight 1
                endActions
                setSprite 153,MAPSPRITE_CHICK_FLYING
                setActscriptWait 153,eas_DeactivateAutoFacing
                customActscriptWait 153
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 153
                 moveUp 1
                endActions
                customActscriptWait 153
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound SFX_FALLING
                entityActionsWait 153
                 moveDown 6
                endActions
                setSprite 153,MAPSPRITE_CHICK
                nextSingleText $0,153   ; "Hmmm...strange...{W1}"
                setActscriptWait 153,eas_Init
                entityActionsWait 153
                 moveLeft 2
                 faceUp 1
                endActions
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_PETER,DOWN
                nextText $0,153         ; "That didn't work.  Hee, hee.{W2}"
                nextSingleText $0,153   ; "Stay there.{N}I know I can fly!{W1}"
                setFacing 153,RIGHT
                csWait 40
                nod 153
                cameraSpeed $40
                entityActionsWait 153
                 moveRight 1
                 jumpRight 1
                endActions
                setSprite 153,MAPSPRITE_CHICK_FLYING
                setActscriptWait 153,eas_DeactivateAutoFacing
                entityActionsWait 153
                 moveDown 1
                endActions
                customActscriptWait 153
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 153
                 moveUp 1
                endActions
                customActscriptWait 153
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound SFX_FALLING
                entityActionsWait 153
                 moveDown 8
                endActions
                setActscript 153,eas_CounterClockwiseMoveUpRight
                startEntity 153
                csWait 12
                cameraSpeed $20
                setActscriptWait 153,eas_InitSlow
                entityActionsWait 153
                 moveUp 2
                 moveRight 1
                 moveUp 11
                endActions
                setFacing 153,LEFT
                setSprite 153,MAPSPRITE_CHICK
                setFacing ALLY_BOWIE,RIGHT
                setFacing ALLY_PETER,RIGHT
                nextSingleText $0,153   ; "See.  I told you!{N}I can fly...sort of.{W1}"
                csc_end
cs_5779C:       textCursor 1686
                setPos 153,6,10,DOWN
                setFacing 152,UP
                setCamDest 1,5
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_BOWIE,5,22,DOWN
                setPos ALLY_PETER,11,22,UP
                entityActions ALLY_PETER
                 eaWait 60
                 moveLeft 4
                endActions
                setFacing ALLY_BOWIE,UP
                setActscriptWait 153,eas_46198
                setActscriptWait 153,eas_DeactivateAutoFacing
                playSound SFX_JUMP
                entityActionsWait 153
                 moveUp 2
                 faceUp 5
                 moveDown 2
                endActions
                nextSingleText $0,153   ; "Ha, ha, ha!{W1}"
                csWait 40
                playSound SFX_JUMP
                entityActionsWait 153
                 moveUp 2
                 faceUp 5
                 moveDown 2
                endActions
                nextSingleText $0,153   ; "Ha, ha, ha!{W1}"
                csWait 40
                playSound SFX_JUMP
                entityActionsWait 153
                 moveUp 2
                 faceUp 5
                 moveDown 1
                endActions
                setActscriptWait 153,eas_Init
                entityActionsWait 153
                 jumpLeft 1
                endActions
                setFacing 153,UP
                setFacing 152,LEFT
                setCameraEntity 153
                cameraSpeed $30
                nextSingleText $0,152   ; "Oh my, {NAME;20}!{W1}"
                setPriority ALLY_BOWIE,$0
                setPriority 153,$FFFF
                setActscriptWait 153,eas_DeactivateAutoFacing
                customActscriptWait 153
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound SFX_FALLING
                entityActions 153
                 moveDown 13
                endActions
                setFacing ALLY_PETER,LEFT
                setPriority ALLY_BOWIE,$0
                setPriority 153,$FFFF
                csWait 35
                customActscriptWait 152
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 152
                 moveLeft 1
                 moveDown 11
                endActions
                waitIdle 153
                setQuake 3
                setFacing ALLY_BOWIE,UP
                customActscriptWait ALLY_BOWIE
                 ac_motion OFF          ;   
                 ac_orientDown          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 40
                setQuake 0
                setActscriptWait 153,eas_Init
                setFacing 153,DOWN
                setActscriptWait 153,eas_Jump
                csWait 20
                setActscriptWait 153,eas_Jump
                csWait 20
                setActscriptWait 153,eas_Jump
                csWait 20
                setActscriptWait 153,eas_Jump
                csWait 20
                setFacing 153,UP
                setCameraEntity 65535
                setActscriptWait 152,eas_Jump
                setActscriptWait 152,eas_Jump
                nextSingleText $0,152   ; "Thank you!  Thank you!{N}{NAME;20} is OK.{W1}"
                nod 152
                csWait 30
                setActscriptWait 152,eas_Init
                setActscriptWait 153,eas_Init
                entityActions 152
                 moveRight 8
                endActions
                entityActionsWait 153
                 moveUp 1
                 moveRight 8
                endActions
                hide 152
                setPos 153,16,6,LEFT
                entityActionsWait ALLY_PETER
                 moveLeft 1
                endActions
                csWait 30
                setActscriptWait ALLY_PETER,eas_BumpLeft
                setActscriptWait ALLY_BOWIE,eas_Init
                setFacing ALLY_BOWIE,DOWN
                headshake ALLY_BOWIE
                setPriority ALLY_BOWIE,$FFFF
                followEntity ALLY_PETER,ALLY_BOWIE,2
                csc_end
cs_5797A:       textCursor 1607
                faceEntity ALLY_PETER,147
                nextText $0,147         ; "You're a man of honor!{N}Why don't you go see Creed?{W2}"
                nextText $0,147         ; "He's an ex-greater devil.{N}He may give you some{N}information.{W2}"
                nextText $0,147         ; "You must travel along the{N}river to get to Creed's{N}mansion.{W2}"
                nextSingleText $0,147   ; "Maybe Polca has a raft for{N}you.{W1}"
                setFacing 147,RIGHT
                nextSingleText $0,147   ; "Tell the mayor to prepare a{N}raft.{W1}"
                entityActionsWait ALLY_LUKE
                 moveUp 2
                 faceLeft 1
                endActions
                nextSingleText $0,ALLY_LUKE ; "Yes, sir!{W1}"
                entityActionsWait ALLY_LUKE
                 moveDown 3
                 moveRight 1
                 moveDown 4
                endActions
                hide ALLY_LUKE
                faceEntity 147,ALLY_PETER
                nextText $0,147         ; "{NAME;7}, please{N}help {LEADER}.{W2}"
                nextSingleText $0,147   ; "{LEADER}, good luck!{W1}"
                csc_end
