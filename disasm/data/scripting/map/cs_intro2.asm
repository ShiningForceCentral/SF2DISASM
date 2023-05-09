
; ASM FILE data\scripting\map\cs_intro2.asm :
; 0x48380..0x48540 : Intro cutscene 2
IntroCutscene2: textCursor 4202
                mapLoad MAP_GRANSEAL_CASTLE,7,2
                loadMapEntities ce_48510
                setActscriptWait ALLY_BOWIE,eas_Init
                cloneEntity 132,131
                resetMap
                fadeInB
                reloadMap 7,2
                nextSingleText $80,128  ; "Quite a storm.{D2}"
                loadMapFadeIn MAP_GRANSEAL_CASTLE,7,2
                fadeInB
                csWait 40
                playSound SFX_DEMON_BREATH
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 60
                setFacing 129,RIGHT
                nextSingleText $0,129   ; "Excuse me?{D2}"
                nextSingleText $80,128  ; "It's a stormy night.{D2}"
                setFacing 129,UP
                csWait 30
                playSound SFX_DEMON_BREATH
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 40
                setFacing 129,RIGHT
                nod 129
                csWait 20
                nextSingleText $0,129   ; "It's unusual for this time{N}of year.{D2}"
                csWait 30
                nextSingleText $0,130   ; "Excuse me, your majesty.{D2}"
                setFacing 129,DOWN
                entityActionsWait 130
                 moveUp 3
                endActions
                setCamDest 7,4
                nextSingleText $0,129   ; "Is it time to go to the{N}Ancient Tower?{D2}"
                nod 130
                nextSingleText $0,130   ; "Yes, sire.{D2}"
                entityActionsWait 129
                 moveDown 1
                 moveRight 2
                 faceDown 10
                endActions
                nextSingleText $0,129   ; "It's stormy outside.{N}Be careful.{D2}"
                nod 130
                csWait 30
                setCameraEntity 130
                entityActionsWait 130
                 moveDown 3
                 moveLeft 5
                 moveUpLeft 3
                 moveLeft 1
                 moveUp 1
                endActions
                hide 130
                setCameraEntity 65535
                csWait 30
                setCamDest 7,2
                csWait 40
                shiver 128
                nextSingleText $80,128  ; "Hmmm....{D2}"
                setFacing 129,UP
                nextSingleText $0,129   ; "Excuse me, sire?{D2}"
                nextSingleText $80,128  ; "I have a bad feeling...{N}Oh, well.{D2}"
                csWait 40
                setFacing 129,LEFT
                csWait 40
                customActscriptWait 129
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveLeft 2
                 faceDown 1
                endActions
                playSound SFX_SPELL_CAST
                nextSingleText $0,129   ; "Oh, a gust of wind!{D2}"
                csWait 20
                shiver 128
                setFacing 128,DOWN
                nextSingleText $80,128  ; "Make sure all the doors and{N}windows are shut!{D2}"
                playSound SFX_SPELL_CAST
                csWait 30
                animEntityFX 131,6
                tintMap
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 30
                csWait 5
                setActscript 128,eas_2xRightLeft
                playSound SFX_DEMON_BREATH
                csWait 30
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 40
                playSound SFX_DEMON_BREATH
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 30
                csWait 5
                setActscript 128,eas_2xRightLeft
                csWait 70
                fadeOutToBlackHalf
                csWait 30
                csc_end
ce_48510:       mainEntity 63,63,UP
                entity 12,6,DOWN,MAPSPRITE_GRANSEAL_KING,eas_Init
                entity 10,7,DOWN,MAPSPRITE_MINISTER,eas_Init
                entity 12,13,UP,MAPSPRITE_SOLDIER1,eas_Init
                entity 9,6,LEFT,MAPSPRITE_EFFECT6,eas_Init
                entity 15,6,LEFT,MAPSPRITE_EFFECT6,eas_Init
                dc.w $FFFF
