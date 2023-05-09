
; ASM FILE data\battles\entries\battle37\cs_beforebattle.asm :
; 0x4DA66..0x4DB94 : Cutscene before battle 37
bbcs_37:        textCursor 2956
                loadMapFadeIn MAP_OVERWORLD_GRANS_AROUND_DWARF_VILLAGE,50,33
                loadMapEntities ce_4DB74
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,56,37,LEFT
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,56,35,LEFT
                setPos FOLLOWER_A,56,36,LEFT
                jumpIfFlagClear 76,cs_4DAB8 ; Zynk is a follower
                setActscriptWait ALLY_ZYNK,eas_Init
                setPos ALLY_ZYNK,63,62,DOWN
cs_4DAB8:       fadeInB
                nextSingleText $0,128   ; "Now you shall pay for killing{N}my precious Prism Flowers.{W1}"
                setActscript ALLY_BOWIE,eas_Jump
                setActscriptWait ALLY_PETER,eas_Jump
                setFacing ALLY_BOWIE,DOWN
                setFacing ALLY_PETER,DOWN
                setFacing FOLLOWER_B,DOWN
                cameraSpeed $30
                nextSingleText $C0,FOLLOWER_B ; "Geshp again.{W1}"
                setCamDest 40,44
                animEntityFX 128,6
                setPos 128,45,47,UP
                animEntityFX 128,7
                nextSingleText $0,128   ; "Hee, hee, hee.{W1}"
                nextSingleText $C0,ALLY_PETER ; "Do you have another cunning{N}trap for us?{W1}"
                nextText $0,128         ; "Would I do that?{W2}"
                nextSingleText $0,128   ; "I just want to introduce you{N}to my friend.{W1}"
                setFacing 128,DOWN
                nextSingleText $0,128   ; "Red Baron, say hello!{W1}"
                setCamDest 30,54
                setActscriptWait 129,eas_Jump
                setActscriptWait 129,eas_Jump
                nextSingleText $0,129   ; "Grruuooouu!{W1}"
                nextText $0,128         ; "He's waiting for you just{N}outside the Galam gate.{W2}"
                nextText $0,128         ; "You have to defeat him if you{N}want to advance.{W2}"
                nextText $0,128         ; "See his red armor?{N}It's smeared with blood.{W2}"
                nextSingleText $0,128   ; "He has killed many people.{W1}"
                setCamDest 40,44
                setFacing 128,UP
                nextText $0,128         ; "Now, it's your turn.{W2}"
                nextSingleText $0,128   ; "This will be your undoing.{W1}"
                animEntityFX 128,6
                setCamDest 50,33
                setFacing ALLY_PETER,UP
                nextSingleText $C0,ALLY_PETER ; "Galam is just over there,{N}but...{W1}"
                setFacing FOLLOWER_B,DOWN
                setFacing ALLY_BOWIE,RIGHT
                nextSingleText $C0,FOLLOWER_B ; "We have to advance.{N}{LEADER}, are you ready?{W1}"
                nod ALLY_BOWIE
                csc_end
ce_4DB74:       mainEntity 55,36,LEFT
                entity 56,37,LEFT,ALLY_PETER,eas_Init
                entity 63,63,UP,MAPSPRITE_GESHP,eas_Init
                entity 35,60,UP,MAPSPRITE_RED_BARON,eas_Init
                dc.w $FFFF
