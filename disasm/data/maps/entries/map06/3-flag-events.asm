
; ASM FILE data\maps\entries\map06\3-flag-events.asm :
; 0x9A34E..0x9A378 : 
                fbcFlag 802             ; Set after the event in the basement of Creed's Mansion
                  fbcSource 33, 8  ; construct church building
                  fbcSize   4, 6
                  fbcDest   9, 16
                fbcFlag 802             ; Set after the event in the basement of Creed's Mansion
                  fbcSource 39, 8  ; add church roof to roof layer
                  fbcSize   4, 6
                  fbcDest   10, 47
                fbcFlag 802             ; Set after the event in the basement of Creed's Mansion
                  fbcSource 33, 1  ; construct house being built
                  fbcSize   5, 6
                  fbcDest   27, 22
                fbcFlag 802             ; Set after the event in the basement of Creed's Mansion
                  fbcSource 39, 1  ; add constructed house roof to roof layer
                  fbcSize   5, 7
                  fbcDest   27, 53
                fbcFlag 702             ; Set after the scene with Peter at the Castle (ends with you leaving the Castle)
                  fbcSource 8, 11  ; add door to church
                  fbcSize   1, 1
                  fbcDest   16, 13
                endWord
