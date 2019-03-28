
; ASM FILE data\battles\entries\battle21\cs_beforebattle.asm :
; 0x4B790..0x4B88C : Cutscene before battle 21
bbcs_21:        textCursor $A10
                loadMapFadeIn 67,5,18
                loadMapEntities ce_4B84C
                setActscriptWait $0,eas_Init
                setActscriptWait $7,eas_Init
                setPos $7,28,24,LEFT
                setActscriptWait $1F,eas_Init
                setPos $1F,28,22,LEFT
                setPos $1E,28,23,LEFT
                fadeInB
                cameraSpeed $30
                nextText $0,$80         ; "(Sniff, sniff)...I smell{N}more invaders from the east.{W2}"
                nextSingleText $0,$80   ; "This is the territory of{N}Mr. Creed.{W1}"
                setFacing $80,RIGHT
                setFacing $81,RIGHT
                setFacing $82,RIGHT
                csWait 30
                setCamDest 23,18
                nextSingleText $0,$80   ; "Go away!{W1}"
                entityActionsWait $7
                 moveLeft 2
                endActions
                nextText $0,$7          ; "But we have to see him.{W2}"
                nextSingleText $0,$7    ; "Please let us pass!{W1}"
                setCamDest 5,18
                entityActionsWait $80
                 moveRight 1
                endActions
                nextSingleText $0,$80   ; "No!  Leave now!{W1}"
                csWait 50
                setPos $83,10,24,RIGHT
                csWait 40
                setPos $84,10,20,RIGHT
                csWait 30
                setPos $85,10,22,RIGHT
                csWait 20
                nextSingleText $0,$80   ; "Never mind.  Get 'em boys!{W1}"
                setActscript $83,eas_Jump
                setActscript $84,eas_Jump
                setActscriptWait $85,eas_Jump
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
