
; ASM FILE data\maps\entries\map09\6-warp-events.asm :
; 0x9C83A..0x9C864 : 
                mWarp 255, 0  ; north exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_SOUTH_PARMECIA
                  warpDest   26, 54
                  warpFacing DOWN
                mWarp 6, 16  ; Max's relative's house stairs up
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   3, 57
                  warpFacing DOWN
                mWarp 3, 57  ; Max's relative's house stairs down
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   6, 16
                  warpFacing RIGHT
                mWarp 11, 26  ; Rohde's house stairs up
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   14, 57
                  warpFacing DOWN
                mWarp 14, 57  ; Rohde's house stairs down
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   11, 26
                  warpFacing RIGHT
                endWord
