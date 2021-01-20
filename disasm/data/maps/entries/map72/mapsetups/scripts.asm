
; ASM FILE data\maps\entries\map72\mapsetups\scripts.asm :
; 0x4FFDA..0x50312 : 
cs_4FFDA:       textCursor 3341
                newEntity ALLY_ROHDE,63,63,UP,ALLY_ROHDE
                newEntity 128,63,63,LEFT,MAPSPRITE_OBJECT4
                newEntity 129,63,63,LEFT,MAPSPRITE_EFFECT3
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait FOLLOWER_A,eas_Init
                stopEntity 128
                stopEntity 129
                setActscriptWait 128,eas_DeactivateAutoFacing
                setActscriptWait 129,eas_DeactivateAutoFacing
                setCamDest 21,33
                setDest 32798,27,39
                setDest 32799,28,37
                setDest 32775,25,37
                setDest ALLY_BOWIE,26,37
                csWait 60
                setPos 128,27,36,LEFT
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                csWait 50
                setFacing FOLLOWER_B,DOWN
                nextSingleText $0,FOLLOWER_B ; "{NAME;11}, {NAME;11}!{W1}"
                nextSingleText $0,ALLY_ROHDE ; "Yes?{W1}"
                setPos ALLY_ROHDE,27,39,RIGHT
                setActscriptWait ALLY_ROHDE,eas_4536C
                csWait 3
                setFacing ALLY_ROHDE,UP
                nextText $0,FOLLOWER_B  ; "You know about devices like{N}this, right?{W2}"
                nextSingleText $0,FOLLOWER_B ; "{LEADER} has a cannon and{N}some dynamite here.  Can you{N}remove those rocks?{W1}"
                nextSingleText $0,ALLY_ROHDE ; "Ah...OK, let me try.{W1}"
                entityActionsWait ALLY_ROHDE
                 moveUp 1
                 moveLeft 2
                endActions
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_PETER,DOWN
                setFacing ALLY_ROHDE,UP
                nod ALLY_BOWIE
                nextSingleText $FF,255  ; "{NAME;11} gets the dynamite{N}from {LEADER}.{W1}"
                entityActionsWait ALLY_ROHDE
                 moveRight 1
                 moveUp 1
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                nextSingleText $0,ALLY_ROHDE ; "Stand back.  Ready?{W1}"
                setCamDest 21,32
                setActscriptWait 128,eas_BumpDown
                setPos 129,27,35,LEFT
                customActscriptWait 129
                 ac_setSpeed 80,80      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveUp 2
                endActions
                setQuake 3
                setSprite 129,MAPSPRITE_FLAME1
                startEntity 129
                setActscript 129,eas_AnimSpeedx2
                playSound SFX_BATTLEFIELD_DEATH
                csWait 40
                setBlocks 0,0,1,2,27,33
                hide 129
                setQuake 0
                csWait 60
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                nextSingleText $0,FOLLOWER_B ; "Perfect!  We can now go to{N}North Parmecia.{W1}"
                csWait 40
                setActscriptWait ALLY_ROHDE,eas_Jump
                nextSingleText $0,ALLY_ROHDE ; "Wow!  This cannon is great!{W1}"
                setFacing ALLY_PETER,RIGHT
                setFacing ALLY_BOWIE,RIGHT
                setFacing FOLLOWER_B,LEFT
                setActscript ALLY_PETER,eas_JumpLeft
                setActscript ALLY_BOWIE,eas_JumpLeft
                setActscriptWait FOLLOWER_B,eas_JumpRight
                setPos ALLY_ROHDE,26,36,RIGHT
                csWait 25
                setPos ALLY_ROHDE,27,37,UP
                csWait 25
                setPos ALLY_ROHDE,28,36,LEFT
                csWait 25
                setPos ALLY_ROHDE,27,37,UP
                csWait 25
                setPos ALLY_ROHDE,26,36,RIGHT
                csWait 25
                setPos ALLY_ROHDE,27,37,UP
                csWait 25
                nextSingleText $0,ALLY_ROHDE ; "I can attend the battles{N}with this weapon.{W1}"
                setFacing ALLY_ROHDE,LEFT
                nextText $0,ALLY_ROHDE  ; "{LEADER}, do you need{N}this any more?{W2}"
                nextText $0,ALLY_ROHDE  ; "May I use it?  Huh?{W2}"
                nextSingleText $0,ALLY_ROHDE ; "Wow, now I can fight along{N}side you!{W1}"
                join ALLY_ROHDE
                nextSingleText $0,ALLY_ROHDE ; "Please call me when you{N}need my help.{W1}"
                setActscriptWait 128,eas_DeactivateAutoFacing
                entityActions 128
                 moveDown 2
                endActions
                entityActionsWait ALLY_ROHDE
                 moveDown 1
                endActions
                entityActions ALLY_ROHDE
                 moveDown 1
                endActions
                csWait 3
                setActscript ALLY_ROHDE,eas_452BA
                csWait 3
                entityActions 128
                 moveDown 1
                endActions
                csWait 3
                setActscript 128,eas_452BA
                csWait 3
                hide ALLY_ROHDE
                hide 128
                entityActionsWait FOLLOWER_B
                 moveDown 1
                 moveLeft 2
                endActions
                nextSingleText $0,FOLLOWER_B ; "{NAME;11} is hooked.{N}Ha, ha!{W1}"
                setFacing FOLLOWER_B,DOWN
                nextSingleText $0,FOLLOWER_B ; "OK, {LEADER}.  Let's go{N}to North Parmecia!{W1}"
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_PETER,DOWN
                setActscript ALLY_BOWIE,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                followEntity FOLLOWER_A,ALLY_BOWIE,2
                followEntity ALLY_PETER,FOLLOWER_A,1
                followEntity FOLLOWER_B,FOLLOWER_A,3
                setStoryFlag 25         ; Battle 25 unlocked - BATTLE_NORTH_CAVE                
                csc_end
cs_5023E:       textCursor 3357
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                setActscriptWait FOLLOWER_A,eas_Init
                setCamDest 21,33
                setDest 32798,27,39
                setDest 32799,28,37
                setDest 32775,25,37
                setDest ALLY_BOWIE,26,37
                waitIdle FOLLOWER_A
                waitIdle FOLLOWER_B
                waitIdle ALLY_PETER
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                csWait 50
                setFacing ALLY_BOWIE,RIGHT
                csWait 30
                setFacing FOLLOWER_B,LEFT
                nod ALLY_BOWIE
                shiver FOLLOWER_B
                setFacing ALLY_PETER,RIGHT
                csWait 20
                nextSingleText $0,FOLLOWER_B ; "What?!  You forgot to bring{N}the {ITEM} with you?{N}{LEADER}, are you serious?{W2}"
                stopEntity ALLY_BOWIE
                setSize ALLY_BOWIE,22
                csWait 10
                setSize ALLY_BOWIE,20
                csWait 10
                setSize ALLY_BOWIE,18
                entityActionsWait FOLLOWER_B
                 moveLeft 1
                endActions
                setActscriptWait FOLLOWER_B,eas_Jump
                setActscriptWait FOLLOWER_B,eas_Jump
                nextSingleText $0,FOLLOWER_B ; "You fool!  Go back and{N}bring it here!{W1}"
                setActscriptWait ALLY_BOWIE,eas_Init
                startEntity ALLY_BOWIE
                followEntity FOLLOWER_A,ALLY_BOWIE,2
                followEntity ALLY_PETER,FOLLOWER_A,1
                followEntity FOLLOWER_B,FOLLOWER_A,3
                csc_end
