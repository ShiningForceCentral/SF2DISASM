
; ASM FILE data\battles\entries\battle06\cs_beforebattle.asm :
; 0x49BCA..0x49CE2 : Cutscene before battle 6
bbcs_06:        textCursor $926
                loadMapFadeIn 66,25,5
                loadMapEntities ce_49CBA
                setActscriptWait $0,eas_Init
                setActscriptWait $5,eas_Init
                setActscriptWait $80,eas_Init
                setActscriptWait $81,eas_Init
                setActscriptWait $82,eas_Init
                playSound MUSIC_MAIN_THEME
                fadeInB
                nextSingleText $0,$81   ; "Halt!{W1}"
                setActscript $5,eas_Jump
                setActscriptWait $0,eas_Jump
                setCamDest 31,9
                nextSingleText $0,$81   ; "How did you get past the{N}Galam guards?{W1}"
                nextSingleText $0,$82   ; "No one is allowed to leave{N}'til we conquer Granseal!{W1}"
                nextSingleText $C0,$5   ; "I know...ah...but...{N}King Galam...left this{N}behind.{W1}"
                setFacing $81,DOWN
                headshake $82
                setFacing $81,LEFT
                nextSingleText $0,$81   ; "And you want to bring it to{N}him?  Hmmmm.  I don't know....{W1}"
                entityActionsWait $80
                 moveUp 5
                endActions
                setFacing $80,RIGHT
                nextSingleText $0,$80   ; "What's going on here?{W1}"
                setFacing $82,LEFT
                nextSingleText $0,$82   ; "They want to deliver a{N}package to the King.{W1}"
                setFacing $80,UP
                csWait 30
                setFacing $80,RIGHT
                nextText $0,$80         ; "To King Galam?  It sounds{N}important.{W2}"
                nextSingleText $0,$80   ; "But he has not rescinded{N}his orders yet....{N}I had better deliver it.{W1}"
                setFacing $80,UP
                nextSingleText $0,$80   ; "I'll get the package from{N}them.{W1}"
                nextSingleText $C0,$5   ; "I think we're in trouble!{W1}"
                setCameraEntity $80
                entityActionsWait $80
                 moveLeft 2
                 moveUp 4
                endActions
                nextSingleText $0,$80   ; "Hand it over.{N}I'll deliver it to...?{N}You!!!{W1}"
                setCameraEntity $FFFF
                setActscriptWait $80,eas_46172
                entityActionsWait $80
                 moveDown 1
                endActions
                nextSingleText $0,$80   ; "How did you escape from{N}jail?!{W1}"
                setActscriptWait $80,eas_Init
                setFacing $80,DOWN
                nextSingleText $0,$80   ; "Hey, these are the Granseal{N}spies!{W1}"
                nextSingleText $C0,$5   ; "Oops!  That didn't work!{W1}"
                setStoryFlag $7         ; Battle 7 unlocked
                csc_end
ce_49CBA:       mainEntity 30,9,DOWN
                entity 29,8,DOWN,MAPSPRITE_CHESTER_BASE,eas_Init
                entity 32,20,UP,MAPSPRITE_GALAM_SOLDIER,eas_Init
                entity 36,13,LEFT,MAPSPRITE_GALAM_SOLDIER,eas_Init
                entity 37,14,UP,MAPSPRITE_GALAM_ARCHER,eas_Init
                dc.w $FFFF
