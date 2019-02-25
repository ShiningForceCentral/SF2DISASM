
; ASM FILE data\maps\entries\map28\mapsetups\scripts.asm :
; 0x5F3A2..0x5F3E8 : 
cs_5F3A2:       setActscriptWait $0,eas_Init
                setActscriptWait $0,eas_Jump
                csWait 2
                playSound SFX_FALLING
                entityActionsWait $0
                 moveDownRight 1
                endActions
                csWait 2
                csc_end
cs_5F3C4:       setActscriptWait $0,eas_Init
                csWait 2
                setActscriptWait $0,eas_Jump
                csWait 2
                playSound SFX_FALLING
                entityActionsWait $0
                 moveDownLeft 1
                endActions
                csWait 2
                csc_end
