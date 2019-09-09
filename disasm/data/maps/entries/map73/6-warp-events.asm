
; ASM FILE data\maps\entries\map73\6-warp-events.asm :
; 0xC2F6A..0xC2F84 : 
                mWarp 29, 52
                  warpNoScroll
                  warpMap    6
                  warpDest   20, 30
                  warpFacing 1
                mWarp 63, 255
                  warpScroll RIGHT
                  warpMap    72
                  warpDest   1, 255
                  warpFacing 0
                mWarp 255, 63
                  warpScroll DOWN
                  warpMap    68
                  warpDest   255, 1
                  warpFacing 3
                endWord
