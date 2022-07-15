
; ASM FILE data\maps\entries\map44\mapsetups\scripts.asm :
; 0x54578..0x5473E : 
cs_54578:       textCursor 1013
                nextSingleText $0,FOLLOWER_B ; "OK.  Let's go!{W1}"
                nod 138
                setFacing 138,DOWN
                nextSingleText $0,138   ; "Weigh anchor!{W1}"
                setDest ALLY_BOWIE,11,13
                entityActions 139
                 moveRight 4
                 moveUp 9
                 faceLeft 2
                 faceDown 1
                endActions
                entityActions 140
                 faceRight 30
                 moveUp 9
                 faceRight 2
                 faceDown 1
                endActions
                entityActionsWait ALLY_BOWIE
                 moveRight 4
Map21_DefaultZoneEvent:
                 moveDown 1
                 moveRight 1
                 moveRight 1
                 moveRight 2
                endActions
                csWait 30
                setFacing ALLY_BOWIE,DOWN
                setFacing FOLLOWER_B,DOWN
                setFacing FOLLOWER_A,DOWN
                setFacing 159,DOWN
                setCamDest 10,11
                setBlocks 15,22,3,1,12,22
                csWait 4
                setBlocks 15,21,3,1,12,21
                csWait 4
                setBlocks 15,20,3,1,12,20
                csWait 4
                setBlocks 15,19,3,1,12,19
                csWait 4
                setBlocks 15,18,3,1,12,18
                csWait 4
                setBlocks 15,17,3,1,12,17
                csWait 4
                setBlocks 15,16,3,1,12,16
                csWait 4
                setBlocks 15,15,3,1,12,15
                csWait 15
                setCamDest 13,12
                setFacing 159,RIGHT
                nextSingleText $0,159   ; "Sir Astral, where are we{N}headed?{W1}"
                setFacing FOLLOWER_B,LEFT
                nextSingleText $C0,FOLLOWER_B ; "This earthquake must{N}have caused damage all{N}over the island.{W1}"
                setFacing FOLLOWER_B,DOWN
                nextSingleText $C0,FOLLOWER_B ; "Maybe...to the east...to...{N}Oh, yes!  To the mainland!{W1}"
                setActscriptWait 159,eas_Jump
                setActscriptWait 159,eas_Jump
                nextSingleText $0,159   ; "To Parmecia?!{N}Hmmmm....{W1}"
                setFacing FOLLOWER_A,RIGHT
                nextSingleText $0,FOLLOWER_A ; "What?  To the mainland?{N}No!{W2}{N}What about Elis?!  No,{N}we'll stay here on Grans!{W1}"
                setFacing FOLLOWER_A,DOWN
                entityActions FOLLOWER_B
                 moveUp 1
                 moveLeft 2
                endActions
                setCamDest 11,12
                nextSingleText $C0,FOLLOWER_B ; "It's too dangerous to stay{N}here.{N}Weigh anchor right now!{W1}"
                clearF 74               ; Astral + King are followers
                setCamDest 11,13
                executeSubroutine csub_54714
                csWait 120
                loadMapFadeIn MAP_OVERWORLD_GRANS_GRANSEAL,28,26
                loadMapEntities ce_54736
                setActscriptWait ALLY_BOWIE,eas_Init
                setSprite ALLY_BOWIE,MAPSPRITE_BOAT
                fadeInB
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 20,20      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_BOWIE
                 moveRight 1
                 moveUp 2
                 moveRight 1
                 moveUp 1
                 moveRight 1
                 moveUp 2
                 moveRight 3
                endActions
                csWait 60
                setQuake 3
                csWait 60
                setQuake 5
                csWait 30
                playSound SFX_INTRO_LIGHTNING
                flashScreenWhite $1E
                setBlocks 0,49,10,15,28,23
                flashScreenWhite $1E
                csWait 60
                setQuake 3
                csWait 60
                setQuake 1
                csWait 90
                setQuake 0
                csWait 120
                warp MAP_OVERWORLD_NEW_GRANSEAL_SHORE,26,13,RIGHT
                clearF 640              ; Set after the end of battle 7's long sequence, cleared at docks?
                csc_end

; =============== S U B R O U T I N E =======================================


csub_54714:
                
                moveq   #$F,d7
loc_54716:
                
                subq.b  #1,((MAP_AREA_LAYER1_AUTOSCROLL_X-$1000000)).w
                moveq   #4,d0
                jsr     (Sleep).w       
                dbf     d7,loc_54716
                moveq   #$17,d7
loc_54726:
                
                addq.b  #1,((MAP_AREA_LAYER2_AUTOSCROLL_X-$1000000)).w
                moveq   #4,d0
                jsr     (Sleep).w       
                dbf     d7,loc_54726
                rts

    ; End of function csub_54714

ce_54736:       mainEntity 34,33,RIGHT
                dc.w $FFFF
