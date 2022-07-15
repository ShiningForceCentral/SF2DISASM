
; ASM FILE data\battles\entries\battle06\cs_beforebattle.asm :
; 0x49BCA..0x49CE2 : Cutscene before battle 6
bbcs_06:        textCursor 2342
                loadMapFadeIn MAP_OVERWORLD_GRANS_GRANSEAL,25,5
                loadMapEntities ce_49CBA
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_SLADE,eas_Init
                setActscriptWait 128,eas_Init
                setActscriptWait 129,eas_Init
                setActscriptWait 130,eas_Init
                playSound MUSIC_MAIN_THEME
                fadeInB
                nextSingleText $0,129   ; "Halt!{W1}"
                setActscript ALLY_SLADE,eas_Jump
                setActscriptWait ALLY_BOWIE,eas_Jump
                setCamDest 31,9
                nextSingleText $0,129   ; "How did you get past the{N}Galam guards?{W1}"
                nextSingleText $0,130   ; "No one is allowed to leave{N}'til we conquer Granseal!{W1}"
                nextSingleText $C0,ALLY_SLADE ; "I know...ah...but...{N}King Galam...left this{N}behind.{W1}"
                setFacing 129,DOWN
                headshake 130
                setFacing 129,LEFT
                nextSingleText $0,129   ; "And you want to bring it to{N}him?  Hmmmm.  I don't know....{W1}"
                entityActionsWait 128
                 moveUp 5
                endActions
                setFacing 128,RIGHT
                nextSingleText $0,128   ; "What's going on here?{W1}"
                setFacing 130,LEFT
                nextSingleText $0,130   ; "They want to deliver a{N}package to the King.{W1}"
                setFacing 128,UP
                csWait 30
                setFacing 128,RIGHT
                nextText $0,128         ; "To King Galam?  It sounds{N}important.{W2}"
                nextSingleText $0,128   ; "But he has not rescinded{N}his orders yet....{N}I had better deliver it.{W1}"
                setFacing 128,UP
                nextSingleText $0,128   ; "I'll get the package from{N}them.{W1}"
                nextSingleText $C0,ALLY_SLADE ; "I think we're in trouble!{W1}"
                setCameraEntity 128
                entityActionsWait 128
                 moveLeft 2
                 moveUp 4
                endActions
                nextSingleText $0,128   ; "Hand it over.{N}I'll deliver it to...?{N}You!!!{W1}"
                setCameraEntity 65535
                setActscriptWait 128,eas_DeactivateAutoFacing
                entityActionsWait 128
                 moveDown 1
                endActions
                nextSingleText $0,128   ; "How did you escape from{N}jail?!{W1}"
                setActscriptWait 128,eas_Init
                setFacing 128,DOWN
                nextSingleText $0,128   ; "Hey, these are the Granseal{N}spies!{W1}"
                nextSingleText $C0,ALLY_SLADE ; "Oops!  That didn't work!{W1}"
                setStoryFlag 7          ; Battle 7 unlocked - BATTLE_VERSUS_DARK_SMOKES        
                csc_end
ce_49CBA:       mainEntity 30,9,DOWN
                entity 29,8,DOWN,ALLY_SLADE,eas_Init
                entity 32,20,UP,MAPSPRITE_GALAM_SOLDIER,eas_Init
                entity 36,13,LEFT,MAPSPRITE_GALAM_SOLDIER,eas_Init
                entity 37,14,UP,MAPSPRITE_GALAM_ARCHER,eas_Init
                dc.w $FFFF
