
; ASM FILE data\maps\entries\map08\6-warp-events.asm :
; 0x9BBBC..0x9BBDE : 
                mWarp 255, 31
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_PATH_TO_RIBBLE
                  warpDest   44, 8
                  warpFacing DOWN
                mWarp 18, 5
                  warpNoScroll
                  warpMap    255
                  warpDest   40, 8
                  warpFacing RIGHT
                mWarp 40, 8
                  warpNoScroll
                  warpMap    255
                  warpDest   18, 5
                  warpFacing LEFT
                mWarp 255, 20
                  warpNoScroll
                  warpMap    MAP_ACHILLES_SHRINES
                  warpDest   42, 23
                  warpFacing UP
                endWord
