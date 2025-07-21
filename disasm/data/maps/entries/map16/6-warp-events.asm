
; ASM FILE data\maps\entries\map16\6-warp-events.asm :
; 0xA1618..0xA166A : 
                mWarp 17, 14  ; throne room entrance
                  warpNoScroll
                  warpMap    MAP_GALAM_INTERIORS
                  warpDest   11, 8
                  warpFacing UP
                mWarp 10, 15  ; entrance to treasury
                  warpNoScroll
                  warpMap    MAP_GALAM_INTERIORS
                  warpDest   5, 9
                  warpFacing UP
                mWarp 8, 5  ; treasury stairs down
                  warpNoScroll
                  warpMap    MAP_GALAM_INTERIORS
                  warpDest   2, 3
                  warpFacing RIGHT
                mWarp 23, 5  ; stairs down to kitchen
                  warpNoScroll
                  warpMap    MAP_GALAM_INTERIORS
                  warpDest   17, 3
                  warpFacing RIGHT
                mWarp 39, 3  ; north gate west tower stairs down
                  warpNoScroll
                  warpMap    MAP_GALAM_INTERIORS
                  warpDest   41, 29
                  warpFacing RIGHT
                mWarp 51, 3  ; north gate east tower stairs down
                  warpNoScroll
                  warpMap    MAP_GALAM_INTERIORS
                  warpDest   53, 29
                  warpFacing RIGHT
                mWarp 49, 9  ; door to north gate east tower
                  warpNoScroll
                  warpMap    MAP_GALAM_INTERIORS
                  warpDest   51, 30
                  warpFacing UP
                mWarp 21, 3  ; royal chambers stairs down
                  warpNoScroll
                  warpMap    MAP_GALAM_INTERIORS
                  warpDest   15, 1
                  warpFacing LEFT
                mWarp 255, 0  ; north gate exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_GRANSEAL_KINGDOM
                  warpDest   32, 4
                  warpFacing DOWN
                mWarp 255, 31  ; south exit
                  warpNoScroll
                  warpMap    MAP_GALAM_DRAWBRIDGE
                  warpDest   9, 10
                  warpFacing DOWN
                endWord
