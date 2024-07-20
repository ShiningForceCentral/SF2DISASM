
; ASM FILE data\maps\entries\map05\6-warp-events.asm :
; 0x99714..0x99746 : 
                mWarp 11, 4  ; church stairs down
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   4, 57
                  warpFacing RIGHT
                mWarp 4, 57  ; underground stairs up
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   11, 4
                  warpFacing DOWN
                mWarp 255, 43  ; south exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_GRANS_GRANSEAL
                  warpDest   19, 24
                  warpFacing DOWN
                mWarp 255, 0  ; north exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_GRANS_GRANSEAL
                  warpDest   18, 21
                  warpFacing DOWN
                mWarp 4, 64  ; unusable warp
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   22, 11
                  warpFacing UP
                mWarp 22, 11  ; unusable warp
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   4, 64
                  warpFacing UP
                endWord
