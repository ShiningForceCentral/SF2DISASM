
; ASM FILE data\maps\entries\map13\mapsetups\scripts.asm :
; 0x58330..0x58E18 : 
cs_58330:       playSound SFX_BIG_DOOR_RUMBLE
                setQuake 6
                flashScreenWhite $5A
                setQuake 0
                csWait 20
                csWait 5
                setActscript ALLY_BOWIE,eas_2xRightLeft
                csWait 5
                setActscript 133,eas_2xUpDown
                csWait 50
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 100
                textCursor 1452
                setPos 140,29,7,LEFT
                customActscriptWait 140
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 140
                 moveLeft 2
                endActions
                customActscriptWait 140
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing ALLY_BOWIE,RIGHT
                setFacing ALLY_PETER,RIGHT
                entityActionsWait 140
                 moveLeft 1
                endActions
                setActscriptWait 140,eas_DeactivateAutoFacing
                customActscriptWait 140
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 140
                 moveDown 1
                endActions
                csWait 2
                setActscriptWait 140,eas_StopMoving
                customActscriptWait 140
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing 133,RIGHT
                csWait 60
                nextSingleText $0,133   ; "Oh!{W1}"
                entityActionsWait 133
                 moveRight 3
                endActions
                setFacing 133,DOWN
                nextSingleText $FF,255  ; "The beastman checks the boy.{W1}"
                nextSingleText $0,133   ; "Good heavens!{N}He's badly injured!{W1}"
                csWait 30
                setFacing 133,RIGHT
                csWait 50
                entityActionsWait 133
                 moveLeft 2
                endActions
                setActscriptWait 133,eas_Jump
                setActscript 133,eas_Jump
                nextSingleText $0,133   ; "Mayor, mayor!{W1}"
                setPos 137,17,7,RIGHT
                setCamDest 13,3
                setPos ALLY_BOWIE,25,9,UP
                setPos ALLY_PETER,25,9,UP
                setCameraEntity 137
                entityActionsWait 137
                 moveRight 5
                 moveUp 1
                endActions
                setFacing 137,RIGHT
                nextSingleText $0,137   ; "What's all this noise?{W1}"
                nextSingleText $0,133   ; "Mayor, a boy from the mountain{N}is seriously injured!{W1}"
                nextSingleText $0,137   ; "What?!{W1}"
                entityActionsWait 137
                 moveDown 1
                 moveRight 3
                endActions
                setFacing 133,RIGHT
                nextText $0,137         ; "Ohhh...his eyes are{N}seriously damaged!{W2}"
                nextSingleText $0,137   ; "He must have been caught{N}in the eruption....{W1}"
                entityActionsWait 133
                 moveRight 3
                 moveDown 1
                endActions
                setFacing 133,LEFT
                nextSingleText $0,133   ; "He needs prompt treatment!{W1}"
                nextSingleText $0,137   ; "Yes!  Bring him into my house!{W1}"
                nod 133
                entityActions 137
                 moveRight 1
                endActions
                entityActions 133
                 moveLeft 1
                endActions
                csWait 3
                setActscriptWait 133,eas_StopMoving
                setActscriptWait 137,eas_StopMoving
                setFacing 137,LEFT
                csWait 30
                entityActions 140
                 moveUp 1
                endActions
                csWait 2
                setActscriptWait 140,eas_StopMoving
                csWait 30
                setCameraEntity 65535
                entityActions 137
                 moveLeft 9
                endActions
                entityActions 140
                 moveLeft 9
                endActions
                entityActionsWait 133
                 moveLeft 9
                endActions
                setActscriptWait 140,eas_Init
                setFacing 137,LEFT
                setFacing 133,UP
                setFacing 140,DOWN
                setActscriptWait ALLY_BOWIE,eas_Init
                followEntity ALLY_PETER,ALLY_BOWIE,2
                reloadEntities ms_map13_flag710_Entities
                csc_end
cs_58512:       customActscriptWait 130
                 ac_entityObstructable OFF ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setCameraEntity 65535
                textCursor 1435
                nextSingleText $0,130   ; "Help!  Help!{N}I can't...get up!{W2}{N}You, please turn me over!{W1}"
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setDest ALLY_PETER,2,12
                setFacing ALLY_PETER,LEFT
                csWait 30
                setActscriptWait ALLY_BOWIE,eas_BumpUp
                csWait 40
                nextSingleText $0,130   ; "Are you a wimp?{N}Push harder!{W1}"
                csWait 10
                nod ALLY_BOWIE
                setActscriptWait ALLY_BOWIE,eas_BumpUp
                setActscriptWait ALLY_BOWIE,eas_BumpUp
                csWait 20
                nextSingleText $0,130   ; "Good, good!{N}Push!{W1}"
                setActscriptWait ALLY_BOWIE,eas_DeactivateAutoFacing
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                endActions
                csWait 30
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                endActions
                setQuake 2
                csWait 30
                setQuake 0
                animEntityFX 130,6
                customActscript 130
                 ac_orientUp            ;   
                 ac_setSprite MAPSPRITE_FAIRY ;   
                 ac_jump eas_Idle       ;   
                ac_end
                animEntityFX 130,7
                csWait 40
                setFacing 130,DOWN
                nextSingleText $0,130   ; "(Giggle)...sorry, I had to{N}test you.{W2}{N}I'm happy to meet you.{N}He must like you.{W2}{N}Oh no, I can't tell you who{N}HE is.{N}See you later!{W1}"
                setActscriptWait 130,eas_InitSlow
                setActscriptWait 130,eas_DeactivateAutoFacing
                entityActionsWait 130
                 moveUp 10
                endActions
                setActscriptWait ALLY_BOWIE,eas_Init
                followEntity ALLY_PETER,ALLY_BOWIE,2
                csc_end
cs_585FE:       playSound $FD
                customActscriptWait 129
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 130
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 131
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 132
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 131,eas_DeactivateAutoFacing
                setActscriptWait 132,eas_DeactivateAutoFacing
                textCursor 1468
                setActscriptWait ALLY_PETER,eas_Init
                nextSingleText $0,128   ; "Bedoe soldiers are cowards!{W1}"
                setCamDest 14,10
                playSound MUSIC_ENEMY_ATTACK
                nextSingleText $0,ALLY_LUKE ; "Be quiet!{W1}"
                entityActionsWait ALLY_LUKE
                 moveRight 1
                endActions
                entityActions 129
                 moveLeft 3
                endActions
                entityActionsWait 130
                 moveLeft 3
                endActions
                entityActions 129
                 moveRight 3
                endActions
                entityActions 130
                 moveRight 3
                endActions
                entityActions 131
                 moveLeft 2
                endActions
                entityActionsWait 132
                 moveLeft 2
                endActions
                setActscript 131,eas_Die
                setActscriptWait 132,eas_Die
                setFacing 129,LEFT
                setFacing 130,LEFT
                setFacing ALLY_LUKE,LEFT
                csWait 40
                nextSingleText $0,ALLY_LUKE ; "My comrades!{W1}"
                csWait 20
                entityActionsWait 128
                 moveLeft 1
                endActions
                setFacing ALLY_LUKE,RIGHT
                nextSingleText $0,128   ; "You're our captive.  Don't{N}force me to kill you.{W1}"
                csWait 5
                setActscript 128,eas_2xUpDown
                csWait 20
                setFacing 128,LEFT
                nextText $0,128         ; "No more funny business, you{N}can't resist us!{W2}"
                setFacing 128,LEFT
                nextSingleText $0,128   ; "Now, give me that injured{N}boy!{W1}"
                entityActions 129
                 moveLeft 1
                endActions
                entityActionsWait 130
                 moveLeft 1
                endActions
                csWait 20
                nextSingleText $0,ALLY_GERHALT ; "Don't listen to him!{W2}"
                csWait 5
                setActscript 128,eas_2xUpDown
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 5
                setActscript 130,eas_2xRightLeft
                setFacing ALLY_LUKE,UP
                csWait 40
                setCamDest 6,6
                nextSingleText $0,ALLY_GERHALT ; "I'll help you fight against{N}the devils and guard Oddler!{W1}"
                setCameraEntity ALLY_GERHALT
                setPos ALLY_BOWIE,20,9,DOWN
                setPos ALLY_PETER,19,8,DOWN
                entityActionsWait ALLY_GERHALT
                 moveDown 3
                 moveRight 6
                endActions
                setActscriptWait ALLY_GERHALT,eas_BumpRight
                csWait 20
                entityActionsWait ALLY_GERHALT
                 moveRight 1
                endActions
                setFacing ALLY_GERHALT,UP
                setCamDest 14,8
                nextSingleText $0,ALLY_GERHALT ; "You!{W1}"
                setFacing 128,UP
                setFacing 129,UP
                setFacing 130,UP
                csWait 40
                setFacing ALLY_GERHALT,RIGHT
                entityActionsWait ALLY_LUKE
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_LUKE ; "Oh, {LEADER}, {NAME;7}!{W1}"
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                nextSingleText $C0,ALLY_PETER ; "{NAME;10}!  Why are you here?{W1}"
                nextText $0,ALLY_LUKE   ; "I came here to get a raft{N}for you.{W2}"
                nextSingleText $0,ALLY_LUKE ; "The people of Polca are{N}being controlled by these{N}devils.  They deceived me!{W1}"
                entityActionsWait ALLY_GERHALT
                 moveRight 1
                endActions
                setFacing ALLY_GERHALT,DOWN
                nextSingleText $0,ALLY_GERHALT ; "Prince {NAME;10}, I'm sorry.{W1}"
                setCameraEntity ALLY_GERHALT
                entityActionsWait ALLY_GERHALT
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_GERHALT ; "Polcans will not fight.{N}Please let me join you!{W1}"
                join ALLY_GERHALT
                setCameraEntity ALLY_LUKE
                nextSingleText $0,ALLY_LUKE ; "Great!{W1}"
                setFacing ALLY_GERHALT,DOWN
                nod ALLY_GERHALT
                entityActionsWait ALLY_LUKE
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_LUKE ; "Don't forget me!{W1}"
                entityActionsWait 129
                 moveUp 1
                 moveLeft 1
                endActions
                setActscriptWait ALLY_LUKE,eas_DeactivateAutoFacing
                customActscriptWait ALLY_LUKE
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_LUKE
                 moveLeft 3
                endActions
                entityActionsWait 129
                 moveRight 1
                 moveDown 1
                endActions
                customActscriptWait ALLY_LUKE
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing 129,LEFT
                csWait 40
                entityActionsWait 128
                 moveLeft 1
                 moveUp 1
                endActions
                nextText $0,128         ; "You still dare to resist us?!{W2}"
                nextSingleText $0,128   ; "For that you shall die!!{W1}"
                setStoryFlag 13         ; Battle 13 unlocked - BATTLE_POLCA_VILLAGE             
                warp MAP_POLCA,0,0,RIGHT
                csc_end
cs_58856:       textCursor 1487
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait ALLY_LUKE,eas_Init
                setFacing 137,DOWN
                csWait 30
                setFacing 137,UP
                csWait 30
                setFacing 137,DOWN
                setActscriptWait 137,eas_Jump
                setActscript 137,eas_Jump
                nextSingleText $0,137   ; "Heeeeee!{W1}"
                shiver 137
                nextSingleText $0,137   ; "I'm sorry!  I'm sorry!{N}Don't possess me!{W1}"
                shiver 137
                setDest ALLY_LUKE,17,4
                setDest ALLY_PETER,17,5
                setFacing ALLY_PETER,UP
                nextSingleText $C0,ALLY_PETER ; "What's he talking about?{W1}"
                setFacing ALLY_LUKE,DOWN
                nextSingleText $0,ALLY_LUKE ; "I don't know...{N}What a loon!{W1}"
                entityActionsWait ALLY_LUKE
                 moveLeft 1
                endActions
                setFacing ALLY_LUKE,UP
                nextSingleText $0,ALLY_LUKE ; "C'mon, mayor.  We're alive!{W1}"
                nextSingleText $0,137   ; "What?!{W1}"
                entityActions ALLY_BOWIE
                 moveDown 1
                endActions
                entityActionsWait 137
                 moveDown 1
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing 137,RIGHT
                setFacing ALLY_LUKE,LEFT
                csWait 30
                nextSingleText $FF,255  ; "The mayor examines {NAME;10}{N}carefully.{W1}"
                csWait 40
                nextSingleText $0,137   ; "You're warm!  You're alive!{W1}"
                setActscriptWait 137,eas_Jump
                setActscriptWait 137,eas_Jump
                csWait 30
                setFacing 137,DOWN
                customActscriptWait 137
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 137,eas_DeactivateAutoFacing
                entityActionsWait 137
                 moveUp 1
                endActions
                nod 137
                nextText $0,137         ; "I really regret all of this.{W2}"
                nextText $0,137         ; "Suddenly, the devils{N}appeared.{W2}"
                nextText $0,137         ; "We had no power to resist{N}them.{W2}"
                nextSingleText $0,137   ; "They promised they would do{N}nothing if we gave Oddler{N}to them.{W1}"
                entityActionsWait ALLY_LUKE
                 moveLeft 1
                endActions
                setFacing ALLY_LUKE,UP
                nextSingleText $0,ALLY_LUKE ; "And you sent ME in Oddler's{N}place?!{W1}"
                headshake 137
                nextSingleText $0,137   ; "I'm sorry, please don't{N}tell King Bedoe!{W1}"
                csWait 20
                setFacing ALLY_LUKE,DOWN
                csWait 50
                nextText $0,ALLY_LUKE   ; "Alright, I won't...{W2}"
                setFacing ALLY_LUKE,UP
                csWait 20
                nextSingleText $0,ALLY_LUKE ; "If you prepare a raft for{N}{LEADER}.{W1}"
                setActscriptWait 137,eas_Init
                setActscriptWait 137,eas_Jump
                setActscript 137,eas_Jump
                nextSingleText $0,137   ; "Oh, thank you!{N}A raft, OK.{W1}"
                setActscriptWait ALLY_LUKE,eas_DeactivateAutoFacing
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                setFacing ALLY_LUKE,LEFT
                entityActions ALLY_LUKE
                 moveRight 2
                 moveUp 1
                endActions
                entityActionsWait 137
                 moveDown 1
                 moveRight 2
                endActions
                setFacing ALLY_LUKE,DOWN
                setFacing 137,DOWN
                csWait 20
                entityActions ALLY_PETER
                 moveLeft 1
                endActions
                entityActionsWait 137
                 moveDown 3
                endActions
                setFacing 137,RIGHT
                setCamDest 11,2
                setActscriptWait 137,eas_Jump
                setActscript 137,eas_Jump
                nextSingleText $0,137   ; "Hey, Ripster!{W1}"
                setPos 133,23,7,LEFT
                customActscriptWait 133
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 133
                 moveLeft 5
                endActions
                nextSingleText $0,133   ; "Yes.{W1}"
                nextSingleText $0,137   ; "Prepare a raft for{N}Prince {NAME;10}.{W1}"
                setActscriptWait 133,eas_Init
                setActscriptWait 133,eas_JumpRight
                csWait 30
                entityActionsWait 133
                 moveLeft 1
                endActions
                nextSingleText $0,133   ; "But, it's the last one we{N}have...{W1}"
                setActscriptWait 137,eas_Jump
                setActscript 137,eas_Jump
                nextText $0,137         ; "I don't care!{W2}"
                nextSingleText $0,137   ; "You can make another if{N}necessary, can't you?!{W1}"
                nod 133
                nextSingleText $0,133   ; "Y...yes, sir!{W1}"
                customActscriptWait 133
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 133
                 moveRight 5
                endActions
                hide 133
                setCamDest 11,0
                entityActionsWait 137
                 moveUp 3
                endActions
                csWait 20
                nextText $0,137         ; "A raft will be waiting for{N}you on the river.{W2}"
                nextSingleText $0,137   ; "Why don't you take a look{N}at it right now?{W1}"
                entityActionsWait 137
                 moveLeft 2
                 moveUp 1
                endActions
                setFacing 137,DOWN
                csWait 30
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait ALLY_LUKE,eas_Init
                entityActionsWait ALLY_LUKE
                 moveDown 1
                 moveLeft 1
                endActions
                setFacing ALLY_LUKE,DOWN
                nextSingleText $C0,ALLY_PETER ; "He wants to get rid of us.{W1}"
                setFacing ALLY_PETER,UP
                nextText $0,ALLY_LUKE   ; "You're right.{W1}"
                nextSingleText $0,ALLY_LUKE ; "Anyway, now we have a raft!{W1}"
                entityActionsWait ALLY_LUKE
                 moveLeft 1
                endActions
                setFacing ALLY_LUKE,DOWN
                nextSingleText $0,ALLY_LUKE ; "Let's go!{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity ALLY_LUKE,ALLY_PETER,2
                csc_end
cs_58AE2:       textCursor 1517
                setCamDest 16,8
                setPos 137,17,7,RIGHT
                setPos 140,16,7,RIGHT
                nextSingleText $0,137   ; "Just a minute.{W1}"
                setCamDest 10,4
                nextSingleText $0,137   ; "If it's possible...{W1}"
                setFacing 137,LEFT
                csWait 50
                setFacing 137,RIGHT
                csWait 30
                nextSingleText $0,137   ; "Please take this boy with{N}you.{W1}"
                csWait 20
                nextText $C0,ALLY_LUKE  ; "You lazy human!{W2}"
                nextSingleText $C0,ALLY_LUKE ; "You don't want to take care{N}of him!{W1}"
                setFacing 137,LEFT
                nextSingleText $0,137   ; "I...er....{W1}"
                setPos ALLY_BOWIE,22,12,RIGHT
                setPos ALLY_PETER,23,12,LEFT
                setPos ALLY_LUKE,23,11,DOWN
                setCamDest 16,6
                csWait 30
                nextText $80,ALLY_PETER ; "{LEADER}, will you take{N}"
                nextText $80,ALLY_PETER ; "him with us?{W1}"
                yesNo
                jumpIfFlagSet 89,cs_58B7A ; YES/NO prompt answer
                nextText $0,ALLY_PETER  ; "I agree.  Our journey will{N}be too difficult on him,{N}as he is blind.{W2}"
                csWait 30
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing ALLY_LUKE,UP
                nextSingleText $80,ALLY_PETER ; "Mayor, we can't take him,{N}we're sorry.{W1}"
                setCamDest 15,2
                setFacing 137,RIGHT
                nextSingleText $0,137   ; "B...but....{W1}"
                csc_end
cs_58B7A:       textCursor 1528
                nextSingleText $80,ALLY_PETER ; "Are you serious?{N}{LEADER}, you're too nice.{W1}"
                customActscriptWait 140
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 137
                 moveRight 3
                 faceLeft 1
                endActions
                entityActionsWait 140
                 moveRight 3
                endActions
                csWait 20
                entityActions 137
                 moveRight 3
                 faceLeft 1
                endActions
                entityActionsWait 140
                 moveRight 3
                endActions
                setFacing 137,DOWN
                setFacing 140,DOWN
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing ALLY_LUKE,UP
                nextText $0,137         ; "Oh, thank you!{W1}"
                setFacing 137,LEFT
                setFacing FOLLOWER_B,RIGHT
                nextText $0,137         ; "Oddler, {LEADER} will{N}take you.{W2}"
                nextSingleText $0,137   ; "You can trust him!{W1}"
                setFacing 140,RIGHT
                jump cs_58D4C
cs_58BEA:       textCursor 1541
                nextSingleText $0,140   ; "Wait, wait!{W1}"
                setPos 140,14,21,DOWN
                setCamDest 10,18
                entityActionsWait 140
                 moveDown 3
                endActions
                nextSingleText $0,140   ; "Please, let me go with you!{W1}"
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait ALLY_LUKE,eas_Init
                setPos ALLY_BOWIE,14,30,UP
                setPos ALLY_PETER,15,30,UP
                setPos ALLY_LUKE,13,30,UP
                setCamDest 10,22
                textCursor 1523
                nextText $80,ALLY_PETER ; "{LEADER}, will you take{N}"
                nextText $80,ALLY_PETER ; "him with us?{W1}"
                yesNo
                jumpIfFlagSet 89,cs_58D4C ; YES/NO prompt answer
                textCursor 1543
                hideText
                nextSingleText $0,140   ; "Huh?{W1}"
                customActscriptWait 140
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing 137,DOWN
                entityActionsWait 140
                 moveDown 3
                endActions
                setFacing 140,UP
                customActscriptWait 140
                 ac_motion OFF          ;   
                 ac_orientDown          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                removeShadow 140
                csWait 30
                entityActions ALLY_BOWIE
                 moveUp 2
                endActions
                entityActions ALLY_PETER
                 moveUp 2
                endActions
                entityActionsWait ALLY_LUKE
                 moveUp 2
                endActions
                nextText $80,ALLY_PETER ; "Watch out!{W2}"
                nextSingleText $80,ALLY_PETER ; "Be careful.{W1}"
                setActscriptWait 140,eas_Init
                setFacing 140,DOWN
                headshake 140
                nod 140
                nextSingleText $0,140   ; "Yes, I will....{W1}"
                csWait 50
                setFacing 140,UP
                csWait 50
                setFacing 140,DOWN
                nextText $0,140         ; "As long as I'm here the{N}devils will return.{W2}"
                nextSingleText $0,140   ; "Maybe {LEADER} is strong{N}enough to resist them?{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                setFacing ALLY_PETER,LEFT
                setFacing 140,RIGHT
                nextSingleText $80,ALLY_PETER ; "But, you may be injured!{W1}"
                setFacing 140,DOWN
                setFacing ALLY_BOWIE,LEFT
                setFacing ALLY_LUKE,RIGHT
                nextText $0,ALLY_LUKE   ; "Well, I think he should come{N}with us.{W2}"
                nextText $0,ALLY_LUKE   ; "If we left him here, he{N}could be killed.{W2}"
                nextSingleText $0,ALLY_LUKE ; "It's too dangerous, isn't it,{N}{LEADER}?{W1}"
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                setFacing ALLY_PETER,LEFT
                setFacing ALLY_BOWIE,RIGHT
                nextText $80,ALLY_PETER ; "He needs a guardian.{W2}"
                nextSingleText $80,ALLY_PETER ; "I'll take care of him.{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                setFacing ALLY_PETER,LEFT
                setFacing 140,RIGHT
                setFacing ALLY_BOWIE,UP
                nextSingleText $80,ALLY_PETER ; "OK.  Let's go.{W1}"
                textCursor 1532
                nod 140
                nextSingleText $0,140   ; "Thank you very much.{W1}"
                setFacing 140,DOWN
                jump cs_58DD2
cs_58D4C:       textCursor 1532
                hideText
                csWait 20
                nod 140
                nextSingleText $0,140   ; "Thank you very much.{W1}"
                customActscriptWait 140
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing 137,DOWN
                entityActionsWait 140
                 moveDown 2
                endActions
                setFacing 140,UP
                customActscriptWait 140
                 ac_motion OFF          ;   
                 ac_orientDown          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                removeShadow 140
                csWait 30
                entityActions ALLY_BOWIE
                 moveUp 2
                endActions
                entityActions ALLY_PETER
                 moveUp 2
                endActions
                entityActionsWait ALLY_LUKE
                 moveUp 2
                endActions
                csWait 40
                nextText $80,ALLY_PETER ; "Watch out!{W2}"
                nextSingleText $80,ALLY_PETER ; "Be careful.{W1}"
                setActscriptWait 140,eas_Init
                setFacing 140,DOWN
                headshake 140
                nod 140
                nextSingleText $0,140   ; "Yes, I will....{W1}"
cs_58DD2:       textCursor 1536
                nextText $0,140         ; "I'm Oddler.{N}I was nearly dead when I{N}came here.{W2}"
                nextText $0,140         ; "Actually, I don't remember....{W2}"
                nextText $0,140         ; "I don't know the reason why{N}the devils are after me.{W2}"
                nextSingleText $0,140   ; "I'm afraid I'll cause you a{N}lot of trouble.{W1}"
                nextSingleText $FF,255  ; "{LEADER} decides to{N}take Oddler with him.{W1}"
                csWait 30
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity 140,ALLY_PETER,2
                followEntity ALLY_LUKE,140,2
                setF 68                 ; Oddler is a follower
                clearF 75               ; Luke is a follower
                setF 718                ; Set after Oddler runs after you as you leave Polca, and tags along
                csc_end
