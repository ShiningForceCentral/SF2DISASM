
; ASM FILE data\battles\entries\battle32\cs_afterbattle.asm :
; 0x4CDB4..0x4CF0C : Cutscene after battle 32
abcs_battle32:  textCursor 2853
                loadMapFadeIn MAP_OVERWORLD_MOUN_AND_MITULA,5,20
                loadMapEntities ce_4CEEC
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,11,25,UP
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,9,25,UP
                setActscriptWait ALLY_FRAYJA,eas_Init
                setPos ALLY_FRAYJA,11,26,UP
                setActscriptWait FOLLOWER_A,eas_Init
                setPos FOLLOWER_A,10,26,UP
                setActscriptWait ALLY_JARO,eas_Init
                setPos ALLY_JARO,10,22,DOWN
                fadeInB
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                nextSingleText $0,ALLY_PETER ; "I can't believe it!{N}You might have been killed{N}by the devils.{W1}"
                nextSingleText $0,FOLLOWER_B ; "Indeed!  Why did you{N}change your mind?{W1}"
                entityActionsWait ALLY_JARO
                 moveDown 1
                endActions
                nextText $C0,ALLY_JARO  ; "I'm {NAME;23}, from Galam.{N}I was waiting for the chance{N}to escape from them.{W2}"
                nextSingleText $C0,ALLY_JARO ; "I can't stand their wicked{N}ways!{W1}"
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                setFacing ALLY_PETER,LEFT
                setFacing ALLY_JARO,RIGHT
                nextSingleText $0,ALLY_PETER ; "You have the same opinion{N}of them as we do.{W1}"
                nextSingleText $C0,ALLY_JARO ; "Please let me join you!{N}I could be a great help to{N}you.{W2}"
                setFacing ALLY_JARO,DOWN
                nextSingleText $C0,ALLY_JARO ; "You need a professional{N}soldier like me.{W1}"
                nextSingleText $0,FOLLOWER_B ; "Oh, we welcome you.{W1}"
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                entityActionsWait ALLY_PETER
                 moveRight 1
                endActions
                nextSingleText $0,ALLY_PETER ; "But, he was on the other{N}side just an minute ago.{W1}"
                entityActionsWait FOLLOWER_B
                 moveUp 1
                endActions
                setFacing FOLLOWER_B,RIGHT
                nextSingleText $0,FOLLOWER_B ; "I don't care, {NAME;7}.{N}He has seen the error of his{N}ways.{W1}"
                setFacing FOLLOWER_B,DOWN
                nextSingleText $0,FOLLOWER_B ; "{LEADER}, don't you want{N}{NAME;23} to join our{N}force?{W1}"
                nod ALLY_BOWIE
                join ALLY_JARO
                joinForceAI ALLY_JARO,$0 ; 0054 JOIN FORCE WITH AI
                entityActionsWait ALLY_JARO
                 moveDown 1
                endActions
                nextSingleText $C0,ALLY_JARO ; "Oh, thank you!{W2}"
                setActscriptWait ALLY_JARO,eas_Jump
                setActscriptWait ALLY_JARO,eas_Jump
                nextSingleText $C0,ALLY_JARO ; "I'll try to do my best!{W1}"
                executeSubroutine csub_4CEE4
                followEntity FOLLOWER_A,ALLY_BOWIE,2
                followEntity ALLY_PETER,FOLLOWER_A,1
                followEntity FOLLOWER_B,FOLLOWER_A,3
                followEntity ALLY_FRAYJA,FOLLOWER_A,2
                followEntity ALLY_JARO,ALLY_FRAYJA,2
                csc_end

; =============== S U B R O U T I N E =======================================


csub_4CEE4:
                
                moveq   #$17,d0
                jmp     j_LeaveBattleParty

    ; End of function csub_4CEE4

ce_4CEEC:       mainEntity 10,25,UP
                entity 11,25,UP,ALLY_PETER,eas_Init
                entity 11,26,UP,ALLY_FRAYJA,eas_Init
                entity 10,22,DOWN,ALLY_JARO,eas_Init
                dc.w $FFFF
