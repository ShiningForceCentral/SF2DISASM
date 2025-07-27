
; ASM FILE data\maps\entries\map23\6-warp-events.asm :
; 0xA6ECC..0xA6EFE : 
                mWarp 255, 1  ; north exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_SOUTHWEST_PARMECIA
                  warpDest   48, 31
                  warpFacing DOWN
                mWarp 0, 255  ; west exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_SOUTHWEST_PARMECIA
                  warpDest   48, 31
                  warpFacing DOWN
                mWarp 255, 30  ; south exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_SOUTHWEST_PARMECIA
                  warpDest   48, 31
                  warpFacing DOWN
                mWarp 31, 24  ; east exit
                  warpNoScroll
                  warpMap    MAP_ELVEN_VILLAGE_BATTLEFIELD
                  warpDest   1, 27
                  warpFacing RIGHT
                mWarp 21, 8  ; main building stairs up
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   57, 3
                  warpFacing LEFT
                mWarp 57, 3  ; main building stairs down
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   21, 8
                  warpFacing RIGHT
                endWord
