
; ASM FILE data\battles\entries\battle40\cs_afterbattle.asm :
; 0x4EA94..0x4ED0E : Cutscene after battle 40
abcs_battle40:  textCursor 3065
                loadMapFadeIn MAP_ODDEYE_ARENA,10,4
                loadMapEntities ce_4ECD6
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,13,8,RIGHT
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,15,6,DOWN
                setActscriptWait ALLY_LEMON,eas_Init
                setPos ALLY_LEMON,17,8,LEFT
                jumpIfFlagClear 76,cs_4EAEE ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,63,62,DOWN
cs_4EAEE:       setBlocks 11,6,11,29,44,0
                setBlocks 0,52,10,7,13,10
                customActscriptWait 131
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                stopEntity 131
                setActscriptWait 128,eas_DeactivateAutoFacing
                setActscriptWait 129,eas_DeactivateAutoFacing
                setActscriptWait 130,eas_DeactivateAutoFacing
                setActscript 128,eas_AnimSpeedx2
                setActscript 129,eas_AnimSpeedx2
                setActscript 130,eas_AnimSpeedx2
                playSound MUSIC_SAD_THEME_1
                fadeInB
                csWait 60
                nextText $0,131         ; "{LEADER}, you won?{N}You've become so strong.{W2}"
                nextSingleText $0,131   ; "I knew you would....{W1}"
                nextSingleText $C0,ALLY_BOWIE ; "Oh, really?{W1}"
                nextText $0,131         ; "Your friends are very good.{N}I knew that when I was{N}traveling with you.{W2}"
                nextSingleText $0,131   ; "Yes, it was interesting...{N}I miss that time....{W1}"
                setActscriptWait ALLY_PETER,eas_Jump
                nextSingleText $C0,ALLY_PETER ; "Odd Eye...no, Oddler!{N}Did you...?{W1}"
                nextSingleText $0,131   ; "No, {NAME;7}.  I did my{N}best.  You were just better{N}than me.{W1}"
                nextSingleText $C0,ALLY_BOWIE ; "We had to be.{W1}"
                nextText $0,131         ; "I wouldn't have had to{N}fight if I never had gotten{N}my memory back.{W2}"
                nextSingleText $0,131   ; "It's funny, fighting was{N}everything to me.{W1}"
                shiver ALLY_PETER
                nextSingleText $C0,ALLY_PETER ; "Oddler, please don't die!{W1}"
                nextText $0,131         ; "Thank you, {NAME;7}.{N}I learned a lot from you.{W2}"
                nextSingleText $0,131   ; "Oh, the pain!{N}Let me say good-bye.{W1}"
                entityActions ALLY_BOWIE
                 moveUp 1
                endActions
                entityActionsWait ALLY_PETER
                 moveRight 1
                endActions
                nextSingleText $0,131   ; "If possible, I want to{N}relive my life...not as{N}a devil...next time....{W1}"
                entityFlashWhite 131,$1E
                setPos 128,15,8,DOWN
                entityActions 128
                 moveRight 2
                endActions
                csWait 8
                setPos 129,15,8,DOWN
                entityActions 129
                 moveDownRight 2
                endActions
                csWait 8
                setPos 130,15,8,DOWN
                entityActions 130
                 moveDown 2
                endActions
                csWait 8
                setPos 128,15,8,DOWN
                entityActions 128
                 moveDownRight 2
                endActions
                csWait 8
                setPos 129,15,8,DOWN
                entityActions 129
                 moveRight 2
                endActions
                csWait 8
                setPos 130,15,8,DOWN
                entityActions 130
                 moveDownRight 2
                endActions
                csWait 8
                setPos 128,15,8,DOWN
                entityActions 128
                 moveDown 2
                endActions
                csWait 8
                setPos 129,15,8,DOWN
                entityActions 129
                 moveDownRight 2
                endActions
                csWait 8
                setPos 130,15,8,DOWN
                entityActions 130
                 moveRight 2
                endActions
                csWait 8
                hide 128
                csWait 8
                hide 129
                csWait 8
                hide 130
                entityFlashWhite 131,$78
                hide 131
                playSound $FD
                csWait 120
                playSound MUSIC_SAD_THEME_3
                shiver ALLY_PETER
                setFacing ALLY_PETER,UP
                nextSingleText $0,ALLY_PETER ; "(Sob, sob)...how sad.{N}{LEADER}, Sir Astral...{W1}"
                setFacing ALLY_LEMON,DOWN
                nextSingleText $0,ALLY_LEMON ; "Oddler had a pure spirit...{N}I'll miss him.{W1}"
                setFacing FOLLOWER_B,UP
                nextSingleText $0,FOLLOWER_B ; "Don't cry for him now.{N}This is Zeon's doing.{W1}"
                setFacing FOLLOWER_B,DOWN
                nextSingleText $0,FOLLOWER_B ; "We shall go onward and{N}remember Oddler in our{N}hearts.{W1}"
                entityActionsWait ALLY_LEMON
                 moveLeft 1
                 moveDown 1
                endActions
                setFacing ALLY_LEMON,LEFT
                entityActionsWait FOLLOWER_B
                 moveDown 2
                endActions
                entityActionsWait ALLY_PETER
                 moveDown 1
                endActions
                setFacing ALLY_PETER,RIGHT
                csWait 40
                setFacing ALLY_BOWIE,RIGHT
                csWait 40
                setFacing ALLY_BOWIE,LEFT
                csWait 40
                setFacing ALLY_BOWIE,UP
                csWait 30
                nod ALLY_BOWIE
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                followEntity ALLY_LEMON,FOLLOWER_B,2
                csc_end
ce_4ECD6:       mainEntity 15,10,UP
                entity 13,8,RIGHT,ALLY_PETER,eas_Init
                entity 17,8,LEFT,ALLY_LEMON,eas_Init
                entity 63,63,DOWN,MAPSPRITE_OBJECT1,eas_Init
                entity 63,63,DOWN,MAPSPRITE_OBJECT1,eas_Init
                entity 63,63,DOWN,MAPSPRITE_OBJECT1,eas_Init
                entity 15,8,DOWN,MAPSPRITE_ODD_EYE,eas_Init
                dc.w $FFFF
