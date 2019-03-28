
; ASM FILE data\battles\entries\battle01\cs_afterbattle.asm :
; 0x496DC..0x4980E : Cutscene after battle 1
abcs_battle01:  textCursor $901
                resetForceBattleStats
                loadMapFadeIn 57,2,0
                loadMapEntities ce_497F6
                setActscriptWait $0,eas_Init
                setPos $1,8,7,UP
                setPos $2,8,8,UP
                fadeInB
                csWait 40
                nextSingleText $0,$81   ; "Well done, {LEADER}!{N}What should I do with this{N}devil?{W1}"
                setFacing $81,UP
                csWait 40
                shiver $80
                csWait 30
                shiver $80
                csWait 30
                mapFadeOutToWhite
                csWait 30
                mapFadeInFromWhite
                csWait 5
                setActscript $81,eas_461B6
                csWait 5
                setActscript $0,eas_461B6
                csWait 30
                mapFadeOutToWhite
                csWait 30
                mapFadeInFromWhite
                csWait 30
                mapFadeOutToWhite
                animEntityFX $80,6
                setSprite $80,MAPSPRITE_BLANK
                setPos $80,7,10,DOWN
                setSprite $80,MAPSPRITE_MIST_DEMON
                mapFadeInFromWhite
                csWait 30
                entityActionsWait $81
                 moveUp 1
                endActions
                nextSingleText $0,$81   ; "Oh, it disappeared?!{W1}"
                csWait 5
                setActscript $81,eas_461B6
                csWait 120
                entityActionsWait $81
                 moveDown 1
                endActions
                nextSingleText $0,$81   ; "Oh, there it is!{W1}"
                setFacing $0,DOWN
                setFacing $1,DOWN
                setFacing $2,DOWN
                setCamDest 2,3
                csWait 70
                mapFadeOutToWhite
                animEntityFX $80,6
                setSprite $80,MAPSPRITE_BLANK
                setPos $80,7,16,DOWN
                setSprite $80,MAPSPRITE_MIST_DEMON
                mapFadeInFromWhite
                csWait 30
                nextSingleText $0,$81   ; "It disappeared again.{W1}"
                setCamDest 2,10
                nextSingleText $0,$81   ; "There it is!{W1}"
                entityActions $80
                 moveDown 4
                endActions
                animEntityFX $80,6
                csWait 20
                hide $80
                setCamDest 2,2
                setFacing $81,RIGHT
                nextSingleText $0,$81   ; "We must hurry to the King!{W1}"
                entityActionsWait $81
                 moveDown 6
                endActions
                hide $81
                csWait 40
                csc_end
ce_497F6:       mainEntity 8,6,UP
                entity 7,4,DOWN,MAPSPRITE_MIST_DEMON,eas_Init
                entity 7,6,RIGHT,MAPSPRITE_ASTRAL,eas_Init
                dc.w $FFFF
