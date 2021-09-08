
; ASM FILE data\maps\entries\map22\mapsetups\s6_initfunction.asm :
; 0x5962E..0x5994E : 

; =============== S U B R O U T I N E =======================================


ms_map22_InitFunction:
                
                 
                chkFlg  776             ; Set after the scene where Goliath places you on the Desktop
                bne.s   byte_5963E      
                script  cs_59656
                setFlg  776             ; Set after the scene where Goliath places you on the Desktop
byte_5963E:
                
                chkFlg  522             ; Battle 22 completed - BATTLE_CHESSBOARD                  
                beq.s   return_59654
                chkFlg  778             ; Set after the scene that plays after you win the chess battle
                bne.s   return_59654
                script  cs_5996E
                setFlg  778             ; Set after the scene that plays after you win the chess battle
return_59654:
                
                rts

    ; End of function ms_map22_InitFunction

cs_59656:       textCursor 1748
                reloadMap 0,19
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                stopEntity ALLY_BOWIE
                stopEntity ALLY_PETER
                stopEntity FOLLOWER_B
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_PETER
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPos ALLY_BOWIE,4,8,DOWN
                setPos ALLY_PETER,3,7,DOWN
                setPos FOLLOWER_B,5,7,DOWN
                setPos 153,12,16,DOWN
                setPos 154,11,15,DOWN
                setPos 155,13,15,DOWN
                removeShadow ALLY_BOWIE
                removeShadow ALLY_PETER
                removeShadow FOLLOWER_B
                fadeInB
                entityActions ALLY_BOWIE
                 moveDown 16
                endActions
                entityActions ALLY_PETER
                 moveDown 16
                endActions
                entityActions FOLLOWER_B
                 moveDown 16
                endActions
                entityActions 153
                 moveDownLeft 8
                endActions
                entityActions 154
                 moveDownLeft 8
                endActions
                entityActionsWait 155
                 moveDownLeft 8
                endActions
                hide 153
                hide 154
                hide 155
                customActscriptWait ALLY_BOWIE
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait ALLY_PETER
                 ac_motion OFF          ;   
                 ac_orientRight         ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait FOLLOWER_B
                 ac_motion OFF          ;   
                 ac_orientRight         ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 100
                startEntity ALLY_BOWIE
                startEntity ALLY_PETER
                startEntity FOLLOWER_B
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                headshake ALLY_BOWIE
                headshake ALLY_PETER
                headshake FOLLOWER_B
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,RIGHT
                setFacing FOLLOWER_B,LEFT
                csWait 20
                nextText $C0,FOLLOWER_B ; "What happened?{W2}"
                nextText $C0,FOLLOWER_B ; "A strange feeling swept over{N}me when I entered that door.{W2}"
                nextSingleText $C0,FOLLOWER_B ; "Then, it felt like...I was{N}lifted upward!{W1}"
                nextText $0,ALLY_PETER  ; "It's very difficult to explain{N}what's happened to us....{W2}"
                nextSingleText $0,ALLY_PETER ; "Anyway, we're very small now.{W1}"
                customActscriptWait FOLLOWER_B
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait FOLLOWER_B
                 moveLeft 1
                endActions
                nextSingleText $C0,FOLLOWER_B ; "Small?  How small?{W1}"
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 100
                entityActionsWait ALLY_PETER
                 moveDown 2
                 moveRight 1
                endActions
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 130
                setFacing ALLY_PETER,UP
                setFacing ALLY_BOWIE,DOWN
                setFacing FOLLOWER_B,DOWN
                nextSingleText $0,ALLY_PETER ; "Let's see...now we're on a{N}desk...and it's very large,{N}like a village.{W1}"
                nextSingleText $0,128   ; "Exactly.{W1}"
                entityActions ALLY_BOWIE
                 moveLeft 1
                endActions
                entityActionsWait ALLY_PETER
                 moveRight 1
                endActions
                csWait 5
                setActscript ALLY_BOWIE,eas_2xRightLeft
                csWait 10
                csWait 5
                setActscript ALLY_PETER,eas_2xRightLeft
                csWait 5
                setActscript FOLLOWER_B,eas_2xRightLeft
                csWait 130
                setFacing ALLY_PETER,DOWN
                setFacing ALLY_BOWIE,DOWN
                setFacing FOLLOWER_B,DOWN
                setActscriptWait ALLY_BOWIE,eas_Jump
                setActscript ALLY_PETER,eas_Jump
                shiver ALLY_BOWIE
                shiver ALLY_PETER
                setActscriptWait ALLY_BOWIE,eas_DeactivateAutoFacing
                setActscriptWait ALLY_PETER,eas_DeactivateAutoFacing
                entityActions ALLY_BOWIE
                 moveUp 1
                endActions
                entityActionsWait ALLY_PETER
                 moveUp 1
                endActions
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                nextText $0,ALLY_PETER  ; "Goliath!{W2}"
                setActscriptWait ALLY_PETER,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                csWait 10
                nextSingleText $0,ALLY_PETER ; "Hey, what did you do to us?{W1}"
                nextText $0,128         ; "I told you not to go in{N}there.  You didn't listen{N}to my warning.{W2}"
                nextSingleText $0,128   ; "You guys look so cute!{N}Ha, ha!{N}Bye, little kiddies!{W1}"
                csWait 20
                playSound SFX_DIALOG_BLEEP_6
                csWait 20
                playSound SFX_DIALOG_BLEEP_6
                csWait 20
                playSound SFX_DIALOG_BLEEP_6
                csWait 20
                playSound SFX_DIALOG_BLEEP_6
                csWait 20
                playSound SFX_DIALOG_BLEEP_6
                setFacing ALLY_BOWIE,RIGHT
                setFacing ALLY_PETER,RIGHT
                setFacing FOLLOWER_B,RIGHT
                csWait 20
                playSound SFX_DIALOG_BLEEP_8
                csWait 20
                playSound SFX_DIALOG_BLEEP_8
                csWait 20
                playSound SFX_DIALOG_BLEEP_8
                csWait 20
                playSound SFX_DIALOG_BLEEP_8
                csWait 20
                playSound SFX_DIALOG_BLEEP_8
                csWait 50
                entityActionsWait ALLY_PETER
                 moveLeft 2
                endActions
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,DOWN
                nextText $0,ALLY_PETER  ; "{LEADER}, cheer up!{W2}"
                nextSingleText $0,ALLY_PETER ; "Let's look around this{N}Desktop Kingdom.{W1}"
                setFacing ALLY_BOWIE,RIGHT
                setFacing FOLLOWER_B,LEFT
                nextSingleText $0,FOLLOWER_B ; "I agree!  We can meet Creed{N}later.{W1}"
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setActscriptWait FOLLOWER_B,eas_Init
                followEntity ALLY_PETER,ALLY_BOWIE,2
                followEntity FOLLOWER_B,ALLY_PETER,2
                csc_end
