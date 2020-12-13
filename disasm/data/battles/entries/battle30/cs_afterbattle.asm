
; ASM FILE data\battles\entries\battle30\cs_afterbattle.asm :
; 0x4C6A8..0x4C994 : Cutscene after battle 30
abcs_battle30:  textCursor 2765
                loadMapFadeIn MAP_INSIDE_MITULA,5,8
                loadMapEntities ce_4C96C
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,12,13,UP
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,11,13,UP
                stopEntity 128
                setActscriptWait 130,eas_DeactivateAutoFacing
                stopEntity 130
                setPriority ALLY_PETER,$0
                setPriority FOLLOWER_B,$FFFF
                fadeInB
                shiver 128
                nextSingleText $0,128   ; "Grrr...impossible!{N}Why...do I have to die?{W1}"
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                nextSingleText $0,FOLLOWER_B ; "Where is Mitula?{W1}"
                shiver 128
                nextSingleText $0,128   ; "I don't know...haven't{N}seen her.{W1}"
                csWait 40
                setFacing 128,UP
                customActscriptWait 128
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setQuake 2
                csWait 20
                setQuake 0
                setPos 130,11,10,UP
                customActscriptWait 130
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setDest 130,9,11
                nextSingleText $0,128   ; "Oops!  The Ground Orb....{W1}"
                entityFlashWhite 130,$3C
                mapFadeOutToWhite
                csWait 20
                mapFadeInFromWhite
                setFacing 128,DOWN
                shiver 128
                nextSingleText $0,128   ; "I can't endure the light....{N}Ohhh....{W1}"
                customActscriptWait 128
                 ac_motion OFF          ;   
                 ac_orientUp            ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 128,eas_Die
                csWait 60
                nextText $0,FOLLOWER_B  ; "Thanks to the Ground Orb, we{N}finally defeated Zalbard.{W2}"
                nextSingleText $0,FOLLOWER_B ; "The orb released holy power{N}in it's light.{W1}"
                entityFlashWhite 130,$3C
                setActscriptWait ALLY_PETER,eas_Jump
                entityActionsWait ALLY_PETER
                 moveUp 2
                endActions
                nextSingleText $0,ALLY_PETER ; "Hey, look over there!{W1}"
                setCamDest 5,0
                setPos 129,11,3,DOWN
                entityFlashWhite 129,$3C
                nextSingleText $0,129   ; "Welcome!{W1}"
                setCameraEntity 129
                entityActionsWait 129
                 moveDown 4
                 moveLeft 2
                 moveDown 4
                endActions
                setFacing ALLY_BOWIE,LEFT
                setFacing FOLLOWER_B,LEFT
                setFacing ALLY_PETER,LEFT
                csWait 50
                entityFlashWhite 129,$3C
                customActscriptWait 130
                 ac_setSpeed 56,56      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                cameraSpeed $38
                setCameraEntity 130
                setDest 130,11,2
                animEntityFX 130,4
                setCamDest 5,8
                setFacing 129,RIGHT
                nextText $C0,129        ; "Thank you.{W2}"
                nextSingleText $C0,129  ; "I've finally returned to this{N}world.{W1}"
                nextSingleText $0,FOLLOWER_B ; "Goddess Mitula?{W1}"
                nextSingleText $C0,129  ; "Oh, nice to meet you,{N}Sir Astral.{W1}"
                setActscriptWait FOLLOWER_B,eas_Jump
                nextText $0,FOLLOWER_B  ; "Oh, you know my name?{N}Gee....{W2}"
                nextSingleText $0,FOLLOWER_B ; "Please tell us, what should{N}we do now?{W1}"
                nextSingleText $C0,129  ; "I don't know.{W1}"
                setActscriptWait ALLY_PETER,eas_Jump
                nextText $0,ALLY_PETER  ; "What?!{W2}"
                nextSingleText $0,ALLY_PETER ; "But, why?  You're a goddess.{N}You know our future, right?{W1}"
                nextSingleText $C0,129  ; "I'm not Volcanon.  I never{N}tell people the future, even{N}if it could prevent death.{W1}"
                shiver FOLLOWER_B
                nextSingleText $0,FOLLOWER_B ; "Death?!  Not ours I hope.{W1}"
                nextText $C0,129        ; "Zeon is an unimaginably{N}strong devil.{W2}"
                nextSingleText $C0,129  ; "If he attains full power,{N}I, even Volcanon, would not{N}be able to stop him.{W1}"
                entityActionsWait ALLY_PETER
                 moveLeft 1
                endActions
                nextSingleText $0,ALLY_PETER ; "So, we have to defeat him{N}before he revives completely.{W1}"
                nextSingleText $C0,129  ; "His power is sealed in the{N}Jewel of Evil.{W1}"
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,FOLLOWER_B ; "So, that's why he wants the{N}jewel!{W1}"
                nextSingleText $0,ALLY_PETER ; "Then, why don't we keep the{N}jewel forever.{W1}"
                nextText $C0,129        ; "Arc Valley is the place where{N}evil power gathers.{W2}"
                nextSingleText $C0,129  ; "He will recover his power{N}if he stays there long enough.{W1}"
                nextSingleText $0,FOLLOWER_B ; "Did you say, Arc Valley?{W1}"
                nextText $C0,129        ; "You call it Ancient Tower{N}or Granseal.{W2}"
                nextSingleText $C0,129  ; "Granseal is named for the{N}symbol in the tower.{N}It seals the ground.{W1}"
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,FOLLOWER_B ; "I see.{W1}"
                csWait 60
                setFacing 129,LEFT
                csWait 40
                entityFlashWhite 129,$32
                setActscript ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,FOLLOWER_B ; "Goddess Mitula, where are{N}you going?{W1}"
                nextSingleText $C0,129  ; "Down to the surface.{N}To save the people.{W1}"
                nextSingleText $0,FOLLOWER_B ; "Are you going to abandon us,{N}as Volcanon did?{W1}"
                nextText $C0,129        ; "Well...no.{N}I'll give you a hint.{W2}"
                nextSingleText $C0,129  ; "Listen to the legends from{N}the storytellers before you{N}go to Grans Island.{W1}"
                entityFlashWhite 129,$1E
                nextText $C0,129        ; "You can't kill Zeon, but{N}Volcanon and I will help you{N}if you weaken him.{W2}"
                nextText $C0,129        ; "{LEADER}!{N}You are the chosen one.{N}You have the holy jewel.{W2}"
                nextSingleText $C0,129  ; "We need your help to reseal{N}Zeon.{N}Find the holy sword.{W1}"
                nextSingleText $0,FOLLOWER_B ; "Where is it?{N}How can we find it?{W1}"
                nextSingleText $C0,129  ; "It's on Grans.{N}Your jewel will lead you to...{W1}"
                animEntityFX 129,6
                csWait 50
                entityActionsWait FOLLOWER_B
                 moveLeft 2
                 moveUp 1
                endActions
                csWait 5
                setActscript FOLLOWER_B,eas_2xUpDown
                csWait 120
                nextSingleText $0,FOLLOWER_B ; "Mitula, Mitula!!{W1}"
                entityActionsWait ALLY_PETER
                 moveLeft 1
                endActions
                csWait 30
                setFacing ALLY_PETER,DOWN
                csWait 30
                setFacing ALLY_PETER,LEFT
                csWait 30
                setFacing ALLY_PETER,DOWN
                csWait 30
                nextSingleText $0,ALLY_PETER ; "{LEADER}, Mitula{N}has vanished!{N}What should we do now?{W1}"
                setFacing FOLLOWER_B,RIGHT
                nextSingleText $0,FOLLOWER_B ; "We have to go to Arc Valley{N}on Grans Island.{W2}"
                setFacing FOLLOWER_B,DOWN
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, find the{N}storytellers first.{W1}"
                setFacing ALLY_BOWIE,UP
                nod ALLY_BOWIE
                followEntity FOLLOWER_B,ALLY_BOWIE,2
                followEntity ALLY_PETER,FOLLOWER_B,2
                csc_end
ce_4C96C:       mainEntity 10,13,UP
                entity 12,13,UP,ALLY_PETER,eas_Init
                entity 11,10,DOWN,MAPSPRITE_ZALBARD,eas_Init
                entity 63,63,DOWN,MAPSPRITE_MITULA,eas_Init
                entity 63,63,UP,MAPSPRITE_ORB,eas_Init
                dc.w $FFFF
