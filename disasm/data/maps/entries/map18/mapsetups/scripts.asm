
; ASM FILE data\maps\entries\map18\mapsetups\scripts.asm :
; 0x6143C..0x61488 : 
cs_6143C:       textCursor $36F
                setActscriptWait $1A,eas_Init
                moveNextToPlayer $1A,RIGHT
                setFacing $0,RIGHT
                csWait 20
                nextSingleText $0,$1A   ; "Sorry, {LEADER}.{N}I'm going back to Roft.{N}I'm worried about Petro.{W1}"
                csWait 30
                entityActionsWait $1A
                 moveUp 4
                endActions
                setFacing $0,UP
                setFacing $7,UP
                setFacing $1F,UP
                setFacing $1A,DOWN
                csWait 30
                nod $1A
                csWait 20
                entityActionsWait $1A
                 moveUp 4
                endActions
                hide $1A
                csc_end
