
; ASM FILE data\maps\entries\map20\mapsetups\scripts_1.asm :
; 0x53B66..0x53E18 : 
cs_53B66:       playSound $FD
                textCursor 2197
                setActscriptWait 130,eas_DeactivateAutoFacing
                setActscriptWait 128,eas_DeactivateAutoFacing
                customActscriptWait 130
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 128
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setCamDest 17,48
                playSound MUSIC_ENEMY_ATTACK
                entityActions 128
                 moveUp 2
                endActions
                csWait 10
                entityActionsWait 130
                 moveUp 2
                endActions
                csWait 40
                entityActions 128
                 moveDown 2
                endActions
                csWait 10
                entityActionsWait 130
                 moveDown 2
                endActions
                csWait 30
                nextSingleText $80,130  ; "King Granseal!{N}Calm down!{W1}"
                nextSingleText $0,128   ; "Guooooorrrr!{W1}"
                entityActions 128
                 moveRight 2
                endActions
                setActscriptWait 130,eas_Init
                csWait 1
                setActscriptWait 130,eas_JumpRight
                setActscriptWait 130,eas_JumpRight
                nextSingleText $80,130  ; "He's possessed!  He needs{N}an exorcism right now!{W1}"
                setCameraEntity 130
                entityActionsWait 128
                 moveRight 1
                endActions
                playSound SFX_DESOUL_HOVERING
                setActscript 128,eas_BumpRight
                setActscriptWait 130,eas_DeactivateAutoFacing
                entityActionsWait 130
                 moveRight 2
                endActions
                setFacing 130,LEFT
                customActscriptWait 130
                 ac_motion OFF          ;   
                 ac_orientRight         ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 120
cs_53C42:       setCamDest 19,48
                textCursor 2200
                setActscriptWait 130,eas_Init
                setFacing 130,DOWN
                csWait 10
                headshake 130
                csWait 30
                setFacing 130,UP
                nextText $80,130        ; "Yeow!  My head!{N}No, I'm OK, {LEADER}.{W2}"
                nextSingleText $80,130  ; "I must use a powerful spell.{N}It may be dangerous.{N}Stay back!{W1}"
                entityActionsWait ALLY_BOWIE
                 moveUp 1
                endActions
                setFacing ALLY_BOWIE,DOWN
                setActscriptWait 128,eas_DeactivateAutoFacing
                customActscriptWait 130
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 128
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing 130,LEFT
                csWait 50
                shiver 130
                csWait 30
                shiver 130
                csWait 20
                playSound SFX_SPELL_CAST
                entityFlashWhite 130,$78
                entityActions 130
                 moveLeft 2
                endActions
                entityActions 128
                 eaWait 20
                 moveLeft 2
                endActions
                entityFlashWhite 130,$78
                playSound SFX_SPELL_CAST
                setPos 136,24,53,LEFT
                nextSingleText $80,130  ; "Evil spirit inside the King,{N}begone, HAAA!{W1}"
                customActscriptWait 136
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 136
                 moveLeft 2
                endActions
                hide 136
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setQuake 2
                csWait 60
                setQuake 0
                customActscriptWait 128
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveLeft 1
                endActions
                customActscriptWait 128
                 ac_motion OFF          ;   
                 ac_orientRight         ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 50
                shiver 130
                csWait 20
                entityActionsWait 130
                 moveLeft 2
                endActions
                nextSingleText $80,130  ; "King...Granseal?{W1}"
                shiver 128
                stopEntity 128
                setPos 135,21,52,DOWN
                animEntityFX 135,5
                nextSingleText $80,130  ; "Did it work?{W1}"
                shiver 135
                setActscriptWait 135,eas_DeactivateAutoFacing
                customActscriptWait 135
                 ac_setSpeed 0,0        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 135
                 moveUp 5
                endActions
                hide 135
                csWait 60
                nextSingleText $0,128   ; "Ooh....{W1}"
                startEntity 128
                setActscriptWait 128,eas_Init
                csWait 5
                setActscript 128,eas_2xRightLeft
                csWait 100
                setFacing 128,RIGHT
                csWait 40
                entityActionsWait 128
                 moveRight 1
                endActions
                nextSingleText $0,128   ; "Astral, wha...what{N}happened?{W1}"
                shiver 130
                nextText $80,130        ; "Are you alright?{W2}"
                nextSingleText $80,130  ; "Let me use your soldiers.{N}We must kill it before it{N}finds another victim.{W1}"
                nextSingleText $0,128   ; "What are you talking about?{N}I don't understand.{W1}"
                csWait 50
                customActscriptWait 130
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                nextSingleText $80,130  ; "(Sigh){W1}"
                nextSingleText $0,128   ; "Astral!{W1}"
                playSound $FD
                csWait 30
                fadeOutB
                resetMap
                fadeInB
                reloadMap 0,0
                csWait 1
                nextSingleText $FF,255  ; "Astral is exhausted.{N}He won't wake up!{W2}{N}The Minister summons the{N}soldiers to the hall to kill{N}the evil spirit.{W1}"
                setF 609                ; Set after the scene where Astral exorcises the Gizmo
                warp MAP_GRANSEAL_CASTLE_2F,29,8,UP
                playSound MUSIC_CASTLE
                csc_end
