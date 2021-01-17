
; ASM FILE data\battles\entries\battle36\cs_beforebattle.asm :
; 0x4D88A..0x4D9A4 : Cutscene before battle 36
bbcs_36:        textCursor 2946
                loadMapFadeIn MAP_PRISM_FLOWERS_FIELD,15,0
                loadMapEntities ce_4D964
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,18,0,DOWN
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,20,0,DOWN
                jumpIfFlagClear 76,cs_4D8D6 ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,63,62,DOWN
cs_4D8D6:       playSound MUSIC_BATTLE_THEME_1
                fadeInB
                cameraSpeed $30
                entityActions ALLY_BOWIE
                 moveDown 4
                endActions
                entityActions ALLY_PETER
                 moveDown 4
                endActions
                entityActions FOLLOWER_B
                 moveDown 4
                endActions
                entityActionsWait 129
                 moveDown 4
                endActions
                nextSingleText $0,128   ; "You're early!{N}{W2}"
                setCamDest 10,14
                nextText $0,128         ; "Darn you, Granseal swine!{W2}"
                nextText $0,128         ; "But, don't worry.  I just{N}finished my preparations.{N}Yes...everything's ready.{W2}"
                nextSingleText $0,128   ; "It's show time!{W1}"
                setActscript 130,eas_AnimSpeedx2
                setActscript 131,eas_AnimSpeedx2
                setActscript 132,eas_AnimSpeedx2
                setActscript 133,eas_AnimSpeedx2
                csWait 40
                setCamDest 14,2
                setFacing ALLY_PETER,RIGHT
                nextSingleText $0,ALLY_PETER ; "Sir Astral, why is he smiling?{W1}"
                setFacing FOLLOWER_B,LEFT
                nextSingleText $0,FOLLOWER_B ; "He believes this is the place{N}where we will die....{W1}"
                setFacing FOLLOWER_B,DOWN
                setFacing ALLY_BOWIE,UP
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, be careful!{W1}"
                nod ALLY_BOWIE
                setFacing ALLY_BOWIE,DOWN
                csc_end
ce_4D964:       mainEntity 19,1,DOWN
                entity 18,0,DOWN,ALLY_PETER,eas_Init
                entity 16,16,UP,MAPSPRITE_GESHP,eas_Init
                entity 19,0,DOWN,MAPSPRITE_CARAVAN,eas_Init
                entity 12,16,RIGHT,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 13,17,UP,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 14,19,LEFT,MAPSPRITE_PRISM_FLOWER,eas_Init
                entity 15,20,UP,MAPSPRITE_PRISM_FLOWER,eas_Init
                dc.w $FFFF
