
; ASM FILE data\maps\entries\map77\6-warp-events.asm :
; 0xC5D78..0xC5DA2 : 
                mWarp 40, 42
                  warpNoScroll
                  warpMap    MAP_DWARVEN_VILLAGE_EXTERIOR
                  warpDest   15, 20
                  warpFacing UP
            if (STANDARD_BUILD&FIX_PRISM_FLOWER_OVERWORLD_ENTRANCE=1)
                mWarp 63, 255
                  warpScroll RIGHT
                  warpMap    MAP_OVERWORLD_ROFT_REGION
                  warpDest   1, 255
                  warpFacing RIGHT
            else
                mWarp 255, 33
                  warpNoScroll
                  warpMap    MAP_PRISM_FLOWERS_BATTLEFIELD
                  warpDest   19, 1
                  warpFacing DOWN
            endif
                mWarp 255, 34
                  warpNoScroll
                  warpMap    MAP_PRISM_FLOWERS_BATTLEFIELD
                  warpDest   10, 30
                  warpFacing UP
                mWarp 255, 63
                  warpScroll DOWN
                  warpMap    MAP_OVERWORLD_GRANSEAL_KINGDOM
                  warpDest   255, 1
                  warpFacing DOWN
            if (STANDARD_BUILD&FIX_PRISM_FLOWER_OVERWORLD_ENTRANCE=1)
                mWarp 255, 33
                  warpNoScroll
                  warpMap    MAP_PRISM_FLOWERS_BATTLEFIELD
                  warpDest   19, 1
                  warpFacing DOWN
            else
                mWarp 63, 255
                  warpScroll RIGHT
                  warpMap    MAP_OVERWORLD_ROFT_REGION
                  warpDest   1, 255
                  warpFacing RIGHT
            endif
                endWord
