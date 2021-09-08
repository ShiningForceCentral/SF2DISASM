
; ASM FILE data\battles\entries\battle21\cs_beforebattle.asm :
; 0x4B790..0x4B88C : Cutscene before battle 21
bbcs_21:        textCursor 2576
                loadMapFadeIn MAP_OVERWORLD_DEVILS_TAIL,5,18
                loadMapEntities ce_4B84C
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,28,24,LEFT
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,28,22,LEFT
                setPos FOLLOWER_A,28,23,LEFT
                fadeInB
                cameraSpeed $30
                nextText $0,128         ; "(Sniff, sniff)...I smell{N}more invaders from the east.{W2}"
                nextSingleText $0,128   ; "This is the territory of{N}Mr. Creed.{W1}"
                setFacing 128,RIGHT
                setFacing 129,RIGHT
                setFacing 130,RIGHT
                csWait 30
                setCamDest 23,18
                nextSingleText $0,128   ; "Go away!{W1}"
                entityActionsWait ALLY_PETER
                 moveLeft 2
                endActions
                nextText $0,ALLY_PETER  ; "But we have to see him.{W2}"
                nextSingleText $0,ALLY_PETER ; "Please let us pass!{W1}"
                setCamDest 5,18
                entityActionsWait 128
                 moveRight 1
                endActions
                nextSingleText $0,128   ; "No!  Leave now!{W1}"
                csWait 50
                setPos 131,10,24,RIGHT
                csWait 40
                setPos 132,10,20,RIGHT
                csWait 30
                setPos 133,10,22,RIGHT
                csWait 20
                nextSingleText $0,128   ; "Never mind.  Get 'em boys!{W1}"
                setActscript 131,eas_Jump
                setActscript 132,eas_Jump
                setActscriptWait 133,eas_Jump
                csc_end
ce_4B84C:       mainEntity 27,23,LEFT
                entity 28,24,LEFT,ALLY_PETER,eas_Init
                entity 8,22,LEFT,MAPSPRITE_SKELETON,eas_Init
                entity 9,21,LEFT,MAPSPRITE_DARK_CLERIC,eas_Init
                entity 9,23,LEFT,MAPSPRITE_DARK_MADAM,eas_Init
                entity 63,63,RIGHT,MAPSPRITE_ARROW_LAUNCHER,eas_Init
                entity 63,63,RIGHT,MAPSPRITE_HARPY,eas_Init
                entity 63,63,RIGHT,MAPSPRITE_ORC,eas_Init
                dc.w $FFFF
