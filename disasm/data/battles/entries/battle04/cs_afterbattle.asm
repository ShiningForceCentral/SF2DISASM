
; ASM FILE data\battles\entries\battle04\cs_afterbattle.asm :
; 0x498EE..0x49AB2 : Cutscene after battle 4
abcs_battle04:  textCursor 2319
                loadMapFadeIn MAP_OVERWORLD_GRANS_GRANSEAL,9,16
                loadMapEntities ce_49A6A
                setActscriptWait ALLY_BOWIE,eas_Init
                setPos ALLY_SARAH,14,21,DOWN
                setPos ALLY_CHESTER,12,21,DOWN
                setPos ALLY_JAHA,13,22,DOWN
                setPos ALLY_KAZIN,11,22,DOWN
                fadeInB
                nod ALLY_BOWIE
                nextSingleText $0,ALLY_LEMON ; "Your battle strategy was{N}wonderful!  I praise you.{W1}"
                csWait 5
                setActscript ALLY_JAHA,eas_2xRightLeft
                csWait 5
                setActscript ALLY_KAZIN,eas_2xRightLeft
                setActscript ALLY_SARAH,eas_Jump
                setActscriptWait ALLY_CHESTER,eas_Jump
                setActscript ALLY_SARAH,eas_Jump
                setActscriptWait ALLY_CHESTER,eas_Jump
                csWait 80
                setPos ALLY_LEMON,18,22,UP
                entityActionsWait ALLY_LEMON
                 moveUp 2
                endActions
                setFacing ALLY_LEMON,LEFT
                setFacing ALLY_BOWIE,RIGHT
                setFacing ALLY_SARAH,RIGHT
                setFacing ALLY_CHESTER,RIGHT
                setFacing ALLY_JAHA,RIGHT
                setFacing ALLY_KAZIN,RIGHT
                nextSingleText $0,ALLY_LEMON ; "But, I can't let you escape.{W1}"
                customActscriptWait ALLY_LEMON
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_LEMON
                 moveLeft 4
                endActions
                setActscriptWait ALLY_BOWIE,eas_DeactivateAutoFacing
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setQuake 2
                playSound SFX_BATTLEFIELD_DEATH
                entityActionsWait ALLY_BOWIE
                 moveLeft 1
                endActions
                setQuake 0
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                 moveRight 1
                endActions
                setActscript ALLY_BOWIE,eas_RotateRight
                setFacing ALLY_SARAH,UP
                setFacing ALLY_CHESTER,UP
                setFacing ALLY_JAHA,UP
                setFacing ALLY_KAZIN,UP
                csWait 60
                setActscriptWait ALLY_BOWIE,eas_Init
                setFacing ALLY_BOWIE,DOWN
                customActscriptWait ALLY_BOWIE
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_LEMON
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_LEMON
                 moveRight 1
                endActions
                nextSingleText $0,ALLY_LEMON ; "That lad is their leader.{N}Take him!{W1}"
                entityActions 130
                 moveUp 1
                endActions
                entityActions 129
                 moveLeft 3
                endActions
                entityActionsWait 128
                 moveLeft 5
                 moveDown 1
                endActions
                setFacing 130,LEFT
                setFacing ALLY_LEMON,DOWN
                nextSingleText $0,ALLY_LEMON ; "Don't worry.  He has only{N}fainted.  Take them to Galam!{W1}"
                entityActionsWait ALLY_LEMON
                 moveRight 1
                 moveDown 1
                 moveRight 2
                endActions
                warp MAP_GALAM_CASTLE_INNER,0,0,RIGHT
                csc_end
ce_49A6A:       mainEntity 13,20,DOWN
                entity 14,21,DOWN,ALLY_SARAH,eas_Init
                entity 12,21,DOWN,ALLY_CHESTER,eas_Init
                entity 13,22,DOWN,ALLY_JAHA,eas_Init
                entity 11,22,DOWN,ALLY_KAZIN,eas_Init
                entity 63,63,UP,ALLY_LEMON,eas_Init
                entity 17,18,LEFT,MAPSPRITE_GALAM_ARCHER,eas_Init
                entity 17,19,LEFT,MAPSPRITE_GALAM_SOLDIER,eas_Init
                entity 17,21,LEFT,MAPSPRITE_GALAM_SOLDIER,eas_Init
                dc.w $FFFF
