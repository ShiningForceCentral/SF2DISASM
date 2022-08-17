
; ASM FILE data\maps\entries\map26\mapsetups\scripts.asm :
; 0x59F20..0x59F42 : 
cs_59F20:       textCursor 1740
                setCamDest 0,20
                nextSingleText $0,129   ; "Ungh!{W2}"
                csWait 50
                nextSingleText $0,129   ; "It's too heavy. I can't{N}lift it.  I give up!{W1}"
                entityActionsWait 129
                 moveUp 8
                endActions
                hide 129
                csc_end
