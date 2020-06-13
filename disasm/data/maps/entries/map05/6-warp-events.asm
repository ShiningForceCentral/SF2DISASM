
; ASM FILE data\maps\entries\map05\6-warp-events.asm :
; 0x99714..0x99746 : 
                mWarp 11, 4
                  warpNoScroll
                  warpMap    255
                  warpDest   4, 57
                  warpFacing RIGHT
                mWarp 4, 57
                  warpNoScroll
                  warpMap    255
                  warpDest   11, 4
                  warpFacing DOWN
                mWarp 255, 43
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_GRANS_GRANSEAL
                  warpDest   19, 24
                  warpFacing DOWN
                mWarp 255, 0
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_GRANS_GRANSEAL
                  warpDest   18, 21
                  warpFacing DOWN
                mWarp 4, 64
                  warpNoScroll
                  warpMap    255
                  warpDest   22, 11
                  warpFacing UP
                mWarp 22, 11
                  warpNoScroll
                  warpMap    255
                  warpDest   4, 64
                  warpFacing UP
                endWord
