
; ASM FILE data\maps\entries\map05\4-step-events.asm :
; 0x996D0..0x996F2 : 
                sbc 11, 9  ; church door
                  sbcSource 32, 44
                  sbcSize   1, 1
                  sbcDest   11, 9
                sbc 10, 19  ; house 1 door
                  sbcSource 32, 44
                  sbcSize   1, 1
                  sbcDest   10, 19
                sbc 19, 19  ; tavern door
                  sbcSource 32, 44
                  sbcSize   1, 1
                  sbcDest   19, 19
                sbc 25, 30  ; house 2 door
                  sbcSource 32, 44
                  sbcSize   1, 1
                  sbcDest   25, 30
                endWord
