
; ASM FILE data\battles\entries\battle36\cs_afterbattle.asm :
; 0x4D9A4..0x4DA66 : Cutscene after battle 36
abcs_battle36:  textCursor 2953
                loadMapFadeIn MAP_PRISM_FLOWERS_FIELD,6,17
                loadMapEntities ce_4DA46
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,10,19,DOWN
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,12,19,DOWN
                jumpIfFlagClear 76,cs_4D9F0 ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,63,62,DOWN
cs_4D9F0:       animEntityFX 128,6
                fadeInB
                animEntityFX 128,7
                setActscriptWait 128,eas_Jump
                csWait 5
                setActscript 128,eas_2xRightLeft
                csWait 120
                setFacing 128,DOWN
                nextText $0,128         ; "Prism Flowers?{W2}"
                nextSingleText $0,128   ; "My Prism Flowers!{W1}"
                setFacing 128,UP
                nextSingleText $0,128   ; "{LEADER}, I shall return{N}with Red Baron!{N}You'll pay for this!{W1}"
                animEntityFX 128,6
                followEntity 129,ALLY_BOWIE,2
                followEntity ALLY_PETER,129,1
                followEntity FOLLOWER_B,129,3
                csc_end
ce_4DA46:       mainEntity 11,20,DOWN
                entity 10,19,DOWN,ALLY_PETER,eas_Init
                entity 11,23,DOWN,MAPSPRITE_GESHP,eas_Init
                entity 11,19,DOWN,MAPSPRITE_CARAVAN,eas_Init
                dc.w $FFFF
