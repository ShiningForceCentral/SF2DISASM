
; ASM FILE data\battles\entries\battle13\cs_afterbattle.asm :
; 0x4ACF8..0x4ADA6 : Cutscene after battle 13
abcs_battle13:  textCursor 2495
                playSound $FD
                loadMapFadeIn MAP_POLCA,11,8
                loadMapEntities ce_4AD96
                setActscriptWait ALLY_BOWIE,eas_Init
                setPos ALLY_PETER,15,13,RIGHT
                customActscriptWait ALLY_LUKE
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound MUSIC_TOWN
                fadeInB
                csWait 50
                nextSingleText $0,ALLY_PETER ; "{NAME;10}, are you OK?  {NAME;10}!{W1}"
                csWait 50
                setActscriptWait ALLY_LUKE,eas_Init
                setActscriptWait ALLY_LUKE,eas_Jump
                headshake ALLY_LUKE
                nextSingleText $C0,ALLY_LUKE ; "Squawk!  They knocked me{N}senseless.{W1}"
                csWait 5
                setActscript ALLY_LUKE,eas_2xRightLeft
                csWait 60
                nextText $C0,ALLY_LUKE  ; "Where are the devils?{N}{LEADER}, did you defeat{N}them?{W2}"
                setFacing ALLY_LUKE,UP
                nextSingleText $C0,ALLY_LUKE ; "Nobody in Bedoe can fight{N}like that.  Thank you.{W1}"
                setFacing ALLY_LUKE,LEFT
                nextSingleText $0,ALLY_PETER ; "He's a great fighter.{N}Volcanon doesn't know how{N}good he is!{W1}"
                nextText $C0,ALLY_LUKE  ; "He'll learn.{W2}"
                nextSingleText $C0,ALLY_LUKE ; "Let's go see the mayor and{N}get a raft!{W1}"
                setFacing ALLY_LUKE,UP
                nextSingleText $FF,255  ; "{CLEAR}{LEADER} decides to take{N}{NAME;10} the BDMN with him.{W1}{CLEAR}"
                setF 75                 ; Luke is a follower
                warp MAP_POLCA,16,12,DOWN
                csc_end
ce_4AD96:       mainEntity 16,12,DOWN
                entity 16,13,DOWN,ALLY_LUKE,eas_Init
                dc.w $FFFF
