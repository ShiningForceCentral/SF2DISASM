
; ASM FILE data\maps\entries\map09\mapsetups\scripts.asm :
; 0x568F6..0x56B84 : 
cs_568F6:       textCursor $55C
                setFacing $0,RIGHT
                csWait 20
                entityActionsWait $82
                 moveLeft 1
                 moveUp 1
                endActions
                setFacing $82,LEFT
                nextSingleText $C0,$82  ; "Where are you from?{W1}"
                csWait 20
                setDest $7,4,58
                setFacing $7,RIGHT
                nextSingleText $0,$7    ; "{LEADER} came from{N}Grans Island.{W1}"
                customActscriptWait $82
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $82
                 moveLeft 1
                endActions
                nextSingleText $C0,$82  ; "Then we could be related.{W1}"
                csWait 20
                setFacing $7,UP
                csWait 20
                nextSingleText $0,$7    ; "What do you mean?{W1}"
                csWait 40
                setActscriptWait $82,eas_Init2
                setFacing $82,DOWN
                csWait 30
                setFacing $82,LEFT
                csWait 40
                entityActions $82
                 moveRight 1
                 moveDown 1
                endActions
                csWait 20
                entityActionsWait $0
                 moveRight 1
                endActions
                csWait 10
                setFacing $0,DOWN
                setFacing $7,RIGHT
                setFacing $82,LEFT
                nextText $C0,$82        ; "Our ancestors came to{N}Parmecia to chase after{N}a soldier called Max.{W2}"
                nextText $C0,$82        ; "They lost his trail at the{N}shore and then split into{N}two groups.{W2}"
                nextSingleText $C0,$82  ; "One group went back to{N}Grans by way of Devil's Tail.{W1}"
                csWait 20
                nextSingleText $0,$7    ; "Hmmm...and what happened{N}to Max?{W1}"
                csWait 20
                nextText $C0,$82        ; "He wasn't found in Parmecia,{N}so maybe he went to Grans.{N}I'm not really sure.{W2}"
                nextSingleText $C0,$82  ; "I think I'll take a nap{N}now.  Bye.{W1}"
                csWait 30
                entityActionsWait $7
                 moveUp 1
                endActions
                setFacing $7,RIGHT
                setFacing $0,LEFT
                followEntity $7,$0,$2
                csc_end
cs_569BC:       textCursor $566
                setDest $7,15,57
                setFacing $7,DOWN
                setFacing $0,DOWN
                nextText $C0,$B         ; "(Sniff)...(sniff)...I smell{N}something old....{W1}"
                setFacing $B,UP
                nextSingleText $C0,$B   ; "That sword must be really{N}old.  Oh, my!{N}It's the Achilles Sword!{W2}"
                customActscriptWait $B
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $0
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $0,eas_46172
                entityActions $B
                 moveUp 1
                endActions
                csWait 3
                entityActionsWait $0
                 moveUp 1
                endActions
                nextText $C0,$B         ; "You're an adventurer, right?{N}Don't you need a vehicle?{N}Huh?{W2}"
                nextSingleText $C0,$B   ; "You can get the Ancient{N}Caravan with that sword!{W1}"
                setDest $7,15,58
                setFacing $7,RIGHT
                nextSingleText $0,$7    ; "You wouldn't listen to us{N}just a short time ago!{W1}"
                setFacing $B,LEFT
                nextText $C0,$B         ; "I was busy and...{W1}"
                setFacing $B,UP
                nextText $C0,$B         ; "Let me join you!{W2}"
                nextText $C0,$B         ; "I'm the only one who can{N}drive it!{W2}"
                nextText $C0,$B         ; "You are going to get the{N}Caravan, aren't you?!{W1}"
                yesNo
                jumpIfFlagSet $59,cs_56A82; YES/NO prompt answer
                customActscriptWait $B
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $B,eas_46172
                entityActionsWait $B
                 moveDown 1
                endActions
cs_56A70:       textCursor $56F
                nextSingleText $C0,$B   ; "You don't know what you'll{N}be missing!{W1}"
                setFacing $B,DOWN
                jump cs_56AD4
cs_56A82:       textCursor $572
                nextSingleText $C0,$B   ; "Great!  Good lad!{W1}"
                nextSingleText $FF,$FF  ; "{CLEAR}{LEADER} decides to take{N}Dr. {NAME;11} with him.{W1}{CLEAR}"
                setActscriptWait $B,eas_Init
                setPriority $B,$FFFF
                setPriority $0,$0
                setActscriptWait $B,eas_Jump
                setActscript $B,eas_Jump
                nextSingleText $C0,$B   ; "Let's go!{W1}"
                setPriority $0,$FFFF
                setF $2D5               ; Set after telling Rohde that you're going to get the Caravan
                setF $54                ; Rohde is a follower
                setStoryFlag $12        ; Battle 18 unlocked
                followEntity $B,$1F,$2
cs_56AD4:       setActscriptWait $0,eas_Init
                followEntity $7,$0,$2
                csc_end
cs_56AE6:       textCursor $570
                nextText $C0,$B         ; "You again?!{W1}"
                nextText $C0,$B         ; "You changed your mind?{N}Hmmm....{W1}"
                yesNo
                jumpIfFlagSet $59,cs_56A82; YES/NO prompt answer
                jump cs_56A70
cs_56B02:       textCursor $583
                setPriority $C,$FFFF
                setPriority $0,$0
                nextText $0,$C          ; "Are you the boy who killed{N}the legendary Kraken?{W2}"
                nextText $0,$C          ; "I got to Hassan thanks to{N}you.{W2}"
                nextSingleText $0,$C    ; "I didn't know this was such a{N}dull town.{W1}"
                csWait 20
                setFacing $C,UP
                csWait 30
                setActscriptWait $C,eas_Jump
                csWait 20
                faceEntity $C,$0
                nextSingleText $0,$C    ; "Wh...what's that?!{W1}"
                faceEntity $7,$C
                faceEntity $C,$7
                nextSingleText $C0,$7   ; "It's the Caravan...an ancient{N}vehicle found in the shrine.{W1}"
                csWait 20
                faceEntity $C,$0
                nextText $0,$C          ; "I love interesting{N}things like that!{W2}"
                nextText $0,$C          ; "Wow!  You found it?!{W2}"
                nextSingleText $0,$C    ; "I want to go with you to{N}see some more interesting{N}things!{W1}"
                join $C
                nextSingleText $0,$C    ; "Adventure!{N}Yo Ho!  Let's go!{W1}"
                setActscriptWait $C,eas_Jump
                setActscriptWait $C,eas_Jump
                csWait 20
                setPriority $0,$FFFF
                addNewFollower $C
                csc_end
