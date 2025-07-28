
; ASM FILE data\maps\entries\map72\3-flag-events.asm :
; 0xC1BF0..0xC1BFA : 
                ; replace blocked entrance with open entrance
				fbcFlag 750             ; Set after Rohde clears the blockage at the North Cliff cave
                  fbcSource 0, 0
                  fbcSize   1, 2
                  fbcDest   27, 33
                endWord
