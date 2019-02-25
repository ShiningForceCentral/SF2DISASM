
; ASM FILE data\maps\entries\map20\mapsetups\scripts_2.asm :
; 0x633C4..0x6343C : 
cs_EndKiss:     hideText
                setCameraEntity $FFFF
                setFacing $0,RIGHT
                customActscriptWait $0
                 ac_setSpeed 8,8        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                csWait 30
                playSound MUSIC_ENDING
                entityActions $0
                 moveUpRight 1
                endActions
                csWait 10
                setActscriptWait $0,eas_461AA
                csWait 80
                entityActions $0
                 moveRight 1
                endActions
                csWait 10
                setActscriptWait $0,eas_461AA
                stopEntity $0
                csWait 50
                customActscriptWait $0
                 ac_setSpeed 4,4        ;   
                 ac_jump eas_Idle       ;   
                ac_end
                entityActions $0
                 moveRight 1
                endActions
                csWait 16
                setActscriptWait $0,eas_461AA
                csWait 120
                executeSubroutine j_EndKiss
                csc_end
