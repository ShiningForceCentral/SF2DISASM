
; ASM FILE data\maps\entries\map19\mapsetups\scripts.asm :
; 0x53176..0x53634 : 
cs_53176:       setCameraEntity $FFFF
                textCursor $2D1
                newEntity $90,29,9,UP,MAPSPRITE_SOLDIER2
                newEntity $91,28,9,UP,MAPSPRITE_SOLDIER1
                newEntity $92,28,10,UP,MAPSPRITE_WORKER
                newEntity $93,28,11,UP,MAPSPRITE_WORKER
                csWait 1
                newEntity $94,30,9,UP,MAPSPRITE_SOLDIER1
                newEntity $95,30,10,UP,MAPSPRITE_WORKER
                newEntity $96,30,11,UP,MAPSPRITE_WORKER
                csWait 1
                setPos $0,26,9,RIGHT
                setPos $1,26,10,RIGHT
                setPos $2,26,11,RIGHT
                setPos $8C,63,63,DOWN
                setActscriptWait $0,eas_Init
                setActscriptWait $1,eas_Init
                setActscriptWait $2,eas_Init
                fadeInB
                setCamDest 24,5
                csWait 40
                nextSingleText $80,$8A  ; "That's all the info I can{N}give you about the mission.{W1}"
                entityActionsWait $90
                 moveUp 1
                endActions
                nextSingleText $80,$8A  ; "So, all we have to do is{N}find the evil Gizmo and{N}kill him.{W1}"
                nod $8A
                nextSingleText $80,$8A  ; "That's right.  Kill him{N}before he possesses{N}somebody else.{W2}"
                nextSingleText $80,$8A  ; "You may go.{W1}"
                nextSingleText $0,$90   ; "Yes, sir.{W1}"
                setFacing $90,DOWN
                nextSingleText $0,$90   ; "Let's go and defeat the{N}evil Gizmo.{W1}"
                setActscript $91,eas_Jump
                setActscript $92,eas_Jump
                setActscript $93,eas_Jump
                setActscript $94,eas_Jump
                setActscript $95,eas_Jump
                setActscriptWait $96,eas_Jump
                setActscript $91,eas_Jump
                setActscript $92,eas_Jump
                setActscript $93,eas_Jump
                setActscript $94,eas_Jump
                setActscript $95,eas_Jump
                setActscriptWait $96,eas_Jump
                csWait 25
                entityActionsWait $90
                 moveDown 4
                endActions
                setFacing $91,DOWN
                setFacing $92,DOWN
                setFacing $93,DOWN
                setFacing $94,DOWN
                setFacing $95,DOWN
                setFacing $96,DOWN
                csWait 20
                setFacing $90,UP
                setCamDest 23,6
                nextSingleText $0,$90   ; "Forward men!{W1}"
                entityActions $90
                 moveDown 6
                endActions
                entityActions $91
                 moveDown 6
                endActions
                entityActions $92
                 moveDown 6
                endActions
                entityActions $93
                 moveDown 6
                endActions
                entityActions $94
                 moveDown 6
                endActions
                entityActions $95
                 moveDown 6
                endActions
                entityActionsWait $96
                 moveDown 6
                endActions
                hide $90
                hide $91
                hide $92
                hide $93
                hide $94
                hide $95
                hide $96
                csWait 40
                setCamDest 24,6
                entityActionsWait $8A
                 moveDown 3
                endActions
                csWait 70
                nextText $80,$8A        ; "Sir Astral is still{N}sleeping...{N}Is he alright?{W2}"
                nextSingleText $80,$8A  ; "The King is upstairs looking{N}in on Sir Astral.{N}I'm worried.{W1}"
                setFacing $8A,LEFT
                csWait 30
                entityActionsWait $1
                 moveRight 1
                endActions
                nextSingleText $0,$1    ; "Is he going to be OK?{W1}"
                entityActionsWait $2
                 moveRight 1
                endActions
                nextSingleText $0,$2    ; "We...we are...{W1}"
                csWait 20
                customActscriptWait $8A
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $8A
                 moveLeft 1
                endActions
                nextText $80,$8A        ; "He just fainted because{N}he was exhausted by the{N}two battles.{W2}"
                nextSingleText $80,$8A  ; "Don't worry about him.{N}If he dies, it doesn't matter.{N}He's old anyway.{W1}"
                csWait 40
                nextSingleText $0,$8C   ; "Minister!{N}Is the Minister there?{W1}"
                setFacing $8A,DOWN
                csWait 30
                setPos $8C,23,13,UP
                entityActionsWait $8C
                 moveRight 3
                 moveUp 1
                 moveRight 3
                 moveUp 2
                endActions
                setFacing $8A,RIGHT
                nextSingleText $80,$8A  ; "Here I am.{W1}"
                csWait 5
                setActscript $8C,eas_461E4
                csWait 120
                setFacing $8C,LEFT
                nextSingleText $0,$8C   ; "Did our soldiers leave{N}for the subjugation?{W1}"
                nod $8A
                nextSingleText $80,$8A  ; "Yes, just a few minutes{N}ago.{W1}"
                csWait 30
                setCamDest 23,5
                entityActionsWait $8C
                 moveUp 1
                 eaWait 40
                 moveUp 1
                 eaWait 40
                 moveUp 1
                endActions
                entityActionsWait $8C
                 eaWait 40
                 moveUp 1
                endActions
                setFacing $8C,DOWN
                entityActionsWait $8A
                 moveRight 1
                 moveUp 1
                endActions
                setFacing $8A,UP
                csWait 20
                nextText $0,$8C         ; "Oh, I'm too late.{W2}"
                nextSingleText $0,$8C   ; "Astral came back to his{N}senses just now.{W1}"
                customActscriptWait $8A
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $8A
                 moveUp 1
                endActions
                nextSingleText $80,$8A  ; "That's great!{N}Did you talk to him?{W1}"
                nextText $0,$8C         ; "Astral said, he feels an ill{N}omen behind the opening of{N}the tower and Gizmo appearing.{W2}"
                nextSingleText $0,$8C   ; "We must study the ancient{N}history of Grans Island.{W1}"
                nextSingleText $80,$8A  ; "How?{W1}"
                nextText $0,$8C         ; "A historian named Hawel{N}lives northwest of Yeel.{W2}"
                nextSingleText $0,$8C   ; "Astral asked me to send{N}soldiers for him, but....{W1}"
                nextSingleText $80,$8A  ; "Ah, I understand.{W1}"
                nextSingleText $0,$8C   ; "What should we do now?{W1}"
                setFacing $8A,DOWN
                nextSingleText $80,$8A  ; "What should we do?{W1}"
                stopEntity $8C
                stopEntity $8A
                csWait 80
                setActscriptWait $8C,eas_Jump
                startEntity $8C
                nextSingleText $0,$8C   ; "Oh, yes!{W1}"
                setActscriptWait $8A,eas_Jump
                startEntity $8A
                nextSingleText $80,$8A  ; "Ah, yes!{W1}"
                nextSingleText $0,$8C   ; "Minister, I have a good{N}idea.{W1}"
                setFacing $8A,UP
                nextSingleText $80,$8A  ; "As do I.{W1}"
                entityActionsWait $8A
                 moveDown 1
                endActions
                setFacing $8A,LEFT
                nextText $80,$8A        ; "You're the pupils of Astral.{N}I know of you, {LEADER}.{W2}"
                entityActionsWait $0
                 moveRight 1
                endActions
                csWait 20
                nextSingleText $80,$8A  ; "I heard that you did a very{N}good job in the Ancient{N}Tower.{W1}"
                entityActionsWait $8C
                 moveDown 1
                endActions
                nextText $0,$8C         ; "Why don't you go to Yeel{N}and bring Hawel back here?{W2}"
                nextText $0,$8C         ; "I don't think this is a{N}difficult job.{N}Will you go?{W1}"
cs_53482:       yesNo
                jumpIfFlagSet $59,cs_534AC ; YES/NO prompt answer
                hideText
                textCursor $2F5
                setActscriptWait $8A,eas_Jump
                setActscriptWait $8A,eas_Jump
                nextText $80,$8A        ; "You refuse the King's{N}wish?!{N}Answer again!{W1}"
                jump cs_53482
cs_534AC:       entityActionsWait $8C
                 moveDown 1
                endActions
                setFacing $8C,LEFT
                textCursor $2F6
                nextSingleText $0,$8C   ; "Thank you.{N}Depart to fetch Hawel{N}immediately.{W1}"
                followEntity $1,$0,$2
                followEntity $2,$1,$2
                csc_end
cs_534D2:       textCursor $2B6
                nextSingleText $0,$1C   ; "Stop, please stop!{N}Don't make me use my{N}sword any more!{W1}"
                setCamDest 17,6
                nextText $80,$80        ; "Where is King Galam?{N}He went into the tower,{N}Ground Seal, right?{W2}"
                nextSingleText $80,$80  ; "Then, I must go there!{W1}"
                entityActionsWait $80
                 moveLeft 1
                endActions
                setDest $80,23,12
                setDest $1C,20,10
                nextSingleText $0,$1C   ; "Please don't move, or I'll{N}have to kill you!  Please!{W1}"
                entityActionsWait $80
                 moveUpLeft 1
                endActions
                nextText $80,$80        ; "{NAME;28}, calm down!{N}You already figured it out,{N}didn't you?{W2}"
                nextText $80,$80        ; "We didn't attack Galam.{N}Your King lied!{N}We are allies.{W2}"
                nextSingleText $80,$80  ; "Do you believe me?{N}We would never....{W1}"
                setFacing $1C,RIGHT
                csWait 20
                setFacing $1C,UP
                csWait 30
                headshake $1C
                nextSingleText $0,$1C   ; "Stop!  NO!{N}King Galam is my...{W1}"
                nextText $80,$80        ; "You have to believe me.{W2}"
                nextSingleText $80,$80  ; "Your King is possessed{N}by a devil.{N}He is not King Galam!{W1}"
                setFacing $1C,RIGHT
                nextSingleText $0,$1C   ; "No!....{W1}"
                csWait 30
                nextSingleText $FF,$FF  ; "Princess Elis screams{N}for help.{W1}"
                setFacing $1C,UP
                nextSingleText $0,$98   ; "No, no!{N}Father!  Astral!{N}Somebody please...!{W1}"
                nextSingleText $80,$82  ; "Elis!{W1}"
                setFacing $1C,RIGHT
                csWait 20
                setFacing $80,RIGHT
                nextText $80,$80        ; "He is taking her away!{W2}"
                nextSingleText $80,$80  ; "We have no time.{W1}"
                setDest $80,21,10
                nextSingleText $0,$1C   ; "Stop, sir!{N}I can't let you pass!{W1}"
                nextSingleText $80,$80  ; "Then you come with me!{N}Yes, a good idea.{W1}"
                csWait 30
                setFacing $1C,DOWN
                csWait 50
                setFacing $1C,RIGHT
                csWait 20
                nod $1C
                csWait 30
                entityActionsWait $1C
                 moveLeft 1
                endActions
                csWait 20
                entityActionsWait $80
                 moveLeft 1
                endActions
                entityActionsWait $1C
                 moveUp 3
                 moveLeft 3
                endActions
                entityActionsWait $80
                 moveLeft 1
                endActions
                setActscriptWait $80,eas_Jump
                setActscriptWait $80,eas_Jump
                nextSingleText $80,$80  ; "You kids, follow me!{W1}"
                nod $84
                nod $85
                entityActions $80
                 moveUp 3
                 moveLeft 3
                endActions
                entityActions $85
                 moveRight 1
                 moveUp 3
                 moveLeft 3
                endActions
                entityActionsWait $84
                 moveUp 1
                 moveRight 1
                 moveUp 3
                 moveLeft 3
                endActions
                hide $80
                hide $1C
                hide $84
                hide $85
                csc_end
cs_535FA:       textCursor $2B2
                nextText $0,$81         ; "Oh, it's you, {LEADER}!{W2}"
                nextSingleText $0,$81   ; "King Galam took{N}Princess Elis to the{N}Ancient Tower!{W1}"
                nextSingleText $0,$82   ; "Elis is in the tower.{N}I shall go with you and{N}save my daughter.{W1}"
                nextSingleText $FF,$FF  ; "King Granseal and the{N}Minister go with {LEADER}.{W1}"
                followEntity $82,$0,$2
                followEntity $81,$82,$2
                csc_end
cs_53620:       textCursor $2C9
                nextSingleText $0,$80   ; "Strange earthquake....{N}{LEADER}, you must{N}escape!{W1}"
                csc_end
cs_5362A:       textCursor $2CA
                nextSingleText $0,$80   ; "OK, everybody is safe.{W1}"
                csc_end
