
; ASM FILE data\battles\entries\battle15\cs_afterbattle.asm :
; 0x4AE72..0x4AFBE : Cutscene after battle 15
abcs_battle15:  textCursor 2506
                loadMapFadeIn MAP_ACHILLES_SHRINES,9,10
                loadMapEntities ce_4AFB6
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_A,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_A,14,19,UP
                fadeInB
                cameraSpeed $30
                entityActionsWait FOLLOWER_A
                 moveUp 5
                endActions
                nextSingleText $0,FOLLOWER_A ; "It was lucky for me that I{N}met you.  Thank you.{W1}"
                setFacing FOLLOWER_A,RIGHT
                nextSingleText $0,FOLLOWER_A ; "Follow me to the Ancient{N}Tunnel.{W1}"
                entityActionsWait FOLLOWER_A
                 moveRight 2
                 moveUp 2
                 moveRight 6
                endActions
                fadeOutB
                setPos ALLY_BOWIE,27,10,UP
                setPos ALLY_PETER,28,10,UP
                setPos FOLLOWER_B,26,10,UP
                setPos FOLLOWER_A,27,7,UP
                setCamDest 21,5
                fadeInB
                nextText $0,FOLLOWER_A  ; "Why is this door closed?{N}That's strange...{W2}"
                nextSingleText $0,FOLLOWER_A ; "Oh well, let's go in.{W1}"
                entityFlashWhite FOLLOWER_A,$28
                csWait 60
                setActscriptWait FOLLOWER_A,eas_Jump
                nextSingleText $0,FOLLOWER_A ; "What?  Let me try again.{W1}"
                entityFlashWhite FOLLOWER_A,$32
                setQuake 1
                csWait 20
                setQuake 0
                csWait 90
                nextSingleText $0,FOLLOWER_A ; "Petro, my grandson, locked{N}the door.{W1}"
                customActscriptWait FOLLOWER_A
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait FOLLOWER_A
                 moveDown 1
                endActions
                nextSingleText $0,FOLLOWER_A ; "Sorry, guys!  We can't go to{N}Grans Island this way.{W1}"
                entityActions FOLLOWER_A
                 moveDown 2
                endActions
                csWait 15
                entityActions ALLY_BOWIE
                 moveDown 1
                endActions
                entityActions ALLY_PETER
                 moveDown 1
                endActions
                entityActionsWait FOLLOWER_B
                 moveDown 1
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                waitIdle FOLLOWER_A
                entityActionsWait FOLLOWER_A
                 moveLeft 3
                endActions
                setFacing ALLY_BOWIE,LEFT
                setFacing ALLY_PETER,LEFT
                setFacing FOLLOWER_B,LEFT
                entityActionsWait FOLLOWER_A
                 moveLeft 5
                endActions
                hide FOLLOWER_A
                clearF 77               ; Old man is a follower
                setF 732                ; Set after the old man fails to open the way to Grans in the Wooden Panel shrine
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                warp MAP_ACHILLES_SHRINES,27,11,UP
                csc_end
ce_4AFB6:       mainEntity 14,5,DOWN
                dc.w $FFFF
