
; ASM FILE data\maps\entries\map16\mapsetups\scripts.asm :
; 0x51F88..0x52284 : 
cs_51F88:       textCursor 962
                nextSingleText $C0,128  ; "Listen, everybody!{N}We're going to Granseal!{W1}"
                setFacing ALLY_SLADE,DOWN
                setFacing ALLY_BOWIE,DOWN
                setCamDest 12,11
                nextSingleText $C0,ALLY_SLADE ; "We're too late!{W1}"
                nextText $C0,128        ; "As you may know, my{N}messenger was killed!{W2}"
                nextText $C0,128        ; "Granseal must have done{N}this.{W2}"
                nextSingleText $C0,128  ; "So we're invading them to{N}retaliate!{W1}"
                nextSingleText $FF,255  ; "Murmur...murmur....{W1}"
                csWait 20
                setFacing ALLY_LEMON,RIGHT
                csWait 20
                setFacing ALLY_LEMON,LEFT
                csWait 20
                setDest ALLY_LEMON,16,17
                nextText $0,ALLY_LEMON  ; "Quiet!  Everybody listen{N}to me!{W1}"
                nextText $0,ALLY_LEMON  ; "I also don't understand{N}this march!{W2}"
                nextText $0,ALLY_LEMON  ; "But, King Galam must{N}have a good reason!{W2}"
                nextText $0,ALLY_LEMON  ; "I believe the King!{N}How about you?{N}Anyone disagree?{W1}"
                csWait 5
                setActscript ALLY_LEMON,eas_2xRightLeft
                csWait 60
                nextSingleText $0,ALLY_LEMON ; "No?  Good!{W1}"
                setFacing ALLY_LEMON,DOWN
                csWait 20
                setFacing ALLY_LEMON,UP
                csWait 20
                setDest ALLY_LEMON,16,16
                setFacing ALLY_LEMON,RIGHT
                setFacing 128,LEFT
                csWait 20
                setFacing ALLY_LEMON,DOWN
                nextSingleText $C0,128  ; "Well done, {NAME;28}.{W1}"
                setFacing 128,DOWN
                nextSingleText $0,ALLY_LEMON ; "King Galam, victory is{N}ours!{W1}"
                nextSingleText $C0,128  ; "Guards!{N}Open the gate!{N}Lower the bridge!{W1}"
                csWait 30
                playSound SFX_BIG_DOOR_RUMBLE
                csWait 150
                setFacing 128,LEFT
                nextSingleText $C0,128  ; "{NAME;28}, prove your{N}allegiance.{W1}"
                setFacing ALLY_LEMON,RIGHT
                nextSingleText $0,ALLY_LEMON ; "What do you mean?{W1}"
                nextSingleText $C0,128  ; "Show no mercy!{W1}"
                nextSingleText $0,ALLY_LEMON ; "My Lord...{W1}"
                nextSingleText $C0,128  ; "Now, go!{W1}"
                setFacing 128,DOWN
                setFacing ALLY_LEMON,DOWN
                csWait 20
                setCamDest 12,18
                setDest 128,17,23
                setDest ALLY_LEMON,17,17
                setDest ALLY_LEMON,17,22
                setDest ALLY_LEMON,18,24
                setFacing 128,UP
                setFacing ALLY_LEMON,UP
                setFacing 129,DOWN
                setFacing 130,DOWN
                setFacing 131,DOWN
                setFacing 132,DOWN
                setFacing 133,DOWN
                setFacing 134,DOWN
                setFacing 135,DOWN
                setFacing 136,DOWN
                setFacing 137,DOWN
                setFacing 138,DOWN
                setFacing 139,DOWN
                setFacing 140,DOWN
                setFacing 141,DOWN
                setFacing 142,DOWN
                setFacing 143,DOWN
                setFacing 144,DOWN
                nextSingleText $0,128   ; "Crush Granseal!{W1}"
                entityActions ALLY_LEMON
                 moveDown 7
                endActions
                entityActions 128
                 moveDown 7
                endActions
                entityActions 129
                 moveDown 7
                endActions
                entityActions 130
                 moveDown 7
                endActions
                entityActions 131
                 moveDown 7
                endActions
                entityActions 132
                 moveDown 7
                endActions
                entityActions 133
                 moveDown 7
                endActions
                entityActions 134
                 moveDown 7
                endActions
                entityActions 135
                 moveDown 7
                endActions
                entityActions 136
                 moveDown 7
                endActions
                entityActions 137
                 moveDown 7
                endActions
                entityActions 138
                 moveDown 7
                endActions
                entityActions 139
                 moveDown 7
                endActions
                entityActions 140
                 moveDown 7
                endActions
                entityActions 141
                 moveDown 7
                endActions
                entityActions 142
                 moveDown 7
                endActions
                entityActions 143
                 moveDown 7
                endActions
                entityActions 144
                 moveDown 7
                endActions
                setFacing ALLY_SLADE,DOWN
                setFacing ALLY_BOWIE,DOWN
                setCamDest 12,5
                hide ALLY_LEMON
                hide 128
                hide 129
                hide 130
                hide 131
                hide 132
                hide 133
                hide 134
                hide 135
                hide 136
                hide 137
                hide 138
                hide 139
                hide 140
                hide 141
                hide 142
                hide 143
                hide 144
                nextText $C0,ALLY_SLADE ; "They've gone.{N}The war begins.{W1}"
                setFacing ALLY_SLADE,LEFT
                setFacing ALLY_BOWIE,RIGHT
                nextText $C0,ALLY_SLADE ; "So, what should we do?{N}Are you still going to{N}Granseal?{W1}"
                nextText $C0,ALLY_SLADE ; "You're serious?{N}Do you think you can stop{N}the war?{W2}"
                nextSingleText $0,ALLY_SLADE ; "I will leave you once I'm{N}outside the gate!{W1}"
                csc_end
cs_521BA:       textCursor 986
                setPos 146,17,16,UP
                setPos 147,17,15,DOWN
                nextSingleText $0,145   ; "You!{W1}"
                setCamDest 0,17
                nextSingleText $0,145   ; "How did you get out?{W1}"
                setActscriptWait ALLY_SLADE,eas_Init
                setActscriptWait ALLY_BOWIE,eas_Init
                setDest ALLY_BOWIE,3,19
                setDest ALLY_SLADE,4,19
                nextSingleText $0,ALLY_SLADE ; "I...{W1}"
                nextSingleText $0,146   ; "Wow, great jewel!{W1}"
                setCamDest 12,10
                nextSingleText $0,147   ; "Oh, this?{N}The King gave it to me!{W1}"
                nextSingleText $0,146   ; "Because you captured that{N}rat?{W1}"
                setCamDest 0,13
                setFacing ALLY_BOWIE,RIGHT
                setFacing ALLY_SLADE,LEFT
                nextText $0,147         ; "Yes.  I presented them to{N}King Galam.{W2}"
                nextSingleText $0,147   ; "He was so kind to give me{N}one of the pair, the Jewel{N}of Light!{W1}"
                entityActions ALLY_BOWIE
                 moveRight 1
                endActions
                entityActionsWait ALLY_SLADE
                 moveRight 1
                endActions
                nextSingleText $0,145   ; "Wait!{W1}"
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_SLADE,DOWN
                setCamDest 0,18
                nextSingleText $0,145   ; "How did you escape?{W1}"
                setFacing ALLY_BOWIE,RIGHT
                setFacing ALLY_SLADE,LEFT
                csWait 20
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_SLADE,DOWN
                setDest 145,9,23
                setActscriptWait 145,eas_Jump
                setActscriptWait 145,eas_Jump
                nextSingleText $0,145   ; "Intruders!  Intruders!{N}Arrest them!{W1}"
                setStoryFlag 5          ; Battle 5 unlocked - BATTLE_GALAM_CASTLE              
cs_5227C:       warp MAP_GALAM_CASTLE,0,0,RIGHT
                csc_end
