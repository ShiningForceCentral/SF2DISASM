
; ASM FILE data\maps\entries\map70\6-warp-events.asm :
; 0xBF7C6..0xBF7E0 : 
                mWarp 43, 40
                  warpNoScroll
                  warpMap    62
                  warpDest   6, 18
                  warpFacing 1
                mWarp 0, 255
                  warpScroll LEFT
                  warpMap    69
                  warpDest   62, 255
                  warpFacing 2
                mWarp 255, 0
                  warpScroll UP
                  warpMap    71
                  warpDest   255, 62
                  warpFacing 1
                endWord
