
; ASM FILE data\maps\entries\map02\6-warp-events.asm :
; 0x96A5C..0x96A7E : 
                mWarp 19, 0  ; entrance to castle
                  warpNoScroll
                  warpMap    MAP_PACALON_CASTLE
                  warpDest   20, 30
                  warpFacing UP
                mWarp 23, 0  ; entrance to castle
                  warpNoScroll
                  warpMap    MAP_PACALON_CASTLE
                  warpDest   22, 30
                  warpFacing UP
                mWarp 255, 0  ; entrance to castle
                  warpNoScroll
                  warpMap    MAP_PACALON_CASTLE
                  warpDest   255, 30
                  warpFacing UP
                mWarp 255, 31  ; south exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_PACALON_KINGDOM_DROUGHT
                  warpDest   22, 16
                  warpFacing DOWN
                endWord
