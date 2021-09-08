
; ASM FILE data\stats\enemies\enemybattlesprites.asm :
; 0x1F914..0x1F9E2 : Enemy battle sprites table
tbl_EnemyBattleSprites:
                
; Syntax        enemyBattleSprAndPlt [ENEMYBATTLESPRITE_]enum, palette
;
; Notes: Palette range varies depending on the sprite.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                enemyBattleSprAndPlt OOZE, 1 ; 0: OOZE
                enemyBattleSprAndPlt RAT, 0 ; 1: HUGE RAT
                enemyBattleSprAndPlt SOLDIER, 0 ; 2: GALAM SOLDIER
                enemyBattleSprAndPlt KNIGHT, 0 ; 3: GALAM KNIGHT
                enemyBattleSprAndPlt GOBLIN, 0 ; 4: GOBLIN
                enemyBattleSprAndPlt OOZE, 0 ; 5: GREEN OOZE
                enemyBattleSprAndPlt DWARF, 2 ; 6: DARK DWARF
                enemyBattleSprAndPlt GOBLIN, 2 ; 7: HOBGOBLIN
                enemyBattleSprAndPlt ZOMBIE, 0 ; 8: ZOMBIE
                enemyBattleSprAndPlt GOLEM, 0 ; 9: GOLEM
                enemyBattleSprAndPlt KRAKEN_LEG, 0 ; 10: KRAKEN LEG
                enemyBattleSprAndPlt SOULSOWER, 0 ; 11: SOULSOWER
                enemyBattleSprAndPlt ORC, 0 ; 12: ORC
                enemyBattleSprAndPlt SOLDIER, 1 ; 13: PAWN
                enemyBattleSprAndPlt KNIGHT, 1 ; 14: KNIGHT
                enemyBattleSprAndPlt RAT, 1 ; 15: RAT
                enemyBattleSprAndPlt OOZE, 2 ; 16: BUBBLING OOZE
                enemyBattleSprAndPlt SKELETON, 0 ; 17: SKELETON
                enemyBattleSprAndPlt DWARF, 1 ; 18: DARK SOLDIER
                enemyBattleSprAndPlt LIZARDMAN, 0 ; 19: LIZARDMAN
                enemyBattleSprAndPlt WORM, 1 ; 20: WORM
                enemyBattleSprAndPlt KNIGHT, 2 ; 21: DARK KNIGHT
                enemyBattleSprAndPlt ORC, 2 ; 22: ORC LORD
                enemyBattleSprAndPlt SOLDIER, 2 ; 23: DEVIL SOLDIER
                enemyBattleSprAndPlt CERBERUS, 0 ; 24: CERBERUS
                enemyBattleSprAndPlt GOLEM, 1 ; 25: MUD MAN
                enemyBattleSprAndPlt LIZARDMAN, 1 ; 26: DRAGONEWT
                enemyBattleSprAndPlt WORM, 2 ; 27: PURPLE WORM
                enemyBattleSprAndPlt REAPER, 1 ; 28: EXECUTIONER
                enemyBattleSprAndPlt CERBERUS, 1 ; 29: HELL HOUND
                enemyBattleSprAndPlt MINOTAUR, 1 ; 30: MINOTAUR
                enemyBattleSprAndPlt CYCLOPS, 0 ; 31: CYCLOPS
                enemyBattleSprAndPlt BURST_ROCK, 0 ; 32: BURST ROCK
                enemyBattleSprAndPlt HYDRA, 0 ; 33: HYDRA
                enemyBattleSprAndPlt CHAOS_WARRIOR, 0 ; 34: CHAOS WARRIOR
                enemyBattleSprAndPlt REAPER, 0 ; 35: REAPER
                enemyBattleSprAndPlt EVIL_BEAST, 0 ; 36: EVIL BEAST
                enemyBattleSprAndPlt HYDRA, 1 ; 37: PYROHYDRA
                enemyBattleSprAndPlt PRISM_FLOWER, 1 ; 38: ZEON GUARD
                enemyBattleSprAndPlt GIZMO, 2 ; 39: GIZMO
                enemyBattleSprAndPlt BAT, 0 ; 40: HUGE BAT
                enemyBattleSprAndPlt BAT, 2 ; 41: VAMPIRE BAT
                enemyBattleSprAndPlt GIZMO, 1 ; 42: EVIL CLOUD
                enemyBattleSprAndPlt GARGOYLE, 0 ; 43: GARGOYLE
                enemyBattleSprAndPlt HARPY, 0 ; 44: HARPY
                enemyBattleSprAndPlt GARGOYLE, 1 ; 45: LESSER DEMON
                enemyBattleSprAndPlt WYVERN, 0 ; 46: WYVERN
                enemyBattleSprAndPlt HARPY, 1 ; 47: HARPY QUEEN
                enemyBattleSprAndPlt PEGASUS_KNIGHT, 0 ; 48: PEGASUS KNIGHT
                enemyBattleSprAndPlt GRIFFIN, 0 ; 49: GRIFFIN
                enemyBattleSprAndPlt GIZMO, 3 ; 50: MIST DEMON
                enemyBattleSprAndPlt DRAGON, 1 ; 51: WHITE DRAGON
                enemyBattleSprAndPlt DEMON, 1 ; 52: DEMON
                enemyBattleSprAndPlt DRAGON, 0 ; 53: CHAOS DRAGON
                enemyBattleSprAndPlt GRIFFIN, 1 ; 54: DEVIL GRIFFIN
                enemyBattleSprAndPlt DEMON, 0 ; 55: ARCH DEMON
                enemyBattleSprAndPlt ARCHER, 0 ; 56: GALAM ARCHER
                enemyBattleSprAndPlt HUNTER_GOBLIN, 0 ; 57: HUNTER GOBLIN
                enemyBattleSprAndPlt ARCHER, 1 ; 58: DEATH ARCHER
                enemyBattleSprAndPlt KRAKEN_ARM, 0 ; 59: KRAKEN ARM
                enemyBattleSprAndPlt ARROW_LAUNCHER, 0 ; 60: ARROW LAUNCHER
                enemyBattleSprAndPlt ARROW_LAUNCHER, 1 ; 61: ROOK
                enemyBattleSprAndPlt HUNTER_GOBLIN, 1 ; 62: DARK SNIPER
                enemyBattleSprAndPlt ARCHER, 2 ; 63: BOW MASTER
                enemyBattleSprAndPlt BOW_RIDER, 0 ; 64: BOW RIDER
                enemyBattleSprAndPlt ARROW_LAUNCHER, 2 ; 65: DARK GUNNER
                enemyBattleSprAndPlt BOW_RIDER, 1 ; 66: HORSEMAN
                enemyBattleSprAndPlt MAGE, 0 ; 67: GALAM MAGE
                enemyBattleSprAndPlt WITCH, 0 ; 68: WITCH
                enemyBattleSprAndPlt MAGE, 1 ; 69: MASTER MAGE
                enemyBattleSprAndPlt WITCH, 1 ; 70: DARK MADAM
                enemyBattleSprAndPlt WITCH, 2 ; 71: QUEEN
                enemyBattleSprAndPlt WIZARD, 0 ; 72: WIZARD
                enemyBattleSprAndPlt NECROMANCER, 0 ; 73: NECROMANCER
                enemyBattleSprAndPlt WIZARD, 1 ; 74: CHAOS WIZARD
                enemyBattleSprAndPlt NECROMANCER, 1 ; 75: DEMON MASTER
                enemyBattleSprAndPlt CLERIC, 0 ; 76: DARK CLERIC
                enemyBattleSprAndPlt MONK, 0 ; 77: DEATH MONK
                enemyBattleSprAndPlt MONK, 1 ; 78: BLACK MONK
                enemyBattleSprAndPlt CLERIC, 1 ; 79: HIGH PRIEST
                enemyBattleSprAndPlt BISHOP, 0 ; 80: EVIL BISHOP
                enemyBattleSprAndPlt BISHOP, 1 ; 81: DARK BISHOP
                enemyBattleSprAndPlt MONK, 2 ; 82: MASTER MONK
                enemyBattleSprAndPlt SHAMAN, 0 ; 83: SHAMAN
                enemyBattleSprAndPlt BISHOP, 2 ; 84: EVIL BISHOP
                enemyBattleSprAndPlt SHAMAN, 1 ; 85: BLUE SHAMAN
                enemyBattleSprAndPlt GIZMO, 0 ; 86: DARK SMOKE
                enemyBattleSprAndPlt KRAKEN_HEAD, 0 ; 87: KRAKEN HEAD
                enemyBattleSprAndPlt TAROS, 0 ; 88: TAROS
                enemyBattleSprAndPlt KING, 1 ; 89: KING
                enemyBattleSprAndPlt RAT, 2 ; 90: WILLARD
                enemyBattleSprAndPlt ZALBARD, 0 ; 91: ZALBARD
                enemyBattleSprAndPlt CAMEELA, 0 ; 92: CAMEELA
                enemyBattleSprAndPlt PRISM_FLOWER, 0 ; 93: PRISM FLOWER
                enemyBattleSprAndPlt RED_BARON, 0 ; 94: RED BARON
                enemyBattleSprAndPlt GESHP, 0 ; 95: GESHP
                enemyBattleSprAndPlt ODD_EYE, 0 ; 96: ODD EYE
                enemyBattleSprAndPlt KING, 0 ; 97: GALAM
                enemyBattleSprAndPlt ZEON, 0 ; 98: ZEON
                enemyBattleSprAndPlt PEGASUS_KNIGHT, 1 ; 99: JAR
                enemyBattleSprAndPlt MAGE, 1 ; 100: MASTER MAGE
                enemyBattleSprAndPlt NECROMANCER, 0 ; 101: NECROMANCER
                enemyBattleSprAndPlt SHAMAN, 1 ; 102: BLUE SHAMAN
