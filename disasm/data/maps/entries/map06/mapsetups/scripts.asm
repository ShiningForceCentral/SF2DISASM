
; ASM FILE data\maps\entries\map06\mapsetups\scripts.asm :
; 0x54E86..0x5537E : 
cs_54E86:       textCursor 1066
                setCameraEntity 139
                nextSingleText $0,139   ; "A strange animal?{N}Really?{W1}"
                nextSingleText $0,138   ; "Yeah!  It's a very big bird!{W1}"
                csWait 30
                setFacing 139,DOWN
                csWait 50
                setFacing 139,LEFT
                nextText $0,139         ; "People are surrounding the{N}bird.  Should we talk to it?{W2}"
                nextText $0,139         ; "It would be a good{N}opportunity.{W2}"
                nextSingleText $0,139   ; "I'll go see the bird!{N}You tell the King about it!{W1}"
                entityActionsWait 139
                 moveDown 3
                 moveRight 4
                 moveDown 8
                endActions
                csWait 20
                setActscriptWait 139,eas_Jump
                csWait 20
                setFacing 139,RIGHT
                csWait 20
                setActscriptWait 139,eas_Jump
                setFacing 139,DOWN
                csWait 30
                csWait 5
                setActscript 139,eas_2xRightLeft
                csWait 60
                entityActionsWait 139
                 moveLeft 1
                 moveDown 2
                endActions
                setFacing 139,RIGHT
                setPos ALLY_BOWIE,10,9,DOWN
                setCameraEntity 138
                entityActionsWait 138
                 moveUp 1
                endActions
                nextText $0,138         ; "Oh, {LEADER}.{N}Good timing.{W2}"
                nextText $0,138         ; "There's a strange animal in{N}town.{W2}"
                nextSingleText $0,138   ; "It's very exciting!{W1}"
                setCameraEntity ALLY_BOWIE
                entityActionsWait 138
                 moveRight 1
                 moveUp 7
                endActions
                hide 138
                csc_end
cs_54F26:       textCursor 1074
                customActscriptWait ALLY_PETER
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 136
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 137
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 140
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                setCameraEntity 136
                setFacing 136,LEFT
                nextSingleText $0,136   ; "Oooo...it's big!{N}I want to touch him!{W1}"
                setFacing 136,RIGHT
                csWait 30
                entityActions 136
                 moveRight 1
                endActions
                csWait 8
                entityActionsWait ALLY_PETER
                 moveRight 1
                endActions
                csWait 30
                setFacing 136,DOWN
                nextSingleText $0,136   ; "Ooops!{W1}"
                setCameraEntity 137
                nextSingleText $0,137   ; "Ha, ha!  You missed.{N}Let me try.{W1}"
                setActscriptWait ALLY_PETER,eas_Init
                customActscriptWait ALLY_PETER
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 137
                 moveLeft 1
                endActions
                csWait 8
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                setFacing 137,DOWN
                nextText $0,137         ; "Wow, he's fast!{W2}"
                nextSingleText $0,137   ; "Hey, he's over there!{W1}"
                setCameraEntity 140
                nextSingleText $0,140   ; "OK, my turn!{W1}"
                entityActions 140
                 moveUp 1
                endActions
                csWait 8
                entityActionsWait ALLY_PETER
                 moveLeft 1
                 moveDownLeft 1
                endActions
                setFacing 136,RIGHT
                setFacing 137,LEFT
                nextSingleText $0,140   ; "Gosh, he's quick!{W1}"
                setCameraEntity ALLY_PETER
                setFacing ALLY_PETER,UP
                csWait 30
                setFacing ALLY_PETER,RIGHT
                csWait 30
                nextSingleText $0,ALLY_PETER ; "Stop!  Stop this!{W1}"
                setActscript 136,eas_Jump
                setActscript 137,eas_Jump
                setActscriptWait 140,eas_Jump
                setFacing 136,DOWN
                setFacing 137,LEFT
                setFacing 140,LEFT
                csWait 30
                nextSingleText $0,140   ; "Amazing!  He speaks!{W1}"
                nextText $0,ALLY_PETER  ; "Of course I do.{W2}"
                nextSingleText $0,ALLY_PETER ; "Is this how you greet{N}strangers?{W1}"
                entityActionsWait 137
                 moveDown 1
                 moveLeft 1
                endActions
                nextSingleText $0,136   ; "Shut up, bird!{W1}"
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                nextText $0,ALLY_PETER  ; "How barbaric!{W2}"
                nextSingleText $0,ALLY_PETER ; "I didn't know humans were{N}so impolite.{W1}"
                setFacing 136,RIGHT
                setFacing 137,DOWN
                setFacing 140,UP
                nextSingleText $0,137   ; "What?{W1}"
                setFacing ALLY_PETER,RIGHT
                setFacing 136,DOWN
                setFacing 137,LEFT
                setFacing 140,LEFT
                nextSingleText $FF,255  ; "Those boys are about to{N}hit the bird.{W1}"
                entityActions 136
                 moveDown 1
                endActions
                entityActions 137
                 moveLeft 1
                endActions
                entityActions 140
                 moveLeft 1
                endActions
                csWait 5
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait ALLY_PETER,eas_JumpLeft
                nextSingleText $0,144   ; "Stop!{W1}"
                setQuake 3
                csWait 40
                setFacing ALLY_PETER,UP
                setFacing 136,UP
                setFacing 137,UP
                setFacing 140,UP
                setFacing ALLY_BOWIE,UP
                setFacing 128,UP
                setFacing 130,UP
                setFacing 131,UP
                setFacing 132,UP
                setFacing 133,UP
                setFacing 134,UP
                setFacing 135,UP
                setFacing 139,UP
                setFacing 141,UP
                setQuake 0
                setPos 144,16,17,DOWN
                setPos 145,15,16,DOWN
                setPos 146,16,16,DOWN
                setCameraEntity 144
                csWait 60
                entityActions 144
                 moveDown 3
                endActions
                entityActions 145
                 moveDown 3
                endActions
                entityActionsWait 146
                 moveDown 3
                 moveRight 1
                endActions
                setFacing 146,DOWN
                nextSingleText $0,144   ; "What do you think you're{N}doing?{W1}"
                entityActions 136
                 moveUp 2
                 moveRight 2
                endActions
                entityActions 137
                 moveUp 2
                 moveRight 2
                endActions
                entityActionsWait 140
                 moveUp 2
                 moveRight 2
                endActions
                setFacing 136,UP
                setFacing 137,UP
                setFacing 140,UP
                setCamDest 12,21
                entityActionsWait 144
                 moveDown 2
                endActions
                entityActionsWait 130
                 moveDown 1
                 moveRight 1
                endActions
                setFacing 136,LEFT
                setFacing 137,LEFT
                setFacing 140,LEFT
                setFacing ALLY_BOWIE,LEFT
                setFacing 128,LEFT
                setFacing 130,DOWN
                setFacing 131,DOWN
                setFacing 132,DOWN
                setFacing 133,DOWN
                setFacing 134,DOWN
                setFacing 135,RIGHT
                setFacing 139,RIGHT
                setFacing 141,RIGHT
                entityActionsWait 144
                 moveDown 4
                endActions
                nextText $0,144         ; "I'm sorry.  I must apologize{N}for their actions.{W2}"
                nextText $0,144         ; "Welcome to Granseal.{N}I am the Minister.{W2}"
                nextSingleText $0,144   ; "We just settled here.{N}We're strangers here.{W1}"
                nextText $0,ALLY_PETER  ; "Ha, ha!  You're right.{W2}"
                nextSingleText $0,ALLY_PETER ; "But, I'm very happy to meet{N}a man like you!{W1}"
                nextText $0,144         ; "Please stay here as long{N}as you like.{W2}"
                nextSingleText $0,144   ; "Let me introduce you to{N}King Granseal.{N}Follow me, please.{W1}"
                csWait 40
                setCameraEntity ALLY_PETER
                entityActions 144
                 moveUp 8
                endActions
                entityActionsWait ALLY_PETER
                 moveUp 8
                endActions
                setFacing 145,RIGHT
                setFacing 146,LEFT
                csWait 30
                setCameraEntity 65535
                entityActions 144
                 moveLeft 1
                 moveUp 5
                endActions
                entityActions ALLY_PETER
                 moveLeft 1
                 moveUp 5
                endActions
                entityActions 145
                 moveLeft 1
                 moveUp 5
                endActions
                entityActionsWait 146
                 moveLeft 1
                 moveUp 2
                 moveLeft 1
                 moveUp 3
                endActions
                hide 144
                hide 145
                hide 146
                hide ALLY_PETER
                entityActionsWait 130
                 moveLeft 1
                endActions
                setFacing 130,DOWN
                csc_end
cs_55242:       textCursor 1123
                newEntity 142,11,0,DOWN,MAPSPRITE_SOLDIER1
                customActscriptWait 142
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 142
                 moveDown 7
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                nextText $0,142         ; "Welcome back, {LEADER}!{N}I heard your journey was{N}hard.{W2}"
                nextText $0,142         ; "Sir Astral was right.{N}He said, you were coming{N}back soon.{W2}"
                nextSingleText $0,142   ; "I'll go to the castle and tell{N}everyone!{W1}"
                entityActionsWait 142
                 moveUp 7
                endActions
                hide 142
                csc_end
cs_55288:       textCursor 1126
                newEntity ALLY_JANET,16,22,DOWN,ALLY_JANET
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                nextSingleText $0,ALLY_JANET ; "I finally found you.{N}You're {LEADER}, right?{W1}"
                setActscript ALLY_BOWIE,eas_Jump
                setActscript FOLLOWER_B,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                setFacing 139,UP
                setCamDest 14,17
                setDest ALLY_BOWIE,19,28
                setDest FOLLOWER_B,20,28
                setDest ALLY_PETER,20,27
                setFacing ALLY_BOWIE,UP
                setFacing FOLLOWER_B,UP
                setFacing ALLY_PETER,UP
                entityActionsWait ALLY_JANET
                 moveDown 2
                 moveRight 3
                 moveDown 1
                endActions
                setCamDest 14,22
                setFacing FOLLOWER_B,LEFT
                nextSingleText $C0,FOLLOWER_B ; "Who are you?{W1}"
                setFacing FOLLOWER_B,UP
                nextSingleText $0,ALLY_JANET ; "My love, I mean{N}{NAME;13} is with you.{N}Am I right?{W1}"
                nextSingleText $C0,ALLY_PETER ; "Yes, he joined us willingly.{W1}"
                headshake ALLY_JANET
                nextText $0,ALLY_JANET  ; "No, no.  I don't want to stop{N}him, but...{N}I want to be with him!{W2}"
                nextSingleText $0,ALLY_JANET ; "Please take me with you.{N}Please!{W1}"
                setFacing ALLY_PETER,DOWN
                csWait 50
                entityActionsWait ALLY_PETER
                 moveRight 1
                 moveDown 1
                endActions
                setFacing ALLY_PETER,UP
                nextSingleText $C0,FOLLOWER_B ; "This is not a sightseeing{N}trip, if you know what I{N}mean?{W1}"
                entityActionsWait ALLY_JANET
                 moveDown 1
                endActions
                nextSingleText $0,ALLY_JANET ; "Yes, I know.{N}I still want to go!{W1}"
                setFacing ALLY_BOWIE,RIGHT
                setFacing FOLLOWER_B,LEFT
                nextSingleText $C0,FOLLOWER_B ; "OK, you look tough enough,{N}anyway.{W1}"
                nod ALLY_BOWIE
                setFacing ALLY_BOWIE,UP
                setFacing FOLLOWER_B,UP
                nextSingleText $0,ALLY_JANET ; "Oh, really?{N}Thank you very much!{W1}"
                join ALLY_JANET
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                followEntity ALLY_JANET,FOLLOWER_B,2
                csc_end
