
; ASM FILE data\maps\entries\map18\6-warp-events.asm :
; 0xA3A0A..0xA3A2C : 
                mWarp 2, 8  ; gate stairs up
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   41, 55
                  warpFacing RIGHT
                mWarp 41, 55  ; gate stairs down
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   2, 8
                  warpFacing RIGHT
                mWarp 255, 29  ; south exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_GRANS_GRANSEAL
                  warpDest   31, 9
                  warpFacing DOWN
                mWarp 255, 9  ; north exit
                  warpNoScroll
                  warpMap    MAP_GALAM_CASTLE
                  warpDest   26, 30
                  warpFacing UP
                endWord
