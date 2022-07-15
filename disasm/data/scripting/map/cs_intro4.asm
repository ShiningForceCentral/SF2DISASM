
; ASM FILE data\scripting\map\cs_intro4.asm :
; 0x48A78..0x48FE2 : Intro cutscene 4
IntroCutscene4: textCursor 4233
                mapLoad MAP_GRANSEAL_CASTLE,7,3
                loadMapEntities ce_48FAA
                setActscriptWait ALLY_BOWIE,eas_Init
                fadeInFromBlackHalf
                csWait 40
                entityActions 129
                 moveDown 2
                endActions
                playSound SFX_INTRO_LIGHTNING
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 60
                textCursor 4233
                nextSingleText $0,129   ; "Somebody bring a light to{N}the King's chamber!{D2}"
                csWait 20
                playSound SFX_DEMON_BREATH
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 30
                setFacing 129,UP
                nextText $80,128        ; "Oh...the wind blew out{N}all the candles!{D2}"
                nextSingleText $80,128  ; "It's so dark.{N}I can't see a thing.{D2}"
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
                customActscriptWait 128
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $80,128  ; "What was that?{D2}"
                csWait 5
                setActscript 129,eas_2xRightLeft
                csWait 80
                entityActionsWait 129
                 moveUp 2
                endActions
                csWait 40
                setActscriptWait 129,eas_DeactivateAutoFacing
                customActscriptWait 129
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveDown 1
                endActions
                nextSingleText $0,129   ; "Sire, the Ancient Tower...{D2}"
                entityActionsWait 128
                 moveDown 1
                 faceLeft 1
                endActions
                nextSingleText $80,128  ; "What's wrong?{D2}"
                setActscriptWait 129,eas_Init
                setActscriptWait 129,eas_Jump
                setActscriptWait 129,eas_Jump
                nextSingleText $0,129   ; "It's collapsing!{N}Maybe it was struck by{N}lightning?{D2}"
                entityActionsWait 128
                 moveUp 1
                endActions
                nextSingleText $80,128  ; "No, not lightning...{D2}"
                csWait 20
                customActscriptWait 128
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $80,128  ; "To my knowledge, that tower{N}is impervious to any type{N}of disaster.{D2}"
                playSound SFX_DEMON_BREATH
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 30
                nextSingleText $0,130   ; "Minister!{D2}"
                setFacing 129,LEFT
                setFacing 128,LEFT
                setCamDest 0,5
                setPos 130,3,9,DOWN
                setCameraEntity 130
                customActscriptWait 130
                 ac_setSpeed 40,40      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 130
                 moveDown 1
                 moveRight 1
                 moveDownRight 3
                 moveRight 3
                 moveUp 2
                endActions
                setFacing 128,DOWN
                setFacing 129,DOWN
                csWait 20
                nod 130
                nod 130
                csWait 20
                setActscriptWait 129,eas_Init
                setCamDest 7,5
                entityActionsWait 129
                 moveDown 1
                endActions
                nextSingleText $0,129   ; "What is it?{D2}"
                nextSingleText $0,130   ; "The...sealed door...{N}Ancient Tower...{D2}"
                setActscriptWait 128,eas_Init
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $80,128  ; "Go on.{D2}"
                setActscriptWait 130,eas_Init
                entityActionsWait 130
                 moveRight 2
                 faceUp 1
                endActions
                nextSingleText $0,130   ; "It's open!{D2}"
                setActscriptWait 129,eas_DeactivateAutoFacing
                customActscriptWait 129
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 129
                 moveUp 1
                endActions
                nextSingleText $0,129   ; "That's impossible!{N}It can't be opened!{D2}"
                entityActionsWait 130
                 moveLeft 2
                 faceUp 1
                endActions
                nextSingleText $0,130   ; "I'm sure it was closed{N}before the lightning, but...{D2}"
                csWait 40
                setFacing 129,RIGHT
                setFacing 128,LEFT
                csWait 40
                setFacing 129,DOWN
                setFacing 128,DOWN
                csWait 40
                nextSingleText $0,129   ; "Strange.{D2}"
                nod 129
                nextSingleText $0,129   ; "Sire, I'm going to go and{N}see what happened!{D2}"
                setActscriptWait 129,eas_Init
                entityActionsWait 129
                 moveDown 1
                 moveRight 1
                endActions
                setFacing 128,LEFT
                nextSingleText $0,129   ; "We must know the truth.{D2}"
                csWait 20
                nod 128
                nextSingleText $80,128  ; "Be careful.{D2}"
                entityActionsWait 129
                 moveLeft 1
                 moveDown 1
                endActions
                nextSingleText $0,129   ; "Take me to the sealed door.{D2}"
                nod 130
                setCameraEntity 130
                entityActions 130
                 moveDown 2
                 moveLeft 3
                 moveUpLeft 3
                 moveLeft 1
                 moveUp 1
                endActions
                entityActionsWait 129
                 moveDown 3
                 moveLeft 3
                 moveUpLeft 3
                 moveLeft 1
                 moveUp 1
                endActions
                hide 130
                hide 129
                setCameraEntity 65535
                csWait 30
                setCamDest 7,5
                setCameraEntity 128
                playSound SFX_DEMON_BREATH
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 30
                setFacing 128,DOWN
                csWait 30
                nextSingleText $80,128  ; "Strange, strange indeed!{D2}"
                customActscriptWait 128
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveUp 2
                endActions
                csWait 20
                nextSingleText $80,128  ; "Lightning at the Ancient{N}Tower.{D2}"
                setFacing 128,DOWN
                csWait 30
                setFacing 128,LEFT
                csWait 30
                setFacing 128,RIGHT
                csWait 30
                setFacing 128,DOWN
                csWait 30
                nextSingleText $80,128  ; "Huh?{N}Did I hear something?{D2}"
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $80,128  ; "A sealed door that is open.{N}An unusual storm.{N}Everything is so strange.{D2}"
                csWait 5
                setActscript 128,eas_2xRightLeft
                csWait 60
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $80,128  ; "What?  I feel as if someone{N}is watching me.{N}It must be my nerves.{D2}"
                setFacing 128,UP
                playSound SFX_INTRO_LIGHTNING
                setPos 132,9,11,UP
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                setPos 132,63,63,UP
                csWait 60
                nextSingleText $80,128  ; "I guess it was nothing.{N}I have to get a hold of{N}myself.{D2}"
                headshake 128
                customActscriptWait 128
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActionsWait 128
                 moveUp 1
                endActions
                playSound SFX_INTRO_LIGHTNING
                setPos 132,9,11,UP
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                setPos 132,63,63,UP
                csWait 60
                setFacing 128,DOWN
                csWait 30
                nextSingleText $80,128  ; "What was that?{N}Who's there?!{D2}"
                setActscriptWait 128,eas_DeactivateAutoFacing
                entityActionsWait 128
                 moveUp 1
                endActions
                playSound SFX_INTRO_LIGHTNING
                setPos 132,9,11,UP
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                setPos 132,63,63,UP
                csWait 60
                nextSingleText $80,128  ; "It's not my imagination!{N}Somebody's in this room!{D2}"
                csWait 5
                setActscript 128,eas_2xRightLeft
                csWait 80
                playSound SFX_INTRO_LIGHTNING
                setPos 132,9,11,UP
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                setPos 132,63,63,UP
                csWait 60
                setFacing 128,UP
                setPos 131,9,2,DOWN
                setCamDest 7,1
                csWait 30
                setActscriptWait 128,eas_Init
                setActscriptWait 128,eas_Jump
                setActscriptWait 128,eas_Jump
                nextSingleText $80,128  ; "Hey!{D2}"
                customActscriptWait 128
                 ac_setSpeed 10,10      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setActscriptWait 128,eas_DeactivateAutoFacing
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $80,128  ; "Stay away from me!{D2}"
                setActscriptWait 131,eas_InitSlow
                setActscriptWait 131,eas_DeactivateAutoFacing
                stopEntity 131
                entityActionsWait 131
                 moveRight 1
                 moveDown 1
                 moveRight 1
                 moveDown 1
                endActions
                entityActionsWait 131
                 moveRight 1
                 moveDown 1
                endActions
                startEntity 131
                setCameraEntity 128
                shiver 131
                csWait 30
                shiver 131
                shiver 131
                csWait 20
                entityActionsWait 128
                 moveDown 1
                endActions
                csWait 5
                setActscript 128,eas_2xUpDown
                csWait 30
                nextSingleText $80,128  ; "Somebody...HELP!{D2}"
                setFacing 128,UP
                shiver 131
                csWait 30
                shiver 131
                customActscriptWait 133
                 ac_setSpeed 20,20      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setPos 133,12,5,DOWN
                entityActions 133
                 moveDown 4
                endActions
                entityFlashWhite 133,$50
                waitIdle 133
                setActscript 128,eas_RotateRightHighSpeed
                entityFlashWhite 133,$28
                nextSingleText $80,128  ; "Aughhhh!!!{D2}"
                hide 133
                csWait 30
                setActscript 128,eas_RotateRight
                csWait 50
                entityActionsWait 128
                 faceDown 1
                 moveDown 1
                endActions
                setFacing 128,UP
                customActscriptWait 128
                 ac_motion OFF          ;   
                 ac_orientDown          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                nextSingleText $80,128  ; "(Sigh)....{D2"
                shiver 131
                csWait 30
                playSound SFX_INTRO_LIGHTNING
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                executeSubroutine ApplyStormEffect
                csWait 40
                shiver 131
                csWait 40
                fadeOutToBlackHalf
                csc_end
ce_48FAA:       mainEntity 63,63,UP
                entity 12,6,DOWN,MAPSPRITE_GRANSEAL_KING,eas_Init
                entity 10,7,DOWN,MAPSPRITE_MINISTER,eas_Init
                entity 63,63,RIGHT,MAPSPRITE_SOLDIER1,eas_Init
                entity 63,63,DOWN,MAPSPRITE_GESHP,eas_Init
                entity 63,63,UP,MAPSPRITE_EFFECT6,eas_Init
                entity 63,63,DOWN,MAPSPRITE_EFFECT4,eas_Init
                dc.w $FFFF
