
; ASM FILE data\maps\entries\map40\mapsetups\scripts.asm :
; 0x53FE0..0x53FFE : 
cs_53FE0:       textCursor $3E5
                shiver $1C
                nextText $0,$1C         ; "Oh....{N}Go and save her....{W2}"
                nextText $0,$1C         ; "Sir Astral was right....{N}That's not my King.{N}That's a devil!{W2}"
                nextSingleText $0,$1C   ; "Me?  I'm almost a goner.{N}A strange black cloud{N}enveloped me...(cough)....{W1}"
                shiver $1C
                stopEntity $1C
                csc_end
