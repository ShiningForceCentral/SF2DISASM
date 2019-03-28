
; ASM FILE data\maps\entries\map06\mapsetups\scripts.asm :
; 0x54E86..0x5537E : 
cs_54E86:       textCursor $42A
                setCameraEntity $8B
                nextSingleText $0,$8B   ; "A strange animal?{N}Really?{W1}"
                nextSingleText $0,$8A   ; "Yeah!  It's a very big bird!{W1}"
                csWait 30
                setFacing $8B,DOWN
                csWait 50
                setFacing $8B,LEFT
                nextText $0,$8B         ; "People are surrounding the{N}bird.  Should we talk to it?{W2}"
                nextText $0,$8B         ; "It would be a good{N}opportunity.{W2}"
                nextSingleText $0,$8B   ; "I'll go see the bird!{N}You tell the King about it!{W1}"
                entityActionsWait $8B
                 moveDown 3
                 moveRight 4
                 moveDown 8
                endActions
                csWait 20
                setActscriptWait $8B,eas_Jump
                csWait 20
                setFacing $8B,RIGHT
                csWait 20
                setActscriptWait $8B,eas_Jump
                setFacing $8B,DOWN
                csWait 30
                csWait 5
                setActscript $8B,eas_461B6
                csWait 60
                entityActionsWait $8B
                 moveLeft 1
                 moveDown 2
                endActions
                setFacing $8B,RIGHT
                setPos $0,10,9,DOWN
                setCameraEntity $8A
                entityActionsWait $8A
                 moveUp 1
                endActions
                nextText $0,$8A         ; "Oh, {LEADER}.{N}Good timing.{W2}"
                nextText $0,$8A         ; "There's a strange animal in{N}town.{W2}"
                nextSingleText $0,$8A   ; "It's very exciting!{W1}"
                setCameraEntity $0
                entityActionsWait $8A
                 moveRight 1
                 moveUp 7
                endActions
                hide $8A
                csc_end
cs_54F26:       textCursor $432
                customActscriptWait $7
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $88
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $89
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $8C
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $7,eas_46172
                setCameraEntity $88
                setFacing $88,LEFT
                nextSingleText $0,$88   ; "Oooo...it's big!{N}I want to touch him!{W1}"
                setFacing $88,RIGHT
                csWait 30
                entityActions $88
                 moveRight 1
                endActions
                csWait 8
                entityActionsWait $7
                 moveRight 1
                endActions
                csWait 30
                setFacing $88,DOWN
                nextSingleText $0,$88   ; "Ooops!{W1}"
                setCameraEntity $89
                nextSingleText $0,$89   ; "Ha, ha!  You missed.{N}Let me try.{W1}"
                setActscriptWait $7,eas_Init
                customActscriptWait $7
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $89
                 moveLeft 1
                endActions
                csWait 8
                entityActionsWait $7
                 moveDown 1
                endActions
                setFacing $89,DOWN
                nextText $0,$89         ; "Wow, he's fast!{W2}"
                nextSingleText $0,$89   ; "Hey, he's over there!{W1}"
                setCameraEntity $8C
                nextSingleText $0,$8C   ; "OK, my turn!{W1}"
                entityActions $8C
                 moveUp 1
                endActions
                csWait 8
                entityActionsWait $7
                 moveLeft 1
                 moveDownLeft 1
                endActions
                setFacing $88,RIGHT
                setFacing $89,LEFT
                nextSingleText $0,$8C   ; "Gosh, he's quick!{W1}"
                setCameraEntity $7
                setFacing $7,UP
                csWait 30
                setFacing $7,RIGHT
                csWait 30
                nextSingleText $0,$7    ; "Stop!  Stop this!{W1}"
                setActscript $88,eas_Jump
                setActscript $89,eas_Jump
                setActscriptWait $8C,eas_Jump
                setFacing $88,DOWN
                setFacing $89,LEFT
                setFacing $8C,LEFT
                csWait 30
                nextSingleText $0,$8C   ; "Amazing!  He speaks!{W1}"
                nextText $0,$7          ; "Of course I do.{W2}"
                nextSingleText $0,$7    ; "Is this how you greet{N}strangers?{W1}"
                entityActionsWait $89
                 moveDown 1
                 moveLeft 1
                endActions
                nextSingleText $0,$88   ; "Shut up, bird!{W1}"
                csWait 5
                setActscript $7,eas_461B6
                nextText $0,$7          ; "How barbaric!{W2}"
                nextSingleText $0,$7    ; "I didn't know humans were{N}so impolite.{W1}"
                setFacing $88,RIGHT
                setFacing $89,DOWN
                setFacing $8C,UP
                nextSingleText $0,$89   ; "What?{W1}"
                setFacing $7,RIGHT
                setFacing $88,DOWN
                setFacing $89,LEFT
                setFacing $8C,LEFT
                nextSingleText $FF,$FF  ; "Those boys are about to{N}hit the bird.{W1}"
                entityActions $88
                 moveDown 1
                endActions
                entityActions $89
                 moveLeft 1
                endActions
                entityActions $8C
                 moveLeft 1
                endActions
                csWait 5
                setActscriptWait $7,eas_Init
                setActscriptWait $7,eas_JumpLeft
                nextSingleText $0,$90   ; "Stop!{W1}"
                setQuake 3
                csWait 40
                setFacing $7,UP
                setFacing $88,UP
                setFacing $89,UP
                setFacing $8C,UP
                setFacing $0,UP
                setFacing $80,UP
                setFacing $82,UP
                setFacing $83,UP
                setFacing $84,UP
                setFacing $85,UP
                setFacing $86,UP
                setFacing $87,UP
                setFacing $8B,UP
                setFacing $8D,UP
                setQuake 0
                setPos $90,16,17,DOWN
                setPos $91,15,16,DOWN
                setPos $92,16,16,DOWN
                setCameraEntity $90
                csWait 60
                entityActions $90
                 moveDown 3
                endActions
                entityActions $91
                 moveDown 3
                endActions
                entityActionsWait $92
                 moveDown 3
                 moveRight 1
                endActions
                setFacing $92,DOWN
                nextSingleText $0,$90   ; "What do you think you're{N}doing?{W1}"
                entityActions $88
                 moveUp 2
                 moveRight 2
                endActions
                entityActions $89
                 moveUp 2
                 moveRight 2
                endActions
                entityActionsWait $8C
                 moveUp 2
                 moveRight 2
                endActions
                setFacing $88,UP
                setFacing $89,UP
                setFacing $8C,UP
                setCamDest 12,21
                entityActionsWait $90
                 moveDown 2
                endActions
                entityActionsWait $82
                 moveDown 1
                 moveRight 1
                endActions
                setFacing $88,LEFT
                setFacing $89,LEFT
                setFacing $8C,LEFT
                setFacing $0,LEFT
                setFacing $80,LEFT
                setFacing $82,DOWN
                setFacing $83,DOWN
                setFacing $84,DOWN
                setFacing $85,DOWN
                setFacing $86,DOWN
                setFacing $87,RIGHT
                setFacing $8B,RIGHT
                setFacing $8D,RIGHT
                entityActionsWait $90
                 moveDown 4
                endActions
                nextText $0,$90         ; "I'm sorry.  I must apologize{N}for their actions.{W2}"
                nextText $0,$90         ; "Welcome to Granseal.{N}I am the Minister.{W2}"
                nextSingleText $0,$90   ; "We just settled here.{N}We're strangers here.{W1}"
                nextText $0,$7          ; "Ha, ha!  You're right.{W2}"
                nextSingleText $0,$7    ; "But, I'm very happy to meet{N}a man like you!{W1}"
                nextText $0,$90         ; "Please stay here as long{N}as you like.{W2}"
                nextSingleText $0,$90   ; "Let me introduce you to{N}King Granseal.{N}Follow me, please.{W1}"
                csWait 40
                setCameraEntity $7
                entityActions $90
                 moveUp 8
                endActions
                entityActionsWait $7
                 moveUp 8
                endActions
                setFacing $91,RIGHT
                setFacing $92,LEFT
                csWait 30
                setCameraEntity $FFFF
                entityActions $90
                 moveLeft 1
                 moveUp 5
                endActions
                entityActions $7
                 moveLeft 1
                 moveUp 5
                endActions
                entityActions $91
                 moveLeft 1
                 moveUp 5
                endActions
                entityActionsWait $92
                 moveLeft 1
                 moveUp 2
                 moveLeft 1
                 moveUp 3
                endActions
                hide $90
                hide $91
                hide $92
                hide $7
                entityActionsWait $82
                 moveLeft 1
                endActions
                setFacing $82,DOWN
                csc_end
cs_55242:       textCursor $463
                newEntity $8E,11,0,DOWN,MAPSPRITE_SOLDIER1
                customActscriptWait $8E
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $8E
                 moveDown 7
                endActions
                setFacing $0,UP
                setFacing $7,UP
                nextText $0,$8E         ; "Welcome back, {LEADER}!{N}I heard your journey was{N}hard.{W2}"
                nextText $0,$8E         ; "Sir Astral was right.{N}He said, you were coming{N}back soon.{W2}"
                nextSingleText $0,$8E   ; "I'll go to the castle and tell{N}everyone!{W1}"
                entityActionsWait $8E
                 moveUp 7
                endActions
                hide $8E
                csc_end
cs_55288:       textCursor $466
                newEntity $12,16,22,DOWN,MAPSPRITE_PETER_BASE
                setActscriptWait $1F,eas_Init
                setActscriptWait $7,eas_Init
                nextSingleText $0,$12   ; "I finally found you.{N}You're {LEADER}, right?{W1}"
                setActscript $0,eas_Jump
                setActscript $1F,eas_Jump
                setActscriptWait $7,eas_Jump
                setFacing $8B,UP
                setCamDest 14,17
                setDest $0,19,28
                setDest $1F,20,28
                setDest $7,20,27
                setFacing $0,UP
                setFacing $1F,UP
                setFacing $7,UP
                entityActionsWait $12
                 moveDown 2
                 moveRight 3
                 moveDown 1
                endActions
                setCamDest 14,22
                setFacing $1F,LEFT
                nextSingleText $C0,$1F  ; "Who are you?{W1}"
                setFacing $1F,UP
                nextSingleText $0,$12   ; "My love, I mean{N}{NAME;13} is with you.{N}Am I right?{W1}"
                nextSingleText $C0,$7   ; "Yes, he joined us willingly.{W1}"
                headshake $12
                nextText $0,$12         ; "No, no.  I don't want to stop{N}him, but...{N}I want to be with him!{W2}"
                nextSingleText $0,$12   ; "Please take me with you.{N}Please!{W1}"
                setFacing $7,DOWN
                csWait 50
                entityActionsWait $7
                 moveRight 1
                 moveDown 1
                endActions
                setFacing $7,UP
                nextSingleText $C0,$1F  ; "This is not a sightseeing{N}trip, if you know what I{N}mean?{W1}"
                entityActionsWait $12
                 moveDown 1
                endActions
                nextSingleText $0,$12   ; "Yes, I know.{N}I still want to go!{W1}"
                setFacing $0,RIGHT
                setFacing $1F,LEFT
                nextSingleText $C0,$1F  ; "OK, you look tough enough,{N}anyway.{W1}"
                nod $0
                setFacing $0,UP
                setFacing $1F,UP
                nextSingleText $0,$12   ; "Oh, really?{N}Thank you very much!{W1}"
                join $12
                followEntity $7,$0,$2
                followEntity $1F,$7,$2
                followEntity $12,$1F,$2
                csc_end
