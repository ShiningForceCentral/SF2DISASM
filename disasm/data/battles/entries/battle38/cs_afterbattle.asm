
; ASM FILE data\battles\entries\battle38\cs_afterbattle.asm :
; 0x4DE8C..0x4E3D2 : Cutscene after battle 38
abcs_battle38:  textCursor $BC4
                loadMapFadeIn 66,3,22
                loadMapEntities ce_4E372
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setPos $7,5,25,RIGHT
                setActscriptWait $1F,eas_Init
                setPos $1F,8,28,UP
                setActscriptWait $1E,eas_Init
                setPos $1E,9,24,DOWN
                stopEntity $88
                customActscriptWait $88
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                jumpIfFlagClear $4C,cs_4DF00; Zynk is a follower
                setActscriptWait $1A,eas_Init
                setPos $1A,63,62,DOWN
cs_4DF00:       setActscriptWait $80,eas_46172
                setActscriptWait $81,eas_46172
                setActscriptWait $82,eas_46172
                setActscriptWait $83,eas_46172
                setActscriptWait $84,eas_46172
                setActscriptWait $85,eas_46172
                setActscriptWait $86,eas_46172
                setActscriptWait $87,eas_46172
                setPriority $0,$0
                setPriority $88,$FFFF
                fadeInB
                csWait 60
                shiver $88
                nextSingleText $0,$88   ; "My traps...{W1}"
                csWait 60
                customActscriptWait $88
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $0          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                startEntity $88
                setFacing $88,UP
                nextSingleText $0,$88   ; "I'm...at the end of my rope.{N}I...must...escape.{W1}"
                customActscriptWait $88
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $88
                 moveRight 1
                 moveUp 1
                 moveLeft 1
                 moveUp 2
                 moveRight 1
                 moveDown 1
                 moveRight 1
                 moveUp 1
                endActions
                entityActions $88
                 moveUp 1
                endActions
                csWait 12
                setActscriptWait $88,eas_461AA
                setQuake 1
                stopEntity $88
                setPos $88,8,24,LEFT
                customActscriptWait $88
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $88,eas_46172
                customActscriptWait $88
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setQuake 0
                entityActionsWait $88
                 moveDown 1
                endActions
                setFacing $88,DOWN
                entityActionsWait $88
                 moveDown 1
                endActions
                setFacing $88,RIGHT
                entityActionsWait $88
                 moveDown 1
                endActions
                setFacing $88,UP
                csWait 40
                shiver $88
                csWait 60
                customActscriptWait $88
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $0          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing $88,DOWN
                csWait 40
                headshake $88
                startEntity $88
                csWait 10
                setActscriptWait $88,eas_Jump
                setActscriptWait $88,eas_46172
                nextSingleText $0,$88   ; "Nooooooo!{W1}"
                entityActionsWait $88
                 moveUp 2
                endActions
                nextSingleText $0,$88   ; "Please...please let me go.{W1}"
                entityActionsWait $1F
                 moveUp 1
                endActions
                nextSingleText $C0,$1F  ; "We don't want to kill{N}you.{N}You've lost your powers.{W1}"
                nextSingleText $0,$88   ; "I know...(sob, sob)....{W1}"
                entityActionsWait $7
                 moveRight 1
                endActions
                nextSingleText $C0,$7   ; "You may go.{W1}"
                setFacing $88,LEFT
                nextSingleText $0,$88   ; "Thank you.{W1}"
                setActscriptWait $88,eas_Init
                setFacing $88,UP
                setCameraEntity $88
                csWait 60
                entityActionsWait $0
                 moveRight 1
                endActions
                setFacing $0,DOWN
                csWait 60
                cameraSpeed $8
                customActscriptWait $88
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $88
                 moveUp 1
                endActions
                setFacing $7,UP
                setFacing $0,LEFT
                entityActionsWait $88
                 moveUp 2
                endActions
                setFacing $0,UP
                entityActionsWait $88
                 moveUp 2
                endActions
                csWait 40
                setFacing $88,DOWN
                nextSingleText $0,$88   ; "I won't forget this.{W1}"
                entityActionsWait $88
                 moveUp 3
                endActions
                flashScreenWhite $1E
                playSound SFX_BATTLEFIELD_DEATH
                setQuake 3
                csWait 50
                csWait 5
                setActscript $88,eas_461B6
                csWait 80
                setQuake 0
                csWait 40
                setFacing $88,DOWN
                tintMap
                nextSingleText $C0,$89  ; "Where are you going, Geshp?{W1}"
                customActscriptWait $88
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $88,eas_Jump
                setActscriptWait $88,eas_Jump
                csWait 30
                setActscriptWait $88,eas_46172
                entityActionsWait $88
                 moveUp 1
                endActions
                nextSingleText $C0,$89  ; "Do you remember your vow?{W1}"
                headshake $88
                nextText $C0,$89        ; "You failed to get the jewel{N}from {LEADER}.{W2}"
                nextSingleText $C0,$89  ; "Now, you will pay with your{N}life.{W1}"
                nextSingleText $0,$88   ; "No, please...NO!{W1}"
                setPriority $88,$0
                setPos $80,8,13,RIGHT
                csWait 10
                setPos $81,10,14,LEFT
                csWait 5
                setActscript $88,eas_461B6
                csWait 10
                setPos $82,11,16,RIGHT
                csWait 10
                setPos $83,10,18,LEFT
                csWait 10
                setPos $84,8,19,RIGHT
                csWait 10
                setPos $85,6,18,LEFT
                csWait 10
                setPos $86,5,16,RIGHT
                csWait 10
                setPos $87,6,14,LEFT
                csWait 40
                flashScreenWhite $14
                tintMap
                setFacing $88,DOWN
                setQuake 3
                customActscriptWait $80
                 ac_setSpeed 80,80      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $81
                 ac_setSpeed 80,80      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $82
                 ac_setSpeed 80,80      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $83
                 ac_setSpeed 80,80      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $84
                 ac_setSpeed 80,80      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $85
                 ac_setSpeed 80,80      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $86
                 ac_setSpeed 80,80      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $87
                 ac_setSpeed 80,80      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                playSound SFX_BOLT_SPELL
                entityActionsWait $80
                 moveDown 3
                endActions
                setFacing $88,LEFT
                setSprite $88,$B4
                setActscript $88,eas_AnimSpeedx2
                setActscript $80,eas_JumpLeft
                playSound SFX_BOLT_SPELL
                entityActionsWait $81
                 moveDownLeft 2
                endActions
                setActscript $81,eas_JumpRight
                hide $80
                playSound SFX_BOLT_SPELL
                entityActionsWait $82
                 moveLeft 3
                endActions
                setActscript $82,eas_JumpLeft
                hide $81
                playSound SFX_BOLT_SPELL
                entityActionsWait $83
                 moveUpLeft 2
                endActions
                setActscript $83,eas_JumpRight
                hide $82
                playSound SFX_BOLT_SPELL
                entityActionsWait $84
                 moveUp 3
                endActions
                setActscript $84,eas_JumpLeft
                hide $83
                playSound SFX_BOLT_SPELL
                entityActionsWait $85
                 moveUpRight 2
                endActions
                setActscript $85,eas_JumpRight
                hide $84
                playSound SFX_BOLT_SPELL
                entityActionsWait $86
                 moveRight 3
                endActions
                setActscript $86,eas_JumpLeft
                hide $85
                playSound SFX_BOLT_SPELL
                entityActionsWait $87
                 moveDownRight 2
                endActions
                setActscript $87,eas_JumpRight
                hide $86
                csWait 8
                hide $87
                setQuake 0
                setCameraEntity $FFFF
                csWait 40
                setSprite $88,$9F
                setActscriptWait $88,eas_Die
                flickerOnce
                cameraSpeed $30
                setCamDest 3,20
                entityActionsWait $1F
                 moveUp 3
                endActions
                nextSingleText $0,$1F   ; "Zeon is such an unfeeling{N}devil...(shiver).{W1}"
                entityActionsWait $7
                 moveRight 1
                 moveUp 2
                endActions
                nextSingleText $0,$7    ; "He will do the same to us{N}if we lose to him.{W1}"
                nextSingleText $0,$1F   ; "We must not be defeated.{W1}"
                followEntity $1E,$0,$2
                followEntity $7,$1E,$1
                followEntity $1F,$1E,$3
                csc_end
ce_4E372:       mainEntity 8,23,DOWN
                entity 5,25,RIGHT,7,eas_Init
                entity 63,63,RIGHT,178,eas_Init
                entity 63,63,LEFT,178,eas_Init
                entity 63,63,RIGHT,178,eas_Init
                entity 63,63,LEFT,178,eas_Init
                entity 63,63,RIGHT,178,eas_Init
                entity 63,63,LEFT,178,eas_Init
                entity 63,63,RIGHT,178,eas_Init
                entity 63,63,LEFT,178,eas_Init
                entity 6,27,DOWN,159,eas_Init
                entity 63,63,DOWN,162,eas_Init
                dc.w $FFFF
