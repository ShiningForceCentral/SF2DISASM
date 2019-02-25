
; ASM FILE data\maps\entries\map22\mapsetups\s6_initfunction.asm :
; 0x5962E..0x5994E : 

; =============== S U B R O U T I N E =======================================

ms_map22_InitFunction:
                
                 
                chkFlg  $308            ; Set after the scene where Goliath places you on the Desktop
                bne.s   byte_5963E      
                script  cs_59656
                setFlg  $308            ; Set after the scene where Goliath places you on the Desktop
byte_5963E:
                
                chkFlg  $20A            ; Battle 22 completed
                beq.s   return_59654
                chkFlg  $30A            ; Set after the scene that plays after you win the chess battle
                bne.s   return_59654
                script  cs_5996E
                setFlg  $30A            ; Set after the scene that plays after you win the chess battle
return_59654:
                
                rts

	; End of function ms_map22_InitFunction

cs_59656:       textCursor $6D4
                reloadMap 0,19
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                stopEntity $0
                stopEntity $7
                stopEntity $1F
                customActscriptWait $0
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $7
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $1F
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPos $0,4,8,DOWN
                setPos $7,3,7,DOWN
                setPos $1F,5,7,DOWN
                setPos $99,12,16,DOWN
                setPos $9A,11,15,DOWN
                setPos $9B,13,15,DOWN
                removeShadow $0
                removeShadow $7
                removeShadow $1F
                fadeInB
                entityActions $0
                 moveDown 16
                endActions
                entityActions $7
                 moveDown 16
                endActions
                entityActions $1F
                 moveDown 16
                endActions
                entityActions $99
                 moveDownLeft 8
                endActions
                entityActions $9A
                 moveDownLeft 8
                endActions
                entityActionsWait $9B
                 moveDownLeft 8
                endActions
                hide $99
                hide $9A
                hide $9B
                customActscriptWait $0
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $7
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $3          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $1F
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $3          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 100
                startEntity $0
                startEntity $7
                startEntity $1F
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                headshake $0
                headshake $7
                headshake $1F
                setFacing $0,UP
                setFacing $7,RIGHT
                setFacing $1F,LEFT
                csWait 20
                nextText $C0,$1F        ; "What happened?{W2}"
                nextText $C0,$1F        ; "A strange feeling swept over{N}me when I entered that door.{W2}"
                nextSingleText $C0,$1F  ; "Then, it felt like...I was{N}lifted upward!{W1}"
                nextText $0,$7          ; "It's very difficult to explain{N}what's happened to us....{W2}"
                nextSingleText $0,$7    ; "Anyway, we're very small now.{W1}"
                customActscriptWait $1F
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $1F
                 moveLeft 1
                endActions
                nextSingleText $C0,$1F  ; "Small?  How small?{W1}"
                csWait 5
                setActscript $7,eas_461B6
                csWait 100
                entityActionsWait $7
                 moveDown 2
                 moveRight 1
                endActions
                csWait 5
                setActscript $7,eas_461B6
                csWait 130
                setFacing $7,UP
                setFacing $0,DOWN
                setFacing $1F,DOWN
                nextSingleText $0,$7    ; "Let's see...now we're on a{N}desk...and it's very large,{N}like a village.{W1}"
                nextSingleText $0,$80   ; "Exactly.{W1}"
                entityActions $0
                 moveLeft 1
                endActions
                entityActionsWait $7
                 moveRight 1
                endActions
                csWait 5
                setActscript $0,eas_461B6
                csWait 10
                csWait 5
                setActscript $7,eas_461B6
                csWait 5
                setActscript $1F,eas_461B6
                csWait 130
                setFacing $7,DOWN
                setFacing $0,DOWN
                setFacing $1F,DOWN
                setActscriptWait $0,eas_Jump
                setActscript $7,eas_Jump
                shiver $0
                shiver $7
                setActscriptWait $0,eas_46172
                setActscriptWait $7,eas_46172
                entityActions $0
                 moveUp 1
                endActions
                entityActionsWait $7
                 moveUp 1
                endActions
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                nextText $0,$7          ; "Goliath!{W2}"
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_Jump
                csWait 10
                nextSingleText $0,$7    ; "Hey, what did you do to us?{W1}"
                nextText $0,$80         ; "I told you not to go in{N}there.  You didn't listen{N}to my warning.{W2}"
                nextSingleText $0,$80   ; "You guys look so cute!{N}Ha, ha!{N}Bye, little kiddies!{W1}"
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
                setFacing $0,RIGHT
                setFacing $7,RIGHT
                setFacing $1F,RIGHT
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
                entityActionsWait $7
                 moveLeft 2
                endActions
                setFacing $0,DOWN
                setFacing $7,UP
                setFacing $1F,DOWN
                nextText $0,$7          ; "{LEADER}, cheer up!{W2}"
                nextSingleText $0,$7    ; "Let's look around this{N}Desktop Kingdom.{W1}"
                setFacing $0,RIGHT
                setFacing $1F,LEFT
                nextSingleText $0,$1F   ; "I agree!  We can meet Creed{N}later.{W1}"
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                followEntity $7,$0,$2
                followEntity $1F,$7,$2
                csc_end
