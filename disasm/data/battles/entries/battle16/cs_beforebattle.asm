
; ASM FILE data\battles\entries\battle16\cs_beforebattle.asm :
; 0x4AFBE..0x4B1BC : Cutscene before battle 16
bbcs_16:        textCursor $9D1
                loadMapFadeIn 49,9,10
                executeSubroutine csub_4B1CA
                loadMapEntities ce_4B15C
                setActscriptWait $0,eas_Init
                setBlocks 13,4,3,3,0,0
                setBlocks 31,4,3,3,13,4
                cloneEntity $81,$82
                cloneEntity $83,$84
                cloneEntity $83,$85
                cloneEntity $83,$86
                cloneEntity $83,$87
                cloneEntity $83,$88
                cloneEntity $83,$89
                cloneEntity $83,$8A
                setActscriptWait $7,eas_Init
                setActscriptWait $1F,eas_Init
                setPos $7,15,15,LEFT
                setPos $1F,13,14,DOWN
                fadeInB
                csWait 30
                csWait 5
                setActscript $0,eas_461B6
                csWait 5
                setActscript $7,eas_461B6
                csWait 5
                setActscript $1F,eas_461B6
                csWait 120
                entityActionsWait $7
                 moveRight 1
                endActions
                csWait 20
                setFacing $0,DOWN
                setFacing $7,DOWN
                setFacing $1F,DOWN
                nextSingleText $C0,$7   ; "Huh?  The raft stopped!{W1}"
                setFacing $0,LEFT
                setFacing $7,LEFT
                setFacing $1F,RIGHT
                nextSingleText $0,$1F   ; "Did the water stop flowing?{N}What's happening?{W1}"
                csWait 30
                setFacing $7,UP
                csWait 30
                setActscriptWait $7,eas_Jump
                setActscriptWait $7,eas_Jump
                nextSingleText $C0,$7   ; "Wow!{D1}  What's that?{W1}"
                setFacing $0,UP
                setFacing $1F,UP
                csWait 20
                entityActionsWait $7
                 moveUp 2
                endActions
                nextSingleText $C0,$7   ; "{LEADER}, look there!{W1}"
                setCamDest 9,0
                playSound SFX_BIG_DOOR_RUMBLE
                setQuake 32770
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 30
                setActscriptWait $80,eas_46172
                customActscriptWait $80
                 ac_setSpeed 16,16      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPos $80,14,5,DOWN
                entityActionsWait $80
                 moveUp 2
                endActions
                setBlocks 0,0,3,3,13,4
                setPos $81,12,4,DOWN
                setPos $82,16,4,DOWN
                playSound SFX_BIG_DOOR_RUMBLE
                animEntityFX $81,5
                setPos $83,13,2,DOWN
                setPos $84,15,2,DOWN
                setPos $85,17,3,DOWN
                setPos $86,11,4,DOWN
                setPos $87,12,5,DOWN
                setPos $88,13,5,DOWN
                setPos $89,16,5,DOWN
                setPos $8A,14,6,DOWN
                animEntityFX $83,5
                setQuake 16386
                nextSingleText $C0,$7   ; "M...{D1}monster!{N}It appeared from the river!{W1}"
                nextText $0,$1F         ; "It must be the monster they{N}mentioned in Polca.{W2}"
                nextSingleText $0,$1F   ; "Watch out!{W1}"
                csWait 60
                csc_end
ce_4B15C:       mainEntity 15,14,RIGHT
                entity 63,63,DOWN,MAPSPRITE_KRAKEN,eas_Init
                entity 63,63,DOWN,MAPSPRITE_KRAKEN_ARM,eas_Init
                entity 63,63,DOWN,MAPSPRITE_KRAKEN_ARM,eas_Init
                entity 63,63,DOWN,MAPSPRITE_KRAKEN_LEG,eas_Init
                entity 63,63,DOWN,MAPSPRITE_KRAKEN_LEG,eas_Init
                entity 63,63,DOWN,MAPSPRITE_KRAKEN_LEG,eas_Init
                entity 63,63,DOWN,MAPSPRITE_KRAKEN_LEG,eas_Init
                entity 63,63,DOWN,MAPSPRITE_KRAKEN_LEG,eas_Init
                entity 63,63,DOWN,MAPSPRITE_KRAKEN_LEG,eas_Init
                entity 63,63,DOWN,MAPSPRITE_KRAKEN_LEG,eas_Init
                entity 63,63,DOWN,MAPSPRITE_KRAKEN_LEG,eas_Init
                dc.w $FFFF
