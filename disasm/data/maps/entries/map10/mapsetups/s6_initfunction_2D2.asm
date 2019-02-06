
; ASM FILE data\maps\entries\map10\mapsetups\s6_initfunction_2D2.asm :
; 0x5708E..0x579CA : 

; =============== S U B R O U T I N E =======================================

ms_map10_flag2D2_InitFunction:
                
                 
                chkFlg  $31F            ; Set after you agree to kill Zeon in Bedoe (King's yes/no dialog)
                beq.s   byte_5709E      
                move.w  #$A,d0
                jsr     MoveEntityOutOfMap
byte_5709E:
                
                chkFlg  $2D4            ; Set after the scene where Skreech falls in Bedoe
                beq.s   return_570AE
                move.w  #$98,d0 
                jsr     MoveEntityOutOfMap
return_570AE:
                
                rts

	; End of function ms_map10_flag2D2_InitFunction

cs_570B0:       textCursor $650
                reloadMap 6,19
                setPos $0,11,25,UP
                setPos $7,11,26,UP
                setPos $96,10,21,RIGHT
                setPos $97,13,21,LEFT
                setActscriptWait $7,eas_Init
                setActscriptWait $0,eas_Init
                customActscriptWait $96
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $97
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                fadeInB
                csWait 30
                entityActionsWait $96
                 moveRight 1
                 faceDown 1
                endActions
                nextSingleText $0,$96   ; "Who are you?{W1}"
                entityActionsWait $97
                 moveLeft 1
                 faceDown 1
                endActions
                nextSingleText $0,$97   ; "Bedoe is only for birdmen!{W1}"
                entityActionsWait $7
                 moveRight 1
                 moveUp 1
                endActions
                nextSingleText $0,$7    ; "Don't be so uppity!{W1}"
                setActscript $96,eas_Jump
                setActscriptWait $97,eas_Jump
                setActscript $96,eas_Jump
                setActscriptWait $97,eas_Jump
                csWait 30
                entityActionsWait $96
                 moveDown 1
                endActions
                nextSingleText $0,$96   ; "Oh, you're...{W1}"
                entityActionsWait $97
                 moveDown 1
                endActions
                nextText $0,$97         ; "Sir {NAME;7}!{N}Sorry, Sir {NAME;7}!{W2}"
                nextSingleText $0,$97   ; "Welcome back!{N}Volcanon is waiting!{W1}"
                entityActionsWait $7
                 moveUp 1
                endActions
                csWait 30
                csWait 5
                setActscript $7,eas_461B6
                csWait 120
                entityActionsWait $7
                 moveRight 2
                endActions
                nextSingleText $0,$7    ; "That's strange...{W2}"
                entityActionsWait $7
                 moveLeft 4
                endActions
                nextSingleText $0,$7    ; "I just realized...{N}Why are you flying guard?{W2}"
                entityActionsWait $7
                 moveRight 2
                 faceUp 10
                endActions
                nextSingleText $0,$7    ; "Did something happen?{W1}"
                nextSingleText $0,$97   ; "Well, the devils invaded{N}recently.{W1}"
                customActscriptWait $7
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $7
                 moveUp 1
                endActions
                nextSingleText $0,$7    ; "Devils?{W1}"
                entityActionsWait $96
                 moveDown 1
                 faceRight 1
                endActions
                setFacing $7,LEFT
                nextText $0,$96         ; "Yes, the Devil Army.{W2}"
                nextText $0,$96         ; "Strong greater devils broke{N}Volcanon's sacred barrier.{W2}"
                nextSingleText $0,$96   ; "But don't worry, Volcanon{N}defeated all the devils.{W1}"
                setActscriptWait $7,eas_Init
                entityActionsWait $7
                 moveDown 2
                 faceLeft 1
                endActions
                setFacing $0,RIGHT
                nextSingleText $0,$7    ; "The devils we fought must{N}have been part of that army!{W1}"
                setFacing $96,DOWN
                entityActionsWait $97
                 moveDown 1
                endActions
                nextSingleText $0,$96   ; "You met some other devils?{W1}"
                setFacing $96,RIGHT
                setFacing $97,LEFT
                nod $96
                nod $97
                setFacing $96,DOWN
                setFacing $97,DOWN
                customActscriptWait $96
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $97
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $96,eas_46172
                setActscriptWait $97,eas_46172
                entityActions $96
                 moveUp 1
                endActions
                entityActionsWait $97
                 moveUp 1
                endActions
                customActscriptWait $96
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $97
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $96
                 moveLeft 1
                 moveDown 5
                endActions
                entityActions $97
                 moveRight 1
                 moveDown 5
                endActions
                csWait 30
                setFacing $0,DOWN
                setFacing $7,DOWN
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_Jump
                nextText $0,$7          ; "Stop, stop!{W2}"
                setFacing $96,RIGHT
                setFacing $97,LEFT
                nextSingleText $0,$7    ; "We already defeated them.{W1}"
                nod $0
                setCamDest 6,22
                customActscriptWait $96
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $97
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $96
                 moveDown 1
                endActions
                entityActionsWait $97
                 moveDown 1
                endActions
                setActscriptWait $96,eas_Init
                setActscriptWait $97,eas_Init
                entityActionsWait $96
                 moveRight 1
                 faceUp 1
                endActions
                nextSingleText $0,$96   ; "That's great!  But...{W2}"
                entityActionsWait $97
                 moveLeft 1
                 faceUp 1
                endActions
                nextSingleText $0,$97   ; "We'll go and make sure...{W1}"
                setFacing $96,RIGHT
                setFacing $97,LEFT
                nextSingleText $0,$96   ; "Just in case.{W1}"
                nod $97
                setFacing $96,UP
                setFacing $97,UP
                nextText $0,$97         ; "We're going to Polca Village{N}to patrol.{W2}"
                nextSingleText $0,$97   ; "{NAME;7}, please see{N}King Bedoe.{W1}"
                setFacing $96,DOWN
                setFacing $97,DOWN
                customActscriptWait $96
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $97
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $96,eas_46172
                setActscriptWait $97,eas_46172
                entityActions $96
                 moveUp 1
                endActions
                entityActionsWait $97
                 moveUp 1
                endActions
                csWait 50
                customActscriptWait $96
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $97
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $96
                 moveDown 5
                endActions
                entityActionsWait $97
                 moveDown 5
                endActions
                csWait 40
                setFacing $7,LEFT
                setFacing $0,RIGHT
                nextText $0,$7          ; "{LEADER}, let's go.{W2}"
                nextSingleText $0,$7    ; "I'll introduce you to{N}King Bedoe.{W1}"
                followEntity $7,$0,$2
                setPos $96,34,51,UP
                setPos $97,35,51,UP
                csc_end
cs_573EC:       textCursor $669
                setCamDest 31,47
                nextText $0,$94         ; "Yes, the greater devil was{N}very strong.{W1}"
                nextSingleText $0,$94   ; "But, God Volcanon swept{N}away all the devils.{W1}"
                nextSingleText $0,$93   ; "What about the greater{N}devil?{W1}"
                entityActionsWait $94
                 moveLeft 1
                 faceUp 1
                endActions
                nextSingleText $0,$94   ; "He fled.{W1}"
                nextText $0,$93         ; "Can't you track him?{W2}"
                nextSingleText $0,$93   ; "We must capture him before{N}he regains his strength.{W1}"
                nextSingleText $0,$94   ; "Did they come from Grans{N}Island?{W1}"
                nod $93
                nextText $0,$93         ; "I think so.{W2}"
                nextText $0,$93         ; "Maybe he died.{N}But beware of another attack.{W2}"
                csWait 10
                setFacing $94,DOWN
                nextSingleText $0,$93   ; "Watch carefully!{W1}"
                csWait 40
                entityActions $96
                 moveDown 1
                 moveLeft 3
                 moveDown 3
                endActions
                entityActions $98
                 moveDown 1
                 moveRight 5
                endActions
                entityActions $99
                 moveRight 2
                 moveDown 3
                endActions
                entityActions $9A
                 moveRight 1
                 moveDown 3
                endActions
                entityActions $9B
                 moveRight 2
                 moveDown 3
                endActions
                entityActions $9C
                 moveRight 2
                 moveDown 3
                endActions
                entityActionsWait $97
                 moveDown 1
                 moveLeft 4
                 moveDown 3
                endActions
                hide $96
                hide $97
                hide $98
                hide $99
                hide $9A
                hide $9B
                hide $9C
                entityActionsWait $94
                 moveRight 1
                 faceDown 1
                endActions
                csc_end
cs_574A6:       textCursor $673
                setCamDest 34,47
                entityActionsWait $A
                 moveDown 1
                 faceLeft 1
                endActions
                setActscriptWait $A,eas_Jump
                setActscriptWait $A,eas_Jump
                nextSingleText $80,$A   ; "{NAME;7}, {NAME;7}!{W1}"
                setPos $7,33,52,RIGHT
                setPos $0,33,53,RIGHT
                setCamDest 31,47
                entityActionsWait $7
                 moveRight 3
                endActions
                nextText $0,$7          ; "{NAME;10}, how have you been?{W2}"
                setFacing $7,UP
                nextSingleText $0,$7    ; "King Bedoe, you look well.{W1}"
                customActscriptWait $93
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $93
                 moveDown 1
                endActions
                nextSingleText $80,$93  ; "{NAME;7}, my friend, how{N}was your journey?{W1}"
                entityActionsWait $7
                 moveUp 1
                endActions
                csWait 30
                nod $7
                csWait 20
                setFacing $7,LEFT
                csWait 30
                setFacing $7,UP
                nextSingleText $0,$7    ; "Let me introduce my friend.{W1}"
                entityActionsWait $7
                 moveDown 2
                 moveLeft 2
                endActions
                csWait 40
                nod $0
                entityActions $7
                 moveRight 3
                 faceUp 1
                endActions
                entityActionsWait $0
                 moveRight 3
                 faceUp 1
                endActions
                nod $0
                nextSingleText $0,$7    ; "This is {LEADER}.{N}He's from Grans and...{W1}"
                entityActionsWait $A
                 moveDown 1
                 faceLeft 1
                endActions
                setFacing $7,RIGHT
                setFacing $0,RIGHT
                nextSingleText $80,$A   ; "I know.  He is a pupil of{N}Astral of Granseal.{W1}"
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_Jump
                nextSingleText $0,$7    ; "How do you know that?{W1}"
                nextSingleText $80,$A   ; "Sir Astral told me.{W1}"
                nextSingleText $0,$7    ; "What?!  Did you go to{N}Granseal?{W1}"
                nod $A
                nextSingleText $80,$A   ; "As Volcanon's messenger.{W1}"
                entityActionsWait $93
                 moveDown 1
                endActions
                setFacing $A,UP
                setFacing $7,UP
                setFacing $0,UP
                nextText $80,$93        ; "And I heard that somebody{N}unsealed Zeon.{W2}"
                nextText $80,$93        ; "Grans people caused a big,{N}big problem.{W2}"
                customActscriptWait $93
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $93
                 moveUp 2
                 faceDown 1
                endActions
                nextSingleText $80,$93  ; "Zeon might destroy the{N}world...{W1}"
                entityActionsWait $7
                 moveUp 1
                 moveLeft 1
                 faceUp 1
                endActions
                nextSingleText $0,$7    ; "Sorry to interrupt, but is{N}he that strong?{W1}"
                nextSingleText $80,$93  ; "Zeon is King of the Devils.{W1}"
                entityActionsWait $94
                 moveDown 1
                endActions
                nextText $0,$94         ; "{NAME;7}, you had better{N}go see Volcanon.{W2}"
                nextSingleText $0,$94   ; "It may calm him down to see{N}{NAME;7}.{W1}"
                nextSingleText $0,$7    ; "Oh, is he angry?{N}Maybe later...{W1}"
                entityActionsWait $A
                 moveUp 1
                 moveLeft 1
                endActions
                setFacing $7,RIGHT
                nextSingleText $80,$A   ; "Never mind later.{N}He has been waiting for you.{W1}"
                nextText $0,$7          ; "Oh, yeah?  OK, I'm going.{W2}"
                setFacing $7,DOWN
                nextSingleText $0,$7    ; "{LEADER}, follow me.{W1}"
                setActscriptWait $93,eas_Init
                entityActionsWait $93
                 moveDown 1
                endActions
                nextSingleText $80,$93  ; "{NAME;7}, are you taking{N}{LEADER} with you?{W1}"
                setFacing $7,UP
                setFacing $A,UP
                nextSingleText $0,$7    ; "Of course.  Why not?{W1}"
                nextSingleText $80,$93  ; "He thinks the people of{N}Granseal are...{W1}"
                entityActionsWait $94
                 moveLeft 1
                 faceUp 1
                endActions
                nextText $0,$94         ; "King Bedoe, I think{N}{LEADER} has to see{N}Volcanon.{W2}"
                nextSingleText $0,$94   ; "He should talk to him.{W1}"
                nod $93
                nextSingleText $80,$93  ; "Hmmm...you're right.{N}{NAME;7}, go ahead.{W1}"
                setFacing $94,DOWN
                setFacing $A,DOWN
                setFacing $7,DOWN
                nextSingleText $0,$7    ; "OK.{N}Anyway, let's go.{W1}"
                followEntity $7,$0,$2
                csc_end
cs_5766C:       textCursor $690
                setCameraEntity $99
                nextText $0,$99         ; "I had a dream last night.{N}I flew!{W2}"
                nextSingleText $0,$99   ; "Watch!  I can fly!{W1}"
                setFacing $99,RIGHT
                csWait 40
                nod $99
                entityActionsWait $99
                 jumpRight 1
                endActions
                setSprite $99,$B6
                setActscriptWait $99,eas_46172
                customActscriptWait $99
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $99
                 moveUp 1
                endActions
                customActscriptWait $99
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound SFX_FALLING
                entityActionsWait $99
                 moveDown 6
                endActions
                setSprite $99,$E6
                nextSingleText $0,$99   ; "Hmmm...strange...{W1}"
                setActscriptWait $99,eas_Init
                entityActionsWait $99
                 moveLeft 2
                 faceUp 1
                endActions
                setFacing $0,DOWN
                setFacing $7,DOWN
                nextText $0,$99         ; "That didn't work.  Hee, hee.{W2}"
                nextSingleText $0,$99   ; "Stay there.{N}I know I can fly!{W1}"
                setFacing $99,RIGHT
                csWait 40
                nod $99
                cameraSpeed $40
                entityActionsWait $99
                 moveRight 1
                 jumpRight 1
                endActions
                setSprite $99,$B6
                setActscriptWait $99,eas_46172
                entityActionsWait $99
                 moveDown 1
                endActions
                customActscriptWait $99
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $99
                 moveUp 1
                endActions
                customActscriptWait $99
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound SFX_FALLING
                entityActionsWait $99
                 moveDown 8
                endActions
                setActscript $99,eas_464E2
                startEntity $99
                csWait 12
                cameraSpeed $20
                setActscriptWait $99,eas_Init2
                entityActionsWait $99
                 moveUp 2
                 moveRight 1
                 moveUp 11
                endActions
                setFacing $99,LEFT
                setSprite $99,$E6
                setFacing $0,RIGHT
                setFacing $7,RIGHT
                nextSingleText $0,$99   ; "See.  I told you!{N}I can fly...sort of.{W1}"
                csc_end
cs_5779C:       textCursor $696
                setPos $99,6,10,DOWN
                setFacing $98,UP
                setCamDest 1,5
                setActscriptWait $7,eas_Init
                setPos $0,5,22,DOWN
                setPos $7,11,22,UP
                entityActions $7
                 eaWait 60
                 moveLeft 4
                endActions
                setFacing $0,UP
                setActscriptWait $99,eas_46198
                setActscriptWait $99,eas_46172
                playSound SFX_JUMP
                entityActionsWait $99
                 moveUp 2
                 faceUp 5
                 moveDown 2
                endActions
                nextSingleText $0,$99   ; "Ha, ha, ha!{W1}"
                csWait 40
                playSound SFX_JUMP
                entityActionsWait $99
                 moveUp 2
                 faceUp 5
                 moveDown 2
                endActions
                nextSingleText $0,$99   ; "Ha, ha, ha!{W1}"
                csWait 40
                playSound SFX_JUMP
                entityActionsWait $99
                 moveUp 2
                 faceUp 5
                 moveDown 1
                endActions
                setActscriptWait $99,eas_Init
                entityActionsWait $99
                 jumpLeft 1
                endActions
                setFacing $99,UP
                setFacing $98,LEFT
                setCameraEntity $99
                cameraSpeed $30
                nextSingleText $0,$98   ; "Oh my, {NAME;20}!{W1}"
                setPriority $0,$0
                setPriority $99,$FFFF
                setActscriptWait $99,eas_46172
                customActscriptWait $99
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound SFX_FALLING
                entityActions $99
                 moveDown 13
                endActions
                setFacing $7,LEFT
                setPriority $0,$0
                setPriority $99,$FFFF
                csWait 35
                customActscriptWait $98
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $98
                 moveLeft 1
                 moveDown 11
                endActions
                waitIdle $99
                setQuake 3
                setFacing $0,UP
                customActscriptWait $0
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $2          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 40
                setQuake 0
                setActscriptWait $99,eas_Init
                setFacing $99,DOWN
                setActscriptWait $99,eas_Jump
                csWait 20
                setActscriptWait $99,eas_Jump
                csWait 20
                setActscriptWait $99,eas_Jump
                csWait 20
                setActscriptWait $99,eas_Jump
                csWait 20
                setFacing $99,UP
                setCameraEntity $FFFF
                setActscriptWait $98,eas_Jump
                setActscriptWait $98,eas_Jump
                nextSingleText $0,$98   ; "Thank you!  Thank you!{N}{NAME;20} is OK.{W1}"
                nod $98
                csWait 30
                setActscriptWait $98,eas_Init
                setActscriptWait $99,eas_Init
                entityActions $98
                 moveRight 8
                endActions
                entityActionsWait $99
                 moveUp 1
                 moveRight 8
                endActions
                hide $98
                setPos $99,16,6,LEFT
                entityActionsWait $7
                 moveLeft 1
                endActions
                csWait 30
                setActscriptWait $7,eas_BumpLeft
                setActscriptWait $0,eas_Init
                setFacing $0,DOWN
                headshake $0
                setPriority $0,$FFFF
                followEntity $7,$0,$2
                csc_end
cs_5797A:       textCursor $647
                faceEntity $7,$93
                nextText $0,$93         ; "You're a man of honor!{N}Why don't you go see Creed?{W2}"
                nextText $0,$93         ; "He's an ex-greater devil.{N}He may give you some{N}information.{W2}"
                nextText $0,$93         ; "You must travel along the{N}river to get to Creed's{N}mansion.{W2}"
                nextSingleText $0,$93   ; "Maybe Polca has a raft for{N}you.{W1}"
                setFacing $93,RIGHT
                nextSingleText $0,$93   ; "Tell the mayor to prepare a{N}raft.{W1}"
                entityActionsWait $A
                 moveUp 2
                 faceLeft 1
                endActions
                nextSingleText $0,$A    ; "Yes, sir!{W1}"
                entityActionsWait $A
                 moveDown 3
                 moveRight 1
                 moveDown 4
                endActions
                hide $A
                faceEntity $93,$7
                nextText $0,$93         ; "{NAME;7}, please{N}help {LEADER}.{W2}"
                nextSingleText $0,$93   ; "{LEADER}, good luck!{W1}"
                csc_end
