
; ASM FILE data\battles\entries\battle08\cs_afterbattle.asm :
; 0x4AA74..0x4ABFE : Cutscene after battle 8
abcs_battle08:  textCursor $9A4
                loadMapFadeIn 72,8,32
                loadMapEntities ce_4ABBE
                setActscriptWait $0,eas_Init
                stopEntity $81
                customActscriptWait $81
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                jumpIfFlagSet $6,cs_4AAB6 ; Kiwi joined
                setPos $6,63,63,DOWN
cs_4AAB6:       fadeInB
                nextSingleText $0,$80   ; "The game will be suspended.{N}OK?"
                setFacing $80,LEFT
                entityActionsWait $80
                 moveLeft 1
                endActions
                setFacing $80,UP
                entityActionsWait $80
                 moveUp 1
                endActions
                setFacing $80,RIGHT
                nextSingleText $0,$80   ; "....{W1}"
                setActscriptWait $81,eas_Init
                setSprite $81,MAPSPRITE_POSE1
                setFacing $81,LEFT
                nextSingleText $C0,$81  ; "{LEADER}, are you ready{N}for battle?{D3}"
                setSprite $81,MAPSPRITE_WORKER
                setFacing $81,DOWN
                nextSingleText $C0,$81  ; "Do you need more preparations?"
                setActscriptWait $81,eas_Init
                csWait 5
                setActscript $81,eas_461B6
                csWait 120
                setFacing $81,LEFT
                startEntity $81
                nextSingleText $C0,$81  ; "Did you change your mind?{W2}"
                setFacing $81,DOWN
                nextSingleText $C0,$81  ; "Be careful.{D1}{N}Haste makes waste.{D1}"
                setActscript $80,eas_BumpRight
                customActscriptWait $81
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $81,eas_4618A
                csWait 8
                entityActionsWait $81
                 moveRight 1
                endActions
                setFacing $81,DOWN
                headshake $81
                nextText $0,$80         ; "{LEADER}, you had better{N}take a rest now.{D3}"
                nextSingleText $0,$80   ; "{LEADER}, to retreat is{N}sometimes a good strategy.{D3}"
                setFacing $81,LEFT
                nextText $C0,$81        ; "{LEADER}, are you ready?{D3}"
                nextText $C0,$81        ; "{LEADER}, you are going to{N}battle again."
                nextText $C0,$81        ; "{LEADER}, take it easy!{W1}"
                nextSingleText $C0,$81  ; "{LEADER}, take it easy!{W1}"
                setFacing $81,RIGHT
                csWait 20
                setFacing $6,RIGHT
                setCamDest 22,32
                csWait 30
                setCamDest 8,32
                entityActionsWait $80
                 moveRight 1
                endActions
                setActscriptWait $80,eas_Jump
                nextText $0,$80         ; "{LEADER}, are you ready?{D3}"
                nextSingleText $0,$80   ; "Do you need more preparations?"
                setFacing $80,DOWN
                entityActionsWait $80
                 moveDown 1
                endActions
                nextSingleText $0,$80   ; "You changed your mind?{W2}"
                warp $49,$3E,$31,$2
                csc_end
ce_4ABBE:       mainEntity 14,37,UP
                entity 14,35,UP,MAPSPRITE_WORKER,eas_Init
                entity 13,36,UP,ALLY_SARAH,eas_Init
                entity 12,35,UP,ALLY_JAHA,eas_Init
                entity 15,36,UP,ALLY_KAZIN,eas_Init
                entity 16,35,UP,ALLY_CHESTER,eas_Init
                entity 16,34,LEFT,ALLY_KIWI,eas_Init
                entity 14,34,DOWN,MAPSPRITE_WORKER,eas_Init
                dc.w $FFFF
