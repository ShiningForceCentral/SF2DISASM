
; ASM FILE data\battles\entries\battle11\cs_beforebattle.asm :
; 0x4ABFE..0x4ACC8 : Cutscene before battle 11
bbcs_11:        textCursor $9B3
                setCameraEntity $0
                loadMapFadeIn 48,8,19
                loadMapEntities ce_4ACA0
                setActscriptWait $0,eas_Init
                setCameraEntity $0
                executeSubroutine sub_458E
                fadeInB
                playSound $FD
                entityActionsWait $7
                 moveLeft 1
                 moveUp 1
                endActions
                nextSingleText $0,$7    ; "You'll come to the foot of{N}Mt. Volcano through this{N}dark cave.{W2}"
                setFacing $7,RIGHT
                setFacing $0,LEFT
                nextSingleText $0,$7    ; "But, I heard this cave is{N}home to a hobgoblin.{W1}"
                csWait 20
                nextSingleText $0,$80   ; "Yes, it is!{W1}"
                playSound MUSIC_ENEMY_ATTACK
                entityActionsWait $7
                 moveUp 1
                endActions
                csWait 5
                setActscript $0,eas_461B6
                csWait 5
                setActscript $7,eas_461E4
                csWait 120
                setFacing $0,UP
                entityActionsWait $7
                 moveUp 1
                endActions
                nextSingleText $0,$7    ; "Wh...Who said that?{W1}"
                nextSingleText $0,$80   ; "Me!  The hobgoblin!{W1}"
                cameraSpeed $20
                setCameraEntity $80
                nextSingleText $0,$80   ; "Welcome to my home.{W2}"
                entityActionsWait $80
                 moveDown 1
                endActions
                nextSingleText $0,$80   ; "Enjoy your visit because{N}you're not leaving!{W1}"
                playSound $FD
                csc_end
ce_4ACA0:       mainEntity 15,24,UP
                entity 15,25,UP,ALLY_PETER,eas_Init
                entity 15,3,DOWN,MAPSPRITE_HOBGOBLIN,eas_Init
                entity 16,4,DOWN,MAPSPRITE_VAMPIRE_BAT,eas_Init
                entity 14,4,DOWN,MAPSPRITE_WITCH,eas_Init
                dc.w $FFFF
