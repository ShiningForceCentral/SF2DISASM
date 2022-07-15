
; ASM FILE data\battles\entries\battle32\cs_beforebattle.asm :
; 0x4CBE2..0x4CD10 : Cutscene before battle 32
bbcs_32:        textCursor 2845
                loadMapFadeIn MAP_OVERWORLD_MOUN_AND_MITULA,10,38
                loadMapEntities ce_4CCC0
                setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_PETER,eas_Init
                setPos ALLY_PETER,16,45,UP
                setActscriptWait FOLLOWER_B,eas_Init
                setPos FOLLOWER_B,14,45,UP
                setActscriptWait ALLY_FRAYJA,eas_Init
                setPos ALLY_FRAYJA,15,46,UP
                setActscriptWait FOLLOWER_A,eas_Init
                setPos FOLLOWER_A,15,45,UP
                fadeInB
                cameraSpeed $30
                entityActions ALLY_BOWIE
                 moveUp 3
                endActions
                entityActions ALLY_PETER
                 moveUp 3
                endActions
                entityActions FOLLOWER_B
                 moveUp 3
                endActions
                entityActions FOLLOWER_A
                 moveUp 3
                endActions
                entityActionsWait ALLY_FRAYJA
                 moveUp 3
                endActions
                nextSingleText $0,128   ; "I heard about you from{N}Geshp.{W1}"
                setCamDest 10,18
                nextText $0,128         ; "He ordered me to take out{N}some of your people.{W2}"
                nextSingleText $0,128   ; "But, it's not enough.{N}This is the end of your{N}resistance.{W1}"
                setFacing 128,LEFT
                csWait 30
                setFacing 128,RIGHT
                csWait 30
                setFacing 128,UP
                csWait 30
                setFacing 128,DOWN
                nextSingleText $0,128   ; "Kill them, kill them all!{W1}"
                setActscript 129,eas_Jump
                setActscript 130,eas_Jump
                setActscript 131,eas_Jump
                setActscript 132,eas_Jump
                setActscript 133,eas_Jump
                setActscriptWait 134,eas_Jump
                csc_end
ce_4CCC0:       mainEntity 15,44,UP
                entity 16,45,UP,ALLY_PETER,eas_Init
                entity 15,46,UP,ALLY_FRAYJA,eas_Init
                entity 14,21,DOWN,MAPSPRITE_DEATH_ARCHER,eas_Init
                entity 12,21,DOWN,MAPSPRITE_NECROMANCER,eas_Init
                entity 13,20,DOWN,MAPSPRITE_DEATH_MONK,eas_Init
                entity 16,22,DOWN,MAPSPRITE_PEGASUS_KNIGHT,eas_Init
                entity 14,24,DOWN,MAPSPRITE_DEVIL_SOLDIER,eas_Init
                entity 16,24,DOWN,MAPSPRITE_CERBERUS,eas_Init
                entity 18,23,DOWN,MAPSPRITE_NECROMANCER,eas_Init
                dc.w $FFFF
