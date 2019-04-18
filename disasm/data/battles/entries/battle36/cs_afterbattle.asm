
; ASM FILE data\battles\entries\battle36\cs_afterbattle.asm :
; 0x4D9A4..0x4DA66 : Cutscene after battle 36
abcs_battle36:  textCursor $B89
                loadMapFadeIn 53,6,17
                loadMapEntities ce_4DA46
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setPos $7,10,19,DOWN
                setActscriptWait $1F,eas_Init
                setPos $1F,12,19,DOWN
                jumpIfFlagClear $4C,cs_4D9F0 ; Zynk is a follower
                setActscriptWait $1A,eas_Init
                setPos $1A,63,62,DOWN
cs_4D9F0:       animEntityFX $80,6
                fadeInB
                animEntityFX $80,7
                setActscriptWait $80,eas_Jump
                csWait 5
                setActscript $80,eas_461B6
                csWait 120
                setFacing $80,DOWN
                nextText $0,$80         ; "Prism Flowers?{W2}"
                nextSingleText $0,$80   ; "My Prism Flowers!{W1}"
                setFacing $80,UP
                nextSingleText $0,$80   ; "{LEADER}, I shall return{N}with Red Baron!{N}You'll pay for this!{W1}"
                animEntityFX $80,6
                followEntity $81,$0,$2
                followEntity $7,$81,$1
                followEntity $1F,$81,$3
                csc_end
ce_4DA46:       mainEntity 11,20,DOWN
                entity 10,19,DOWN,ALLY_PETER,eas_Init
                entity 11,23,DOWN,MAPSPRITE_GESHP,eas_Init
                entity 11,19,DOWN,MAPSPRITE_CARAVAN,eas_Init
                dc.w $FFFF
