
; ASM FILE data\maps\entries\map18\6-warp-events.asm :
; 0xA3A0A..0xA3A2C : 
                mWarp 2, 8
                  warpNoScroll
                  warpMap    255
                  warpDest   41, 55
                  warpFacing RIGHT
                mWarp 41, 55
                  warpNoScroll
                  warpMap    255
                  warpDest   2, 8
                  warpFacing RIGHT
                mWarp 255, 29
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_GRANS_GRANSEAL
                  warpDest   31, 9
                  warpFacing DOWN
                mWarp 255, 9
                  warpNoScroll
                  warpMap    MAP_GALAM_CASTLE
                  warpDest   26, 30
                  warpFacing UP
                endWord
