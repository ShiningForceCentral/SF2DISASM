
; ASM FILE data\maps\entries\map03\mapsetups\scripts_1.asm :
; 0x513D6..0x516CC : 
cs_513D6:       entityActionsWait ALLY_SARAH
                 moveLeft 1
                 moveUp 1
                endActions
                csc_end
cs_513E2:       textCursor 534
                nextText $0,ALLY_SARAH  ; "{LEADER}, so you decided{N}to go?{W1}"
                yesNo
                jumpIfFlagSet 89,cs_51406 ; YES/NO prompt answer
                textCursor 532
                nextText $0,ALLY_SARAH  ; "No?  Really?{N}Then I'm not going either!{W2}"
                nextSingleText $0,ALLY_SARAH ; "But, if you change your{N}mind, let me know right{N}away!{W1}"
                jump cs_51650
cs_51406:       textCursor 535
                nextSingleText $0,ALLY_SARAH ; "Great!{N}Let's go right now!{N}Hurry!{W1}"
                setFacing ALLY_CHESTER,LEFT
                nextSingleText $0,ALLY_CHESTER ; "What?  {LEADER}, are you{N}going?  I'm going too!{W1}"
                setF 600                ; Set after agreeing to try getting into the castle
                setF 66                 ; Sarah + Chester are followers
                join 128
                followEntity ALLY_SARAH,ALLY_BOWIE,2
                followEntity ALLY_CHESTER,ALLY_SARAH,2
                setPos 138,27,3,DOWN
                setPos 139,31,3,DOWN
                csc_end
cs_51444:       moveNextToPlayer 140,LEFT
                csc_end
cs_5144C:       moveNextToPlayer 138,UP
                csc_end
cs_51454:       moveNextToPlayer 139,UP
                csc_end
cs_5145C:       setActscriptWait 128,eas_Init
                entityActionsWait 128
                 moveUp 2
                 faceLeft 20
                endActions
                textCursor 510
                nextText $0,128         ; "Good morning {LEADER}!{N}You woke up late this{N}morning.{W2}"
                nextText $0,128         ; "Did the storm wake you up?{W2}"
                textCursor 483
                nextSingleText $0,128   ; "Hurry to school!{N}Sir Astral and {NAME;1} must{N}be waiting.{W1}"
                setActscriptWait 128,eas_Init
                csc_end
cs_5148C:       setPos ALLY_SARAH,41,10,UP
                setPos 128,6,4,UP
                csc_end
cs_5149A:       textCursor 517
                csWait 20
                setFacing ALLY_BOWIE,UP
                csWait 60
                setPos 142,46,7,LEFT
                entityActionsWait 142
                 moveLeft 1
                 moveDown 1
                 moveLeft 3
                endActions
                setFacing 142,DOWN
                nextText $0,142         ; "Is everybody here?{N}OK, let's start.{W2}"
                nextText $0,142         ; "Where is {NAME;3}?{N}Overslept again?  Oh, well.{N}I can't wait for him.{W2}"
                nextSingleText $0,142   ; "Where did I leave off{N}yesterday?{W1}"
                entityActionsWait 142
                 moveUp 1
                endActions
                csWait 120
                nextSingleText $0,143   ; "Sir Astral!{W1}"
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_SARAH,DOWN
                setFacing ALLY_CHESTER,DOWN
                setFacing 142,DOWN
                customActscriptWait 143
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPos 143,41,17,UP
                entityActionsWait 143
                 moveUp 6
                 moveRight 1
                 moveUp 2
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_SARAH,UP
                setFacing ALLY_CHESTER,UP
                entityActionsWait 143
                 moveUp 1
                endActions
                nod 143
                nod 143
                nextSingleText $0,143   ; "The Minister would like you{N}to come to the castle!{W1}"
                nextSingleText $0,142   ; "What has happened?{N}Why are you so...?{W1}"
                nextSingleText $0,143   ; "The King.  He has fallen{N}down and is in great pain!{W1}"
                nextSingleText $0,142   ; "What?!  The King?{N}OK, I'm coming!{W1}"
                csWait 15
                setActscriptWait 143,eas_Init
                entityActions 143
                 moveDown 3
                endActions
                entityActionsWait 142
                 moveDown 3
                endActions
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_SARAH,DOWN
                setFacing ALLY_CHESTER,DOWN
                entityActions 143
                 moveDown 1
                 moveLeft 1
                 moveDown 2
                endActions
                entityActionsWait 142
                 moveDown 2
                 moveLeft 1
                 eaWait 20
                 moveRight 1
                endActions
                setFacing 143,UP
                setFacing 142,UP
                setCamDest 38,7
                nextSingleText $0,142   ; "Sorry, kids.  I have to go{N}to the castle.{N}Stay here.{W1}"
                entityActionsWait 142
                 moveLeft 1
                endActions
                entityActions 143
                 moveDown 3
                endActions
                entityActionsWait 142
                 moveDown 5
                endActions
                hide 142
                hide 143
                setCamDest 38,6
                setFacing ALLY_BOWIE,RIGHT
                setFacing ALLY_CHESTER,LEFT
                nextText $0,ALLY_CHESTER ; "{LEADER}, did you hear that?{N}The King is sick!{W2}"
                nextSingleText $0,ALLY_CHESTER ; "But, I think it must be{N}something else!{N}He was acting so strange!{W1}"
                entityActionsWait ALLY_SARAH
                 moveDown 1
                 moveRight 3
                endActions
                setFacing ALLY_SARAH,UP
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_CHESTER,DOWN
                nextSingleText $C0,ALLY_SARAH ; "Hey, {NAME;2}!{N}Let's go to the castle.{W1}"
                nextSingleText $0,ALLY_CHESTER ; "We can't, {NAME;1}!{N}We're just kids.{N}They won't let us in.{W1}"
                nextSingleText $C0,ALLY_SARAH ; "Never mind that.{N}I have a plan!{W1}"
                entityActionsWait ALLY_SARAH
                 moveLeft 1
                endActions
                setFacing ALLY_SARAH,UP
                nextText $C0,ALLY_SARAH ; "{LEADER}, maybe we can{N}meet the Princess!{N}Are you going with us?{W1}"
                yesNo
                jumpIfFlagSet 89,cs_51614 ; YES/NO prompt answer
                nextText $0,ALLY_SARAH  ; "No?  Really?{N}Then I'm not going either!{W2}"
                nextSingleText $0,ALLY_SARAH ; "But, if you change your{N}mind, let me know right{N}away!{W1}"
                entityActionsWait ALLY_SARAH
                 moveLeft 2
                 moveUp 1
                endActions
                setFacing ALLY_CHESTER,UP
                jump cs_51650
cs_51614:       textCursor 535
                nextSingleText $0,ALLY_SARAH ; "Great!{N}Let's go right now!{N}Hurry!{W1}"
                setFacing ALLY_CHESTER,LEFT
                nextSingleText $0,ALLY_CHESTER ; "What?  {LEADER}, are you{N}going?  I'm going too!{W1}"
                setF 600                ; Set after agreeing to try getting into the castle
                setF 66                 ; Sarah + Chester are followers
                join 128
                followEntity ALLY_SARAH,ALLY_BOWIE,2
                followEntity ALLY_CHESTER,ALLY_SARAH,2
                setPos 138,27,3,DOWN
                setPos 139,31,3,DOWN
cs_51650:       csc_end
cs_51652:       textCursor 537
                entityActions 138
                 moveRight 1
                endActions
                entityActionsWait 139
                 moveLeft 1
                endActions
                setFacing 138,DOWN
                setFacing 139,DOWN
                nextSingleText $0,138   ; "Halt!{N}Where do you think you're{N}going?{W1}"
                setFacing ALLY_SARAH,UP
                setFacing ALLY_CHESTER,UP
                nextSingleText $C0,ALLY_SARAH ; "Well, let's see....{N}Ummm...yes, Sir Astral{N}called us!{W1}"
                nextSingleText $0,138   ; "Why?{W1}"
                nextSingleText $C0,ALLY_SARAH ; "We're his pupils.{N}He left a package behind,{N}and....{W1}"
                nextSingleText $0,138   ; "You want to deliver it to{N}him?{N}Well...OK, go ahead.{W1}"
                nextSingleText $0,139   ; "(Cough!){N}Be good in the castle, OK?{W1}"
                entityActions 138
                 moveLeft 1
                endActions
                entityActionsWait 139
                 moveRight 1
                endActions
                setFacing 138,DOWN
                setFacing 139,DOWN
                csc_end
cs_516A8:       textCursor 662
                nextSingleText $0,ALLY_JAHA ; "Here you are!{N}I've been waiting.{W1}"
                moveNextToPlayer ALLY_JAHA,LEFT
                nextSingleText $0,ALLY_JAHA ; "A soldier said you went{N}into the castle.{N}Is that true?{W2}{N}Oooww!  I missed it!{N}I would've woken up early{N}if I knew that...!{W1}{N}So I came to meet you{N}here, {LEADER}.{N}You're going to Yeel, right?{W2}{N}Under the King's orders!{N}Cool!  Of course, I'm{N}going too!{W1}"
                join ALLY_JAHA
                nextSingleText $0,ALLY_JAHA ; "Let's go!{W1}"
                followEntity ALLY_JAHA,ALLY_CHESTER,2
                csc_end
