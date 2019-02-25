
; ASM FILE data\maps\entries\map05\mapsetups\scripts_1.asm :
; 0x60708..0x60FAE : 
cs_60708:       textCursor $DB9
                setPos $1C,21,33,DOWN
                setActscriptWait $1C,eas_Init
                nextSingleText $80,$1C  ; "Sir Astral!  {LEADER}!{W1}"
                setCamDest 16,28
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                setPos $0,21,39,UP
                setPos $7,22,39,UP
                setPos $1F,20,39,UP
                nextSingleText $80,$1C  ; "{LEADER}, wait!{W1}"
                entityActionsWait $1C
                 moveDown 2
                endActions
                setCamDest 16,33
                nextSingleText $80,$1C  ; "May I join your force?{W1}"
                csWait 50
                nextSingleText $0,$1F   ; "Well...{W1}"
                csWait 30
                nextText $80,$1C        ; "You can trust me.{N}I'm a born fighter.{W2}"
                nextText $80,$1C        ; "As you know, I want to die.{W2}"
                nextSingleText $80,$1C  ; "I will die fighting for your{N}cause, if you let me.{W1}"
                csWait 40
                setFacing $1F,RIGHT
                setFacing $0,LEFT
                setFacing $7,LEFT
                nextSingleText $0,$1F   ; "He's a hero in Galam.{N}I think he should join us.{W1}"
                nod $0
                nod $7
                csWait 20
                entityActions $0
                 moveUp 3
                endActions
                entityActions $7
                 moveUp 4
                 faceLeft 1
                endActions
                entityActionsWait $1F
                 moveUp 4
                 faceRight 1
                endActions
                nextSingleText $0,$1F   ; "{NAME;28}, please come{N}with us.  You'll be a great{N}help.{W1}"
                join $1C
                setActscriptWait $1C,eas_Jump
                setActscriptWait $1C,eas_Jump
                nextSingleText $80,$1C  ; "Oh, thank you!  I know I can{N}take the King of the Devils!{W1}"
                followEntity $7,$0,$2
                followEntity $1F,$7,$2
                followEntity $1C,$1F,$2
                csc_end
cs_607DE:       textCursor $D3C
                setPos $82,63,63,DOWN
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                setPos $0,21,39,UP
                setPos $7,22,40,UP
                setPos $1F,20,40,UP
                reloadMap 16,34
                fadeInB
                nextSingleText $0,$1C   ; "I'm guilty!{W1}"
                csWait 5
                setActscript $0,eas_461B6
                csWait 5
                setActscript $7,eas_461E4
                csWait 5
                setActscript $1F,eas_461B6
                csWait 80
                entityActionsWait $7
                 moveUp 2
                endActions
                setFacing $0,UP
                setFacing $1F,UP
                nextSingleText $0,$7    ; "Hey, there's {NAME;28}.{W1}"
                setCamDest 13,28
                nextText $0,$1C         ; "I've killed a lot of people{N}for the devils!{W2}"
                setFacing $1C,DOWN
                shiver $1C
                nextSingleText $0,$1C   ; "The guilt is too much to{N}handle.  I must die!{W1}"
                setActscriptWait $1C,eas_46172
                customActscriptWait $1C
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                nod $1C
                csWait 30
                entityActionsWait $1C
                 moveUp 5
                 moveRight 3
                endActions
                setFacing $1C,DOWN
                customActscriptWait $1C
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $2          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $1C,eas_46172
                playSound SFX_FALLING
                entityActionsWait $1C
                 moveDown 6
                endActions
                setPos $1C,63,63,DOWN
                setPos $82,19,33,DOWN
                setQuake 5
                csWait 60
                setQuake 0
                setCamDest 16,34
                entityActionsWait $7
                 moveLeft 1
                 moveUp 1
                endActions
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_Jump
                setFacing $7,DOWN
                nextSingleText $0,$7    ; "Gee!{N}{NAME;28} killed himself!{W1}"
                entityActionsWait $1F
                 moveUp 2
                endActions
                setFacing $0,LEFT
                setFacing $7,LEFT
                nextText $0,$1F         ; "No, {NAME;28} cannot die{N}by jumping off a cliff.{W2}"
                setFacing $1F,RIGHT
                nextText $0,$1F         ; "{NAME;28} is an immortal{N}vampire.{W2}"
                nextSingleText $0,$1F   ; "But, I'm sure the impact{N}didn't feel too good.{W1}"
                nod $0
                nod $7
                followEntity $7,$0,$2
                followEntity $1F,$7,$2
                setActscriptWait $1C,eas_Init
                startEntity $1C
                csc_end
cs_6093A:       textCursor $D44
                setPriority $1B,$0
                setPriority $80,$FFFF
                setCamDest 6,2
                setActscriptWait $1C,eas_Init
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                setFacing $1C,UP
                setDest $0,11,7
                setDest $7,11,7
                setDest $1F,11,7
                entityActionsWait $7
                 moveRight 1
                 faceUp 1
                endActions
                entityActionsWait $1F
                 moveLeft 1
                 faceUp 1
                endActions
                setActscriptWait $80,eas_Jump
                setActscriptWait $80,eas_Jump
                nextText $80,$80        ; "Ah, devils finally found the{N}hidden door.{W1}"
                nextSingleText $80,$80  ; "I must give the people time{N}to escape!{W1}"
                nextSingleText $FF,$FF  ; "The priest pulls out a holy{N}symbol.{W1}"
                setPriority $83,$FFFF
                setPriority $80,$0
                playSound SFX_LANDSTALKER_ITEM
                setPos $83,11,4,DOWN
                csWait 60
                entityActions $83
                 moveDown 1
                endActions
                entityActionsWait $80
                 moveDown 1
                endActions
                shiver $80
                setFacing $0,LEFT
                setFacing $7,LEFT
                nextSingleText $80,$7   ; "What's he doing?{W1}"
                nextSingleText $0,$1F   ; "He's mistaking us for devils.{W1}"
                hide $83
                csWait 20
                shiver $80
                setFacing $7,UP
                setFacing $0,UP
                nextText $80,$80        ; "What tough devils!{W2}"
                nextSingleText $80,$80  ; "My symbol doesn't drive{N}them away!{W1}"
                entityActionsWait $1F
                 moveUp 1
                endActions
                nextSingleText $0,$1F   ; "Excuse me, we're not devils.{W1}"
                shiver $80
                nextSingleText $80,$80  ; "I don't believe you!{W1}"
                nextSingleText $80,$7   ; "But we really...{W1}"
                setPriority $1B,$0
                setPriority $80,$FFFF
                setPos $1B,11,4,DOWN
                csWait 30
                nextSingleText $0,$1B   ; "Brother?{W1}"
                setFacing $80,UP
                setActscriptWait $80,eas_Jump
                setActscriptWait $80,eas_Jump
                nextText $80,$80        ; "{NAME;27}, they found the{N}hidden door!{W2}"
                nextSingleText $80,$80  ; "I tried to drive them away{N}with this holy symbol, but{N}I failed.{W1}"
                setPriority $80,$0
                nod $1B
                nextSingleText $0,$1B   ; "Then, they're not devils.{W1}"
                shiver $80
                nextSingleText $80,$80  ; "Nobody but devils ever come{N}to such a dangerous place!{N}They must be devils!{W1}"
                csWait 20
                nextSingleText $0,$1B   ; "Have you asked them?{W1}"
                entityActionsWait $1F
                 moveRight 1
                 faceUp 1
                 jumpUp 1
                 jumpUp 1
                endActions
                nextText $80,$1F        ; "How can we explain this?{W2}"
                nextSingleText $80,$1F  ; "We are from Granseal.{N}We came here to defeat the{N}devils.{W1}"
                setFacing $80,DOWN
                shiver $1B
                nextSingleText $0,$1B   ; "Granseal?{W1}"
                entityActionsWait $80
                 moveLeft 1
                 faceRight 1
                endActions
                csWait 20
                nextSingleText $0,$1B   ; "Really?{W1}"
                entityActionsWait $1B
                 moveDown 1
                endActions
                nextSingleText $0,$1B   ; "Alright!{W1}"
                csWait 40
                nextSingleText $0,$1B   ; "This is great news!{W1}"
                setActscriptWait $1B,eas_Jump
                setActscriptWait $1B,eas_Jump
                nextSingleText $0,$1B   ; "Are you Sir Astral?{W1}"
                nod $1F
                nextSingleText $80,$1F  ; "Yes, but...I'm sorry, have{N}we met?{W1}"
                nextText $0,$1B         ; "I'm {NAME;27}, a son of{N}Hawel.{W2}"
                nextSingleText $0,$1B   ; "Do you remember me?{W1}"
                setActscriptWait $1F,eas_Jump
                setActscriptWait $1F,eas_Jump
                nextSingleText $80,$1F  ; "Hawel's son?{W1}"
                entityActionsWait $1F
                 moveRight 1
                 moveUp 1
                 faceLeft 1
                endActions
                setFacing $1B,RIGHT
                shiver $1F
                nextText $80,$1F        ; "Oh, {NAME;27}!{W2}"
                nextText $80,$1F        ; "Yes, of course.{N}Nice to see you again.{W2}"
                nextSingleText $80,$1F  ; "What are you doing here?{W1}"
                csc_end
cs_60B10:       textCursor $D62
                nextSingleText $0,$1B   ; "I came back to Yeel to{N}continue my father's work.{W1}"
                nextSingleText $80,$1F  ; "{NAME;27}, maybe you can{N}answer some questions?{W1}"
                nod $1B
                nextText $0,$1B         ; "I'll try.{W2}"
                nextSingleText $0,$1B   ; "What would you like to know?{W1}"
                setActscriptWait $1F,eas_Jump
                setActscriptWait $1F,eas_Jump
                nextSingleText $80,$1F  ; "Oh, this will be a great{N}help!{W1}"
                entityActionsWait $80
                 moveDown 1
                 moveRight 1
                 faceUp 1
                endActions
                setFacing $1B,DOWN
                setFacing $1F,DOWN
                nextSingleText $0,$80   ; "You can use the room below.{W1}"
                entityActionsWait $1F
                 moveDown 1
                 faceLeft 1
                endActions
                setFacing $80,RIGHT
                nextSingleText $80,$1F  ; "Thank you very much.{W1}"
                setFacing $1F,DOWN
                nextSingleText $80,$1F  ; "I really appreciate this.{W1}"
                csWait 20
                entityActions $1B
                 moveUp 1
                endActions
                entityActionsWait $80
                 moveUp 1
                endActions
                setPos $1B,63,63,DOWN
                entityActionsWait $80
                 moveUp 1
                endActions
                setPos $80,63,63,DOWN
                followEntity $7,$0,$2
                followEntity $1F,$7,$2
                csc_end
cs_60BA6:       textCursor $D6A
                nextSingleText $0,$1B   ; "I heard you're going to{N}defeat the devils....{W1}"
                nod $1F
                nextSingleText $0,$1F   ; "Yep.  {LEADER} just{N}solved the secret.  We{N}can now enter the tower.{W1}"
                nextText $0,$1B         ; "The tower?{W2}"
                nextSingleText $0,$1B   ; "Then, all these disasters{N}were caused by Zeon?{W1}"
                csWait 30
                entityActionsWait $80
                 moveDown 1
                 moveRight 1
                 faceUp 1
                endActions
                setFacing $1F,DOWN
                setFacing $1B,DOWN
                nextSingleText $0,$80   ; "Let me help you.{W1}"
                csWait 5
                setActscript $80,eas_461E4
                csWait 120
                nextSingleText $0,$80   ; "I would like to give you{N}a hand.{W1}"
                entityActionsWait $1F
                 moveDown 1
                 faceLeft 1
                endActions
                setFacing $80,RIGHT
                nextSingleText $0,$1F   ; "Oh, thank you.{W1}"
                setFacing $1F,DOWN
                nextSingleText $80,$1F  ; "I appreciate your kindness.{W1}"
                csWait 20
                entityActions $1B
                 moveUp 1
                endActions
                entityActionsWait $80
                 moveUp 1
                endActions
                setPos $1B,63,63,DOWN
                entityActionsWait $80
                 moveUp 1
                endActions
                setPos $80,63,63,DOWN
                followEntity $7,$0,$2
                followEntity $1F,$7,$2
                followEntity $1C,$1F,$2
                csc_end
cs_60C42:       textCursor $D72
                setActscriptWait $1C,eas_Init
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                setPos $0,28,54,LEFT
                setPos $7,28,55,LEFT
                setPos $1F,27,53,LEFT
                setPos $80,26,50,DOWN
                setPos $1B,25,53,RIGHT
                setCameraEntity $FFFF
                reloadMap 19,48
                fadeInB
                csWait 60
                nextSingleText $80,$1F  ; "...and now we're here.{W1}"
                nextText $0,$1B         ; "Wow!  Your story is so{N}complicated.{W2}"
                nextText $0,$1B         ; "But, from what I understand,{N}Zeon is reviving.{W2}"
                nextSingleText $0,$1B   ; "And all these disasters were{N}caused by him?{W1}"
                csc_end
cs_60CA4:       textCursor $D76
                nod $1F
                nextSingleText $80,$1F  ; "That's right.  We have to{N}find out where the Holy{N}Sword is.{W1}"
                csWait 20
                nextText $0,$1B         ; "I think I've seen it in a{N}book....{W2}"
                shiver $1B
                nextSingleText $0,$1B   ; "Yes, I did...but...{N}I don't remember....{W1}"
                setFacing $1B,LEFT
                csWait 40
                shiver $1F
                nextSingleText $80,$1F  ; "It's important...{W1}"
                setFacing $1B,RIGHT
                nextSingleText $0,$1B   ; "Please, give me a moment.{W1}"
                setFacing $1B,LEFT
                csWait 60
                customActscriptWait $1B
                 ac_setSpeed 20,20      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1B
                 moveLeft 2
                 faceLeft 20
                 faceRight 20
                 moveRight 2
                 eaWait 20
                endActions
                setFacing $1B,LEFT
                csWait 20
                entityActionsWait $1B
                 moveLeft 2
                 faceLeft 20
                 faceRight 20
                 moveRight 2
                 eaWait 20
                endActions
                setFacing $1B,DOWN
                csWait 40
                nod $1B
                nextSingleText $0,$1B   ; "Was it this one?{W1}"
                customActscriptWait $1B
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1B
                 moveLeft 2
                 moveUp 2
                endActions
                csWait 30
                shiver $1B
                shiver $1B
                csWait 30
                shiver $1B
                csWait 30
                nextSingleText $0,$1B   ; "No, that's not it.{W1}"
                customActscriptWait $1B
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1B
                 moveDown 2
                 eaWait 80
                endActions
                setActscriptWait $1B,eas_Init
                setActscriptWait $1B,eas_Jump
                setActscriptWait $1B,eas_Jump
                nextSingleText $0,$1B   ; "How about this one?{W1}"
                customActscriptWait $1B
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1B
                 moveUp 2
                endActions
                csWait 30
                shiver $1B
                shiver $1B
                csWait 40
                shiver $1B
                csWait 40
                setActscriptWait $1B,eas_Jump
                setActscriptWait $1B,eas_Jump
                nextSingleText $0,$1B   ; "Yeah, I got it!{W1}"
                customActscriptWait $1F
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1F
                 moveUp 1
                 moveLeft 2
                endActions
                nextSingleText $80,$1F  ; "Is that the right one?{W1}"
                setFacing $1B,RIGHT
                nod $1B
                nextSingleText $0,$1B   ; "Yes!  But...{W1}"
                nextSingleText $80,$1F  ; "But what?{W1}"
                setActscriptWait $1B,eas_Init
                entityActionsWait $1B
                 moveDown 1
                 faceRight 1
                endActions
                nextSingleText $0,$1B   ; "The most important part is{N}missing.  It's been stolen.{W1}"
                setActscriptWait $1F,eas_Init
                setActscriptWait $1F,eas_JumpRight
                csWait 10
                customActscriptWait $1F
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1F
                 moveLeft 2
                endActions
                nextText $80,$1F        ; "Who could've taken it?{W2}"
                setFacing $1F,DOWN
                nextSingleText $80,$1F  ; "Oh, we've lost the key.{W1}"
                csWait 40
                entityActionsWait $7
                 moveLeft 4
                 moveUp 1
                endActions
                setFacing $1B,DOWN
                nextText $80,$7         ; "Not necessarily, Sir Astral.{W2}"
                nextSingleText $80,$7   ; "Believe in {LEADER}.{N}He was chosen by the gods.{W1}"
                nextText $80,$1F        ; "Hmmm....{W2}"
                nod $1F
                nextSingleText $80,$1F  ; "Yes, {NAME;7} is right.{N}{LEADER} is our leader!{W1}"
                setActscriptWait $1F,eas_Init
                entityActionsWait $1F
                 moveRight 4
                 faceDown 1
                endActions
                setFacing $0,UP
                nextText $80,$1F        ; "{LEADER}, we have to{N}find the Holy Sword and{N}the door to the tower.{W2}"
                nextSingleText $80,$1F  ; "The legends only hint of{N}you, but we believe in you.{W1}"
                nod $0
                entityActionsWait $80
                 moveDown 1
                endActions
                setFacing $1F,UP
                setFacing $1B,RIGHT
                nextSingleText $0,$80   ; "Believe in the power of{N}your jewel!{W1}"
                followEntity $7,$0,$2
                followEntity $1F,$7,$2
                entityActionsWait $80
                 moveUp 1
                 faceDown 1
                endActions
                csc_end
cs_60EB2:       textCursor $D8C
                nod $1F
                nextSingleText $80,$1F  ; "Yes, that's the truth.{W1}"
                csWait 40
                entityActionsWait $1F
                 moveRight 1
                endActions
                setFacing $1F,DOWN
                setFacing $0,UP
                setFacing $7,UP
                setFacing $1C,UP
                nextSingleText $80,$1F  ; "Now, {LEADER}.{W1}"
                nod $0
                entityActionsWait $80
                 moveDown 1
                endActions
                setFacing $1F,UP
                setFacing $1B,RIGHT
                nextSingleText $0,$80   ; "We need to return and{N}restore world peace.{W1}"
                followEntity $7,$0,$2
                followEntity $1F,$7,$2
                followEntity $1C,$1F,$2
                entityActionsWait $80
                 moveUp 1
                 faceDown 1
                endActions
                csc_end
cs_60F18:       textCursor $D8F
                nextSingleText $0,$1B   ; "{LEADER}, would you mind{N}if I went with you?{W1}"
                faceEntity $1F,$1B
                nextSingleText $80,$1F  ; "No, {NAME;27}.  You have{N}to continue your work.{W1}"
                nextText $0,$1B         ; "I knew you'd say that, but I{N}can't continue my work if{N}Zeon revives.{W2}"
                nextSingleText $0,$1B   ; "Also, as a historian, I{N}want to see the King of{N}the Devils.{W1}"
                faceEntity $7,$1B
                nextSingleText $80,$7   ; "{NAME;27} will just follow{N}us if you don't let him{N}join us.{W1}"
                nod $1B
                nextSingleText $0,$1B   ; "{NAME;7} is right.{W1}"
                nextSingleText $80,$1F  ; "(Sigh)...OK.{W1}"
                join $1B
                nextSingleText $0,$1B   ; "I'm so excited!{W1}"
                shiver $1B
                csWait 30
                nextSingleText $80,$7   ; "This is not a sight-seeing{N}tour, OK?!{N}Let's go {LEADER}!{W1}"
                followEntity $1B,$0,$5
                csc_end
cs_60F64:       textCursor $D98
                nextText $FF,$FF        ; "It's a fine-looking piano.{N}Will you play it?{W1}"
                yesNo
                jumpIfFlagClear $59,cs_60FA4; YES/NO prompt answer
                textCursor $D99
                playSound MUSIC_PIANO_THEME
                csWait 120
                setQuake 1
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 90
                setQuake 0
                csWait 30
                nextSingleText $FF,$FF  ; "Something opened somewhere.{W1}"
                setBlocks 32,45,1,1,11,4
                setF $3AC               ; Set after playing the piano in Yeel (during the late game)
                csc_end
cs_60FA4:       textCursor $D9A
                nextSingleText $FF,$FF  ; "{LEADER}, can't you play?{W1}"
                csc_end
