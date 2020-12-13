
; ASM FILE data\scripting\map\cs_intro1.asm :
; 0x47F7E..0x48380 : Intro cutscene 1
IntroCutscene1: textCursor 4186
                mapLoad MAP_FORCE_SWORD_SHRINE,2,5
                csWait 1
                loadMapEntities ce_48340
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait 131,eas_InitFixedSprite
                setActscriptWait 132,eas_InitFixedSprite
                setActscriptWait 133,eas_InitFixedSprite
                setActscript 130,eas_Transparent
                fadeInFromBlackHalf
                csWait 30
                setPos ALLY_SLADE,7,15,UP
                setPos 128,7,16,UP
                setPos 129,7,17,UP
                entityActions ALLY_SLADE
                 moveUp 6
                endActions
                entityActions 128
                 moveUp 6
                endActions
                entityActionsWait 129
                 moveUp 6
                endActions
                playSound SFX_INTRO_LIGHTNING
                setQuake 1
                setPos 131,7,12,LEFT
                setPos 132,7,13,UP
                setPos 133,7,14,UP
                csWait 5
                setQuake 0
                setPos 131,63,63,LEFT
                setPos 132,63,63,UP
                setPos 133,63,63,UP
                csWait 10
                setFacing ALLY_SLADE,DOWN
                setFacing 128,DOWN
                setFacing 129,DOWN
                setPos 131,7,12,LEFT
                setPos 132,7,13,UP
                setPos 133,7,14,UP
                csWait 5
                setPos 131,63,63,LEFT
                setPos 132,63,63,UP
                setPos 133,63,63,UP
                csWait 10
                setPos 131,7,12,LEFT
                setPos 132,7,13,UP
                setPos 133,7,14,UP
                csWait 5
                setPos 131,63,63,LEFT
                setPos 132,63,63,UP
                setPos 133,63,63,UP
                csWait 10
                setActscript ALLY_SLADE,eas_Jump
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                setActscript ALLY_SLADE,eas_Jump
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                csWait 30
                setCameraEntity ALLY_SLADE
                entityActions ALLY_SLADE
                 moveUp 4
                endActions
                entityActions 128
                 moveUp 4
                endActions
                entityActionsWait 129
                 moveUp 4
                endActions
                setActscriptWait 128,eas_BumpUp
                setActscriptWait 129,eas_BumpUp
                csWait 30
                setFacing ALLY_SLADE,DOWN
                nextSingleText $80,ALLY_SLADE ; "Stay here, OK?{D2}"
                nod 128
                entityActionsWait ALLY_SLADE
                 moveRight 5
                endActions
                setFacing 128,RIGHT
                setFacing 129,RIGHT
                entityActionsWait ALLY_SLADE
                 moveDown 3
                endActions
                csWait 30
                shiver ALLY_SLADE
                csWait 30
                nextSingleText $80,ALLY_SLADE ; "Oops, a dead end!{D2}"
                entityActionsWait ALLY_SLADE
                 moveUp 3
                 moveLeft 5
                endActions
                setFacing 128,UP
                setFacing 129,UP
                setFacing ALLY_SLADE,DOWN
                csWait 20
                headshake ALLY_SLADE
                csWait 20
                entityActionsWait ALLY_SLADE
                 moveLeft 5
                endActions
                setFacing 128,LEFT
                setFacing 129,LEFT
                entityActionsWait ALLY_SLADE
                 moveDown 3
                endActions
                csWait 40
                shiver ALLY_SLADE
                csWait 40
                nextSingleText $80,ALLY_SLADE ; "Hey!  I found some hidden{N}stairs!{D2}"
                entityActionsWait ALLY_SLADE
                 moveUp 2
                 faceRight 1
                endActions
                nextSingleText $80,ALLY_SLADE ; "Hey, guys!{N}Follow me!{D2}"
                nextSingleText $0,128   ; "Alright!{D2}"
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                setActscript 128,eas_Jump
                setActscriptWait 129,eas_Jump
                entityActions 128
                 moveUp 1
                 moveLeft 5
                 faceDown 1
                endActions
                entityActionsWait 129
                 moveUp 2
                 moveLeft 4
                 faceDown 1
                endActions
                setFacing ALLY_SLADE,UP
                csWait 20
                entityActions ALLY_SLADE
                 moveDown 3
                endActions
                entityActions 128
                 moveDown 3
                endActions
                entityActionsWait 129
                 moveLeft 1
                 moveDown 2
                endActions
                playSound SFX_WARP
                fadeOutToBlackHalf
                setCameraEntity 65535
                setPos ALLY_SLADE,19,3,DOWN
                setPos 128,19,3,DOWN
                setPos 129,19,3,DOWN
                reloadMap 15,0
                csWait 10
                fadeInFromBlackHalf
                setCameraEntity ALLY_SLADE
                entityActionsWait ALLY_SLADE
                 moveDown 1
                endActions
                csWait 10
                nextSingleText $80,ALLY_SLADE ; "Finally, I found the hidden{N}room of the Ancient Shrine!{D2}"
                entityActions ALLY_SLADE
                 moveDown 1
                endActions
                entityActionsWait 128
                 moveDown 1
                endActions
                entityActions ALLY_SLADE
                 moveDown 2
                endActions
                entityActions 128
                 moveDown 2
                endActions
                entityActionsWait 129
                 moveDown 2
                endActions
                csWait 30
                setActscriptWait ALLY_SLADE,eas_Jump
                setActscriptWait ALLY_SLADE,eas_Jump
                nextSingleText $80,ALLY_SLADE ; "A treasure chest!{D2}"
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
                 moveDown 2
                endActions
                entityActions 128
                 moveDown 2
                endActions
                entityActionsWait 129
                 moveDown 2
                endActions
                setCamDest 15,5
                shiver ALLY_SLADE
                nextSingleText $80,ALLY_SLADE ; "I wonder if they're here?{D2}"
                nextSingleText $FF,255  ; "{NAME;5} the thief opened{N}the chest.{D2}"
                setBlocks 7,3,1,1,19,10
                nextSingleText $FF,255  ; "He found Power Water.{D2}"
                headshake ALLY_SLADE
                nextSingleText $80,ALLY_SLADE ; "No, I don't want this!{D2}"
                nextSingleText $FF,255  ; "{NAME;5} discarded the{N}Power Water.{D2}"
                setBlocks 4,3,1,1,19,10
                csWait 30
                setActscriptWait ALLY_SLADE,eas_Init
                setActscriptWait 128,eas_Init
                setActscriptWait 129,eas_Init
                entityActionsWait 129
                 moveLeft 1
                 moveDown 2
                 faceRight 1
                endActions
                nextSingleText $0,129   ; "Where on Earth are those{N}jewels?{D2}"
                csWait 10
                setFacing ALLY_SLADE,LEFT
                nextSingleText $80,ALLY_SLADE ; "I'm not sure.{D2}"
                csWait 20
                setCameraEntity ALLY_SLADE
                entityActions ALLY_SLADE
                 moveRight 5
                endActions
                entityActions 128
                 moveDown 1
                 moveRight 4
                endActions
                entityActionsWait 129
                 eaWait 20
                 moveRight 4
                endActions
                csWait 5
                setActscript ALLY_SLADE,eas_2xUpDown
                csWait 5
                setActscript 128,eas_2xRightLeft
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 60
                entityActionsWait ALLY_SLADE
                 moveRight 2
                 moveUp 1
                endActions
                nextSingleText $80,ALLY_SLADE ; "Something is shining over{N}there...!{D2}"
                setFacing 128,UP
                setFacing 129,UP
                setCamDest 21,1
                nextSingleText $80,ALLY_SLADE ; "Oh, they must be the jewels{N}of light and evil!{D2}"
                csWait 20
                fadeOutToBlackHalf
                csc_end
ce_48340:       mainEntity 63,63,UP
                entity 63,63,DOWN,ALLY_SLADE,eas_Init
                entity 63,63,UP,MAPSPRITE_WORKER,eas_Init
                entity 63,63,UP,MAPSPRITE_WORKER,eas_Init
                entity 26,4,DOWN,MAPSPRITE_OBJECT1,eas_Init
                entity 63,63,LEFT,MAPSPRITE_EFFECT4,eas_Init
                entity 63,63,UP,MAPSPRITE_EFFECT4,eas_Init
                entity 63,63,UP,MAPSPRITE_EFFECT4,eas_Init
                dc.w $FFFF
