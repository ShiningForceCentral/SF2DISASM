
; ASM FILE data\maps\entries\map25\mapsetups\scripts.asm :
; 0x5D3B8..0x5D40E : 
cs_5D3B8:       customActscriptWait $85
                 ac_setSpeed 64,64      ;   
                 ac_jump eas_Idle       ;   
                ac_end
                setDest $0,12,2
                setFacing $0,DOWN
                entityActionsWait $85
                 moveRight 5
                endActions
                entityActionsWait $85
                 moveDown 1
                endActions
                entityActionsWait $85
                 moveRight 2
                endActions
                entityActionsWait $85
                 moveUp 1
                endActions
                entityActionsWait $85
                 moveRight 2
                endActions
                headshake $0
                setPos $85,25,18,RIGHT
                setPos $87,25,17,RIGHT
                csc_end
