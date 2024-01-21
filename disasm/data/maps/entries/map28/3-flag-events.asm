
; ASM FILE data\maps\entries\map28\3-flag-events.asm :
; 0xA9C4E..0xA9C58 : 
                
            if (STANDARD_BUILD&FIX_LABYRINTH_DELETION=1)
            else
                fbcFlag 100             ; Battle region flag 10
                  fbcSource 33, 8
                  fbcSize   4, 6
                  fbcDest   10, 16
            endif
                endWord
