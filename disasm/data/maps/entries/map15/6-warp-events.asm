
; ASM FILE data\maps\entries\map15\6-warp-events.asm :
; 0xA0628..0xA0652 : 
                mWarp 18, 5  ; entrance to temple
                  warpNoScroll
                  warpMap    MAP_TRISTAN_CAVES
                  warpDest   15, 30
                  warpFacing UP
                mWarp 19, 5  ; entrance to temple
                  warpNoScroll
                  warpMap    MAP_TRISTAN_CAVES
                  warpDest   16, 30
                  warpFacing UP
                mWarp 4, 9  ; lower west cave
                  warpNoScroll
                  warpMap    MAP_TRISTAN_CAVES
                  warpDest   24, 15
                  warpFacing UP
                mWarp 7, 2  ; upper west cave
                  warpNoScroll
                  warpMap    MAP_TRISTAN_CAVES
                  warpDest   4, 14
                  warpFacing UP
                mWarp 255, 31  ; southern exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_NORTH_PARMECIA
                  warpDest   52, 21
                  warpFacing DOWN
                endWord
