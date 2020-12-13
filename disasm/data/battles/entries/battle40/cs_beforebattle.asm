
; ASM FILE data\battles\entries\battle40\cs_beforebattle.asm :
; 0x4E4DC..0x4E8A8 : Cutscene before battle 40
bbcs_40:        textCursor 3036
                loadMapFadeIn MAP_ODDEYE_ARENA,11,34
                loadMapEntities ce_4E878
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,15,40,UP
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,16,40,UP
                setActscriptWait ALLY_LEMON,eas_Init
                setPos ALLY_LEMON,15,41,UP
                setActscriptWait 128,eas_Init
                setPos 128,16,41,UP
                jumpIfFlagClear 76,cs_4E544 ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,63,62,DOWN
cs_4E544:       setBlocks 11,6,11,29,44,0
                setBlocks 32,0,11,29,11,6
                playSound MUSIC_STOP
                fadeInB
                cameraSpeed $30
                entityActions ALLY_BOWIE
                 moveUp 3
                endActions
                entityActions ALLY_PETER
                 moveUp 3
                endActions
                entityActions FOLLOWER_B
                 moveUp 3
                endActions
                entityActions 128
                 moveUp 3
                endActions
                entityActionsWait ALLY_LEMON
                 moveUp 3
                endActions
                nextSingleText $C0,129  ; "{LEADER}, you're finally{N}here.{W1}"
                setActscript ALLY_BOWIE,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                entityActions ALLY_BOWIE
                 moveUp 1
                endActions
                entityActions ALLY_PETER
                 moveUp 2
                endActions
                entityActions FOLLOWER_B
                 moveUp 1
                endActions
                entityActions ALLY_LEMON
                 moveUp 1
                 moveLeft 1
                 moveUp 1
                endActions
                entityActionsWait 128
                 moveUp 1
                 moveRight 1
                 moveUp 1
                endActions
                csWait 30
                setCamDest 11,2
                playSound MUSIC_BATTLE_THEME_3
                nextSingleText $0,ALLY_PETER ; "Is that...?{W1}"
                nextSingleText $C0,129  ; "Did you forget about me,{N}{LEADER} and {NAME;7}!{W1}"
                nextSingleText $0,ALLY_PETER ; "Oddler, are you Odd Eye?{N}Zalbard said...{W1}"
                nextSingleText $C0,129  ; "Yes, I am he.{W1}"
                nextSingleText $0,FOLLOWER_B ; "You're the leader of the Devil{N}Army who attacked Bedoe...{W1}"
                nextSingleText $C0,129  ; "Yes I am, Sir Astral.{W1}"
                nextSingleText $0,FOLLOWER_B ; "How do you know me?{W1}"
                nextSingleText $C0,129  ; "{LEADER} told me about{N}you repeatedly.{W1}"
                nextSingleText $0,ALLY_PETER ; "What do YOU want?{W1}"
                nextSingleText $C0,129  ; "Don't talk to me like that.{N}I'm very sad.{W1}"
                nextSingleText $0,ALLY_PETER ; "Sad?{N}You've got to be joking!{W1}"
                setFacing 129,LEFT
                nextSingleText $C0,129  ; "Well, yes I am.{N}I'm really quite evil.{W1}"
                setFacing 129,DOWN
                nextSingleText $C0,129  ; "Don't you think so, Red{N}Baron?{W1}"
                nextSingleText $0,ALLY_LEMON ; "Uhh...(shiver).{W1}"
                entityActionsWait 129
                 moveDown 1
                endActions
                nextText $C0,129        ; "Anyway, I came here to{N}deliver an ultimatum.{W2}"
                nextText $C0,129        ; "Think long and well before{N}answering me.{W2}"
                nextSingleText $C0,129  ; "Leave the jewel, your{N}weapons, and your items{N}here...or DIE!{W1}"
                nextSingleText $0,ALLY_PETER ; "That means...we don't have{N}to fight him.{W1}"
                nextSingleText $0,FOLLOWER_B ; "True, but we can't take the{N}easy way out.  We mustn't{N}give him the jewel.{W1}"
                nextSingleText $C0,129  ; "You know how strong I am.{N}I think you had better{N}accept the offer.{W1}"
                nextSingleText $0,ALLY_BOWIE ; "Hmmm....{W1}"
                nextSingleText $0,ALLY_PETER ; "Oh, what should we do?!{W1}"
                nextSingleText $0,FOLLOWER_B ; "We have to fight!{W1}"
                nextSingleText $C0,129  ; "Times up!  We need space{N}to battle.{W1}"
                entityFlashWhite 129,$1E
                tintMap
                csWait 20
                flickerOnce
                csWait 10
                tintMap
                csWait 20
                flickerOnce
                setActscript 130,eas_AnimSpeedx2
                setActscriptWait 130,eas_DeactivateAutoFacing
                setPos 130,16,8,UP
                entityActionsWait 130
                 moveUp 2
                endActions
                setBlocks 6,15,1,1,16,6
                setPos 130,63,63,UP
                csWait 30
                setPos 130,15,8,UP
                entityActionsWait 130
                 moveUp 2
                endActions
                setBlocks 6,15,1,1,15,6
                setPos 130,63,63,UP
                csWait 20
                setPos 130,17,9,UP
                entityActionsWait 130
                 moveUp 2
                endActions
                setBlocks 6,15,1,1,17,7
                csWait 10
                setPos 130,16,9,UP
                entityActionsWait 130
                 moveUp 2
                endActions
                setBlocks 6,15,1,1,16,7
                hide 130
                csWait 5
                setBlocks 6,15,1,1,15,7
                csWait 5
                setBlocks 6,15,1,1,14,7
                csWait 5
                setBlocks 6,15,1,1,18,8
                csWait 4
                setBlocks 6,15,1,1,17,8
                csWait 4
                setBlocks 6,15,1,1,16,8
                csWait 4
                setBlocks 6,15,1,1,15,8
                csWait 4
                setBlocks 6,15,1,1,14,8
                csWait 4
                setBlocks 6,15,1,1,13,8
                csWait 4
                setBlocks 6,15,1,1,19,9
                csWait 3
                setBlocks 6,15,1,1,18,9
                csWait 3
                setBlocks 6,15,1,1,17,9
                csWait 3
                setBlocks 6,15,1,1,16,9
                csWait 3
                setBlocks 6,15,1,1,15,9
                csWait 3
                setBlocks 6,15,1,1,14,9
                csWait 3
                setBlocks 6,15,1,1,13,9
                csWait 3
                setBlocks 6,15,1,1,12,9
                csWait 3
                setBlocks 6,15,1,1,19,10
                csWait 2
                setBlocks 6,15,1,1,18,10
                csWait 2
                setBlocks 6,15,1,1,17,10
                csWait 2
                setBlocks 6,15,1,1,16,10
                csWait 2
                setBlocks 6,15,1,1,15,10
                csWait 2
                setBlocks 6,15,1,1,14,10
                csWait 2
                setBlocks 6,15,1,1,13,10
                csWait 2
                setBlocks 6,15,1,1,12,10
                csWait 2
                setBlocks 6,15,1,1,21,11
                csWait 1
                setBlocks 6,15,1,1,19,11
                csWait 1
                setBlocks 6,15,1,1,18,11
                csWait 1
                setBlocks 6,15,1,1,17,11
                csWait 1
                setBlocks 6,15,1,1,16,11
                csWait 1
                setBlocks 6,15,1,1,15,11
                csWait 1
                setBlocks 6,15,1,1,14,11
                csWait 1
                setBlocks 6,15,1,1,13,11
                csWait 1
                setBlocks 6,15,1,1,12,11
                csWait 1
                setBlocks 44,0,11,29,11,6
                nextSingleText $C0,129  ; "I'm very sorry, {LEADER},{N}but I must kill you!{W1}"
                setCamDest 11,31
                setFacing ALLY_PETER,RIGHT
                setFacing ALLY_BOWIE,LEFT
                nextSingleText $0,ALLY_PETER ; "{LEADER}, are we really{N}going to fight Oddler?{W1}"
                entityActionsWait FOLLOWER_B
                 moveLeft 1
                endActions
                setFacing FOLLOWER_B,UP
                setFacing ALLY_LEMON,RIGHT
                nextSingleText $0,FOLLOWER_B ; "That's enough out of you!{W1}"
                entityActionsWait FOLLOWER_B
                 moveRight 1
                endActions
                setFacing FOLLOWER_B,UP
                setFacing ALLY_BOWIE,DOWN
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, let's do it!{W1}"
                setActscript ALLY_PETER,eas_Jump
                nod ALLY_BOWIE
                csc_end
ce_4E878:       mainEntity 16,39,UP
                entity 15,40,UP,ALLY_PETER,eas_Init
                entity 15,41,UP,ALLY_LEMON,eas_Init
                entity 16,41,UP,MAPSPRITE_CARAVAN,eas_Init
                entity 16,4,DOWN,MAPSPRITE_ODD_EYE,eas_Init
                entity 63,63,UP,MAPSPRITE_EFFECT3,eas_Init
                dc.w $FFFF
