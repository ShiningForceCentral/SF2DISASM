
; ASM FILE data\maps\entries\map07\6-warp-events.asm :
; 0x9AFF6..0x9B008 : 
                mWarp 19, 2  ; entrance to headquarters
                  warpNoScroll
                  warpMap    MAP_TACTICAL_BASE
                  warpDest   19, 22
                  warpFacing UP
                mWarp 255, 23  ; south exit
                  warpNoScroll
                  warpMap    MAP_NEW_GRANSEAL
                  warpDest   11, 1
                  warpFacing DOWN
                endWord
