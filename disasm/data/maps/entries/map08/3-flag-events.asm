
; ASM FILE data\maps\entries\map08\3-flag-events.asm :
; 0x9BB2E..0x9BB58 : 
                fbcFlag 731             ; Set after you open the tree in Ribble with the wooden plank
                  fbcSource 32, 14  ; open access to ruins
                  fbcSize   2, 2
                  fbcDest   15, 19
                fbcFlag 709             ; Set after the mayor in Ribble scene... this flag unlocks the doors
                  fbcSource 32, 3  ; switch double doors for shop
                  fbcSize   2, 1
                  fbcDest   6, 15
                fbcFlag 709             ; Set after the mayor in Ribble scene... this flag unlocks the doors
                  fbcSource 32, 2  ; switch door to Keseran's house
                  fbcSize   1, 1
                  fbcDest   25, 12
                fbcFlag 709             ; Set after the mayor in Ribble scene... this flag unlocks the doors
                  fbcSource 32, 2  ; switch door to Paseran's house
                  fbcSize   1, 1
                  fbcDest   7, 25
                fbcFlag 709             ; Set after the mayor in Ribble scene... this flag unlocks the doors
                  fbcSource 32, 2  ; switch door to church
                  fbcSize   1, 1
                  fbcDest   22, 24
                endWord
