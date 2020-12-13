
; ASM FILE data\battles\entries\battle33\cs_afterbattle.asm :
; 0x4D09A..0x4D342 : Cutscene after battle 33
abcs_battle33:  textCursor 2876
                loadMapFadeIn MAP_MOUN,8,6
                loadMapEntities ce_4D322
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,13,11,UP
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,12,9,DOWN
                setBlocks 3,39,1,1,16,8
                stopEntity 128
                setActscriptWait 128,eas_DeactivateAutoFacing
                entityActions 128
                 moveDown 1
                endActions
                csWait 4
                setActscriptWait 128,eas_StopMoving
                entityActions ALLY_ZYNK
                 moveDown 1
                endActions
                csWait 2
                setActscriptWait ALLY_ZYNK,eas_StopMoving
                setActscriptWait ALLY_ZYNK,eas_Immersed
                fadeInB
                nextSingleText $0,FOLLOWER_B ; "There may be some survivors{N}somewhere.{W1}"
                csWait 5
                setActscript ALLY_BOWIE,eas_2xRightLeft
                csWait 5
                setActscript FOLLOWER_B,eas_2xUpDown
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 120
                entityActions 128
                 moveUp 1
                endActions
                csWait 3
                entityActions 128
                 moveDown 1
                endActions
                csWait 3
                entityActions 128
                 moveUp 1
                endActions
                csWait 3
                entityActions 128
                 moveDown 1
                endActions
                csWait 3
                setActscriptWait 128,eas_StopMoving
                setFacing ALLY_PETER,RIGHT
                setActscriptWait ALLY_PETER,eas_Jump
                csWait 40
                entityActionsWait ALLY_PETER
                 moveRight 3
                endActions
                setFacing ALLY_PETER,UP
                setFacing ALLY_BOWIE,RIGHT
                setFacing FOLLOWER_B,RIGHT
                customActscriptWait 128
                 ac_setSpeed 24,24      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 128
                 moveUp 1
                endActions
                csWait 8
                setActscriptWait 128,eas_StopMoving
                csWait 50
                customActscriptWait 128
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 128
                 moveDown 1
                endActions
                csWait 4
                setQuake 2
                setActscriptWait 128,eas_StopMoving
                csWait 10
                setQuake 0
                csWait 40
                entityActionsWait ALLY_PETER
                 moveUp 2
                endActions
                nextSingleText $0,128   ; "Do not touch my rock!{W1}"
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                customActscriptWait ALLY_PETER
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait ALLY_PETER
                 moveDown 2
                endActions
                setCamDest 10,6
                customActscriptWait 128
                 ac_setSpeed 24,24      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 128
                 moveUp 1
                endActions
                csWait 8
                setActscriptWait 128,eas_StopMoving
                nextText $0,128         ; "Did you defeat all those{N}devils?{W2}"
                nextSingleText $0,128   ; "I was wondering why it became{N}quiet so suddenly.{W1}"
                entityActions FOLLOWER_B
                 moveRight 3
                 moveUp 1
                endActions
                entityActionsWait ALLY_BOWIE
                 moveRight 4
                endActions
                setFacing FOLLOWER_B,RIGHT
                setFacing ALLY_BOWIE,UP
                nextSingleText $0,FOLLOWER_B ; "Are you a survivor?{N}Are you from Moun?{N}What's your name?{W1}"
                nextSingleText $0,128   ; "I am {NAME;26}.{N}I am not from Moun.{W1}"
                nextSingleText $0,FOLLOWER_B ; "Then, where are you from?{W1}"
                nextSingleText $0,128   ; "The past.{W1}"
                nextSingleText $0,FOLLOWER_B ; "What do you mean?{W1}"
                nextText $0,128         ; "I cannot explain.{W2}"
                nextSingleText $0,128   ; "I am what I am.{N}That is all that I am.{W1}"
                customActscriptWait 128
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 128,eas_JumpRight
                customActscriptWait 128
                 ac_setSpeed 56,56      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 128,eas_DeactivateAutoFacing
                entityActions 128
                 moveDown 1
                endActions
                setPos ALLY_ZYNK,16,8,DOWN
                setActscriptWait ALLY_ZYNK,eas_Init
                csWait 3
                setActscriptWait 128,eas_StopMoving
                setQuake 2
                csWait 20
                setQuake 0
                nextText $0,FOLLOWER_B  ; "I've never seen anyone like{N}you.{W2}"
                nextSingleText $0,FOLLOWER_B ; "Where are the people of{N}Moun?  Were there any{N}survivors?{W1}"
                nextSingleText $C0,ALLY_ZYNK ; "Some.{W1}"
                nextText $0,FOLLOWER_B  ; "That's good news.{W2}"
                nextSingleText $0,FOLLOWER_B ; "And where are they?{W1}"
                nextSingleText $C0,ALLY_ZYNK ; "Down here.  Follow me.{W1}"
                setPos ALLY_ZYNK,63,63,DOWN
                setActscriptWait ALLY_PETER,eas_Jump
                csWait 30
                entityActionsWait ALLY_PETER
                 moveUp 2
                endActions
                setFacing FOLLOWER_B,DOWN
                nextText $0,FOLLOWER_B  ; "{LEADER}, hurry!{N}Follow {NAME;26}!{W2}"
                nextSingleText $0,FOLLOWER_B ; "{NAME;26} knows where{N}they're hiding.{W1}"
                followEntity FOLLOWER_B,ALLY_BOWIE,2
                followEntity ALLY_PETER,FOLLOWER_B,2
                setF 833                ; Set after the scene after you win the battle in Moun plays out
                csc_end
ce_4D322:       mainEntity 11,11,UP
                entity 13,11,UP,ALLY_PETER,eas_Init
                entity 16,8,UP,MAPSPRITE_OBJECT2,eas_Init
                entity 16,8,DOWN,ALLY_ZYNK,eas_Init
                dc.w $FFFF
