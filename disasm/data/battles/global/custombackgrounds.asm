
; ASM FILE data\battles\global\custombackgrounds.asm :
; 0x1FA8A..0x1FAB7 : Battle custom backgrounds table
tbl_CustomBackgrounds:
                
; Syntax        background [BATTLEBACKGROUND_]enum (or index)
;
; Note: 1 byte per battle. (Custom background used for the entire battlefield, or $FF for background depending on map block.)
                
                background UNDERGROUND_SHRINE_0 ; 0: Versus all bosses
                background TOWER_INTERIOR ; 1: Inside Ancient Tower
                background OVERWORLD    ; 2: To Yeel
                background OVERWORLD    ; 3: To Hawel's house
                background OVERWORLD    ; 4: Ambushed by Galam Soldiers
                background CASTLE       ; 5: Galam Castle
                background OVERWORLD    ; 6: To Granseal
                background TOWER_INTERIOR ; 7: Versus Dark Smokes
                background OVERWORLD    ; 8: North Cliff
                background OVERWORLD    ; 9: To Ribble
                background OVERWORLD    ; 10: To the East
                background CAVE         ; 11: Cave of Darkness
                background MOUNTAIN     ; 12: Mt. Volcano
                background TOWN         ; 13: Polca Village
                background OVERWORLD    ; 14: Southeast Desert
                background UNDERGROUND_SHRINE ; 15: Shrine south of Ribble
                background RIVER        ; 16: Versus Kraken
                background OVERWORLD    ; 17: To Taros's Shrine
                background TAROS_SHRINE ; 18: Versus Taros
                background OVERWORLD    ; 19: Outside Elven Village
                background VALLEY       ; 20: Harpies' Pond
                background OVERWORLD    ; 21: Devil's Tail
                background CHESSBOARD   ; 22: Chessboard
                background BURROW       ; 23: Versus Willard
                background OVERWORLD    ; 24: To North Parmecia
                background CAVE         ; 25: North Cave
                background OVERWORLD    ; 26: Outside Ketto
                background OVERWORLD    ; 27: To Tristan
                background BRIDGE       ; 28: Pangoat Valley bridge
                background MITULA_SHRINE_EXTERIOR ; 29: Outside Mitula's Shrine
                background MITULA_SHRINE_INTERIOR ; 30: Versus Zalbard
                background TOWN_0       ; 31: Pacalon
                background OVERWORLD    ; 32: To Moun
                background TOWN_1       ; 33: Inside Moun
                background NAZCA        ; 34: Versus Cameela
                background OVERWORLD    ; 35: To Roft
                background SWAMP        ; 36: Versus Prism Flowers
                background OVERWORLD    ; 37: Versus Red Baron
                background OVERWORLD    ; 38: Versus Geshp
                background OVERWORLD    ; 39: To Ancient Shrine
                background VERSUS_ODD_EYE ; 40: Versus Odd Eye
                background TOWER_EXTERIOR ; 41: Outside Ancient Tower
                background VERSUS_GALAM ; 42: Versus Galam
                background VERSUS_GALAM ; 43: Versus Zeon
                background FOREST       ; 44: Fairy Woods
