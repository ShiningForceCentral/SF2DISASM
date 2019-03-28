
; ASM FILE data\battles\entries\battle28\cs_beforebattle.asm :
; 0x4BE8C..0x4C07C : Cutscene before battle 28
bbcs_28:        textCursor $A65
                loadMapFadeIn 47,0,4
                loadMapEntities ce_4C03C
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setPos $7,0,9,RIGHT
                setActscriptWait $1F,eas_Init
                setPos $1F,0,7,RIGHT
                stopEntity $81
                playSound MUSIC_BATTLE_THEME_3
                fadeInB
                cameraSpeed $30
                entityActions $0
                 moveRight 3
                endActions
                entityActions $1F
                 moveRight 3
                endActions
                entityActions $7
                 moveRight 3
                endActions
                entityActionsWait $80
                 moveRight 3
                endActions
                csWait 40
                setActscriptWait $1F,eas_Jump
                entityActionsWait $1F
                 moveRight 2
                 moveDown 1
                endActions
                setFacing $1F,RIGHT
                nextSingleText $0,$1F   ; "Wow, look at that?{W1}"
                setCamDest 7,11
                shiver $82
                playSound SFX_MONSTER_SCREAM
                csWait 30
                shiver $83
                playSound SFX_MONSTER_SCREAM
                csWait 40
                setCamDest 0,6
                entityActionsWait $7
                 moveDown 1
                 moveRight 1
                endActions
                nextSingleText $0,$7    ; "Those monsters are eating{N}the bridge.{W1}"
                nextSingleText $0,$81   ; "Help!  Help me!{W1}"
                setActscript $0,eas_Jump
                setActscript $1F,eas_Jump
                setActscriptWait $7,eas_Jump
                entityActionsWait $0
                 moveDown 1
                 moveRight 1
                 moveDown 1
                endActions
                csWait 5
                setActscript $0,eas_461B6
                csWait 5
                setActscript $7,eas_461E4
                csWait 100
                setActscriptWait $1F,eas_Jump
                customActscriptWait $1F
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $1F
                 moveDown 2
                endActions
                csWait 10
                stopEntity $0
                customActscriptWait $0
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setQuake 2
                playSound SFX_HIT_2
                entityActionsWait $0
                 moveDown 1
                endActions
                setFacing $0,UP
                customActscriptWait $0
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $2          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                waitIdle $1F
                setFacing $1F,RIGHT
                setQuake 0
                nextText $0,$1F         ; "Look!{W2}"
                nextSingleText $0,$1F   ; "She's stranded on the{N}bridge.{W1}"
                setFacing $7,RIGHT
                shiver $0
                setCamDest 7,21
                nextSingleText $0,$7    ; "Get away from the bridge{N}before it falls into the{N}river!{W1}"
                nextText $0,$81         ; "I sprained my ankle!{N}Please help me!{W2}"
                nextSingleText $0,$81   ; "I can't stand up!{W1}"
                setCamDest 0,6
                setFacing $1F,DOWN
                setActscriptWait $1F,eas_Jump
                csWait 30
                setActscriptWait $0,eas_Init
                startEntity $0
                headshake $0
                nextSingleText $0,$1F   ; "{LEADER}, defeat all the{N}monsters!  Hurry!{W1}"
                setActscript $7,eas_Jump
                nod $0
                csc_end
ce_4C03C:       mainEntity 1,8,RIGHT
                entity 0,9,RIGHT,ALLY_PETER,eas_Init
                entity 0,8,RIGHT,MAPSPRITE_CARAVAN,eas_Init
                entity 12,24,UP,MAPSPRITE_POSE3,eas_Init
                entity 13,13,LEFT,MAPSPRITE_WORM,eas_Init
                entity 12,17,UP,MAPSPRITE_WORM,eas_Init
                entity 11,22,DOWN,MAPSPRITE_WORM,eas_Init
                entity 11,25,RIGHT,MAPSPRITE_WORM,eas_Init
                dc.w $FFFF
