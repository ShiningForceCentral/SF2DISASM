
; ASM FILE data\maps\entries\map21\6-warp-events.asm :
; 0xA61F8..0xA620A : 
                mWarp 3, 16  ; tower stairs down
                  warpNoScroll
                  warpMap    MAP_GRANSEAL_CASTLE_1F
                  warpDest   3, 36
                  warpFacing RIGHT
                mWarp 9, 1  ; north exit
                  warpNoScroll
                  warpMap    MAP_ANCIENT_TOWER_EXTERIOR
                  warpDest   4, 30
                  warpFacing UP
                endWord
