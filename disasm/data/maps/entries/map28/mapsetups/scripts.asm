
; ASM FILE data\maps\entries\map28\mapsetups\scripts.asm :
; 0x5F3A2..0x5F3E8 : 
cs_5F3A2:       setActscriptWait ALLY_BOWIE,eas_Init
                setActscriptWait ALLY_BOWIE,eas_Jump
                csWait 2
                playSound SFX_FALLING
                entityActionsWait ALLY_BOWIE
                 moveDownRight 1
                endActions
                csWait 2
                csc_end
cs_5F3C4:       setActscriptWait ALLY_BOWIE,eas_Init
                csWait 2
                setActscriptWait ALLY_BOWIE,eas_Jump
                csWait 2
                playSound SFX_FALLING
                entityActionsWait ALLY_BOWIE
                 moveDownLeft 1
                endActions
                csWait 2
                csc_end
