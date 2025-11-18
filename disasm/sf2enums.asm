
   include "enums\vdp.asm"

; ---------------------------------------------------------------------------

; enum Codes
INDEX_SHIFT_COUNT: equ 2
NIBBLE_SHIFT_COUNT: equ 4
BYTE_SHIFT_COUNT: equ 8
BYTE_LOWER_NIBBLE_MASK: equ $F
WORD_SHIFT_COUNT: equ $10
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

; enum EntityTransitions
ENTITY_TRANSITION_SCAN_UP: equ 0
ENTITY_TRANSITION_SCAN_DOWN: equ 1
ENTITY_TRANSITION_WIPE_OUT: equ 2
ENTITY_TRANSITION_WIPE_IN: equ 3
ENTITY_TRANSITION_SLIDE_OUT: equ 4
ENTITY_TRANSITION_SLIDE_IN: equ 5
ENTITY_TRANSITION_MOSAIC_OUT: equ 6
ENTITY_TRANSITION_MOSAIC_IN: equ 7

; ---------------------------------------------------------------------------

; enum Animation
ENTITY_TRANSITION_SCAN_UP: equ 0
ENTITY_TRANSITION_SCAN_DOWN: equ 1
ENTITY_TRANSITION_WIPE_OUT: equ 2
ENTITY_TRANSITION_WIPE_IN: equ 3
ENTITY_TRANSITION_SLIDE_OUT: equ 4
ENTITY_TRANSITION_SLIDE_IN: equ 5
ENTITY_TRANSITION_MOSAIC_OUT: equ 6
ENTITY_TRANSITION_MOSAIC_IN: equ 7

; ---------------------------------------------------------------------------

; enum Animation
ANIM_SPRITE_DEATH_SPIN_DELAY: equ 3 ; number of vints to wait between sprite death spins
ANIM_SPRITE_DEATH_SPINS_COUNTER: equ ANIM_SPRITE_DEATH_SPINS_NUMBER-1
ANIM_SPRITE_DEATH_SPINS_NUMBER: equ 12 ; number of sprite death spins to perform

ANIM_SPRITE_SPAWN_SPIN_DELAY: equ 3 ; number of vints to wait between sprite spawn spins
ANIM_SPRITE_SPAWN_SPINS_COUNTER: equ ANIM_SPRITE_SPAWN_SPINS_NUMBER-1
ANIM_SPRITE_SPAWN_SPINS_NUMBER: equ 12 ; number of sprite spawn spins to perform

; ---------------------------------------------------------------------------

; enum GraphicsValues
GFX_MAX_SPRITES_TO_LOAD: equ 7 ; maximum number of sprites that can be loaded per VInt
GFX_MAPSPRITE_PIXELS_COUNTER: equ 575
GFX_DIAMOND_MENU_ICON_PIXELS_NUMBER: equ 576

; ---------------------------------------------------------------------------

; enum Combatant
COMBATANT_ALLIES_START: equ 0
COMBATANT_ALLIES_MINUS_PLAYER_AND_CREATURE_COUNTER: equ 27 ; exclude Bowie and Kiwi
COMBATANT_ALLIES_MINUS_PLAYER_COUNTER: equ 28 ; exclude Bowie
COMBATANT_ALLIES_COUNTER: equ 29
COMBATANT_ALLIES_END: equ 29
COMBATANT_ALLIES_NUMBER: equ 30
COMBATANT_ENEMIES_COUNTER: equ 31
COMBATANT_ALLIES_SPACE_END_MINUS_ONE: equ 31
COMBATANT_ENEMIES_NUMBER: equ 32
COMBATANT_ALLIES_SPACE_END: equ 32
COMBATANTS_ALL_COUNTER: equ 61
COMBATANT_SLOTS_NUMBER: equ 64
COMBATANT_ENEMIES_START_MINUS_ALLIES_SPACE_END: equ 96
COMBATANT_ENEMIES_START: equ 128
COMBATANT_ENEMY_INDEX_15: equ 143 ; Jaro's enemy index during the battle to Moun
COMBATANT_ENEMIES_END: equ 159
COMBATANT_ENEMIES_SPACE_END: equ 160

; ---------------------------------------------------------------------------

; enum BattleEntity
BATTLE_NEUTRAL_ENTITY_SIZE: equ 8
BATTLE_ENEMY_ENTITIES_COUNTER: equ 29
BATTLE_ALLY_ENTITIES_COUNTER: equ 31
BATTLE_ENEMY_ENTITIES_NUMBER: equ 32
BATTLE_ALLY_ENTITIES_NUMBER: equ 32
BATTLE_ALL_ENTITIES_COUNTER: equ 63
BATTLE_ALL_ENTITIES_NUMBER: equ 64

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
COMBATANT_OFFSET_NAME: equ 0
COMBATANT_OFFSET_CLASS: equ 10
COMBATANT_OFFSET_LEVEL: equ 11
COMBATANT_OFFSET_HP_MAX: equ 12
COMBATANT_OFFSET_HP_CURRENT: equ 14
COMBATANT_OFFSET_MP_MAX: equ 16
COMBATANT_OFFSET_MP_CURRENT: equ 17
COMBATANT_OFFSET_ATT_BASE: equ 18
COMBATANT_OFFSET_ATT_CURRENT: equ 19
COMBATANT_OFFSET_DEF_BASE: equ 20
COMBATANT_OFFSET_DEF_CURRENT: equ 21
COMBATANT_OFFSET_AGI_BASE: equ 22
COMBATANT_OFFSET_AGI_CURRENT: equ 23
COMBATANT_OFFSET_MOV_BASE: equ 24
COMBATANT_OFFSET_MOV_CURRENT: equ 25
COMBATANT_OFFSET_RESIST_BASE: equ 26
COMBATANT_OFFSET_RESIST_BASE_LOW_BYTE: equ 27
COMBATANT_OFFSET_RESIST_CURRENT: equ 28
COMBATANT_OFFSET_PROWESS_BASE: equ 30
COMBATANT_OFFSET_PROWESS_CURRENT: equ 31
COMBATANT_OFFSET_ITEMS: equ 32
COMBATANT_OFFSET_ITEM_0: equ 32
COMBATANT_OFFSET_ITEM_1: equ 34
COMBATANT_OFFSET_ITEM_2: equ 36
COMBATANT_OFFSET_ITEM_3: equ 38
COMBATANT_OFFSET_SPELLS: equ 40
COMBATANT_OFFSET_SPELLS_END: equ 44
COMBATANT_OFFSET_STATUSEFFECTS: equ 44
COMBATANT_OFFSET_X: equ 46
COMBATANT_OFFSET_Y: equ 47
COMBATANT_OFFSET_EXP: equ 48
COMBATANT_OFFSET_MOVETYPE_AND_AI_COMMANDSET: equ 49 ; upper nibble holds movetype, lower nibble holds AI commandset
COMBATANT_OFFSET_ALLY_KILLS: equ 50
COMBATANT_OFFSET_MOVE_ORDERS: equ 50 ; upper byte holds combatant index to follow or first AI point if bit 6 is set, lower byte holds second AI point
COMBATANT_OFFSET_ACTIVATION_BITFIELD: equ 52 ; bits 0 and 1 = %01 if region #1 is activated, or %10 if region #2
COMBATANT_OFFSET_ALLY_DEFEATS: equ 54
COMBATANT_OFFSET_TRIGGER_REGIONS: equ 54 ; upper nibble holds trigger region index #1, lower nibble holds region #2
COMBATANT_OFFSET_ENEMY_INDEX: equ 55

; ---------------------------------------------------------------------------

; enum CombatantDataSize
COMBATANT_DATA_ENTRY_SIZE: equ 56 ; data appears twice as large to the CPU when read from an 8-bit peripheral (i.e., the SaveRAM)
COMBATANT_DATA_ENTRY_REAL_SIZE: equ 56

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

; enum StatusEffect_Mask
STATUSEFFECT_MASK: equ $FFFF

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

; ---------------------------------------------------------------------------

; enum ResistanceSettings
RESISTANCESETTING_NEUTRAL: equ 0
RESISTANCESETTING_MINOR: equ 1
RESISTANCESETTING_MAJOR: equ 2
RESISTANCESETTING_WEAKNESS: equ 3 ; weak to damage
RESISTANCESETTING_IMMUNITY: equ 3 ; immune to status effects

; ---------------------------------------------------------------------------

; enum Movetypes
MOVETYPE_UNRESTRICTED: equ 0
MOVETYPE_REGULAR: equ 1
MOVETYPE_CENTAUR: equ 2
MOVETYPE_STEALTH: equ 3
MOVETYPE_BRASS_GUNNER: equ 4
MOVETYPE_FLYING: equ 5
MOVETYPE_HOVERING: equ 6
MOVETYPE_AQUATIC: equ 7
MOVETYPE_ARCHER: equ 8
MOVETYPE_CENTAUR_ARCHER: equ 9
MOVETYPE_STEALTH_ARCHER: equ 10
MOVETYPE_MAGE: equ 11
MOVETYPE_HEALER: equ 12

; ---------------------------------------------------------------------------

; enum MovetypeProperties
MOVETYPES_NUMBER: equ 13

; ---------------------------------------------------------------------------

; enum Prowess (bitfield)
PROWESS_CRITICAL150_1IN32: equ 0
PROWESS_CRITICAL125_1IN32: equ 1
PROWESS_CRITICAL150_1IN16: equ 2
PROWESS_CRITICAL125_1IN16: equ 3
PROWESS_CRITICAL150_1IN8: equ 4
PROWESS_CRITICAL125_1IN8: equ 5
PROWESS_CRITICAL150_1IN4: equ 6
PROWESS_CRITICAL125_1IN4: equ 7
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
CRITICAL_HIT_DAMAGE_FACTOR_1: equ 1
CRITICAL_HIT_DAMAGE_FACTOR_2: equ 2

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
CLASS_NONE: equ 255

; ---------------------------------------------------------------------------

; enum ClassIndex
CLASS_MASK_INDEX: equ $1F
CLASSES_NUMBER: equ $20

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
ENEMYDEF_LONGWORDS_COUNTER: equ 13
ENEMYDEF_OFFSET_SPELLS: equ 40
ENEMYDEF_OFFSET_MOVETYPE: equ 49
ENEMYDEF_ENTRY_SIZE: equ 56

; ---------------------------------------------------------------------------

; enum SpellPower
SPELLPOWER_REGULAR: equ 0
SPELLPOWER_ENHANCED: equ 99 ; spell power increased by 25%

; ---------------------------------------------------------------------------

; enum AiBitfield (bitfield)
AIBITFIELD_PRIMARY_ACTIVE: equ 1    ; Activated for primary order
AIBITFIELD_SECONDARY_ACTIVE: equ 2  ; Activated for secondary order
AIBITFIELD_AI_CONTROLLED: equ 4     ; AI control toggle
AIBITFIELD_NEUTRAL: equ 8           ; Declared as a neutral battle entity, i.e., one that cannot act or be targeted

AIBITFIELD_BIT4: equ $10
AIBITFIELD_BIT5: equ $20
AIBITFIELD_BIT6: equ $40
AIBITFIELD_BIT7: equ $80

AIBITFIELD_RESPAWN: equ $100        ; Respawning
AIBITFIELD_HIDDEN: equ $200         ; Hidden
AIBITFIELD_BIT10: equ $400
AIBITFIELD_BIT11: equ $800

AIBITFIELD_PRIORITYMOD_0: equ 0     ; Dark Smoke and Willard
AIBITFIELD_PRIORITYMOD_1: equ $1000 ; Bosses
AIBITFIELD_PRIORITYMOD_2: equ $2000 ; Fighters
AIBITFIELD_PRIORITYMOD_3: equ $3000 ; Healer enemy

AIBITFIELD_BIT14: equ $4000
AIBITFIELD_BIT15: equ $8000

; ---------------------------------------------------------------------------

; enum AiBitfieldProperties
AIBITFIELD_BIT_PRIMARY_ACTIVE: equ 0
AIBITFIELD_BIT_SECONDARY_ACTIVE: equ 1
AIBITFIELD_BIT_AI_CONTROLLED: equ 2
AIBITFIELD_BIT_NEUTRAL: equ 3
AIBITFIELD_TRIGGER_REGIONS_MASK: equ 3
AIBITFIELD_INITIALIZATION_MASK: equ $F00

; ---------------------------------------------------------------------------

; enum AiCommands
AI_COMMAND_HEAL1: equ 0
AI_COMMAND_HEAL2: equ 1
AI_COMMAND_HEAL3: equ 2
AI_COMMAND_ATTACK1: equ 3
AI_COMMAND_ATTACK2: equ 4
AI_COMMAND_ATTACK3: equ 5
AI_COMMAND_ATTACK4: equ 6
AI_COMMAND_SUPPORT: equ 7
AI_COMMAND_UNUSED1: equ 8
AI_COMMAND_UNUSED2: equ 9
AI_COMMAND_MOVE_ORDER1: equ 10
AI_COMMAND_MOVE1: equ 11
AI_COMMAND_MOVE2: equ 12
AI_COMMAND_MOVE3: equ 13
AI_COMMAND_STAY: equ 14
AI_COMMAND_UNUSED3: equ 15
AI_COMMAND_MOVE_ORDER2: equ 16
AI_COMMAND_MOVE_ORDER3: equ 17
AI_COMMAND_MOVE_ORDER4: equ 18
AI_COMMAND_MOVE_ORDER5: equ 19

; ---------------------------------------------------------------------------

; enum AiCommand_Params
AI_COMMAND_PARAM_HEAL1: equ 0
AI_COMMAND_PARAM_HEAL2: equ 1
AI_COMMAND_PARAM_HEAL3: equ 2

AI_COMMAND_PARAM_ATTACK1: equ 0
AI_COMMAND_PARAM_ATTACK3: equ 1
AI_COMMAND_PARAM_ATTACK2: equ 2
AI_COMMAND_PARAM_ATTACK4: equ 3

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
AICOMMANDSET_INACTIVE1: equ 10
AICOMMANDSET_INACTIVE2: equ 11          ; duplicate of INACTIVE1
AICOMMANDSET_SUPPORT: equ 12
AICOMMANDSET_CRITICAL: equ 13
AICOMMANDSET_LEADER: equ 14
AICOMMANDSET_SWARM: equ 15

; ---------------------------------------------------------------------------

; enum AiOrders
AIORDER_FOLLOW_TARGET: equ 0
AIORDER_MOVE_TO: equ $40
AIORDER_FOLLOW_ENEMY: equ $80
AIORDER_NONE: equ $FF

; ---------------------------------------------------------------------------

; enum AiOrderBits
AIORDER_BIT_MOVE_TO: equ 6
AIORDER_BIT_FOLLOW_ENEMY: equ 7

; ---------------------------------------------------------------------------

; enum AiPathfindingModes
AI_PATHFINDING_MODE_REGULAR: equ 0
AI_PATHFINDING_MODE_BLOCK_NON_MOVABLE: equ 1
AI_PATHFINDING_MODE_BLOCK_AND_CARVE: equ 2

; ---------------------------------------------------------------------------

; enum AiTargetTypes
AI_TARGET_TYPE_MOVE_TO_POINT: equ 0
AI_TARGET_TYPE_FOLLOW1: equ 1
AI_TARGET_TYPE_FOLLOW2: equ 2           ; duplicate of FOLLOW1

; ---------------------------------------------------------------------------

; enum AiTriggerRegions
AI_TRIGGER_REGION_NONE: equ 15          ; if Trigger Region = None, then immediately activate

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

; enum Icons
ICON_NOTHING: equ 127
ICON_UNARMED: equ 128
ICON_SPELLS_START: equ 130 ; HEAL
ICON_JEWEL_OF_LIGHT: equ 146
ICON_JEWEL_OF_EVIL: equ 147
ICON_CRACKS_OVERLAY: equ 148

; ---------------------------------------------------------------------------

; enum IconProperties
ICON_PIXELS_LONGWORD_COUNTER: equ $2F
ICON_PIXELS_BYTE_COUNTER: equ $BF
ICON_TILE_BYTESIZE: equ $C0
ICONS_OFFSET_CRACKS: equ $6F00

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
ITEMDEF_OFFSET_EQUIPFLAGS: equ 0
ITEMDEF_OFFSET_MAX_RANGE: equ 4
ITEMDEF_OFFSET_MIN_RANGE: equ 5
ITEMDEF_OFFSET_PRICE: equ 6
ITEMDEF_OFFSET_TYPE: equ 8
ITEMDEF_OFFSET_USE_SPELL: equ 9
ITEMDEF_OFFSET_EQUIPEFFECTS: equ 10

; ---------------------------------------------------------------------------

; enum ItemDef_Properties
ITEMDEF_SIZE: equ 16

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

; ---------------------------------------------------------------------------

; enum EquipFlags_Other
EQUIPFLAG_NONE: equ 0
EQUIPFLAG_ALL: equ $FFFFFFFF

; ---------------------------------------------------------------------------

; enum EquipEffects
EQUIPEFFECT_NONE: equ 0
EQUIPEFFECT_HP_RECOVERY: equ 1 ; does nothing
EQUIPEFFECT_INCREASE_CRITICAL: equ 2
EQUIPEFFECT_INCREASE_DOUBLE: equ 3
EQUIPEFFECT_INCREASE_COUNTER: equ 4
EQUIPEFFECT_MP_RECOVERY: equ 5 ; does nothing
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

; ---------------------------------------------------------------------------

; enum EquipEffects_Properties
EQUIPEFFECTS_COUNTER: equ 1
EQUIPEFFECTS_ENTRY_SIZE: equ 2
EQUIPEFFECTS_MAX_INDEX: equ 17

; ---------------------------------------------------------------------------

; enum ItemStatBoosters
STAT_BOOST_MIN: equ 2
STAT_BOOST_MOV: equ 2
STAT_BOOST_MAX: equ 4
STAT_BOOST_MOV_CAP: equ 9

; ---------------------------------------------------------------------------

; enum ShopProperties
ITEMS_PER_SHOP_PAGE: equ 6
SHOPS_MAX_INDEX: equ 30
SHOPS_NUMBER: equ 31
SHOPS_DEBUG_MAX_INDEX: equ 100

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
SHOP_UNUSED1: equ 22
SHOP_ITEM_NEW_GRANSEAL_1: equ 23
SHOP_UNUSED2: equ 24
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
DEALS_ADD_AMOUNT_ODD: equ 1
DEALS_MAX_NUMBER_PER_ITEM: equ $F
DEALS_BIT_REMAINDER: equ $10 ; since deals are stacked 2 to a byte, this is the bit index that stores whether we are an even or odd item index
DEALS_ADD_AMOUNT_EVEN: equ $10
DEALS_ITEMS_BYTES: equ $40
DEALS_ITEMS_COUNTER: equ $7F

; ---------------------------------------------------------------------------

; enum Items (bitfield)
ITEM_MEDICAL_HERB: equ 0
ITEM_HEALING_SEED: equ 1
ITEM_HEALING_DROP: equ 2
ITEM_ANTIDOTE: equ 3
ITEM_ANGEL_WING: equ 4
ITEM_FAIRY_POWDER: equ 5 ; cures Poison/Stun outside battle (cures only Poison in battle)
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
ITEM_WARRIOR_PRIDE: equ $77
ITEM_SILVER_TANK: equ $78
ITEM_SECRET_BOOK: equ $79
ITEM_VIGOR_BALL: equ $7A
ITEM_MITHRIL: equ $7B
ITEM_LIFE_RING: equ $7C
ITEM_COTTON_BALLOON: equ $7D
ITEM_CHIRRUP_SANDALS: equ $7E
ITEM_NOTHING: equ $7F
ITEM_EQUIPPED: equ $80
ITEM_USABLE_BY_AI: equ $2000
ITEM_UNUSED_ITEM_DROP: equ $4000
ITEM_BROKEN: equ $8000

; ---------------------------------------------------------------------------

; enum ItemUnarmed
ITEM_UNARMED: equ 128

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
ITEMENTRY_OFFSET_INDEX_AND_EQUIPPED_BIT: equ 1
ITEMENTRY_SIZE: equ 2
ITEMENTRY_BIT_EQUIPPED: equ 7
ITEMENTRY_UPPERBIT_BROKEN: equ 7
ITEMENTRY_BIT_USABLE_BY_AI: equ $D
ITEMENTRY_BIT_DROPPED_BY_ENEMY: equ $E
ITEMENTRY_BIT_BROKEN: equ $F
ITEMENTRY_MASK_INDEX: equ $7F
ITEMENTRY_MASK_INDEX_AND_BROKEN_BIT: equ $807F

; ---------------------------------------------------------------------------

; enum ItemIndex_Properties
ITEMINDEX_WEAPONS_START: equ 26 ; Leather Glove
ITEMINDEX_WEAPONS_END: equ 109 ; Gisarme
ITEMINDEX_MAX: equ 127
ITEMINDEX_GOLDCHESTS_START: equ 128

; ---------------------------------------------------------------------------

; enum ItemSellPrice
ITEMSELLPRICE_BITSHIFTRIGHT: equ 2 ; to get sell price, bitshift right by this after multiplying by ITEM_SELLPRICE_MULTIPLIER
ITEMSELLPRICE_MULTIPLIER: equ 3 ; multiply price by this, then bitshift right by ITEM_SELLPRICE_BITSHIFTRIGHT

; ---------------------------------------------------------------------------

; enum ItemBreakTypes
ITEMBREAK_FLAMES: equ 0
ITEMBREAK_PIECES: equ 1
ITEMBREAK_SPLIT: equ 2
ITEMBREAK_MANGLED: equ 3
ITEMBREAK_RUSTED: equ 4

; ---------------------------------------------------------------------------

; enum EquipmentTypes
EQUIPMENTTYPE_TOOL: equ 0
EQUIPMENTTYPE_WEAPON: equ 1
EQUIPMENTTYPE_RING: equ $FFFF

; ---------------------------------------------------------------------------

; enum Blacksmith
BLACKSMITH_ORDERS_COUNTER: equ 3
BLACKSMITH_MAX_ORDERS_NUMBER: equ 4 ; ordered mithril weapon slots in RAM
BLACKSMITH_MITHRIL_ITEM: equ 123
BLACKSMITH_ORDER_COST: equ 5000

; ---------------------------------------------------------------------------

; enum Caravan
CARAVAN_ITEM_ENTRY_SIZE: equ 1
CARAVAN_ROHDE_PORTRAIT: equ 11
CARAVAN_ASTRAL_PORTRAIT: equ 31
CARAVAN_MAX_ITEMS_NUMBER_MINUS_ONE: equ 63
CARAVAN_MAX_ITEMS_NUMBER: equ 64

; ---------------------------------------------------------------------------

; enum MithrilWeaponsProperties
MITHRIL_WEAPON_ORDER_SLOT_SIZE: equ 2
MITHRIL_WEAPONS_PER_CLASS_COUNTER: equ 3
MITHRIL_WEAPON_CLASSES_COUNTER: equ 7

; ---------------------------------------------------------------------------

; enum MapDef
MAP_MIN_X: equ 0
MAP_MIN_Y: equ 0
MAP_MAX_X: equ MAP_SIZE_MAX_TILEWIDTH-1
MAP_MAX_Y: equ MAP_SIZE_MAX_TILEHEIGHT-1
MAP_SIZE_MAX_TILEWIDTH: equ 48
MAP_SIZE_MAX_TILEHEIGHT: equ 48
MAP_ARRAY_QUAD_LONGWORDS_COUNTER: equ MAP_ARRAY_QUAD_LONGWORDS_NUMBER-1
MAP_ARRAY_QUAD_LONGWORDS_NUMBER: equ MAP_ARRAY_LONGSIZE/4
MAP_ARRAY_LONGSIZE: equ MAP_ARRAY_BYTESIZE/4
MAP_ARRAY_BYTESIZE: equ MAP_SIZE_MAX_TILEWIDTH*MAP_SIZE_MAX_TILEHEIGHT
MAP_BLOCKINDEX_CLOSED_CHEST: equ 55297
MAP_BLOCKINDEX_OPEN_CHEST: equ 55298
MAP_NULLPOSITION: equ -1

; ---------------------------------------------------------------------------

; enum Map_Entity
ENTITYDEF_OFFSET_X: equ 0
ENTITYDEF_OFFSET_Y: equ 2
ENTITYDEF_OFFSET_Y_LOWERBYTE: equ 3
ENTITYDEF_OFFSET_XVELOCITY: equ 4
ENTITYDEF_SIZE_BITS: equ 5
ENTITYDEF_OFFSET_YVELOCITY: equ 6
ENTITYDEF_OFFSET_YVELOCITY_LOWERBYTE: equ 7
ENTITYDEF_OFFSET_XTRAVEL: equ 8
ENTITYDEF_OFFSET_YTRAVEL: equ $A
ENTITYDEF_OFFSET_YTRAVEL_LOWERBYTE: equ $B
ENTITYDEF_OFFSET_XDEST: equ $C
ENTITYDEF_OFFSET_YDEST: equ $E
ENTITYDEF_OFFSET_YDEST_LOWERBYTE: equ $F
ENTITYDEF_OFFSET_FACING: equ $10
ENTITYDEF_OFFSET_LAYER: equ $11
ENTITYDEF_OFFSET_ENTNUM: equ $12
ENTITYDEF_OFFSET_MAPSPRITE: equ $13
ENTITYDEF_OFFSET_ACTSCRIPTADDR: equ $14
ENTITYDEF_OFFSET_23: equ $17
ENTITYDEF_OFFSET_XACCEL: equ $18
ENTITYDEF_OFFSET_YACCEL: equ $19
ENTITYDEF_OFFSET_XSPEED: equ $1A
ENTITYDEF_OFFSET_YSPEED: equ $1B
ENTITYDEF_OFFSET_FLAGS_A: equ $1C
ENTITYDEF_OFFSET_FLAGS_B: equ $1D ; 0-1: facing direction
                                        ; 2: ghost
                                        ; 3: resize
                                        ; 4: 2x animation speed
                                        ; 5: immersed
                                        ; 6: auto-facing
                                        ; 7: blinking
ENTITYDEF_OFFSET_ANIMCOUNTER: equ $1E
ENTITYDEF_OFFSET_ACTSCRIPTWAITTIMER: equ $1F
ENTITYDEF_SIZE: equ $20
NEXT_ENTITYDEF: equ $20
ENTITYDEF_SECOND_ENTITY_XDEST: equ $2C
ENTITYDEF_SECOND_ENTITY_YDEST: equ $2E
ENTITYDEF_SECOND_ENTITY_MAPSPRITE: equ $33
ENTITYDEF_ENTITY32_XDEST: equ $3EC
ENTITYDEF_ENTITY32_YDEST: equ $3EE

; ---------------------------------------------------------------------------

; enum EntityDef_FlagsB
ENTITYDEF_FLAGS_B_GHOST: equ 2
ENTITYDEF_FLAGS_B_RESIZE: equ 3
ENTITYDEF_FLAGS_B_2X_ANIMATION_SPEED: equ 4
ENTITYDEF_FLAGS_B_IMMERSED: equ 5
ENTITYDEF_FLAGS_B_AUTO_FACING: equ 6
ENTITYDEF_FLAGS_B_BLINKING: equ 7

; ---------------------------------------------------------------------------

; enum Entities
ENTITY_PLAYER_CHARACTER: equ 0
ENTITY_CARAVAN: equ 1
ENTITY_CURSOR_SPRITES_COUNTER: equ 3
ENTITY_RAFT: equ $1F
ENTITY_ENEMY_START: equ $20
ENTITY_SPECIAL_SPRITE: equ $2F
ENTITIES_COUNTER_MINUS_ONE: equ $2F
ENTITY_CURSOR: equ $30
ENTITIES_COUNTER: equ $30
ENTITIES_TOTAL_COUNTER: equ $3F
ENTITY_ENEMY_INDEX_DIFFERENCE: equ $60
ENTITY_NONE: equ $FF
ENTITY_SPECIAL_SPRITE_WORD_ADDRESS: equ $AEE2
ENTITY_CURSOR_WORD_ADDRESS: equ $AF02
ENTITY_LAST_SPRITE_PLUS_ONE_WORD_ADDRESS: equ $DE80

; ---------------------------------------------------------------------------

; enum CameraEntity
CAMERA_NEUTRAL: equ $FFFF

; ---------------------------------------------------------------------------

; enum SoundCommands
SOUND_COMMAND_INIT_DRIVER: equ $20
SOUND_COMMAND_SFX_START_MINUS_ONE: equ $40
SOUND_COMMAND_SFX_START: equ $41
SOUND_COMMAND_WAIT_MUSIC_END: equ $F0
SOUND_COMMAND_PLAY_PREVIOUS_MUSIC: equ $FB
SOUND_COMMAND_UPDATE_MUSIC_LEVEL: equ $FC
SOUND_COMMAND_FADE_OUT: equ $FD
SOUND_COMMAND_CUT_OUT: equ $FE
SOUND_COMMAND_GET_D0_PARAMETER: equ $FFFF

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
SPELLDEF_ENTRY_SIZE: equ 8
SPELLDEFS_COUNTER: equ 99

; ---------------------------------------------------------------------------

; enum SpellAnimations (bitfield)
SPELLANIMATION_NONE: equ 0
SPELLANIMATION_BLAZE: equ 1 ; variation 1: lone flame
                            ; variation 2: small flame/fireballs
                            ; variation 3: large flame/fireballs
                            ; variation 4: large flame and flame serpent
SPELLANIMATION_FREEZE: equ 2
SPELLANIMATION_DESOUL: equ 3
SPELLANIMATION_HEALING_FAIRY: equ 4 ; ally caster: fairy of light
                                    ; enemy caster: fairy of darkness
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
SPELLANIMATION_CUTOFF: equ $18 ; used by Gisarme insta-kill
SPELLANIMATION_BUFF2: equ $19
SPELLANIMATION_ATTACK_SPELL: equ $1A ; SFCD's ATTACK spell (unused)
SPELLANIMATION_DEBUFF2: equ $1B
SPELLANIMATION_DEBUFF3: equ $1C
SPELLANIMATION_PHOENIX_ATTACK: equ $1D ; variation 1/3: sound waves
                                       ; variation 2/4: Blast cyclone
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

QUARTER_COLOR_MASK: equ $333
HALF_COLOR_MASK: equ $777
FULL_COLOR_MASK: equ $EEE

COLOR_MASK_RED: equ $E
COLOR_MASK_GREEN: equ $E0
COLOR_MASK_BLUE: equ $E00

; ---------------------------------------------------------------------------

; enum SpellTilesets
SPELLTILESET_BUBBLE_BREATH: equ 0
SPELLTILESET_FLAME_BREATH: equ 1
SPELLTILESET_BLAZE: equ 2
SPELLTILESET_DAO: equ 3
SPELLTILESET_BOLT: equ 4
SPELLTILESET_ARROWS_AND_SPEARS: equ 5
SPELLTILESET_HEALING: equ 6
SPELLTILESET_DETOX: equ 7
SPELLTILESET_PRSIM_LASER: equ 8
SPELLTILESET_DEBUFF: equ 9
SPELLTILESET_CUTOFF: equ $A
SPELLTILESET_FREEZE: equ $B
SPELLTILESET_SNOW_BREATH: equ $C
SPELLTILESET_DESOUL: equ $D
SPELLTILESET_NEPTUN: equ $E
SPELLTILESET_BLAST: equ $F
SPELLTILESET_EXPLOSION: equ $10
SPELLTILESET_GUNNER_PROJECTILE: equ $11
SPELLTILESET_CANNON_PROJECTILE: equ $12
SPELLTILESET_APOLLO: equ $13
SPELLTILESET_SOUND_WAVES: equ $14
SPELLTILESET_ODD_EYE_BEAM: equ $15
SPELLTILESET_DEMON_BREATH: equ $16

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
SPELL_HEALIN: equ $10 ; item version of Heal (Medical Herb, Healing Seed, Healing Drop)
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
SPELL_KATON: equ $1B ; Ninja version of Blaze (non-elemental)
SPELL_RAIJIN: equ $1C ; Ninja version of Bolt (non-elemental)
SPELL_DAO: equ $1D
SPELL_APOLLO: equ $1E
SPELL_NEPTUN: equ $1F
SPELL_ATLAS: equ $20
SPELL_POWDER: equ $21 ; item version of Detox (Fairy Powder)
SPELL_G_TEAR: equ $22 ; Fairy Tear
SPELL_HANNY: equ $23 ; Bright Honey
SPELL_BRAVE: equ $24 ; Brave Apple
SPELL_FBALL: equ $25 ; item version of Blaze (Shining Ball)
SPELL_BREZAD: equ $26 ; item version of Freeze (Blizzard)
SPELL_THUNDR: equ $27 ; item version of Bolt (Holy Thunder)
SPELL_AQUA: equ $28 ; Bubble/Aqua Breath
SPELL_KIWI: equ $29 ; Kiwi's Flame Breath
SPELL_SHINE: equ $2A ; map wide MP restore (Right of Hope)
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

; enum BattleActionEngine_ExpValues
STATUSEFFECT_SPELL_EXP: equ 5 ; 5 exp per target
HEALING_SPELL_EXP_MIN: equ 10
HEALING_SPELL_EXP_MAX: equ 25
HEALING_ACTION_EXP_CAP: equ 25
PER_ACTION_EXP_CAP: equ 49

; ---------------------------------------------------------------------------

; enum BattleActionEngine_SpellEffects
CHANCE_TO_CRITICAL_DEMON_BREATH: equ 0 ; no chance to critical hit
CHANCE_TO_INFLICT_MUDDLE1: equ 5 ; 3/8 base chance to inflict muddle 1
CHANCE_TO_INFLICT_MUDDLE2: equ 5 ; 3/8 base chance to inflict muddle 2
CHANCE_TO_INFLICT_DESOUL: equ 5 ; 3/8 base chance to inflict desoul
CHANCE_TO_INFLICT_SLOW: equ 5 ; 3/8 base chance to inflict slow
CHANCE_TO_INFLICT_SILENCE: equ 5 ; 3/8 base chance to inflict silence
CHANCE_TO_INFLICT_SLEEP: equ 5 ; 3/8 base chance to inflict sleep
CHANCE_TO_CRITICAL_BUBBLE_BREATH: equ 8 ; 1/8 chance to critical hit
CHANCE_TO_CRITICAL_BOLT: equ 8 ; 1/8 chance to critical hit (Bolt, Raijin, Atlas, Holy Thunder, Odd-eye beam)
CHANCE_TO_CRITICAL_FLAME_BREATH: equ 16 ; 1/16 chance to critical hit (Flame Breath, Kiwi's Flame Breath)
CHANCE_TO_CRITICAL_NEPTUN: equ 16 ; 1/16 chance to critical hit
CHANCE_TO_CRITICAL_BLAZE: equ 32 ; 1/32 chance to critical hit (Blaze, Katon, Apollo, Shining Ball)
CHANCE_TO_CRITICAL_FREEZE: equ 32 ; 1/32 chance to critical hit (Freeze, Snow Breath, Blizzard)
CHANCE_TO_CRITICAL_BLAST: equ 32 ; 1/32 chance to critical hit (Blast, Dao)
PER_ACTION_EXP_CAP: equ 49

; ---------------------------------------------------------------------------

; enum BattleActionEngine_Properties
CHANCE_TO_DODGE_FOR_MUDDLED_ATTACKER: equ 2 ; 1/2 chance to dodge if attacker is muddled
CHANCE_TO_INFLICT_CURSE_DAMAGE: equ 2 ; 1/2 chance to inflict curse damage
CHANCE_TO_BREAK_USED_ITEM: equ 4 ; 1/4 chance to break used item
CHANCE_TO_PERFORM_KIWI_FLAME_BREATH: equ 4 ; 1/4 chance to perform Kiwi's Flame Breath
INACTION_CHANCE_CURSE: equ 4 ; 1/4 chance to be unable to attack due to being cursed
INACTION_CHANCE_STUN: equ 4 ; 1/4 chance to be unable to attack due to being stunned
CHANCE_TO_DODGE_FOR_AIRBORNE_TARGET: equ 8 ; 1/8 chance to dodge if target is flying or hovering, and attacker is not an archer
CHANCE_TO_DODGE_DEFAULT: equ 32 ; 1/32 chance to dodge by default
KIWI_FLAME_BREATH_UPGRADE_LEVEL1: equ 32 ; level as MNST (not effective level)
KIWI_FLAME_BREATH_UPGRADE_LEVEL2: equ 40 ; level as MNST (not effective level)
KIWI_FLAME_BREATH_UPGRADE_LEVEL3: equ 50 ; level as MNST (not effective level)

; ---------------------------------------------------------------------------

; enum MapProperties
MAPS_DEBUG_MAX_INDEX: equ 56
MAPS_MAX_INDEX: equ MAPS_NUMBER-1
MAPS_NUMBER: equ 79
MINIMAP_TILE_SIZE: equ 96
MAP_TILE_SIZE: equ 384
MAP_TILE_PLUS: equ MAP_TILE_SIZE
MAP_TILE_MINUS: equ -MAP_TILE_SIZE

; ---------------------------------------------------------------------------

; enum Maps
MAP_MITULA_SHRINE_EXTERIOR: equ 0
MAP_MITULA_SHRINE_INTERIOR: equ 1
MAP_PACALON: equ 2
MAP_GRANSEAL: equ 3
MAP_GRANSEAL_EARTHQUAKE: equ 4
MAP_YEEL: equ 5
MAP_NEW_GRANSEAL: equ 6
MAP_NEW_GRANSEAL_CASTLE: equ 7
MAP_RIBBLE: equ 8
MAP_HASSAN: equ 9
MAP_BEDOE: equ 10
MAP_VOLCANON_SHRINE: equ 11
MAP_TAROS_SHRINE: equ 12
MAP_POLCA: equ 13
MAP_SHIP_DAMAGED: equ 14
MAP_TRISTAN: equ 15
MAP_GALAM_CASTLE: equ 16
MAP_GALAM_INTERIORS: equ 17 ; castle interiors, jail, underground tunnel
MAP_GALAM_DRAWBRIDGE: equ 18
MAP_GRANSEAL_CASTLE_2F: equ 19
MAP_GRANSEAL_CASTLE_1F: equ 20
MAP_GRANSEAL_CASTLE_3F: equ 21
MAP_DESKTOP_KINGDOM: equ 22
MAP_ELVEN_VILLAGE: equ 23
MAP_ELVEN_VILLAGE_BATTLEFIELD: equ 24
MAP_KETTO: equ 25
MAP_FLOOR_WORLD: equ 26
MAP_WILLARD_BURROW: equ 27
MAP_DEVILS_HEAD_LABYRINTH: equ 28
MAP_DWARVEN_VILLAGE_EXTERIOR: equ 29
MAP_DWARVEN_VILLAGE_INTERIOR: equ 30
MAP_MOUN: equ 31
MAP_FAIRY_CAVE: equ 32 ; connects Southwest Parmecia to Devil's Tail
MAP_CREED_MANSION: equ 33
MAP_EVIL_SPIRIT_SHRINE: equ 34
MAP_TRISTAN_CAVES: equ 35
MAP_PACALON_CASTLE: equ 36
MAP_NAZCA_SHIP: equ 37
MAP_ROFT: equ 38
MAP_MOUN_UNDERGROUND: equ 39
MAP_ANCIENT_TOWER_EXTERIOR: equ 40
MAP_DEVILS_HEAD: equ 41 ; includes Force Sword Shrine exterior
MAP_FORCE_SWORD_SHRINE: equ 42
MAP_HAWEL_HOUSE: equ 43
MAP_GRANSEAL_DOCKS_AND_SHIP: equ 44
MAP_DOJO: equ 45
MAP_TACTICAL_BASE: equ 46
MAP_PANGOAT_VALLEY_BRIDGE: equ 47
MAP_DARK_CAVES: equ 48 ; includes the Cave of Darkness and the cave connecting North and South Parmecia (i.e., the two caves that employ the "darkness gimmick")
MAP_KRAKEN_BATTLEFIELD: equ 49
MAP_ACHILLES_SHRINES: equ 50
MAP_HARPIES_POND: equ 51
MAP_MOUNT_VOLCANO: equ 52
MAP_PRISM_FLOWERS_BATTLEFIELD: equ 53
MAP_ODD_EYE_BATTLEFIELD: equ 54
MAP_NAZCA_BATTLEFIELD: equ 55
MAP_ANCIENT_TOWER_ASCENT: equ 56
MAP_ANCIENT_TOWER_ENTRANCE: equ 57 ; Gizmo battlefield
MAP_ANCIENT_TOWER_UNDERGROUND_ROOM: equ 58
MAP_ZEON_BATTLEFIELD: equ 59
MAP_ANCIENT_TOWER_STAIRWAY: equ 60
MAP_RIBBLE_SHRINE_EXTERIOR: equ 61
MAP_EAST_SHRINE: equ 62
MAP_MAGIC_TUNNEL_HUB: equ 63
MAP_MAGIC_TUNNEL_PIPE: equ 64
MAP_GRANSEAL_CASTLE: equ 65
MAP_OVERWORLD_GRANSEAL_KINGDOM: equ 66 ; includes Yeel and connects to the Galam Kingdom
MAP_OVERWORLD_DEVILS_TAIL: equ 67 ; location of Creed's Mansion
MAP_OVERWORLD_SOUTHWEST_PARMECIA: equ 68 ; includes Taros's Shrine, the Dwarf Miners Cave, and the Elven Village
MAP_OVERWORLD_SOUTH_PARMECIA: equ 69 ; includes Ribble and Hassan
MAP_OVERWORLD_SOUTHEAST_PARMECIA: equ 70 ; includes the East Shrine
MAP_OVERWORLD_PACALON_KINGDOM_DROUGHT: equ 71 ; replaced with map 78 after Mitula is saved
MAP_OVERWORLD_BEDOE_KINGDOM: equ 72 ; includes Polca, North Cliff, and Ketto
MAP_OVERWORLD_NEW_GRANSEAL_KINGDOM: equ 73
MAP_OVERWORLD_NORTH_PARMECIA: equ 74 ; includes Moun and Tristan
MAP_OVERWORLD_NAZCA_REGION: equ 75 ; includes the Nazca Ship's crash site and the dojo
MAP_OVERWORLD_ROFT_REGION: equ 76
MAP_OVERWORLD_GALAM_KINGDOM: equ 77 ; includes the Dwarven Village
MAP_OVERWORLD_PACALON_KINGDOM: equ 78 ; includes part of the path leading to the Cave of Darkness
MAP_CURRENT: equ 255 ; reload current map

; ---------------------------------------------------------------------------

; enum BattleProperties
BATTLES_MAX_INDEX: equ 44
BATTLES_NUMBER: equ 45
BATTLES_DEBUG_MAX_INDEX: equ 49

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

; enum BattlefieldEngineProperties
BATTLEFIELD_COORDINATES_ENTRY_SIZE: equ 2
BATTLEFIELD_PROCESSED_SPACE_BIT: equ 14 ; cleared after space has been processed
BATTLEFIELD_MOVE_BUDGET_MASK: equ $1F
BATTLEFIELD_TERRAIN_ENTRY_MASK: equ $1F

; ---------------------------------------------------------------------------

; enum BattlefieldEngine_BuildMovementArrays
BUILD_MOVEMENT_ARRAYS_STACK_LONGWORDS_COUNTER: equ BUILD_MOVEMENT_ARRAYS_STACK_LONGSIZE-1
BUILD_MOVEMENT_ARRAYS_STACK_LONGSIZE: equ BUILD_MOVEMENT_ARRAYS_STACK_BYTESIZE/4
BUILD_MOVEMENT_ARRAYS_STACK_BYTESIZE: equ 64
BUILD_MOVEMENT_ARRAYS_STACK_INITIAL_PATTERN: equ $40004000

; ---------------------------------------------------------------------------

; enum Battlescene
BATTLESCENE_STACK_NEGSIZE: equ $FF68

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
MAPDATA_OFFSET_AREAS: equ 14
MAPDATA_OFFSET_EVENT_FLAG: equ 18
MAPDATA_OFFSET_EVENT_STEP: equ 22
MAPDATA_OFFSET_EVENT_ROOF: equ 26
MAPDATA_OFFSET_EVENT_WARP: equ 30
MAPDATA_OFFSET_ITEM_CHEST: equ 34
MAPDATA_OFFSET_ITEM_OTHER: equ 38
MAPDATA_OFFSET_ANIMATIONS: equ 42

; ---------------------------------------------------------------------------

; enum MapDataEventWarpOffsets
MAPDATA_EVENT_WARP_OFFSET_X: equ 0
MAPDATA_EVENT_WARP_OFFSET_Y: equ 1
MAPDATA_EVENT_WARP_OFFSET_TYPE: equ 2
MAPDATA_EVENT_WARP_OFFSET_FACING: equ 6

; ---------------------------------------------------------------------------

; enum MapDataEventWarpProperties
MAPDATA_EVENT_WARP_ENTRY_SIZE: equ 8

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
MENU_MAGIC_OFFSET_MP_COST: equ $2A ; relative to spell level tiles
MENU_MAGIC_LAYOUT_BYTESIZE: equ $D8
MENU_MAGIC_SPELL_NAME_COORDS: equ $902
MENU_MAGIC_SPELL_LEVEL_TILES_COORDS: equ $903
MENU_MAGIC_MP_COST_COORDS: equ $C04

; ---------------------------------------------------------------------------

; enum ChurchMenu_Properties
CHURCHMENU_PER_LEVEL_RAISE_COST: equ 10
CHURCHMENU_CURE_POISON_COST: equ 10
CHURCHMENU_MIN_PROMOTABLE_LEVEL: equ 20
CHURCHMENU_CURE_STUN_COST: equ 20
CHURCHMENU_RAISE_COST_EXTRA_WHEN_PROMOTED: equ 200

; ---------------------------------------------------------------------------

; enum PromotionSections
PROMOTIONSECTION_REGULAR_BASE: equ 0
PROMOTIONSECTION_REGULAR_PROMO: equ 1
PROMOTIONSECTION_SPECIAL_BASE: equ 2
PROMOTIONSECTION_SPECIAL_PROMO: equ 3
PROMOTIONSECTION_SPECIAL_ITEM: equ 4

; ---------------------------------------------------------------------------

; enum MessageProperties
MESSAGES_MAX_INDEX: equ 4266
MESSAGES_NUMBER: equ 4267

; ---------------------------------------------------------------------------

; enum Messages
MESSAGE_CHANGEYOURMIND: equ 4
MESSAGE_CARAVAN_TAKE_IT_EASY: equ 10
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
WINDOW_BATTLEEQUIP_STATS_TILE_COORDS: equ $701
WINDOW_BATTLEEQUIP_SIZE: equ $A09

; ---------------------------------------------------------------------------

; enum Window_Gold
WINDOW_GOLD_SIZE: equ $904
WINDOW_GOLD_DEST: equ $1617
WINDOW_GOLD_SOURCE: equ $2017

; ---------------------------------------------------------------------------

; enum Window_TacticalBaseName
WINDOW_TACTICAL_BASE_NAME_SIZE: equ $A03
WINDOW_TACTICAL_BASE_NAME_DEST: equ $F60B

; ---------------------------------------------------------------------------

; enum Window_MiniStatus
WINDOW_MINISTATUS_OFFSET_MAX_HP: equ 6
WINDOW_MINISTATUS_OFFSET_STATBARS_START: equ 6
WINDOW_MINISTATUS_SIDECOLUMNS_NUMBER_PLUS_ONE: equ 9 ; used to calculate CopyMiddleColumns loop counter
WINDOW_MINISTATUS_MIN_WIDTH: equ $A
WINDOW_MINISTATUS_OFFSET_STAT_VALUES: equ $C
WINDOW_MINISTATUS_MAX_WIDTH: equ $16
WINDOW_MINISTATUS_OFFSET_NEXT_LINE: equ $2C
WINDOW_MINISTATUS_LONGWORD_COUNTER: equ $36
WINDOW_MINISTATUS_OFFSET_NEXT_TWO_LINES: equ $58
WINDOW_MINISTATUS_MAX_STATBAR_LENGTH: equ $64 ; HP or MP value
WINDOW_MINISTATUS_SIZE: equ $1605
WINDOW_MINISTATUS_DEST: equ $2001

; ---------------------------------------------------------------------------

; enum Window_LandEffect
WINDOW_LANDEFFECT_TEXT_HEADER_LENGTH: equ $F
WINDOW_LANDEFFECT_TEXT_HEADER_OFFSET: equ $12
WINDOW_LANDEFFECT_TEXT_VALUE_OFFSET: equ $38
WINDOW_LANDEFFECT_SIZE: equ $805
WINDOW_LANDEFFECT_DEST: equ $F801

; ---------------------------------------------------------------------------

; enum Window_Timer

WINDOW_TIMER_SIZE: equ $804
WINDOW_TIMER_DEST: equ $117

; ---------------------------------------------------------------------------

; enum Window_MemberStatus
WINDOW_MEMBERSTATUS_NA_STRING_LENGTH: equ 3
WINDOW_MEMBERSTATUS_OFFSET_NEXT_STATUSEFFECT: equ 4
WINDOW_MEMBERSTATUS_OFFSET_NEXT_LINE: equ $2A
WINDOW_MEMBERSTATUS_OFFSET_NAME: equ $2C
WINDOW_MEMBERSTATUS_OFFSET_STATUSEFFECT_TILES: equ $4E
WINDOW_MEMBERSTATUS_OFFSET_SPELL_LV_TILES: equ $58
WINDOW_MEMBERSTATUS_OFFSET_EQUIPPED_STRING: equ $58
WINDOW_MEMBERSTATUS_OFFSET_NEXT_SPELL: equ $7E
WINDOW_MEMBERSTATUS_OFFSET_NEXT_ITEM: equ $7E
WINDOW_MEMBERSTATUS_OFFSET_ENEMY_LV: equ $8C
WINDOW_MEMBERSTATUS_OFFSET_LV: equ $8E
WINDOW_MEMBERSTATUS_OFFSET_ATT: equ $A0
WINDOW_MEMBERSTATUS_OFFSET_CURRENT_HP: equ $DC
WINDOW_MEMBERSTATUS_OFFSET_MAX_HP: equ $E2
WINDOW_MEMBERSTATUS_OFFSET_DEF: equ $F4
WINDOW_MEMBERSTATUS_OFFSET_CURRENT_MP: equ $130
WINDOW_MEMBERSTATUS_OFFSET_MAX_MP: equ $136
WINDOW_MEMBERSTATUS_OFFSET_AGI: equ $148
WINDOW_MEMBERSTATUS_OFFSET_ENEMY_EXP: equ $188
WINDOW_MEMBERSTATUS_OFFSET_EXP: equ $18A
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
WINDOW_MEMBERS_LIST_HIGHLIGHTSPRITES_COUNTER: equ 1
WINDOW_MEMBERS_LIST_PAGE_STATS: equ 1
WINDOW_MEMBERS_LIST_PAGE_NEWATTANDDEF: equ 2
WINDOW_MEMBERS_LIST_ENTRIES_COUNTER: equ 4
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_EXP: equ 4
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_UNEQUIPPABLE: equ 4
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_NEWDEFENSE: equ 8
WINDOW_MEMBERS_LIST_SPRITELINK_DOWNARROW: equ $B
WINDOW_MEMBERS_LIST_ENTRY_UNEQUIPPABLE_LENGTH: equ $10
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_START: equ $10
WINDOW_MEMBERS_LIST_SPRITELINK_UPARROW: equ $10
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_LEVEL: equ $16
WINDOW_MEMBERS_LIST_HEADER_LENGTH: equ $1E
WINDOW_MEMBERS_LIST_OFFSET_NEXT_LINE: equ $3A
WINDOW_MEMBERS_LIST_OFFSET_NEXT_ENTRY: equ $74
WINDOW_MEMBERS_LIST_OFFSET_ENTRY_NAME: equ $B2
WINDOW_MEMBERS_LIST_DEST: equ $220
WINDOW_MEMBERS_LIST_SIZE: equ $1D0D

; ---------------------------------------------------------------------------

; enum Window_MemberSummary
WINDOW_MEMBERSUMMARY_PAGE_MAIN: equ 0
WINDOW_MEMBERSUMMARY_PAGE_ITEM: equ 1
WINDOW_MEMBERSUMMARY_PAGE_MAGIC: equ 2
WINDOW_MEMBERSUMMARY_HIGHLIGHTSPRITES_COUNTER: equ 2
WINDOW_MEMBERSUMMARY_PAGE_EQUIP: equ 3
WINDOW_MEMBERSUMMARY_OFFSET_NEXT_LINE: equ $2A
WINDOW_MEMBERSUMMARY_OFFSET_NAME: equ $2C
WINDOW_MEMBERSUMMARY_OFFSET_SPELL_LEVEL: equ $2C
WINDOW_MEMBERSUMMARY_OFFSET_STATUSEFFECT_TILES: equ $4E
WINDOW_MEMBERSUMMARY_OFFSET_NEXT_ITEM: equ $54
WINDOW_MEMBERSUMMARY_OFFSET_NEXT_SPELL: equ $54
WINDOW_MEMBERSUMMARY_MAIN_PAGE_OFFSET_MAGICITEM_STRING: equ $80
WINDOW_MEMBERSUMMARY_ITEM_PAGE_OFFSET_ITEM_STRING: equ $82
WINDOW_MEMBERSUMMARY_MAGIC_PAGE_OFFSET_MAGIC_STRING: equ $82
WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_EQUIPMENT_STRING: equ $82
WINDOW_MEMBERSUMMARY_MAIN_PAGE_OFFSET_MAGICLIST_START: equ $AC
WINDOW_MEMBERSUMMARY_MAIN_PAGE_OFFSET_ITEMSLIST_START: equ $C0
WINDOW_MEMBERSUMMARY_ITEM_PAGE_OFFSET_ITEMSLIST_START: equ $C0
WINDOW_MEMBERSUMMARY_MAGIC_PAGE_OFFSET_MAGICLIST_START: equ $C0
WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_ATT_STRING: equ $EA
WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_DEF_STRING: equ $13E
WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_AGI_STRING: equ $192
WINDOW_MEMBERSUMMARY_EQUIP_PAGE_OFFSET_MOV_STRING: equ $1E6
WINDOW_MEMBERSUMMARY_SIZE: equ $150D
WINDOW_MEMBERSUMMARY_DEST: equ $20F3

; ---------------------------------------------------------------------------

; enum Window_NameAlly
WINDOW_NAMEALLY_OFFSET_ENTRY: equ $14
WINDOW_NAMEALLY_PORTRAIT_POSITION: equ $201
WINDOW_NAMEALLY_ALPHABET_POSITION: equ $20B
WINDOW_NAMEALLY_ALPHABET_DEST: equ $21C
WINDOW_NAMEALLY_PORTRAIT_SIZE: equ $80A
WINDOW_NAMEALLY_ENTRY_SIZE: equ $903
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

; enum Window_Timer
WINDOW_TIMER_DEST: equ $117
WINDOW_TIMER_SIZE: equ $804

; ---------------------------------------------------------------------------

; enum Stats
LV_DIGITS_NUMBER: equ 2
EXP_DIGITS_NUMBER: equ 2
MOV_DIGITS_NUMBER: equ 2
STATS_DIGITS_NUMBER: equ 2
UNKNOWN_STAT_VALUE_THRESHOLD: equ $64
DISPLAYED_AGI_VALUE_MASK: equ $7F

; ---------------------------------------------------------------------------

; enum Text
TEXT_CODE_NEWLINE: equ $B
TEXT_CODE_MOVEDOWN: equ $D
TEXT_CODE_TOGGLEFONTCOLOR: equ $5C

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

; ---------------------------------------------------------------------------

; enum DirectionMask
DIRECTION_MASK: equ 3

; ---------------------------------------------------------------------------

; enum Orientation
ORIENTATION_REGULAR: equ 0
ORIENTATION_LEFT: equ 1
ORIENTATION_FLIPPED: equ 2
ORIENTATION_RIGHT: equ 3

; ---------------------------------------------------------------------------

; enum OrientationMask
ORIENTATION_MASK: equ 3

; ---------------------------------------------------------------------------

; enum LaserFacing
LASER_RIGHT: equ 0
LASER_UP: equ 1
LASER_LEFT: equ 2
LASER_DOWN: equ 3
LASER_NONE: equ $FF

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
ALLYBATTLESPRITE_SDMN: equ 0 ; default
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
ALLYBATTLEANIMATION_SPECIAL_MMNK: equ 83 ; special crit
ALLYBATTLEANIMATION_SPECIAL_MNST: equ 84 ; flame breath
ALLYBATTLEANIMATION_SPECIAL_RBT: equ 85 ; laser attack
ALLYBATTLEANIMATION_SPECIAL_BRGN: equ 86 ; unarmed attack

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
ENEMYBATTLEANIMATION_SPECIAL_HELL_HOUND: equ 118 ; flame breath
ENEMYBATTLEANIMATION_SPECIAL_DEVIL_GRIFFIN: equ 119 ; flame breath
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
WEAPONPALETTE_MIDDLE_AXE: equ 1 ; same as Short Axe
WEAPONPALETTE_LARGE_AXE: equ 2 ; same as Short Axe
WEAPONPALETTE_HEAT_AXE: equ 3
WEAPONPALETTE_ATLAS_AXE: equ 4 ; same as Short Axe
WEAPONPALETTE_GROUND_AXE: equ 5
WEAPONPALETTE_RUNE_AXE: equ 6 ; same as Ground Axe
WEAPONPALETTE_EVIL_AXE: equ 7
WEAPONPALETTE_WOODEN_SWORD: equ 8
WEAPONPALETTE_SHORT_SWORD: equ 9 ; same as Wooden Sword
WEAPONPALETTE_LONG_SWORD: equ 10 ; same as Wooden Sword
WEAPONPALETTE_ACHILLES_SWORD: equ 11
WEAPONPALETTE_COUNTER_SWORD: equ 12
WEAPONPALETTE_GREAT_SWORD: equ 13 ; same as Wooden Sword
WEAPONPALETTE_LEVANTER: equ 14
WEAPONPALETTE_CRITICAL_SWORD: equ 15
WEAPONPALETTE_DARK_SWORD: equ 16
WEAPONPALETTE_KATANA: equ 17
WEAPONPALETTE_FORCE_SWORD: equ 18
WEAPONPALETTE_WOODEN_STICK: equ 19
WEAPONPALETTE_BRONZE_LANCE: equ 20
WEAPONPALETTE_STEEL_LANCE: equ 21 ; same as Bronze Lance
WEAPONPALETTE_HEAVY_LANCE: equ 22
WEAPONPALETTE_CHROME_LANCE: equ 23
WEAPONPALETTE_HOLY_LANCE: equ 24
WEAPONPALETTE_EVIL_LANCE: equ 25
WEAPONPALETTE_SPEAR: equ 26
WEAPONPALETTE_JAVELIN: equ 27 ; same as Spear
WEAPONPALETTE_VALKYRIE: equ 28
WEAPONPALETTE_HALBERD: equ 29 ; same as Valkyrie
WEAPONPALETTE_WOODEN_ROD: equ 30
WEAPONPALETTE_GUARDIAN_STAFF: equ 31 ; same as Wooden Rod
WEAPONPALETTE_SUPPLY_STAFF: equ 32 ; same as Wooden Rod
WEAPONPALETTE_HOLY_STAFF: equ 33
WEAPONPALETTE_FREEZE_STAFF: equ 34
WEAPONPALETTE_GODDESS_STAFF: equ 35
WEAPONPALETTE_MYSTERY_STAFF: equ 36
WEAPONPALETTE_SHORT_ROD: equ 37
WEAPONPALETTE_GREAT_ROD: equ 38
WEAPONPALETTE_POWER_STICK: equ 39 ; same as Great Rod
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
MAPSPRITE_BOWIE_PROMO: equ 1        ; Unused : MAPSPRITE_BOWIE_SPECIAL
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
MAPSPRITE_SLADE_PROMO: equ 15       ; Unused : MAPSPRITE_SLADE_SPECIAL
MAPSPRITE_KIWI_BASE: equ 16         ; Unused : MAPSPRITE_KIWI_SPECIAL
MAPSPRITE_KIWI_PROMO: equ 17
MAPSPRITE_PETER_BASE: equ 18
MAPSPRITE_PETER_PROMO: equ 19       ; Unused : MAPSPRITE_PETER_SPECIAL
MAPSPRITE_MAY_BASE: equ 20
MAPSPRITE_MAY_PROMO: equ 21         ; Unused : MAPSPRITE_MAY_SPECIAL
MAPSPRITE_GERHALT_BASE: equ 22
MAPSPRITE_GERHALT_PROMO: equ 23     ; Unused : MAPSPRITE_GERHALT_SPECIAL
MAPSPRITE_LUKE_BASE: equ 24
MAPSPRITE_LUKE_PROMO: equ 25        ; Unused : MAPSPRITE_LUKE_SPECIAL
MAPSPRITE_ROHDE_SPECIAL: equ 26     ; Unused : MAPSPRITE_ROHDE_BASE, MAPSPRITE_ROHDE_PROMO
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
MAPSPRITE_HIGINS_PROMO: equ 48      ; Unused : MAPSPRITE_HIGINS_BASE, MAPSPRITE_HIGINS_SPECIAL
MAPSPRITE_SKREECH_PROMO: equ 49     ; Unused : MAPSPRITE_SKREECH_BASE, MAPSPRITE_SKREECH_SPECIAL
MAPSPRITE_TAYA_SPECIAL: equ 50      ; Unused : MAPSPRITE_TAYA_BASE, MAPSPRITE_TAYA_PROMO
MAPSPRITE_FRAYJA_PROMO: equ 51      ; Unused : MAPSPRITE_FRAYJA_BASE, MAPSPRITE_FRAYJA_SPECIAL
MAPSPRITE_JARO_SPECIAL: equ 52      ; Unused : MAPSPRITE_JARO_BASE, MAPSPRITE_JARO_PROMO
MAPSPRITE_GYAN_PROMO: equ 53        ; Unused : MAPSPRITE_GYAN_BASE, MAPSPRITE_GYAN_SPECIAL
MAPSPRITE_SHEELA_SPECIAL: equ 54    ; Unused : MAPSPRITE_SHEELA_BASE, MAPSPRITE_SHEELA_PROMO
MAPSPRITE_ZYNK_PROMO: equ 55        ; Unused : MAPSPRITE_ZYNK_BASE, MAPSPRITE_ZYNK_SPECIAL
MAPSPRITE_CHAZ_PROMO: equ 56        ; Unused : MAPSPRITE_CHAZ_BASE, MAPSPRITE_CHAZ_SPECIAL
MAPSPRITE_LEMON_SPECIAL: equ 57     ; Unused : MAPSPRITE_LEMON_BASE, MAPSPRITE_LEMON_PROMO
MAPSPRITE_CLAUDE_PROMO: equ 58      ; Unused : MAPSPRITE_CLAUDE_BASE, MAPSPRITE_CLAUDE_SPECIAL, MAPSPRITE_NONAME1_BASE, MAPSPRITE_NONAME1_PROMO, MAPSPRITE_NONAME1_SPECIAL, MAPSPRITE_NONAME2_BASE, MAPSPRITE_NONAME2_PROMO, MAPSPRITE_NONAME2_SPECIAL
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
MAPSPRITE_BISHOP: equ 144
MAPSPRITE_DARK_BISHOP: equ 145
MAPSPRITE_MASTER_MONK: equ 146
MAPSPRITE_SHAMAN: equ 147
MAPSPRITE_EVIL_BISHOP: equ 148
MAPSPRITE_BLUE_SHAMAN: equ 149
MAPSPRITE_DARK_SMOKE: equ 150
MAPSPRITE_FILLER1: equ 151
MAPSPRITE_FILLER2: equ 152      ; Duplicate of 151, unused
MAPSPRITE_KING: equ 153
MAPSPRITE_WILLARD: equ 154
MAPSPRITE_ZALBARD: equ 155
MAPSPRITE_CAMEELA: equ 156
MAPSPRITE_PRISM_FLOWER: equ 157
MAPSPRITE_RED_BARON: equ 158    ; Duplicate of 57, used without a portrait
MAPSPRITE_GESHP: equ 159
MAPSPRITE_ODD_EYE: equ 160
MAPSPRITE_FILLER3: equ 161
MAPSPRITE_FILLER4: equ 162      ; Duplicate of 161, loaded during cutscene after battle 38 but positioned off screen
MAPSPRITE_GALAM_ZEON: equ 163   ; used with PORTRAIT_ZEON (46)
MAPSPRITE_GALAM_EVIL: equ 164   ; Duplicate of 163, used with PORTRAIT_GALAM_EVIL (39)
MAPSPRITE_FILLER5: equ 165      ; Duplicate of 161, unused
MAPSPRITE_FILLER6: equ 166      ; Duplicate of 161, unused
MAPSPRITE_FILLER7: equ 167      ; Duplicate of 161, unused
MAPSPRITE_FILLER8: equ 168      ; Duplicate of 161, unused
MAPSPRITE_FILLER9: equ 169      ; Duplicate of 161, unused
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
MAPSPRITE_FLYING_CHICK: equ 182
MAPSPRITE_EFFECT4: equ 183
MAPSPRITE_POSE5: equ 184
MAPSPRITE_MONK: equ 185
MAPSPRITE_EFFECT5: equ 186
MAPSPRITE_EFFECT6: equ 187
MAPSPRITE_DESKTOP_KING: equ 188
MAPSPRITE_HAWEL: equ 189
MAPSPRITE_BLUE_FLAME: equ 190
MAPSPRITE_FILLER10: equ 191
MAPSPRITE_PRIEST: equ 192
MAPSPRITE_SAILOR: equ 193
MAPSPRITE_MAN: equ 194
MAPSPRITE_WOMAN: equ 195
MAPSPRITE_YOUNG_MAN: equ 196
MAPSPRITE_YOUNG_WOMAN: equ 197
MAPSPRITE_OLD_MAN: equ 198
MAPSPRITE_OLD_WOMAN: equ 199
MAPSPRITE_BOY: equ 200
MAPSPRITE_GIRL: equ 201
MAPSPRITE_WORKER: equ 202
MAPSPRITE_GRANSEAL_KING: equ 203 ; Duplicate of 188, used with PORTRAIT_GRANSEAL_KING (32)
MAPSPRITE_ELIS: equ 204
MAPSPRITE_MINISTER: equ 205
MAPSPRITE_GUARD: equ 206
MAPSPRITE_SOLDIER: equ 207
MAPSPRITE_MAID: equ 208
MAPSPRITE_ASTRAL: equ 209
MAPSPRITE_CAT: equ 210
MAPSPRITE_SHIP: equ 211
MAPSPRITE_CREED: equ 212
MAPSPRITE_ODDLER: equ 213
MAPSPRITE_GALAM_KING: equ 214   ; Duplicate of 163, used with PORTRAIT_GALAM_KING (38)
MAPSPRITE_MITULA: equ 215
MAPSPRITE_POSE6: equ 216
MAPSPRITE_POSE7: equ 217
MAPSPRITE_DUCK: equ 218
MAPSPRITE_FAIRY: equ 219
MAPSPRITE_BEASTMAN1: equ 220
MAPSPRITE_KAPPA: equ 221
MAPSPRITE_BEASTMAN2: equ 222
MAPSPRITE_ELF_MALE: equ 223
MAPSPRITE_ELF_FEMALE: equ 224
MAPSPRITE_WARRIOR: equ 225
MAPSPRITE_DWARF: equ 226
MAPSPRITE_BEDOE_KING: equ 227
MAPSPRITE_BIRDWOMAN: equ 228
MAPSPRITE_BEDRIDDEN_BIRDMAN: equ 229
MAPSPRITE_CHICK: equ 230
MAPSPRITE_PACALON_KING: equ 231
MAPSPRITE_PACALON_PRINCESS: equ 232
MAPSPRITE_CENTAUR_MALE: equ 233
MAPSPRITE_CENTAUR_FEMALE: equ 234
MAPSPRITE_HEN: equ 235
MAPSPRITE_BIRDMAN: equ 236
MAPSPRITE_FREE_SPOT1: equ 237
MAPSPRITE_FREE_SPOT2: equ 238
MAPSPRITE_FREE_SPOT3: equ 239
MAPSPRITE_SPECIAL15: equ 240
MAPSPRITE_SPECIAL14: equ 241
MAPSPRITE_SPECIAL13: equ 242
MAPSPRITE_SPECIAL12: equ 243
MAPSPRITE_SPECIAL11: equ 244
MAPSPRITE_SPECIAL10: equ 245
MAPSPRITE_SPECIAL9: equ 246     ; Special sprite 9
MAPSPRITE_SPECIAL8: equ 247     ; Special sprite 8
MAPSPRITE_SPECIAL7: equ 248     ; Special sprite 7
MAPSPRITE_SPECIAL6: equ 249     ; Special sprite 6
MAPSPRITE_SPECIAL5: equ 250     ; Special sprite 5
MAPSPRITE_ZEON: equ 251         ; Special sprite 4
MAPSPRITE_EVIL_SPIRIT: equ 252  ; Special sprite 3
MAPSPRITE_NAZCA_SHIP: equ 253   ; Special sprite 2
MAPSPRITE_KRAKEN_HEAD: equ 254  ; Special sprite 1
MAPSPRITE_TAROS: equ 255        ; Special sprite 0

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
SPECIAL_SPRITE_TAROS: equ 0
SPECIAL_SPRITE_KRAKEN_1: equ 1
SPECIAL_SPRITE_NAZCA_SHIP: equ 2
SPECIAL_SPRITE_EVIL_SPIRIT: equ 3
SPECIAL_SPRITE_ZEON_1: equ 4
SPECIAL_SPRITE_ZEON_2: equ 5
SPECIAL_SPRITE_KRAKEN_2: equ 6
SPECIAL_SPRITE_KRAKEN_3: equ 7
SPECIAL_SPRITE_KRAKEN_4: equ 8
SPECIAL_SPRITE_KRAKEN_5: equ 9

; ---------------------------------------------------------------------------

; enum Portraits
PORTRAIT_BOWIE_BASE: equ 0 ; allies use portrait index matching their ally index, unless changed at promotion
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
MAPSPRITEDIALOGUEDEF_OFFSET_MAPSPRITE: equ 0
MAPSPRITEDIALOGUEDEF_OFFSET_PORTRAIT: equ 1
MAPSPRITEDIALOGUEDEF_OFFSET_SPEECHSFX: equ 2
MAPSPRITEDIALOGUEDEF_OFFSET_ALIGNER: equ 3
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
ALLY_SADJOIN: equ 32768 ; $8000

ALLY_SADJOIN: equ $8000

; ---------------------------------------------------------------------------

; enum AllyEntry
ALLY_MASK_INDEX: equ $1F

; ---------------------------------------------------------------------------

; enum Followers
FOLLOWER_ENTITY_SIZE: equ 4
FOLLOWER_A: equ 30
FOLLOWER_B: equ 31
FOLLOWER_C: equ 158
FOLLOWER_D: equ 159

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
ALLYNAME_MAX_DISPLAYED_LENGTH: equ 7
ALLYNAME_CHARACTERS_COUNTER: equ 9
ALLYNAME_MAX_LENGTH: equ 10

; ---------------------------------------------------------------------------

; enum AllyStartDefinition_Properties
ALLYSTARTDEF_ENTRY_SIZE: equ 6

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
BATTLEMAPCOORDINATES_ENTRY_SIZE: equ 5 ; US/EU "Open chest in battle" bug here ! Should be 7, not 5 !
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
BATTLESPRITESET_ENTITYOFFSET_PRIMARY_ORDER: equ 6
BATTLESPRITESET_ENTITYOFFSET_PRIMARY_TRIGGER_REGION: equ 7
BATTLESPRITESET_ENTITYOFFSET_SECONDARY_ORDER: equ 8
BATTLESPRITESET_ENTITYOFFSET_SECONDARY_TRIGGER_REGION: equ 9
BATTLESPRITESET_ENTITYOFFSET_INITIALIZATION_TYPE: equ 10 ; (2 bytes) (bitfield)
                                                         ; 0: normal initialization
                                                         ; 1: reinitialize if dead
                                                         ; 2: initialize off-map, spawn with trigger region activation

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
TERRAIN_BIT_IMPASSABLE: equ 6
TERRAIN_BIT_OCCUPIED: equ 7
TERRAIN_MASK_TYPE: equ 15
TERRAIN_TYPES_COUNTER: equ 15
TERRAIN_ARRAY_ROWS_COUNTER: equ 47
TERRAIN_ARRAY_COLUMNS_COUNTER: equ 47
TERRAIN_ARRAY_OFFSET_NEXT_ROW: equ 48
TERRAIN_OBSTRUCTED: equ -1

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
LANDEFFECTSETTING_OBSTRUCTED: equ $FF ; gives "30%" effect, displays as "25%" (Taros)

; ---------------------------------------------------------------------------

; enum TurnOrderProperties
TURN_ORDER_ENTRY_SIZE: equ 2
TURN_ORDER_ENTRIES_MINUS_ONE_COUNTER: equ 62
TURN_ORDER_ENTRIES_COUNTER: equ 63
TURN_ORDER_ENTRIES_NUMBER: equ 64

; ---------------------------------------------------------------------------

; enum SpecialScreens
END_GAME_TIMER: equ $2A30 ; wait for 3 minutes till hidden battle starts

; ---------------------------------------------------------------------------

; enum Cram
CRAM_PALETTES_COUNTER: equ 3
CRAM_PALETTE_LONGWORDS_COUNTER: equ 7
CRAM_PER_PALETTE_COLORS_COUNTER: equ 15
CRAM_LONGWORDS_COUNTER: equ 31
CRAM_PALETTE_SIZE: equ 32
NEXT_PALETTE: equ 32
CRAM_COLORS_COUNTER: equ 63
CRAM_BYTE_COUNTER: equ 127
CRAM_SIZE: equ 128

; ---------------------------------------------------------------------------

; enum ColorProperties
COLOR_R_CHANNEL_MASK: equ $F
COLOR_G_CHANNEL_MASK: equ $F0
COLOR_B_CHANNEL_MASK: equ $F00

; ---------------------------------------------------------------------------

; enum Sram
SAVE_FLAGS_SIZE: equ 2
SAVE_CHECKSUM_SIZE: equ 2
SRAM_STRING_CHECK_COUNTER: equ 16
SRAM_STRING_WRITE_COUNTER: equ 17
SRAM_STRING_LENGTH: equ 36
SAVE_SLOT_REAL_SIZE: equ 4016
SAVE_SLOT_SIZE: equ 8032
SRAM_BYTES_COUNTER: equ 8191

; ---------------------------------------------------------------------------

; enum Vram
VRAM_PLANE_LONGWORD_COUNTER: equ $1FF
VRAM_PLANE_BYTE_SIZE: equ $1000
VRAM_PLANES_ADDRESS_DIFFERENCE: equ $1800
VRAM_ADDRESS_PLANE_A: equ $C000
VRAM_ADDRESS_PLANE_B: equ $E000

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

; enum GameSettings
LONGWORD_GAMEFLAGS_INITVALUE: equ 0
LONGWORD_DEALS_INITVALUE: equ 0
LONGWORD_DEALS_COUNTER: equ $F
LONGWORD_CARAVAN_COUNTER: equ $F
LONGWORD_GAMEFLAGS_COUNTER: equ $1F
LONGWORD_SPELLS_INITVALUE: equ $3F3F3F3F
LONGWORD_CARAVAN_INITVALUE: equ $7F7F7F7F

; ---------------------------------------------------------------------------

; enum GameStartValues
GAMESTART_MAP: equ 3
GAMESTART_SAVEPOINT_Y: equ 3
GAMESTART_FACING: equ 3
GAMESTART_SAVEPOINT_X: equ 56
GAMESTART_GOLD: equ 60

; ---------------------------------------------------------------------------

; enum SoundDriverProperties
SOUND_DRIVER_BYTE_SIZE: equ 8064