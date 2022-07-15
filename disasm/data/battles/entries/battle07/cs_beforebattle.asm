
; ASM FILE data\battles\entries\battle07\cs_beforebattle.asm :
; 0x49CE2..0x49F7E : Cutscene before battle 7
bbcs_07:        textCursor 2357
                clearF 83               ; King + Minister are followers
                loadMapFadeIn MAP_ANCIENT_TOWER_UNDERGROUND_ROOM,8,29
                loadMapEntities ce_49F36
                setActscriptWait ALLY_BOWIE,eas_Init
                animEntityFX 133,4
                fadeInB
                cameraSpeed $28
                nextSingleText $C0,128  ; "Astral, you're so persistent!{W1}"
                setCamDest 8,15
                nextSingleText $0,129   ; "King Galam, what do you{N}intend to do?{W1}"
                nextSingleText $C0,128  ; "You wouldn't understand.{W1}"
                nextSingleText $0,131   ; "Astral, save her!{W1}"
                setCamDest 8,13
                nextSingleText $0,130   ; "Father!{W1}"
                entityActionsWait 130
                 moveDown 1
                endActions
                csWait 40
                setFacing 128,UP
                csWait 20
                setActscriptWait 130,eas_Jump
                csWait 30
                setActscriptWait 130,eas_DeactivateAutoFacing
                entityActionsWait 130
                 moveUp 1
                endActions
                setFacing 128,DOWN
                setFacing 129,DOWN
                nextSingleText $0,129   ; "King Granseal and{N}{LEADER}!{W1}"
                nextText $C0,128        ; "Blast!{W2}"
                nextSingleText $C0,128  ; "Give up now, King Granseal!{N}Do you want her to die?!{W1}"
                setCamDest 8,15
                setFacing 129,UP
                nextText $0,129         ; "No!  You give up!{N}We've got reinforcements!{W2}"
                nextSingleText $0,129   ; "Your great magic cannot{N}defeat all of our soldiers!{W1}"
                nextSingleText $C0,128  ; "I'll kill you before they{N}have a chance to attack!{W1}"
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $0,129   ; "Just try it!{W1}"
                entityActionsWait 129
                 moveUp 1
                endActions
                setActscriptWait 128,eas_BumpDown
                setQuake 2
                playSound SFX_LIGHTNING_1
                setActscriptWait 129,eas_BumpUp
                setQuake 0
                csWait 50
                setActscript 128,eas_BumpDown
                setQuake 3
                playSound SFX_LIGHTNING_2
                setActscriptWait 129,eas_BumpUp
                setQuake 0
                setActscript 129,eas_Jump
                nod 128
                setActscriptWait 129,eas_BumpDown
                setQuake 2
                playSound SFX_DOOR_OPEN
                setActscriptWait 128,eas_BumpUp
                setQuake 0
                csWait 40
                setActscript 128,eas_BumpDown
                setQuake 3
                playSound SFX_HIT_2
                setActscriptWait 129,eas_BumpUp
                setQuake 0
                setActscript 128,eas_Jump
                nod 129
                setActscriptWait 128,eas_DeactivateAutoFacing
                setActscriptWait 129,eas_DeactivateAutoFacing
                csWait 30
                entityActions 128
                 moveUp 1
                endActions
                entityActionsWait 129
                 moveDown 1
                endActions
                nextSingleText $C0,128  ; "Astral...{W1}"
                nextSingleText $0,129   ; "Gguuu....{W1}"
                stopEntity 128
                stopEntity 129
                customActscriptWait 128
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                customActscriptWait 129
                 ac_motion OFF          ;   
                 ac_orientLeft          ;   
                 ac_updateSprite        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setFacing 128,UP
                nextSingleText $C0,128  ; "I've beaten you!{N}You've lost!{W1}"
                nextText $0,129         ; "But, so have you!{N}Or had you not noticed?{W2}"
                nextSingleText $0,129   ; "You cannot move.{N}Princess Elis, run away!{W1}"
                setCamDest 8,13
                nextSingleText $0,130   ; "I'll try.{W1}"
                customActscriptWait 130
                 ac_setSpeed 48,48      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions 130
                 moveDown 3
                endActions
                csWait 10
                setPos 133,12,18,UP
                animEntityFX 133,5
                waitIdle 130
                nextSingleText $0,133   ; "Stop, my dear!{W1}"
                setActscriptWait 130,eas_Jump
                nextSingleText $0,130   ; "Oh!{W1}"
                entityActionsWait 130
                 moveUp 2
                endActions
                setCamDest 8,15
                nextSingleText $C0,128  ; "Hee, hee, hee...{N}I won't lose her now.{W1}"
                nextText $0,129         ; "What should I do?{N}{LEADER}, can you hear{N}me?{W1}"
                nextSingleText $0,129   ; "Save her.{W1}"
                shiver 128
                stopEntity 128
                nextSingleText $C0,128  ; "I've no time to play with{N}these kids.{N}Devils!  I summon thee!{W1}"
                setPos 134,14,18,DOWN
                csWait 40
                setPos 135,15,18,DOWN
                setFacing 133,DOWN
                nextSingleText $0,134   ; "Yeeeeee!{W1}"
                nextText $C0,128        ; "Forget about Astral.{N}"
                nextText $C0,128        ; "I'll kill him!{W2}"
                nextSingleText $C0,128  ; "Eat them all up before{N}they reach her!{W1}"
                setActscript 133,eas_Jump
                setActscript 134,eas_Jump
                setActscriptWait 135,eas_Jump
                csc_end
ce_49F36:       mainEntity 13,35,UP
                entity 13,17,DOWN,MAPSPRITE_GALAM_EVIL,eas_Init
                entity 13,21,UP,MAPSPRITE_ASTRAL,eas_Init
                entity 12,14,DOWN,MAPSPRITE_ELIS,eas_Init
                entity 12,35,UP,MAPSPRITE_GRANSEAL_KING,eas_Init
                entity 14,35,UP,MAPSPRITE_MINISTER,eas_Init
                entity 63,63,UP,MAPSPRITE_GALAM_MAGE,eas_Init
                entity 63,63,DOWN,MAPSPRITE_GALAM_ARCHER,eas_Init
                entity 63,63,DOWN,MAPSPRITE_GALAM_KNIGHT,eas_Init
                dc.w $FFFF
