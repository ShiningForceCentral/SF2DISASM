
; ASM FILE data\battles\entries\battle04\cs_afterbattle.asm :
; 0x498EE..0x49AB2 : Cutscene after battle 4
abcs_battle04:  textCursor $90F
                loadMapFadeIn 66,9,16
                loadMapEntities ce_49A6A
                setActscriptWait $0,eas_Init
                setPos $1,14,21,DOWN
                setPos $2,12,21,DOWN
                setPos $3,13,22,DOWN
                setPos $4,11,22,DOWN
                fadeInB
                nod $0
                nextSingleText $0,$1C   ; "Your battle strategy was{N}wonderful!  I praise you.{W1}"
                csWait 5
                setActscript $3,eas_461B6
                csWait 5
                setActscript $4,eas_461B6
                setActscript $1,eas_Jump
                setActscriptWait $2,eas_Jump
                setActscript $1,eas_Jump
                setActscriptWait $2,eas_Jump
                csWait 80
                setPos $1C,18,22,UP
                entityActionsWait $1C
                 moveUp 2
                endActions
                setFacing $1C,LEFT
                setFacing $0,RIGHT
                setFacing $1,RIGHT
                setFacing $2,RIGHT
                setFacing $3,RIGHT
                setFacing $4,RIGHT
                nextSingleText $0,$1C   ; "But, I can't let you escape.{W1}"
                customActscriptWait $1C
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1C
                 moveLeft 4
                endActions
                setActscriptWait $0,eas_46172
                customActscriptWait $0
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setQuake 2
                playSound SFX_BATTLEFIELD_DEATH
                entityActionsWait $0
                 moveLeft 1
                endActions
                setQuake 0
                entityActionsWait $0
                 moveUp 1
                 moveRight 1
                endActions
                setActscript $0,eas_RotateRight
                setFacing $1,UP
                setFacing $2,UP
                setFacing $3,UP
                setFacing $4,UP
                csWait 60
                setActscriptWait $0,eas_Init
                setFacing $0,DOWN
                customActscriptWait $0
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $1C
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1C
                 moveRight 1
                endActions
                nextSingleText $0,$1C   ; "That lad is their leader.{N}Take him!{W1}"
                entityActions $82
                 moveUp 1
                endActions
                entityActions $81
                 moveLeft 3
                endActions
                entityActionsWait $80
                 moveLeft 5
                 moveDown 1
                endActions
                setFacing $82,LEFT
                setFacing $1C,DOWN
                nextSingleText $0,$1C   ; "Don't worry.  He has only{N}fainted.  Take them to Galam!{W1}"
                entityActionsWait $1C
                 moveRight 1
                 moveDown 1
                 moveRight 2
                endActions
                warp $11,$0,$0,$0
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
