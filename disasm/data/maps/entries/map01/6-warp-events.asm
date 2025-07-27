
; ASM FILE data\maps\entries\map01\6-warp-events.asm :
; 0x95F4C..0x95F7E : 
                mWarp 2, 14  ; central room west door
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   48, 30
                  warpFacing UP
                mWarp 20, 14  ; central room east door
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   27, 8
                  warpFacing UP
                mWarp 48, 31  ; west room door
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   2, 15
                  warpFacing DOWN
                mWarp 27, 9  ; east room door
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   20, 15
                  warpFacing DOWN
                mWarp 10, 32  ; south exit
                  warpNoScroll
                  warpMap    MAP_MITULA_SHRINE_EXTERIOR
                  warpDest   14, 12
                  warpFacing DOWN
                mWarp 255, 32  ; south exit
                  warpNoScroll
                  warpMap    MAP_MITULA_SHRINE_EXTERIOR
                  warpDest   15, 12
                  warpFacing DOWN
                endWord
