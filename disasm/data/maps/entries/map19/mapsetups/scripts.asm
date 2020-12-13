
; ASM FILE data\maps\entries\map19\mapsetups\scripts.asm :
; 0x53176..0x53634 : 
cs_53176:       setCameraEntity 65535
                textCursor 721
                newEntity 144,29,9,UP,MAPSPRITE_SOLDIER2
                newEntity 145,28,9,UP,MAPSPRITE_SOLDIER1
                newEntity 146,28,10,UP,MAPSPRITE_WORKER
                newEntity 147,28,11,UP,MAPSPRITE_WORKER
                csWait 1
                newEntity 148,30,9,UP,MAPSPRITE_SOLDIER1
                newEntity 149,30,10,UP,MAPSPRITE_WORKER
                newEntity 150,30,11,UP,MAPSPRITE_WORKER
                csWait 1
                setPos ALLY_BOWIE,26,9,RIGHT
                setPos ALLY_SARAH,26,10,RIGHT
                setPos ALLY_CHESTER,26,11,RIGHT
                setPos 140,63,63,DOWN
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_SARAH,eas_Init
                setActscriptWait ALLY_CHESTER,eas_Init
                fadeInB
                setCamDest 24,5
                csWait 40
                nextSingleText $80,138  ; "That's all the info I can{N}give you about the mission.{W1}"
                entityActionsWait 144
                 moveUp 1
                endActions
                nextSingleText $80,138  ; "So, all we have to do is{N}find the evil Gizmo and{N}kill him.{W1}"
                nod 138
                nextSingleText $80,138  ; "That's right.  Kill him{N}before he possesses{N}somebody else.{W2}"
                nextSingleText $80,138  ; "You may go.{W1}"
                nextSingleText $0,144   ; "Yes, sir.{W1}"
                setFacing 144,DOWN
                nextSingleText $0,144   ; "Let's go and defeat the{N}evil Gizmo.{W1}"
                setActscript 145,eas_Jump
                setActscript 146,eas_Jump
                setActscript 147,eas_Jump
                setActscript 148,eas_Jump
                setActscript 149,eas_Jump
                setActscriptWait 150,eas_Jump
                setActscript 145,eas_Jump
                setActscript 146,eas_Jump
                setActscript 147,eas_Jump
                setActscript 148,eas_Jump
                setActscript 149,eas_Jump
                setActscriptWait 150,eas_Jump
                csWait 25
                entityActionsWait 144
                 moveDown 4
                endActions
                setFacing 145,DOWN
                setFacing 146,DOWN
                setFacing 147,DOWN
                setFacing 148,DOWN
                setFacing 149,DOWN
                setFacing 150,DOWN
                csWait 20
                setFacing 144,UP
                setCamDest 23,6
                nextSingleText $0,144   ; "Forward men!{W1}"
                entityActions 144
                 moveDown 6
                endActions
                entityActions 145
                 moveDown 6
                endActions
                entityActions 146
                 moveDown 6
                endActions
                entityActions 147
                 moveDown 6
                endActions
                entityActions 148
                 moveDown 6
                endActions
                entityActions 149
                 moveDown 6
                endActions
                entityActionsWait 150
                 moveDown 6
                endActions
                hide 144
                hide 145
                hide 146
                hide 147
                hide 148
                hide 149
                hide 150
                csWait 40
                setCamDest 24,6
                entityActionsWait 138
                 moveDown 3
                endActions
                csWait 70
                nextText $80,138        ; "Sir Astral is still{N}sleeping...{N}Is he alright?{W2}"
                nextSingleText $80,138  ; "The King is upstairs looking{N}in on Sir Astral.{N}I'm worried.{W1}"
                setFacing 138,LEFT
                csWait 30
                entityActionsWait ALLY_SARAH
                 moveRight 1
                endActions
                nextSingleText $0,ALLY_SARAH ; "Is he going to be OK?{W1}"
                entityActionsWait ALLY_CHESTER
                 moveRight 1
                endActions
                nextSingleText $0,ALLY_CHESTER ; "We...we are...{W1}"
                csWait 20
                customActscriptWait 138
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 138
                 moveLeft 1
                endActions
                nextText $80,138        ; "He just fainted because{N}he was exhausted by the{N}two battles.{W2}"
                nextSingleText $80,138  ; "Don't worry about him.{N}If he dies, it doesn't matter.{N}He's old anyway.{W1}"
                csWait 40
                nextSingleText $0,140   ; "Minister!{N}Is the Minister there?{W1}"
                setFacing 138,DOWN
                csWait 30
                setPos 140,23,13,UP
                entityActionsWait 140
                 moveRight 3
                 moveUp 1
                 moveRight 3
                 moveUp 2
                endActions
                setFacing 138,RIGHT
                nextSingleText $80,138  ; "Here I am.{W1}"
                csWait 5
                setActscript 140,eas_2xUpDown
                csWait 120
                setFacing 140,LEFT
                nextSingleText $0,140   ; "Did our soldiers leave{N}for the subjugation?{W1}"
                nod 138
                nextSingleText $80,138  ; "Yes, just a few minutes{N}ago.{W1}"
                csWait 30
                setCamDest 23,5
                entityActionsWait 140
                 moveUp 1
                 eaWait 40
                 moveUp 1
                 eaWait 40
                 moveUp 1
                endActions
                entityActionsWait 140
                 eaWait 40
                 moveUp 1
                endActions
                setFacing 140,DOWN
                entityActionsWait 138
                 moveRight 1
                 moveUp 1
                endActions
                setFacing 138,UP
                csWait 20
                nextText $0,140         ; "Oh, I'm too late.{W2}"
                nextSingleText $0,140   ; "Astral came back to his{N}senses just now.{W1}"
                customActscriptWait 138
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 138
                 moveUp 1
                endActions
                nextSingleText $80,138  ; "That's great!{N}Did you talk to him?{W1}"
                nextText $0,140         ; "Astral said, he feels an ill{N}omen behind the opening of{N}the tower and Gizmo appearing.{W2}"
                nextSingleText $0,140   ; "We must study the ancient{N}history of Grans Island.{W1}"
                nextSingleText $80,138  ; "How?{W1}"
                nextText $0,140         ; "A historian named Hawel{N}lives northwest of Yeel.{W2}"
                nextSingleText $0,140   ; "Astral asked me to send{N}soldiers for him, but....{W1}"
                nextSingleText $80,138  ; "Ah, I understand.{W1}"
                nextSingleText $0,140   ; "What should we do now?{W1}"
                setFacing 138,DOWN
                nextSingleText $80,138  ; "What should we do?{W1}"
                stopEntity 140
                stopEntity 138
                csWait 80
                setActscriptWait 140,eas_Jump
                startEntity 140
                nextSingleText $0,140   ; "Oh, yes!{W1}"
                setActscriptWait 138,eas_Jump
                startEntity 138
                nextSingleText $80,138  ; "Ah, yes!{W1}"
                nextSingleText $0,140   ; "Minister, I have a good{N}idea.{W1}"
                setFacing 138,UP
                nextSingleText $80,138  ; "As do I.{W1}"
                entityActionsWait 138
                 moveDown 1
                endActions
                setFacing 138,LEFT
                nextText $80,138        ; "You're the pupils of Astral.{N}I know of you, {LEADER}.{W2}"
                entityActionsWait ALLY_BOWIE
                 moveRight 1
                endActions
                csWait 20
                nextSingleText $80,138  ; "I heard that you did a very{N}good job in the Ancient{N}Tower.{W1}"
                entityActionsWait 140
                 moveDown 1
                endActions
                nextText $0,140         ; "Why don't you go to Yeel{N}and bring Hawel back here?{W2}"
                nextText $0,140         ; "I don't think this is a{N}difficult job.{N}Will you go?{W1}"
cs_53482:       yesNo
                jumpIfFlagSet 89,cs_534AC ; YES/NO prompt answer
                hideText
                textCursor 757
                setActscriptWait 138,eas_Jump
                setActscriptWait 138,eas_Jump
                nextText $80,138        ; "You refuse the King's{N}wish?!{N}Answer again!{W1}"
                jump cs_53482
cs_534AC:       entityActionsWait 140
                 moveDown 1
                endActions
                setFacing 140,LEFT
                textCursor 758
                nextSingleText $0,140   ; "Thank you.{N}Depart to fetch Hawel{N}immediately.{W1}"
                followEntity ALLY_SARAH,ALLY_BOWIE,2
                followEntity ALLY_CHESTER,ALLY_SARAH,2
                csc_end
cs_534D2:       textCursor 694
                nextSingleText $0,ALLY_LEMON ; "Stop, please stop!{N}Don't make me use my{N}sword any more!{W1}"
                setCamDest 17,6
                nextText $80,128        ; "Where is King Galam?{N}He went into the tower,{N}Ground Seal, right?{W2}"
                nextSingleText $80,128  ; "Then, I must go there!{W1}"
                entityActionsWait 128
                 moveLeft 1
                endActions
                setDest 128,23,12
                setDest ALLY_LEMON,20,10
                nextSingleText $0,ALLY_LEMON ; "Please don't move, or I'll{N}have to kill you!  Please!{W1}"
                entityActionsWait 128
                 moveUpLeft 1
                endActions
                nextText $80,128        ; "{NAME;28}, calm down!{N}You already figured it out,{N}didn't you?{W2}"
                nextText $80,128        ; "We didn't attack Galam.{N}Your King lied!{N}We are allies.{W2}"
                nextSingleText $80,128  ; "Do you believe me?{N}We would never....{W1}"
                setFacing ALLY_LEMON,RIGHT
                csWait 20
                setFacing ALLY_LEMON,UP
                csWait 30
                headshake ALLY_LEMON
                nextSingleText $0,ALLY_LEMON ; "Stop!  NO!{N}King Galam is my...{W1}"
                nextText $80,128        ; "You have to believe me.{W2}"
                nextSingleText $80,128  ; "Your King is possessed{N}by a devil.{N}He is not King Galam!{W1}"
                setFacing ALLY_LEMON,RIGHT
                nextSingleText $0,ALLY_LEMON ; "No!....{W1}"
                csWait 30
                nextSingleText $FF,255  ; "Princess Elis screams{N}for help.{W1}"
                setFacing ALLY_LEMON,UP
                nextSingleText $0,152   ; "No, no!{N}Father!  Astral!{N}Somebody please...!{W1}"
                nextSingleText $80,130  ; "Elis!{W1}"
                setFacing ALLY_LEMON,RIGHT
                csWait 20
                setFacing 128,RIGHT
                nextText $80,128        ; "He is taking her away!{W2}"
                nextSingleText $80,128  ; "We have no time.{W1}"
                setDest 128,21,10
                nextSingleText $0,ALLY_LEMON ; "Stop, sir!{N}I can't let you pass!{W1}"
                nextSingleText $80,128  ; "Then you come with me!{N}Yes, a good idea.{W1}"
                csWait 30
                setFacing ALLY_LEMON,DOWN
                csWait 50
                setFacing ALLY_LEMON,RIGHT
                csWait 20
                nod ALLY_LEMON
                csWait 30
                entityActionsWait ALLY_LEMON
                 moveLeft 1
                endActions
                csWait 20
                entityActionsWait 128
                 moveLeft 1
                endActions
                entityActionsWait ALLY_LEMON
                 moveUp 3
                 moveLeft 3
                endActions
                entityActionsWait 128
                 moveLeft 1
                endActions
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                nextSingleText $80,128  ; "You kids, follow me!{W1}"
                nod 132
                nod 133
                entityActions 128
                 moveUp 3
                 moveLeft 3
                endActions
                entityActions 133
                 moveRight 1
                 moveUp 3
                 moveLeft 3
                endActions
                entityActionsWait 132
                 moveUp 1
                 moveRight 1
                 moveUp 3
                 moveLeft 3
                endActions
                hide 128
                hide ALLY_LEMON
                hide 132
                hide 133
                csc_end
cs_535FA:       textCursor 690
                nextText $0,129         ; "Oh, it's you, {LEADER}!{W2}"
                nextSingleText $0,129   ; "King Galam took{N}Princess Elis to the{N}Ancient Tower!{W1}"
                nextSingleText $0,130   ; "Elis is in the tower.{N}I shall go with you and{N}save my daughter.{W1}"
                nextSingleText $FF,255  ; "King Granseal and the{N}Minister go with {LEADER}.{W1}"
                followEntity 130,ALLY_BOWIE,2
                followEntity 129,130,2
                csc_end
cs_53620:       textCursor 713
                nextSingleText $0,128   ; "Strange earthquake....{N}{LEADER}, you must{N}escape!{W1}"
                csc_end
cs_5362A:       textCursor 714
                nextSingleText $0,128   ; "OK, everybody is safe.{W1}"
                csc_end
