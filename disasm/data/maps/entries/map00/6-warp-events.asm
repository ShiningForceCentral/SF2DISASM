
; ASM FILE data\maps\entries\map00\6-warp-events.asm :
; 0x94D22..0x94D44 : 
                mWarp 14, 11  ; entrance into temple
                  warpNoScroll
                  warpMap    MAP_MITULA_SHRINE_INTERIOR
                  warpDest   10, 31
                  warpFacing UP
                mWarp 15, 11  ; entrance into temple
                  warpNoScroll
                  warpMap    MAP_MITULA_SHRINE_INTERIOR
                  warpDest   12, 31
                  warpFacing UP
                mWarp 14, 35  ; south exit
                  warpNoScroll
                  warpMap    MAP_TRISTAN_CAVES
                  warpDest   15, 23
                  warpFacing DOWN
                mWarp 15, 35  ; south exit
                  warpNoScroll
                  warpMap    MAP_TRISTAN_CAVES
                  warpDest   16, 23
                  warpFacing DOWN
                endWord
