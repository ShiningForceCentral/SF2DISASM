
; ASM FILE data\maps\entries\map70\6-warp-events.asm :
; 0xBF7C6..0xBF7E0 : 
                mWarp 43, 40
                  warpNoScroll
                  warpMap    MAP_EAST_SHRINE
                  warpDest   6, 18
                  warpFacing UP
                mWarp 0, 255
                  warpScroll LEFT
                  warpMap    MAP_OVERWORLD_SOUTH_PARMECIA
                  warpDest   62, 255
                  warpFacing LEFT
                mWarp 255, 0
                  warpScroll UP
                  warpMap    MAP_OVERWORLD_PACALON_KINGDOM_DROUGHT
                  warpDest   255, 62
                  warpFacing UP
                endWord
