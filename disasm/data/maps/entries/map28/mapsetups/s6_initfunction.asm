
; ASM FILE data\maps\entries\map28\mapsetups\s6_initfunction.asm :
; 0x5F3A0..0x5F3E8 : 

; =============== S U B R O U T I N E =======================================

ms_map28_InitFunction:
                
                rts

	; End of function ms_map28_InitFunction

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
