
; ASM FILE data\maps\entries\map08\4-step-events.asm :
; 0x9BB58..0x9BB8A : 
                sbc 6, 15  ; shop door
                  sbcSource 34, 0
                  sbcSize   2, 1
                  sbcDest   6, 15
                sbc 7, 15  ; shop door
                  sbcSource 34, 0
                  sbcSize   2, 1
                  sbcDest   6, 15
                sbc 14, 9  ; mayor's house door
                  sbcSource 32, 0
                  sbcSize   1, 1
                  sbcDest   14, 9
                sbc 7, 25  ; Paseran's house door
                  sbcSource 32, 0
                  sbcSize   1, 1
                  sbcDest   7, 25
                sbc 25, 12  ; Keseran's house door
                  sbcSource 32, 0
                  sbcSize   1, 1
                  sbcDest   25, 12
                sbc 22, 24  ; church door
                  sbcSource 32, 0
                  sbcSize   1, 1
                  sbcDest   22, 24
                endWord
