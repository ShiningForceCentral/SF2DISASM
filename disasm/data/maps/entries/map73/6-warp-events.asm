
; ASM FILE data\maps\entries\map73\6-warp-events.asm :
; 0xC2F6A..0xC2F84 : 
                mWarp 29, 52
                  warpNoScroll
                  warpMap    MAP_NEW_GRANSEAL
                  warpDest   20, 30
                  warpFacing UP
                mWarp 63, 255
                  warpScroll RIGHT
                  warpMap    MAP_OVERWORLD_BEDOE_KINGDOM
                  warpDest   1, 255
                  warpFacing RIGHT
                mWarp 255, 63
                  warpScroll DOWN
                  warpMap    MAP_OVERWORLD_SOUTHWEST_PARMECIA
                  warpDest   255, 1
                  warpFacing DOWN
                endWord
