
; ASM FILE data\maps\entries\map66\3-flag-events.asm :
; 0xBBD68..0xBBD7A : 
                fbcFlag 508             ; Battle 8 completed - BATTLE_NORTH_CLIFF                  
                  fbcSource 0, 49
                  fbcSize   10, 15
                  fbcDest   28, 23
                fbcFlag 611             ; Set after prison wake-up sequence IF 0297 is *not* also set
                  fbcSource 59, 4
                  fbcSize   1, 1
                  fbcDest   31, 7
                endWord
