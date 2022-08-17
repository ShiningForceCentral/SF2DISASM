
; ASM FILE data\battles\entries\battle42\cs_afterbattle.asm :
; 0x4EF04..0x4F358 : Cutscene after battle 42
abcs_battle42:  textCursor 3106
                loadMapFadeIn MAP_ZEON_ARENA,8,13
                loadMapEntities ce_4F328
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,15,15,LEFT
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,11,15,RIGHT
                setActscriptWait ALLY_LEMON,eas_Init
                setPos ALLY_LEMON,12,19,RIGHT
                jumpIfFlagClear 76,cs_4EF5E ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,63,62,DOWN
cs_4EF5E:       stopEntity 128
                customActscriptWait 128
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 128,eas_DeactivateAutoFacing
                stopEntity 129
                customActscriptWait 129
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPriority FOLLOWER_B,$0
                setPriority ALLY_LEMON,$0
                setPriority 128,$FFFF
                fadeInB
                cameraSpeed $30
                csWait 60
                shiver 128
                nextSingleText $C0,128  ; "Auuugh...{W1}"
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_PETER,DOWN
                setFacing FOLLOWER_B,DOWN
                shiver 128
                nextText $C0,128        ; "I've never lost to anybody{N}but the gods.{W2}"
                nextSingleText $C0,128  ; "I don't understand!{W1}"
                setFacing 128,UP
                nextSingleText $0,ALLY_LEMON ; "Oh, King Galam...poor{N}King Galam....{W1}"
                shiver 129
                setFacing ALLY_PETER,LEFT
                setActscriptWait ALLY_PETER,eas_Jump
                nextSingleText $0,ALLY_PETER ; "Princess Elis!{W1}"
                setFacing ALLY_BOWIE,UP
                setFacing FOLLOWER_B,RIGHT
                setFacing ALLY_LEMON,UP
                nextSingleText $C0,129  ; "Zzzzz....{W1}"
                nextSingleText $0,FOLLOWER_B ; "...she's waking up!{W1}"
                nextSingleText $C0,129  ; "Zzzzz...(yawn)...{W1}"
                entityActions FOLLOWER_B
                 moveRight 1
                endActions
                entityActionsWait ALLY_LEMON
                 moveUp 1
                endActions
                nextSingleText $0,FOLLOWER_B ; "Princess, princess!{W1}"
                csWait 50
                setActscriptWait 129,eas_Init
                setFacing 129,DOWN
                setSprite 129,MAPSPRITE_POSE6
                nextSingleText $C0,129  ; "Wha...What?{W1}"
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,FOLLOWER_B ; "It's me!  Astral!{W1}"
                setFacing 129,LEFT
                nextSingleText $C0,129  ; "Sir Astral?  Oh, what{N}happened?{W1}"
                setFacing 129,DOWN
                csWait 30
                setFacing 129,UP
                csWait 30
                setFacing 129,LEFT
                nextSingleText $C0,129  ; "Who are they?{W1}"
                nextSingleText $0,ALLY_PETER ; "Nice to meet you.{W1}"
                setFacing 129,UP
                setActscriptWait ALLY_PETER,eas_Jump
                nextSingleText $0,ALLY_PETER ; "I'm {NAME;7}.  And this is{N}our leader.{W1}"
                entityActionsWait ALLY_PETER
                 moveDown 2
                 moveLeft 1
                endActions
                setFacing 129,DOWN
                setFacing ALLY_PETER,UP
                nextSingleText $0,ALLY_PETER ; "{LEADER}, say something.{W1}"
                setSprite 129,MAPSPRITE_ELIS
                setFacing 129,DOWN
                startEntity 129
                nextSingleText $C0,129  ; "Oh, it's you.{W1}"
                customActscriptWait 129
                 ac_setSpeed 24,24      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveDown 1
                endActions
                csWait 50
                nextSingleText $0,ALLY_BOWIE ; "Ah...{W1}"
                csWait 50
                nextSingleText $C0,129  ; "Er...ummm....{W1}"
                setPos ALLY_PETER,13,18,UP
                csWait 30
                setPos ALLY_PETER,14,16,LEFT
                csWait 30
                setPos ALLY_PETER,13,15,DOWN
                csWait 30
                setPos ALLY_PETER,14,17,LEFT
                setFacing FOLLOWER_B,DOWN
                nextSingleText $0,FOLLOWER_B ; "{NAME;7}, don't bother them!{N}This is a private moment!{W1}"
                setQuake 2
                csWait 30
                setQuake 0
                csWait 5
                setActscript ALLY_LEMON,eas_2xRightLeft
                csWait 120
                setFacing ALLY_LEMON,DOWN
                setQuake 2
                entityActions ALLY_BOWIE
                 moveLeft 2
                endActions
                entityActionsWait 129
                 moveDown 1
                 moveLeft 1
                endActions
                csWait 5
                setActscript ALLY_BOWIE,eas_2xUpDown
                entityActionsWait ALLY_PETER
                 moveRight 2
                endActions
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                entityActionsWait FOLLOWER_B
                 moveRight 1
                endActions
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 120
                nextSingleText $0,ALLY_PETER ; "An earthquake!{N}Deep below us....{W1}"
                nextSingleText $0,ALLY_LEMON ; "Something is coming up{N}through the earth...{W1}"
                setFacing FOLLOWER_B,UP
                nextSingleText $0,FOLLOWER_B ; "I almost forgot...about...{N}the other devil....{W1}"
                entityActions ALLY_BOWIE
                 moveUp 2
                 moveRight 1
                endActions
                entityActions ALLY_LEMON
                 moveUp 1
                 moveRight 1
                 moveUp 1
                endActions
                entityActions ALLY_PETER
                 moveUp 2
                 moveLeft 2
                endActions
                entityActions 129
                 moveUp 1
                endActions
                waitIdle ALLY_PETER
                setFacing ALLY_BOWIE,RIGHT
                setFacing FOLLOWER_B,LEFT
                nextSingleText $0,ALLY_BOWIE ; "You mean...Zeon?{W1}"
                nod FOLLOWER_B
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                setFacing ALLY_LEMON,UP
                setCamDest 8,3
                setQuake 3
                nextSingleText $0,ALLY_PETER ; "Huh?{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setBlocks 12,39,7,4,10,3
                csWait 40
                nextSingleText $0,ALLY_LEMON ; "Uh, oh.{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setBlocks 12,44,7,4,10,3
                csWait 40
                nextSingleText $0,FOLLOWER_B ; "This doesn't look promising.{W1}"
                playSound SFX_BATTLEFIELD_DEATH
                setBlocks 12,49,7,4,10,3
                csWait 40
                nextSingleText $0,129   ; "Eeeekkk!{W1}"
                csWait 40
                nextSingleText $0,ALLY_BOWIE ; "Oh, no.{W1}"
                playSound SFX_DEMON_BREATH
                setQuake 4
                csWait 30
                playSound SFX_INTRO_LIGHTNING
                setBlocks 12,54,7,4,10,3
                flashScreenWhite $1E
                setPos 130,13,6,DOWN
                tintMap
                csWait 40
                setQuake 0
                playSound $FD
                csWait 90
                setCameraEntity 128
                customActscriptWait 128
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 110
                playSound MUSIC_ZEON_ATTACK
                setSprite 128,MAPSPRITE_EFFECT3
                setFacing 128,DOWN
                startEntity 128
                entityActionsWait 128
                 moveUp 13
                endActions
                animEntityFX 128,6
                setCameraEntity 65535
                csWait 50
                nextSingleText $C0,130  ; "Gggggrrr...you destroyed my{N}minions!{W1}"
                nextSingleText $0,FOLLOWER_B ; "Zeon!{W1}"
                nextText $C0,130        ; "You resisted me....{W2}"
                nextSingleText $C0,130  ; "I...I never...!{W1}"
                setFacing 129,DOWN
                stopEntity 129
                customActscriptWait 129
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setQuake 3
                playSound SFX_INTRO_LIGHTNING
                flashScreenWhite $1E
                tintMap
                setQuake 0
                csWait 50
                setCamDest 8,12
                setFacing FOLLOWER_B,LEFT
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, we had better{N}run away and return later.{W1}"
                setFacing ALLY_PETER,LEFT
                nextSingleText $0,ALLY_PETER ; "Sir Astral, we can't!{W1}"
                setFacing FOLLOWER_B,RIGHT
                nextSingleText $0,FOLLOWER_B ; "Why not?{W1}"
                nextSingleText $0,ALLY_PETER ; "Princess Elis fainted when{N}she saw Zeon.{W1}"
                setFacing FOLLOWER_B,DOWN
                setFacing ALLY_LEMON,LEFT
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,FOLLOWER_B ; "What?  Oh, my.{W1}"
                setFacing ALLY_BOWIE,DOWN
                setActscriptWait ALLY_BOWIE,eas_Jump
                entityActionsWait ALLY_LEMON
                 moveDown 1
                endActions
                setFacing ALLY_LEMON,RIGHT
                csWait 30
                setFacing ALLY_LEMON,DOWN
                csWait 30
                setFacing ALLY_LEMON,LEFT
                csWait 30
                setFacing ALLY_LEMON,DOWN
                csWait 30
                nextSingleText $0,ALLY_LEMON ; "And now we're surrounded{N}by devils.{W1}"
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                setFacing FOLLOWER_B,LEFT
                csWait 40
                setFacing FOLLOWER_B,UP
                nextText $0,FOLLOWER_B  ; "{LEADER}, believe in your{N}sword and the jewel!{N}We must fight Zeon now!{W1}"
                nextSingleText $0,FOLLOWER_B ; "Let's go!{W1}"
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                nod ALLY_BOWIE
                setStoryFlag 43         ; Battle 43 unlocked - BATTLE_VERSUS_ZEON               
                csc_end
ce_4F328:       mainEntity 13,17,UP
                entity 15,15,LEFT,ALLY_PETER,eas_Init
                entity 12,19,RIGHT,ALLY_LEMON,eas_Init
                entity 13,19,DOWN,MAPSPRITE_GALAM_EVIL,eas_Init
                entity 13,15,DOWN,MAPSPRITE_ELIS,eas_Init
                entity 62,62,DOWN,MAPSPRITE_ZEON,eas_Init
                dc.w $FFFF
