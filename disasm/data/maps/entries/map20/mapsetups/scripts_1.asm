
; ASM FILE data\maps\entries\map20\mapsetups\scripts_1.asm :
; 0x53B66..0x53E18 : 
cs_53B66:       playSound $FD
                textCursor $895
                setActscriptWait $82,eas_46172
                setActscriptWait $80,eas_46172
                customActscriptWait $82
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $80
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setCamDest 17,48
                playSound MUSIC_ENEMY_ATTACK
                entityActions $80
                 moveUp 2
                endActions
                csWait 10
                entityActionsWait $82
                 moveUp 2
                endActions
                csWait 40
                entityActions $80
                 moveDown 2
                endActions
                csWait 10
                entityActionsWait $82
                 moveDown 2
                endActions
                csWait 30
                nextSingleText $80,$82  ; "King Granseal!{N}Calm down!{W1}"
                nextSingleText $0,$80   ; "Guooooorrrr!{W1}"
                entityActions $80
                 moveRight 2
                endActions
                setActscriptWait $82,eas_Init
                csWait 1
                setActscriptWait $82,eas_JumpRight
                setActscriptWait $82,eas_JumpRight
                nextSingleText $80,$82  ; "He's possessed!  He needs{N}an exorcism right now!{W1}"
                setCameraEntity $82
                entityActionsWait $80
                 moveRight 1
                endActions
                playSound SFX_DESOUL_HOVERING
                setActscript $80,eas_BumpRight
                setActscriptWait $82,eas_46172
                entityActionsWait $82
                 moveRight 2
                endActions
                setFacing $82,LEFT
                customActscriptWait $82
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $3          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 120
cs_53C42:       setCamDest 19,48
                textCursor $898
                setActscriptWait $82,eas_Init
                setFacing $82,DOWN
                csWait 10
                headshake $82
                csWait 30
                setFacing $82,UP
                nextText $80,$82        ; "Yeow!  My head!{N}No, I'm OK, {LEADER}.{W2}"
                nextSingleText $80,$82  ; "I must use a powerful spell.{N}It may be dangerous.{N}Stay back!{W1}"
                entityActionsWait $0
                 moveUp 1
                endActions
                setFacing $0,DOWN
                setActscriptWait $80,eas_46172
                customActscriptWait $82
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait $80
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing $82,LEFT
                csWait 50
                shiver $82
                csWait 30
                shiver $82
                csWait 20
                playSound SFX_SPELL_CAST
                entityFlashWhite $82,$78
                entityActions $82
                 moveLeft 2
                endActions
                entityActions $80
                 eaWait 20
                 moveLeft 2
                endActions
                entityFlashWhite $82,$78
                playSound SFX_SPELL_CAST
                setPos $88,24,53,LEFT
                nextSingleText $80,$82  ; "Evil spirit inside the King,{N}begone, HAAA!{W1}"
                customActscriptWait $88
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $88
                 moveLeft 2
                endActions
                hide $88
                playSound SFX_PRISM_LASER_CUTSCENE_FIRING
                setQuake 2
                csWait 60
                setQuake 0
                customActscriptWait $80
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $80
                 moveLeft 1
                endActions
                customActscriptWait $80
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $3          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 50
                shiver $82
                csWait 20
                entityActionsWait $82
                 moveLeft 2
                endActions
                nextSingleText $80,$82  ; "King...Granseal?{W1}"
                shiver $80
                stopEntity $80
                setPos $87,21,52,DOWN
                animEntityFX $87,5
                nextSingleText $80,$82  ; "Did it work?{W1}"
                shiver $87
                setActscriptWait $87,eas_46172
                customActscriptWait $87
                 ac_setSpeed 0,0        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $87
                 moveUp 5
                endActions
                hide $87
                csWait 60
                nextSingleText $0,$80   ; "Ooh....{W1}"
                startEntity $80
                setActscriptWait $80,eas_Init
                csWait 5
                setActscript $80,eas_461B6
                csWait 100
                setFacing $80,RIGHT
                csWait 40
                entityActionsWait $80
                 moveRight 1
                endActions
                nextSingleText $0,$80   ; "Astral, wha...what{N}happened?{W1}"
                shiver $82
                nextText $80,$82        ; "Are you alright?{W2}"
                nextSingleText $80,$82  ; "Let me use your soldiers.{N}We must kill it before it{N}finds another victim.{W1}"
                nextSingleText $0,$80   ; "What are you talking about?{N}I don't understand.{W1}"
                csWait 50
                customActscriptWait $82
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                nextSingleText $80,$82  ; "(Sigh){W1}"
                nextSingleText $0,$80   ; "Astral!{W1}"
                playSound $FD
                csWait 30
                fadeOutB
                resetMap
                fadeInB
                reloadMap 0,0
                csWait 1
                nextSingleText $FF,$FF  ; "Astral is exhausted.{N}He won't wake up!{W2}{N}The Minister summons the{N}soldiers to the hall to kill{N}the evil spirit.{W1}"
                setF $261               ; Set after the scene where Astral exorcises the Gizmo
                warp $13,$1D,$8,$1
                playSound MUSIC_CASTLE
                csc_end
