
; ASM FILE data\maps\entries\map05\mapsetups\scripts_1.asm :
; 0x60708..0x60FAE : 
cs_60708:       textCursor 3513
                setPos ALLY_LEMON,21,33,DOWN
                setActscriptWait ALLY_LEMON,eas_Init
                nextSingleText $80,ALLY_LEMON ; "Sir Astral!  {LEADER}!{W1}"
                setCamDest 16,28
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setPos ALLY_BOWIE,21,39,UP
                setPos ALLY_PETER,22,39,UP
                setPos FOLLOWER_B,20,39,UP
                nextSingleText $80,ALLY_LEMON ; "{LEADER}, wait!{W1}"
                entityActionsWait ALLY_LEMON
                 moveDown 2
                endActions
                setCamDest 16,33
                nextSingleText $80,ALLY_LEMON ; "May I join your force?{W1}"
                csWait 50
                nextSingleText $0,FOLLOWER_B ; "Well...{W1}"
                csWait 30
                nextText $80,ALLY_LEMON ; "You can trust me.{N}I'm a born fighter.{W2}"
                nextText $80,ALLY_LEMON ; "As you know, I want to die.{W2}"
                nextSingleText $80,ALLY_LEMON ; "I will die fighting for your{N}cause, if you let me.{W1}"
                csWait 40
                setFacing FOLLOWER_B,RIGHT
                setFacing ALLY_BOWIE,LEFT
                setFacing ALLY_PETER,LEFT
                nextSingleText $0,FOLLOWER_B ; "He's a hero in Galam.{N}I think he should join us.{W1}"
                nod ALLY_BOWIE
                nod ALLY_PETER
                csWait 20
                entityActions ALLY_BOWIE
                 moveUp 3
                endActions
                entityActions ALLY_PETER
                 moveUp 4
                 faceLeft 1
                endActions
                entityActionsWait FOLLOWER_B
                 moveUp 4
                 faceRight 1
                endActions
                nextSingleText $0,FOLLOWER_B ; "{NAME;28}, please come{N}with us.  You'll be a great{N}help.{W1}"
                join ALLY_LEMON
                setActscriptWait ALLY_LEMON,eas_Jump
                setActscriptWait ALLY_LEMON,eas_Jump
                nextSingleText $80,ALLY_LEMON ; "Oh, thank you!  I know I can{N}take the King of the Devils!{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                followEntity ALLY_LEMON,FOLLOWER_B,2
                csc_end
cs_607DE:       textCursor 3388
                setPos 130,63,63,DOWN
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setPos ALLY_BOWIE,21,39,UP
                setPos ALLY_PETER,22,40,UP
                setPos FOLLOWER_B,20,40,UP
                reloadMap 16,34
                fadeInB
                nextSingleText $0,ALLY_LEMON ; "I'm guilty!{W1}"
                csWait 5
                setActscript ALLY_BOWIE,eas_2xRightLeft
                csWait 5
                setActscript ALLY_PETER,eas_2xUpDown
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 80
                entityActionsWait ALLY_PETER
                 moveUp 2
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing FOLLOWER_B,UP
                nextSingleText $0,ALLY_PETER ; "Hey, there's {NAME;28}.{W1}"
                setCamDest 13,28
                nextText $0,ALLY_LEMON  ; "I've killed a lot of people{N}for the devils!{W2}"
                setFacing ALLY_LEMON,DOWN
                shiver ALLY_LEMON
                nextSingleText $0,ALLY_LEMON ; "The guilt is too much to{N}handle.  I must die!{W1}"
                setActscriptWait ALLY_LEMON,eas_DeactivateAutoFacing
                customActscriptWait ALLY_LEMON
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                nod ALLY_LEMON
                csWait 30
                entityActionsWait ALLY_LEMON
                 moveUp 5
                 moveRight 3
                endActions
                setFacing ALLY_LEMON,DOWN
                customActscriptWait ALLY_LEMON
                 ac_motion OFF          ;   
                 ac_orientDown          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait ALLY_LEMON,eas_DeactivateAutoFacing
                playSound SFX_FALLING
                entityActionsWait ALLY_LEMON
                 moveDown 6
                endActions
                setPos ALLY_LEMON,63,63,DOWN
                setPos 130,19,33,DOWN
                setQuake 5
                csWait 60
                setQuake 0
                setCamDest 16,34
                entityActionsWait ALLY_PETER
                 moveLeft 1
                 moveUp 1
                endActions
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                setFacing ALLY_PETER,DOWN
                nextSingleText $0,ALLY_PETER ; "Gee!{N}{NAME;28} killed himself!{W1}"
                entityActionsWait FOLLOWER_B
                 moveUp 2
                endActions
                setFacing ALLY_BOWIE,LEFT
                setFacing ALLY_PETER,LEFT
                nextText $0,FOLLOWER_B  ; "No, {NAME;28} cannot die{N}by jumping off a cliff.{W2}"
                setFacing FOLLOWER_B,RIGHT
                nextText $0,FOLLOWER_B  ; "{NAME;28} is an immortal{N}vampire.{W2}"
                nextSingleText $0,FOLLOWER_B ; "But, I'm sure the impact{N}didn't feel too good.{W1}"
                nod ALLY_BOWIE
                nod ALLY_PETER
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                setActscriptWait ALLY_LEMON,eas_Init
                startEntity ALLY_LEMON
                csc_end
cs_6093A:       textCursor 3396
                setPriority ALLY_CHAZ,$0
                setPriority 128,$FFFF
                setCamDest 6,2
                setActscriptWait ALLY_LEMON,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setFacing ALLY_LEMON,UP
                setDest ALLY_BOWIE,11,7
                setDest ALLY_PETER,11,7
                setDest FOLLOWER_B,11,7
                entityActionsWait ALLY_PETER
                 moveRight 1
                 faceUp 1
                endActions
                entityActionsWait FOLLOWER_B
                 moveLeft 1
                 faceUp 1
                endActions
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                nextText $80,128        ; "Ah, devils finally found the{N}hidden door.{W1}"
                nextSingleText $80,128  ; "I must give the people time{N}to escape!{W1}"
                nextSingleText $FF,255  ; "The priest pulls out a holy{N}symbol.{W1}"
                setPriority 131,$FFFF
                setPriority 128,$0
                playSound SFX_LANDSTALKER_ITEM
                setPos 131,11,4,DOWN
                csWait 60
                entityActions 131
                 moveDown 1
                endActions
                entityActionsWait 128
                 moveDown 1
                endActions
                shiver 128
                setFacing ALLY_BOWIE,LEFT
                setFacing ALLY_PETER,LEFT
                nextSingleText $80,ALLY_PETER ; "What's he doing?{W1}"
                nextSingleText $0,FOLLOWER_B ; "He's mistaking us for devils.{W1}"
                hide 131
                csWait 20
                shiver 128
                setFacing ALLY_PETER,UP
                setFacing ALLY_BOWIE,UP
                nextText $80,128        ; "What tough devils!{W2}"
                nextSingleText $80,128  ; "My symbol doesn't drive{N}them away!{W1}"
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                nextSingleText $0,FOLLOWER_B ; "Excuse me, we're not devils.{W1}"
                shiver 128
                nextSingleText $80,128  ; "I don't believe you!{W1}"
                nextSingleText $80,ALLY_PETER ; "But we really...{W1}"
                setPriority ALLY_CHAZ,$0
                setPriority 128,$FFFF
                setPos ALLY_CHAZ,11,4,DOWN
                csWait 30
                nextSingleText $0,ALLY_CHAZ ; "Brother?{W1}"
                setFacing 128,UP
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                nextText $80,128        ; "{NAME;27}, they found the{N}hidden door!{W2}"
                nextSingleText $80,128  ; "I tried to drive them away{N}with this holy symbol, but{N}I failed.{W1}"
                setPriority 128,$0
                nod ALLY_CHAZ
                nextSingleText $0,ALLY_CHAZ ; "Then, they're not devils.{W1}"
                shiver 128
                nextSingleText $80,128  ; "Nobody but devils ever come{N}to such a dangerous place!{N}They must be devils!{W1}"
                csWait 20
                nextSingleText $0,ALLY_CHAZ ; "Have you asked them?{W1}"
                entityActionsWait FOLLOWER_B
                 moveRight 1
                 faceUp 1
                 jumpUp 1
                 jumpUp 1
                endActions
                nextText $80,FOLLOWER_B ; "How can we explain this?{W2}"
                nextSingleText $80,FOLLOWER_B ; "We are from Granseal.{N}We came here to defeat the{N}devils.{W1}"
                setFacing 128,DOWN
                shiver ALLY_CHAZ
                nextSingleText $0,ALLY_CHAZ ; "Granseal?{W1}"
                entityActionsWait 128
                 moveLeft 1
                 faceRight 1
                endActions
                csWait 20
                nextSingleText $0,ALLY_CHAZ ; "Really?{W1}"
                entityActionsWait ALLY_CHAZ
                 moveDown 1
                endActions
                nextSingleText $0,ALLY_CHAZ ; "Alright!{W1}"
                csWait 40
                nextSingleText $0,ALLY_CHAZ ; "This is great news!{W1}"
                setActscriptWait ALLY_CHAZ,eas_Jump
                setActscriptWait ALLY_CHAZ,eas_Jump
                nextSingleText $0,ALLY_CHAZ ; "Are you Sir Astral?{W1}"
                nod FOLLOWER_B
                nextSingleText $80,FOLLOWER_B ; "Yes, but...I'm sorry, have{N}we met?{W1}"
                nextText $0,ALLY_CHAZ   ; "I'm {NAME;27}, a son of{N}Hawel.{W2}"
                nextSingleText $0,ALLY_CHAZ ; "Do you remember me?{W1}"
                setActscriptWait FOLLOWER_B,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $80,FOLLOWER_B ; "Hawel's son?{W1}"
                entityActionsWait FOLLOWER_B
                 moveRight 1
                 moveUp 1
                 faceLeft 1
                endActions
                setFacing ALLY_CHAZ,RIGHT
                shiver FOLLOWER_B
                nextText $80,FOLLOWER_B ; "Oh, {NAME;27}!{W2}"
                nextText $80,FOLLOWER_B ; "Yes, of course.{N}Nice to see you again.{W2}"
                nextSingleText $80,FOLLOWER_B ; "What are you doing here?{W1}"
                csc_end
cs_60B10:       textCursor 3426
                nextSingleText $0,ALLY_CHAZ ; "I came back to Yeel to{N}continue my father's work.{W1}"
                nextSingleText $80,FOLLOWER_B ; "{NAME;27}, maybe you can{N}answer some questions?{W1}"
                nod ALLY_CHAZ
                nextText $0,ALLY_CHAZ   ; "I'll try.{W2}"
                nextSingleText $0,ALLY_CHAZ ; "What would you like to know?{W1}"
                setActscriptWait FOLLOWER_B,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $80,FOLLOWER_B ; "Oh, this will be a great{N}help!{W1}"
                entityActionsWait 128
                 moveDown 1
                 moveRight 1
                 faceUp 1
                endActions
                setFacing ALLY_CHAZ,DOWN
                setFacing FOLLOWER_B,DOWN
                nextSingleText $0,128   ; "You can use the room below.{W1}"
                entityActionsWait FOLLOWER_B
                 moveDown 1
                 faceLeft 1
                endActions
                setFacing 128,RIGHT
                nextSingleText $80,FOLLOWER_B ; "Thank you very much.{W1}"
                setFacing FOLLOWER_B,DOWN
                nextSingleText $80,FOLLOWER_B ; "I really appreciate this.{W1}"
                csWait 20
                entityActions ALLY_CHAZ
                 moveUp 1
                endActions
                entityActionsWait 128
                 moveUp 1
                endActions
                setPos ALLY_CHAZ,63,63,DOWN
                entityActionsWait 128
                 moveUp 1
                endActions
                setPos 128,63,63,DOWN
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                csc_end
cs_60BA6:       textCursor 3434
                nextSingleText $0,ALLY_CHAZ ; "I heard you're going to{N}defeat the devils....{W1}"
                nod FOLLOWER_B
                nextSingleText $0,FOLLOWER_B ; "Yep.  {LEADER} just{N}solved the secret.  We{N}can now enter the tower.{W1}"
                nextText $0,ALLY_CHAZ   ; "The tower?{W2}"
                nextSingleText $0,ALLY_CHAZ ; "Then, all these disasters{N}were caused by Zeon?{W1}"
                csWait 30
                entityActionsWait 128
                 moveDown 1
                 moveRight 1
                 faceUp 1
                endActions
                setFacing FOLLOWER_B,DOWN
                setFacing ALLY_CHAZ,DOWN
                nextSingleText $0,128   ; "Let me help you.{W1}"
                csWait 5
                setActscript 128,eas_2xUpDown
                csWait 120
                nextSingleText $0,128   ; "I would like to give you{N}a hand.{W1}"
                entityActionsWait FOLLOWER_B
                 moveDown 1
                 faceLeft 1
                endActions
                setFacing 128,RIGHT
                nextSingleText $0,FOLLOWER_B ; "Oh, thank you.{W1}"
                setFacing FOLLOWER_B,DOWN
                nextSingleText $80,FOLLOWER_B ; "I appreciate your kindness.{W1}"
                csWait 20
                entityActions ALLY_CHAZ
                 moveUp 1
                endActions
                entityActionsWait 128
                 moveUp 1
                endActions
                setPos ALLY_CHAZ,63,63,DOWN
                entityActionsWait 128
                 moveUp 1
                endActions
                setPos 128,63,63,DOWN
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                followEntity ALLY_LEMON,FOLLOWER_B,2
                csc_end
cs_60C42:       textCursor 3442
                setActscriptWait ALLY_LEMON,eas_Init
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setPos ALLY_BOWIE,28,54,LEFT
                setPos ALLY_PETER,28,55,LEFT
                setPos FOLLOWER_B,27,53,LEFT
                setPos 128,26,50,DOWN
                setPos ALLY_CHAZ,25,53,RIGHT
                setCameraEntity 65535
                reloadMap 19,48
                fadeInB
                csWait 60
                nextSingleText $80,FOLLOWER_B ; "...and now we're here.{W1}"
                nextText $0,ALLY_CHAZ   ; "Wow!  Your story is so{N}complicated.{W2}"
                nextText $0,ALLY_CHAZ   ; "But, from what I understand,{N}Zeon is reviving.{W2}"
                nextSingleText $0,ALLY_CHAZ ; "And all these disasters were{N}caused by him?{W1}"
                csc_end
cs_60CA4:       textCursor 3446
                nod FOLLOWER_B
                nextSingleText $80,FOLLOWER_B ; "That's right.  We have to{N}find out where the Holy{N}Sword is.{W1}"
                csWait 20
                nextText $0,ALLY_CHAZ   ; "I think I've seen it in a{N}book....{W2}"
                shiver ALLY_CHAZ
                nextSingleText $0,ALLY_CHAZ ; "Yes, I did...but...{N}I don't remember....{W1}"
                setFacing ALLY_CHAZ,LEFT
                csWait 40
                shiver FOLLOWER_B
                nextSingleText $80,FOLLOWER_B ; "It's important...{W1}"
                setFacing ALLY_CHAZ,RIGHT
                nextSingleText $0,ALLY_CHAZ ; "Please, give me a moment.{W1}"
                setFacing ALLY_CHAZ,LEFT
                csWait 60
                customActscriptWait ALLY_CHAZ
                 ac_setSpeed 20,20      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_CHAZ
                 moveLeft 2
                 faceLeft 20
                 faceRight 20
                 moveRight 2
                 eaWait 20
                endActions
                setFacing ALLY_CHAZ,LEFT
                csWait 20
                entityActionsWait ALLY_CHAZ
                 moveLeft 2
                 faceLeft 20
                 faceRight 20
                 moveRight 2
                 eaWait 20
                endActions
                setFacing ALLY_CHAZ,DOWN
                csWait 40
                nod ALLY_CHAZ
                nextSingleText $0,ALLY_CHAZ ; "Was it this one?{W1}"
                customActscriptWait ALLY_CHAZ
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_CHAZ
                 moveLeft 2
                 moveUp 2
                endActions
                csWait 30
                shiver ALLY_CHAZ
                shiver ALLY_CHAZ
                csWait 30
                shiver ALLY_CHAZ
                csWait 30
                nextSingleText $0,ALLY_CHAZ ; "No, that's not it.{W1}"
                customActscriptWait ALLY_CHAZ
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_CHAZ
                 moveDown 2
                 eaWait 80
                endActions
                setActscriptWait ALLY_CHAZ,eas_Init
                setActscriptWait ALLY_CHAZ,eas_Jump
                setActscriptWait ALLY_CHAZ,eas_Jump
                nextSingleText $0,ALLY_CHAZ ; "How about this one?{W1}"
                customActscriptWait ALLY_CHAZ
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_CHAZ
                 moveUp 2
                endActions
                csWait 30
                shiver ALLY_CHAZ
                shiver ALLY_CHAZ
                csWait 40
                shiver ALLY_CHAZ
                csWait 40
                setActscriptWait ALLY_CHAZ,eas_Jump
                setActscriptWait ALLY_CHAZ,eas_Jump
                nextSingleText $0,ALLY_CHAZ ; "Yeah, I got it!{W1}"
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait FOLLOWER_B
                 moveUp 1
                 moveLeft 2
                endActions
                nextSingleText $80,FOLLOWER_B ; "Is that the right one?{W1}"
                setFacing ALLY_CHAZ,RIGHT
                nod ALLY_CHAZ
                nextSingleText $0,ALLY_CHAZ ; "Yes!  But...{W1}"
                nextSingleText $80,FOLLOWER_B ; "But what?{W1}"
                setActscriptWait ALLY_CHAZ,eas_Init
                entityActionsWait ALLY_CHAZ
                 moveDown 1
                 faceRight 1
                endActions
                nextSingleText $0,ALLY_CHAZ ; "The most important part is{N}missing.  It's been stolen.{W1}"
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait FOLLOWER_B,eas_JumpRight
                csWait 10
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait FOLLOWER_B
                 moveLeft 2
                endActions
                nextText $80,FOLLOWER_B ; "Who could've taken it?{W2}"
                setFacing FOLLOWER_B,DOWN
                nextSingleText $80,FOLLOWER_B ; "Oh, we've lost the key.{W1}"
                csWait 40
                entityActionsWait ALLY_PETER
                 moveLeft 4
                 moveUp 1
                endActions
                setFacing ALLY_CHAZ,DOWN
                nextText $80,ALLY_PETER ; "Not necessarily, Sir Astral.{W2}"
                nextSingleText $80,ALLY_PETER ; "Believe in {LEADER}.{N}He was chosen by the gods.{W1}"
                nextText $80,FOLLOWER_B ; "Hmmm....{W2}"
                nod FOLLOWER_B
                nextSingleText $80,FOLLOWER_B ; "Yes, {NAME;7} is right.{N}{LEADER} is our leader!{W1}"
                setActscriptWait FOLLOWER_B,eas_Init
                entityActionsWait FOLLOWER_B
                 moveRight 4
                 faceDown 1
                endActions
                setFacing ALLY_BOWIE,UP
                nextText $80,FOLLOWER_B ; "{LEADER}, we have to{N}find the Holy Sword and{N}the door to the tower.{W2}"
                nextSingleText $80,FOLLOWER_B ; "The legends only hint of{N}you, but we believe in you.{W1}"
                nod ALLY_BOWIE
                entityActionsWait 128
                 moveDown 1
                endActions
                setFacing FOLLOWER_B,UP
                setFacing ALLY_CHAZ,RIGHT
                nextSingleText $0,128   ; "Believe in the power of{N}your jewel!{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                entityActionsWait 128
                 moveUp 1
                 faceDown 1
                endActions
                csc_end
cs_60EB2:       textCursor 3468
                nod FOLLOWER_B
                nextSingleText $80,FOLLOWER_B ; "Yes, that's the truth.{W1}"
                csWait 40
                entityActionsWait FOLLOWER_B
                 moveRight 1
                endActions
                setFacing FOLLOWER_B,DOWN
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing ALLY_LEMON,UP
                nextSingleText $80,FOLLOWER_B ; "Now, {LEADER}.{W1}"
                nod ALLY_BOWIE
                entityActionsWait 128
                 moveDown 1
                endActions
                setFacing FOLLOWER_B,UP
                setFacing ALLY_CHAZ,RIGHT
                nextSingleText $0,128   ; "We need to return and{N}restore world peace.{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                followEntity ALLY_LEMON,FOLLOWER_B,2
                entityActionsWait 128
                 moveUp 1
                 faceDown 1
                endActions
                csc_end
cs_60F18:       textCursor 3471
                nextSingleText $0,ALLY_CHAZ ; "{LEADER}, would you mind{N}if I went with you?{W1}"
                faceEntity FOLLOWER_B,ALLY_CHAZ
                nextSingleText $80,FOLLOWER_B ; "No, {NAME;27}.  You have{N}to continue your work.{W1}"
                nextText $0,ALLY_CHAZ   ; "I knew you'd say that, but I{N}can't continue my work if{N}Zeon revives.{W2}"
                nextSingleText $0,ALLY_CHAZ ; "Also, as a historian, I{N}want to see the King of{N}the Devils.{W1}"
                faceEntity ALLY_PETER,ALLY_CHAZ
                nextSingleText $80,ALLY_PETER ; "{NAME;27} will just follow{N}us if you don't let him{N}join us.{W1}"
                nod ALLY_CHAZ
                nextSingleText $0,ALLY_CHAZ ; "{NAME;7} is right.{W1}"
                nextSingleText $80,FOLLOWER_B ; "(Sigh)...OK.{W1}"
                join ALLY_CHAZ
                nextSingleText $0,ALLY_CHAZ ; "I'm so excited!{W1}"
                shiver ALLY_CHAZ
                csWait 30
                nextSingleText $80,ALLY_PETER ; "This is not a sight-seeing{N}tour, OK?!{N}Let's go {LEADER}!{W1}"
                followEntity ALLY_CHAZ,ALLY_BOWIE,5
                csc_end
cs_60F64:       textCursor 3480
                nextText $FF,255        ; "It's a fine-looking piano.{N}Will you play it?{W1}"
                yesNo
                jumpIfFlagClear 89,cs_60FA4 ; YES/NO prompt answer
                textCursor 3481
                playSound MUSIC_PIANO_THEME
                csWait 120
                setQuake 1
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 90
                setQuake 0
                csWait 30
                nextSingleText $FF,255  ; "Something opened somewhere.{W1}"
                setBlocks 32,45,1,1,11,4
                setF 940                ; Set after playing the piano in Yeel (during the late game)
                csc_end
cs_60FA4:       textCursor 3482
                nextSingleText $FF,255  ; "{LEADER}, can't you play?{W1}"
                csc_end
