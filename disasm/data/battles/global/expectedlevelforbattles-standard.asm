
table_ExpectedLevelForBattles:
               
	; Overall, expected level is in most cases equal to the battle number! (except for boss battles)
	; This table is only used for the bonus experience mechanic (if enabled) and the healing experience dampening (if enabled)
	; Idea for later: it could also be used in the configuration mode to set-up a level appropriate party for battle testing.
	
	dc.b  45 ; BATTLE_VERSUS_ALL_BOSSES: equ 0
	dc.b   1 ; BATTLE_INSIDE_ANCIENT_TOWER: equ 1
	dc.b   2 ; BATTLE_TO_YEEL: equ 2
	dc.b   3 ; BATTLE_TO_HAWEL_HOUSE: equ 3
	dc.b   4 ; BATTLE_AMBUSHED_BY_GALAM_SOLDIERS: equ 4
	dc.b   5 ; BATTLE_GALAM_CASTLE: equ 5
	dc.b   6 ; BATTLE_TO_GRANSEAL: equ 6
	dc.b   7 ; BATTLE_VERSUS_DARK_SMOKES: equ 7
	dc.b   8 ; BATTLE_NORTH_CLIFF: equ 8
	dc.b   9 ; BATTLE_TO_RIBBLE: equ 9
	dc.b  10 ; BATTLE_TO_THE_EAST: equ 10
	dc.b  11 ; BATTLE_CAVE_OF_DARKNESS: equ 11
	dc.b  12 ; BATTLE_MOUNT_VOLCANO: equ 12
	dc.b  13 ; BATTLE_POLCA_VILLAGE: equ 13
	dc.b  14 ; BATTLE_SOUTHEAST_DESERT: equ 14
	dc.b  15 ; BATTLE_SHRINE_SOUTH_OF_RIBBLE: equ 15
	dc.b  17 ; BATTLE_VERSUS_KRAKEN: equ 16
	dc.b  18 ; BATTLE_TO_TAROS_SHRINE: equ 17
	dc.b  19 ; BATTLE_VERSUS_TAROS: equ 18
	dc.b  19 ; BATTLE_OUTSIDE_ELVEN_VILLAGE: equ 19
	dc.b  20 ; BATTLE_HARPIES_POND: equ 20
	dc.b  21 ; BATTLE_DEVIL_TAIL: equ 21
	dc.b  23 ; BATTLE_CHESSBOARD: equ 22
	dc.b  23 ; BATTLE_VERSUS_WILLARD: equ 23
	dc.b  24 ; BATTLE_TO_NORTH_PARMECIA: equ 24
	dc.b  25 ; BATTLE_NORTH_CAVE: equ 25
	dc.b  26 ; BATTLE_OUTSIDE_KETTO: equ 26
	dc.b  27 ; BATTLE_TO_TRISTAN: equ 27
	dc.b  28 ; BATTLE_PANGOAT_VALLEY_BRIDGE: equ 28
	dc.b  29 ; BATTLE_OUTSIDE_MITULA_SHRINE: equ 29
	dc.b  30 ; BATTLE_VERSUS_ZALBARD: equ 30
	dc.b  31 ; BATTLE_PACALON: equ 31
	dc.b  32 ; BATTLE_TO_MOUN: equ 32
	dc.b  33 ; BATTLE_INSIDE_MOUN: equ 33
	dc.b  34 ; BATTLE_VERSUS_CAMEELA: equ 34
	dc.b  35 ; BATTLE_TO_ROFT: equ 35
	dc.b  36 ; BATTLE_VERSUS_PRISM_FLOWERS: equ 36
	dc.b  37 ; BATTLE_VERSUS_RED_BARON: equ 37
	dc.b  38 ; BATTLE_VERSUS_GESHP: equ 38
	dc.b  39 ; BATTLE_TO_ANCIENT_SHRINE: equ 39
	dc.b  41 ; BATTLE_VERSUS_ODD_EYE: equ 40
	dc.b  42 ; BATTLE_OUTSIDE_ANCIENT_TOWER: equ 41
	dc.b  44 ; BATTLE_VERSUS_GALAM: equ 42
	dc.b  45 ; BATTLE_VERSUS_ZEON: equ 43
	dc.b  22 ; BATTLE_FAIRY_WOODS: equ 44

	; If you create new battles, don't forget to add entries in this file!
	; Otherwise random data will be read instead and you would get unpredictable bonus experience...

	align
