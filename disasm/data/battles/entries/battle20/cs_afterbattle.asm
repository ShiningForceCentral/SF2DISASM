
; ASM FILE data\battles\entries\battle20\cs_afterbattle.asm :
; 0x4B6CE..0x4B790 : Cutscene after battle 20
abcs_battle20:  textCursor 2566
                loadMapFadeIn MAP_HARPY_POOL,2,6
                loadMapEntities ce_4B780
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setPos ALLY_PETER,5,10,UP
                setPos FOLLOWER_B,7,10,UP
                fadeInB
                nextText $0,ALLY_ELRIC  ; "I'm {NAME;13}, an archer.{N}I had no idea how dangerous{N}this pond was.{W2}"
                nextSingleText $0,ALLY_ELRIC ; "You saved my life.{N}Thank you.{W1}"
                nextText $C0,ALLY_PETER ; "You should thank Oddler.{W2}"
                nextSingleText $C0,ALLY_PETER ; "He heard your cry for help{N}and brought us here.{W1}"
                setFacing ALLY_PETER,RIGHT
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 120
                setFacing FOLLOWER_B,UP
                nextSingleText $C0,FOLLOWER_B ; "Oh well, it was nothing.{W1}"
                setFacing ALLY_PETER,UP
                nextText $0,ALLY_ELRIC  ; "An elf always returns a{N}favor.{W2}"
                nextSingleText $0,ALLY_ELRIC ; "Please, let me help you.{W1}"
                setFacing ALLY_PETER,RIGHT
                setFacing ALLY_BOWIE,LEFT
                nextSingleText $C0,ALLY_PETER ; "{LEADER}, looks like{N}we've found another friend.{W1}"
                entityActionsWait ALLY_ELRIC
                 moveDown 1
                endActions
                nextSingleText $0,ALLY_ELRIC ; "Oh, thank you!{W1}"
                setFacing ALLY_BOWIE,UP
                nod ALLY_BOWIE
                join ALLY_ELRIC
                setFacing ALLY_PETER,UP
                nextSingleText $C0,ALLY_PETER ; "Now, let's go see Mr. Creed!{W1}"
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                followEntity ALLY_ELRIC,FOLLOWER_B,2
                csc_end
ce_4B780:       mainEntity 6,10,UP
                entity 6,8,DOWN,ALLY_ELRIC,eas_Init
                dc.w $FFFF
