
; ASM FILE data\maps\entries\map40\mapsetups\scripts.asm :
; 0x53FE0..0x53FFE : 
cs_53FE0:       textCursor 997
                shiver ALLY_LEMON
                nextText $0,ALLY_LEMON  ; "Oh....{N}Go and save her....{W2}"
                nextText $0,ALLY_LEMON  ; "Sir Astral was right....{N}That's not my King.{N}That's a devil!{W2}"
                nextSingleText $0,ALLY_LEMON ; "Me?  I'm almost a goner.{N}A strange black cloud{N}enveloped me...(cough)....{W1}"
                shiver ALLY_LEMON
                stopEntity ALLY_LEMON
                csc_end
