
; ASM FILE data\maps\entries\map19\mapsetups\s6_initfunction_543.asm :
; 0x62C9E..0x631EA : 

; =============== S U B R O U T I N E =======================================


ms_map19_flag543_InitFunction:
                
                 
                chkFlg  25              ; Shiela joined
                bne.s   byte_62CAE      
                move.w  #$19,d0
                jsr     MoveEntityOutOfMap
byte_62CAE:
                
                chkFlg  8               ; May joined
                bne.s   byte_62CBE      
                move.w  #8,d0
                jsr     MoveEntityOutOfMap
byte_62CBE:
                
                chkFlg  27              ; Chaz joined
                bne.s   byte_62CCE
                move.w  #$1B,d0
                jsr     MoveEntityOutOfMap
byte_62CCE:
                
                script  cs_62D06
                chkFlg  981
                beq.s   byte_62CFC
                chkFlg  982
                bne.s   byte_62CF2
                script  cs_62D0E
                setFlg  982
                move.b  #$FF,((FOLLOWERS_LIST-$1000000)).w
                bra.s   loc_62CFA
byte_62CF2:
                
                sndCom  MUSIC_TOWN
                jsr     (FadeInFromBlack).w
loc_62CFA:
                
                bra.s   return_62D04
byte_62CFC:
                
                sndCom  MUSIC_TOWN
                jsr     (FadeInFromBlack).w
return_62D04:
                
                rts

    ; End of function ms_map19_flag543_InitFunction

cs_62D06:       setSprite ALLY_ROHDE,MAPSPRITE_NPC_ROHDE
                csc_end
cs_62D0E:       textCursor 3967
                setCameraEntity 129
                setPos 129,26,29,UP
                setPos ALLY_KAZIN,26,30,UP
                setPos ALLY_SARAH,26,30,UP
                setPos ALLY_JAHA,26,30,UP
                setPos ALLY_CHESTER,26,30,UP
                followEntity ALLY_BOWIE,129,2
                followEntity ALLY_KAZIN,129,5
                followEntity ALLY_SARAH,129,6
                followEntity ALLY_JAHA,ALLY_KAZIN,2
                followEntity ALLY_CHESTER,ALLY_SARAH,2
                csWait 10
                fadeInB
                entityActionsWait 129
                 moveUp 4
                 moveRight 3
                 moveUp 2
                endActions
                roofEvent 29,23
                entityActionsWait 129
                 moveUp 14
                endActions
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_SARAH,eas_Init
                setActscriptWait ALLY_JAHA,eas_Init
                setActscriptWait ALLY_CHESTER,eas_Init
                setActscriptWait ALLY_KAZIN,eas_Init
                setCamDest 24,5
                csWait 40
                customActscriptWait 129
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveUp 1
                endActions
                csWait 30
                nextSingleText $0,129   ; "King Granseal, {LEADER}{N}is here!{W1}"
                nod 128
                nextSingleText $80,128  ; "Please explain what is{N}happening.{W1}"
                csWait 10
                nod 129
                nextSingleText $0,129   ; "Yes, sir.{W1}"
                entityActionsWait 129
                 moveRight 1
                 faceDown 1
                endActions
                csWait 30
                nod 129
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_SARAH,UP
                setFacing ALLY_JAHA,UP
                setFacing ALLY_CHESTER,UP
                setFacing ALLY_KAZIN,UP
                setFacing ALLY_SLADE,UP
                setFacing ALLY_PETER,UP
                setFacing ALLY_LUKE,UP
                setFacing ALLY_SHEELA,UP
                setFacing ALLY_MAY,UP
                setFacing ALLY_HIGINS,UP
                setFacing ALLY_ROHDE,UP
                setFacing ALLY_ZYNK,UP
                setFacing ALLY_CHAZ,UP
                csWait 10
                nextText $0,129         ; "Listen up!{W2}"
                nextText $0,129         ; "It took two years, but the{N}Princess finally recovered{N}from the poison.{W2}"
                nextSingleText $0,129   ; "But she's still sleeping.{N}We've decided to take{N}Mitula's advice.{W1}"
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                nextSingleText $80,ALLY_PETER ; "Mitula...you mean, somebody{N}gets to kiss her?{W1}"
                csWait 10
                shiver ALLY_SARAH
                csWait 10
                setFacing 129,UP
                csWait 40
                nod 128
                csWait 30
                nextSingleText $0,128   ; "Yes.{N}We feel this is the right{N}time.{W1}"
                csWait 30
                setFacing 129,DOWN
                nextSingleText $0,129   ; "And we need to decide which{N}one of you will kiss{N}Elis.{W1}"
                setFacing ALLY_PETER,LEFT
                nextSingleText $80,ALLY_PETER ; "We don't have to decide.{N}It's {LEADER}.{N}{NAME;10}, don't you agree?{W1}"
                setFacing ALLY_PETER,DOWN
                csWait 20
                shiver ALLY_LUKE
                csWait 20
                nextText $80,ALLY_LUKE  ; "Ha, ha!  Yes, {NAME;7}!{W2}"
                csWait 10
                setFacing ALLY_LUKE,LEFT
                nextSingleText $80,ALLY_LUKE ; "I always thought {LEADER}{N}was the best choice!{W1}"
                entityActionsWait 129
                 moveRight 2
                 faceDown 1
                endActions
                setFacing ALLY_PETER,UP
                setFacing ALLY_LUKE,UP
                nextSingleText $0,129   ; "Are you sure?{N}Anybody disagree?{W1}"
                setFacing ALLY_PETER,DOWN
                csWait 60
                entityActionsWait 129
                 moveLeft 2
                 faceDown 1
                endActions
                setFacing ALLY_PETER,UP
                nextSingleText $0,129   ; "Nobody?{W1}"
                csWait 30
                entityActionsWait 129
                 moveLeft 2
                 faceDown 1
                endActions
                setFacing ALLY_PETER,DOWN
                setFacing ALLY_KAZIN,RIGHT
                setFacing ALLY_LUKE,UP
                setFacing ALLY_SHEELA,DOWN
                setFacing ALLY_MAY,DOWN
                setFacing ALLY_HIGINS,DOWN
                setFacing ALLY_ROHDE,UP
                setFacing ALLY_BOWIE,DOWN
                csWait 40
                setCamDest 24,7
                csWait 5
                setActscript ALLY_JAHA,eas_2xRightLeft
                csWait 100
                entityActionsWait ALLY_JAHA
                 moveDown 1
                endActions
                setFacing ALLY_JAHA,RIGHT
                shiver ALLY_JAHA
                setFacing ALLY_SARAH,DOWN
                setFacing ALLY_CHESTER,DOWN
                setFacing ALLY_KAZIN,DOWN
                setFacing ALLY_SLADE,RIGHT
                setFacing ALLY_LUKE,LEFT
                setFacing ALLY_SHEELA,RIGHT
                setFacing ALLY_MAY,RIGHT
                setFacing ALLY_HIGINS,LEFT
                setFacing ALLY_ROHDE,RIGHT
                setFacing ALLY_ZYNK,RIGHT
                setFacing ALLY_CHAZ,LEFT
                setFacing ALLY_BOWIE,DOWN
                nextText $0,ALLY_JAHA   ; "I understand what my friends{N}are saying, but...I love{N}her.{W2}"
                nextSingleText $0,ALLY_JAHA ; "May I kiss her?{N}Somebody, say yes!{W1}"
                csWait 5
                setActscript ALLY_JAHA,eas_2xRightLeft
                shiver ALLY_SARAH
                csWait 20
                setFacing ALLY_PETER,DOWN
                setFacing ALLY_LUKE,UP
                csWait 20
                headshake ALLY_LUKE
                csWait 20
                entityActionsWait ALLY_PETER
                 moveLeft 1
                 moveDown 2
                 faceLeft 1
                endActions
                setFacing ALLY_LUKE,LEFT
                setFacing ALLY_JAHA,RIGHT
                nextSingleText $80,ALLY_PETER ; "Sorry, but...I don't think{N}{NAME;3} is the right{N}choice.{W1}"
                shiver ALLY_JAHA
                entityActionsWait ALLY_SLADE
                 moveRight 1
                 moveDown 1
                 faceRight 1
                endActions
                setFacing ALLY_JAHA,LEFT
                nextText $0,ALLY_SLADE  ; "I understand {NAME;3}, but{N}she is a human.{W2}"
                nextSingleText $0,ALLY_SLADE ; "A human is the best choice.{W1}"
                shiver ALLY_JAHA
                jumpIfFlagClear 8,cs_62FB0 ; May joined
                entityActionsWait ALLY_MAY
                 moveDown 1
                 faceRight 1
                endActions
                nextSingleText $0,ALLY_MAY ; "{LEADER} is a human!{N}They will make a cute couple!{W1}"
                shiver ALLY_JAHA
cs_62FB0:       textCursor 3987
                entityActionsWait ALLY_PETER
                 moveUp 1
                 faceDown 1
                endActions
                entityActionsWait ALLY_HIGINS
                 moveLeft 1
                endActions
                setFacing ALLY_JAHA,RIGHT
                nextText $80,ALLY_HIGINS ; "{LEADER} is a good lad{N}with the manner of a{N}knight!{W2}"
                nextSingleText $80,ALLY_HIGINS ; "I think he's the best{N}choice.{W1}"
                shiver ALLY_JAHA
                csWait 30
                entityActionsWait 129
                 moveRight 2
                 moveDown 1
                endActions
                nextSingleText $0,129   ; "{NAME;1}, what do you{N}think?{W1}"
                shiver ALLY_SARAH
                setFacing ALLY_SARAH,UP
                setFacing ALLY_JAHA,UP
                setFacing ALLY_CHESTER,UP
                setFacing ALLY_KAZIN,UP
                setFacing ALLY_PETER,UP
                setFacing ALLY_HIGINS,UP
                setFacing ALLY_BOWIE,UP
                nextText $80,ALLY_SARAH ; "M...me?  Well...{W2}"
                shiver ALLY_SARAH
                nextText $80,ALLY_SARAH ; "I'm worried about her...{N}but...I...{W2}"
                setFacing ALLY_SARAH,LEFT
                csWait 30
                setFacing ALLY_SARAH,UP
                csWait 10
                nextSingleText $80,ALLY_SARAH ; "Yes, a good choice....{N}{LEADER} will make her...{N}...happy....{W1}"
                customActscriptWait ALLY_SARAH
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_CHESTER
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_SARAH
                 moveDown 1
                endActions
                entityActionsWait ALLY_CHESTER
                 moveLeft 1
                endActions
                setActscript ALLY_CHESTER,eas_RotateRight
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_KAZIN,DOWN
                setFacing ALLY_JAHA,DOWN
                setFacing ALLY_PETER,DOWN
                setFacing ALLY_HIGINS,DOWN
                entityActionsWait ALLY_SARAH
                 moveDown 8
                endActions
                hide ALLY_SARAH
                setActscriptWait ALLY_CHESTER,eas_Init
                startEntity ALLY_CHESTER
                setFacing ALLY_CHESTER,DOWN
                headshake ALLY_CHESTER
                csWait 30
                setCamDest 24,9
                entityActionsWait ALLY_CHESTER
                 moveDown 2
                endActions
                csWait 50
                nextSingleText $0,ALLY_CHESTER ; "Does she love {LEADER}?{N}I didn't know that.{W1}"
                setActscriptWait ALLY_KAZIN,eas_Jump
                setActscriptWait ALLY_KAZIN,eas_Jump
                entityActionsWait ALLY_KAZIN
                 moveDown 1
                 moveRight 2
                 moveDown 2
                 faceLeft 1
                endActions
                setFacing ALLY_CHESTER,RIGHT
                nextSingleText $80,ALLY_KAZIN ; "Stop!{N}I will go and comfort her.{W1}"
                setFacing ALLY_CHESTER,DOWN
                entityActions ALLY_KAZIN
                 moveDown 2
                endActions
                csWait 8
                setActscriptWait ALLY_CHESTER,eas_Jump
                setActscriptWait ALLY_CHESTER,eas_Jump
                nextSingleText $0,ALLY_CHESTER ; "{NAME;4}!{N}I'll go with you!{W1}"
                setFacing ALLY_KAZIN,UP
                nextSingleText $80,ALLY_KAZIN ; "Oh, c'mon.{N}She needs someone like me.{W1}"
                entityActionsWait ALLY_KAZIN
                 moveDown 5
                endActions
                hide ALLY_KAZIN
                csWait 30
                nextSingleText $0,ALLY_CHESTER ; "What does he mean?{N}I don't understand!{W1}"
                entityActionsWait ALLY_ROHDE
                 moveRight 2
                 moveDown 1
                 moveRight 2
                 faceDown 1
                endActions
                nextSingleText $80,ALLY_ROHDE ; "They remind me of when I{N}was young.{W1}"
                entityActionsWait ALLY_ZYNK
                 moveRight 3
                 moveDown 1
                 faceRight 1
                endActions
                nextSingleText $0,ALLY_ZYNK ; "{NAME;11}, you were young{N}once?{W1}"
                shiver ALLY_ZYNK
                setFacing ALLY_ROHDE,LEFT
                setActscriptWait ALLY_ROHDE,eas_Jump
                setActscriptWait ALLY_ROHDE,eas_Jump
                nextSingleText $80,ALLY_ROHDE ; "Be quiet, you bucket of bolts!{W1}"
                setCamDest 24,5
                entityActionsWait ALLY_LUKE
                 moveUp 1
                 moveLeft 2
                 faceUp 1
                endActions
                setFacing ALLY_JAHA,UP
                setFacing ALLY_PETER,UP
                setFacing ALLY_CHESTER,UP
                setFacing ALLY_LUKE,UP
                setFacing ALLY_ROHDE,UP
                setFacing ALLY_ZYNK,UP
                setFacing ALLY_HIGINS,UP
                setFacing ALLY_BOWIE,UP
                nextText $80,ALLY_LUKE  ; "You heard everyone.{N}We think {LEADER} is the{N}right choice.{W2}"
                setFacing ALLY_LUKE,DOWN
                nextText $80,ALLY_LUKE  ; "{NAME;4} will take care{N}of {NAME;1}.{W2}"
                nod 129
                setFacing ALLY_LUKE,UP
                nextSingleText $80,ALLY_LUKE ; "Everything went as you{N}expected, huh?{W1}"
                shiver 129
                nextText $0,129         ; "You knew that?{N}{NAME;10}, you're smart.{W2}"
                nextText $0,129         ; "But I didn't know what{N}{NAME;1} or {NAME;3} would do.{W2}I didn't want to hurt their{N}feelings.{W1}"
                nextSingleText $0,129   ; "{LEADER}, I choose you.{W1}"
                customActscriptWait 128
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveDown 1
                 moveRight 1
                 faceDown 1
                endActions
                setFacing 129,UP
                nextSingleText $80,128  ; "Now, {LEADER}.{N}Please go awaken her.{W1}"
                entityActionsWait 128
                 moveLeft 1
                 moveDown 1
                endActions
                nextSingleText $80,128  ; "The Minister is waiting{N}for you.{W1}"
                entityActionsWait 128
                 moveUp 2
                 faceDown 1
                endActions
                entityActionsWait 129
                 moveLeft 1
                 faceDown 1
                endActions
                nextSingleText $0,129   ; "Oh, {LEADER}!{N}I really respect you.{W2}"
                csc_end
