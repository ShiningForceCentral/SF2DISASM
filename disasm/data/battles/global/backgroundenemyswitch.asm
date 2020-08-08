
; ASM FILE data\battles\global\backgroundenemyswitch.asm :
; 0x1FAB8..0x1FAD6 : Background enemy switch table
tbl_BackgroundEnemySwitch:
                
; Table of boolean values for background entries, used when switching enemy
                
                dc.b 0                  ; 0: Plain
                dc.b 0                  ; 1: Grass
                dc.b 0                  ; 2: Forest
                dc.b 1                  ; 3: Hills
                dc.b 0                  ; 4: Sky
                dc.b 0                  ; 5: Desert
                dc.b 0                  ; 6: Beach
                dc.b 0                  ; 7: Tower exterior
                dc.b 0                  ; 8: Castle
                dc.b 0                  ; 9: Tower interior
                dc.b 0                  ; 10: Cave
                dc.b 1                  ; 11: Mountain
                dc.b 0                  ; 12: Town
                dc.b 0                  ; 13: Underground shrine
                dc.b 0                  ; 14: River
                dc.b 0                  ; 15: Taros's Shrine
                dc.b 0                  ; 16: Valley
                dc.b 0                  ; 17: Chessboard
                dc.b 1                  ; 18: Bridge
                dc.b 0                  ; 19: Mitula's Shrine exterior
                dc.b 0                  ; 20: Mitula's Shrine interior
                dc.b 0                  ; 21: Town (duplicate)
                dc.b 0                  ; 22: Town (duplicate)
                dc.b 0                  ; 23: Nazca
                dc.b 0                  ; 24: Swamp
                dc.b 0                  ; 25: Versus Odd Eye
                dc.b 0                  ; 26: Versus Galam
                dc.b 1                  ; 27: Versus Zeon
                dc.b 0                  ; 28: Burrow
                dc.b 0                  ; 29: Underground shrine (duplicate)
