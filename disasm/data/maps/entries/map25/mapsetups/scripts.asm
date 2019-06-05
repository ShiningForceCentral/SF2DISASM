
; ASM FILE data\maps\entries\map25\mapsetups\scripts.asm :
; 0x5D3B8..0x5D40E : 
cs_5D3B8:       customActscriptWait 133
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setDest ALLY_BOWIE,12,2
                setFacing ALLY_BOWIE,DOWN
                entityActionsWait 133
                 moveRight 5
                endActions
                entityActionsWait 133
                 moveDown 1
                endActions
                entityActionsWait 133
                 moveRight 2
                endActions
                entityActionsWait 133
                 moveUp 1
                endActions
                entityActionsWait 133
                 moveRight 2
                endActions
                headshake ALLY_BOWIE
                setPos 133,25,18,RIGHT
                setPos 135,25,17,RIGHT
                csc_end
