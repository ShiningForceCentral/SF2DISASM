
; ASM FILE data\scripting\map\cs_intro4.asm :
; 0x48A78..0x48FE2 : Intro cutscene 4
IntroCutscene4: textCursor $1089
                mapLoad 65,7,3
                loadMapEntities ce_48FAA
                setActscriptWait $0,eas_Init
                fadeInFromBlackHalf
                csWait 40
                entityActions $81
                 moveDown 2
                endActions
                playSound SFX_INTRO_LIGHTNING
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 60
                textCursor $1089
                nextSingleText $0,$81   ; "Somebody bring a light to{N}the King's chamber!{D2}"
                csWait 20
                playSound SFX_DEMON_BREATH
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 30
                setFacing $81,UP
                nextText $80,$80        ; "Oh...the wind blew out{N}all the candles!{D2}"
                nextSingleText $80,$80  ; "It's so dark.{N}I can't see a thing.{D2}"
                csWait 30
                executeSubroutine ApplyStormEffect
                setQuake 3
                flashScreenWhite $A
                mapFadeOutToWhite
                csWait 20
                playSound SFX_INTRO_LIGHTNING
                csWait 20
                mapFadeInFromWhite
                tintMap
                setQuake 0
                customActscriptWait $80
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $80
                 moveDown 1
                endActions
                nextSingleText $80,$80  ; "What was that?{D2}"
                csWait 5
                setActscript $81,eas_461B6
                csWait 80
                entityActionsWait $81
                 moveUp 2
                endActions
                csWait 40
                setActscriptWait $81,eas_46172
                customActscriptWait $81
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $81
                 moveDown 1
                endActions
                nextSingleText $0,$81   ; "Sire, the Ancient Tower...{D2}"
                entityActionsWait $80
                 moveDown 1
                 faceLeft 1
                endActions
                nextSingleText $80,$80  ; "What's wrong?{D2}"
                setActscriptWait $81,eas_Init
                setActscriptWait $81,eas_Jump
                setActscriptWait $81,eas_Jump
                nextSingleText $0,$81   ; "It's collapsing!{N}Maybe it was struck by{N}lightning?{D2}"
                entityActionsWait $80
                 moveUp 1
                endActions
                nextSingleText $80,$80  ; "No, not lightning...{D2}"
                csWait 20
                customActscriptWait $80
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $80
                 moveDown 1
                endActions
                nextSingleText $80,$80  ; "To my knowledge, that tower{N}is impervious to any type{N}of disaster.{D2}"
                playSound SFX_DEMON_BREATH
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 30
                nextSingleText $0,$82   ; "Minister!{D2}"
                setFacing $81,LEFT
                setFacing $80,LEFT
                setCamDest 0,5
                setPos $82,3,9,DOWN
                setCameraEntity $82
                customActscriptWait $82
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $82
                 moveDown 1
                 moveRight 1
                 moveDownRight 3
                 moveRight 3
                 moveUp 2
                endActions
                setFacing $80,DOWN
                setFacing $81,DOWN
                csWait 20
                nod $82
                nod $82
                csWait 20
                setActscriptWait $81,eas_Init
                setCamDest 7,5
                entityActionsWait $81
                 moveDown 1
                endActions
                nextSingleText $0,$81   ; "What is it?{D2}"
                nextSingleText $0,$82   ; "The...sealed door...{N}Ancient Tower...{D2}"
                setActscriptWait $80,eas_Init
                entityActionsWait $80
                 moveDown 1
                endActions
                nextSingleText $80,$80  ; "Go on.{D2}"
                setActscriptWait $82,eas_Init
                entityActionsWait $82
                 moveRight 2
                 faceUp 1
                endActions
                nextSingleText $0,$82   ; "It's open!{D2}"
                setActscriptWait $81,eas_46172
                customActscriptWait $81
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $81
                 moveUp 1
                endActions
                nextSingleText $0,$81   ; "That's impossible!{N}It can't be opened!{D2}"
                entityActionsWait $82
                 moveLeft 2
                 faceUp 1
                endActions
                nextSingleText $0,$82   ; "I'm sure it was closed{N}before the lightning, but...{D2}"
                csWait 40
                setFacing $81,RIGHT
                setFacing $80,LEFT
                csWait 40
                setFacing $81,DOWN
                setFacing $80,DOWN
                csWait 40
                nextSingleText $0,$81   ; "Strange.{D2}"
                nod $81
                nextSingleText $0,$81   ; "Sire, I'm going to go and{N}see what happened!{D2}"
                setActscriptWait $81,eas_Init
                entityActionsWait $81
                 moveDown 1
                 moveRight 1
                endActions
                setFacing $80,LEFT
                nextSingleText $0,$81   ; "We must know the truth.{D2}"
                csWait 20
                nod $80
                nextSingleText $80,$80  ; "Be careful.{D2}"
                entityActionsWait $81
                 moveLeft 1
                 moveDown 1
                endActions
                nextSingleText $0,$81   ; "Take me to the sealed door.{D2}"
                nod $82
                setCameraEntity $82
                entityActions $82
                 moveDown 2
                 moveLeft 3
                 moveUpLeft 3
                 moveLeft 1
                 moveUp 1
                endActions
                entityActionsWait $81
                 moveDown 3
                 moveLeft 3
                 moveUpLeft 3
                 moveLeft 1
                 moveUp 1
                endActions
                hide $82
                hide $81
                setCameraEntity $FFFF
                csWait 30
                setCamDest 7,5
                setCameraEntity $80
                playSound SFX_DEMON_BREATH
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 30
                setFacing $80,DOWN
                csWait 30
                nextSingleText $80,$80  ; "Strange, strange indeed!{D2}"
                customActscriptWait $80
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $80
                 moveUp 2
                endActions
                csWait 20
                nextSingleText $80,$80  ; "Lightning at the Ancient{N}Tower.{D2}"
                setFacing $80,DOWN
                csWait 30
                setFacing $80,LEFT
                csWait 30
                setFacing $80,RIGHT
                csWait 30
                setFacing $80,DOWN
                csWait 30
                nextSingleText $80,$80  ; "Huh?{N}Did I hear something?{D2}"
                entityActionsWait $80
                 moveDown 1
                endActions
                nextSingleText $80,$80  ; "A sealed door that is open.{N}An unusual storm.{N}Everything is so strange.{D2}"
                csWait 5
                setActscript $80,eas_461B6
                csWait 60
                entityActionsWait $80
                 moveDown 1
                endActions
                nextSingleText $80,$80  ; "What?  I feel as if someone{N}is watching me.{N}It must be my nerves.{D2}"
                setFacing $80,UP
                playSound SFX_INTRO_LIGHTNING
                setPos $84,9,11,UP
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                setPos $84,63,63,UP
                csWait 60
                nextSingleText $80,$80  ; "I guess it was nothing.{N}I have to get a hold of{N}myself.{D2}"
                headshake $80
                customActscriptWait $80
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait $80
                 moveUp 1
                endActions
                playSound SFX_INTRO_LIGHTNING
                setPos $84,9,11,UP
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                setPos $84,63,63,UP
                csWait 60
                setFacing $80,DOWN
                csWait 30
                nextSingleText $80,$80  ; "What was that?{N}Who's there?!{D2}"
                setActscriptWait $80,eas_46172
                entityActionsWait $80
                 moveUp 1
                endActions
                playSound SFX_INTRO_LIGHTNING
                setPos $84,9,11,UP
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                setPos $84,63,63,UP
                csWait 60
                nextSingleText $80,$80  ; "It's not my imagination!{N}Somebody's in this room!{D2}"
                csWait 5
                setActscript $80,eas_461B6
                csWait 80
                playSound SFX_INTRO_LIGHTNING
                setPos $84,9,11,UP
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                setPos $84,63,63,UP
                csWait 60
                setFacing $80,UP
                setPos $83,9,2,DOWN
                setCamDest 7,1
                csWait 30
                setActscriptWait $80,eas_Init
                setActscriptWait $80,eas_Jump
                setActscriptWait $80,eas_Jump
                nextSingleText $80,$80  ; "Hey!{D2}"
                customActscriptWait $80
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait $80,eas_46172
                entityActionsWait $80
                 moveDown 1
                endActions
                nextSingleText $80,$80  ; "Stay away from me!{D2}"
                setActscriptWait $83,eas_Init2
                setActscriptWait $83,eas_46172
                stopEntity $83
                entityActionsWait $83
                 moveRight 1
                 moveDown 1
                 moveRight 1
                 moveDown 1
                endActions
                entityActionsWait $83
                 moveRight 1
                 moveDown 1
                endActions
                startEntity $83
                setCameraEntity $80
                shiver $83
                csWait 30
                shiver $83
                shiver $83
                csWait 20
                entityActionsWait $80
                 moveDown 1
                endActions
                csWait 5
                setActscript $80,eas_461E4
                csWait 30
                nextSingleText $80,$80  ; "Somebody...HELP!{D2}"
                setFacing $80,UP
                shiver $83
                csWait 30
                shiver $83
                customActscriptWait $85
                 ac_setSpeed 20,20      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPos $85,12,5,DOWN
                entityActions $85
                 moveDown 4
                endActions
                entityFlashWhite $85,$50
                waitIdle $85
                setActscript $80,eas_RotateRightHighSpeed
                entityFlashWhite $85,$28
                nextSingleText $80,$80  ; "Aughhhh!!!{D2}"
                hide $85
                csWait 30
                setActscript $80,eas_RotateRight
                csWait 50
                entityActionsWait $80
                 faceDown 1
                 moveDown 1
                endActions
                setFacing $80,UP
                customActscriptWait $80
                 ac_setAnimCounter $0   ;   
                 ac_setFlip $2          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                nextSingleText $80,$80  ; "(Sigh)....{D2}"
                shiver $83
                csWait 30
                playSound SFX_INTRO_LIGHTNING
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 40
                shiver $83
                csWait 40
                fadeOutToBlackHalf
                csc_end
ce_48FAA:       mainEntity 63,63,UP
                entity 12,6,DOWN,203,eas_Init
                entity 10,7,DOWN,205,eas_Init
                entity 63,63,RIGHT,206,eas_Init
                entity 63,63,DOWN,159,eas_Init
                entity 63,63,UP,187,eas_Init
                entity 63,63,DOWN,183,eas_Init
                dc.w $FFFF
