
; ASM FILE data\maps\entries\map20\mapsetups\scripts_2.asm :
; 0x633C4..0x6343C : 
cs_EndKiss:     hideText
                setCameraEntity 65535
                setFacing ALLY_BOWIE,RIGHT
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 30
                playSound MUSIC_ENDING
                entityActions ALLY_BOWIE
                 moveUpRight 1
                endActions
                csWait 10
                setActscriptWait ALLY_BOWIE,eas_StopMoving
                csWait 80
                entityActions ALLY_BOWIE
                 moveRight 1
                endActions
                csWait 10
                setActscriptWait ALLY_BOWIE,eas_StopMoving
                stopEntity ALLY_BOWIE
                csWait 50
                customActscriptWait ALLY_BOWIE
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions ALLY_BOWIE
                 moveRight 1
                endActions
                csWait 16
                setActscriptWait ALLY_BOWIE,eas_StopMoving
                csWait 120
                executeSubroutine j_PlayEndKiss
                csc_end
