
; ASM FILE data\maps\entries\map08\6-warp-events.asm :
; 0x9BBBC..0x9BBDE : 
                mWarp 255, 31  ; south exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_SOUTH_PARMECIA
                  warpDest   44, 8
                  warpFacing DOWN
                mWarp 18, 5  ; mayor's house stairs up
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   40, 8
                  warpFacing RIGHT
                mWarp 40, 8  ; mayor's house stairs down
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   18, 5
                  warpFacing LEFT
                mWarp 255, 20  ; under tree ruins entrance
                  warpNoScroll
                  warpMap    MAP_ACHILLES_SHRINES
                  warpDest   42, 23
                  warpFacing UP
                endWord
