
; ASM FILE data\maps\entries\map78\6-warp-events.asm :
; 0xC69E4..0xC6A0E : 
                mWarp 21, 15
                  warpNoScroll
                  warpMap    MAP_PACALON
                  warpDest   21, 30
                  warpFacing UP
                mWarp 22, 15
                  warpNoScroll
                  warpMap    MAP_PACALON
                  warpDest   21, 30
                  warpFacing UP
                mWarp 255, 0
                  warpScroll UP
                  warpMap    MAP_OVERWORLD_MOUN_AND_MITULA
                  warpDest   255, 62
                  warpFacing UP
                mWarp 255, 63
                  warpScroll DOWN
                  warpMap    MAP_OVERWORLD_SOUTHEAST_PARMECIA
                  warpDest   255, 1
                  warpFacing DOWN
                mWarp 0, 255
                  warpScroll LEFT
                  warpMap    MAP_OVERWORLD_NORTH_SOUTH_PARMECIA_JUNCTION
                  warpDest   62, 255
                  warpFacing LEFT
                endWord
