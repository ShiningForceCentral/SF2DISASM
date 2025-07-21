
; ASM FILE data\maps\entries\map03\6-warp-events.asm :
; 0x978F0..0x9793A : 
                mWarp 255, 1  ; entrance to castle
                  warpNoScroll
                  warpMap    MAP_GRANSEAL_CASTLE_2F
                  warpDest   26, 30
                  warpFacing UP
                mWarp 0, 255  ; west exit
                  warpNoScroll
                  warpMap    MAP_OVERWORLD_GRANSEAL_KINGDOM
                  warpDest   29, 32
                  warpFacing DOWN
                mWarp 50, 23  ; exit to docks
                  warpNoScroll
                  warpMap    MAP_GRANSEAL_DOCKS_AND_SHIP
                  warpDest   1, 25
                  warpFacing RIGHT
                mWarp 50, 24  ; exit to docks
                  warpNoScroll
                  warpMap    MAP_GRANSEAL_DOCKS_AND_SHIP
                  warpDest   1, 25
                  warpFacing RIGHT
                mWarp 50, 25  ; exit to docks
                  warpNoScroll
                  warpMap    MAP_GRANSEAL_DOCKS_AND_SHIP
                  warpDest   1, 25
                  warpFacing RIGHT
                mWarp 46, 7  ; school stairs down
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   59, 12
                  warpFacing LEFT
                mWarp 59, 12  ; school stairs up
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   46, 7
                  warpFacing DOWN
                mWarp 3, 3  ; Bowie's house stairs up
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   54, 3
                  warpFacing RIGHT
                mWarp 54, 3  ; Bowie's house stairs down
                  warpNoScroll
                  warpMap    MAP_CURRENT
                  warpDest   3, 3
                  warpFacing RIGHT
                endWord
