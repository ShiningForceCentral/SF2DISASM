
; ASM FILE data\battles\entries\battle08\cs_afterbattle.asm :
; 0x4AA74..0x4ABFE : Cutscene after battle 8
abcs_battle08:  textCursor $9A4
                loadMapFadeIn 72,8,32
                loadMapEntities ce_4ABBE
                setActscriptWait ALLY_BOWIE,eas_Init
                stopEntity 129
                customActscriptWait 129
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $1          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                jumpIfFlagSet $6,cs_4AAB6 ; Kiwi joined
                setPos ALLY_KIWI,63,63,DOWN
cs_4AAB6:       fadeInB
                nextSingleText $0,128   ; "The game will be suspended.{N}OK?"
                setFacing 128,LEFT
                entityActionsWait 128
                 moveLeft 1
                endActions
                setFacing 128,UP
                entityActionsWait 128
                 moveUp 1
                endActions
                setFacing 128,RIGHT
                nextSingleText $0,128   ; "....{W1}"
                setActscriptWait 129,eas_Init
                setSprite 129,MAPSPRITE_POSE1
                setFacing 129,LEFT
                nextSingleText $C0,129  ; "{LEADER}, are you ready{N}for battle?{D3}"
                setSprite 129,MAPSPRITE_WORKER
                setFacing 129,DOWN
                nextSingleText $C0,129  ; "Do you need more preparations?"
                setActscriptWait 129,eas_Init
                csWait 5
                setActscript 129,eas_461B6
                csWait 120
                setFacing 129,LEFT
                startEntity 129
                nextSingleText $C0,129  ; "Did you change your mind?{W2}"
                setFacing 129,DOWN
                nextSingleText $C0,129  ; "Be careful.{D1}{N}Haste makes waste.{D1}"
                setActscript 128,eas_BumpRight
                customActscriptWait 129
                 ac_setSpeed 32,32      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 129,eas_4618A
                csWait 8
                entityActionsWait 129
                 moveRight 1
                endActions
                setFacing 129,DOWN
                headshake 129
                nextText $0,128         ; "{LEADER}, you had better{N}take a rest now.{D3}"
                nextSingleText $0,128   ; "{LEADER}, to retreat is{N}sometimes a good strategy.{D3}"
                setFacing 129,LEFT
                nextText $C0,129        ; "{LEADER}, are you ready?{D3}"
                nextText $C0,129        ; "{LEADER}, you are going to{N}battle again."
                nextText $C0,129        ; "{LEADER}, take it easy!{W1}"
                nextSingleText $C0,129  ; "{LEADER}, take it easy!{W1}"
                setFacing 129,RIGHT
                csWait 20
                setFacing ALLY_KIWI,RIGHT
                setCamDest 22,32
                csWait 30
                setCamDest 8,32
                entityActionsWait 128
                 moveRight 1
                endActions
                setActscriptWait 128,eas_Jump
                nextText $0,128         ; "{LEADER}, are you ready?{D3}"
                nextSingleText $0,128   ; "Do you need more preparations?"
                setFacing 128,DOWN
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $0,128   ; "You changed your mind?{W2}"
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
