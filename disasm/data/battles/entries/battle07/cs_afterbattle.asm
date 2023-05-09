
; ASM FILE data\battles\entries\battle07\cs_afterbattle.asm :
; 0x49F7E..0x4A952 : Cutscene after battle 7
abcs_battle07:  textCursor 2385
                loadMapFadeIn MAP_ANCIENT_TOWER_UNDERGROUND_ROOM,8,16
                loadMapEntities ce_4A912
                setActscriptWait ALLY_BOWIE,eas_Init
                setBlocks 7,23,1,2,13,22
                setBlocks 7,23,1,2,13,24
                setBlocks 7,23,1,2,13,29
                stopEntity 130
                stopEntity 131
                customActscriptWait 130
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 131
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 128,eas_DeactivateAutoFacing
                setActscriptWait 129,eas_DeactivateAutoFacing
                setActscript 128,eas_AnimSpeedx2
                setActscript 129,eas_AnimSpeedx2
                fadeInB
                cameraSpeed $28
                csWait 50
                entityActions 133
                 moveUp 6
                endActions
                entityActionsWait 134
                 moveUp 6
                endActions
                nextSingleText $0,134   ; "King Galam!  You've lost{N}your followers!{W1}"
                nextSingleText $0,133   ; "Princess Elis, come here.{N}Come here.{W1}"
                setCamDest 8,13
                nextSingleText $0,132   ; "Father...{W1}"
                entityActionsWait 132
                 moveDown 1
                endActions
                customActscriptWait 130
                 ac_motion OFF          ;   
                 ac_orientUp            ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                startEntity 130
                entityActions 132
                 moveDown 1
                endActions
                customActscriptWait 130
                 ac_setSpeed 56,56      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 130
                 moveLeft 1
                endActions
                setFacing 130,UP
                waitIdle 132
                setActscriptWait 132,eas_Jump
                nextSingleText $0,132   ; "(Shriek!){W1}"
                nextSingleText $C0,130  ; "No, Princess.{W1}"
                setActscriptWait 132,eas_DeactivateAutoFacing
                entityActionsWait 132
                 moveUp 1
                endActions
                nextSingleText $0,133   ; "Elis!{W1}"
                setCamDest 8,15
                entityActions 133
                 moveUp 1
                endActions
                entityActionsWait 134
                 moveUp 1
                endActions
                nextSingleText $C0,130  ; "Freeze!  Ha, ha!{W1}"
                setActscript 133,eas_Jump
                setActscriptWait 134,eas_Jump
                setCamDest 8,14
                entityActionsWait 130
                 moveRight 1
                 moveUp 2
                endActions
                setFacing 130,DOWN
                nextText $C0,130        ; "What a good hostage she is!{W2}"
                nextSingleText $C0,130  ; "Stay there!  Or she'll die!{W1}"
                entityActionsWait 133
                 moveUp 1
                endActions
                nextSingleText $0,133   ; "Stop this, King Galam!{N}Leave her alone!  Please!{W1}"
                entityActionsWait 134
                 moveUp 1
                endActions
                nextSingleText $0,134   ; "Princess Elis...I'll save{N}you!{W1}"
                nextSingleText $FF,255  ; "King Galam murmurs a{N}magic spell.{W1}"
                setFacing 132,RIGHT
                csWait 40
                setActscriptWait 132,eas_Jump
                setFacing 132,DOWN
                nextSingleText $0,132   ; "Watch out!{W1}"
                nextSingleText $0,133   ; "What?!{W1}"
                customActscriptWait 128
                 ac_setSpeed 80,80      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 129
                 ac_setSpeed 80,80      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPos 128,13,16,RIGHT
                setPos 129,13,16,RIGHT
                playSound SFX_DEMON_BREATH
                entityActions 128
                 moveDownLeft 1
                endActions
                entityActionsWait 129
                 moveDownRight 1
                endActions
                entityActions 128
                 moveDown 8
                endActions
                entityActions 129
                 moveDown 8
                endActions
                csWait 10
                setActscriptWait 133,eas_DeactivateAutoFacing
                setActscriptWait 134,eas_DeactivateAutoFacing
                customActscriptWait 133
                 ac_setSpeed 56,56      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 134
                 ac_setSpeed 56,56      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 133
                 moveDown 3
                endActions
                entityActionsWait 134
                 moveDown 3
                endActions
                stopEntity 133
                stopEntity 134
                customActscriptWait 133
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 134
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                nextSingleText $0,132   ; "Father!{W1}"
                setActscriptWait 133,eas_Init
                setActscriptWait 134,eas_Init
                startEntity 133
                startEntity 134
                headshake 133
                nextSingleText $0,133   ; "Don't worry...I'm fine.{W1}"
                nextSingleText $C0,130  ; "That was just a warning!{N}Do you want me to attack{N}again?{W1}"
                setPos 128,63,63,DOWN
                setPos 129,63,63,DOWN
                setCamDest 8,17
                customActscriptWait 131
                 ac_motion OFF          ;   
                 ac_orientUp            ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                startEntity 131
                headshake 131
                nextText $0,131         ; "King Granseal...{W2}"
                nextSingleText $0,131   ; "Galam, please tell me...{N}What's in this tower?{N}In Ground Seal?{W1}"
                nextSingleText $C0,130  ; "You really want to know?{N}Ha, ha!  OK, I'll tell you.{W1}"
                setCamDest 8,13
                setFacing 130,UP
                nextSingleText $FF,255  ; "King Galam displays the{N}Jewel of Evil.{W1}"
                nextSingleText $C0,130  ; "I'll open the door to the{N}Evil World!{N}Observe!{W1}"
                entityFlashWhite 130,$32
                csWait 60
                mapFadeOutToWhite
                csWait 20
                mapFadeInFromWhite
                csWait 40
                mapFadeOutToWhite
                csWait 30
                mapFadeInFromWhite
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 2
                csWait 60
                setQuake 0
                csWait 60
                setQuake 3
                nextSingleText $0,133   ; "An earthquake!{W1}"
                setCamDest 8,3
                csWait 60
                setBlocks 0,39,3,3,12,4
                csWait 50
                setBlocks 0,43,3,3,12,4
                csWait 50
                setBlocks 0,47,3,3,12,4
                csWait 60
                setQuake 0
                setCamDest 8,13
                setFacing 130,DOWN
                nextSingleText $C0,130  ; "Now do you understand?  I{N}plan on opening the sealed{N}door!{W1}"
                nextSingleText $0,131   ; "Why?  What's inside?{W1}"
                nextSingleText $C0,130  ; "You'll find out soon enough.{W1}"
                setFacing 130,UP
                entityFlashWhite 130,$28
                nextSingleText $0,133   ; "What's he doing now??{W1}"
                nextSingleText $C0,130  ; "Here they come!{N}Ha, ha, ha!{W1}"
                nextSingleText $0,131   ; "What?{W1}"
                setCamDest 8,3
                setSprite 128,MAPSPRITE_OBJECT3
                setPos 128,12,5,UP
                animEntityFX 128,7
                setSprite 129,MAPSPRITE_OBJECT3
                setPos 129,13,5,UP
                animEntityFX 129,7
                customActscriptWait 128
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 129
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                nextSingleText $0,ALLY_BOWIE ; "I have a bad feeling about{N}this!{W1}"
                entityActions 128
                 moveDown 5
                endActions
                entityActionsWait 129
                 moveDown 5
                endActions
                setCamDest 8,8
                nextSingleText $0,134   ; "Princess Elis is swallowed{N}by a light tube.{W1}"
                entityActions 128
                 moveDown 5
                endActions
                setFacing 132,UP
                setActscript 132,eas_Jump
                entityActionsWait 129
                 moveDown 5
                endActions
                setCamDest 8,13
                nextSingleText $C0,130  ; "Farewell for now!{N}Going up!{W1}"
                customActscriptWait 130
                 ac_setSpeed 2,2        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 132
                 ac_setSpeed 2,2        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 128
                 ac_setSpeed 2,2        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 129
                 ac_setSpeed 2,2        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 128
                 moveUp 2
                endActions
                entityActions 129
                 moveUp 2
                endActions
                entityActions 130
                 moveUp 2
                endActions
                entityActions 132
                 moveUp 2
                endActions
                nextSingleText $0,131   ; "He's using the light tube{N}to go through the doorway!{W1}"
                setCamDest 8,17
                nextSingleText $0,131   ; "Save her.  Save her now!{W1}"
                csWait 5
                setActscript 131,eas_2xRightLeft
                csWait 120
                setFacing 131,DOWN
                nextSingleText $0,131   ; "{LEADER}, you're good{N}at performing acrobatics!{W1}"
                entityActionsWait 131
                 moveDown 1
                endActions
                setFacing 131,RIGHT
                nextSingleText $0,131   ; "Minister, help me!{W1}"
                setFacing 134,LEFT
                nextSingleText $0,134   ; "Y...yes...but how?{W1}"
                nextSingleText $0,131   ; "Throw {LEADER} towards{N}the light tubes!{W1}"
                setActscriptWait ALLY_BOWIE,eas_Jump
                setCameraEntity ALLY_BOWIE
                entityActionsWait 133
                 moveLeft 1
                endActions
                entityActionsWait 131
                 moveLeft 1
                 moveDown 1
                endActions
                entityActionsWait 134
                 moveDown 1
                endActions
                waitIdle 131
                setFacing 133,RIGHT
                setFacing 131,RIGHT
                setFacing 134,LEFT
                csWait 30
                stopEntity ALLY_BOWIE
                setFacing ALLY_BOWIE,DOWN
                customActscriptWait ALLY_BOWIE
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                nextSingleText $0,131   ; "{LEADER}, save her!{W1}"
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 131
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 134
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait ALLY_BOWIE,eas_DeactivateAutoFacing
                setActscriptWait 131,eas_DeactivateAutoFacing
                setActscriptWait 134,eas_DeactivateAutoFacing
                entityActions 131
                 moveDown 3
                endActions
                entityActions 134
                 moveDown 3
                endActions
                entityActionsWait ALLY_BOWIE
                 moveDown 3
                endActions
                nextSingleText $C0,130  ; "Too late.  You're too late.{W1}"
                cameraSpeed $38
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 56,56      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 131
                 ac_setSpeed 56,56      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 134
                 ac_setSpeed 56,56      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 131
                 moveUp 5
                endActions
                entityActions 134
                 moveUp 5
                endActions
                entityActionsWait ALLY_BOWIE
                 moveUp 5
                endActions
                setFacing 133,UP
                entityActionsWait ALLY_BOWIE
                 moveUp 3
                endActions
                nextSingleText $0,131   ; "Oops, we lost our grip!{N}But...{W1}"
                entityActions 128
                 moveUp 8
                endActions
                entityActions 129
                 moveUp 8
                endActions
                entityActions 130
                 moveUp 8
                endActions
                entityActions 132
                 moveUp 8
                endActions
                entityActionsWait ALLY_BOWIE
                 moveUp 5
                endActions
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 2,2        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setQuake 4
                customActscriptWait ALLY_BOWIE
                 ac_motion OFF          ;   
                 ac_orientUp            ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing ALLY_BOWIE,UP
                setSprite ALLY_BOWIE,MAPSPRITE_POSE4
                entityActions ALLY_BOWIE
                 moveUp 8
                endActions
                csWait 20
                setQuake 0
                nextSingleText $FF,255  ; "{LEADER} grasped the{N}Jewel of Evil.{W1}"
                setCameraEntity 65535
                nextText $C0,130        ; "What are you doing?{W2}"
                setCameraEntity ALLY_BOWIE
                setCameraEntity 65535
                nextSingleText $C0,130  ; "Don't touch my jewel!{N}Don't touch it!{W1}"
                setCameraEntity ALLY_BOWIE
                shiver ALLY_BOWIE
                stopEntity ALLY_BOWIE
                setCameraEntity 65535
                nextText $C0,130        ; "I said, don't touch it!{W2}"
                setCameraEntity ALLY_BOWIE
                setCameraEntity 65535
                nextSingleText $C0,130  ; "I'll shake you off!{W1}"
                setCameraEntity ALLY_BOWIE
                shiver ALLY_BOWIE
                stopEntity ALLY_BOWIE
                setCameraEntity 65535
                nextSingleText $C0,130  ; "You're still there?{W1}"
                setCameraEntity ALLY_BOWIE
                setCameraEntity 65535
                nextSingleText $0,ALLY_BOWIE ; "Wow!  He's so brave.  Hmmm....{W1}"
                setCameraEntity ALLY_BOWIE
                setCameraEntity 65535
                nextSingleText $C0,130  ; "I've almost got you now!{W1}"
                setCameraEntity ALLY_BOWIE
                shiver ALLY_BOWIE
                stopEntity ALLY_BOWIE
                setCameraEntity 65535
                nextSingleText $0,132   ; "No, you'll fall if you{N}open your hands now!{W1}"
                setCameraEntity ALLY_BOWIE
                setCameraEntity 65535
                nextSingleText $FF,255  ; "{LEADER}'s jewel suddenly{N}flared!{W1}"
                setCameraEntity ALLY_BOWIE
                entityFlashWhite ALLY_BOWIE,$14
                playSound SFX_VALIDATION
                mapFadeOutToWhite
                csWait 10
                mapFadeInFromWhite
                setCameraEntity 65535
                nextSingleText $C0,130  ; "Whoa!  The light...the{N}light!{W1}"
                setCameraEntity ALLY_BOWIE
                setCameraEntity 65535
                nextSingleText $FF,255  ; "The Jewel of Evil fused{N}to {LEADER}'s neck.{W1}"
                setCameraEntity ALLY_BOWIE
                cameraSpeed $38
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 56,56      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait ALLY_BOWIE,eas_DeactivateAutoFacing
                setSprite ALLY_BOWIE,ALLY_BOWIE
                customActscriptWait ALLY_BOWIE
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setDest ALLY_BOWIE,13,10
                nextSingleText $C0,130  ; "He stole my jewel!{W1}"
                setFacing 131,UP
                setFacing 134,UP
                entityActionsWait ALLY_BOWIE
                 moveDown 5
                endActions
                cameraSpeed $40
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound SFX_DOOR_OPEN
                setQuake 3
                setFacing ALLY_BOWIE,DOWN
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                endActions
                setFacing ALLY_BOWIE,LEFT
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                endActions
                setFacing ALLY_BOWIE,UP
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                endActions
                setFacing ALLY_BOWIE,RIGHT
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                endActions
                setFacing ALLY_BOWIE,DOWN
                entityActionsWait ALLY_BOWIE
                 moveDown 1
                endActions
                setSprite ALLY_BOWIE,MAPSPRITE_POSE4
                customActscriptWait ALLY_BOWIE
                 ac_motion OFF          ;   
                 ac_orientUp            ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 20
                setQuake 0
                csWait 40
                shiver ALLY_BOWIE
                stopEntity ALLY_BOWIE
                csWait 30
                setCameraEntity 65535
                cameraSpeed $28
                nextSingleText $FF,255  ; "The two jewels merge{N}together.{W1}"
                setF 385                ; Set after Bowie obtains King Galam's jewel
                setCamDest 8,3
                waitIdle 130
                setFacing 130,DOWN
                setFacing 132,DOWN
                animEntityFX 129,6
                nextSingleText $C0,130  ; "I have to go back and get{N}my jewel....{N}Noooooooo!{W1}"
                setActscript 130,eas_TwirlShrinkDisappear
                animEntityFX 128,6
                nextSingleText $0,132   ; "Father...{N}{LEADER}...help meeeeee!{W1}"
                setActscriptWait 132,eas_TwirlShrinkDisappear
                setActscriptWait 131,eas_Init
                customActscriptWait 131
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 134,eas_Init
                customActscriptWait 134
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 133
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound $FD
                csWait 60
                setCamDest 8,17
                playSound MUSIC_SAD_THEME_1
                csWait 60
                nextSingleText $0,133   ; "She's gone....{N}Elis!{W1}"
                nextSingleText $0,131   ; "We couldn't help the{N}Princess.{W1}"
                setSprite ALLY_BOWIE,ALLY_BOWIE
                setActscriptWait ALLY_BOWIE,eas_Init
                startEntity ALLY_BOWIE
                headshake ALLY_BOWIE
                nextSingleText $C0,ALLY_BOWIE ; "(Sigh)....{W1}"
                nextSingleText $0,131   ; "{LEADER}, why do you{N}have two jewels?{W1}"
                nextSingleText $FF,255  ; "{LEADER} explains{N}what happened.{W1}"
                nod 131
                nod ALLY_BOWIE
                nextSingleText $0,131   ; "Indeed, perhaps...these{N}jewels are the key to{N}solving this....{W1}"
                setQuake 2
                csWait 5
                setActscript 134,eas_2xRightLeft
                playSound $FD
                csWait 120
                setQuake 0
                csWait 60
                setQuake 1
                playSound MUSIC_BOSS_ATTACK
                nextSingleText $0,131   ; "What?! Another earthquake?{W1}"
                nextSingleText $0,134   ; "Wow!  It's getting worse!{W1}"
                entityActionsWait 134
                 moveDown 1
                endActions
                setFacing 134,LEFT
                nextSingleText $C0,133  ; "Whoa!{W1}"
                nextSingleText $0,134   ; "Sssiirrr Astral!{N}What should we do?!{W1}"
                nextSingleText $0,131   ; "I'm not sure.{W1}"
                entityActionsWait 134
                 moveLeft 2
                endActions
                setFacing 134,UP
                nextSingleText $0,134   ; "Sir Astral!{W1}"
                setFacing 131,DOWN
                nextText $0,131         ; "Let's get out of here!{W2}"
                nextSingleText $0,131   ; "We'll come back later with{N}soldiers to rescue her.{W1}"
                setFacing 131,LEFT
                nextSingleText $C0,133  ; "But, Sir Astral...{W1}"
                setFacing 131,DOWN
                nextSingleText $0,131   ; "He won't budge.{N}We'll have to carry him.{W1}"
                nextSingleText $FF,255  ; "The Minister nods.{W1}"
                nod 131
                entityActions 131
                 moveLeft 1
                endActions
                entityActionsWait 134
                 moveDown 1
                 moveLeft 1
                endActions
                setActscriptWait 133,eas_DeactivateAutoFacing
                setFacing 131,DOWN
                stopEntity 133
                csWait 50
                entityActions 131
                 moveRight 2
                endActions
                entityActions 134
                 moveRight 2
                endActions
                entityActionsWait 133
                 moveRight 2
                endActions
                entityActions 131
                 moveRight 1
                 moveDown 1
                endActions
                entityActionsWait 134
                 moveLeft 1
                 moveUp 1
                endActions
                setFacing 134,DOWN
                csWait 50
                setCameraEntity 133
                cameraSpeed $20
                entityActions 131
                 moveDown 13
                endActions
                entityActions 134
                 moveDown 13
                endActions
                entityActionsWait 133
                 moveDown 13
                endActions
                csWait 40
                setActscriptWait 131,eas_Jump
                setFacing 131,UP
                nextText $0,131         ; "{LEADER}, you'll be{N}buried in the tower!{W2}"
                nextSingleText $0,131   ; "Come on!{W1}"
                csWait 50
                warp MAP_ANCIENT_TOWER_UNDERGROUND_ROOM,13,35,DOWN
                followEntity 131,ALLY_BOWIE,2
                followEntity 133,131,2
                followEntity 134,133,2
                setF 74                 ; Astral + King are followers
                setF 640                ; Set after the end of battle 7's long sequence, cleared at docks?
                csc_end
ce_4A912:       mainEntity 13,23,UP
                entity 63,63,RIGHT,MAPSPRITE_EFFECT3,eas_Init
                entity 63,63,RIGHT,MAPSPRITE_EFFECT3,eas_Init
                entity 13,17,UP,MAPSPRITE_GALAM_EVIL,eas_Init
                entity 13,21,UP,MAPSPRITE_ASTRAL,eas_Init
                entity 12,14,DOWN,MAPSPRITE_ELIS,eas_Init
                entity 12,27,UP,MAPSPRITE_GRANSEAL_KING,eas_Init
                entity 14,27,UP,MAPSPRITE_MINISTER,eas_Init
                dc.w $FFFF
