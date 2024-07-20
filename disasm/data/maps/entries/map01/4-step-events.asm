
; ASM FILE data\maps\entries\map01\4-step-events.asm :
; 0x95F38..0x95F4A : 
                sbc 2, 14  ; central room west door
                  sbcSource 0, 34
                  sbcSize   1, 1
                  sbcDest   2, 14
                sbc 20, 14  ; central room east door
                  sbcSource 0, 34
                  sbcSize   1, 1
                  sbcDest   20, 14
                endWord
