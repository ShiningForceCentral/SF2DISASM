
; ASM FILE data\scripting\map\cs_end.asm :
; 0x49058..0x4931C : End cutscene
EndCutscene:    mapLoad MAP_GRANSEAL_CASTLE_1F,19,33
                loadMapEntities ce_492CC
                setActscriptWait ALLY_BOWIE,eas_Init
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 20,20      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 128
                 ac_setSpeed 20,20      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 129
                 ac_setSpeed 20,20      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 130
                 ac_setSpeed 20,20      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 131
                 ac_setSpeed 20,20      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setSprite ALLY_ROHDE,MAPSPRITE_NPC_ROHDE
                fadeInB
                csWait 60
                setPos ALLY_BOWIE,25,35,RIGHT
                entityActionsWait ALLY_BOWIE
                 moveDownRight 1
                 moveRight 1
                endActions
                csWait 30
                entityActionsWait ALLY_BOWIE
                 moveDown 4
                endActions
                setFacing ALLY_BOWIE,LEFT
                entityActionsWait 128
                 moveRight 1
                endActions
                entityActionsWait 129
                 moveRight 1
                endActions
                csWait 60
                nod 128
                nod 129
                nod ALLY_BOWIE
                csWait 40
                entityActionsWait ALLY_BOWIE
                 moveUp 4
                endActions
                setFacing ALLY_BOWIE,LEFT
                csWait 80
                setPos 131,25,35,RIGHT
                entityActionsWait 131
                 moveDownRight 1
                endActions
                csWait 40
                nod ALLY_BOWIE
                csWait 60
                entityActions ALLY_BOWIE
                 moveDown 4
                endActions
                entityActionsWait 131
                 moveRight 1
                 moveDown 3
                endActions
                setFacing ALLY_BOWIE,LEFT
                setFacing 131,LEFT
                setActscript 128,eas_Jump
                setActscript 129,eas_Jump
                setActscriptWait 130,eas_Jump
                csWait 40
                setFacing 130,DOWN
                csWait 30
                setFacing 129,UP
                nod 130
                csWait 60
                setFacing 128,UP
                csWait 30
                setFacing 129,DOWN
                nod 128
                csWait 40
                setFacing 129,RIGHT
                csWait 20
                setFacing 128,RIGHT
                csWait 40
                setFacing ALLY_BOWIE,UP
                csWait 20
                setFacing 131,DOWN
                csWait 60
                setFacing ALLY_BOWIE,LEFT
                csWait 10
                setFacing 131,LEFT
                csWait 30
                entityActions ALLY_BOWIE
                 moveLeft 4
                endActions
                entityActionsWait 131
                 moveLeft 4
                endActions
                nod 129
                nod 131
                csWait 60
                setFacing 130,UP
                csWait 30
                setActscriptWait 130,eas_Jump
                csWait 30
                entityActionsWait 130
                 moveUp 1
                endActions
                setFacing 130,DOWN
                setPos ALLY_ROHDE,23,37,DOWN
                entityActions ALLY_ROHDE
                 moveDown 1
                 moveLeft 2
                 moveDown 2
                endActions
                csWait 20
                setPos ALLY_CHESTER,23,37,DOWN
                entityActions ALLY_CHESTER
                 moveDown 1
                 moveLeft 2
                 moveDown 1
                endActions
                csWait 20
                setPos ALLY_LUKE,23,37,DOWN
                entityActions ALLY_LUKE
                 moveDown 1
                 moveLeft 2
                endActions
                csWait 20
                setPos ALLY_JAHA,23,37,DOWN
                entityActions ALLY_JAHA
                 moveDown 1
                 moveLeft 1
                endActions
                csWait 20
                setPos ALLY_PETER,23,37,DOWN
                entityActions ALLY_PETER
                 moveDown 1
                endActions
                setFacing ALLY_ROHDE,RIGHT
                csWait 10
                setFacing ALLY_CHESTER,RIGHT
                csWait 10
                setFacing ALLY_LUKE,DOWN
                csWait 10
                setFacing ALLY_JAHA,DOWN
                setFacing ALLY_BOWIE,UP
                setFacing 131,UP
                csWait 30
                setFacing ALLY_BOWIE,LEFT
                setFacing 131,LEFT
                csWait 30
                setFacing ALLY_BOWIE,UP
                setFacing 131,UP
                csWait 40
                setActscript ALLY_ROHDE,eas_Jump
                setActscript ALLY_CHESTER,eas_Jump
                setActscript ALLY_LUKE,eas_Jump
                setActscript ALLY_JAHA,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                setFacing 131,LEFT
                nod 128
                setFacing ALLY_BOWIE,LEFT
                csWait 50
                nod ALLY_BOWIE
                setActscript ALLY_ROHDE,eas_Jump
                setActscript ALLY_CHESTER,eas_Jump
                setActscript ALLY_LUKE,eas_Jump
                setActscript ALLY_JAHA,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                fadeOutB
                csc_end
ce_492CC:       mainEntity 63,63,DOWN
                entity 63,63,DOWN,ALLY_ROHDE,eas_Init
                entity 63,63,DOWN,ALLY_CHESTER,eas_Init
                entity 63,63,DOWN,ALLY_LUKE,eas_Init
                entity 63,63,DOWN,ALLY_JAHA,eas_Init
                entity 63,63,DOWN,ALLY_PETER,eas_Init
                entity 21,40,RIGHT,MAPSPRITE_ASTRAL,eas_Init
                entity 21,39,RIGHT,MAPSPRITE_GRANSEAL_KING,eas_Init
                entity 22,38,RIGHT,MAPSPRITE_MINISTER,eas_Init
                entity 63,63,DOWN,MAPSPRITE_ELIS,eas_Init
                dc.w $FFFF
