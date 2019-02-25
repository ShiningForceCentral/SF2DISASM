
; ASM FILE data\maps\entries\map26\mapsetups\scripts.asm :
; 0x59F20..0x59F42 : 
cs_59F20:       textCursor $6CC
                setCamDest 0,20
                nextSingleText $0,$81   ; "Ungh!{W2}"
                csWait 50
                nextSingleText $0,$81   ; "It's too heavy. I can't{N}lift it.  I give up!{W1}"
                entityActionsWait $81
                 moveUp 8
                endActions
                hide $81
                csc_end
