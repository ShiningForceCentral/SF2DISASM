
; ASM FILE data\maps\entries\map18\mapsetups\scripts.asm :
; 0x6143C..0x61488 : 
cs_6143C:       textCursor 879
                setActscriptWait ALLY_ZYNK,eas_Init
                moveNextToPlayer ALLY_ZYNK,RIGHT
                setFacing ALLY_BOWIE,RIGHT
                csWait 20
                nextSingleText $0,ALLY_ZYNK ; "Sorry, {LEADER}.{N}I'm going back to Roft.{N}I'm worried about Petro.{W1}"
                csWait 30
                entityActionsWait ALLY_ZYNK
                 moveUp 4
                endActions
                setFacing ALLY_BOWIE,UP
                setFacing ALLY_PETER,UP
                setFacing FOLLOWER_B,UP
                setFacing ALLY_ZYNK,DOWN
                csWait 30
                nod ALLY_ZYNK
                csWait 20
                entityActionsWait ALLY_ZYNK
                 moveUp 4
                endActions
                hide ALLY_ZYNK
                csc_end
