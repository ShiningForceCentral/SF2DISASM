

; ---------------------------------------------------------------------------

; enum Codes
INDEX_SHIFT_COUNT: equ 2
NIBBLE_SHIFT_COUNT: equ 4
BYTE_SHIFT_COUNT: equ 8
BYTE_LOWER_NIBBLE_MASK: equ $F
WORD_SHIFT_COUNT: equ 16
BYTE_UPPER_NIBBLE_MASK: equ $F0
NOTHING_BYTE: equ $FF
TERMINATOR_BYTE: equ $FF
BYTE_MASK: equ $FF
WORD_LOWER_NIBBLE_MASK: equ $F00
WORD_UPPER_NIBBLE_MASK: equ $F000
WORD_UPPER_BYTE_MASK: equ $FF00
NOTHING_WORD: equ $FFFF
TERMINATOR_WORD: equ $FFFF
WORD_MASK: equ $FFFF

; ---------------------------------------------------------------------------

; enum Traps
SOUND_COMMAND: equ 0
CHECK_FLAG: equ 1
SET_FLAG: equ 2
CLEAR_FLAG: equ 3
TEXTBOX: equ 5
MAPSCRIPT: equ 6
VINT_FUNCTIONS: equ 9

; ---------------------------------------------------------------------------

; enum VIntActions
VINTS_CLEAR: equ 0
VINTS_ADD: equ 1
VINTS_REMOVE: equ 2
VINTS_DEACTIVATE: equ 3
VINTS_ACTIVATE: equ 4

; ---------------------------------------------------------------------------

; enum VIntBitmap
VDP_COMMAND_REQUEST: equ 0
DEACTIVATE_DMA: equ 1
DMA_REQUEST: equ 3
VRAM_READ_REQUEST: equ 4
ENABLE_VINT: equ 7

; ---------------------------------------------------------------------------

; enum Animation
ANIM_SPRITE_DEATH_SPIN_DELAY: equ 3 ; number of vints to wait between sprite death spins
ANIM_SPRITE_DEATH_SPINS_NUMBER: equ 11 ; number of sprite death spins to perform

; ---------------------------------------------------------------------------

; enum GraphicsValues
GFX_MAX_SPRITES_TO_LOAD: equ 7 ; maximum number of sprites that can be loaded per VInt
GFX_MAPSPRITE_PIXELS_COUNTER: equ 575
GFX_DIAMOND_MENU_ICON_PIXELS_NUMBER: equ 576

; ---------------------------------------------------------------------------

; enum Combatant

combatantAlliesNumber = 30
combatantAlliesSpaceEnd = 32
combatantEnemiesNumber = 32
combatantSlotsNumber = 64
combatantEnemiesStart = 128

    if (STANDARD_BUILD&EXPANDED_FORCE_MEMBERS=1)
combatantAlliesNumber = 32
    endif

COMBATANT_ALLIES_START: equ 0
COMBATANT_ALLIES_MINUS_PLAYER_AND_CREATURE_COUNTER: equ combatantAlliesNumber-3
COMBATANT_ALLIES_MINUS_PLAYER_COUNTER: equ combatantAlliesNumber-2
COMBATANT_ALLIES_COUNTER: equ combatantAlliesNumber-1
COMBATANT_ALLIES_END: equ combatantAlliesNumber-1
COMBATANT_ALLIES_NUMBER: equ combatantAlliesNumber
COMBATANT_ENEMIES_COUNTER: equ combatantEnemiesNumber-1
COMBATANT_ALLIES_SPACE_END_MINUS_ONE: equ combatantAlliesSpaceEnd-1
COMBATANT_ENEMIES_NUMBER: equ combatantEnemiesNumber
COMBATANT_ALLIES_SPACE_END: equ combatantAlliesSpaceEnd
COMBATANTS_ALL_COUNTER: equ combatantAlliesNumber+combatantEnemiesNumber-1
COMBATANT_SLOTS_NUMBER: equ combatantSlotsNumber
COMBATANT_ENEMIES_START_MINUS_ALLIES_SPACE_END: equ combatantEnemiesStart-combatantAlliesSpaceEnd
COMBATANT_ENEMIES_START: equ combatantEnemiesStart
COMBATANT_ENEMY_INDEX_15: equ combatantEnemiesStart+15
COMBATANT_ENEMIES_END: equ combatantEnemiesStart+combatantEnemiesNumber-1
COMBATANT_ENEMIES_SPACE_END: equ combatantEnemiesStart+combatantEnemiesNumber

; ---------------------------------------------------------------------------

; enum BattleEntity

entrySize = 8

    if (STANDARD_BUILD=1)
entrySize = entrySize+2 ; EXPANDED_MAPSPRITES
    endif

BATTLE_NEUTRAL_ENTITIES_NUMBER: equ 2
BATTLE_NEUTRAL_ENTITY_SIZE: equ entrySize
BATTLE_ENEMY_ENTITIES_COUNTER: equ (BATTLE_ENEMY_ENTITIES_NUMBER-BATTLE_NEUTRAL_ENTITIES_NUMBER)-1
BATTLE_ALLY_ENTITIES_COUNTER: equ BATTLE_ALLY_ENTITIES_NUMBER-1
BATTLE_ENEMY_ENTITIES_NUMBER: equ 32
BATTLE_ALLY_ENTITIES_NUMBER: equ 32
BATTLE_ALL_ENTITIES_COUNTER: equ BATTLE_ALL_ENTITIES_NUMBER-1
BATTLE_ALL_ENTITIES_NUMBER: equ BATTLE_ENEMY_ENTITIES_NUMBER+BATTLE_ALLY_ENTITIES_NUMBER

; ---------------------------------------------------------------------------

; enum Combatant_Bitmap
COMBATANT_BIT_SORT: equ 6
COMBATANT_BIT_ENEMY: equ 7

; ---------------------------------------------------------------------------

; enum Combatant_Masks
COMBATANT_MASK_INDEX: equ $3F
COMBATANT_MASK_SORT_BIT: equ $40
COMBATANT_MASK_INDEX_AND_SORT_BIT: equ $7F
COMBATANT_MASK_ENEMY_BIT: equ $80
COMBATANT_MASK_INDEX_AND_ENEMY_BIT: equ $BF
COMBATANT_MASK_ALL: equ $FF

; ---------------------------------------------------------------------------

; enum Combatant_Type
COMBATANT_TYPE_MASK: equ 1
COMBATANT_TYPE_SIZE: equ 1

; ---------------------------------------------------------------------------

; enum CombatantDataProperties
COMBATANT_ITEMSLOTS_COUNTER: equ 3
COMBATANT_SPELLSLOTS_COUNTER: equ 3
COMBATANT_ITEMSLOTS: equ 4
COMBATANT_SPELLSLOTS: equ 4

; ---------------------------------------------------------------------------

; enum CombatantDataOffsets

combatantByteSize = 1

    if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
combatantByteSize = 2
    endif

                                            rsreset
COMBATANT_OFFSET_NAME:                      rs.b 10*combatantByteSize
COMBATANT_OFFSET_CLASS:                     rs.b combatantByteSize
COMBATANT_OFFSET_LEVEL:                     rs.b combatantByteSize
COMBATANT_OFFSET_HP_MAX:                    rs.w combatantByteSize
COMBATANT_OFFSET_HP_CURRENT:                rs.w combatantByteSize
COMBATANT_OFFSET_MP_MAX:                    rs.b combatantByteSize
COMBATANT_OFFSET_MP_CURRENT:                rs.b combatantByteSize
COMBATANT_OFFSET_ATT_BASE:                  rs.b combatantByteSize
COMBATANT_OFFSET_ATT_CURRENT:               rs.b combatantByteSize
COMBATANT_OFFSET_DEF_BASE:                  rs.b combatantByteSize
COMBATANT_OFFSET_DEF_CURRENT:               rs.b combatantByteSize
COMBATANT_OFFSET_AGI_BASE:                  rs.b combatantByteSize
COMBATANT_OFFSET_AGI_CURRENT:               rs.b combatantByteSize
COMBATANT_OFFSET_MOV_BASE:                  rs.b combatantByteSize
COMBATANT_OFFSET_MOV_CURRENT:               rs.b combatantByteSize
COMBATANT_OFFSET_RESIST_BASE:               rs.b combatantByteSize
COMBATANT_OFFSET_RESIST_BASE_LOW_BYTE:      rs.b combatantByteSize
COMBATANT_OFFSET_RESIST_CURRENT:            rs.w combatantByteSize
COMBATANT_OFFSET_PROWESS_BASE:              rs.b combatantByteSize
COMBATANT_OFFSET_PROWESS_CURRENT:           rs.b combatantByteSize
COMBATANT_OFFSET_ITEMS:                     equ __RS
COMBATANT_OFFSET_ITEM_0:                    rs.w combatantByteSize
COMBATANT_OFFSET_ITEM_1:                    rs.w combatantByteSize
COMBATANT_OFFSET_ITEM_2:                    rs.w combatantByteSize
COMBATANT_OFFSET_ITEM_3:                    rs.w combatantByteSize
COMBATANT_OFFSET_SPELLS:                    rs.b 4*combatantByteSize
COMBATANT_OFFSET_SPELLS_END:                equ __RS
COMBATANT_OFFSET_STATUSEFFECTS:             rs.w combatantByteSize
COMBATANT_OFFSET_X:                         rs.b combatantByteSize
COMBATANT_OFFSET_Y:                         rs.b combatantByteSize
COMBATANT_OFFSET_EXP:                       rs.b combatantByteSize
COMBATANT_OFFSET_MOVETYPE_AND_AI:           rs.b combatantByteSize ; upper nibble holds move type, lower nibble holds AI commandset
COMBATANT_OFFSET_ALLY_KILLS:                equ __RS
COMBATANT_OFFSET_AI_SPECIAL_MOVE_ORDERS:    rs.w combatantByteSize ; upper byte holds combatant index to follow or first AI point if bit 6 is set, lower byte holds second AI point
COMBATANT_OFFSET_ACTIVATION_BITFIELD:        rs.w combatantByteSize ; set to 1 when AI is activated (some battles/enemies have a unique value)
COMBATANT_OFFSET_ALLY_DEFEATS:              equ __RS
COMBATANT_OFFSET_AI_REGION:                 rs.b combatantByteSize ; upper nibble holds activation region index 1, lower nibble holds activation region index 2
COMBATANT_OFFSET_ENEMY_INDEX:               rs.b combatantByteSize
COMBATANT_DATA_ENTRY_SIZE:                  equ __RS

; ---------------------------------------------------------------------------

; enum CombatantDataSize

combatantEntrySize = COMBATANT_DATA_ENTRY_SIZE
combatantEntryRealSize = combatantEntrySize

    if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
combatantEntryRealSize = combatantEntryRealSize/2
    endif

COMBATANT_DATA_ENTRY_SIZE: equ combatantEntrySize ; data appears twice as large to the CPU when read from an 8-bit peripheral (i.e., the SaveRAM)
COMBATANT_DATA_ENTRY_REAL_SIZE: equ combatantEntryRealSize

; ---------------------------------------------------------------------------

; enum StatusEffects_Bitmap
STATUSEFFECT_BIT_STUN: equ 0
STATUSEFFECT_BIT_POISON: equ 1
STATUSEFFECT_BIT_CURSE: equ 2

; ---------------------------------------------------------------------------

; enum StatusEffectCounters
STATUSEFFECTCOUNTER_MUDDLE: equ $10
STATUSEFFECTCOUNTER_SLEEP: equ $40
STATUSEFFECTCOUNTER_SILENCE: equ $100
STATUSEFFECTCOUNTER_SLOW: equ $400
STATUSEFFECTCOUNTER_BOOST: equ $1000
STATUSEFFECTCOUNTER_ATTACK: equ $4000

; ---------------------------------------------------------------------------

; enum StatusEffects (bitfield)
STATUSEFFECT_STUN: equ 1
STATUSEFFECT_POISON: equ 2
STATUSEFFECT_CURSE: equ 4
STATUSEFFECT_MUDDLE2: equ 8
STATUSEFFECT_MUDDLE: equ $30
STATUSEFFECT_SLEEP: equ $C0
STATUSEFFECT_SILENCE: equ $300
STATUSEFFECT_SLOW: equ $C00
STATUSEFFECT_BOOST: equ $3000
STATUSEFFECT_ATTACK: equ $C000

; ---------------------------------------------------------------------------

; enum StatusEffect_None
STATUSEFFECT_NONE: equ 0

; ---------------------------------------------------------------------------

; enum StatusAnimations
STATUSANIMATION_NONE: equ 0
STATUSANIMATION_SILENCE_CROSS: equ 1
STATUSANIMATION_DIZZY_STARS: equ 2
STATUSANIMATION_ZZZS: equ 3
STATUSANIMATION_STUN_LINES: equ 4

; ---------------------------------------------------------------------------

; enum CharDef
CHAR_CLASS_LASTNONPROMOTED: equ 11
CHAR_CLASS_FIRSTPROMOTED: equ 12
CHAR_CLASS_EXTRALEVEL: equ 20
CHAR_STATGAIN_PROJECTIONLEVEL: equ 30
CHAR_LEVELCAP_BASE: equ 40
CHAR_LEVELCAP_PROMOTED: equ 99
CHAR_STATCAP_AGI_BASE: equ 100
CHAR_STATCAP_AGI_CURRENT: equ 127
CHAR_STATCAP_LEVEL: equ 200
CHAR_STATCAP_HP: equ 200
CHAR_STATCAP_MP: equ 200
CHAR_STATCAP_ATT: equ 200
CHAR_STATCAP_DEF: equ 200
CHAR_STATCAP_MOV: equ 200
CHAR_STATCAP_EXP: equ 200
CHAR_STATCAP_AGI_DECREASING: equ 200

; ---------------------------------------------------------------------------

; enum BattleTurnProperties
TURN_AGILITY_MASK: equ $7F
TWO_TURN_THRESHOLD: equ $80

; ---------------------------------------------------------------------------

; enum ClassDef_Offsets
CLASSDEF_OFFSET_MOV: equ 0
CLASSDEF_OFFSET_RESISTANCE: equ 1
CLASSDEF_OFFSET_MOVETYPE: equ 3
CLASSDEF_OFFSET_PROWESS: equ 4

; ---------------------------------------------------------------------------

; enum ClassDef_Properties
CLASSDEF_ENTRY_SIZE: equ 5

; ---------------------------------------------------------------------------

; enum Resistance (bitfield)
RESISTANCE_WIND_MINOR: equ 1
RESISTANCE_WIND_MAJOR: equ 2
RESISTANCE_WIND_WEAKNESS: equ 3
RESISTANCE_LIGHTNING_MINOR: equ 4
RESISTANCE_LIGHTNING_MAJOR: equ 8
RESISTANCE_LIGHTNING_WEAKNESS: equ $C
RESISTANCE_ICE_MINOR: equ $10
RESISTANCE_ICE_MAJOR: equ $20
RESISTANCE_ICE_WEAKNESS: equ $30
RESISTANCE_FIRE_MINOR: equ $40
RESISTANCE_FIRE_MAJOR: equ $80
RESISTANCE_FIRE_WEAKNESS: equ $C0
RESISTANCE_NEUTRAL_MINOR: equ $100
RESISTANCE_NEUTRAL_MAJOR: equ $200
RESISTANCE_NEUTRAL_WEAKNESS: equ $300
RESISTANCE_UNDEFINED1_MINOR: equ $400
RESISTANCE_UNDEFINED1_MAJOR: equ $800
RESISTANCE_UNDEFINED1_WEAKNESS: equ $C00
RESISTANCE_UNDEFINED2_MINOR: equ $1000
RESISTANCE_UNDEFINED2_MAJOR: equ $2000
RESISTANCE_UNDEFINED2_WEAKNESS: equ $3000
RESISTANCE_STATUS_MINOR: equ $4000
RESISTANCE_STATUS_MAJOR: equ $8000
RESISTANCE_STATUS_IMMUNITY: equ $C000

; ---------------------------------------------------------------------------

; enum Resistance_None
RESISTANCE_NONE: equ 0
RESISTANCE_WIND_NONE: equ 0
RESISTANCE_LIGHTNING_NONE: equ 0
RESISTANCE_ICE_NONE: equ 0
RESISTANCE_FIRE_NONE: equ 0
RESISTANCE_NEUTRAL_NONE: equ 0
RESISTANCE_UNDEFINED1_NONE: equ 0
RESISTANCE_UNDEFINED2_NONE: equ 0
RESISTANCE_STATUS_NONE: equ 0

; ---------------------------------------------------------------------------

; enum ResistanceEntry
RESISTANCEENTRY_LOWERMASK_SETTING: equ 3
RESISTANCEENTRY_MASK_ALL: equ $C0FF

RESIST_GROUP1_MASK: equ $FF00
RESIST_GROUP2_MASK: equ $FF

; ---------------------------------------------------------------------------

; enum ResistanceSettings
RESISTANCESETTING_NEUTRAL: equ 0
RESISTANCESETTING_MINOR: equ 1
RESISTANCESETTING_MAJOR: equ 2
RESISTANCESETTING_WEAKNESS: equ 3
RESISTANCESETTING_STATUSEFFECT_IMMUNITY: equ 3

; ---------------------------------------------------------------------------

; enum MoveType (bitfield)
MOVETYPE_LOWER_REGULAR: equ 1
MOVETYPE_LOWER_CENTAUR: equ 2
MOVETYPE_LOWER_STEALTH: equ 3
MOVETYPE_LOWER_BRASS_GUNNER: equ 4
MOVETYPE_LOWER_FLYING: equ 5
MOVETYPE_LOWER_HOVERING: equ 6
MOVETYPE_LOWER_AQUATIC: equ 7
MOVETYPE_LOWER_ARCHER: equ 8
MOVETYPE_LOWER_CENTAUR_ARCHER: equ 9
MOVETYPE_LOWER_STEALTH_ARCHER: equ $A
MOVETYPE_LOWER_MAGE: equ $B
MOVETYPE_LOWER_HEALER: equ $C
MOVETYPE_UPPER_REGULAR: equ $10
MOVETYPE_UPPER_CENTAUR: equ $20
MOVETYPE_UPPER_STEALTH: equ $30
MOVETYPE_UPPER_BRASS_GUNNER: equ $40
MOVETYPE_UPPER_FLYING: equ $50
MOVETYPE_UPPER_HOVERING: equ $60
MOVETYPE_UPPER_AQUATIC: equ $70
MOVETYPE_UPPER_ARCHER: equ $80
MOVETYPE_UPPER_CENTAUR_ARCHER: equ $90
MOVETYPE_UPPER_STEALTH_ARCHER: equ $A0
MOVETYPE_UPPER_MAGE: equ $B0
MOVETYPE_UPPER_HEALER: equ $C0

; ---------------------------------------------------------------------------

; enum MoveTypeProperties
MOVETYPE_TOTAL: equ 13

; ---------------------------------------------------------------------------

; enum Prowess (bitfield)

critical150_1in32 = 0
critical125_1in32 = 1
critical150_1in16 = 2
critical125_1in16 = 3
critical150_1in8 = 4
critical125_1in8 = 5
critical150_1in4 = 6
critical125_1in4 = 7

    if (STANDARD_BUILD&FIX_CRITICAL_HIT_DEFINITIONS=1)
critical125_1in32 = 0
critical150_1in32 = 1
critical125_1in16 = 2
critical150_1in16 = 3
critical125_1in8 = 4
critical150_1in8 = 5
critical125_1in4 = 6
critical150_1in4 = 7
    endif

PROWESS_CRITICAL150_1IN32: equ critical150_1in32
PROWESS_CRITICAL125_1IN32: equ critical125_1in32
PROWESS_CRITICAL150_1IN16: equ critical150_1in16
PROWESS_CRITICAL125_1IN16: equ critical125_1in16
PROWESS_CRITICAL150_1IN8: equ critical150_1in8
PROWESS_CRITICAL125_1IN8: equ critical125_1in8
PROWESS_CRITICAL150_1IN4: equ critical150_1in4
PROWESS_CRITICAL125_1IN4: equ critical125_1in4
PROWESS_CRITICAL_NONE: equ 8
PROWESS_CRITICAL_POISON: equ 9
PROWESS_CRITICAL_SLEEP: equ $A
PROWESS_CRITICAL_STUN: equ $B
PROWESS_CRITICAL_MUDDLE: equ $C
PROWESS_CRITICAL_SLOW: equ $D
PROWESS_CRITICAL_MAGIC_DRAIN: equ $E
PROWESS_CRITICAL_SILENCE: equ $F
PROWESS_DOUBLE_1IN32: equ 0
PROWESS_DOUBLE_1IN16: equ $10
PROWESS_DOUBLE_1IN8: equ $20
PROWESS_DOUBLE_1IN4: equ $30
PROWESS_COUNTER_1IN32: equ 0
PROWESS_COUNTER_1IN16: equ $40
PROWESS_COUNTER_1IN8: equ $80
PROWESS_COUNTER_1IN4: equ $C0

; ---------------------------------------------------------------------------

; enum Prowess_Masks (bitfield)
PROWESS_MASK_CRITICAL: equ $F
PROWESS_MASK_DOUBLE: equ $30
PROWESS_MASK_COUNTER: equ $C0

; ---------------------------------------------------------------------------

; enum Prowess_Properties
PROWESS_MASK_LOWER_DOUBLE_OR_COUNTER: equ 3 ; mask double or counter attack setting after it has been shifted to lower position
PROWESS_LOWER_DOUBLE_SHIFT_COUNT: equ 4 ; double attack setting shift count to/from lower position
PROWESS_LOWER_COUNTER_SHIFT_COUNT: equ 6 ; counter attack setting shift count to/from lower position
PROWESS_INFLICT_AILMENTS_START: equ 9

; ---------------------------------------------------------------------------

; enum CriticalHitDef_Offsets
CRITICALHITDEF_OFFSET_CHANCE: equ 0
CRITICALHITDEF_OFFSET_DAMAGE_FACTOR: equ 1

; ---------------------------------------------------------------------------

; enum CriticalHitDamageFactors

factor1 = 1
factor2 = 2

    if (STANDARD_BUILD&FIX_CRITICAL_HIT_DEFINITIONS=1)
factor1 = 2
factor2 = 1
    endif

CRITICAL_HIT_DAMAGE_FACTOR_1: equ factor1
CRITICAL_HIT_DAMAGE_FACTOR_2: equ factor2

; ---------------------------------------------------------------------------

; enum Classes
CLASS_SDMN: equ 0
CLASS_KNTE: equ 1
CLASS_WARR: equ 2
CLASS_MAGE: equ 3
CLASS_PRST: equ 4
CLASS_ACHR: equ 5
CLASS_BDMN: equ 6
CLASS_WFMN: equ 7
CLASS_RNGR: equ 8
CLASS_PHNK: equ 9
CLASS_THIF: equ 10
CLASS_TORT: equ 11
CLASS_HERO: equ 12
CLASS_PLDN: equ 13
CLASS_PGNT: equ 14
CLASS_GLDT: equ 15
CLASS_BRN: equ 16
CLASS_WIZ: equ 17
CLASS_SORC: equ 18
CLASS_VICR: equ 19
CLASS_MMNK: equ 20
CLASS_SNIP: equ 21
CLASS_BRGN: equ 22
CLASS_BDBT: equ 23
CLASS_WFBR: equ 24
CLASS_BWNT: equ 25
CLASS_PHNX: equ 26
CLASS_NINJ: equ 27
CLASS_MNST: equ 28
CLASS_RBT: equ 29
CLASS_GLM: equ 30
CLASS_RDBN: equ 31
    if (STANDARD_BUILD&EXPANDED_CLASSES=1)
CLASS_32: equ 32
CLASS_33: equ 33
CLASS_34: equ 34
CLASS_35: equ 35
CLASS_36: equ 36
CLASS_37: equ 37
CLASS_38: equ 38
CLASS_39: equ 39
CLASS_40: equ 40
CLASS_41: equ 41
CLASS_42: equ 42
CLASS_43: equ 43
CLASS_44: equ 44
CLASS_45: equ 45
CLASS_46: equ 46
CLASS_47: equ 47
CLASS_48: equ 48
CLASS_49: equ 49
CLASS_50: equ 50
CLASS_51: equ 51
CLASS_52: equ 52
CLASS_53: equ 53
CLASS_54: equ 54
CLASS_55: equ 55
CLASS_56: equ 56
CLASS_57: equ 57
CLASS_58: equ 58
CLASS_59: equ 59
CLASS_60: equ 60
CLASS_61: equ 61
CLASS_62: equ 62
CLASS_63: equ 63
    endif
CLASS_NONE: equ 255

; ---------------------------------------------------------------------------

; enum ClassIndex

classTotal = 32
classMask = $1F

    if (STANDARD_BUILD&EXPANDED_CLASSES=1)
classTotal = 64
classMask = $3F
    endif
    
CLASS_MASK_INDEX: equ classMask
CLASS_NUMBER_TOTAL: equ classTotal

; ---------------------------------------------------------------------------

; enum ClassTypes
CLASSTYPE_BASE: equ 0
CLASSTYPE_PROMO: equ 1
CLASSTYPE_SPECIAL: equ 2
CLASSTYPE_REDBARON: equ 255

; ---------------------------------------------------------------------------

; enum Force
FORCE_MAX_SIZE: equ 12
FORCE_MAX_GOLD: equ 9999999

; ---------------------------------------------------------------------------

; enum Enemies
ENEMY_OOZE: equ 0
ENEMY_HUGE_RAT: equ 1
ENEMY_GALAM_SOLDIER: equ 2
ENEMY_GALAM_KNIGHT: equ 3
ENEMY_GOBLIN: equ 4
ENEMY_GREEN_OOZE: equ 5
ENEMY_DARK_DWARF: equ 6
ENEMY_HOBGOBLIN: equ 7
ENEMY_ZOMBIE: equ 8
ENEMY_GOLEM: equ 9
ENEMY_KRAKEN_LEG: equ 10
ENEMY_SOULSOWER: equ 11
ENEMY_ORC: equ 12
ENEMY_PAWN: equ 13
ENEMY_KNIGHT: equ 14
ENEMY_RAT: equ 15
ENEMY_BUBBLING_OOZE: equ 16
ENEMY_SKELETON: equ 17
ENEMY_DARK_SOLDIER: equ 18
ENEMY_LIZARDMAN: equ 19
ENEMY_WORM: equ 20
ENEMY_DARK_KNIGHT: equ 21
ENEMY_ORC_LORD: equ 22
ENEMY_DEVIL_SOLDIER: equ 23
ENEMY_CERBERUS: equ 24
ENEMY_MUD_MAN: equ 25
ENEMY_DRAGONEWT: equ 26
ENEMY_PURPLE_WORM: equ 27
ENEMY_EXECUTIONER: equ 28
ENEMY_HELL_HOUND: equ 29
ENEMY_MINOTAUR: equ 30
ENEMY_CYCLOPS: equ 31
ENEMY_BURST_ROCK: equ 32
ENEMY_HYDRA: equ 33
ENEMY_CHAOS_WARRIOR: equ 34
ENEMY_REAPER: equ 35
ENEMY_EVIL_BEAST: equ 36
ENEMY_PYROHYDRA: equ 37
ENEMY_ZEON_GUARD: equ 38
ENEMY_GIZMO: equ 39
ENEMY_HUGE_BAT: equ 40
ENEMY_VAMPIRE_BAT: equ 41
ENEMY_EVIL_CLOUD: equ 42
ENEMY_GARGOYLE: equ 43
ENEMY_HARPY: equ 44
ENEMY_LESSER_DEMON: equ 45
ENEMY_WYVERN: equ 46
ENEMY_HARPY_QUEEN: equ 47
ENEMY_PEGASUS_KNIGHT: equ 48
ENEMY_GRIFFIN: equ 49
ENEMY_MIST_DEMON: equ 50
ENEMY_WHITE_DRAGON: equ 51
ENEMY_DEMON: equ 52
ENEMY_CHAOS_DRAGON: equ 53
ENEMY_DEVIL_GRIFFIN: equ 54
ENEMY_ARCH_DEMON: equ 55
ENEMY_GALAM_ARCHER: equ 56
ENEMY_HUNTER_GOBLIN: equ 57
ENEMY_DEATH_ARCHER: equ 58
ENEMY_KRAKEN_ARM: equ 59
ENEMY_ARROW_LAUNCHER: equ 60
ENEMY_ROOK: equ 61
ENEMY_DARK_SNIPER: equ 62
ENEMY_BOW_MASTER: equ 63
ENEMY_BOW_RIDER: equ 64
ENEMY_DARK_GUNNER: equ 65
ENEMY_HORSEMAN: equ 66
ENEMY_GALAM_MAGE: equ 67
ENEMY_WITCH: equ 68
ENEMY_MASTER_MAGE: equ 69
ENEMY_DARK_MADAM: equ 70
ENEMY_QUEEN: equ 71
ENEMY_WIZARD: equ 72
ENEMY_NECROMANCER: equ 73
ENEMY_CHAOS_WIZARD: equ 74
ENEMY_DEMON_MASTER: equ 75
ENEMY_DARK_CLERIC: equ 76
ENEMY_DEATH_MONK: equ 77
ENEMY_BLACK_MONK: equ 78
ENEMY_HIGH_PRIEST: equ 79
ENEMY_BISHOP: equ 80
ENEMY_DARK_BISHOP: equ 81
ENEMY_MASTER_MONK: equ 82
ENEMY_SHAMAN: equ 83
ENEMY_EVIL_BISHOP: equ 84
ENEMY_BLUE_SHAMAN: equ 85
ENEMY_DARK_SMOKE: equ 86
ENEMY_KRAKEN_HEAD: equ 87
ENEMY_TAROS: equ 88
ENEMY_KING: equ 89
ENEMY_WILLARD: equ 90
ENEMY_ZALBARD: equ 91
ENEMY_CAMEELA: equ 92
ENEMY_PRISM_FLOWER: equ 93
ENEMY_RED_BARON: equ 94
ENEMY_GESHP: equ 95
ENEMY_ODD_EYE: equ 96
ENEMY_GALAM: equ 97
ENEMY_ZEON: equ 98
ENEMY_JAR: equ 99
ENEMY_MASTER_MAGE_0: equ 100
ENEMY_NECROMANCER_0: equ 101
ENEMY_BLUE_SHAMAN_0: equ 102

; ---------------------------------------------------------------------------

; enum EnemyDef
ENEMYDEF_OFFSET_SPELLPOWER: equ 10
ENEMYDEF_OFFSET_MOVETYPE: equ 49
ENEMYDEF_ENTRY_SIZE: equ 56

; ---------------------------------------------------------------------------

; enum SpellPower
SPELLPOWER_REGULAR: equ 0
SPELLPOWER_ENHANCED: equ 99 ; spell power increased by 25%

; ---------------------------------------------------------------------------

; enum AiCommandsets
AICOMMANDSET_HEALER1: equ 0
AICOMMANDSET_HEALER2: equ 1
AICOMMANDSET_HEALER3: equ 2
AICOMMANDSET_HEALER4: equ 3
AICOMMANDSET_HEALER5: equ 4
AICOMMANDSET_HEALER6: equ 5
AICOMMANDSET_ATTACKER1: equ 6
AICOMMANDSET_ATTACKER2: equ 7
AICOMMANDSET_SENTRY: equ 8
AICOMMANDSET_ATTACKER3: equ 9
AICOMMANDSET_INACTIVE: equ $A
AICOMMANDSET_11: equ $B
AICOMMANDSET_SUPPORT: equ $C
AICOMMANDSET_CRITICAL: equ $D
AICOMMANDSET_LEADER: equ $E
AICOMMANDSET_SWARM: equ $F

; ---------------------------------------------------------------------------

; enum AiOrders
AIORDER_FOLLOW_TARGET: equ 0
AIORDER_MOVE_TO: equ $40
AIORDER_FOLLOW_ENEMY: equ $80
AIORDER_NONE: equ $FF

; ---------------------------------------------------------------------------

; enum SpawnSettings
SPAWN_STARTING: equ 0
SPAWN_RESPAWN: equ 1
SPAWN_HIDDEN: equ 2

; ---------------------------------------------------------------------------

; enum EnemyAi
ENEMYAI_THRESHOLD_HEAL1: equ 2
ENEMYAI_MIN_MP_HEAL1: equ 3
ENEMYAI_MIN_MP_HEAL2: equ 5
ENEMYAI_MIN_MP_AURA1: equ 7
ENEMYAI_MIN_MP_HEAL3: equ 11
ENEMYAI_MIN_MP_AURA2: equ 11
ENEMYAI_THRESHOLD_HEAL2: equ 14
ENEMYAI_MIN_MP_AURA3: equ 18
ENEMYAI_MIN_MP_HEAL4: equ 20
ENEMYAI_THRESHOLD_HEAL3: equ 28
ENEMYAI_MIN_MP_AURA4: equ 30

; ---------------------------------------------------------------------------

; enum IconProperties

iconTilesOffsetCracks = $6F00

    if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
iconTilesOffsetCracks = $C0C0
    endif

ICON_PIXELS_LONGWORD_COUNTER: equ $2F
ICON_PIXELS_BYTE_COUNTER: equ $BF
ICON_TILE_BYTESIZE: equ $C0
ICONS_OFFSET_CRACKS: equ iconTilesOffsetCracks

; ---------------------------------------------------------------------------

; enum Icons

iconUnarmed         = 128
iconSpellsStart     = 130
iconJewelOfLight    = 146
iconJewelOfEvil     = 147

    if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
iconUnarmed         = 256
iconSpellsStart     = 258
iconJewelOfLight    = 321
iconJewelOfEvil     = 322
    endif

ICON_NOTHING: equ ITEM_NOTHING
ICON_UNARMED: equ iconUnarmed
ICON_SPELLS_START: equ iconSpellsStart ; HEAL
ICON_JEWEL_OF_LIGHT: equ iconJewelOfLight
ICON_JEWEL_OF_EVIL: equ iconJewelOfEvil

; ---------------------------------------------------------------------------

; enum Controller_Input (bitfield)
INPUT_UP: equ 1
INPUT_DOWN: equ 2
INPUT_LEFT: equ 4
INPUT_RIGHT: equ 8
INPUT_B: equ $10
INPUT_C: equ $20
INPUT_A: equ $40
INPUT_START: equ $80

; ---------------------------------------------------------------------------

; enum Controller_Input_A_Bitmap
INPUT_BIT_UP: equ 0
INPUT_BIT_DOWN: equ 1
INPUT_BIT_LEFT: equ 2
INPUT_BIT_RIGHT: equ 3
INPUT_BIT_B: equ 4
INPUT_BIT_C: equ 5
INPUT_BIT_A: equ 6
INPUT_BIT_START: equ 7

; ---------------------------------------------------------------------------

; enum ItemDef_Offsets

maxRange = 4
minRange = 5
itemPrice = 6
itemTypeOffset = 8
useSpellOffset = 9
equipEffectsOffset = 10

    if (STANDARD_BUILD&EXPANDED_CLASSES=1)
maxRange = 8
minRange = 9
itemPrice = 10
itemTypeOffset = 12
useSpellOffset = 13
equipEffectsOffset = 14
    endif
    
ITEMDEF_OFFSET_EQUIPFLAGS: equ 0
ITEMDEF_OFFSET_MAX_RANGE: equ maxRange
ITEMDEF_OFFSET_MIN_RANGE: equ minRange
ITEMDEF_OFFSET_PRICE: equ itemPrice
ITEMDEF_OFFSET_TYPE: equ itemTypeOffset
ITEMDEF_OFFSET_USE_SPELL: equ useSpellOffset
ITEMDEF_OFFSET_EQUIPEFFECTS: equ equipEffectsOffset

; ---------------------------------------------------------------------------

; enum ItemDef_Properties

itemDefSize = 16

    if (STANDARD_BUILD&EXPANDED_CLASSES=1)
itemDefSize = 20
    endif
    
ITEMDEF_SIZE: equ itemDefSize

; ---------------------------------------------------------------------------

; enum EquipFlags (bitfield)
EQUIPFLAG_SDMN: equ 1
EQUIPFLAG_KNTE: equ 2
EQUIPFLAG_WARR: equ 4
EQUIPFLAG_MAGE: equ 8
EQUIPFLAG_PRST: equ $10
EQUIPFLAG_ACHR: equ $20
EQUIPFLAG_BDMN: equ $40
EQUIPFLAG_WFMN: equ $80
EQUIPFLAG_RNGR: equ $100
EQUIPFLAG_PHNK: equ $200
EQUIPFLAG_THIF: equ $400
EQUIPFLAG_TORT: equ $800
EQUIPFLAG_HERO: equ $1000
EQUIPFLAG_PLDN: equ $2000
EQUIPFLAG_PGNT: equ $4000
EQUIPFLAG_GLDT: equ $8000
EQUIPFLAG_BRN: equ $10000
EQUIPFLAG_WIZ: equ $20000
EQUIPFLAG_SORC: equ $40000
EQUIPFLAG_VICR: equ $80000
EQUIPFLAG_MMNK: equ $100000
EQUIPFLAG_SNIP: equ $200000
EQUIPFLAG_BRGN: equ $400000
EQUIPFLAG_BDBT: equ $800000
EQUIPFLAG_WFBR: equ $1000000
EQUIPFLAG_BWNT: equ $2000000
EQUIPFLAG_PHNX: equ $4000000
EQUIPFLAG_NINJ: equ $8000000
EQUIPFLAG_MNST: equ $10000000
EQUIPFLAG_RBT: equ $20000000
EQUIPFLAG_GLM: equ $40000000
EQUIPFLAG_RDBN: equ $80000000
    if (STANDARD_BUILD&EXPANDED_CLASSES=1)
EQUIPFLAG2_32: equ $1
EQUIPFLAG2_33: equ $2
EQUIPFLAG2_34: equ $4
EQUIPFLAG2_35: equ $8
EQUIPFLAG2_36: equ $10
EQUIPFLAG2_37: equ $20
EQUIPFLAG2_38: equ $40
EQUIPFLAG2_39: equ $80
EQUIPFLAG2_40: equ $100
EQUIPFLAG2_41: equ $200
EQUIPFLAG2_42: equ $400
EQUIPFLAG2_43: equ $800
EQUIPFLAG2_44: equ $1000
EQUIPFLAG2_45: equ $2000
EQUIPFLAG2_46: equ $4000
EQUIPFLAG2_47: equ $8000
EQUIPFLAG2_48: equ $10000
EQUIPFLAG2_49: equ $20000
EQUIPFLAG2_50: equ $40000
EQUIPFLAG2_51: equ $80000
EQUIPFLAG2_52: equ $100000
EQUIPFLAG2_53: equ $200000
EQUIPFLAG2_54: equ $400000
EQUIPFLAG2_55: equ $800000
EQUIPFLAG2_56: equ $1000000
EQUIPFLAG2_57: equ $2000000
EQUIPFLAG2_58: equ $4000000
EQUIPFLAG2_59: equ $8000000
EQUIPFLAG2_60: equ $10000000
EQUIPFLAG2_61: equ $20000000
EQUIPFLAG2_62: equ $40000000
EQUIPFLAG2_63: equ $80000000
    endif

; ---------------------------------------------------------------------------

; enum EquipFlags_Other
EQUIPFLAG_NONE: equ 0
EQUIPFLAG_ALL: equ -1
    if (STANDARD_BUILD&EXPANDED_CLASSES=1)
EQUIPFLAG2_NONE: equ 0
EQUIPFLAG2_ALL: equ -1
    endif

; ---------------------------------------------------------------------------

; enum EquipEffects
    if (STANDARD_BUILD&ADDITIONAL_EQUIPEFFECTS=1)
EQUIPEFFECT_NONE: equ 0
EQUIPEFFECT_UNDEFINED1: equ EQUIPEFFECT_NONE
EQUIPEFFECT_UNDEFINED2: equ EQUIPEFFECT_NONE
EQUIPEFFECT_INCREASE_ATT: equ 1
EQUIPEFFECT_INCREASE_DEF: equ 2
EQUIPEFFECT_INCREASE_AGI: equ 3
EQUIPEFFECT_INCREASE_MOV: equ 4
EQUIPEFFECT_INCREASE_CRITICAL: equ 5
EQUIPEFFECT_INCREASE_DOUBLE: equ 6
EQUIPEFFECT_INCREASE_COUNTER: equ 7
EQUIPEFFECT_INCREASE_RES_WIND_ELEC_ICE_FIRE: equ 8
EQUIPEFFECT_INCREASE_RES_NEUTRAL_STATUS: equ 9
EQUIPEFFECT_DECREASE_ATT: equ 10
EQUIPEFFECT_DECREASE_DEF: equ 11
EQUIPEFFECT_DECREASE_AGI: equ 12
EQUIPEFFECT_DECREASE_MOV: equ 13
EQUIPEFFECT_DECREASE_CRITICAL: equ 14
EQUIPEFFECT_DECREASE_DOUBLE: equ 15
EQUIPEFFECT_DECREASE_COUNTER: equ 16
EQUIPEFFECT_DECREASE_RES_WIND_ELEC_ICE_FIRE: equ 17
EQUIPEFFECT_DECREASE_RES_NEUTRAL_STATUS: equ 18
EQUIPEFFECT_SET_ATT: equ 19
EQUIPEFFECT_SET_DEF: equ 20
EQUIPEFFECT_SET_AGI: equ 21
EQUIPEFFECT_SET_MOV: equ 22
EQUIPEFFECT_SET_CRITICAL: equ 23
EQUIPEFFECT_SET_DOUBLE: equ 24
EQUIPEFFECT_SET_COUNTER: equ 25
EQUIPEFFECT_SET_RES_WIND_ELEC_ICE_FIRE: equ 26
EQUIPEFFECT_SET_RES_NEUTRAL_STATUS: equ 27
EQUIPEFFECT_SET_STATUS: equ 28
    else
EQUIPEFFECT_NONE: equ 0 
EQUIPEFFECT_UNDEFINED1: equ 1 
EQUIPEFFECT_INCREASE_CRITICAL: equ 2 
EQUIPEFFECT_INCREASE_DOUBLE: equ 3 
EQUIPEFFECT_INCREASE_COUNTER: equ 4 
EQUIPEFFECT_UNDEFINED2: equ 5 
EQUIPEFFECT_INCREASE_ATT: equ 6 
EQUIPEFFECT_INCREASE_DEF: equ 7 
EQUIPEFFECT_INCREASE_AGI: equ 8 
EQUIPEFFECT_INCREASE_MOV: equ 9 
EQUIPEFFECT_DECREASE_ATT: equ 10 
EQUIPEFFECT_DECREASE_DEF: equ 11 
EQUIPEFFECT_DECREASE_AGI: equ 12 
EQUIPEFFECT_DECREASE_MOV: equ 13 
EQUIPEFFECT_SET_CRITICAL: equ 14 
EQUIPEFFECT_SET_DOUBLE: equ 15 
EQUIPEFFECT_SET_COUNTER: equ 16 
    endif

; ---------------------------------------------------------------------------

; enum EquipEffects_ResistanceParameters (bitfield)
    if (STANDARD_BUILD&ADDITIONAL_EQUIPEFFECTS=1)
MODIFY_WIND1: equ $1
MODIFY_WIND2: equ $2
MODIFY_WIND3: equ $3
MODIFY_ELEC1: equ $4
MODIFY_ELEC2: equ $8
MODIFY_ELEC3: equ $C
MODIFY_ICE1: equ $10
MODIFY_ICE2: equ $20
MODIFY_ICE3: equ $30
MODIFY_FIRE1: equ $40
MODIFY_FIRE2: equ $80
MODIFY_FIRE3: equ $C0
MODIFY_NEUTRAL1: equ $1
MODIFY_NEUTRAL2: equ $2
MODIFY_NEUTRAL3: equ $3
MODIFY_STATUS1: equ $40
MODIFY_STATUS2: equ $80
MODIFY_STATUS3: equ $C0
    endif

; ---------------------------------------------------------------------------

; enum EquipEffects_StatusEffectParameters (bitfield)
    if (STANDARD_BUILD&ADDITIONAL_EQUIPEFFECTS=1)
STATUS_STUN: equ $0
STATUS_POISON: equ $1
STATUS_CURSE: equ $2
STATUS_MUDDLE2: equ $3
STATUS_MUDDLE: equ $5
STATUS_SLEEP: equ $7
STATUS_SILENCE: equ $9
STATUS_SLOW: equ $B
STATUS_BOOST: equ $D
STATUS_ATTACK: equ $F
    endif

; ---------------------------------------------------------------------------

; enum EquipEffects_Properties

effectsCounter = 1
totalEffects = 17

    if (STANDARD_BUILD&ADDITIONAL_EQUIPEFFECTS=1)
effectsCounter = 2
totalEffects = 29
    endif

EQUIPEFFECTS_COUNTER: equ effectsCounter
EQUIPEFFECTS_ENTRY_SIZE: equ 2
EQUIPEFFECTS_MAX_INDEX: equ totalEffects

; ---------------------------------------------------------------------------

; enum ShopProperties

shopsNumber: = 31
shopsMaxIndex: = shopsNumber-1
shopsDebugMaxIndex: = 100

    if (STANDARD_BUILD&TEST_BUILD=1)
shopsDebugMaxIndex: = shopsMaxIndex
    endif

ITEMS_PER_SHOP_PAGE: equ 6
SHOPS_MAX_INDEX: equ shopsMaxIndex
SHOPS_NUMBER:  equ shopsNumber
SHOPS_DEBUG_MAX_INDEX: equ shopsDebugMaxIndex

; ---------------------------------------------------------------------------

; enum Shops
SHOP_WEAPON_GRANSEAL: equ 0
SHOP_WEAPON_GALAM_0: equ 1
SHOP_WEAPON_NEW_GRANSEAL_0: equ 2
SHOP_WEAPON_RIBBLE: equ 3
SHOP_WEAPON_POLCA: equ 4
SHOP_WEAPON_BEDOE: equ 5
SHOP_WEAPON_HASSAN_0: equ 6
SHOP_WEAPON_HASSAN_1: equ 7
SHOP_WEAPON_NEW_GRANSEAL_1: equ 8
SHOP_WEAPON_KETTO: equ 9
SHOP_WEAPON_PACALON: equ 10
SHOP_WEAPON_TRISTAN: equ 11
SHOP_WEAPON_MOUN: equ 12
SHOP_WEAPON_ROFT: equ 13
SHOP_WEAPON_GALAM_1: equ 14
SHOP_ITEM_GRANSEAL: equ 15
SHOP_ITEM_GALAM_0: equ 16
SHOP_ITEM_NEW_GRANSEAL_0: equ 17
SHOP_ITEM_RIBBLE: equ 18
SHOP_ITEM_POLCA: equ 19
SHOP_ITEM_BEDOE: equ 20
SHOP_ITEM_HASSAN: equ 21
SHOP_MINATURES_ROOM: equ 22                     ; made available in the Desktop Kingdom if MINIATURES_SHOP=1
SHOP_ITEM_NEW_GRANSEAL_1: equ 23
SHOP_ITEM_PACALON: equ 25
SHOP_ITEM_TRISTAN: equ 26
SHOP_ITEM_MOUN: equ 27
SHOP_ITEM_KETTO: equ 27
SHOP_DWARVEN_VILLAGE: equ 28
SHOP_ITEM_ROFT: equ 28
SHOP_ITEM_GALAM_1: equ 29
SHOP_YEEL_UNDERGROUND: equ 29
SHOP_DEBUG: equ 30

; ---------------------------------------------------------------------------

; enum Deals

dealsItemsByteSize = 64

    if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
dealsItemsByteSize = 128
    endif

DEALS_ADD_AMOUNT_ODD: equ 1
DEALS_MAX_NUMBER_PER_ITEM: equ $F
DEALS_BIT_REMAINDER: equ $10 ; since deals are stacked 2 to a byte, this is the bit index that stores whether we are an even or odd item index
DEALS_ADD_AMOUNT_EVEN: equ $10
DEALS_ITEMS_BYTES: equ dealsItemsByteSize
DEALS_ITEMS_COUNTER: equ (dealsItemsByteSize*2)-1

; ---------------------------------------------------------------------------

; enum Blacksmith
BLACKSMITH_ORDERS_COUNTER: equ BLACKSMITH_MAX_ORDERS_NUMBER-1
BLACKSMITH_MAX_ORDERS_NUMBER: equ 4 ; ordered mithril weapon slots in RAM
BLACKSMITH_ORDER_COST: equ 5000

; ---------------------------------------------------------------------------

; enum Caravan

caravanItemEntrySize = 1
caravanMaxItemsNumber = 64

    if (STANDARD_BUILD&FIX_CARAVAN_FREE_REPAIR_EXPLOIT=1)
caravanItemEntrySize = 2
        if (EXPANDED_SRAM=0)
caravanMaxItemsNumber = 32
        endif
    endif
    
    if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
caravanItemEntrySize = caravanItemEntrySize*2
    endif

CARAVAN_ITEM_ENTRY_SIZE: equ caravanItemEntrySize
CARAVAN_MAX_ITEMS_NUMBER_MINUS_ONE: equ caravanMaxItemsNumber-1
CARAVAN_MAX_ITEMS_NUMBER: equ caravanMaxItemsNumber

; ---------------------------------------------------------------------------

; enum Items (bitfield)

itemNothing     = $7F
itemEquipped    = $80

    if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
itemNothing     = $FF
itemEquipped    = $1000
    endif

ITEM_MEDICAL_HERB: equ 0
ITEM_HEALING_SEED: equ 1
ITEM_HEALING_DROP: equ 2
ITEM_ANTIDOTE: equ 3
ITEM_ANGEL_WING: equ 4
ITEM_FAIRY_POWDER: equ 5
ITEM_HEALING_WATER: equ 6
ITEM_FAIRY_TEAR: equ 7
ITEM_HEALING_RAIN: equ 8
ITEM_POWER_WATER: equ 9
ITEM_PROTECT_MILK: equ $A
ITEM_QUICK_CHICKEN: equ $B
ITEM_RUNNING_PIMENTO: equ $C
ITEM_CHEERFUL_BREAD: equ $D
ITEM_BRIGHT_HONEY: equ $E
ITEM_BRAVE_APPLE: equ $F
ITEM_SHINING_BALL: equ $10
ITEM_BLIZZARD: equ $11
ITEM_HOLY_THUNDER: equ $12
ITEM_POWER_RING: equ $13
ITEM_PROTECT_RING: equ $14
ITEM_QUICK_RING: equ $15
ITEM_RUNNING_RING: equ $16
ITEM_WHITE_RING: equ $17
ITEM_BLACK_RING: equ $18
ITEM_EVIL_RING: equ $19
ITEM_LEATHER_GLOVE: equ $1A
ITEM_POWER_GLOVE: equ $1B
ITEM_BRASS_KNUCKLES: equ $1C
ITEM_IRON_KNUCKLES: equ $1D
ITEM_MISTY_KNUCKLES: equ $1E
ITEM_GIANT_KNUCKLES: equ $1F
ITEM_EVIL_KNUCKLES: equ $20
ITEM_SHORT_AXE: equ $21
ITEM_HAND_AXE: equ $22
ITEM_MIDDLE_AXE: equ $23
ITEM_POWER_AXE: equ $24
ITEM_BATTLE_AXE: equ $25
ITEM_LARGE_AXE: equ $26
ITEM_GREAT_AXE: equ $27
ITEM_HEAT_AXE: equ $28
ITEM_ATLAS_AXE: equ $29
ITEM_GROUND_AXE: equ $2A
ITEM_RUNE_AXE: equ $2B
ITEM_EVIL_AXE: equ $2C
ITEM_WOODEN_ARROW: equ $2D
ITEM_IRON_ARROW: equ $2E
ITEM_STEEL_ARROW: equ $2F
ITEM_ROBIN_ARROW: equ $30
ITEM_ASSAULT_SHELL: equ $31
ITEM_GREAT_SHOT: equ $32
ITEM_NAZCA_CANNON: equ $33
ITEM_BUSTER_SHOT: equ $34
ITEM_HYPER_CANNON: equ $35
ITEM_GRAND_CANNON: equ $36
ITEM_EVIL_SHOT: equ $37
ITEM_WOODEN_STICK: equ $38
ITEM_SHORT_SWORD: equ $39
ITEM_MIDDLE_SWORD: equ $3A
ITEM_LONG_SWORD: equ $3B
ITEM_STEEL_SWORD: equ $3C
ITEM_ACHILLES_SWORD: equ $3D
ITEM_BROAD_SWORD: equ $3E
ITEM_BUSTER_SWORD: equ $3F
ITEM_GREAT_SWORD: equ $40
ITEM_CRITICAL_SWORD: equ $41
ITEM_BATTLE_SWORD: equ $42
ITEM_FORCE_SWORD: equ $43
ITEM_COUNTER_SWORD: equ $44
ITEM_LEVANTER: equ $45
ITEM_DARK_SWORD: equ $46
ITEM_WOODEN_SWORD: equ $47
ITEM_SHORT_SPEAR: equ $48
ITEM_BRONZE_LANCE: equ $49
ITEM_SPEAR: equ $4A
ITEM_STEEL_LANCE: equ $4B
ITEM_POWER_SPEAR: equ $4C
ITEM_HEAVY_LANCE: equ $4D
ITEM_JAVELIN: equ $4E
ITEM_CHROME_LANCE: equ $4F
ITEM_VALKYRIE: equ $50
ITEM_HOLY_LANCE: equ $51
ITEM_MIST_JAVELIN: equ $52
ITEM_HALBERD: equ $53
ITEM_EVIL_LANCE: equ $54
ITEM_WOODEN_ROD: equ $55
ITEM_SHORT_ROD: equ $56
ITEM_BRONZE_ROD: equ $57
ITEM_IRON_ROD: equ $58
ITEM_POWER_STICK: equ $59
ITEM_FLAIL: equ $5A
ITEM_GUARDIAN_STAFF: equ $5B
ITEM_INDRA_STAFF: equ $5C
ITEM_MAGE_STAFF: equ $5D
ITEM_WISH_STAFF: equ $5E
ITEM_GREAT_ROD: equ $5F
ITEM_SUPPLY_STAFF: equ $60
ITEM_HOLY_STAFF: equ $61
ITEM_FREEZE_STAFF: equ $62
ITEM_GODDESS_STAFF: equ $63
ITEM_MYSTERY_STAFF: equ $64
ITEM_DEMON_ROD: equ $65
ITEM_IRON_BALL: equ $66
ITEM_SHORT_KNIFE: equ $67
ITEM_DAGGER: equ $68
ITEM_KNIFE: equ $69
ITEM_THIEVES_DAGGER: equ $6A
ITEM_KATANA: equ $6B
ITEM_NINJA_KATANA: equ $6C
ITEM_GISARME: equ $6D
ITEM_TAROS_SWORD: equ $6E
ITEM_RIGHT_OF_HOPE: equ $6F
ITEM_WOODEN_PANEL: equ $70
ITEM_SKY_ORB: equ $71
ITEM_CANNON: equ $72
ITEM_DRY_STONE: equ $73
ITEM_DYNAMITE: equ $74
ITEM_ARM_OF_GOLEM: equ $75
ITEM_PEGASUS_WING: equ $76
ITEM_WARRIORS_PRIDE: equ $77
ITEM_SILVER_TANK: equ $78
ITEM_SECRET_BOOK: equ $79
ITEM_VIGOR_BALL: equ $7A
ITEM_MITHRIL: equ $7B
ITEM_LIFE_RING: equ $7C
ITEM_COTTON_BALLOON: equ $7D
ITEM_CHIRRUP_SANDALS: equ $7E
ITEM_NOTHING: equ itemNothing
ITEM_EQUIPPED: equ itemEquipped
ITEM_USABLE_BY_AI: equ $2000
ITEM_UNUSED_ITEM_DROP: equ $4000
ITEM_BROKEN: equ $8000

; ---------------------------------------------------------------------------

; enum ItemType (bitfield)
ITEMTYPE_UNDEFINED: equ 1 ; unused
ITEMTYPE_WEAPON: equ 2 ; equipped into weapon slot
ITEMTYPE_RING: equ 4 ; equipped into ring slot
ITEMTYPE_RARE: equ 8 ; moved into Deals section when applicable
ITEMTYPE_UNSELLABLE: equ $10 ; cannot be sold or dropped
ITEMTYPE_CONSUMABLE: equ $20
ITEMTYPE_CURSED: equ $40 ; inflicts curse status on wearer when equipped
ITEMTYPE_BREAKABLE: equ $80 ; has a chance to break when used

; ---------------------------------------------------------------------------

; enum ItemType_None
ITEMTYPE_NONE: equ 0

; ---------------------------------------------------------------------------

; enum ItemType_Bitmap
ITEMTYPE_BIT_WEAPON: equ 1
ITEMTYPE_BIT_RING: equ 2
ITEMTYPE_BIT_RARE: equ 3
ITEMTYPE_BIT_UNSELLABLE: equ 4
ITEMTYPE_BIT_CONSUMABLE: equ 5
ITEMTYPE_BIT_CURSED: equ 6
ITEMTYPE_BIT_BREAKABLE: equ 7

; ---------------------------------------------------------------------------

; enum ItemEntry

itemEntryIndexAndEquippedBitOffset = 1
itemEntrySize = 2
itemEntryBitEquipped = 7
itemEntryMaskIndex = $7F
itemEntryMaskBrokenBit = $8000

    if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
itemEntryIndexAndEquippedBitOffset = itemEntryIndexAndEquippedBitOffset*2
itemEntrySize = itemEntrySize*2
    endif
    
    if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
itemEntryBitEquipped = 12
itemEntryMaskIndex = $FF
    endif

ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT: equ itemEntryIndexAndEquippedBitOffset
ITEMENTRY_SIZE: equ itemEntrySize
ITEMENTRY_UPPERBIT_EQUIPPED: equ 4
ITEMENTRY_BIT_EQUIPPED: equ itemEntryBitEquipped
ITEMENTRY_UPPERBIT_BROKEN: equ 7
ITEMENTRY_BIT_USABLE_BY_AI: equ 13
ITEMENTRY_BIT_DROPPED_BY_ENEMY: equ 14
ITEMENTRY_BIT_BROKEN: equ 15
ITEMENTRY_MASK_INDEX: equ itemEntryMaskIndex
ITEMENTRY_MASK_INDEX_AND_BROKEN_BIT: equ itemEntryMaskBrokenBit|itemEntryMaskIndex

; ---------------------------------------------------------------------------

; enum ItemIndex_Properties

itemIndexMax = 127

    if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
itemIndexMax = 255
    endif

ITEMINDEX_WEAPONS_START: equ 26 ; Leather Glove
ITEMINDEX_WEAPONS_END: equ 109 ; Gisarme
ITEMINDEX_MAX: equ itemIndexMax
ITEMINDEX_GOLDCHESTS_START: equ itemIndexMax+1

; ---------------------------------------------------------------------------

; enum ItemSellPrice
ITEMSELLPRICE_BITSHIFTRIGHT: equ 2 ; to get sell price, bitshift right by this after multiplying by ITEM_SELLPRICE_MULTIPLIER
ITEMSELLPRICE_MULTIPLIER: equ 3 ; multiply price by this, then bitshift right by ITEM_SELLPRICE_BITSHIFTRIGHT

; ---------------------------------------------------------------------------

; enum EquipmentTypes
EQUIPMENTTYPE_TOOL: equ 0 
EQUIPMENTTYPE_WEAPON: equ 1 
EQUIPMENTTYPE_RING: equ -1

; ---------------------------------------------------------------------------

; enum MithrilWeaponsProperties

mithrilWeaponSlotSize = 2

    if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
mithrilWeaponSlotSize = 4
    endif

MITHRIL_WEAPON_ORDER_SLOT_SIZE: equ mithrilWeaponSlotSize
MITHRIL_WEAPONS_PER_CLASS_COUNTER: equ 3
MITHRIL_WEAPON_CLASSES_COUNTER: equ 7

; ---------------------------------------------------------------------------

; enum MapDef
MAP_SIZE_MAX_TILEHEIGHT: equ $30
MAP_SIZE_MAX_TILEWIDTH: equ $30
MAP_ARRAY_SIZE: equ $900
MAP_BLOCKINDEX_CLOSED_CHEST: equ $D801
MAP_BLOCKINDEX_OPEN_CHEST: equ $D802
MAP_NULLPOSITION: equ $FFFF

; ---------------------------------------------------------------------------

; enum Map_Entity

entityVelocityYOffset = 6
entityVelocityYLowerByteOffset = entityVelocityYOffset+1
entityDestinationXOffset = 12
entityDestinationYOffset = 14
entityMapspriteOffset = 19
entitySize = 32

    if (STANDARD_BUILD&EXPANDED_MAPSPRITES=1)
entityVelocityYOffset = 5
entityVelocityYLowerByteOffset = entityVelocityYOffset
entityMapspriteOffset = 6
    endif

ENTITYDEF_OFFSET_X: equ 0
ENTITYDEF_OFFSET_Y: equ 2
ENTITYDEF_OFFSET_Y_LOWERBYTE: equ 3
ENTITYDEF_OFFSET_XVELOCITY: equ 4
ENTITYDEF_SIZE_BITS: equ 5
ENTITYDEF_OFFSET_YVELOCITY: equ entityVelocityYOffset
ENTITYDEF_OFFSET_YVELOCITY_LOWERBYTE: equ entityVelocityYLowerByteOffset
ENTITYDEF_OFFSET_XTRAVEL: equ 8
ENTITYDEF_OFFSET_YTRAVEL: equ $A
ENTITYDEF_OFFSET_YTRAVEL_LOWERBYTE: equ ENTITYDEF_OFFSET_YTRAVEL+1
ENTITYDEF_OFFSET_XDEST: equ entityDestinationXOffset
ENTITYDEF_OFFSET_YDEST: equ entityDestinationYOffset
ENTITYDEF_OFFSET_YDEST_LOWERBYTE: equ ENTITYDEF_OFFSET_YDEST+1
ENTITYDEF_OFFSET_FACING: equ $10
ENTITYDEF_OFFSET_LAYER: equ $11
ENTITYDEF_OFFSET_ENTNUM: equ $12
ENTITYDEF_OFFSET_MAPSPRITE: equ entityMapspriteOffset
ENTITYDEF_OFFSET_ACTSCRIPTADDR: equ $14
ENTITYDEF_OFFSET_23: equ $17
ENTITYDEF_OFFSET_XACCEL: equ $18
ENTITYDEF_OFFSET_YACCEL: equ $19
ENTITYDEF_OFFSET_XSPEED: equ $1A
ENTITYDEF_OFFSET_YSPEED: equ $1B
ENTITYDEF_OFFSET_FLAGS_A: equ $1C
ENTITYDEF_OFFSET_FLAGS_B: equ $1D
ENTITYDEF_OFFSET_ANIMCOUNTER: equ $1E
ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER: equ $1F
ENTITYDEF_SIZE: equ entitySize
NEXT_ENTITYDEF: equ entitySize
ENTITYDEF_SECOND_ENTITY_XDEST: equ entitySize+entityDestinationXOffset
ENTITYDEF_SECOND_ENTITY_YDEST: equ entitySize+entityDestinationYOffset
ENTITYDEF_SECOND_ENTITY_MAPSPRITE: equ entitySize+entityMapspriteOffset
ENTITYDEF_ENTITY32_XDEST: equ 31*entitySize+entityDestinationXOffset
ENTITYDEF_ENTITY32_YDEST: equ 31*entitySize+entityDestinationYOffset

; ---------------------------------------------------------------------------

; enum Entities
ENTITY_PLAYER_CHARACTER: equ 0
ENTITY_CURSOR_SPRITES_COUNTER: equ 3
ENTITY_RAFT: equ $1F
ENTITY_ENEMY_START: equ $20
ENTITY_SPECIAL_SPRITE: equ $2F
ENTITIES_COUNTER_MINUS_ONE: equ $2F
ENTITY_CURSOR: equ $30
ENTITIES_COUNTER: equ $30
ENTITIES_TOTAL_COUNTER: equ $3F
ENTITY_ENEMY_INDEX_DIFFERENCE: equ $60
ENTITY_SPECIAL_SPRITE_WORD_ADDRESS: equ ENTITY_SPECIAL_SPRITE_DATA-FF0000_RAM_START
ENTITY_CURSOR_WORD_ADDRESS: equ $AF02
ENTITY_LAST_SPRITE_PLUS_ONE_WORD_ADDRESS: equ SPRITE_63+VDP_SPRITE_ENTRY_SIZE-FF0000_RAM_START

; ---------------------------------------------------------------------------

; enum SoundCommands
SOUND_COMMAND_INIT_DRIVER: equ $20
SOUND_COMMAND_SFX_START_MINUS_ONE: equ $40
SOUND_COMMAND_SFX_START: equ $41
SOUND_COMMAND_WAIT_MUSIC_END: equ $F0
SOUND_COMMAND_PLAY_PREVIOUS_MUSIC: equ $FB
SOUND_COMMAND_UPDATE_MUSIC_LEVEL: equ $FC
SOUND_COMMAND_FADE_OUT: equ $FD
SOUND_COMMAND_GET_D0_PARAMETER: equ $FFFF
    if (STANDARD_BUILD=1)
SOUND_COMMAND_DEACTIVATE_RESUMING: equ $F9
SOUND_COMMAND_ACTIVATE_RESUMING: equ $FA
    endif

; ---------------------------------------------------------------------------

; enum Music
MUSIC_NOTHING: equ 0
MUSIC_MAIN_THEME: equ 1
MUSIC_ATTACK: equ 2
MUSIC_PROMOTED_ATTACK: equ 3
MUSIC_PROMOTED_ATTACK_LOOP: equ 4
MUSIC_ENEMY_ATTACK: equ 5
MUSIC_BOSS_ATTACK: equ 6
MUSIC_ZEON_ATTACK: equ 7
MUSIC_TOWN: equ 8
MUSIC_INTRO: equ 9
MUSIC_WITCH: equ 10
MUSIC_SUSPEND: equ 11
MUSIC_SAD_THEME_2: equ 12
MUSIC_ELVEN_TOWN: equ 13
MUSIC_MITULA: equ 14
MUSIC_SAD_THEME_3: equ 15
MUSIC_SAD_THEME_1: equ 16
MUSIC_PIANO_THEME: equ 17
MUSIC_CORRUPTED_SAVE: equ 18
MUSIC_JOIN: equ 19
MUSIC_SAD_JOIN: equ 20
MUSIC_SAVE: equ 21
MUSIC_CURE: equ 22
MUSIC_UNUSED_REVIVE: equ 23
MUSIC_REVIVE: equ 24
MUSIC_PROMOTION: equ 25
MUSIC_CURSED_ITEM: equ 26
MUSIC_ITEM: equ 27
MUSIC_TITLE: equ 28
MUSIC_STOP: equ 32
MUSIC_BATTLE_THEME_3: equ 33
MUSIC_BATTLE_THEME_1: equ 34
MUSIC_SHRINE: equ 35
MUSIC_FINAL_BATTLE: equ 36
MUSIC_MITHRIL_DIGGERS: equ 37
MUSIC_CASTLE: equ 38
MUSIC_HEADQUARTERS: equ 39
MUSIC_MITULA_SHRINE: equ 40
MUSIC_ENDING: equ 41

; ---------------------------------------------------------------------------

; enum Sfx
SFX_MENU_SWITCH: equ 65
SFX_MENU_SELECTION: equ 66
SFX_VALIDATION: equ 67
SFX_REFUSAL: equ 68
SFX_DIALOG_BLEEP_1: equ 69
SFX_DIALOG_BLEEP_2: equ 70
SFX_DIALOG_BLEEP_3: equ 71
SFX_DIALOG_BLEEP_4: equ 72
SFX_DIALOG_BLEEP_5: equ 73
SFX_DIALOG_BLEEP_6: equ 74
SFX_DIALOG_BLEEP_7: equ 75
SFX_DIALOG_BLEEP_8: equ 76
SFX_SPELL_CAST: equ 77
SFX_DOOR_OPEN_HIGH_PITCH: equ 78
SFX_WALKING: equ 79
SFX_UNUSED_FROM_LANDSTALKER: equ 80
SFX_LIGHTNING_1: equ 81
SFX_LIGHTNING_2: equ 82
SFX_HIT_1: equ 83
SFX_HIT_2: equ 84
SFX_BLAST: equ 85
SFX_SWORDS_HIT: equ 86
SFX_JUMP: equ 87
SFX_FALLING: equ 88
SFX_WARP: equ 89
SFX_CHIRRUP_SANDALS: equ 90
SFX_MONSTER_DIALOG_BLEEP: equ 91
SFX_DOOR_OPEN: equ 92
SFX_BIG_DOOR_RUMBLE: equ 93
SFX_MONSTER_SCREAM: equ 94
SFX_BUUBOBI: equ 95
SFX_SECRET_PATH_ROCK: equ 96
SFX_PSH: equ 97
SFX_PSHHH: equ 98
SFX_BLOAB: equ 99
SFX_BLO: equ 100
SFX_LANDSTALKER_ITEM: equ 101
SFX_LEVEL_UP: equ 102
SFX_PRISM_LASER_LOADING: equ 103
SFX_SPAWN: equ 104
SFX_SFCD_STATUES: equ 105
SFX_DESOUL: equ 106
SFX_SITD_HOWL: equ 107
SFX_PRISM_LASER_FIRING: equ 108
SFX_BOOST: equ 109
SFX_DESOUL_HOVERING: equ 110
SFX_PRISM_LASER_CUTSCENE_FIRING: equ 111
SFX_TAROS_DIALOG_BLEEP: equ 112
SFX_HEALING: equ 113
SFX_BLAST_SPELL: equ 114
SFX_WING_FLAP: equ 115
SFX_BATTLEFIELD_DEATH: equ 116
SFX_DEMON_BREATH: equ 117
SFX_INTRO_LIGHTNING: equ 118
SFX_BOLT_SPELL: equ 119
SFX_TINKLING: equ 120

; ---------------------------------------------------------------------------

; enum Sfx_None
SFX_NONE: equ $7F

; ---------------------------------------------------------------------------

; enum SpellDef_Offsets
SPELLDEF_OFFSET_INDEX_AND_LV: equ 0
SPELLDEF_OFFSET_MP_COST: equ 1
SPELLDEF_OFFSET_ANIMATION: equ 2
SPELLDEF_OFFSET_PROPS: equ 3
SPELLDEF_OFFSET_MAX_RANGE: equ 4
SPELLDEF_OFFSET_MIN_RANGE: equ 5
SPELLDEF_OFFSET_RADIUS: equ 6
SPELLDEF_OFFSET_POWER: equ 7

; ---------------------------------------------------------------------------

; enum SpellDef_Properties

spellDefsCounter = 99

    if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
spellDefsCounter = 251
    endif

SPELLDEF_ENTRY_SIZE: equ 8
SPELLDEFS_COUNTER: equ spellDefsCounter

; ---------------------------------------------------------------------------

; enum SpellAnimations (bitfield)
SPELLANIMATION_NONE: equ 0
SPELLANIMATION_BLAZE: equ 1
SPELLANIMATION_FREEZE: equ 2
SPELLANIMATION_DESOUL: equ 3
SPELLANIMATION_HEALING_FAIRY: equ 4
SPELLANIMATION_BLAST: equ 5
SPELLANIMATION_DETOX: equ 6
SPELLANIMATION_BOLT: equ 7
SPELLANIMATION_BUFF1: equ 8
SPELLANIMATION_DEBUFF1: equ 9
SPELLANIMATION_ABSORB: equ $A
SPELLANIMATION_DEMON_BREATH: equ $B
SPELLANIMATION_FLAME_BREATH: equ $C
SPELLANIMATION_ARROWS_AND_SPEARS: equ $D ; variation 1: Wooden, Iron, and Steel Arrow
                                        ; variation 2: Robin Arrow, Assault Shell
                                        ; variation 3: Spears
SPELLANIMATION_CANNON_PROJECTILE: equ $E ; Nazca, Hyper, and Grand Cannon
SPELLANIMATION_SHOT_PROJECTILE: equ $F ; Great, Buster, and Evil Shot
SPELLANIMATION_GUNNER_PROJECTILE: equ $10 ; BRGN class and Dark Gunner enemy attacks
SPELLANIMATION_DAO: equ $11
SPELLANIMATION_APOLLO: equ $12
SPELLANIMATION_NEPTUN: equ $13
SPELLANIMATION_ATLAS: equ $14
SPELLANIMATION_PRISM_LASER: equ $15
SPELLANIMATION_BUBBLE_BREATH: equ $16
SPELLANIMATION_SNOW_BREATH: equ $17
SPELLANIMATION_CUTOFF: equ $18
SPELLANIMATION_BUFF2: equ $19
SPELLANIMATION_ATTACK_SPELL: equ $1A ; SFCD's ATTACK spell (unused)
SPELLANIMATION_DEBUFF2: equ $1B
SPELLANIMATION_DEBUFF3: equ $1C
SPELLANIMATION_PHOENIX_ATTACK: equ $1D
SPELLANIMATION_BURST_ROCK_EXPLOSION: equ $1E
SPELLANIMATION_ODD_EYE_BEAM: equ $1F
SPELLANIMATION_VARIATION2: equ $20
SPELLANIMATION_VARIATION3: equ $40
SPELLANIMATION_VARIATION4: equ $60
SPELLANIMATION_MIRRORED: equ $80

; ---------------------------------------------------------------------------

; enum SpellAnimation_Variation1
SPELLANIMATION_VARIATION1: equ 0

; ---------------------------------------------------------------------------

; enum SpellAnimation_Bitmap
SPELLANIMATION_BITS_VARIANT: equ 5
SPELLANIMATION_BIT_MIRRORED: equ 7

; ---------------------------------------------------------------------------

; enum SpellAnimation_Masks
SPELLANIMATION_VARIANT_MASK: equ 3
SPELLANIMATION_MASK_INDEX: equ $1F
SPELLANIMATION_MASK_INDEX_AND_VARIATION: equ $7F

; ---------------------------------------------------------------------------

; enum Summons
SUMMON_DAO: equ 0
SUMMON_ATLAS: equ 1
SUMMON_NEPTUNE: equ 2
SUMMON_APOLLO: equ 3

; ---------------------------------------------------------------------------

; enum SpellFlashColors
ABSORB_FLASH_COLOR: equ $F
DESOUL_FLASH_COLOR: equ $222
BLAZE_FLASH_COLOR: equ $22E
BUFF_FLASH_COLOR: equ $2C2
ATTACK_SPELL_FLASH_COLOR: equ $8A8 ; SFCD's ATTACK spell (unused)
DETOX_FLASH_COLOR: equ $A8A
HEALING_FLASH_COLOR: equ $CAC
BLAST_FLASH_COLOR: equ $CC2
INVOCATION_FLASH_COLOR: equ $CCE
FREEZE_FLASH_COLOR: equ $E22
DEBUFF_FLASH_COLOR: equ $E22
BOLT_FLASH_COLOR: equ $ECA
CUTOFF_FLASH_COLOR: equ $EEE

; ---------------------------------------------------------------------------

; enum SpellGraphics
SPELLGRAPHICS_BUBBLE_BREATH: equ 0
SPELLGRAPHICS_FLAME_BREATH: equ 1
SPELLGRAPHICS_BLAZE: equ 2
SPELLGRAPHICS_DAO: equ 3
SPELLGRAPHICS_BOLT: equ 4
SPELLGRAPHICS_ARROWS_AND_SPEARS: equ 5
SPELLGRAPHICS_HEALING: equ 6
SPELLGRAPHICS_DETOX: equ 7
SPELLGRAPHICS_PRSIM_LASER: equ 8
SPELLGRAPHICS_DEBUFF: equ 9
SPELLGRAPHICS_CUTOFF: equ $A
SPELLGRAPHICS_FREEZE: equ $B
SPELLGRAPHICS_SNOW_BREATH: equ $C
SPELLGRAPHICS_DESOUL: equ $D
SPELLGRAPHICS_NEPTUN: equ $E
SPELLGRAPHICS_BLAST: equ $F
SPELLGRAPHICS_EXPLOSION: equ $10
SPELLGRAPHICS_GUNNER_PROJECTILE: equ $11
SPELLGRAPHICS_CANNON_PROJECTILE: equ $12
SPELLGRAPHICS_APOLLO: equ $13
SPELLGRAPHICS_PHOENIX_ATTACK: equ $14
SPELLGRAPHICS_ODD_EYE_BEAM: equ $15
SPELLGRAPHICS_DEMON_BREATH: equ $16

; ---------------------------------------------------------------------------

; enum SpellProps (bitfield)
SPELLPROPS_TYPE_ATTACK: equ 0
SPELLPROPS_TYPE_HEAL: equ 1
SPELLPROPS_TYPE_SUPPORT: equ 2
SPELLPROPS_TYPE_SPECIAL: equ 3
SPELLPROPS_TARGET_TEAMMATES: equ $40 ; otherwise, target opponents
SPELLPROPS_AFFECTEDBYSILENCE: equ $80

; ---------------------------------------------------------------------------

; enum SpellProps_Other
SPELLPROPS_MASK_TYPE: equ 3
SPELLPROPS_BIT_TARGETING: equ 6 ; 0 = target opponents, 1 = target teammates
SPELLPROPS_BIT_AFFECTEDBYSILENCE: equ 7

; ---------------------------------------------------------------------------

; enum Spells (bitfield)
SPELL_HEAL: equ 0
SPELL_AURA: equ 1
SPELL_DETOX: equ 2
SPELL_BOOST: equ 3
SPELL_SLOW: equ 4
SPELL_ATTACK: equ 5
SPELL_DISPEL: equ 6
SPELL_MUDDLE: equ 7
SPELL_DESOUL: equ 8
SPELL_SLEEP: equ 9
SPELL_EGRESS: equ $A
SPELL_BLAZE: equ $B
SPELL_FREEZE: equ $C
SPELL_BOLT: equ $D
SPELL_BLAST: equ $E
SPELL_SPOIT: equ $F ; Magic Drain
SPELL_HEALIN: equ $10 ; Medical Herb
SPELL_FLAME: equ $11 ; Flame Breath
SPELL_SNOW: equ $12 ; Snow Breath
SPELL_DEMON: equ $13 ; Demon Breath
SPELL_POWER: equ $14 ; Power Water
SPELL_GUARD: equ $15 ; Protect Milk
SPELL_SPEED: equ $16 ; Quick Chicken
SPELL_IDATEN: equ $17 ; Running Pimento
SPELL_HEALTH: equ $18 ; Cheerful Bread
SPELL_B_ROCK: equ $19 ; Burst Rock
SPELL_LASER: equ $1A ; Prism laser!
SPELL_KATON: equ $1B
SPELL_RAIJIN: equ $1C
SPELL_DAO: equ $1D
SPELL_APOLLO: equ $1E
SPELL_NEPTUN: equ $1F
SPELL_ATLAS: equ $20
SPELL_POWDER: equ $21 ; Fairy Powder
SPELL_G_TEAR: equ $22 ; Fairy Tear
SPELL_HANNY: equ $23 ; Bright Honey
SPELL_BRAVE: equ $24 ; Brave Apple
SPELL_FBALL: equ $25 ; Shining Ball
SPELL_BREZAD: equ $26 ; Blizzard
SPELL_THUNDR: equ $27 ; Holy Thunder
SPELL_AQUA: equ $28 ; Bubble Breath
SPELL_KIWI: equ $29 ; Kiwi's Flame Breath
SPELL_SHINE: equ $2A ; Right of Hope
SPELL_ODDEYE: equ $2B ; Odd-eye beam!
SPELL_NOTHING: equ $3F
SPELL_LV2: equ $40
SPELL_LV3: equ $80
SPELL_LV4: equ $C0

; ---------------------------------------------------------------------------

; enum Spell_LV1
SPELL_LV1: equ 0

; ---------------------------------------------------------------------------

; enum SpellEntry
SPELLENTRY_OFFSET_INDEX: equ 0
SPELLENTRY_LV_BITSIZE: equ 2
SPELLENTRY_LOWERMASK_LV: equ 3
SPELLENTRY_LEVELS_NUMBER: equ 4
SPELLENTRY_OFFSET_LV: equ 6
SPELLENTRY_INDEX_BITSIZE: equ 6
SPELLENTRY_SPELLS_NUMBER: equ $2A
SPELLENTRY_MASK_INDEX: equ $3F
SPELLENTRY_MASK_LV: equ $C0
SPELLENTRY_MASK_INDEX_AND_LV: equ $FF

; ---------------------------------------------------------------------------

; enum SpellEntryLevels
SPELLENTRY_LV1: equ 0
SPELLENTRY_LV2: equ 1
SPELLENTRY_LV3: equ 2
SPELLENTRY_LV4: equ 3

; ---------------------------------------------------------------------------

; enum SpellElements
SPELLELEMENT_WIND: equ 0
SPELLELEMENT_LIGHTNING: equ 2
SPELLELEMENT_ICE: equ 4
SPELLELEMENT_FIRE: equ 6
SPELLELEMENT_NEUTRAL: equ 8
SPELLELEMENT_UNUSED1: equ 10
SPELLELEMENT_UNUSED2: equ 12
SPELLELEMENT_STATUS: equ 14

; ---------------------------------------------------------------------------

; enum BattleActionEngine_SpellEffects
CHANCE_TO_CRITICAL_DEMON_BREATH: equ 0 ; no chance to critical hit
CHANCE_TO_INFLICT_MUDDLE1: equ 5 ; 3/8 base chance to inflict muddle 1
CHANCE_TO_INFLICT_MUDDLE2: equ 5 ; 3/8 base chance to inflict muddle 2
CHANCE_TO_INFLICT_DESOUL: equ 5 ; 3/8 base chance to inflict desoul
CHANCE_TO_INFLICT_SLOW: equ 5 ; 3/8 base chance to inflict slow
CHANCE_TO_INFLICT_SILENCE: equ 5 ; 3/8 base chance to inflict silence
CHANCE_TO_INFLICT_SLEEP: equ 5 ; 3/8 base chance to inflict sleep
STATUSEFFECT_SPELL_EXP: equ 5
CHANCE_TO_CRITICAL_BUBBLE_BREATH: equ 8 ; 1/8 chance to critical hit
CHANCE_TO_CRITICAL_BOLT: equ 8 ; 1/8 chance to critical hit (Bolt, Raijin, Atlas, Holy Thunder, Odd-eye beam)
CHANCE_TO_CRITICAL_FLAME_BREATH: equ 16 ; 1/16 chance to critical hit (Flame Breath, Kiwi's Flame Breath)
CHANCE_TO_CRITICAL_NEPTUN: equ 16 ; 1/16 chance to critical hit
HEALING_EXP_CAP: equ 25
CHANCE_TO_CRITICAL_BLAZE: equ 32 ; 1/32 chance to critical hit (Blaze, Katon, Apollo, Shining Ball)
CHANCE_TO_CRITICAL_FREEZE: equ 32 ; 1/32 chance to critical hit (Freeze, Snow Breath, Blizzard)
CHANCE_TO_CRITICAL_BLAST: equ 32 ; 1/32 chance to critical hit (Blast, Dao)
PER_ACTION_EXP_CAP: equ 49

; ---------------------------------------------------------------------------

; enum BattleActionEngine_Properties

chanceToDodgeForMuddledAttacker = 2     ; 1/2
chanceToDodgeForAirborneTarget = 8      ; 1/8
chanceToDodgeDefault = 32               ; 1/32

    if (STANDARD_BUILD=1)
chanceToDodgeForMuddledAttacker = 128   ; n/256
chanceToDodgeForAirborneTarget = 32     ; 
chanceToDodgeDefault = 8                ; 
    endif

CHANCE_TO_DODGE_FOR_MUDDLED_ATTACKER: equ chanceToDodgeForMuddledAttacker ; 1/2 chance to dodge if attacker is muddled
CHANCE_TO_INFLICT_CURSE_DAMAGE: equ 2 ; 1/2 chance to inflict curse damage
CHANCE_TO_BREAK_USED_ITEM: equ 4 ; 1/4 chance to break used item
CHANCE_TO_PERFORM_KIWI_FLAME_BREATH: equ 4 ; 1/4 chance to perform Kiwi's Flame Breath
INACTION_CHANCE_CURSE: equ 4 ; 1/4 chance to be unable to attack due to being cursed
INACTION_CHANCE_STUN: equ 4 ; 1/4 chance to be unable to attack due to being stunned
CHANCE_TO_DODGE_FOR_AIRBORNE_TARGET: equ chanceToDodgeForAirborneTarget ; 1/8 chance to dodge if target is flying or hovering, and attacker is not an archer
CHANCE_TO_DODGE_DEFAULT: equ chanceToDodgeDefault ; 1/32 chance to dodge by default
KIWI_FLAME_BREATH_UPGRADE_LEVEL1: equ 32
KIWI_FLAME_BREATH_UPGRADE_LEVEL2: equ 40
KIWI_FLAME_BREATH_UPGRADE_LEVEL3: equ 50

; ---------------------------------------------------------------------------

; enum MapProperties
mapsNumber: = 79
mapsMaxIndex: = mapsNumber-1
mapsDebugMaxIndex: = 56

    if (STANDARD_BUILD=1)
mapsDebugMaxIndex: = mapsMaxIndex
    endif

MAPS_DEBUG_MAX_INDEX: equ mapsDebugMaxIndex
MAPS_MAX_INDEX: equ mapsMaxIndex
MAPS_NUMBER: equ mapsNumber
MINIMAP_TILE_SIZE: equ 96
MAP_TILE_SIZE:   equ 384
MAP_TILE_PLUS:   equ 384
MAP_TILE_MINUS:  equ -384

; ---------------------------------------------------------------------------

; enum Maps
MAP_OUTSIDE_MITULA: equ 0
MAP_INSIDE_MITULA: equ 1
MAP_PACALON: equ 2
MAP_GRANSEAL: equ 3
MAP_GRANSEAL_EARTHQUAKE: equ 4
MAP_YEEL: equ 5
MAP_NEW_GRANSEAL: equ 6
MAP_NEW_GRANSEAL_CASTLE: equ 7
MAP_RIBBLE: equ 8
MAP_HASSAN: equ 9
MAP_MOUNT_VOLCANON: equ 10
MAP_VOLCANON_SHRINE: equ 11
MAP_TAROS_SHRINE: equ 12
MAP_POLCA: equ 13
MAP_SHIP_DAMAGED: equ 14
MAP_TRISTAN: equ 15
MAP_GALAM_CASTLE: equ 16
MAP_GALAM_CASTLE_INNER: equ 17
MAP_GALAM_CASTLE_EXIT: equ 18
MAP_GRANSEAL_CASTLE_2F: equ 19
MAP_GRANSEAL_CASTLE_1F: equ 20
MAP_GRANSEAL_CASTLE_3F: equ 21
MAP_CREED_DESKTOP_WORLD: equ 22
MAP_SECRET_MONK_FOREST: equ 23
MAP_SECRET_MONK_FOREST_BATTLEFIELD: equ 24
MAP_KETTO: equ 25
MAP_CREED_FLOOR_WORLD: equ 26
MAP_CREED_WILLARD_CAVE: equ 27
MAP_DEVILS_HEAD_LABYRINTH: equ 28
MAP_SECRET_DWARVEN_VILLAGE_OUTSIDE: equ 29
MAP_SECRET_DWARVEN_VILLAGE_INSIDE: equ 30
MAP_MOUN: equ 31
MAP_UNDERGROUND_PATH_1: equ 32
MAP_CREED_MANSION: equ 33
MAP_EVIL_SPIRIT_SHRINE: equ 34
MAP_UNDERGROUND_PATH_2: equ 35
MAP_PACALON_CASTLE: equ 36
MAP_NAZCA_SHIP_INTERIOR: equ 37
MAP_ROFT: equ 38
MAP_MOUN_UNDERGROUND: equ 39
MAP_ANCIENT_TOWER_OUTSIDE: equ 40
MAP_DEVILS_HEAD: equ 41
MAP_FORCE_SWORD_SHRINE: equ 42
MAP_HAWEL_HOUSE: equ 43
MAP_GRANSEAL_DOCKS_AND_SHIP: equ 44
MAP_DOJO: equ 45
MAP_NEW_GRANSEAL_HQ: equ 46
MAP_PANGOAT_VALLEY_BRIDGE: equ 47
MAP_CAVERNS_OF_DARKNESS: equ 48
MAP_KRAKEN_RAFT: equ 49
MAP_ACHILLES_SHRINES: equ 50
MAP_HARPY_POOL: equ 51
MAP_PATH_TO_MOUNT_VOLCANON: equ 52
MAP_PRISM_FLOWERS_FIELD: equ 53
MAP_ODDEYE_ARENA: equ 54
MAP_CAMEELA_ARENA: equ 55
MAP_ANCIENT_TOWER_CLIMB: equ 56
MAP_ANCIENT_TOWER_FIRST_ROOM: equ 57
MAP_ANCIENT_TOWER_UNDERGROUND_ROOM: equ 58
MAP_ZEON_ARENA: equ 59
MAP_ANCIENT_TOWER_UNDERGROUND_STAIRS: equ 60
MAP_SHRINE_NEAR_RIBBLE_EXTERIOR: equ 61
MAP_EAST_SHRINE: equ 62
MAP_MAGIC_TUNNEL_HUB: equ 63
MAP_MAGIC_TUNNEL_PIPE: equ 64
MAP_GRANSEAL_CASTLE: equ 65
MAP_OVERWORLD_GRANS_GRANSEAL: equ 66
MAP_OVERWORLD_DEVILS_TAIL: equ 67
MAP_OVERWORLD_AROUND_ELVEN_VILLAGE: equ 68
MAP_OVERWORLD_PATH_TO_RIBBLE: equ 69
MAP_OVERWORLD_SOUTHEAST_PARMECIA: equ 70
MAP_OVERWORLD_AROUND_PACALON: equ 71
MAP_OVERWORLD_NORTH_SOUTH_PARMECIA_JUNCTION: equ 72
MAP_OVERWORLD_NEW_GRANSEAL_SHORE: equ 73
MAP_OVERWORLD_MOUN_AND_MITULA: equ 74
MAP_OVERWORLD_GRANS_NORTH_SHORE: equ 75
MAP_OVERWORLD_GRANS_RETURN_PATH: equ 76
MAP_OVERWORLD_GRANS_AROUND_DWARF_VILLAGE: equ 77
MAP_OVERWORLD_PACALON_2: equ 78
MAP_CURRENT: equ 255 ; reload current map

; ---------------------------------------------------------------------------

; enum BattleProperties

battlesNumber: = 45
battlesMaxIndex: = battlesNumber-1
battlesDebugNumber: = 49

    if (STANDARD_BUILD&TEST_BUILD=1)
battlesDebugNumber: = battlesMaxIndex
    endif

BATTLES_MAX_INDEX: equ battlesMaxIndex
BATTLES_NUMBER:  equ battlesNumber
BATTLES_DEBUG_NUMBER: equ battlesDebugNumber

; ---------------------------------------------------------------------------

; enum Battles
BATTLE_VERSUS_ALL_BOSSES: equ 0
BATTLE_INSIDE_ANCIENT_TOWER: equ 1
BATTLE_TO_YEEL: equ 2
BATTLE_TO_HAWEL_HOUSE: equ 3
BATTLE_AMBUSHED_BY_GALAM_SOLDIERS: equ 4
BATTLE_GALAM_CASTLE: equ 5
BATTLE_TO_GRANSEAL: equ 6
BATTLE_VERSUS_DARK_SMOKES: equ 7
BATTLE_NORTH_CLIFF: equ 8
BATTLE_TO_RIBBLE: equ 9
BATTLE_TO_THE_EAST: equ 10
BATTLE_CAVE_OF_DARKNESS: equ 11
BATTLE_MOUNT_VOLCANO: equ 12
BATTLE_POLCA_VILLAGE: equ 13
BATTLE_SOUTHEAST_DESERT: equ 14
BATTLE_SHRINE_SOUTH_OF_RIBBLE: equ 15
BATTLE_VERSUS_KRAKEN: equ 16
BATTLE_TO_TAROS_SHRINE: equ 17
BATTLE_VERSUS_TAROS: equ 18
BATTLE_OUTSIDE_ELVEN_VILLAGE: equ 19
BATTLE_HARPIES_POND: equ 20
BATTLE_DEVIL_TAIL: equ 21
BATTLE_CHESSBOARD: equ 22
BATTLE_VERSUS_WILLARD: equ 23
BATTLE_TO_NORTH_PARMECIA: equ 24
BATTLE_NORTH_CAVE: equ 25
BATTLE_OUTSIDE_KETTO: equ 26
BATTLE_TO_TRISTAN: equ 27
BATTLE_PANGOAT_VALLEY_BRIDGE: equ 28
BATTLE_OUTSIDE_MITULA_SHRINE: equ 29
BATTLE_VERSUS_ZALBARD: equ 30
BATTLE_PACALON: equ 31
BATTLE_TO_MOUN: equ 32
BATTLE_INSIDE_MOUN: equ 33
BATTLE_VERSUS_CAMEELA: equ 34
BATTLE_TO_ROFT: equ 35
BATTLE_VERSUS_PRISM_FLOWERS: equ 36
BATTLE_VERSUS_RED_BARON: equ 37
BATTLE_VERSUS_GESHP: equ 38
BATTLE_TO_ANCIENT_SHRINE: equ 39
BATTLE_VERSUS_ODD_EYE: equ 40
BATTLE_OUTSIDE_ANCIENT_TOWER: equ 41
BATTLE_VERSUS_GALAM: equ 42
BATTLE_VERSUS_ZEON: equ 43
BATTLE_FAIRY_WOODS: equ 44
NOT_CURRENTLY_IN_BATTLE: equ 255

; ---------------------------------------------------------------------------

; enum Battleactions
BATTLEACTION_ATTACK: equ 0
BATTLEACTION_CAST_SPELL: equ 1
BATTLEACTION_USE_ITEM: equ 2
BATTLEACTION_STAY: equ 3
BATTLEACTION_BURST_ROCK: equ 4
BATTLEACTION_MUDDLED: equ 5
BATTLEACTION_PRISM_LASER: equ 6
BATTLEACTION_TRAPPED_CHEST: equ 128

; ---------------------------------------------------------------------------

; enum Battleaction_Offsets
BATTLEACTION_OFFSET_TYPE: equ 0
BATTLEACTION_OFFSET_ITEM_OR_SPELL: equ 2
BATTLEACTION_OFFSET_ITEM_OR_SPELL_LOWER_BYTE: equ 3 ; target of regular attack
BATTLEACTION_OFFSET_TARGET: equ 4 ; target of spell or item
BATTLEACTION_OFFSET_ITEM_SLOT: equ 6

; ---------------------------------------------------------------------------

; enum Battleaction_Properties
BATTLEACTION_PRISM_LASER_POWER: equ 16
BATTLEACTION_BURST_ROCK_POWER: equ 18

; ---------------------------------------------------------------------------

; enum Battleaction_AttackTypes
BATTLEACTION_ATTACKTYPE_FIRST: equ 0
BATTLEACTION_ATTACKTYPE_SECOND: equ 1
BATTLEACTION_ATTACKTYPE_COUNTER: equ 2

; ---------------------------------------------------------------------------

; enum Battlescene

battlesceneStackNegsize = -152

    if (STANDARD_BUILD=1)
battlesceneStackNegsize = -156
    endif

BATTLESCENE_STACK_NEGSIZE: equ battlesceneStackNegsize

; ---------------------------------------------------------------------------

; enum Def_Lengths
BITS_HALFBYTE: equ 4

; ---------------------------------------------------------------------------

; enum Flags
FLAG_COUNT_FORCEMEMBERS_JOINED: equ 32
FLAG_INDEX_RAFT: equ 64
FLAG_INDEX_FOLLOWERS_ASTRAL: equ 70
FLAG_INDEX_DIFFICULTY1: equ 78
FLAG_INDEX_DIFFICULTY2: equ 79
FLAG_INDEX_YES_NO_PROMPT: equ 89 ; flag index : last answer to story-related yes/no question
FLAG_INDEX_BATTLE_CUTSCENE_GIZMOS: equ 399
FLAG_INDEX_BATTLE0: equ 400
FLAG_MASK: equ 1023

; ---------------------------------------------------------------------------

; enum ForceMemberFlags
FORCEMEMBER_JOINED_FLAGS_START: equ 0
FORCEMEMBER_ACTIVE_FLAGS_START: equ 32 ; "in active party" flags

; ---------------------------------------------------------------------------

; enum MapSetupFlags
MAPSETUP_TEMP_FLAGS_COUNTER: equ 127 ; Available temp flags loop counter
MAPSETUP_TEMP_FLAGS_START: equ 256 ; Map setup temp flags starting index

; ---------------------------------------------------------------------------

; enum BattleFlags
BATTLE_REGION_FLAGS_START: equ 90 ; Start of battle region flags
BATTLE_UNLOCKED_TO_COMPLETED_FLAGS_OFFSET: equ 100
BATTLE_REGION_FLAGS_END: equ 105
BATTLE_UNLOCKED_FLAGS_START: equ 400 ; "Battle unlocked" starting flag index
BATTLE_INTRO_CUTSCENE_FLAGS_START: equ 450 ; Set after battle intro cutscene has played out once
BATTLE_COMPLETED_FLAGS_START: equ 500 ; "Battle completed" starting flags index

; ---------------------------------------------------------------------------

; enum Special_Offsets
NRO: equ $FF000000

; ---------------------------------------------------------------------------

; enum MapLayoutProperties
MAP_LAYOUT_LONGS_COUNTER: equ 2047

; ---------------------------------------------------------------------------

; enum MapDataOffsets
MAPDATA_OFFSET_TILESETS: equ 0
MAPDATA_OFFSET_BLOCKS: equ 6
MAPDATA_OFFSET_LAYOUT: equ 8
MAPDATA_OFFSET_AREAS: equ $E
MAPDATA_OFFSET_EVENT_FLAG: equ $12
MAPDATA_OFFSET_EVENT_STEP: equ $16
MAPDATA_OFFSET_EVENT_ROOF: equ $1A
MAPDATA_OFFSET_EVENT_WARP: equ $1E
MAPDATA_OFFSET_ITEM_CHEST: equ $22
MAPDATA_OFFSET_ITEM_OTHER: equ $26
MAPDATA_OFFSET_ANIMATIONS: equ $2A

; ---------------------------------------------------------------------------

; enum MapsetupOffsets
MAPSETUP_OFFSET_ENTITIES: equ 0
MAPSETUP_OFFSET_ENTITY_EVENTS: equ 4
MAPSETUP_OFFSET_ZONE_EVENTS: equ 8
MAPSETUP_OFFSET_AREA_DESCRIPTIONS: equ 12
MAPSETUP_OFFSET_ITEM_EVENTS: equ 16
MAPSETUP_OFFSET_INIT_FUNCTION: equ 20

; ---------------------------------------------------------------------------

; enum Menus
MENU_FIELD: equ 0
MENU_BATTLE_WITH_STAY: equ 1
MENU_BATTLE_WITH_SEARCH: equ 2
MENU_ITEM: equ 3
MENU_BATTLEFIELD: equ 4
MENU_CHURCH: equ 5
MENU_SHOP: equ 6
MENU_CARAVAN: equ 7
MENU_DEPOT: equ 8

; ---------------------------------------------------------------------------

; enum Menu_Item
MENU_ITEM_LAYOUT_BYTESIZE: equ $D8
MENU_ITEM_NAME_COORDS: equ $902
MENU_ITEM_NOTHING_STRING_COORDS: equ $903
MENU_ITEM_EQUIPPED_STRING_COORDS: equ $904

; ---------------------------------------------------------------------------

; enum ItemSubmenuActions
ITEM_SUBMENU_ACTION_USE: equ 0
ITEM_SUBMENU_ACTION_GIVE: equ 1
ITEM_SUBMENU_ACTION_DROP: equ 2
ITEM_SUBMENU_ACTION_EQUIP: equ 3

; ---------------------------------------------------------------------------

; enum Menu_Magic

mpCostOffset    = 42
spellNameCoords = $902
mpCostCoords    = $C04

    if (STANDARD_BUILD&EXTENDED_SPELL_NAMES=1)
mpCostOffset    = mpCostOffset+2
spellNameCoords = $901
mpCostCoords    = $B04
    endif

MENU_MAGIC_OFFSET_MP_COST: equ mpCostOffset ; relative to spell level tiles
MENU_MAGIC_LAYOUT_BYTESIZE: equ $D8
MENU_MAGIC_SPELL_NAME_COORDS: equ spellNameCoords
MENU_MAGIC_SPELL_LEVEL_TILES_COORDS: equ $903
MENU_MAGIC_MP_COST_COORDS: equ mpCostCoords

; ---------------------------------------------------------------------------

; enum ChurchMenu_Properties
CHURCHMENU_PER_LEVEL_RAISE_COST: equ 10
CHURCHMENU_CURE_POISON_COST: equ 10
CHURCHMENU_MIN_PROMOTABLE_LEVEL: equ 20
CHURCHMENU_CURE_STUN_COST: equ 20
CHURCHMENU_RAISE_COST_EXTRA_WHEN_PROMOTED: equ CHURCHMENU_PER_LEVEL_RAISE_COST*CHAR_CLASS_EXTRALEVEL
    if (STANDARD_BUILD&PER_LEVEL_CHURCH_COST=1)
CHURCHMENU_PER_LEVEL_CURE_POISON_COST: equ 3
CHURCHMENU_CURE_POISON_COST_EXTRA_WHEN_PROMOTED: equ CHURCHMENU_PER_LEVEL_CURE_POISON_COST*CHAR_CLASS_EXTRALEVEL
CHURCHMENU_PER_LEVEL_CURE_STUN_COST: equ 5
CHURCHMENU_CURE_STUN_COST_EXTRA_WHEN_PROMOTED: equ CHURCHMENU_PER_LEVEL_CURE_STUN_COST*CHAR_CLASS_EXTRALEVEL
    endif

; ---------------------------------------------------------------------------

; enum PromotionSections
PROMOTIONSECTION_REGULAR_BASE: equ 0
PROMOTIONSECTION_REGULAR_PROMO: equ 1
PROMOTIONSECTION_SPECIAL_BASE: equ 2
PROMOTIONSECTION_SPECIAL_PROMO: equ 3
PROMOTIONSECTION_SPECIAL_ITEM: equ 4

; ---------------------------------------------------------------------------

; enum MessageProperties

messagesNumber: = 4267
messagesMaxIndex: = messagesNumber-1

MESSAGES_MAX_INDEX: equ messagesMaxIndex
MESSAGES_NUMBER: equ messagesNumber

; ---------------------------------------------------------------------------

; enum Messages
MESSAGE_CHANGEYOURMIND: equ 4
MESSAGE_ITEMMENU_ITEM_IS_EXCHANGED_FOR: equ 41
MESSAGE_ITEMMENU_DISCARDED_THE_ITEM: equ 42
MESSAGE_HQ: equ 46
MESSAGE_CARAVAN_SORRY_THERE_IS_NO_ROOM: equ 81
MESSAGE_CARAVAN_WELL_THE_STOREHOUSE_IS_EMPTY: equ 82
MESSAGE_CARAVAN_STORE_WHOSE_ITEM: equ 83
MESSAGE_CARAVAN_PASS_THE_ITEM_TO_WHOM: equ 84
MESSAGE_CARAVAN_DISCARD_WHICH_ITEM: equ 85
MESSAGE_CARAVAN_CHOOSE_WHICH_ITEM: equ 86
MESSAGE_CARAVAN_ITEM_IS_NOW_IN_THE_STOREHOUSE: equ 87
MESSAGE_CARAVAN_CHARACTER_NOW_HAS_THE_ITEM: equ 88
MESSAGE_CARAVAN_APPRAISE_WHICH_ITEM: equ 89
MESSAGE_CARAVANDESC_ITEMHASEFFECT: equ 93
MESSAGE_CARAVANDESC_ITEMHASNOEFFECT: equ 94
MESSAGE_CARAVANDESC_EVERYBODY: equ 95
MESSAGE_CARAVANDESC_ITEMISFOR: equ 96
MESSAGE_CARAVANDESC_ITEMFORNOBODY: equ 97
MESSAGE_CARAVANDESC_ITEMFORNAME: equ 98
MESSAGE_CARAVANDESC_NEWLINE: equ 99
MESSAGE_CARAVANDESC_TOEQUIP: equ 100
MESSAGE_CARAVANDESC_SELLPRICE: equ 101
MESSAGE_CARAVANDESC_UNSELLABLE: equ 102
MESSAGE_CARAVANDESC_CHIRRUP_SANDALS: equ 103
MESSAGE_BATTLE_ATTACK_POWER_IS_BOOSTED_BY: equ 150 ; Power Water spell effect
MESSAGE_BATTLE_DEFENSIVE_POWER_IS_BOOSTED_BY: equ 151 ; Protect Milk spell effect
MESSAGE_BATTLE_AGILITY_IS_BOOSTED_BY: equ 152 ; Quick Chicken spell effect
MESSAGE_BATTLE_MOVEMENT_RANGE_IS_ENLARGED_BY: equ 153 ; Running Pimento spell effect
MESSAGE_BATTLE_MAX_HP_ARE_RAISED_BY: equ 154 ; Cheerful Bread spell effect
MESSAGE_BATTLE_MAX_MP_ARE_RAISED_BY: equ 155 ; Bright Honey spell effect
MESSAGE_BATTLE_BECAME_LEVEL: equ 244 ; Brave Apple spell effect
MESSAGE_BATTLE_HP_INCREASED_BY: equ 266
MESSAGE_BATTLE_MP_INCREASED_BY: equ 267
MESSAGE_BATTLE_ATTACK_INCREASED_BY: equ 268
MESSAGE_BATTLE_DEFENSE_INCREASED_BY: equ 269
MESSAGE_BATTLE_AGILITY_INCREASED_BY: equ 270
MESSAGE_BATTLE_LEARNED_THE_NEW_MAGIC_SPELL: equ 271
MESSAGE_BATTLE_SPELL_INCREASED_TO_LEVEL: equ 272
MESSAGE_BATTLE_ATTACK: equ 273 ; regular attack
MESSAGE_SPELLCAST_DEFAULT: equ 274
MESSAGE_BATTLE_USED_ITEM: equ 275
MESSAGE_SPELLCAST_CAST_DEMON_BREATH: equ 276
MESSAGE_SPELLCAST_BELCHED_OUT_FLAMES: equ 278
MESSAGE_SPELLCAST_BLEW_OUT_A_SNOWSTORM: equ 279
MESSAGE_SPELLCAST_BLEW_OUT_AQUA_BREATH: equ 281
MESSAGE_SPELLCAST_BLEW_OUT_BUBBLE_BREATH: equ 282
MESSAGE_SPELLCAST_SUMMONED: equ 283
MESSAGE_BATTLE_DAMAGE_ALLY: equ 284
MESSAGE_BATTLE_DAMAGE_ENEMY: equ 285
MESSAGE_BATTLE_DODGE: equ 286
MESSAGE_BATTLE_CRITICAL_HIT: equ 287
MESSAGE_BATTLE_HEAVY_ATTACK: equ 288
MESSAGE_BATTLE_INEFFECTIVE_ATTACK: equ 289
MESSAGE_BATTLE_WAS_DEFEATED: equ 290 ; enemy defeated
MESSAGE_BATTLE_IS_EXHAUSTED: equ 291 ; ally defeated
MESSAGE_BATTLE_COUNTER_ATTACK: equ 292
MESSAGE_BATTLE_SECOND_ATTACK: equ 293
MESSAGE_BATTLE_CUTOFF: equ 294
MESSAGE_BATTLE_THE_SPELL_HAS_NO_EFFECT: equ 295
MESSAGE_BATTLE_SILENCED: equ 296
MESSAGE_BATTLE_RECOVERED_HIT_POINTS: equ 298
MESSAGE_BATTLE_RECOVERED_MAGIC_POINTS: equ 300
MESSAGE_BATTLE_IS_NO_LONGER_POISONED: equ 301
MESSAGE_BATTLE_IS_NO_LONGER_STUNNED: equ 302
MESSAGE_BATTLE_IS_NO_LONGER_CURSED: equ 303
MESSAGE_BATTLE_SOUL_WAS_STOLEN_ALLY: equ 304
MESSAGE_BATTLE_SOUL_WAS_STOLEN_ENEMY: equ 305
MESSAGE_SPELLCAST_PUT_ON_A_DEMON_SMILE: equ 310
MESSAGE_BATTLE_MP_WAS_DRAINED_BY: equ 314 ; enemy MP drained
MESSAGE_BATTLE_ABSORBED_MAGIC_POINTS: equ 317 ; ally MP drained
MESSAGE_BATTLE_EXPLODED: equ 318
MESSAGE_BATTLE_PRISM_LASER: equ 319
MESSAGE_SPELLCAST_ODD_EYE_BEAM: equ 320
MESSAGE_BATTLE_DEMON_LASER: equ 321
MESSAGE_BATTLE_MUDDLED_ACTIONS_START: equ 322
MESSAGE_BATTLE_BOOST_SPELL_AGI_INCREASE: equ 332 ; BOOST spell effect
MESSAGE_BATTLE_AGILITY_DECREASED_BY: equ 333 ; SLOW spell effect
MESSAGE_BATTLE_ATTACK_SPELL_EFFECT: equ 334
MESSAGE_BATTLE_HAS_BEEN_SILENCED: equ 335
MESSAGE_BATTLE_IS_IN_A_DEEP_HAZE: equ 337 ; MUDDLE spell effect
MESSAGE_BATTLE_FELL_ASLEEP: equ 338
MESSAGE_BATTLE_IS_POISONED: equ 339
MESSAGE_BATTLE_IS_CURSED: equ 340
MESSAGE_BATTLE_BOOST_SPELL_DEF_INCREASE: equ 341 ; BOOST spell effect
MESSAGE_BATTLE_DEFENSE_DECREASED_BY: equ 342 ; SLOW spell effect
MESSAGE_BATTLE_BECOMES_CONFUSED: equ 346
MESSAGE_BATTLE_IS_STUNNED: equ 347
MESSAGE_BATTLE_IS_CURSED_AND_STUNNED: equ 359
MESSAGE_BATTLE_IS_CURSED_AND_DAMAGED: equ 360
MESSAGE_BATTLE_IS_STUNNED_AND_CANNOT_MOVE: equ 361
MESSAGE_BATTLE_USED_ITEM_HIT_AND_BROKEN_START: equ 372
MESSAGE_BATTLE_USED_ITEM_HIT_AND_DESTROYED_START: equ 377
MESSAGE_BATTLE_USED_ITEM_MISS_AND_BROKEN_START: equ 382
MESSAGE_BATTLE_USED_ITEM_MISS_AND_DESTROYED_START: equ 387
MESSAGE_BATTLE_FOUND_GOLD_COINS: equ 393
MESSAGE_BATTLE_RECEIVED_ITEM: equ 395
MESSAGE_BATTLE_DROPPED_ITEM: equ 396
MESSAGE_END: equ 65535

; ---------------------------------------------------------------------------

; enum Windowing
WINDOW_DIALOGUE_TILELINECOUNTER_BATTLE: equ 3
WINDOW_DIALOGUE_TILELINECOUNTER_EVENT: equ 5
WINDOW_ENTRIES_COUNTER: equ 7
WINDOW_ENTRY_SIZE: equ $10
WINDOW_DIALOGUE_TILEWIDTH: equ $1A
WINDOW_ENTRIES_LONGWORD_COUNTER: equ $1F

; ---------------------------------------------------------------------------

; enum Window_Member
WINDOW_MEMBER_KD_TEXT_DEFEATS_LENGTH: equ 6
WINDOW_MEMBER_KD_TEXT_KILLS_LENGTH: equ 6
WINDOW_MEMBER_KD_TEXT_DEFEATS_OFFSET: equ $24
WINDOW_MEMBER_KD_TEXT_KILLS_OFFSET: equ $72
WINDOW_MEMBER_KD_LAYOUT_BYTESIZE: equ $C0
WINDOW_MEMBER_PORTRAIT_POSITION: equ $201
WINDOW_MEMBER_KD_POSITION: equ $20B
WINDOW_MEMBER_GOLD_POSITION: equ $217
WINDOW_MEMBER_PORTRAIT_SIZE: equ $80A
WINDOW_MEMBER_KD_SIZE: equ $80C
WINDOW_MEMBER_GOLD_SIZE: equ $80C
WINDOW_MEMBER_KD_DEST: equ $F80B
WINDOW_MEMBER_GOLD_DEST: equ $F81C
WINDOW_MEMBER_PORTRAIT_DEST: equ $F8F6

; ---------------------------------------------------------------------------

; enum Window_BattleEquip_Stats

statsTileCoords = $701

    if (STANDARD_BUILD&THREE_DIGITS_STATS=1)
statsTileCoords = statsTileCoords-$100
    endif

WINDOW_BATTLEEQUIP_STATS_TILE_COORDS: equ statsTileCoords
WINDOW_BATTLEEQUIP_SIZE: equ $A09

; ---------------------------------------------------------------------------

; enum Window_Gold
WINDOW_GOLD_SIZE: equ $904
WINDOW_GOLD_DEST: equ $2017

; ---------------------------------------------------------------------------

; enum Window_TacticalBaseName
WINDOW_TACTICAL_BASE_NAME_SIZE: equ $A03
WINDOW_TACTICAL_BASE_NAME_DEST: equ $F60B

; ---------------------------------------------------------------------------

; enum Window_MiniStatus

maxHpOffset                 = 6
sideColumnsNumberPlusOne    = 9 ; used to calculate CopyMiddleColumns loop counter
minWidth                    = 10
statValuesOffset            = 12
maxWidth                    = 22
nextLineOffset              = 44
longwordCounter             = 54
windowSize                  = $1605

    if (STANDARD_BUILD&THREE_DIGITS_STATS=1)
maxHpOffset                 = maxHpOffset+2
sideColumnsNumberPlusOne    = sideColumnsNumberPlusOne+1
minWidth                    = minWidth+2
statValuesOffset            = statValuesOffset+4
maxWidth                    = maxWidth+2
nextLineOffset              = nextLineOffset+4
longwordCounter             = longwordCounter+5
windowSize                  = $1805
    endif

WINDOW_MINISTATUS_OFFSET_MAX_HP: equ maxHpOffset
WINDOW_MINISTATUS_OFFSET_STATBARS_START: equ 6
WINDOW_MINISTATUS_SIDECOLUMNS_NUMBER_PLUS_ONE: equ sideColumnsNumberPlusOne
WINDOW_MINISTATUS_MIN_WIDTH: equ minWidth
WINDOW_MINISTATUS_OFFSET_STAT_VALUES: equ statValuesOffset
WINDOW_MINISTATUS_MAX_WIDTH: equ maxWidth
WINDOW_MINISTATUS_OFFSET_NEXT_LINE: equ nextLineOffset
WINDOW_MINISTATUS_LONGWORD_COUNTER: equ longwordCounter
WINDOW_MINISTATUS_OFFSET_NEXT_TWO_LINES: equ nextLineOffset*2
WINDOW_MINISTATUS_MAX_STATBAR_LENGTH: equ 100 ; HP or MP value
WINDOW_MINISTATUS_SIZE: equ windowSize
WINDOW_MINISTATUS_DEST: equ $2001

; ---------------------------------------------------------------------------

; enum Window_LandEffect

headerLength    = 15
headerOffset    = 18
valueOffset     = 56
windowSize      = $805
windowDest      = $F801

    if (STANDARD_BUILD&THREE_DIGITS_STATS=1)
headerLength    = 2
headerOffset    = 14
valueOffset     = 40
windowSize      = $605
windowDest      = $FA01
    endif

WINDOW_LANDEFFECT_TEXT_HEADER_LENGTH: equ headerLength
WINDOW_LANDEFFECT_TEXT_HEADER_OFFSET: equ headerOffset
WINDOW_LANDEFFECT_TEXT_VALUE_OFFSET: equ valueOffset
WINDOW_LANDEFFECT_SIZE: equ windowSize
WINDOW_LANDEFFECT_DEST: equ windowDest

; ---------------------------------------------------------------------------

; enum Window_MemberStatus

enemyLvOffset   = 140
allyLvOffset    = 142
currentHpOffset = 220
currentMpOffset = 304
enemyExpOffset  = 392
allyExpOffset   = 394

    if (STANDARD_BUILD&THREE_DIGITS_STATS=1)
enemyLvOffset   = enemyLvOffset+2
allyLvOffset    = allyLvOffset+2
currentHpOffset = currentHpOffset-2
currentMpOffset = currentMpOffset-2
enemyExpOffset  = enemyExpOffset+2
allyExpOffset   = allyExpOffset+2
    endif

WINDOW_MEMBERSTATUS_NA_STRING_LENGTH: equ 3
WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE: equ $2A
WINDOW_MEMBERSTATUS_OFFSET_NAME: equ $2C
WINDOW_MEMBERSTATUS_OFFSET_STATUSEFFECT_TILES: equ $4E
WINDOW_MEMBERSTATUS_OFFSET_SPELL_LV_TILES: equ $58
WINDOW_MEMBERSTATUS_OFFSET_EQUIPPED_STRING: equ $58
WINDOW_MEMBERSTATUS_OFFSET_NEXT_SPELL: equ $7E
WINDOW_MEMBERSTATUS_OFFSET_NEXT_ITEM: equ $7E
WINDOW_MEMBERSTATUS_OFFSET_ENEMY_LV: equ enemyLvOffset
WINDOW_MEMBERSTATUS_OFFSET_LV: equ allyLvOffset
WINDOW_MEMBERSTATUS_OFFSET_ATT: equ $A0
WINDOW_MEMBERSTATUS_OFFSET_CURRENT_HP: equ currentHpOffset
WINDOW_MEMBERSTATUS_OFFSET_MAX_HP: equ $E2
WINDOW_MEMBERSTATUS_OFFSET_DEF: equ $F4
WINDOW_MEMBERSTATUS_OFFSET_CURRENT_MP: equ currentMpOffset
WINDOW_MEMBERSTATUS_OFFSET_MAX_MP: equ $136
WINDOW_MEMBERSTATUS_OFFSET_AGI: equ $148
WINDOW_MEMBERSTATUS_OFFSET_ENEMY_EXP: equ enemyExpOffset
WINDOW_MEMBERSTATUS_OFFSET_EXP: equ allyExpOffset
WINDOW_MEMBERSTATUS_OFFSET_MOV: equ $19C
WINDOW_MEMBERSTATUS_OFFSET_MAGIC_START: equ $224
WINDOW_MEMBERSTATUS_OFFSET_ITEM_START: equ $236
WINDOW_MEMBERSTATUS_OFFSET_MAGIC_NOTHING_STRING: equ $250
WINDOW_MEMBERSTATUS_OFFSET_ITEM_NOTHING_STRING: equ $262
WINDOW_MEMBERSTATUS_OFFSET_JEWEL_STRING_START: equ $374
WINDOW_MEMBERSTATUS_OFFSET_JEWEL_STRING_END: equ $37E
WINDOW_MEMBERSTATUS_OFFSET_JEWEL_OF_LIGHT: equ $39E
WINDOW_MEMBERSTATUS_OFFSET_JEWEL_OF_EVIL: equ $3A2
WINDOW_MEMBERSTATUS_LAYOUT_BYTESIZE: equ $444
WINDOW_MEMBERSTATUS_POSITION: equ $A01
WINDOW_MEMBERSTATUS_SIZE: equ $151A
WINDOW_MEMBERSTATUS_DEST: equ $2001

; ---------------------------------------------------------------------------

; enum Window_MembersList

highlightSpritesCounter = 1
memberslistDownArrow    = 11
hpMpPage                = 255
statsPage               = 1
newAttAndDefPage        = 2
newAttAndDefEntryOffset = 8
entryStartOffset        = 16
levelEntryOffset        = 22

    if (STANDARD_BUILD&EIGHT_CHARACTERS_MEMBER_NAMES=1)
highlightSpritesCounter = highlightSpritesCounter+1
memberslistDownArrow    = memberslistDownArrow+1
    endif

    if (SECOND_MEMBERS_LIST_PAGE=1)
hpMpPage                = 1
statsPage               = 2
newAttAndDefPage        = 3
newAttAndDefEntryOffset = newAttAndDefEntryOffset-4
levelEntryOffset        = levelEntryOffset-2
    endif

    if (SECOND_MEMBERS_LIST_PAGE|(STANDARD_BUILD&EIGHT_CHARACTERS_MEMBER_NAMES)=1)
entryStartOffset        = entryStartOffset+2
    endif

WINDOW_MEMBERS_LIST_HIGHLIGHTSPRITES_COUNTER: equ highlightSpritesCounter
WINDOW_MEMBERS_LIST_PAGE_HPMP: equ hpMpPage
WINDOW_MEMBERS_LIST_PAGE_STATS: equ statsPage
WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF: equ newAttAndDefPage
WINDOW_MEMBERS_LIST_ENTRIES_COUNTER: equ 4
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_EXP: equ 4
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_UNEQUIPPABLE: equ 4
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_NEWDEFENSE: equ newAttAndDefEntryOffset
WINDOW_MEMBERS_LIST_SPRITELINK_DOWNARROW: equ memberslistDownArrow
WINDOW_MEMBERS_LIST_ENTRY_UNEQUIPPABLE_LENGTH: equ 16
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_START: equ entryStartOffset
WINDOW_MEMBERS_LIST_SPRITELINK_UPARROW: equ 16
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_LEVEL: equ levelEntryOffset
WINDOW_MEMBERS_LIST_HEADER_LENGTH: equ 30
WINDOW_MEMBERS_LIST_OFFSET_NEXT_LINE: equ 58
WINDOW_MEMBERS_LIST_OFFSET_NEXT_ENTRY: equ 116
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_NAME: equ 178
WINDOW_MEMBERS_LIST_DEST: equ $220
WINDOW_MEMBERS_LIST_SIZE: equ $1D0D

; ---------------------------------------------------------------------------

; enum Window_MemberSummary

spellLevelOffset            = 44
memberPageMagicListOffset   = 172
magicPageMagicListOffset    = 192

    if (STANDARD_BUILD&EXTENDED_SPELL_NAMES=1)
spellLevelOffset            = 16
memberPageMagicListOffset   = memberPageMagicListOffset-2
magicPageMagicListOffset    = magicPageMagicListOffset-2
    endif

WINDOW_MEMBERSUMMARY_PAGE_MAIN: equ 0
WINDOW_MEMBERSUMMARY_PAGE_ITEM: equ 1
WINDOW_MEMBERSUMMARY_PAGE_MAGIC: equ 2
WINDOW_MEMBERSUMMARY_HIGHLIGHTSPRITES_COUNTER: equ 2
WINDOW_MEMBERSUMMARY_PAGE_EQUIP: equ 3
WINDOW_MEMBERSUMMARY_OFFSET_NEXT_LINE: equ $2A
WINDOW_MEMBERSUMMARY_OFFSET_NAME: equ $2C
WINDOW_MEMBERSUMMARY_OFFSET_SPELL_LEVEL: equ spellLevelOffset
WINDOW_MEMBERSUMMARY_OFFSET_STATUSEFFECT_TILES: equ $4E
WINDOW_MEMBERSUMMARY_OFFSET_NEXT_ITEM: equ $54
WINDOW_MEMBERSUMMARY_OFFSET_NEXT_SPELL: equ $54
WINDOW_MEMBERSUMMARY_MAIN_PAGE_OFFSET_MAGICITEM_STRING: equ $80
WINDOW_MEMBERSUMMARY_ITEM_PAGE_OFFSET_ITEM_STRING: equ $82
WINDOW_MEMBERSUMMARY_MAGIC_PAGE_OFFSET_MAGIC_STRING: equ $82
WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_EQUIPMENT_STRING: equ $82
WINDOW_MEMBERSUMMARY_MAIN_PAGE_OFFSET_MAGICLIST_START: equ memberPageMagicListOffset
WINDOW_MEMBERSUMMARY_MAIN_PAGE_OFFSET_ITEMSLIST_START: equ $C0
WINDOW_MEMBERSUMMARY_ITEM_PAGE_OFFSET_ITEMSLIST_START: equ $C0
WINDOW_MEMBERSUMMARY_MAGIC_PAGE_OFFSET_MAGICLIST_START: equ magicPageMagicListOffset
WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_ATT_STRING: equ $EA
WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_DEF_STRING: equ $13E
WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_AGI_STRING: equ $192
WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_MOV_STRING: equ $1E6
WINDOW_MEMBERSUMMARY_SIZE: equ $150D
WINDOW_MEMBERSUMMARY_DEST: equ $20F3

; ---------------------------------------------------------------------------

; enum Window_NameAlly

nameEntryOffset = 20
windowSize      = $903

    if (STANDARD_BUILD&EIGHT_CHARACTERS_MEMBER_NAMES=1)
nameEntryOffset = nameEntryOffset+2
windowSize      = $A03
    endif

WINDOW_NAMEALLY_OFFSET_ENTRY: equ nameEntryOffset
WINDOW_NAMEALLY_PORTRAIT_POSITION: equ $201
WINDOW_NAMEALLY_ALPHABET_POSITION: equ $20B
WINDOW_NAMEALLY_ALPHABET_DEST: equ $21C
WINDOW_NAMEALLY_PORTRAIT_SIZE: equ $80A
WINDOW_NAMEALLY_ENTRY_SIZE: equ windowSize
WINDOW_NAMEALLY_ENTRY_POSITION: equ $A08
WINDOW_NAMEALLY_ALPHABET_SIZE: equ $1C07
WINDOW_NAMEALLY_ENTRY_DEST: equ $2008
WINDOW_NAMEALLY_PORTRAIT_DEST: equ $F8F6

; ---------------------------------------------------------------------------

; enum Window_NumberPrompt
WINDOW_NUMBERPROMPT_ANIMATION_LENGTH: equ 4
WINDOW_NUMBERPROMPT_DIGITS_NUMBER: equ 5
WINDOW_NUMBERPROMPT_STACK_NEGSIZE: equ $10
WINDOW_NUMBERPROMPT_DIGITS_OFFSET: equ $10
WINDOW_NUMBERPROMPT_SIZE: equ $703
WINDOW_NUMBERPROMPT_DESTINATION: equ $1801
WINDOW_NUMBERPROMPT_ORIGIN: equ $2001

; ---------------------------------------------------------------------------

; enum Window_ShopInventory
WINDOW_SHOP_INVENTORY_DEST: equ $2F7
WINDOW_SHOP_GOLD_SIZE: equ $904
WINDOW_SHOP_ITEM_NAME_AND_PRICE_SIZE: equ $A05
WINDOW_SHOP_INVENTORY_SIZE: equ $1B06
WINDOW_SHOP_GOLD_DEST: equ $2017
WINDOW_SHOP_ITEM_NAME_AND_PRICE_DEST: equ $F606

; ---------------------------------------------------------------------------

; enum Window_Gold
WINDOW_GOLD_SIZE: equ $904
WINDOW_GOLD_DEST: equ $2017

; ---------------------------------------------------------------------------

; enum Window_HeadquartersName
WINDOW_TACTICAL_BASE_NAME_SIZE: equ $A03
WINDOW_TACTICAL_BASE_NAME_DEST: equ $F60B

; ---------------------------------------------------------------------------

; enum Stats

statsDigitsNumber       = 2
unknownValueThreshold   = 100

    if (STANDARD_BUILD&THREE_DIGITS_STATS=1)
statsDigitsNumber       = 3
unknownValueThreshold   = 400
    endif

LV_DIGITS_NUMBER: equ 2
EXP_DIGITS_NUMBER: equ 2
MOV_DIGITS_NUMBER: equ 2
STATS_DIGITS_NUMBER: equ statsDigitsNumber
UNKNOWN_STAT_VALUE_THRESHOLD: equ unknownValueThreshold
DISPLAYED_AGI_VALUE_MASK: equ $7F

; ---------------------------------------------------------------------------

; enum Text
TEXT_CODE_NEWLINE: equ $B
TEXT_CODE_MOVEDOWN: equ $D
TEXT_CODE_TOGGLEFONTCOLOR: equ $5C

; ---------------------------------------------------------------------------

; enum VdpTiles (bitfield)
VDPTILE_SPACE: equ $20
VDPTILE_EXCLAMATION_MARK: equ $21
VDPTILE_QUOTATION_MARK: equ $22
VDPTILE_NUMBER_SIGN: equ $23
VDPTILE_DOLLAR_SIGN: equ $24
VDPTILE_PERCENT_SIGN: equ $25
VDPTILE_AMPERSAND: equ $26
VDPTILE_APOSTROPHE: equ $27
VDPTILE_OPENING_ROUND_BRACKET: equ $28
VDPTILE_CLOSING_ROUND_BRACKET: equ $29
VDPTILE_MULTIPLICATION_SIGN: equ $2A
VDPTILE_PLUS_SIGN: equ $2B
VDPTILE_COMMA: equ $2C
VDPTILE_MINUS_SIGN: equ $2D
VDPTILE_DOT: equ $2E
VDPTILE_SLASH: equ $2F
VDPTILE_NUMBER_0: equ $30
VDPTILE_NUMBER_1: equ $31
VDPTILE_NUMBER_2: equ $32
VDPTILE_NUMBER_3: equ $33
VDPTILE_NUMBER_4: equ $34
VDPTILE_NUMBER_5: equ $35
VDPTILE_NUMBER_6: equ $36
VDPTILE_NUMBER_7: equ $37
VDPTILE_NUMBER_8: equ $38
VDPTILE_NUMBER_9: equ $39
VDPTILE_COLON: equ $3A
VDPTILE_SEMICOLON: equ $3B
VDPTILE_LESS_THAN_SIGN: equ $3C
VDPTILE_EQUALS_SIGN: equ $3D
VDPTILE_GREATER_THAN_SIGN: equ $3E
VDPTILE_QUESTION_MARK: equ $3F
VDPTILE_COPYRIGHT_SIGN: equ $40
VDPTILE_UPPERCASE_A: equ $41
VDPTILE_UPPERCASE_B: equ $42
VDPTILE_UPPERCASE_C: equ $43
VDPTILE_UPPERCASE_D: equ $44
VDPTILE_UPPERCASE_E: equ $45
VDPTILE_UPPERCASE_F: equ $46
VDPTILE_UPPERCASE_G: equ $47
VDPTILE_UPPERCASE_H: equ $48
VDPTILE_UPPERCASE_I: equ $49
VDPTILE_UPPERCASE_J: equ $4A
VDPTILE_UPPERCASE_K: equ $4B
VDPTILE_UPPERCASE_L: equ $4C
VDPTILE_UPPERCASE_M: equ $4D
VDPTILE_UPPERCASE_N: equ $4E
VDPTILE_UPPERCASE_O: equ $4F
VDPTILE_UPPERCASE_P: equ $50
VDPTILE_UPPERCASE_Q: equ $51
VDPTILE_UPPERCASE_R: equ $52
VDPTILE_UPPERCASE_S: equ $53
VDPTILE_UPPERCASE_T: equ $54
VDPTILE_UPPERCASE_U: equ $55
VDPTILE_UPPERCASE_V: equ $56
VDPTILE_UPPERCASE_W: equ $57
VDPTILE_UPPERCASE_X: equ $58
VDPTILE_UPPERCASE_Y: equ $59
VDPTILE_UPPERCASE_Z: equ $5A
VDPTILE_OPENING_SQUARE_BRACKET: equ $5B
VDPTILE_BACKSLASH: equ $5C
VDPTILE_CLOSING_SQUARE_BRACKET: equ $5D
VDPTILE_VERTICAL_ARROW: equ $5E
VDPTILE_UNDERSCORE: equ $5F
VDPTILE_CORNER: equ $60 ; window corner
VDPTILE_H_BORDER: equ $61 ; horizontal window border
VDPTILE_TRADEMARK_SYMBOL1: equ $62
VDPTILE_TRADEMARK_SYMBOL2: equ $63
VDPTILE_V_ARROW: equ $64 ; vertical arrow
VDPTILE_H_ARROW: equ $65 ; horizontal arrow
VDPTILE_ORANGE_LOWERCASE_A: equ $66
VDPTILE_ORANGE_LOWERCASE_B: equ $67
VDPTILE_ORANGE_LOWERCASE_C: equ $68
VDPTILE_ORANGE_LOWERCASE_D: equ $69
VDPTILE_ORANGE_LOWERCASE_E: equ $6A
VDPTILE_ORANGE_LOWERCASE_F: equ $6B
VDPTILE_ORANGE_LOWERCASE_G: equ $6C
VDPTILE_ORANGE_LOWERCASE_H: equ $6D
VDPTILE_ORANGE_LOWERCASE_I: equ $6E
VDPTILE_ORANGE_LOWERCASE_J: equ $6F
VDPTILE_V_BORDER: equ $70 ; vertical window border
VDPTILE_ORANGE_LOWERCASE_K: equ $71
VDPTILE_ORANGE_LOWERCASE_L: equ $72
VDPTILE_ORANGE_LOWERCASE_M: equ $73
VDPTILE_ORANGE_LOWERCASE_N: equ $74
VDPTILE_ORANGE_LOWERCASE_O: equ $75
VDPTILE_ORANGE_LOWERCASE_P: equ $76
VDPTILE_ORANGE_LOWERCASE_Q: equ $77
VDPTILE_ORANGE_LOWERCASE_R: equ $78
VDPTILE_ORANGE_LOWERCASE_S: equ $79
VDPTILE_ORANGE_LOWERCASE_T: equ $7A
VDPTILE_ORANGE_LOWERCASE_U: equ $7B
VDPTILE_ORANGE_LOWERCASE_V: equ $7C
VDPTILE_ORANGE_LOWERCASE_W: equ $7D
VDPTILE_ORANGE_LOWERCASE_X: equ $7E
VDPTILE_ORANGE_LOWERCASE_Y: equ $7F
VDPTILE_ORANGE_LOWERCASE_Z: equ $80
VDPTILE_LOWERCASE_A: equ $81
VDPTILE_LOWERCASE_B: equ $82
VDPTILE_LOWERCASE_C: equ $83
VDPTILE_LOWERCASE_D: equ $84
VDPTILE_LOWERCASE_E: equ $85
VDPTILE_LOWERCASE_F: equ $86
VDPTILE_LOWERCASE_G: equ $87
VDPTILE_LOWERCASE_H: equ $88
VDPTILE_LOWERCASE_I: equ $89
VDPTILE_LOWERCASE_J: equ $8A
VDPTILE_LOWERCASE_K: equ $8B
VDPTILE_LOWERCASE_L: equ $8C
VDPTILE_LOWERCASE_M: equ $8D
VDPTILE_LOWERCASE_N: equ $8E
VDPTILE_LOWERCASE_O: equ $8F
VDPTILE_LOWERCASE_P: equ $90
VDPTILE_LOWERCASE_Q: equ $91
VDPTILE_LOWERCASE_R: equ $92
VDPTILE_LOWERCASE_S: equ $93
VDPTILE_LOWERCASE_T: equ $94
VDPTILE_LOWERCASE_U: equ $95
VDPTILE_LOWERCASE_V: equ $96
VDPTILE_LOWERCASE_W: equ $97
VDPTILE_LOWERCASE_X: equ $98
VDPTILE_LOWERCASE_Y: equ $99
VDPTILE_LOWERCASE_Z: equ $9A
VDPTILE_ORANGE_EXCLAMATION_MARK: equ $9B
VDPTILE_ORANGE_QUOTATION_MARK: equ $9C
VDPTILE_ORANGE_NUMBER_SIGN: equ $9D
VDPTILE_ORANGE_DOLLAR_SIGN: equ $9E
VDPTILE_ORANGE_PERCENT_SIGN: equ $9F
VDPTILE_HORIZONTAL_ARROW: equ $A0
VDPTILE_STATUSEFFECT_ATTACK1: equ $A1
VDPTILE_STATUSEFFECT_ATTACK2: equ $A2
VDPTILE_STATUSEFFECT_BOOST1: equ $A3
VDPTILE_STATUSEFFECT_BOOST2: equ $A4
VDPTILE_HYPHEN: equ $A5
VDPTILE_ORANGE_AMPERSAND: equ $A6
VDPTILE_ORANGE_APOSTROPHE: equ $A7
VDPTILE_ORANGE_OPENING_ROUND_BRACKET: equ $A8
VDPTILE_ORANGE_CLOSING_ROUND_BRACKET: equ $A9
VDPTILE_ORANGE_MULTIPLICATION_SIGN: equ $AA
VDPTILE_ORANGE_PLUS_SIGN: equ $AB
VDPTILE_ORANGE_COMMA: equ $AC
VDPTILE_ORANGE_MINUS_SIGN: equ $AD
VDPTILE_ORANGE_DOT: equ $AE
VDPTILE_ORANGE_SLASH: equ $AF
VDPTILE_SWORD_ICON: equ $B0
VDPTILE_EQUIPPED_SYMBOL: equ $B1
VDPTILE_ORANGE_NUMBER_0: equ $B2
VDPTILE_ORANGE_NUMBER_1: equ $B3
VDPTILE_ORANGE_NUMBER_2: equ $B4
VDPTILE_ORANGE_NUMBER_3: equ $B5
VDPTILE_ORANGE_NUMBER_4: equ $B6
VDPTILE_ORANGE_NUMBER_5: equ $B7
VDPTILE_ORANGE_NUMBER_6: equ $B8
VDPTILE_ORANGE_NUMBER_7: equ $B9
VDPTILE_ORANGE_NUMBER_8: equ $BA
VDPTILE_ORANGE_NUMBER_9: equ $BB
VDPTILE_ORANGE_COLON: equ $BC
VDPTILE_ORANGE_SEMICOLON: equ $BD
VDPTILE_ORANGE_LESS_THAN_SIGN: equ $BE
VDPTILE_ORANGE_EQUALS_SIGN: equ $BF
VDPTILE_ORANGE_GREATER_THAN_SIGN: equ $C0
VDPTILE_ORANGE_QUESTION_MARK: equ $C1
VDPTILE_ORANGE_AT_SIGN: equ $C2
VDPTILE_ORANGE_UPPERCASE_A: equ $C3
VDPTILE_ORANGE_UPPERCASE_B: equ $C4
VDPTILE_ORANGE_UPPERCASE_C: equ $C5
VDPTILE_ORANGE_UPPERCASE_D: equ $C6
VDPTILE_ORANGE_UPPERCASE_E: equ $C7
VDPTILE_ORANGE_UPPERCASE_F: equ $C8
VDPTILE_ORANGE_UPPERCASE_G: equ $C9
VDPTILE_ORANGE_UPPERCASE_H: equ $CA
VDPTILE_ORANGE_UPPERCASE_I: equ $CB
VDPTILE_ORANGE_UPPERCASE_J: equ $CC
VDPTILE_ORANGE_UPPERCASE_K: equ $CD
VDPTILE_ORANGE_UPPERCASE_L: equ $CE
VDPTILE_ORANGE_UPPERCASE_M: equ $CF
VDPTILE_ORANGE_UPPERCASE_N: equ $D0
VDPTILE_ORANGE_UPPERCASE_O: equ $D1
VDPTILE_ORANGE_UPPERCASE_P: equ $D2
VDPTILE_ORANGE_UPPERCASE_Q: equ $D3
VDPTILE_ORANGE_UPPERCASE_R: equ $D4
VDPTILE_ORANGE_UPPERCASE_S: equ $D5
VDPTILE_ORANGE_UPPERCASE_T: equ $D6
VDPTILE_ORANGE_UPPERCASE_U: equ $D7
VDPTILE_ORANGE_UPPERCASE_V: equ $D8
VDPTILE_ORANGE_UPPERCASE_W: equ $D9
VDPTILE_ORANGE_UPPERCASE_X: equ $DA
VDPTILE_ORANGE_UPPERCASE_Y: equ $DB
VDPTILE_ORANGE_UPPERCASE_Z: equ $DC
VDPTILE_STATUSEFFECT_SLOW1: equ $DD
VDPTILE_ORANGE_BACKSLASH: equ $DE
VDPTILE_STATUSEFFECT_SLOW2: equ $DF
VDPTILE_MAX_SYMBOL1: equ $E0
VDPTILE_MAX_SYMBOL2: equ $E1
VDPTILE_STATUSEFFECT_MUDDLE1: equ $E2
VDPTILE_STATUSEFFECT_MUDDLE2: equ $E3
VDPTILE_STATUSEFFECT_SILENCE1: equ $E4
VDPTILE_STATUSEFFECT_SILENCE2: equ $E5
VDPTILE_STATUSEFFECT_SLEEP1: equ $E6
VDPTILE_STATUSEFFECT_SLEEP2: equ $E7
VDPTILE_STATUSEFFECT_POISON1: equ $E8
VDPTILE_STATUSEFFECT_POISON2: equ $E9
VDPTILE_STATUSEFFECT_STUN1: equ $EA
VDPTILE_STATUSEFFECT_STUN2: equ $EB
VDPTILE_STATUSEFFECT_CURSE1: equ $EC
VDPTILE_STATUSEFFECT_CURSE2: equ $ED
VDPTILE_JEWEL_OF_EVIL: equ $EE
VDPTILE_JEWEL_OF_LIGHT: equ $EF
VDPTILE_SPELL_LEVEL1: equ $F0
VDPTILE_SPELL_LEVEL2: equ $F1
VDPTILE_SPELL_LEVEL3: equ $F2
VDPTILE_SPELL_LEVEL4: equ $F3
VDPTILE_SPELL_LEVEL5: equ $F4
VDPTILE_SPELL_LEVEL6: equ $F5
VDPTILE_SPELL_LEVEL7: equ $F6
VDPTILE_SPELL_LEVEL8: equ $F7
VDPTILE_BLANK: equ $F8
VDPTILE_PORTRAITCORNER: equ $F9
VDPTILE_H_PORTRAITBORDER: equ $FA
VDPTILE_V_PORTRAITBORDER: equ $FB
VDPTILE_SHOP_PRICE_TAG_STRING: equ $FC
VDPTILE_RED_DOT: equ $FD
VDPTILE_GREEN_DOT: equ $FE
VDPTILE_255: equ $FF
VDPTILE_MAP_START: equ $100
VDPTILE_ENTITIES_FRAME_1_START: equ $380
VDPTILE_ENTITIES_FRAME_2_START: equ $389
VDPTILE_MENUTILE1: equ $5C0
VDPTILE_MENUTILE2: equ $5C1
VDPTILE_MENUTILE3: equ $5C2
VDPTILE_MENUTILE4: equ $5C3
VDPTILE_MENUTILE5: equ $5C4
VDPTILE_MENUTILE6: equ $5C5
VDPTILE_MENUTILE7: equ $5C6
VDPTILE_MENUTILE8: equ $5C7
VDPTILE_MENUTILE9: equ $5C8
VDPTILE_MENUTILE10: equ $5C9
VDPTILE_MENUTILE11: equ $5CA
VDPTILE_MENUTILE12: equ $5CB
VDPTILE_MENUTILE13: equ $5CC
VDPTILE_MENUTILE14: equ $5CD
VDPTILE_MENUTILE15: equ $5CE
VDPTILE_MENUTILE16: equ $5CF
VDPTILE_MENUTILE17: equ $5D0
VDPTILE_MENUTILE18: equ $5D1
VDPTILE_MENUTILE19: equ $5D2
VDPTILE_MENUTILE20: equ $5D3
VDPTILE_MENUTILE21: equ $5D4
VDPTILE_MENUTILE22: equ $5D5
VDPTILE_MENUTILE23: equ $5D6
VDPTILE_MENUTILE24: equ $5D7
VDPTILE_MENUTILE25: equ $5D8
VDPTILE_MENUTILE26: equ $5D9
VDPTILE_MENUTILE27: equ $5DA
VDPTILE_MENUTILE28: equ $5DB
VDPTILE_MENUTILE29: equ $5DC
VDPTILE_MENUTILE30: equ $5DD
VDPTILE_MENUTILE31: equ $5DE
VDPTILE_MENUTILE32: equ $5DF
VDPTILE_MENUTILE33: equ $5E0
VDPTILE_MENUTILE34: equ $5E1
VDPTILE_MENUTILE35: equ $5E2
VDPTILE_MENUTILE36: equ $5E3
VDPTILE_MENUTILE37: equ $5E4
VDPTILE_MENUTILE38: equ $5E5
VDPTILE_MENUTILE39: equ $5E6
VDPTILE_MENUTILE40: equ $5E7
VDPTILE_MENUTILE41: equ $5E8
VDPTILE_MENUTILE42: equ $5E9
VDPTILE_MENUTILE43: equ $5EA
VDPTILE_MENUTILE44: equ $5EB
VDPTILE_MENUTILE45: equ $5EC
VDPTILE_MENUTILE46: equ $5ED
VDPTILE_MENUTILE47: equ $5EE
VDPTILE_MENUTILE48: equ $5EF
VDPTILE_MENUTILE49: equ $5F0
VDPTILE_MENUTILE50: equ $5F1
VDPTILE_MENUTILE51: equ $5F2
VDPTILE_MENUTILE52: equ $5F3
VDPTILE_MENUTILE53: equ $5F4
VDPTILE_MENUTILE54: equ $5F5
VDPTILE_MENUTILE55: equ $5F6
VDPTILE_MENUTILE56: equ $5F7
VDPTILE_MENUTILE57: equ $5F8
VDPTILE_MENUTILE58: equ $5F9
VDPTILE_MENUTILE59: equ $5FA
VDPTILE_MENUTILE60: equ $5FB
VDPTILE_MENUTILE61: equ $5FC
VDPTILE_MENUTILE62: equ $5FD
VDPTILE_MENUTILE63: equ $5FE
VDPTILE_MENUTILE64: equ $5FF
VDPTILE_MESSAGE_START: equ $640 ; gets written to in VRAM with the VW font when message is being parsed and printed
VDPTILE_ICONS_START: equ $6D0
VDPTILE_SCREEN_BLACK_BAR: equ $77C ; used to hide leftmost column of the screen
VDPTILE_PORTRAITTILE1: equ $7C0
VDPTILE_PORTRAITTILE2: equ $7C1
VDPTILE_PORTRAITTILE3: equ $7C2
VDPTILE_PORTRAITTILE4: equ $7C3
VDPTILE_PORTRAITTILE5: equ $7C4
VDPTILE_PORTRAITTILE6: equ $7C5
VDPTILE_PORTRAITTILE7: equ $7C6
VDPTILE_PORTRAITTILE8: equ $7C7
VDPTILE_PORTRAITTILE9: equ $7C8
VDPTILE_PORTRAITTILE10: equ $7C9
VDPTILE_PORTRAITTILE11: equ $7CA
VDPTILE_PORTRAITTILE12: equ $7CB
VDPTILE_PORTRAITTILE13: equ $7CC
VDPTILE_PORTRAITTILE14: equ $7CD
VDPTILE_PORTRAITTILE15: equ $7CE
VDPTILE_PORTRAITTILE16: equ $7CF
VDPTILE_PORTRAITTILE17: equ $7D0
VDPTILE_PORTRAITTILE18: equ $7D1
VDPTILE_PORTRAITTILE19: equ $7D2
VDPTILE_PORTRAITTILE20: equ $7D3
VDPTILE_PORTRAITTILE21: equ $7D4
VDPTILE_PORTRAITTILE22: equ $7D5
VDPTILE_PORTRAITTILE23: equ $7D6
VDPTILE_PORTRAITTILE24: equ $7D7
VDPTILE_PORTRAITTILE25: equ $7D8
VDPTILE_PORTRAITTILE26: equ $7D9
VDPTILE_PORTRAITTILE27: equ $7DA
VDPTILE_PORTRAITTILE28: equ $7DB
VDPTILE_PORTRAITTILE29: equ $7DC
VDPTILE_PORTRAITTILE30: equ $7DD
VDPTILE_PORTRAITTILE31: equ $7DE
VDPTILE_PORTRAITTILE32: equ $7DF
VDPTILE_PORTRAITTILE33: equ $7E0
VDPTILE_PORTRAITTILE34: equ $7E1
VDPTILE_PORTRAITTILE35: equ $7E2
VDPTILE_PORTRAITTILE36: equ $7E3
VDPTILE_PORTRAITTILE37: equ $7E4
VDPTILE_PORTRAITTILE38: equ $7E5
VDPTILE_PORTRAITTILE39: equ $7E6
VDPTILE_PORTRAITTILE40: equ $7E7
VDPTILE_PORTRAITTILE41: equ $7E8
VDPTILE_PORTRAITTILE42: equ $7E9
VDPTILE_PORTRAITTILE43: equ $7EA
VDPTILE_PORTRAITTILE44: equ $7EB
VDPTILE_PORTRAITTILE45: equ $7EC
VDPTILE_PORTRAITTILE46: equ $7ED
VDPTILE_PORTRAITTILE47: equ $7EE
VDPTILE_PORTRAITTILE48: equ $7EF
VDPTILE_PORTRAITTILE49: equ $7F0
VDPTILE_PORTRAITTILE50: equ $7F1
VDPTILE_PORTRAITTILE51: equ $7F2
VDPTILE_PORTRAITTILE52: equ $7F3
VDPTILE_PORTRAITTILE53: equ $7F4
VDPTILE_PORTRAITTILE54: equ $7F5
VDPTILE_PORTRAITTILE55: equ $7F6
VDPTILE_PORTRAITTILE56: equ $7F7
VDPTILE_PORTRAITTILE57: equ $7F8
VDPTILE_PORTRAITTILE58: equ $7F9
VDPTILE_PORTRAITTILE59: equ $7FA
VDPTILE_PORTRAITTILE60: equ $7FB
VDPTILE_PORTRAITTILE61: equ $7FC
VDPTILE_PORTRAITTILE62: equ $7FD
VDPTILE_PORTRAITTILE63: equ $7FE
VDPTILE_PORTRAITTILE64: equ $7FF
VDPTILE_MIRROR: equ $800
VDPTILE_FLIP: equ $1000
VDPTILE_PALETTE2: equ $2000
VDPTILE_PALETTE3: equ $4000
VDPTILE_PALETTE4: equ $6000
VDPTILE_PRIORITY: equ $8000

; ---------------------------------------------------------------------------

; enum VdpTile_Palette1
VDPTILE_PALETTE1: equ 0

; ---------------------------------------------------------------------------

; enum VdpTiles_StatusEffects
VDPTILES_STATUSEFFECT_ATTACK: equ $C0A1C0A2
VDPTILES_STATUSEFFECT_BOOST: equ $C0A3C0A4
VDPTILES_STATUSEFFECT_SLOW: equ $C0DDC0DF
VDPTILES_STATUSEFFECT_MUDDLE: equ $C0E2C0E3
VDPTILES_STATUSEFFECT_SILENCE: equ $C0E4C0E5
VDPTILES_STATUSEFFECT_SLEEP: equ $C0E6C0E7
VDPTILES_STATUSEFFECT_POISON: equ $C0E8C0E9
VDPTILES_STATUSEFFECT_STUN: equ $C0EAC0EB
VDPTILES_STATUSEFFECT_CURSE: equ $C0ECC0ED

; ---------------------------------------------------------------------------

; enum VdpTile_Masks
VDPTILE_PALETTES_MASK: equ $6000

; ---------------------------------------------------------------------------

; enum Gold
GOLD_STARTING_AMOUNT: equ $3C
GOLD_GIFT: equ $64

; ---------------------------------------------------------------------------

; enum WindowDefinitionOffsets
WINDOWDEF_OFFSET_ACTIVE: equ 0
WINDOWDEF_OFFSET_LAYOUT_ADDRESS: equ 2
WINDOWDEF_OFFSET_WIDTH: equ 4
WINDOWDEF_OFFSET_HEIGHT: equ 5
WINDOWDEF_OFFSET_X: equ 6
WINDOWDEF_OFFSET_Y: equ 7
WINDOWDEF_OFFSET_ANIM_ORIG_X: equ 8
WINDOWDEF_OFFSET_ANIM_ORIG_Y: equ 9
WINDOWDEF_OFFSET_ANIM_DEST_X: equ $A
WINDOWDEF_OFFSET_ANIM_DEST_Y: equ $B
WINDOWDEF_OFFSET_ANIM_LENGTH: equ $C
WINDOWDEF_OFFSET_ANIM_COUNTER: equ $D
NEXT_WINDOWDEF: equ $10

; ---------------------------------------------------------------------------

; enum Fading
IN_FROM_BLACK: equ 1
OUT_TO_BLACK: equ 2
IN_FROM_WHITE: equ 3
OUT_TO_WHITE: equ 4
PULSATING_1: equ 5
PULSATING_2: equ 6
FLASH_QUICKLY_1: equ 7
NOTHING: equ 8
HALF_OUT_TO_BLACK: equ 9
FLICKER_ONCE: equ $A
FLASH_QUICKLY_2: equ $B
INSTANT_BLACK: equ $C
NOTHING_2: equ $D
HALF_IN_FROM_BLACK: equ $E
OUT_TO_BLACK_2: equ $F

; ---------------------------------------------------------------------------

; enum Direction
RIGHT: equ 0
UP: equ 1
LEFT: equ 2
DOWN: equ 3
NO_DIRECTION: equ $FF

ORIENTATION_INVERTED: equ $2
ORIENTATION_MASK: equ $3

; ---------------------------------------------------------------------------

; enum Facing
DIRECTION_MASK: equ $3

; ---------------------------------------------------------------------------

; enum DirectionMask
DIRECTION_MASK: equ 3

; ---------------------------------------------------------------------------

; enum Orientation
ORIENTATION_INVERTED: equ 2
ORIENTATION_MASK: equ 3

; ---------------------------------------------------------------------------

; enum LaserFacing

laserRight = 0
laserUp    = 1
laserLeft  = 2
laserDown  = 3

    if (STANDARD_BUILD&DIAGONAL_LASERS=1) ; change to bitfield
laserRight = 1
laserUp    = 2
laserLeft  = 4
laserDown  = 8
    endif

LASER_RIGHT: equ laserRight
LASER_UP: equ laserUp
LASER_LEFT: equ laserLeft
LASER_DOWN: equ laserDown
LASER_NONE: equ NO_DIRECTION

; ---------------------------------------------------------------------------

; enum BattleAnimation_Properties
CHANCE_TO_PERFORM_SPECIAL_CRITICAL: equ 16 ; 1/16 chance to perform special MMNK or RBT attack animation (which also forces a critical hit)

; ---------------------------------------------------------------------------

; enum BattleAnimations
BATTLEANIMATION_ATTACK: equ 0
BATTLEANIMATION_DODGE: equ 1
BATTLEANIMATION_USE_ITEM: equ 2
BATTLEANIMATION_RANGED: equ 6

; ---------------------------------------------------------------------------

; enum AllyBattleSprites
ALLYBATTLESPRITE_SDMN: equ 0
ALLYBATTLESPRITE_PRST: equ 1
ALLYBATTLESPRITE_KNTE: equ 2
ALLYBATTLESPRITE_WARR: equ 3
ALLYBATTLESPRITE_MAGE: equ 4
ALLYBATTLESPRITE_THIF: equ 5
ALLYBATTLESPRITE_TORT: equ 6
ALLYBATTLESPRITE_PHNK: equ 7
ALLYBATTLESPRITE_RNGR: equ 8
ALLYBATTLESPRITE_WFMN: equ 9
ALLYBATTLESPRITE_BDMN: equ 10
ALLYBATTLESPRITE_BRGN: equ 11
ALLYBATTLESPRITE_ACHR: equ 12
ALLYBATTLESPRITE_PLDN: equ 13
ALLYBATTLESPRITE_BDBT: equ 14
ALLYBATTLESPRITE_SORC_MALE: equ 15
ALLYBATTLESPRITE_SORC_FEMALE: equ 16
ALLYBATTLESPRITE_PGNT: equ 17
ALLYBATTLESPRITE_GLDT: equ 18
ALLYBATTLESPRITE_MMNK: equ 19
ALLYBATTLESPRITE_RBT: equ 20
ALLYBATTLESPRITE_WIZ: equ 21
ALLYBATTLESPRITE_BRN: equ 22
ALLYBATTLESPRITE_GLM: equ 23
ALLYBATTLESPRITE_HERO: equ 24
ALLYBATTLESPRITE_VICR: equ 25
ALLYBATTLESPRITE_NINJ: equ 26
ALLYBATTLESPRITE_MNST: equ 27
ALLYBATTLESPRITE_PHNX: equ 28
ALLYBATTLESPRITE_BWNT: equ 29
ALLYBATTLESPRITE_WFBR: equ 30
ALLYBATTLESPRITE_SNIP: equ 31
ALLYBATTLESPRITE_NONE: equ 255

; ---------------------------------------------------------------------------

; enum AllyBattleAnimations
ALLYBATTLEANIMATION_DODGES_START: equ 40
ALLYBATTLEANIMATION_SPECIALS_START: equ 80
ALLYBATTLEANIMATION_SPECIAL_SPEARTHROW_KNTE: equ 80
ALLYBATTLEANIMATION_SPECIAL_SPEARTHROW_PLDN: equ 81
ALLYBATTLEANIMATION_SPECIAL_SPEARTHROW_PGNT: equ 82
ALLYBATTLEANIMATION_SPECIAL_MMNK: equ 83
ALLYBATTLEANIMATION_SPECIAL_MNST: equ 84
ALLYBATTLEANIMATION_SPECIAL_RBT: equ 85
ALLYBATTLEANIMATION_SPECIAL_BRGN: equ 86

; ---------------------------------------------------------------------------

; enum EnemyBattleSprites
ENEMYBATTLESPRITE_OOZE: equ 0
ENEMYBATTLESPRITE_RAT: equ 1
ENEMYBATTLESPRITE_SOLDIER: equ 2
ENEMYBATTLESPRITE_KNIGHT: equ 3
ENEMYBATTLESPRITE_GOBLIN: equ 4
ENEMYBATTLESPRITE_DWARF: equ 5
ENEMYBATTLESPRITE_ZOMBIE: equ 6
ENEMYBATTLESPRITE_GOLEM: equ 7
ENEMYBATTLESPRITE_KRAKEN_LEG: equ 8
ENEMYBATTLESPRITE_SOULSOWER: equ 9
ENEMYBATTLESPRITE_ORC: equ 10
ENEMYBATTLESPRITE_SKELETON: equ 11
ENEMYBATTLESPRITE_LIZARDMAN: equ 12
ENEMYBATTLESPRITE_WORM: equ 13
ENEMYBATTLESPRITE_CERBERUS: equ 14
ENEMYBATTLESPRITE_REAPER: equ 15
ENEMYBATTLESPRITE_MINOTAUR: equ 16
ENEMYBATTLESPRITE_CYCLOPS: equ 17
ENEMYBATTLESPRITE_BURST_ROCK: equ 18
ENEMYBATTLESPRITE_HYDRA: equ 19
ENEMYBATTLESPRITE_CHAOS_WARRIOR: equ 20
ENEMYBATTLESPRITE_EVIL_BEAST: equ 21
ENEMYBATTLESPRITE_GIZMO: equ 22
ENEMYBATTLESPRITE_BAT: equ 23
ENEMYBATTLESPRITE_GARGOYLE: equ 24
ENEMYBATTLESPRITE_HARPY: equ 25
ENEMYBATTLESPRITE_WYVERN: equ 26
ENEMYBATTLESPRITE_PEGASUS_KNIGHT: equ 27
ENEMYBATTLESPRITE_GRIFFIN: equ 28
ENEMYBATTLESPRITE_DEMON: equ 29
ENEMYBATTLESPRITE_DRAGON: equ 30
ENEMYBATTLESPRITE_ARCHER: equ 31
ENEMYBATTLESPRITE_HUNTER_GOBLIN: equ 32
ENEMYBATTLESPRITE_KRAKEN_ARM: equ 33
ENEMYBATTLESPRITE_ARROW_LAUNCHER: equ 34
ENEMYBATTLESPRITE_BOW_RIDER: equ 35
ENEMYBATTLESPRITE_MAGE: equ 36
ENEMYBATTLESPRITE_WITCH: equ 37
ENEMYBATTLESPRITE_WIZARD: equ 38
ENEMYBATTLESPRITE_NECROMANCER: equ 39
ENEMYBATTLESPRITE_CLERIC: equ 40
ENEMYBATTLESPRITE_MONK: equ 41
ENEMYBATTLESPRITE_BISHOP: equ 42
ENEMYBATTLESPRITE_SHAMAN: equ 43
ENEMYBATTLESPRITE_KRAKEN_HEAD: equ 44
ENEMYBATTLESPRITE_TAROS: equ 45
ENEMYBATTLESPRITE_KING: equ 46
ENEMYBATTLESPRITE_ZALBARD: equ 47
ENEMYBATTLESPRITE_CAMEELA: equ 48
ENEMYBATTLESPRITE_PRISM_FLOWER: equ 49
ENEMYBATTLESPRITE_RED_BARON: equ 50
ENEMYBATTLESPRITE_GESHP: equ 51
ENEMYBATTLESPRITE_ODD_EYE: equ 52
ENEMYBATTLESPRITE_ZEON: equ 53

; ---------------------------------------------------------------------------

; enum EnemyBattleAnimations
ENEMYBATTLEANIMATION_DODGES_START: equ 60
ENEMYBATTLEANIMATION_SPECIALS_START: equ 118
ENEMYBATTLEANIMATION_SPECIAL_HELL_HOUND: equ 118
ENEMYBATTLEANIMATION_SPECIAL_DEVIL_GRIFFIN: equ 119
ENEMYBATTLEANIMATION_SPECIAL_ODD_EYE: equ 120

; ---------------------------------------------------------------------------

; enum WeaponSprites
WEAPONSPRITE_SHORT_AXE: equ 0
WEAPONSPRITE_MIDDLE_AXE: equ 1
WEAPONSPRITE_LARGE_AXE: equ 2
WEAPONSPRITE_MITHRIL_AXE: equ 3
WEAPONSPRITE_WOODEN_SWORD: equ 4
WEAPONSPRITE_SHORT_SWORD: equ 5
WEAPONSPRITE_LONG_SWORD: equ 6
WEAPONSPRITE_GREAT_SWORD: equ 7
WEAPONSPRITE_KATANA: equ 8
WEAPONSPRITE_FORCE_SWORD: equ 9
WEAPONSPRITE_BRONZE_LANCE: equ 10
WEAPONSPRITE_CHROME_LANCE: equ 11
WEAPONSPRITE_SPEAR: equ 12
WEAPONSPRITE_JAVELIN: equ 13
WEAPONSPRITE_HALBERD: equ 14
WEAPONSPRITE_WOODEN_ROD: equ 15
WEAPONSPRITE_GUARDIAN_STAFF: equ 16
WEAPONSPRITE_HOLY_STAFF: equ 17
WEAPONSPRITE_SHORT_ROD: equ 18
WEAPONSPRITE_GREAT_ROD: equ 19
WEAPONSPRITE_POWER_STICK: equ 20
WEAPONSPRITE_KNIFE: equ 21
WEAPONSPRITE_DAGGER: equ 22
WEAPONSPRITE_NONE: equ 255

; ---------------------------------------------------------------------------

; enum WeaponPalettes
WEAPONPALETTE_SHORT_AXE: equ 0
WEAPONPALETTE_MIDDLE_AXE: equ 1
WEAPONPALETTE_LARGE_AXE: equ 2
WEAPONPALETTE_HEAT_AXE: equ 3
WEAPONPALETTE_ATLAS_AXE: equ 4
WEAPONPALETTE_GROUND_AXE: equ 5
WEAPONPALETTE_RUNE_AXE: equ 6
WEAPONPALETTE_EVIL_AXE: equ 7
WEAPONPALETTE_WOODEN_SWORD: equ 8
WEAPONPALETTE_SHORT_SWORD: equ 9
WEAPONPALETTE_LONG_SWORD: equ 10
WEAPONPALETTE_ACHILLES_SWORD: equ 11
WEAPONPALETTE_COUNTER_SWORD: equ 12
WEAPONPALETTE_GREAT_SWORD: equ 13
WEAPONPALETTE_LEVANTER: equ 14
WEAPONPALETTE_CRITICAL_SWORD: equ 15
WEAPONPALETTE_DARK_SWORD: equ 16
WEAPONPALETTE_KATANA: equ 17
WEAPONPALETTE_FORCE_SWORD: equ 18
WEAPONPALETTE_WOODEN_STICK: equ 19
WEAPONPALETTE_BRONZE_LANCE: equ 20
WEAPONPALETTE_STEEL_LANCE: equ 21
WEAPONPALETTE_HEAVY_LANCE: equ 22
WEAPONPALETTE_CHROME_LANCE: equ 23
WEAPONPALETTE_HOLY_LANCE: equ 24
WEAPONPALETTE_EVIL_LANCE: equ 25
WEAPONPALETTE_SPEAR: equ 26
WEAPONPALETTE_JAVELIN: equ 27
WEAPONPALETTE_VALKYRIE: equ 28
WEAPONPALETTE_HALBERD: equ 29
WEAPONPALETTE_WOODEN_ROD: equ 30
WEAPONPALETTE_GUARDIAN_STAFF: equ 31
WEAPONPALETTE_SUPPLY_STAFF: equ 32
WEAPONPALETTE_HOLY_STAFF: equ 33
WEAPONPALETTE_FREEZE_STAFF: equ 34
WEAPONPALETTE_GODDESS_STAFF: equ 35
WEAPONPALETTE_MYSTERY_STAFF: equ 36
WEAPONPALETTE_SHORT_ROD: equ 37
WEAPONPALETTE_GREAT_ROD: equ 38
WEAPONPALETTE_POWER_STICK: equ 39
WEAPONPALETTE_KNIFE: equ 40
WEAPONPALETTE_DAGGER: equ 41

; ---------------------------------------------------------------------------

; enum BattleBackgrounds
BATTLEBACKGROUND_PLAINS: equ 0
BATTLEBACKGROUND_GRASS: equ 1
BATTLEBACKGROUND_FOREST: equ 2
BATTLEBACKGROUND_HILLS: equ 3
BATTLEBACKGROUND_SKY: equ 4
BATTLEBACKGROUND_DESERT: equ 5
BATTLEBACKGROUND_BEACH: equ 6
BATTLEBACKGROUND_TOWER_EXTERIOR: equ 7
BATTLEBACKGROUND_CASTLE: equ 8
BATTLEBACKGROUND_TOWER_INTERIOR: equ 9
BATTLEBACKGROUND_CAVE: equ 10
BATTLEBACKGROUND_MOUNTAIN: equ 11
BATTLEBACKGROUND_TOWN: equ 12
BATTLEBACKGROUND_UNDERGROUND_SHRINE: equ 13
BATTLEBACKGROUND_RIVER: equ 14
BATTLEBACKGROUND_TAROS_SHRINE: equ 15
BATTLEBACKGROUND_VALLEY: equ 16
BATTLEBACKGROUND_CHESSBOARD: equ 17
BATTLEBACKGROUND_BRIDGE: equ 18
BATTLEBACKGROUND_MITULA_SHRINE_EXTERIOR: equ 19
BATTLEBACKGROUND_MITULA_SHRINE_INTERIOR: equ 20
BATTLEBACKGROUND_TOWN_0: equ 21
BATTLEBACKGROUND_TOWN_1: equ 22
BATTLEBACKGROUND_NAZCA: equ 23
BATTLEBACKGROUND_SWAMP: equ 24
BATTLEBACKGROUND_VERSUS_ODD_EYE: equ 25
BATTLEBACKGROUND_VERSUS_GALAM: equ 26
BATTLEBACKGROUND_VERSUS_ZEON: equ 27
BATTLEBACKGROUND_BURROW: equ 28
BATTLEBACKGROUND_UNDERGROUND_SHRINE_0: equ 29
BATTLEBACKGROUND_OVERWORLD: equ 255 ; used by custom backgrounds table

; ---------------------------------------------------------------------------

; enum Mapsprites
MAPSPRITE_BOWIE_BASE: equ 0
MAPSPRITE_BOWIE_PROMO: equ 1 ; Unused : MAPSPRITE_BOWIE_SPECIAL
MAPSPRITE_SARAH_BASE: equ 2
MAPSPRITE_SARAH_PROMO: equ 3
MAPSPRITE_SARAH_SPECIAL: equ 4
MAPSPRITE_CHESTER_BASE: equ 5
MAPSPRITE_CHESTER_PROMO: equ 6
MAPSPRITE_CHESTER_SPECIAL: equ 7
MAPSPRITE_JAHA_BASE: equ 8
MAPSPRITE_JAHA_PROMO: equ 9
MAPSPRITE_JAHA_SPECIAL: equ 10
MAPSPRITE_KAZIN_BASE: equ 11
MAPSPRITE_KAZIN_PROMO: equ 12
MAPSPRITE_KAZIN_SPECIAL: equ 13
MAPSPRITE_SLADE_BASE: equ 14
MAPSPRITE_SLADE_PROMO: equ 15 ; Unused : MAPSPRITE_SLADE_SPECIAL
MAPSPRITE_KIWI_BASE: equ 16 ; Unused : MAPSPRITE_KIWI_SPECIAL
MAPSPRITE_KIWI_PROMO: equ 17
MAPSPRITE_PETER_BASE: equ 18
MAPSPRITE_PETER_PROMO: equ 19 ; Unused : MAPSPRITE_PETER_SPECIAL
MAPSPRITE_MAY_BASE: equ 20
MAPSPRITE_MAY_PROMO: equ 21 ; Unused : MAPSPRITE_MAY_SPECIAL
MAPSPRITE_GERHALT_BASE: equ 22
MAPSPRITE_GERHALT_PROMO: equ 23 ; Unused : MAPSPRITE_GERHALT_SPECIAL
MAPSPRITE_LUKE_BASE: equ 24
MAPSPRITE_LUKE_PROMO: equ 25 ; Unused : MAPSPRITE_LUKE_SPECIAL
MAPSPRITE_ROHDE_SPECIAL: equ 26 ; Unused : MAPSPRITE_ROHDE_BASE, MAPSPRITE_ROHDE_PROMO
MAPSPRITE_RICK_BASE: equ 27
MAPSPRITE_RICK_PROMO: equ 28
MAPSPRITE_RICK_SPECIAL: equ 29
MAPSPRITE_ELRIC_BASE: equ 30
MAPSPRITE_ELRIC_PROMO: equ 31
MAPSPRITE_ELRIC_SPECIAL: equ 32
MAPSPRITE_ERIC_BASE: equ 33
MAPSPRITE_ERIC_PROMO: equ 34
MAPSPRITE_ERIC_SPECIAL: equ 35
MAPSPRITE_KARNA_BASE: equ 36
MAPSPRITE_KARNA_PROMO: equ 37
MAPSPRITE_KARNA_SPECIAL: equ 38
MAPSPRITE_RANDOLF_BASE: equ 39
MAPSPRITE_RANDOLF_PROMO: equ 40
MAPSPRITE_RANDOLF_SPECIAL: equ 41
MAPSPRITE_TYRIN_BASE: equ 42
MAPSPRITE_TYRIN_PROMO: equ 43
MAPSPRITE_TYRIN_SPECIAL: equ 44
MAPSPRITE_JANET_BASE: equ 45
MAPSPRITE_JANET_PROMO: equ 46
MAPSPRITE_JANET_SPECIAL: equ 47
MAPSPRITE_HIGINS_PROMO: equ 48 ; Unused : MAPSPRITE_HIGINS_BASE, MAPSPRITE_HIGINS_SPECIAL
MAPSPRITE_SKREECH_PROMO: equ 49 ; Unused : MAPSPRITE_SKREECH_BASE, MAPSPRITE_SKREECH_SPECIAL
MAPSPRITE_TAYA_SPECIAL: equ 50 ; Unused : MAPSPRITE_TAYA_BASE, MAPSPRITE_TAYA_PROMO
MAPSPRITE_FRAYJA_PROMO: equ 51 ; Unused : MAPSPRITE_FRAYJA_BASE, MAPSPRITE_FRAYJA_SPECIAL
MAPSPRITE_JARO_SPECIAL: equ 52 ; Unused : MAPSPRITE_JARO_BASE, MAPSPRITE_JARO_PROMO
MAPSPRITE_GYAN_PROMO: equ 53 ; Unused : MAPSPRITE_GYAN_BASE, MAPSPRITE_GYAN_SPECIAL
MAPSPRITE_SHEELA_SPECIAL: equ 54 ; Unused : MAPSPRITE_SHEELA_BASE, MAPSPRITE_SHEELA_PROMO
MAPSPRITE_ZYNK_PROMO: equ 55 ; Unused : MAPSPRITE_ZYNK_BASE, MAPSPRITE_ZYNK_SPECIAL
MAPSPRITE_CHAZ_PROMO: equ 56 ; Unused : MAPSPRITE_CHAZ_BASE, MAPSPRITE_CHAZ_SPECIAL
MAPSPRITE_LEMON_SPECIAL: equ 57 ; Unused : MAPSPRITE_LEMON_BASE, MAPSPRITE_LEMON_PROMO
MAPSPRITE_CLAUDE_PROMO: equ 58 ; Unused : MAPSPRITE_CLAUDE_BASE, MAPSPRITE_CLAUDE_SPECIAL, MAPSPRITE_NONAME1_BASE, MAPSPRITE_NONAME1_PROMO, MAPSPRITE_NONAME1_SPECIAL, MAPSPRITE_NONAME2_BASE, MAPSPRITE_NONAME2_PROMO, MAPSPRITE_NONAME2_SPECIAL
MAPSPRITE_POSE1: equ 59
MAPSPRITE_BLANK: equ 60
MAPSPRITE_RAFT: equ 61
MAPSPRITE_CARAVAN: equ 62
MAPSPRITE_EFFECT1: equ 63
MAPSPRITE_OOZE: equ 64
MAPSPRITE_HUGE_RAT: equ 65
MAPSPRITE_GALAM_SOLDIER: equ 66
MAPSPRITE_GALAM_KNIGHT: equ 67
MAPSPRITE_GOBLIN: equ 68
MAPSPRITE_GREEN_OOZE: equ 69
MAPSPRITE_DARK_DWARF: equ 70
MAPSPRITE_HOBGOBLIN: equ 71
MAPSPRITE_ZOMBIE: equ 72
MAPSPRITE_GOLEM: equ 73
MAPSPRITE_KRAKEN_LEG: equ 74
MAPSPRITE_SOULSOWER: equ 75
MAPSPRITE_ORC: equ 76
MAPSPRITE_PAWN: equ 77
MAPSPRITE_KNIGHT: equ 78
MAPSPRITE_RAT: equ 79
MAPSPRITE_BUBBLING_OOZE: equ 80
MAPSPRITE_SKELETON: equ 81
MAPSPRITE_DARK_SOLDIER: equ 82
MAPSPRITE_LIZARDMAN: equ 83
MAPSPRITE_WORM: equ 84
MAPSPRITE_DARK_KNIGHT: equ 85
MAPSPRITE_ORC_LORD: equ 86
MAPSPRITE_DEVIL_SOLDIER: equ 87
MAPSPRITE_CERBERUS: equ 88
MAPSPRITE_MUD_MAN: equ 89
MAPSPRITE_DRAGONEWT: equ 90
MAPSPRITE_PURPLE_WORM: equ 91
MAPSPRITE_EXECUTIONER: equ 92
MAPSPRITE_HELL_HOUND: equ 93
MAPSPRITE_MINOTAUR: equ 94
MAPSPRITE_CYCLOPS: equ 95
MAPSPRITE_BURST_ROCK: equ 96
MAPSPRITE_HYDRA: equ 97
MAPSPRITE_CHAOS_WARRIOR: equ 98
MAPSPRITE_REAPER: equ 99
MAPSPRITE_EVIL_BEAST: equ 100
MAPSPRITE_PYROHYDRA: equ 101
MAPSPRITE_ZEON_GUARD: equ 102
MAPSPRITE_GIZMO: equ 103
MAPSPRITE_HUGE_BAT: equ 104
MAPSPRITE_VAMPIRE_BAT: equ 105
MAPSPRITE_EVIL_CLOUD: equ 106
MAPSPRITE_GARGOYLE: equ 107
MAPSPRITE_HARPY: equ 108
MAPSPRITE_LESSER_DEMON: equ 109
MAPSPRITE_WYVERN: equ 110
MAPSPRITE_HARPY_QUEEN: equ 111
MAPSPRITE_PEGASUS_KNIGHT: equ 112
MAPSPRITE_GRIFFIN: equ 113
MAPSPRITE_MIST_DEMON: equ 114
MAPSPRITE_WHITE_DRAGON: equ 115
MAPSPRITE_DEMON: equ 116
MAPSPRITE_CHAOS_DRAGON: equ 117
MAPSPRITE_DEVIL_GRIFFIN: equ 118
MAPSPRITE_ARCH_DEMON: equ 119
MAPSPRITE_GALAM_ARCHER: equ 120
MAPSPRITE_HUNTER_GOBLIN: equ 121
MAPSPRITE_DEATH_ARCHER: equ 122
MAPSPRITE_KRAKEN_ARM: equ 123
MAPSPRITE_ARROW_LAUNCHER: equ 124
MAPSPRITE_ROOK: equ 125
MAPSPRITE_DARK_SNIPER: equ 126
MAPSPRITE_BOW_MASTER: equ 127
MAPSPRITE_BOW_RIDER: equ 128
MAPSPRITE_DARK_GUNNER: equ 129
MAPSPRITE_HORSEMAN: equ 130
MAPSPRITE_GALAM_MAGE: equ 131
MAPSPRITE_WITCH: equ 132
MAPSPRITE_MASTER_MAGE: equ 133
MAPSPRITE_DARK_MADAM: equ 134
MAPSPRITE_QUEEN: equ 135
MAPSPRITE_WIZARD: equ 136
MAPSPRITE_NECROMANCER: equ 137
MAPSPRITE_CHAOS_WIZARD: equ 138
MAPSPRITE_DEMON_MASTER: equ 139
MAPSPRITE_DARK_CLERIC: equ 140
MAPSPRITE_DEATH_MONK: equ 141
MAPSPRITE_BLACK_MONK: equ 142
MAPSPRITE_HIGH_PRIEST: equ 143
MAPSPRITE_BISHOP: equ 144 ; Chess army's "Evil" Bishop
MAPSPRITE_DARK_BISHOP: equ 145
MAPSPRITE_MASTER_MONK: equ 146
MAPSPRITE_SHAMAN: equ 147
MAPSPRITE_EVIL_BISHOP: equ 148 ; The actual Evil Bishop
MAPSPRITE_BLUE_SHAMAN: equ 149
MAPSPRITE_DARK_SMOKE: equ 150
MAPSPRITE_FILLER1: equ 151 ; Filling for KRAKEN HEAD
MAPSPRITE_FILLER2: equ 152 ; Filling for TAROS
MAPSPRITE_KING: equ 153
MAPSPRITE_WILLARD: equ 154
MAPSPRITE_ZALBARD: equ 155
MAPSPRITE_CAMEELA: equ 156
MAPSPRITE_PRISM_FLOWER: equ 157
MAPSPRITE_RED_BARON: equ 158 ; Duplicate of 57, go without Portrait
MAPSPRITE_GESHP: equ 159
MAPSPRITE_ODD_EYE: equ 160
MAPSPRITE_FILLER3: equ 161 ; Filling for ???
MAPSPRITE_FILLER4: equ 162 ; Filling for ???
MAPSPRITE_GALAM_ZEON: equ 163 ; go with Zeon Portrait (46)
MAPSPRITE_GALAM_EVIL: equ 164 ; Duplicate of 164, go with Evil Galam Portrait (39)
MAPSPRITE_FILLER5: equ 165 ; Filling for Zeon ???
MAPSPRITE_FILLER6: equ 166 ; Filling for Zeon ???
MAPSPRITE_FILLER7: equ 167 ; Filling for Zeon ???
MAPSPRITE_FILLER8: equ 168 ; Filling for Zeon ???
MAPSPRITE_FILLER9: equ 169 ; Filling for Zeon ???
MAPSPRITE_NPC_ROHDE: equ 170
MAPSPRITE_FLAME1: equ 171
MAPSPRITE_ORB: equ 172
MAPSPRITE_OBJECT1: equ 173
MAPSPRITE_POSE2: equ 174
MAPSPRITE_EFFECT2: equ 175
MAPSPRITE_POSE3: equ 176
MAPSPRITE_POSE4: equ 177
MAPSPRITE_EFFECT3: equ 178
MAPSPRITE_OBJECT2: equ 179
MAPSPRITE_OBJECT3: equ 180
MAPSPRITE_OBJECT4: equ 181
MAPSPRITE_CHICK_FLYING: equ 182
MAPSPRITE_EFFECT4: equ 183
MAPSPRITE_POSE5: equ 184
MAPSPRITE_ZELOT: equ 185
MAPSPRITE_EFFECT5: equ 186
MAPSPRITE_EFFECT6: equ 187
MAPSPRITE_DESKTOP_KING: equ 188 ; Duplicate of 203, go without Portrait
MAPSPRITE_HAWEL: equ 189
MAPSPRITE_BLUE_FLAME: equ 190
MAPSPRITE_FILLER10: equ 191 ; Filling for ???
MAPSPRITE_PRIEST: equ 192
MAPSPRITE_SAILOR: equ 193
MAPSPRITE_MAN1: equ 194
MAPSPRITE_WOMAN1: equ 195
MAPSPRITE_MAN2: equ 196
MAPSPRITE_WOMAN2: equ 197
MAPSPRITE_MAN3: equ 198
MAPSPRITE_WOMAN3: equ 199
MAPSPRITE_BOY: equ 200
MAPSPRITE_GIRL: equ 201
MAPSPRITE_WORKER: equ 202
MAPSPRITE_GRANSEAL_KING: equ 203
MAPSPRITE_ELIS: equ 204
MAPSPRITE_MINISTER: equ 205
MAPSPRITE_SOLDIER1: equ 206
MAPSPRITE_SOLDIER2: equ 207
MAPSPRITE_MAID: equ 208
MAPSPRITE_ASTRAL: equ 209
MAPSPRITE_CAT: equ 210
MAPSPRITE_BOAT: equ 211
MAPSPRITE_CREED: equ 212
MAPSPRITE_ODDLER: equ 213
MAPSPRITE_GALAM_KING: equ 214 ; Duplicate of 164, go with Old Galam Portrait (38)
MAPSPRITE_MITULA: equ 215
MAPSPRITE_POSE6: equ 216
MAPSPRITE_POSE7: equ 217
MAPSPRITE_DUCK: equ 218
MAPSPRITE_FAIRY: equ 219
MAPSPRITE_BEASTMAN1: equ 220
MAPSPRITE_TURTLE: equ 221
MAPSPRITE_BEASTMAN2: equ 222
MAPSPRITE_ELF_BOY: equ 223
MAPSPRITE_ELF_GIRL: equ 224
MAPSPRITE_VIKING: equ 225
MAPSPRITE_DWARF: equ 226
MAPSPRITE_BEDOE_KING: equ 227
MAPSPRITE_BEDOE_MINISTER: equ 228
MAPSPRITE_BEDOE_SOLDIER: equ 229
MAPSPRITE_CHICK: equ 230
MAPSPRITE_PACALON_KING: equ 231
MAPSPRITE_PACALON_PRINCESS: equ 232
MAPSPRITE_PACALON_SOLDIER: equ 233
MAPSPRITE_PACALON_MAID: equ 234
MAPSPRITE_HEN: equ 235
MAPSPRITE_BIRDMAN: equ 236
MAPSPRITE_END_LIST: equ 237 ; to use 2 more sprite this one should become 239
MAPSPRITE_FREE_SPOT1: equ 238
MAPSPRITE_FREE_SPOT2: equ 239
MAPSPRITE_SPECIAL0: equ 240 ; special sprites 0-5 are free to use as regular sprites in a standard build
MAPSPRITE_SPECIAL1: equ 241 ;
MAPSPRITE_SPECIAL2: equ 242 ;
MAPSPRITE_SPECIAL3: equ 243 ;
MAPSPRITE_SPECIAL4: equ 244 ;
MAPSPRITE_SPECIAL5: equ 245 ;
MAPSPRITE_SPECIAL6: equ 246
MAPSPRITE_SPECIAL7: equ 247
MAPSPRITE_SPECIAL8: equ 248
MAPSPRITE_SPECIAL9: equ 249
MAPSPRITE_SPECIAL10: equ 250
MAPSPRITE_ZEON: equ 251
MAPSPRITE_EVIL_SPIRIT: equ 252
MAPSPRITE_NAZCA_SHIP: equ 253
MAPSPRITE_KRAKEN_HEAD: equ 254
MAPSPRITE_TAROS: equ 255

; ---------------------------------------------------------------------------

; enum Mapsprites_Default
MAPSPRITE_DEFAULT: equ 0

; ---------------------------------------------------------------------------

; enum Mapsprites_Properties
MAPSPRITES_ENEMIES_START: equ 64
MAPSPRITES_NPCS_START: equ 170
MAPSPRITES_SPECIALS_START: equ 240
MAPSPRITES_SPECIALS_END: equ 255
MAPSPRITE_MASK: equ 255

; ---------------------------------------------------------------------------

; enum SpecialSprites
SPECIALSPRITE_TAROS: equ 0
SPECIALSPRITE_KRAKEN_1: equ 1
SPECIALSPRITE_NAZCA_SHIP: equ 2
SPECIALSPRITE_EVIL_SPIRIT: equ 3
SPECIALSPRITE_ZEON_1: equ 4
SPECIALSPRITE_ZEON_2: equ 5
SPECIALSPRITE_KRAKEN_2: equ 6
SPECIALSPRITE_KRAKEN_3: equ 7
SPECIALSPRITE_KRAKEN_4: equ 8
SPECIALSPRITE_KRAKEN_5: equ 9

; ---------------------------------------------------------------------------

; enum Portraits
PORTRAIT_BOWIE_BASE: equ 0
PORTRAIT_SARAH: equ 1
PORTRAIT_CHESTER: equ 2
PORTRAIT_JAHA: equ 3
PORTRAIT_KAZIN: equ 4
PORTRAIT_SLADE_BASE: equ 5
PORTRAIT_KIWI_BASE: equ 6
PORTRAIT_PETER_BASE: equ 7
PORTRAIT_MAY: equ 8
PORTRAIT_GERHALT_BASE: equ 9
PORTRAIT_LUKE: equ 10
PORTRAIT_ROHDE: equ 11
PORTRAIT_RICK: equ 12
PORTRAIT_ELRIC: equ 13
PORTRAIT_ERIC: equ 14
PORTRAIT_KARNA: equ 15
PORTRAIT_RANDOLF: equ 16
PORTRAIT_TYRIN: equ 17
PORTRAIT_JANET: equ 18
PORTRAIT_HIGINS: equ 19
PORTRAIT_SKREECH: equ 20
PORTRAIT_TAYA: equ 21
PORTRAIT_FRAYJA: equ 22
PORTRAIT_JARO: equ 23
PORTRAIT_GYAN: equ 24
PORTRAIT_SHEELA: equ 25
PORTRAIT_ZYNK: equ 26
PORTRAIT_CHAZ: equ 27
PORTRAIT_LEMON: equ 28
PORTRAIT_CLAUDE: equ 29
PORTRAIT_ELIS: equ 30
PORTRAIT_ASTRAL: equ 31
PORTRAIT_GRANSEAL_KING: equ 32
PORTRAIT_SAILOR: equ 33
PORTRAIT_PRIEST: equ 34
PORTRAIT_MITULA: equ 36
PORTRAIT_CREED: equ 37
PORTRAIT_GALAM_KING: equ 38
PORTRAIT_GALAM_EVIL: equ 39
PORTRAIT_ODDLER: equ 40
PORTRAIT_ODD_EYE: equ 41
PORTRAIT_TAROS: equ 42
PORTRAIT_ZALBARD: equ 43
PORTRAIT_CAMEELA: equ 44
PORTRAIT_GESHP: equ 45
PORTRAIT_ZEON: equ 46
PORTRAIT_BOWIE_PROMO: equ 47
PORTRAIT_PETER_PROMO: equ 48
PORTRAIT_GERHALT_PROMO: equ 49
PORTRAIT_SLADE_PROMO: equ 50
PORTRAIT_KIWI_PROMO: equ 51
PORTRAIT_BOWIE_PAINTING: equ 52
PORTRAIT_NONE: equ 255
PORTRAIT_DEFAULT: equ 65535

; ---------------------------------------------------------------------------

; enum MapspriteDialogueDefinition

defStart = 0
portraitOffset = defStart+1
sfxOffset = defStart+2

    if (STANDARD_BUILD=1)
; Push items forward to accommodate a word-sized mapsprite index
portraitOffset = portraitOffset+1
sfxOffset = sfxOffset+1
    endif

MAPSPRITEDIALOGUEDEF_OFFSET_MAPSPRITE: equ defStart
MAPSPRITEDIALOGUEDEF_OFFSET_PORTRAIT: equ portraitOffset
MAPSPRITEDIALOGUEDEF_OFFSET_SPEECHSFX: equ sfxOffset
MAPSPRITEDIALOGUEDEF_OFFSET_ALIGNER: equ 3 ; unused if standard build
MAPSPRITEDIALOGUEDEF_ENTRY_SIZE: equ 4

; ---------------------------------------------------------------------------

; enum Allies
ALLY_BOWIE: equ 0
ALLY_SARAH: equ 1
ALLY_CHESTER: equ 2
ALLY_JAHA: equ 3
ALLY_KAZIN: equ 4
ALLY_SLADE: equ 5
ALLY_KIWI: equ 6
ALLY_PETER: equ 7
ALLY_MAY: equ 8
ALLY_GERHALT: equ 9
ALLY_LUKE: equ 10
ALLY_ROHDE: equ 11
ALLY_RICK: equ 12
ALLY_ELRIC: equ 13
ALLY_ERIC: equ 14
ALLY_KARNA: equ 15
ALLY_RANDOLF: equ 16
ALLY_TYRIN: equ 17
ALLY_JANET: equ 18
ALLY_HIGINS: equ 19
ALLY_SKREECH: equ 20
ALLY_TAYA: equ 21
ALLY_FRAYJA: equ 22
ALLY_JARO: equ 23
ALLY_GYAN: equ 24
ALLY_SHEELA: equ 25
ALLY_ZYNK: equ 26
ALLY_CHAZ: equ 27
ALLY_LEMON: equ 28
ALLY_CLAUDE: equ 29
ALLY_30: equ 30
ALLY_31: equ 31

; ---------------------------------------------------------------------------

; enum AllyEntry
ALLY_MASK_INDEX: equ $1F

; ---------------------------------------------------------------------------

; enum Followers

followerA = 30
followerB = 31
followerSize = 4

    if (STANDARD_BUILD&EXPANDED_FORCE_MEMBERS=1)
; Use enemy combatant slots to accommodate expanded force members
followerA = COMBATANT_MASK_ENEMY_BIT|28
followerB = COMBATANT_MASK_ENEMY_BIT|29
    endif

    if (STANDARD_BUILD=1)
; Increase follower entry size to accommodate expanded mapsrites
followerSize = followerSize+2 ; EXPANDED_MAPSPRITES
    endif

FOLLOWER_ENTITY_SIZE: equ followerSize
FOLLOWER_A: equ followerA 
FOLLOWER_B: equ followerB
FOLLOWER_C: equ COMBATANT_MASK_ENEMY_BIT|30
FOLLOWER_D: equ COMBATANT_MASK_ENEMY_BIT|31

; ---------------------------------------------------------------------------

; enum GrowthCurves
GROWTHCURVE_NONE: equ 0
GROWTHCURVE_LINEAR: equ 1
GROWTHCURVE_LATE: equ 2
GROWTHCURVE_EARLY: equ 3
GROWTHCURVE_MIDDLE: equ 4
GROWTHCURVE_EARLYANDLATE: equ 5

; ---------------------------------------------------------------------------

; enum GrowthCurveProperties
GROWTHCURVE_MASK_INDEX: equ 7
GROWTHCURVE_DEF_SIZE: equ 116

; ---------------------------------------------------------------------------

; enum AllyName

allyNameMaxDisplayLength = 7
allyNameMaxLength = 10

    if (STANDARD_BUILD&EIGHT_CHARACTERS_MEMBER_NAMES=1)
allyNameMaxDisplayLength = allyNameMaxDisplayLength+1
    endif

ALLYNAME_MAX_DISPLAYED_LENGTH: equ allyNameMaxDisplayLength
ALLYNAME_CHARACTERS_COUNTER: equ allyNameMaxLength-1
ALLYNAME_MAX_LENGTH: equ allyNameMaxLength

; ---------------------------------------------------------------------------

; enum AllyStartDefinition_Properties

allyStartDefEntrySize = 6

    if (STANDARD_BUILD&EXPANDED_ITEMS_AND_SPELLS=1)
allyStartDefEntrySize = 10
    endif

ALLYSTARTDEF_ENTRY_SIZE: equ allyStartDefEntrySize

; ---------------------------------------------------------------------------

; enum AllyStats
ALLYSTATS_OFFSET_NEXT_STAT: equ 2
ALLYSTATS_OFFSET_STARTING_HP: equ 2
ALLYSTATS_OFFSET_SPELL_LIST_MINUS_ONE: equ 15
ALLYSTATS_OFFSET_SPELL_LIST: equ 16
ALLYSTATS_CODE_USE_FIRST_SPELL_LIST: equ 254
ALLYSTATS_CODE_END_OF_SPELL_LIST: equ 255

; ---------------------------------------------------------------------------

; enum BattleFunctions_AfterTurnEffects
HOLY_STAFF_HP_RECOVERY: equ 2
MYSTERY_STAFF_MP_RECOVERY: equ 2
POISON_DAMAGE: equ 2
CHANCE_TO_NO_LONGER_BE_STUNNED: equ 2 ; 1/2 chance to no longer be stunned at the end of a turn
LIFE_RING_HP_RECOVERY: equ 5

; ---------------------------------------------------------------------------

; enum BattleMapCoordinatesProperties

battleMapCoordsEntrySize = 5

    if (STANDARD_BUILD&FIX_SEARCH_IN_BATTLE=1)
battleMapCoordsEntrySize = 7
    endif

BATTLEMAPCOORDINATES_ENTRY_SIZE: equ battleMapCoordsEntrySize ; US/EU "Open chest in battle" bug here ! Should be 7, not 5 !
BATTLEMAPCOORDINATES_ENTRY_SIZE_FULL: equ 7

; ---------------------------------------------------------------------------

; enum BattleMapCoordinatesOffsets
BATTLEMAPCOORDINATES_OFFSET_MAP: equ 0
BATTLEMAPCOORDINATES_OFFSET_X: equ 1
BATTLEMAPCOORDINATES_OFFSET_Y: equ 2
BATTLEMAPCOORDINATES_OFFSET_WIDTH: equ 3
BATTLEMAPCOORDINATES_OFFSET_HEIGHT: equ 4
BATTLEMAPCOORDINATES_OFFSET_TRIGGER_X: equ 5
BATTLEMAPCOORDINATES_OFFSET_TRIGGER_Y: equ 6

; ---------------------------------------------------------------------------

; enum BattleSpriteset_Offsets
BATTLESPRITESET_OFFSET_ALLY_ENTRIES: equ 4

; ---------------------------------------------------------------------------

; enum BattleSpriteset_Subsections
BATTLESPRITESET_SUBSECTION_SIZES: equ 0
BATTLESPRITESET_SUBSECTION_ALLIES: equ 1
BATTLESPRITESET_SUBSECTION_ENEMIES: equ 2
BATTLESPRITESET_SUBSECTION_AI_REGIONS: equ 3
BATTLESPRITESET_SUBSECTION_AI_POINTS: equ 4

; ---------------------------------------------------------------------------

; enum BattleSpriteset_SizeOffsets
BATTLESPRITESET_SIZEOFFSET_ALLIES: equ 0
BATTLESPRITESET_SIZEOFFSET_ENEMIES: equ 1
BATTLESPRITESET_SIZEOFFSET_REGIONS: equ 2
BATTLESPRITESET_SIZEOFFSET_AI_POINTS: equ 3

; ---------------------------------------------------------------------------

; enum BattleSpriteset_EntityOffsets
BATTLESPRITESET_ENTITYOFFSET_INDEX: equ 0
BATTLESPRITESET_ENTITYOFFSET_STARTING_X: equ 1
BATTLESPRITESET_ENTITYOFFSET_STARTING_Y: equ 2
BATTLESPRITESET_ENTITYOFFSET_AI_COMMANDSET: equ 3
BATTLESPRITESET_ENTITYOFFSET_ITEMS: equ 4
BATTLESPRITESET_ENTITYOFFSET_ENTITY_TO_FOLLOW: equ 6
BATTLESPRITESET_ENTITYOFFSET_AI_TRIGGER_REGION: equ 7
BATTLESPRITESET_ENTITYOFFSET_MOVE_TO_POSITION: equ 8
BATTLESPRITESET_ENTITYOFFSET_9: equ 9 ; unknown
BATTLESPRITESET_ENTITYOFFSET_AI_ACTIVATION_FLAG: equ 10 ; also "spawn code"?

; ---------------------------------------------------------------------------

; enum Battlespriteset_RegionOffsets
BATTLESPRITESET_REGIONOFFSET_TYPE: equ 0
BATTLESPRITESET_REGIONOFFSET_X1_Y1: equ 2
BATTLESPRITESET_REGIONOFFSET_X2_Y2: equ 4
BATTLESPRITESET_REGIONOFFSET_X3_Y3: equ 6
BATTLESPRITESET_REGIONOFFSET_X4_Y4: equ 8

; ---------------------------------------------------------------------------

; enum BattleSpritesetProperties
BATTLESPRITESET_ENTITY_ENTRY_SIZE: equ 12
BATTLESPRITESET_REGION_ENTRY_SIZE: equ 12
NEXT_BATTLESPRITESET_ENTITY: equ 12

; ---------------------------------------------------------------------------

; enum Difficulties
DIFFICULTY_NORMAL: equ 0
DIFFICULTY_HARD: equ 1
DIFFICULTY_SUPER: equ 2
DIFFICULTY_OUCH: equ 3

; ---------------------------------------------------------------------------

; enum DifficultyModifiers

    if (STANDARD_BUILD&DIFFICULTY_FACTORS=1)
NORMAL_TO_HARD_ATT: equ 5   ; modifier * 25%
NORMAL_TO_HARD_DEF: equ 4
NORMAL_TO_HARD_AGI: equ 4
HARD_TO_SUPER_ATT: equ 5
HARD_TO_SUPER_DEF: equ 4
HARD_TO_SUPER_AGI: equ 4
SUPER_TO_OUCH_ATT: equ 4
SUPER_TO_OUCH_DEF: equ 4
SUPER_TO_OUCH_AGI: equ 6
    endif

; ---------------------------------------------------------------------------

; enum EnemyItemDrop_Offsets
ENEMYITEMDROP_OFFSET_BATTLE: equ 0
ENEMYITEMDROP_OFFSET_ENTITY: equ 1
ENEMYITEMDROP_OFFSET_ITEM: equ 2
ENEMYITEMDROP_OFFSET_FLAG: equ 3

; ---------------------------------------------------------------------------

; enum EnemyItemDrop_Properties
ENEMYITEMDROP_ENTRY_SIZE: equ 4
ENEMYITEMDROP_RANDOM_CHANCE: equ 32 ; 1/32 chance to drop some special items

; ---------------------------------------------------------------------------

; enum Terrain
TERRAIN_MASK_TYPE: equ $F
TERRAIN_TYPES_COUNTER: equ $F
TERRAIN_ARRAY_ROWS_COUNTER: equ $2F
TERRAIN_ARRAY_COLUMNS_COUNTER: equ $2F
TERRAIN_ARRAY_OFFSET_NEXT_ROW: equ $30
TERRAIN_OBSTRUCTED: equ $FF

; ---------------------------------------------------------------------------

; enum LandEffectAndMoveCost
MOVECOST_OBSTRUCTED: equ $F

; ---------------------------------------------------------------------------

; enum LandEffectSettings (bitfield)
LANDEFFECTSETTING_LE0: equ 0
LANDEFFECTSETTING_LE15: equ $10
LANDEFFECTSETTING_LE30: equ $20

; ---------------------------------------------------------------------------

; enum LandEffectSetting_Obstructed
LANDEFFECTSETTING_OBSTRUCTED: equ $FF

; ---------------------------------------------------------------------------

; enum TurnOrderProperties

turnOrderEntrySize = 2
turnOrderEntriesNumber = 64

    if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
turnOrderEntrySize = 4
    endif

TURN_ORDER_ENTRY_SIZE: equ turnOrderEntrySize
TURN_ORDER_ENTRIES_MINUS_ONE_COUNTER: equ turnOrderEntriesNumber-2
TURN_ORDER_ENTRIES_COUNTER: equ turnOrderEntriesNumber-1
TURN_ORDER_ENTRIES_NUMBER: equ turnOrderEntriesNumber

; ---------------------------------------------------------------------------

; enum SpecialScreens
END_GAME_TIMER: equ $2A30 ; wait for 3 minutes till hidden battle starts

; ---------------------------------------------------------------------------

; enum Cram
CRAM_PALETTES_COUNTER: equ 3
CRAM_PER_PALETTE_COLORS_COUNTER: equ 15
CRAM_LONGWORDS_COUNTER: equ 31
CRAM_PALETTE_SIZE: equ 32
NEXT_PALETTE: equ 32
CRAM_COLORS_COUNTER: equ 63
CRAM_BYTE_COUNTER: equ 127
CRAM_SIZE: equ 128

; ---------------------------------------------------------------------------

; enum SavedDataOffsets

savedByteSize = 1
    if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
savedByteSize = 2
    endif
    
combatantEntryRealSize = COMBATANT_DATA_ENTRY_REAL_SIZE
combatantSlotsNumber = COMBATANT_SLOTS_NUMBER
dealsItemsBytes = DEALS_ITEMS_BYTES
caravanItemEntrySize = CARAVAN_ITEM_ENTRY_SIZE
caravanMaxItemsNumber = CARAVAN_MAX_ITEMS_NUMBER
turnOrderEntriesNumber = TURN_ORDER_ENTRIES_NUMBER
blacksmithMaxOrdersNumber = BLACKSMITH_MAX_ORDERS_NUMBER

                                            rsreset
SAVED_DATA_OFFSET_COMBATANT_ENTRIES:        rs.b combatantEntryRealSize*combatantSlotsNumber*savedByteSize
SAVED_DATA_OFFSET_CURRENT_GOLD:             rs.l savedByteSize
SAVED_DATA_OFFSET_DEALS_ITEMS:              rs.b dealsItemsBytes*savedByteSize
SAVED_DATA_OFFSET_CARAVAN_ITEMS_NUMBER:     rs.w savedByteSize
SAVED_DATA_OFFSET_CARAVAN_ITEMS:            rs.b caravanItemEntrySize*caravanMaxItemsNumber*savedByteSize
SAVED_DATA_OFFSET_GAME_FLAGS:               rs.b 128*savedByteSize
SAVED_DATA_OFFSET_BATTLE_AREA_X:            rs.b savedByteSize
SAVED_DATA_OFFSET_BATTLE_AREA_Y:            rs.b savedByteSize
SAVED_DATA_OFFSET_BATTLE_AREA_WIDTH:        rs.b savedByteSize
SAVED_DATA_OFFSET_BATTLE_AREA_HEIGHT:       rs.b 7*savedByteSize
SAVED_DATA_OFFSET_PLAYER_TYPE:              rs.b savedByteSize
SAVED_DATA_OFFSET_CURRENT_MAP:              rs.b savedByteSize
SAVED_DATA_OFFSET_CURRENT_BATTLE:           rs.b savedByteSize
SAVED_DATA_OFFSET_RAFT_MAP:                 rs.b savedByteSize
SAVED_DATA_OFFSET_RAFT_X:                   rs.b savedByteSize
SAVED_DATA_OFFSET_RAFT_Y:                   rs.b 2*savedByteSize
SAVED_DATA_OFFSET_MESSAGE_SPEED:            rs.b savedByteSize
SAVED_DATA_OFFSET_NO_BATTLE_MESSAGES_TOGGLE:  rs.b savedByteSize
SAVED_DATA_OFFSET_EGRESS_MAP:               rs.b savedByteSize
SAVED_DATA_OFFSET_BATTLE_TURN_ORDER:        rs.w turnOrderEntriesNumber*savedByteSize
SAVED_DATA_OFFSET_CURRENT_BATTLE_TURN:      rs.w savedByteSize
SAVED_DATA_OFFSET_SAVED_SECONDS_COUNTER:    rs.l savedByteSize
SAVED_DATA_OFFSET_SPECIAL_BATTLE_RECORD:    rs.l savedByteSize
SAVED_DATA_OFFSET_ENEMY_ITEM_DROPPED_FLAGS: rs.l savedByteSize
SAVED_DATA_OFFSET_MITHRIL_WEAPONS_ON_ORDER: rs.w blacksmithMaxOrdersNumber*savedByteSize
SAVED_DATA_SIZE:                            equ __RS

    if (SAVED_DATA_SIZE>5040)
        if (RELOCATED_SAVED_DATA_TO_SRAM=0)
            inform 0,"Warning: Saved data is large enough that it risks being overwritten by the stack."
            inform 1,"Patch RELOCATED_SAVED_DATA_TO_SRAM should be enabled."
        endif
    endif

; ---------------------------------------------------------------------------

; enum ColorProperties
COLOR_R_CHANNEL_MASK: equ $F
COLOR_G_CHANNEL_MASK: equ $F0
COLOR_B_CHANNEL_MASK: equ $F00

; ---------------------------------------------------------------------------

; enum Sram

saveSlotRealSize = SAVED_DATA_SIZE
saveSlotSize = SAVED_DATA_SIZE*2
sramSize = 8192

    if (STANDARD_BUILD&RELOCATED_SAVED_DATA_TO_SRAM=1)
saveSlotRealSize = saveSlotRealSize/2
saveSlotSize = saveSlotSize/2
    endif

    if (EXPANDED_SRAM=1)
sramSize = 32768
    endif

SAVE_FLAGS_SIZE: equ 2
SAVE_CHECKSUM_SIZE: equ 2
SRAM_STRING_CHECK_COUNTER: equ 16
SRAM_STRING_WRITE_COUNTER: equ 17
SRAM_STRING_LENGTH: equ 36
SAVE_SLOT_COUNTER: equ saveSlotRealSize-1
SAVE_SLOT_REAL_SIZE: equ saveSlotRealSize
SAVE_SLOT_SIZE: equ saveSlotSize
SRAM_COUNTER: equ sramSize-1
SRAM_SIZE: equ sramSize

; ---------------------------------------------------------------------------

; enum Vram
VRAM_PLANE_LONGWORD_COUNTER: equ $1FF
VRAM_PLANE_BYTE_SIZE: equ $1000
VRAM_PLANES_ADDRESS_DIFFERENCE: equ $1800
VRAM_ADDRESS_PLANE_A: equ $C000
VRAM_ADDRESS_PLANE_B: equ $E000

; ---------------------------------------------------------------------------

; enum Vdp
VDP_SPRITE_ENTRY_SIZE: equ 8
VDP_SPRITES_COUNTER: equ 63

; ---------------------------------------------------------------------------

; enum VdpSprite_Offsets
VDPSPRITE_OFFSET_Y: equ 0
VDPSPRITE_OFFSET_SIZE: equ 2
VDPSPRITE_OFFSET_LINK: equ 3
VDPSPRITE_OFFSET_TILE: equ 4
VDPSPRITE_OFFSET_X: equ 6
NEXTVDPSPRITE_OFFSET_Y: equ 8
NEXTVDPSPRITE_OFFSET_SIZE: equ 10
NEXTVDPSPRITE_OFFSET_LINK: equ 11
NEXTVDPSPRITE_OFFSET_TILE: equ 12
NEXTVDPSPRITE_OFFSET_X: equ 14

; ---------------------------------------------------------------------------

; enum VdpSpriteSize (bitfield)
VDPSPRITESIZE_V1: equ 0 ; vertical tile size
VDPSPRITESIZE_V2: equ $100
VDPSPRITESIZE_V3: equ $200
VDPSPRITESIZE_V4: equ $300
VDPSPRITESIZE_H1: equ 0 ; horizontal tile size
VDPSPRITESIZE_H2: equ $400
VDPSPRITESIZE_H3: equ $800
VDPSPRITESIZE_H4: equ $C00

; ---------------------------------------------------------------------------

; enum Activation
OFF: equ 0
ON: equ $FFFF

; ---------------------------------------------------------------------------

; enum Map_Events
MAP_EVENT_WARP: equ 1
MAP_EVENT_GETINTOCARAVAN: equ 2
MAP_EVENT_GETINTORAFT: equ 3
MAP_EVENT_GETOUTOFRAFT: equ 4
MAP_EVENT_GETOUTOFCARAVAN: equ 5
MAP_EVENT_ZONE_EVENT: equ 6
MAP_EVENT_RELOADMAP: equ $100FF

; ---------------------------------------------------------------------------

; enum PlayerTypes
PLAYERTYPE_BOWIE: equ 0
PLAYERTYPE_CARAVAN: equ 1
PLAYERTYPE_RAFT: equ 2

; ---------------------------------------------------------------------------

; enum AiCommands
AICOMMAND_HEAL: equ 0
AICOMMAND_HEAL2: equ 1
AICOMMAND_HEAL3: equ 2
AICOMMAND_ATTACK: equ 3
AICOMMAND_ATTACK2: equ 4
AICOMMAND_ATTACK3: equ 5
AICOMMAND_ATTACK4: equ 6
AICOMMAND_SUPPORT: equ 7
AICOMMAND_UNUSED: equ 8
AICOMMAND_UNUSED2: equ 9
AICOMMAND_SPECIAL_MOVE: equ 10
AICOMMAND_MOVE: equ 11
AICOMMAND_MOVE2: equ 12
AICOMMAND_MOVE3: equ 13
AICOMMAND_STAY: equ 14
AICOMMAND_UNUSED3: equ 15
AICOMMAND_SPECIAL_MOVE2: equ 16
AICOMMAND_SPECIAL_MOVE3: equ 17
AICOMMAND_SPECIAL_MOVE4: equ 18
AICOMMAND_SPECIAL_MOVE5: equ 19

; ---------------------------------------------------------------------------

; enum AiCommand_Params

; The following applies when patch HEALER_AI_ENHANCEMENTS is enabled.
;
; Healing instructions are composed of a single byte split into 4 parts (two bits each part).
;   Bits 0-1 = healing rule for all other targets
;   Bits 2-3 = healing rule for targeting self
;   Bits 4-5 = healing rule for targeting Monster Zero (the first monster on the map, i.e. the boss)
;   Bits 6-7 = healing rule for targeting AI 14,15
;
; Healing rules are as follows:
;   %00 = never heal the target
;   %01 = only heal if the target is at 33% health or less
;   %10 = only heal if the target is at 66% health or less (default SF2 healing instruction)
;   %11 = heal if the target is missing any health

aiCommandParamHeal  = 0
aiCommandParamHeal2 = 1
aiCommandParamHeal3 = 2

    if (STANDARD_BUILD&HEALER_AI_ENHANCEMENTS=1)
aiCommandParamHeal  = %10101010                     ; %10 = only heal if the target is at 66% health or less
aiCommandParamHeal2 = aiCommandParamHeal            ;   (default SF2 healing threshold)
aiCommandParamHeal3 = aiCommandParamHeal
    endif

AICOMMAND_PARAM_HEAL: equ aiCommandParamHeal
AICOMMAND_PARAM_HEAL2: equ aiCommandParamHeal2
AICOMMAND_PARAM_HEAL3: equ aiCommandParamHeal3

; ---------------------------------------------------------------------------

; enum GameSettings

longwordDealsCounter = (DEALS_ITEMS_BYTES/4)-1
longwordCaravanCounter = (CARAVAN_MAX_ITEMS_NUMBER/4)-1
longwordGameFlagsCounter = 31
longwordCaravanInitValue = ITEM_NOTHING|(ITEM_NOTHING*256)|(ITEM_NOTHING*65536)|(ITEM_NOTHING*16777216)

    if (STANDARD_BUILD&FIX_CARAVAN_FREE_REPAIR_EXPLOIT&EXPANDED_SRAM=1)
        if (EXPANDED_SRAM=1)
longwordCaravanCounter = (CARAVAN_MAX_ITEMS_NUMBER/2)-1
        endif
longwordCaravanInitValue = ITEM_NOTHING|(ITEM_NOTHING*65536)
    endif

LONGWORD_GAMEFLAGS_INITVALUE: equ 0
LONGWORD_DEALS_INITVALUE: equ 0
LONGWORD_DEALS_COUNTER: equ longwordDealsCounter
LONGWORD_CARAVAN_COUNTER: equ longwordCaravanCounter
LONGWORD_GAMEFLAGS_COUNTER: equ longwordGameFlagsCounter
LONGWORD_CARAVAN_INITVALUE: equ longwordCaravanInitValue

; ---------------------------------------------------------------------------

; enum GameStartValues

gamestartGold = 60
gamestartMap = MAP_GRANSEAL
gamestartSavepointX = 56
gamestartSavepointY = 3
gamestartFacing = DOWN

    if (STANDARD_BUILD&TEST_BUILD&TEST_BUILD_SKIP_TO_NEW_GRANSEAL=1)
gamestartGold = -1
gamestartMap = MAP_NEW_GRANSEAL_CASTLE
gamestartSavepointX = 19
gamestartSavepointY = 3
gamestartFacing = UP
    endif
    
GAMESTART_MAP:          equ gamestartMap
GAMESTART_SAVEPOINT_Y:  equ gamestartSavepointY
GAMESTART_FACING:       equ gamestartFacing
GAMESTART_SAVEPOINT_X:  equ gamestartSavepointX
GAMESTART_GOLD:         equ gamestartGold

; ---------------------------------------------------------------------------

; enum SoundDriverProperties

soundDriverByteSize = 8064

SOUND_DRIVER_LONG_SIZE: equ soundDriverByteSize/4
SOUND_DRIVER_BYTE_SIZE: equ soundDriverByteSize
