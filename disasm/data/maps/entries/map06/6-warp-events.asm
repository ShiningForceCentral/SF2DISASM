
; ASM FILE data\maps\entries\map06\6-warp-events.asm :
; 0x9A3F4..0x9A40E : 
                mWarp 255, 0  ; entrance to castle
                  warpNoScroll
                  warpMap    MAP_NEW_GRANSEAL_CASTLE
                  warpDest   11, 22
                  warpFacing UP
                mWarp 255, 31  ; south exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_NEW_GRANSEAL_KINGDOM
                  warpDest   29, 53
                  warpFacing DOWN
                mWarp 31, 14  ; unusable warp
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_NEW_GRANSEAL_KINGDOM
                  warpDest   29, 53
                  warpFacing DOWN
                endWord
