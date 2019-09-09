
; ASM FILE data\maps\entries\map71\6-warp-events.asm :
; 0xC0694..0xC06BE : 
                mWarp 21, 15
                  warpNoScroll
                  warpMap    2
                  warpDest   21, 30
                  warpFacing 1
                mWarp 22, 15
                  warpNoScroll
                  warpMap    2
                  warpDest   21, 30
                  warpFacing 1
                mWarp 255, 0
                  warpScroll UP
                  warpMap    74
                  warpDest   255, 62
                  warpFacing 1
                mWarp 255, 63
                  warpScroll DOWN
                  warpMap    70
                  warpDest   255, 1
                  warpFacing 3
                mWarp 0, 255
                  warpScroll LEFT
                  warpMap    72
                  warpDest   62, 255
                  warpFacing 2
                endWord
