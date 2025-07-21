
; ASM FILE data\maps\entries\map76\6-warp-events.asm :
; 0xC4F98..0xC4FB2 : 
                mWarp 8, 47
                  warpNoScroll
                  warpMap    MAP_ROFT
                  warpDest   14, 30
                  warpFacing UP
                mWarp 0, 255
                  warpScroll LEFT
                  warpMap    MAP_OVERWORLD_GALAM_KINGDOM
                  warpDest   62, 255
                  warpFacing LEFT
                mWarp 63, 255
                  warpScroll RIGHT
                  warpMap    MAP_OVERWORLD_NAZCA_REGION
                  warpDest   1, 255
                  warpFacing RIGHT
                endWord
