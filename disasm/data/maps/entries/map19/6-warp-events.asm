
; ASM FILE data\maps\entries\map19\6-warp-events.asm :
; 0xA464E..0xA4688 : 
                mWarp 6, 2  ; west tower stairs up
                  warpNoScroll
                  warpMap    MAP_GRANSEAL_CASTLE_1F
                  warpDest   6, 37
                  warpFacing RIGHT
                mWarp 23, 3  ; royal chambers stairs up
                  warpNoScroll
                  warpMap    MAP_GRANSEAL_CASTLE_1F
                  warpDest   23, 37
                  warpFacing DOWN
                mWarp 35, 7  ; east tower stairs up
                  warpNoScroll
                  warpMap    MAP_GRANSEAL_CASTLE_1F
                  warpDest   36, 40
                  warpFacing RIGHT
                mWarp 38, 8  ; east tower stairs down
                  warpNoScroll
                  warpMap    MAP_GRANSEAL_CASTLE_1F
                  warpDest   38, 10
                  warpFacing LEFT
                mWarp 19, 15  ; west room door
                  warpNoScroll
                  warpMap    MAP_GRANSEAL_CASTLE_1F
                  warpDest   19, 14
                  warpFacing UP
                mWarp 35, 15  ; east room door
                  warpNoScroll
                  warpMap    MAP_GRANSEAL_CASTLE_1F
                  warpDest   35, 14
                  warpFacing UP
                mWarp 255, 31  ; south exit
                  warpNoScroll
                  warpMap    MAP_GRANSEAL
                  warpDest   29, 2
                  warpFacing DOWN
                endWord
