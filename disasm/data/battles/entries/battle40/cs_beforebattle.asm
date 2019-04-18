
; ASM FILE data\battles\entries\battle40\cs_beforebattle.asm :
; 0x4E4DC..0x4E8A8 : Cutscene before battle 40
bbcs_40:        textCursor $BDC
                loadMapFadeIn 54,11,34
                loadMapEntities ce_4E878
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setPos $7,15,40,UP
                setActscriptWait $1F,eas_Init
                setPos $1F,16,40,UP
                setActscriptWait $1C,eas_Init
                setPos $1C,15,41,UP
                setActscriptWait $80,eas_Init
                setPos $80,16,41,UP
                jumpIfFlagClear $4C,cs_4E544 ; Zynk is a follower
                setActscriptWait $1A,eas_Init
                setPos $1A,63,62,DOWN
cs_4E544:       setBlocks 11,6,11,29,44,0
                setBlocks 32,0,11,29,11,6
                playSound MUSIC_STOP
                fadeInB
                cameraSpeed $30
                entityActions $0
                 moveUp 3
                endActions
                entityActions $7
                 moveUp 3
                endActions
                entityActions $1F
                 moveUp 3
                endActions
                entityActions $80
                 moveUp 3
                endActions
                entityActionsWait $1C
                 moveUp 3
                endActions
                nextSingleText $C0,$81  ; "{LEADER}, you're finally{N}here.{W1}"
                setActscript $0,eas_Jump
                setActscriptWait $7,eas_Jump
                entityActions $0
                 moveUp 1
                endActions
                entityActions $7
                 moveUp 2
                endActions
                entityActions $1F
                 moveUp 1
                endActions
                entityActions $1C
                 moveUp 1
                 moveLeft 1
                 moveUp 1
                endActions
                entityActionsWait $80
                 moveUp 1
                 moveRight 1
                 moveUp 1
                endActions
                csWait 30
                setCamDest 11,2
                playSound MUSIC_BATTLE_THEME_3
                nextSingleText $0,$7    ; "Is that...?{W1}"
                nextSingleText $C0,$81  ; "Did you forget about me,{N}{LEADER} and {NAME;7}!{W1}"
                nextSingleText $0,$7    ; "Oddler, are you Odd Eye?{N}Zalbard said...{W1}"
                nextSingleText $C0,$81  ; "Yes, I am he.{W1}"
                nextSingleText $0,$1F   ; "You're the leader of the Devil{N}Army who attacked Bedoe...{W1}"
                nextSingleText $C0,$81  ; "Yes I am, Sir Astral.{W1}"
                nextSingleText $0,$1F   ; "How do you know me?{W1}"
                nextSingleText $C0,$81  ; "{LEADER} told me about{N}you repeatedly.{W1}"
                nextSingleText $0,$7    ; "What do YOU want?{W1}"
                nextSingleText $C0,$81  ; "Don't talk to me like that.{N}I'm very sad.{W1}"
                nextSingleText $0,$7    ; "Sad?{N}You've got to be joking!{W1}"
                setFacing $81,LEFT
                nextSingleText $C0,$81  ; "Well, yes I am.{N}I'm really quite evil.{W1}"
                setFacing $81,DOWN
                nextSingleText $C0,$81  ; "Don't you think so, Red{N}Baron?{W1}"
                nextSingleText $0,$1C   ; "Uhh...(shiver).{W1}"
                entityActionsWait $81
                 moveDown 1
                endActions
                nextText $C0,$81        ; "Anyway, I came here to{N}deliver an ultimatum.{W2}"
                nextText $C0,$81        ; "Think long and well before{N}answering me.{W2}"
                nextSingleText $C0,$81  ; "Leave the jewel, your{N}weapons, and your items{N}here...or DIE!{W1}"
                nextSingleText $0,$7    ; "That means...we don't have{N}to fight him.{W1}"
                nextSingleText $0,$1F   ; "True, but we can't take the{N}easy way out.  We mustn't{N}give him the jewel.{W1}"
                nextSingleText $C0,$81  ; "You know how strong I am.{N}I think you had better{N}accept the offer.{W1}"
                nextSingleText $0,$0    ; "Hmmm....{W1}"
                nextSingleText $0,$7    ; "Oh, what should we do?!{W1}"
                nextSingleText $0,$1F   ; "We have to fight!{W1}"
                nextSingleText $C0,$81  ; "Times up!  We need space{N}to battle.{W1}"
                entityFlashWhite $81,$1E
                tintMap
                csWait 20
                flickerOnce
                csWait 10
                tintMap
                csWait 20
                flickerOnce
                setActscript $82,eas_AnimSpeedx2
                setActscriptWait $82,eas_46172
                setPos $82,16,8,UP
                entityActionsWait $82
                 moveUp 2
                endActions
                setBlocks 6,15,1,1,16,6
                setPos $82,63,63,UP
                csWait 30
                setPos $82,15,8,UP
                entityActionsWait $82
                 moveUp 2
                endActions
                setBlocks 6,15,1,1,15,6
                setPos $82,63,63,UP
                csWait 20
                setPos $82,17,9,UP
                entityActionsWait $82
                 moveUp 2
                endActions
                setBlocks 6,15,1,1,17,7
                csWait 10
                setPos $82,16,9,UP
                entityActionsWait $82
                 moveUp 2
                endActions
                setBlocks 6,15,1,1,16,7
                hide $82
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
                nextSingleText $C0,$81  ; "I'm very sorry, {LEADER},{N}but I must kill you!{W1}"
                setCamDest 11,31
                setFacing $7,RIGHT
                setFacing $0,LEFT
                nextSingleText $0,$7    ; "{LEADER}, are we really{N}going to fight Oddler?{W1}"
                entityActionsWait $1F
                 moveLeft 1
                endActions
                setFacing $1F,UP
                setFacing $1C,RIGHT
                nextSingleText $0,$1F   ; "That's enough out of you!{W1}"
                entityActionsWait $1F
                 moveRight 1
                endActions
                setFacing $1F,UP
                setFacing $0,DOWN
                nextSingleText $0,$1F   ; "{LEADER}, let's do it!{W1}"
                setActscript $7,eas_Jump
                nod $0
                csc_end
ce_4E878:       mainEntity 16,39,UP
                entity 15,40,UP,ALLY_PETER,eas_Init
                entity 15,41,UP,ALLY_LEMON,eas_Init
                entity 16,41,UP,MAPSPRITE_CARAVAN,eas_Init
                entity 16,4,DOWN,MAPSPRITE_ODD_EYE,eas_Init
                entity 63,63,UP,MAPSPRITE_EFFECT3,eas_Init
                dc.w $FFFF
