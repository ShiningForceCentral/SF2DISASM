
; ASM FILE data\maps\entries\map11\6-warp-events.asm :
; 0x9E4CC..0x9E4E6 : 
                mWarp 255, 19  ; exit from Volcannon shrine
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   8, 13
                  warpFacing DOWN
                mWarp 255, 12  ; entrance to Volcannon shrine
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   39, 18
                  warpFacing UP
                mWarp 8, 34  ; stairs down to Bedoe
                  warpNoScroll
                  warpMap    MAP_BEDOE
                  warpDest   45, 50
                  warpFacing DOWN
                endWord
