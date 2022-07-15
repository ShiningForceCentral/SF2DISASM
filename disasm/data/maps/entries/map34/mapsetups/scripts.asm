
; ASM FILE data\maps\entries\map34\mapsetups\scripts.asm :
; 0x5B6C0..0x5BFEE : 
cs_5B6C0:       textCursor 3207
                setCamDest 2,4
                nextText $80,128        ; "Yeeenn...queeen...{N}tillooora...synooora...{N}hear my voice....{W2}"
                nextSingleText $80,128  ; "Evil Spirit, come.{W1}"
                entityFlashWhite 128,$64
                setPos 130,7,6,DOWN
                csWait 7
                setPos 130,60,60,DOWN
                csWait 80
                setPos 130,7,6,DOWN
                csWait 7
                setPos 130,60,60,DOWN
                csWait 60
                setPos 130,7,6,DOWN
                csWait 7
                setPos 130,60,60,DOWN
                csWait 40
                entityActionsWait 129
                 moveUp 1
                endActions
                nextSingleText $0,129   ; "Hey, Evil Spirit is{N}appearing!{W1}"
                setCamDest 2,2
                setPos 130,7,6,DOWN
                csWait 7
                setPos 130,60,60,DOWN
                csWait 60
                setPos 130,7,6,DOWN
                csWait 7
                setPos 130,60,60,DOWN
                csWait 50
                setPos 130,7,6,DOWN
                csWait 7
                setPos 130,60,60,DOWN
                csWait 40
                setPos 130,7,6,DOWN
                csWait 7
                setPos 130,60,60,DOWN
                csWait 30
                setPos 130,7,6,DOWN
                csWait 7
                setPos 130,60,60,DOWN
                csWait 20
                setPos 130,7,6,DOWN
                csWait 7
                setPos 130,60,60,DOWN
                csWait 10
                setPos 130,7,6,DOWN
                setActscript 130,eas_Transparent
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setPos ALLY_BOWIE,7,12,UP
                setPos ALLY_PETER,6,12,UP
                setPos FOLLOWER_B,8,12,UP
                setCamDest 2,4
                entityActionsWait 128
                 moveUp 1
                endActions
                nextSingleText $80,128  ; "Ahhh....{W1}"
                nextSingleText $0,130   ; "Creed, what do you want?{W1}"
                nextSingleText $80,128  ; "Zeon.{W1}"
                nextSingleText $0,130   ; "Zeon?!  The King of the{N}Devils?{W1}"
                nod 128
                nextText $80,128        ; "Yes.{W2}"
                nextText $80,128        ; "He was unsealed.{W1}"
                nextText $80,128        ; "What is he doing now?{N}What is he going to do?{W2}"
                nextSingleText $80,128  ; "I need to know anything{N}about him.  Anything!{W1}"
                nextText $0,130         ; "I've got something.{W1}"
                csWait 40
                flashScreenWhite $4
                csWait 30
                flashScreenWhite $4
                csWait 20
                flashScreenWhite $4
                mapFadeOutToWhite
                csWait 30
                nextSingleText $0,130   ; "Hmmmm....{N}Hmmmm...mmmm....{W1}"
                entityActions ALLY_BOWIE
                 moveUp 1
                endActions
                entityActions ALLY_PETER
                 moveUp 1
                endActions
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "What is he doing now?{W1}"
                setFacing 129,DOWN
                nextText $0,129         ; "He's channeling his mind{N}into the nature of all{N}things.{W2}"
                setFacing 129,UP
                mapFadeInFromWhite
                csWait 40
                setFacing 129,DOWN
                nextSingleText $0,129   ; "Shhhh!  Be silent.{N}He's got something.{W1}"
                setFacing 129,UP
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                nextSingleText $80,128  ; "What did you find?{W1}"
                nextSingleText $0,130   ; "The barrier around Grans{N}Island is too strong.{N}I can't see anything.{W1}"
                shiver 128
                nextSingleText $80,128  ; "Please try again!{W1}"
                nextSingleText $0,130   ; "If I touch something of his,{N}maybe I could contact his{N}mind better....{W1}"
                setCamDest 2,5
                setFacing ALLY_PETER,RIGHT
                setFacing ALLY_BOWIE,LEFT
                setFacing FOLLOWER_B,LEFT
                nextSingleText $0,ALLY_PETER ; "{LEADER}, you have the{N}Jewel of Evil, right?{W1}"
                setFacing 128,DOWN
                setFacing 129,DOWN
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                nextText $80,128        ; "Is this true, {LEADER}?{W2}"
                nextSingleText $80,128  ; "That's one of the magic{N}jewels used to seal{N}Zeon.  Give it to me.{W1}"
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                nextSingleText $0,ALLY_PETER ; "But, we can't remove it.{W1}"
                nextSingleText $80,128  ; "I can.{W1}"
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $80,128  ; "Let me see it.{W1}"
                setActscriptWait 128,eas_DeactivateAutoFacing
                entityActions 128
                 moveDown 1
                endActions
                csWait 2
                setActscriptWait 128,eas_StopMoving
                stopEntity 128
                csWait 20
                entityFlashWhite ALLY_BOWIE,$28
                startEntity 128
                entityActions 128
                 moveUp 1
                endActions
                csWait 2
                setActscriptWait 128,eas_StopMoving
                headshake 128
                nextText $80,128        ; "Whhoooa!{W2}"
                nextSingleText $80,128  ; "What's that light?{N}There are two!{W1}"
                nextSingleText $0,ALLY_PETER ; "The other one is...{N}...ahhh...they called it,{N}the Jewel of Light.{W1}"
                shiver 128
                nextText $80,128        ; "What?!{W2}"
                nextText $80,128        ; "{LEADER}, do you have both{N}of the legendary jewels?{W2}"
                nextText $80,128        ; "I can't remove them.{N}The chain is made of Mithril.{W2}"
                nextSingleText $80,128  ; "Show them to him.{N}They might help him.{W1}"
                nod ALLY_BOWIE
                csWait 20
                setCamDest 2,4
                setActscriptWait 128,eas_Init
                entityActions 128
                 moveRight 1
                 moveUp 1
                endActions
                entityActionsWait ALLY_BOWIE
                 moveUp 2
                endActions
                setFacing 129,UP
                nextSingleText $FF,255  ; "{LEADER} displays the{N}jewels to Evil Spirit.{W1}"
                entityFlashWhite ALLY_BOWIE,$28
                nextText $0,130         ; "Yeah, I feel it...I feel it...!{N}I think I can do it now.{N}Let me try again.{W1}"
                executeSubroutine csub_55EF4
                csWait 20
                executeSubroutine sub_55F82
                csWait 40
                executeSubroutine csub_55EF4
                csWait 30
                executeSubroutine sub_55F82
                csWait 30
                executeSubroutine csub_55EF4
                csWait 40
                executeSubroutine sub_55F82
                csWait 20
                executeSubroutine csub_55EF4
                nextSingleText $0,130   ; "Hmmmm....{N}Hmmmm...mmmm....{W1}"
                csWait 100
                nextSingleText $0,130   ; "Arc Valley was opened and{N}Zeon was revived.{W1}"
                nextSingleText $80,128  ; "Go on.{W1}"
                nextSingleText $0,130   ; "Zeon's devils are coming to{N}Parmecia from the sky.{W1}"
                nextText $80,128        ; "Hmmm....{W2}"
                nextSingleText $80,128  ; "Where are they heading?{W1}"
                nextSingleText $0,130   ; "North Parmecia.{W1}"
                nextSingleText $80,128  ; "Something has happened to{N}Mitula....{W1}"
                nextSingleText $0,130   ; "I can't see Zeon.{W1}"
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                nextSingleText $80,128  ; "What do you mean?{W1}"
                nextText $0,130         ; "He's still in Arc Valley.{W2}"
                nextSingleText $0,130   ; "He has revived, but he has{N}not recovered his full{N}strength yet.{W1}"
                nextText $80,128        ; "But, he has already created{N}"
                nextText $80,128        ; "a lot of mischief on the{N}ground...{W2}"
                nextSingleText $80,128  ; "Is he that powerful?{W1}"
                nextSingleText $0,130   ; "He is.{N}His power...{W1}"
                executeSubroutine sub_5BFDA
                csWait 10
                executeSubroutine csub_5BFD0
                nextSingleText $80,128  ; "His power what?{W1}"
                executeSubroutine sub_5BFDA
                csWait 10
                executeSubroutine csub_5BFD0
                nextSingleText $0,130   ; "Hi...s...pow...er...{W1}"
                executeSubroutine sub_5BFDA
                csWait 10
                executeSubroutine csub_5BFD0
                csWait 10
                executeSubroutine sub_5BFDA
                flashScreenWhite $28
                executeSubroutine sub_5BFE4
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscript FOLLOWER_B,eas_Jump
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscript FOLLOWER_B,eas_Jump
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                nextSingleText $0,131   ; "I'm Zeon!  I'm the King of{N}the Devils!{W1}"
                nextSingleText $80,128  ; "What's this?!{W1}"
                nextText $0,131         ; "Who's contacting me?{N}Do you want to die?{W1}"
                nextSingleText $0,131   ; "Ggggooo...I see a jewel.{N}The Jewel of Evil!{W1}"
                shiver 128
                nextText $80,128        ; "He's seeing us through the{N}eyes of Evil Spirit!{W2}"
                nextSingleText $80,128  ; "Impossible!{W1}"
                nextText $0,131         ; "You're {LEADER}.{N}I see you....{W2}"
                nextSingleText $0,131   ; "Listen, {LEADER}.{N}Bring that jewel to Arc{N}Valley.{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "Why should we?!{W1}"
                nextText $0,131         ; "I'll return Elis to you in{N}exchange for the jewel.{W2}"
                nextSingleText $0,131   ; "Come to Arc Valley...{N}Ggggooo...!{W1}"
                csWait 40
                flashScreenWhite $4
                executeSubroutine sub_5BFDA
                csWait 8
                executeSubroutine sub_5BFE4
                csWait 60
                flashScreenWhite $4
                executeSubroutine sub_5BFDA
                csWait 8
                executeSubroutine sub_5BFE4
                csWait 40
                flashScreenWhite $4
                executeSubroutine sub_5BFDA
                csWait 8
                executeSubroutine sub_5BFE4
                csWait 20
                flashScreenWhite $4
                executeSubroutine sub_5BFDA
                setQuake 5
                playSound SFX_BIG_DOOR_RUMBLE
                customActscriptWait 133
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 134
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 135
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 136
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 137
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 138
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 139
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 140
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 141
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 142
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 143
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 144
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 145
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 146
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 147
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 148
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPos 141,8,6,RIGHT
                setPos 142,7,5,RIGHT
                setPos 143,6,6,RIGHT
                setPos 144,7,7,RIGHT
                setActscript 141,eas_ClockwiseMoveUpLeft
                setActscript 142,eas_ClockwiseMoveUpRight
                setActscript 143,eas_ClockwiseMoveDownRight
                setActscript 144,eas_ClockwiseMoveDownLeft
                setPos 145,8,6,LEFT
                setPos 146,7,7,LEFT
                setPos 147,6,6,LEFT
                setPos 148,7,5,LEFT
                entityActions 145
                 moveRight 1
                endActions
                csWait 2
                setActscriptWait 145,eas_StopMoving
                entityActions 146
                 moveDown 1
                endActions
                csWait 2
                setActscriptWait 146,eas_StopMoving
                entityActions 147
                 moveLeft 1
                endActions
                csWait 2
                setActscriptWait 147,eas_StopMoving
                entityActions 148
                 moveUp 1
                endActions
                csWait 2
                setActscriptWait 148,eas_StopMoving
                setActscript 145,eas_CounterClockwiseMoveUpRight
                setActscript 146,eas_CounterClockwiseMoveUpLeft
                setActscript 147,eas_CounterClockwiseMoveDownLeft
                setActscript 148,eas_CounterClockwiseMoveDownRight
                playSound SFX_BATTLEFIELD_DEATH
                setPos 133,7,6,RIGHT
                setPos 134,7,6,RIGHT
                setPos 135,7,6,RIGHT
                setPos 136,7,6,RIGHT
                setPos 137,7,6,RIGHT
                setPos 138,7,6,RIGHT
                setPos 139,7,6,RIGHT
                setPos 140,7,6,RIGHT
                entityActions 133
                 moveRight 4
                endActions
                entityActions 134
                 moveUp 4
                endActions
                entityActions 135
                 moveLeft 4
                endActions
                entityActions 136
                 moveDown 4
                endActions
                entityActions 137
                 moveUpRight 4
                endActions
                entityActions 138
                 moveUpLeft 4
                endActions
                entityActions 139
                 moveDownLeft 4
                endActions
                entityActionsWait 140
                 moveDownRight 4
                endActions
                playSound SFX_BATTLEFIELD_DEATH
                setPos 133,7,6,RIGHT
                setPos 134,7,6,RIGHT
                setPos 135,7,6,RIGHT
                setPos 136,7,6,RIGHT
                setPos 137,7,6,RIGHT
                setPos 138,7,6,RIGHT
                setPos 139,7,6,RIGHT
                setPos 140,7,6,RIGHT
                entityActions 133
                 moveRight 4
                endActions
                entityActions 134
                 moveUp 4
                endActions
                entityActions 135
                 moveLeft 4
                endActions
                entityActions 136
                 moveDown 4
                endActions
                entityActions 137
                 moveUpRight 4
                endActions
                entityActions 138
                 moveUpLeft 4
                endActions
                entityActions 139
                 moveDownLeft 4
                endActions
                entityActionsWait 140
                 moveDownRight 4
                endActions
                playSound SFX_BATTLEFIELD_DEATH
                setPos 133,7,6,RIGHT
                setPos 134,7,6,RIGHT
                setPos 135,7,6,RIGHT
                setPos 136,7,6,RIGHT
                setPos 137,7,6,RIGHT
                setPos 138,7,6,RIGHT
                setPos 139,7,6,RIGHT
                setPos 140,7,6,RIGHT
                entityActions 133
                 moveRight 4
                endActions
                entityActions 134
                 moveUp 4
                endActions
                entityActions 135
                 moveLeft 4
                endActions
                entityActions 136
                 moveDown 4
                endActions
                entityActions 137
                 moveUpRight 4
                endActions
                entityActions 138
                 moveUpLeft 4
                endActions
                entityActions 139
                 moveDownLeft 4
                endActions
                entityActionsWait 140
                 moveDownRight 4
                endActions
                hide 130
                playSound SFX_BATTLEFIELD_DEATH
                playSound SFX_BIG_DOOR_RUMBLE
                setPos 133,7,6,RIGHT
                setPos 134,7,6,RIGHT
                setPos 135,7,6,RIGHT
                setPos 136,7,6,RIGHT
                setPos 137,7,6,RIGHT
                setPos 138,7,6,RIGHT
                setPos 139,7,6,RIGHT
                setPos 140,7,6,RIGHT
                entityActions 133
                 moveRight 4
                endActions
                entityActions 134
                 moveUp 4
                endActions
                entityActions 135
                 moveLeft 4
                endActions
                entityActions 136
                 moveDown 4
                endActions
                entityActions 137
                 moveUpRight 4
                endActions
                entityActions 138
                 moveUpLeft 4
                endActions
                entityActions 139
                 moveDownLeft 4
                endActions
                entityActionsWait 140
                 moveDownRight 4
                endActions
                playSound SFX_BATTLEFIELD_DEATH
                setPos 133,7,6,RIGHT
                setPos 134,7,6,RIGHT
                setPos 135,7,6,RIGHT
                setPos 136,7,6,RIGHT
                setPos 137,7,6,RIGHT
                setPos 138,7,6,RIGHT
                setPos 139,7,6,RIGHT
                setPos 140,7,6,RIGHT
                entityActions 133
                 moveRight 4
                endActions
                entityActions 134
                 moveUp 4
                endActions
                entityActions 135
                 moveLeft 4
                endActions
                entityActions 136
                 moveDown 4
                endActions
                entityActions 137
                 moveUpRight 4
                endActions
                entityActions 138
                 moveUpLeft 4
                endActions
                entityActions 139
                 moveDownLeft 4
                endActions
                entityActionsWait 140
                 moveDownRight 4
                endActions
                hide 133
                hide 134
                hide 135
                hide 136
                hide 137
                hide 138
                hide 139
                hide 140
                csWait 40
                hide 141
                hide 142
                hide 143
                hide 144
                hide 145
                hide 146
                hide 147
                hide 148
                setQuake 16389
                executeSubroutine sub_55F82
                csWait 60
                setFacing ALLY_BOWIE,DOWN
                setFacing 129,DOWN
                setFacing 128,DOWN
                nextText $80,128        ; "No!  Evil Spirit exploded!{W2}"
                nextText $80,128        ; "That's Zeon's power.{W2}"
                nextSingleText $80,128  ; "If he revives fully, his{N}power will be unimaginably{N}strong!{W1}"
                setFacing 129,RIGHT
                setFacing 128,LEFT
                nextSingleText $0,129   ; "Creed, how reliable was he,{N}I mean, Evil Spirit?{W1}"
                nextText $80,128        ; "Very.{W2}"
                setFacing 128,DOWN
                nextText $80,128        ; "Why does Zeon want the jewel?{W2}"
                nextSingleText $80,128  ; "No more questions...{N}...without Evil Spirit....{W1}"
                csWait 30
                entityActionsWait 128
                 moveDown 1
                 moveLeft 1
                 moveDown 5
                endActions
                hide 128
                entityActionsWait 129
                 moveLeft 1
                 moveDown 1
                endActions
                setFacing ALLY_PETER,DOWN
                setFacing FOLLOWER_B,DOWN
                nextText $0,129         ; "Creed?  Creed!{W2}"
                setActscriptWait 129,eas_Jump
                setActscriptWait 129,eas_Jump
                nextSingleText $0,129   ; "Hey, don't leave me here!{N}Wait for me!{W1}"
                entityActionsWait 129
                 moveDown 5
                endActions
                hide 129
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                csc_end

; =============== S U B R O U T I N E =======================================


csub_5BFD0:
                
                moveq   #0,d0
                jsr     sub_20058
                rts

    ; End of function csub_5BFD0


; =============== S U B R O U T I N E =======================================


sub_5BFDA:
                
                moveq   #1,d0
                jsr     sub_20058
                rts

    ; End of function sub_5BFDA


; =============== S U B R O U T I N E =======================================


sub_5BFE4:
                
                moveq   #2,d0
                jsr     sub_20058
                rts

    ; End of function sub_5BFE4

