
; ASM FILE data\scripting\map\cs_end.asm :
; 0x49058..0x494BC : End cutscene
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
dms_01:         faceEntity 134,ALLY_BOWIE
                addNewFollower ALLY_SLADE
                addNewFollower ALLY_JAHA
                addNewFollower ALLY_ZYNK
                followEntity ALLY_PETER,ALLY_BOWIE,2
                moveEntityAboveAnother ALLY_BOWIE,ALLY_BOWIE
                csc_end
                setCameraEntity ALLY_BOWIE
                setActscript ALLY_BOWIE,eas_ControlledCharacter
cs_4934A:       entityFlashWhite ALLY_BOWIE,$B4
                jump cs_4934A
                csc_end
                textCursor 322
                csc15 ALLY_SARAH,$1,eas_ControlledCharacter
                showPortrait $0,ALLY_BOWIE
                setQuake 32770
                setQuake 16386
                loadMapFadeIn MAP_OUTSIDE_MITULA,13,13
                flashScreenWhite $3C
                csc_end
                flashScreenWhite $3C
                csc_end
                stopEntity ALLY_KAZIN
                csc15 ALLY_SARAH,$1,eas_493A2
                waitIdle ALLY_SARAH
                showPortrait $0,ALLY_BOWIE
                csWait 60
                startEntity ALLY_KAZIN
                hidePortrait
                csc_end
eas_493A2:       ac_entityObstructable ON
                 ac_mapUncollidable ON
                 ac_entityUncollidable ON
                 ac_setSpeed 32,32
                 ac_accelFactors 0,0
                 ac_acceleration -2,ON
                 ac_deceleration -2,ON
                 ac_checkMapBlockCopy
                 ac_controlCharacter
                 ac_waitDest
                 ac_checkMapBlockCopy
                 ac_wait 1
word_493CA:      ac_branch
                dc.w (eas_ControlledCharacter-word_493CA) & $FFFF
                dc.w 4                  ; 0004 SET TEXT INDEX 142
                dc.w $142
                dc.w $1E                ; 001E HIDE PORTRAIT
                dc.w $A                 ; 000A EXECUTE SUBROUTINE 493EC
                dc.l sub_493EC
                dc.w 1                  ; 0001 DISPLAY SINGLE TEXT BOX WITH VARS 0 4
                dc.w 0
                dc.w 4
                dc.w $14                ; 0014 SET ACTSCRIPT MANUAL 0
                dc.b 0
                dc.b 0
                dc.w 0                  ; 0000 WAIT value $1D
                dc.w $1D
                dc.w 0                  ; 0000 WAIT value $FFFF
                dc.w $FFFF

; =============== S U B R O U T I N E =======================================

sub_493EC:
                
                move.w  #$18A,d0        ; 018A={NAME} found{N}the {ITEM}.{D1}
                jsr     (DisplayText).l 
                moveq   #$78,d0 
                rts

    ; End of function sub_493EC

                updateDefeatedAllies
                allyDefeated ALLY_PETER
                allyDefeated ALLY_SARAH
                allyDefeated ALLY_CHESTER
                allyDefeated ALLY_KIWI
                reviveAlly 128
                reviveAlly 150
                allyDefeated ALLY_JAHA
                showPortrait $0,ALLY_BOWIE
                csc_end
                setCameraEntity 65535
                entityFlashWhite ALLY_BOWIE,$28
                hide ALLY_BOWIE
                setPos ALLY_KIWI,13,23,DOWN
                entityFlashWhite ALLY_KIWI,$28
                animEntityFX ALLY_KIWI,7
                playSound MUSIC_PROMOTED_ATTACK_LOOP
                csc_end
                textCursor 394          ; Unused cutscene with parsing mistake here and below, letting it unformatted.
                showPortrait $0,ALLY_BOWIE
                nextTextVar $0,ALLY_BOWIE,$0,$3,$A ; "{NAME} found{N}the {ITEM}.{D1}"
                nextSingleTextVar $0,ALLY_BOWIE,$0,$4 ; "{NAME} received{N}the {ITEM}."
                dc.l $14001D
                dc.l $8078
                dc.l $1E0004
                dc.l $1420002
                dc.l 0
                dc.l $FFFF
                dc.l $140501
                dc.l $150000
                dc.l $110001
                dc.l $100020
                dc.l $120000
                dc.l $13FFFF
                dc.l $40000
                dc.l $FFFF0000
                dc.l $50004
                dc.l 1
                dc.l 5
                dc.l $40000
                dc.l 0
                dc.l $50015
                dc.w $FFFF
word_494AC:      ac_branch
                dc.w (eas_Idle-word_494AC) & $FFFF
                ac_end
                showPortrait $0,ALLY_BOWIE
                csWait 60
                hidePortrait
                csc_end
