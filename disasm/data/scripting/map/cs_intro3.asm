
; ASM FILE data\scripting\map\cs_intro3.asm :
; 0x48540..0x48A78 : Intro cutscene 3
IntroCutscene3: textCursor 4215
                mapLoad MAP_FORCE_SWORD_SHRINE,21,1
                loadMapEntities ce_48A50
                setActscriptWait ALLY_BOWIE,eas_Init
                resetMap
                fadeInB
                reloadMap 21,1
                nextSingleText $80,ALLY_SLADE ; "Well?{D2}"
                loadMapFadeIn MAP_FORCE_SWORD_SHRINE,21,1
                setActscript 130,eas_Transparent
                fadeInFromBlackHalf
                setCameraEntity ALLY_SLADE
                shiver 128
                shiver 128
                nextSingleText $0,128   ; "Ugh!  Ugghhh!{N}Phew...I can't...{D2}"
                entityActionsWait 129
                 moveUp 1
                 faceLeft 1
                endActions
                setFacing 128,RIGHT
                nextSingleText $0,129   ; "You wimp!{N}Let me do it!{D2}"
                shiver 128
                csWait 20
                entityActions 129
                 moveLeft 1
                 faceDown 1
                endActions
                entityActionsWait 128
                 moveLeft 1
                 moveDown 1
                 faceUp 1
                endActions
                csWait 30
                setFacing 129,DOWN
                nextSingleText $0,129   ; "Yeah, right.{D2}"
                csWait 20
                setFacing 129,UP
                csWait 30
                shiver 129
                shiver 129
                csWait 30
                shiver 129
                csWait 30
                setFacing 129,DOWN
                headshake 129
                nextSingleText $0,129   ; "Blast!  It won't budge!{D2}"
                entityActionsWait ALLY_SLADE
                 moveUp 1
                endActions
                csWait 10
                setActscriptWait ALLY_SLADE,eas_Jump
                setActscriptWait ALLY_SLADE,eas_Jump
                setFacing 129,DOWN
                nextSingleText $80,ALLY_SLADE ; "You idiots!{N}Let me do it.{D2}"
                shiver 129
                entityActionsWait 129
                 moveRight 1
                 moveDown 1
                 faceUp 1
                endActions
                csWait 20
                customActscriptWait ALLY_SLADE
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_SLADE
                 moveUp 1
                endActions
                csWait 20
                nod ALLY_SLADE
                csWait 10
                entityActions ALLY_SLADE
                 moveUp 1
                endActions
                csWait 6
                setActscriptWait ALLY_SLADE,eas_StopMoving
                setFacing ALLY_SLADE,DOWN
                setSprite ALLY_SLADE,MAPSPRITE_EFFECT6
                csWait 20
                shiver ALLY_SLADE
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                shiver ALLY_SLADE
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                shiver ALLY_SLADE
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                shiver ALLY_SLADE
                csWait 30
                entityActions ALLY_SLADE
                 moveDown 1
                endActions
                csWait 6
                setActscriptWait ALLY_SLADE,eas_StopMoving
                customActscriptWait ALLY_SLADE
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait ALLY_SLADE,eas_DeactivateAutoFacing
                setSprite ALLY_SLADE,ALLY_SLADE
                setFacing ALLY_SLADE,UP
                entityActionsWait ALLY_SLADE
                 moveDown 1
                endActions
                setFacing 128,RIGHT
                setFacing 129,LEFT
                csWait 20
                nextSingleText $80,ALLY_SLADE ; "Well, that didn't work.{D2}"
                setFacing ALLY_SLADE,LEFT
                csWait 30
                setFacing ALLY_SLADE,RIGHT
                csWait 30
                setFacing ALLY_SLADE,UP
                csWait 20
                nod ALLY_SLADE
                csWait 20
                nextSingleText $80,ALLY_SLADE ; "This time, I'll pull both of{N}the jewels at the same time!{D2}"
                setActscriptWait ALLY_SLADE,eas_Init
                entityActionsWait ALLY_SLADE
                 moveUp 1
                endActions
                setFacing 128,UP
                setFacing 129,UP
                entityActions ALLY_SLADE
                 moveUp 1
                endActions
                csWait 6
                setActscriptWait ALLY_SLADE,eas_StopMoving
                setFacing ALLY_SLADE,DOWN
                setSprite ALLY_SLADE,MAPSPRITE_EFFECT6
                nextSingleText $FF,255  ; "{NAME;5} the thief{N}grabbed the two jewels.{D2}"
                csWait 20
                nextSingleText $80,ALLY_SLADE ; "One...two...{D2}"
                shiver ALLY_SLADE
                nextSingleText $80,ALLY_SLADE ; "THREE!{D2}"
                shiver ALLY_SLADE
                customActscriptWait ALLY_SLADE
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait ALLY_SLADE,eas_DeactivateAutoFacing
                hide 130
                setBlocks 26,18,1,1,26,4
                setSprite ALLY_SLADE,ALLY_SLADE
                setFacing ALLY_SLADE,UP
                entityActions ALLY_SLADE
                 moveDown 1
                endActions
                csWait 3
                setActscriptWait ALLY_SLADE,eas_StopMoving
                entityActionsWait ALLY_SLADE
                 moveDown 5
                endActions
                setQuake 3
                setActscriptWait ALLY_SLADE,eas_Init
                setFacing 128,DOWN
                setFacing 129,DOWN
                entityActionsWait ALLY_SLADE
                 moveUp 2
                endActions
                setFacing ALLY_SLADE,LEFT
                customActscriptWait ALLY_SLADE
                 ac_motion OFF          ;   
                 ac_orientRight         ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setQuake 0
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                csWait 20
                entityActions 128
                 moveDown 2
                 faceRight 1
                endActions
                entityActionsWait 129
                 moveDown 2
                 faceLeft 1
                endActions
                nextSingleText $0,128   ; "Are you OK?{D2}"
                csWait 40
                nextSingleText $80,ALLY_SLADE ; "Yeah.  I feel just great.{D2}"
                entityActionsWait 128
                 moveUp 1
                 moveRight 1
                 faceUp 40
                endActions
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                csWait 20
                setFacing 128,DOWN
                nextSingleText $0,129   ; "You did it!{N}You have the legendary{N}jewels!{D2}"
                csWait 20
                setFacing ALLY_SLADE,UP
                setSprite ALLY_SLADE,MAPSPRITE_POSE1
                setActscriptWait ALLY_SLADE,eas_Init
                nextSingleText $80,ALLY_SLADE ; "I did?{D2}"
                csWait 30
                setSprite ALLY_SLADE,ALLY_SLADE
                headshake ALLY_SLADE
                nextSingleText $80,ALLY_SLADE ; "Oh, I got them!{N}I have the legendary{N}jewels!  Bravo!{D2}"
                setActscriptWait ALLY_SLADE,eas_Jump
                setActscriptWait ALLY_SLADE,eas_Jump
                csWait 40
                setActscriptWait ALLY_SLADE,eas_Jump
                setActscript ALLY_SLADE,eas_Jump
                setQuake 1
                csWait 40
                setQuake 0
                csWait 60
                setQuake 2
                csWait 40
                setQuake 0
                csWait 5
                setActscript ALLY_SLADE,eas_2xRightLeft
                csWait 5
                setActscript 128,eas_2xUpDown
                csWait 5
                setActscript 129,eas_2xUpDown
                csWait 60
                setQuake 3
                csWait 40
                setQuake 0
                setFacing ALLY_SLADE,UP
                nextSingleText $0,128   ; "What's happening?!{D2}"
                headshake 128
                headshake 129
                csWait 40
                setQuake 4
                csWait 60
                setQuake 0
                nextSingleText $80,ALLY_SLADE ; "We must escape from the{N}shrine!  Follow me!{D2}"
                setQuake 5
                customActscriptWait ALLY_SLADE
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 128
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 129
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_SLADE
                 moveDown 1
                 moveLeft 7
                 moveUp 6
                endActions
                entityActions 128
                 moveDown 2
                 moveLeft 7
                 moveUp 5
                endActions
                entityActionsWait 129
                 faceDown 10
                 moveDown 1
                 moveLeft 8
                 moveUp 4
                endActions
                playSound SFX_WARP
                fadeOutToBlackHalf
                setPos ALLY_SLADE,2,8,DOWN
                setPos 128,2,8,DOWN
                setPos 129,2,8,DOWN
                reloadMap 0,3
                csWait 10
                fadeInFromBlackHalf
                setCameraEntity ALLY_SLADE
                entityActionsWait ALLY_SLADE
                 moveUp 1
                endActions
                entityActions ALLY_SLADE
                 moveUp 1
                endActions
                entityActionsWait 128
                 moveUp 1
                endActions
                entityActions ALLY_SLADE
                 moveUp 1
                 moveRight 3
                endActions
                entityActions 128
                 moveUp 2
                 moveRight 2
                endActions
                entityActionsWait 129
                 moveUp 3
                endActions
                entityActionsWait 129
                 moveRight 1
                endActions
                customActscriptWait 129
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_SLADE
                 moveRight 2
                endActions
                entityActionsWait 128
                 moveRight 2
                endActions
                setFacing ALLY_SLADE,LEFT
                setFacing 128,LEFT
                csWait 30
                entityActions ALLY_SLADE
                 moveLeft 2
                endActions
                entityActionsWait 128
                 moveLeft 2
                endActions
                csWait 30
                setActscriptWait 129,eas_Init
                setFacing 129,DOWN
                headshake 129
                customActscriptWait 129
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_SLADE
                 moveRight 2
                 moveDown 10
                endActions
                entityActions 128
                 moveRight 3
                 moveDown 9
                endActions
                entityActionsWait 129
                 moveRight 4
                 moveDown 8
                endActions
                setQuake 0
                fadeOutToBlackHalf
                csc_end
ce_48A50:       mainEntity 63,63,UP
                entity 26,7,UP,ALLY_SLADE,eas_Init
                entity 26,5,UP,MAPSPRITE_WORKER,eas_Init
                entity 27,6,UP,MAPSPRITE_WORKER,eas_Init
                entity 26,4,DOWN,MAPSPRITE_OBJECT1,eas_Init
                dc.w $FFFF
