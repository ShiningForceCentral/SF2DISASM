
; ASM FILE data\maps\entries\map68\6-warp-events.asm :
; 0xBDA5E..0xBDA90 : 
                mWarp 55, 43
                  warpNoScroll
                  warpMap    MAP_TAROS_SHRINE
                  warpDest   12, 30
                  warpFacing UP
                mWarp 57, 24
                  warpNoScroll
                  warpMap    MAP_DWARVEN_VILLAGE_INTERIOR
                  warpDest   8, 20
                  warpFacing UP
                mWarp 48, 30
                  warpNoScroll
                  warpMap    MAP_ELVEN_VILLAGE
                  warpDest   22, 29
                  warpFacing RIGHT
                mWarp 255, 0
                  warpScroll UP
                  warpMap    MAP_OVERWORLD_NEW_GRANSEAL_KINGDOM
                  warpDest   255, 62
                  warpFacing UP
                mWarp 0, 255
                  warpScroll LEFT
                  warpMap    MAP_OVERWORLD_DEVILS_TAIL
                  warpDest   62, 255
                  warpFacing LEFT
                mWarp 63, 255
                  warpScroll RIGHT
                  warpMap    MAP_OVERWORLD_SOUTH_PARMECIA
                  warpDest   1, 255
                  warpFacing RIGHT
                endWord
