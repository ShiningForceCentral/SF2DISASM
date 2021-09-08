
; ASM FILE data\stats\enemies\enemydefs.asm :
; 0x1B1A66..0x1B30EE : Enemy definitions
tbl_EnemyDefs:  
; Syntax        unknownByte    ?
;               spellPower     [SPELLPOWER_]REGULAR *or* [SPELLPOWER_]ENHANCED
;               level          0-255
;               maxHp          0-32767
;               maxMp          0-255
;               baseAtt        0-255
;               baseDef        0-255
;               baseAgi        0-127 + 128 for second turn
;               baseMov        0-255 (game slows down at around 15)
;               baseResistance [RESISTANCE_]bitfield
;               baseProwess    [PROWESS_]bitfield
;               items &
;                   [ITEM_]enum[|EQUIPPED], &
;                   [ITEM_]enum[|EQUIPPED], &
;                   [ITEM_]enum[|EQUIPPED], &
;                   [ITEM_]enum[|EQUIPPED]
;               spells &
;                   [SPELL_]enum[|level], &
;                   [SPELL_]enum[|level], &
;                   [SPELL_]enum[|level], &
;                   [SPELL_]enum[|level]
;               initialStatus  [STATUSEFFECT_]bitfield
;               moveType       [MOVETYPE_UPPER]enum
;               unknownWord    ?
;
;        level: LV1 = 0 (default when omitted)
;               LV2 = 64
;               LV3 = 128
;               LV4 = 192
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                unknownByte 0           ; 0: OOZE
                spellPower REGULAR
                level    0
                maxHp    9
                maxMp    0
                baseAtt  9
                baseDef  6
                baseAgi  5
                baseMov  4
                baseResistance ICE_MAJOR|FIRE_WEAKNESS
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 1           ; 1: HUGE RAT
                spellPower REGULAR
                level    0
                maxHp    10
                maxMp    0
                baseAtt  10
                baseDef  8
                baseAgi  7
                baseMov  6
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      STEALTH
                unknownWord   8224
                    
                unknownByte 2           ; 2: GALAM SOLDIER
                spellPower REGULAR
                level    2
                maxHp    11
                maxMp    0
                baseAtt  8
                baseDef  10
                baseAgi  8
                baseMov  6
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    SHORT_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 3           ; 3: GALAM KNIGHT
                spellPower REGULAR
                level    3
                maxHp    16
                maxMp    0
                baseAtt  9
                baseDef  11
                baseAgi  12
                baseMov  7
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    SHORT_SPEAR|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      CENTAUR
                unknownWord   8224
                    
                unknownByte 4           ; 4: GOBLIN
                spellPower REGULAR
                level    6
                maxHp    18
                maxMp    0
                baseAtt  14
                baseDef  13
                baseAgi  13
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    SHORT_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 5           ; 5: GREEN OOZE
                spellPower REGULAR
                level    5
                maxHp    17
                maxMp    0
                baseAtt  18
                baseDef  12
                baseAgi  12
                baseMov  4
                baseResistance ICE_MAJOR|FIRE_WEAKNESS
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 6           ; 6: DARK DWARF
                spellPower REGULAR
                level    7
                maxHp    21
                maxMp    0
                baseAtt  18
                baseDef  17
                baseAgi  18
                baseMov  4
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    SHORT_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 7           ; 7: HOBGOBLIN
                spellPower REGULAR
                level    9
                maxHp    21
                maxMp    0
                baseAtt  10
                baseDef  19
                baseAgi  19
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    MIDDLE_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 8           ; 8: ZOMBIE
                spellPower REGULAR
                level    11
                maxHp    27
                maxMp    0
                baseAtt  26
                baseDef  20
                baseAgi  18
                baseMov  5
                baseResistance WIND_WEAKNESS|ICE_MAJOR|FIRE_WEAKNESS|STATUS_IMMUNITY
                baseProwess    CRITICAL_POISON|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 9           ; 9: GOLEM
                spellPower REGULAR
                level    12
                maxHp    24
                maxMp    0
                baseAtt  28
                baseDef  24
                baseAgi  19
                baseMov  4
                baseResistance LIGHTNING_MINOR|ICE_MAJOR|FIRE_WEAKNESS|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 10          ; 10: KRAKEN LEG
                spellPower REGULAR
                level    14
                maxHp    24
                maxMp    0
                baseAtt  31
                baseDef  26
                baseAgi  19
                baseMov  6
                baseResistance LIGHTNING_WEAKNESS|ICE_WEAKNESS|FIRE_MINOR
                baseProwess    CRITICAL150_1IN4|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      AQUATIC
                unknownWord   8224
                    
                unknownByte 11          ; 11: SOULSOWER
                spellPower REGULAR
                level    16
                maxHp    27
                maxMp    0
                baseAtt  35
                baseDef  32
                baseAgi  25
                baseMov  4
                baseResistance LIGHTNING_WEAKNESS
                baseProwess    CRITICAL_STUN|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 12          ; 12: ORC
                spellPower REGULAR
                level    17
                maxHp    30
                maxMp    0
                baseAtt  22
                baseDef  37
                baseAgi  27
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    STEEL_LANCE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 13          ; 13: PAWN
                spellPower ENHANCED
                level    19
                maxHp    36
                maxMp    0
                baseAtt  26
                baseDef  37
                baseAgi  25
                baseMov  6
                baseResistance STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    BATTLE_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 14          ; 14: KNIGHT
                spellPower ENHANCED
                level    20
                maxHp    48
                maxMp    0
                baseAtt  25
                baseDef  34
                baseAgi  29
                baseMov  7
                baseResistance STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN4|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    POWER_SPEAR|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 15          ; 15: RAT
                spellPower REGULAR
                level    22
                maxHp    41
                maxMp    0
                baseAtt  45
                baseDef  32
                baseAgi  30
                baseMov  6
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      STEALTH
                unknownWord   8224
                    
                unknownByte 16          ; 16: BUBBLING OOZE
                spellPower REGULAR
                level    21
                maxHp    32
                maxMp    0
                baseAtt  38
                baseDef  35
                baseAgi  26
                baseMov  4
                baseResistance ICE_MAJOR|FIRE_WEAKNESS
                baseProwess    CRITICAL_SILENCE|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    AQUA|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 17          ; 17: SKELETON
                spellPower ENHANCED
                level    21
                maxHp    30
                maxMp    0
                baseAtt  26
                baseDef  40
                baseAgi  30
                baseMov  6
                baseResistance WIND_WEAKNESS|LIGHTNING_MINOR|ICE_MAJOR|FIRE_WEAKNESS|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    BROAD_SWORD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 18          ; 18: DARK SOLDIER
                spellPower ENHANCED
                level    23
                maxHp    35
                maxMp    17
                baseAtt  31
                baseDef  46
                baseAgi  34
                baseMov  4
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    LARGE_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    ATTACK, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8192
                    
                unknownByte 19          ; 19: LIZARDMAN
                spellPower ENHANCED
                level    24
                maxHp    40
                maxMp    0
                baseAtt  34
                baseDef  45
                baseAgi  38
                baseMov  6
                baseResistance ICE_WEAKNESS
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    LARGE_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8192
                    
                unknownByte 20          ; 20: WORM
                spellPower ENHANCED
                level    25
                maxHp    45
                maxMp    0
                baseAtt  60
                baseDef  40
                baseAgi  34
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL_POISON|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      STEALTH
                unknownWord   8192
                    
                unknownByte 21          ; 21: DARK KNIGHT
                spellPower ENHANCED
                level    27
                maxHp    50
                maxMp    0
                baseAtt  36
                baseDef  48
                baseAgi  40
                baseMov  7
                baseResistance NONE
                baseProwess    CRITICAL150_1IN4|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    CHROME_LANCE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      CENTAUR
                unknownWord   8192
                    
                unknownByte 22          ; 22: ORC LORD
                spellPower ENHANCED
                level    27
                maxHp    46
                maxMp    13
                baseAtt  40
                baseDef  44
                baseAgi  37
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    HEAVY_LANCE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    DISPEL, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 23          ; 23: DEVIL SOLDIER
                spellPower ENHANCED
                level    29
                maxHp    60
                maxMp    16
                baseAtt  45
                baseDef  48
                baseAgi  43
                baseMov  6
                baseResistance STATUS_MINOR
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    GREAT_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BOOST|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 24          ; 24: CERBERUS
                spellPower ENHANCED
                level    30
                maxHp    51
                maxMp    0
                baseAtt  70
                baseDef  44
                baseAgi  45
                baseMov  6
                baseResistance ICE_WEAKNESS|FIRE_MAJOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FLAME, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      STEALTH
                unknownWord   8224
                    
                unknownByte 25          ; 25: MUD MAN
                spellPower ENHANCED
                level    31
                maxHp    55
                maxMp    0
                baseAtt  76
                baseDef  51
                baseAgi  41
                baseMov  4
                baseResistance LIGHTNING_MINOR|ICE_MAJOR|FIRE_WEAKNESS|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 26          ; 26: DRAGONEWT
                spellPower ENHANCED
                level    32
                maxHp    60
                maxMp    0
                baseAtt  44
                baseDef  42
                baseAgi  46
                baseMov  6
                baseResistance NONE
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    HEAT_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 27          ; 27: PURPLE WORM
                spellPower ENHANCED
                level    32
                maxHp    58
                maxMp    0
                baseAtt  78
                baseDef  46
                baseAgi  43
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL_POISON|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      STEALTH
                unknownWord   8224
                    
                unknownByte 28          ; 28: EXECUTIONER
                spellPower ENHANCED
                level    33
                maxHp    64
                maxMp    0
                baseAtt  46
                baseDef  46
                baseAgi  45
                baseMov  6
                baseResistance WIND_MINOR|LIGHTNING_MINOR|STATUS_MINOR
                baseProwess    CRITICAL_SILENCE|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    BATTLE_SWORD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8192
                    
                unknownByte 29          ; 29: HELL HOUND
                spellPower ENHANCED
                level    35
                maxHp    62
                maxMp    0
                baseAtt  84
                baseDef  49
                baseAgi  50
                baseMov  6
                baseResistance ICE_WEAKNESS|FIRE_MAJOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FLAME|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      STEALTH
                unknownWord   8192
                    
                unknownByte 30          ; 30: MINOTAUR
                spellPower ENHANCED
                level    35
                maxHp    58
                maxMp    0
                baseAtt  51
                baseDef  51
                baseAgi  44
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    ATLAS_AXE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8192
                    
                unknownByte 31          ; 31: CYCLOPS
                spellPower ENHANCED
                level    36
                maxHp    64
                maxMp    0
                baseAtt  88
                baseDef  51
                baseAgi  46
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN4|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8192
                    
                unknownByte 32          ; 32: BURST ROCK
                spellPower ENHANCED
                level    38
                maxHp    45
                maxMp    0
                baseAtt  0
                baseDef  60
                baseAgi  43
                baseMov  4
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8224
                    
                unknownByte 33          ; 33: HYDRA
                spellPower ENHANCED
                level    39
                maxHp    70
                maxMp    0
                baseAtt  96
                baseDef  62
                baseAgi  50
                baseMov  4
                baseResistance ICE_WEAKNESS
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN8|COUNTER_1IN8
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      STEALTH
                unknownWord   8224
                    
                unknownByte 34          ; 34: CHAOS WARRIOR
                spellPower ENHANCED
                level    40
                maxHp    76
                maxMp    23
                baseAtt  92
                baseDef  50
                baseAgi  54
                baseMov  5
                baseResistance STATUS_MAJOR
                baseProwess    CRITICAL_STUN|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    ATTACK, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8192
                    
                unknownByte 35          ; 35: REAPER
                spellPower ENHANCED
                level    41
                maxHp    82
                maxMp    31
                baseAtt  60
                baseDef  49
                baseAgi  57
                baseMov  6
                baseResistance STATUS_MAJOR
                baseProwess    CRITICAL_MUDDLE|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    BATTLE_SWORD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    MUDDLE|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8192
                    
                unknownByte 36          ; 36: EVIL BEAST
                spellPower ENHANCED
                level    42
                maxHp    84
                maxMp    0
                baseAtt  98
                baseDef  51
                baseAgi  60
                baseMov  6
                baseResistance NONE
                baseProwess    CRITICAL_SLEEP|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8192
                    
                unknownByte 37          ; 37: PYROHYDRA
                spellPower ENHANCED
                level    44
                maxHp    80
                maxMp    0
                baseAtt  101
                baseDef  53
                baseAgi  55
                baseMov  4
                baseResistance ICE_WEAKNESS|FIRE_MAJOR
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN8|COUNTER_1IN8
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FLAME|LV3, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      STEALTH
                unknownWord   8192
                    
                unknownByte 38          ; 38: ZEON GUARD
                spellPower ENHANCED
                level    45
                maxHp    130
                maxMp    150
                baseAtt  109
                baseDef  54
                baseAgi  64
                baseMov  5
                baseResistance STATUS_MAJOR
                baseProwess    CRITICAL_SLOW|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    DEMON, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   8192
                    
                unknownByte 39          ; 39: GIZMO
                spellPower REGULAR
                level    0
                maxHp    5
                maxMp    0
                baseAtt  7
                baseDef  5
                baseAgi  5
                baseMov  5
                baseResistance WIND_WEAKNESS|ICE_MAJOR|FIRE_WEAKNESS|STATUS_MINOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HOVERING
                unknownWord   8192
                    
                unknownByte 40          ; 40: HUGE BAT
                spellPower REGULAR
                level    0
                maxHp    11
                maxMp    0
                baseAtt  12
                baseDef  8
                baseAgi  8
                baseMov  6
                baseResistance WIND_WEAKNESS
                baseProwess    CRITICAL_SLEEP|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8192
                    
                unknownByte 41          ; 41: VAMPIRE BAT
                spellPower REGULAR
                level    7
                maxHp    20
                maxMp    8
                baseAtt  21
                baseDef  16
                baseAgi  16
                baseMov  6
                baseResistance NONE
                baseProwess    CRITICAL_POISON|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BLAZE|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8192
                    
                unknownByte 42          ; 42: EVIL CLOUD
                spellPower REGULAR
                level    10
                maxHp    22
                maxMp    0
                baseAtt  24
                baseDef  18
                baseAgi  17
                baseMov  5
                baseResistance WIND_WEAKNESS|ICE_MAJOR|FIRE_WEAKNESS|STATUS_MINOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HOVERING
                unknownWord   8192
                    
                unknownByte 43          ; 43: GARGOYLE
                spellPower REGULAR
                level    15
                maxHp    29
                maxMp    0
                baseAtt  31
                baseDef  23
                baseAgi  21
                baseMov  6
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8240
                    
                unknownByte 44          ; 44: HARPY
                spellPower REGULAR
                level    17
                maxHp    32
                maxMp    10
                baseAtt  39
                baseDef  38
                baseAgi  29
                baseMov  7
                baseResistance WIND_WEAKNESS|FIRE_WEAKNESS
                baseProwess    CRITICAL_POISON|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    DISPEL, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8240
                    
                unknownByte 45          ; 45: LESSER DEMON
                spellPower ENHANCED
                level    22
                maxHp    40
                maxMp    21
                baseAtt  49
                baseDef  37
                baseAgi  32
                baseMov  6
                baseResistance STATUS_MINOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BLAZE|LV3, &
                    BOOST|LV2, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8240
                    
                unknownByte 46          ; 46: WYVERN
                spellPower ENHANCED
                level    26
                maxHp    46
                maxMp    0
                baseAtt  58
                baseDef  39
                baseAgi  36
                baseMov  7
                baseResistance ICE_WEAKNESS|FIRE_MAJOR
                baseProwess    CRITICAL_POISON|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FLAME, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8240
                    
                unknownByte 47          ; 47: HARPY QUEEN
                spellPower ENHANCED
                level    27
                maxHp    53
                maxMp    20
                baseAtt  65
                baseDef  39
                baseAgi  43
                baseMov  7
                baseResistance WIND_WEAKNESS|FIRE_WEAKNESS
                baseProwess    CRITICAL_SILENCE|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FREEZE|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8208
                    
                unknownByte 48          ; 48: PEGASUS KNIGHT
                spellPower ENHANCED
                level    30
                maxHp    65
                maxMp    0
                baseAtt  40
                baseDef  37
                baseAgi  47
                baseMov  7
                baseResistance STATUS_MINOR
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    CHROME_LANCE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8208
                    
                unknownByte 49          ; 49: GRIFFIN
                spellPower ENHANCED
                level    32
                maxHp    60
                maxMp    0
                baseAtt  77
                baseDef  45
                baseAgi  48
                baseMov  7
                baseResistance WIND_WEAKNESS|LIGHTNING_WEAKNESS|FIRE_WEAKNESS
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8208
                    
                unknownByte 50          ; 50: MIST DEMON
                spellPower ENHANCED
                level    36
                maxHp    68
                maxMp    28
                baseAtt  80
                baseDef  41
                baseAgi  51
                baseMov  6
                baseResistance WIND_WEAKNESS|ICE_MAJOR|STATUS_MINOR
                baseProwess    CRITICAL_SILENCE|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    MUDDLE|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HOVERING
                unknownWord   8208
                    
                unknownByte 51          ; 51: WHITE DRAGON
                spellPower ENHANCED
                level    38
                maxHp    66
                maxMp    0
                baseAtt  85
                baseDef  50
                baseAgi  53
                baseMov  6
                baseResistance ICE_MAJOR|FIRE_WEAKNESS
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    SNOW, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8208
                    
                unknownByte 52          ; 52: DEMON
                spellPower ENHANCED
                level    40
                maxHp    75
                maxMp    38
                baseAtt  90
                baseDef  50
                baseAgi  55
                baseMov  6
                baseResistance LIGHTNING_WEAKNESS|FIRE_MINOR|STATUS_MAJOR
                baseProwess    CRITICAL_MAGIC_DRAIN|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BOLT|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8208
                    
                unknownByte 53          ; 53: CHAOS DRAGON
                spellPower ENHANCED
                level    41
                maxHp    83
                maxMp    0
                baseAtt  93
                baseDef  48
                baseAgi  57
                baseMov  6
                baseResistance LIGHTNING_WEAKNESS
                baseProwess    CRITICAL150_1IN4|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    SNOW|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8208
                    
                unknownByte 54          ; 54: DEVIL GRIFFIN
                spellPower ENHANCED
                level    42
                maxHp    89
                maxMp    0
                baseAtt  96
                baseDef  47
                baseAgi  59
                baseMov  7
                baseResistance WIND_WEAKNESS|ICE_WEAKNESS|FIRE_MAJOR|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN16|COUNTER_1IN8
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FLAME|LV3, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8208
                    
                unknownByte 55          ; 55: ARCH DEMON
                spellPower ENHANCED
                level    44
                maxHp    99
                maxMp    65
                baseAtt  99
                baseDef  46
                baseAgi  61
                baseMov  6
                baseResistance LIGHTNING_WEAKNESS|FIRE_MINOR|STATUS_MAJOR
                baseProwess    CRITICAL_SLOW|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BOLT|LV3, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8208
                    
                unknownByte 56          ; 56: GALAM ARCHER
                spellPower REGULAR
                level    3
                maxHp    15
                maxMp    0
                baseAtt  7
                baseDef  10
                baseAgi  10
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    WOODEN_ARROW|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      ARCHER
                unknownWord   8208
                    
                unknownByte 57          ; 57: HUNTER GOBLIN
                spellPower REGULAR
                level    7
                maxHp    24
                maxMp    0
                baseAtt  8
                baseDef  12
                baseAgi  14
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    IRON_ARROW|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      STEALTH_ARCHER
                unknownWord   8208
                    
                unknownByte 58          ; 58: DEATH ARCHER
                spellPower REGULAR
                level    10
                maxHp    27
                maxMp    0
                baseAtt  13
                baseDef  19
                baseAgi  20
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    IRON_ARROW|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      ARCHER
                unknownWord   8208
                    
                unknownByte 59          ; 59: KRAKEN ARM
                spellPower REGULAR
                level    16
                maxHp    30
                maxMp    0
                baseAtt  34
                baseDef  28
                baseAgi  22
                baseMov  6
                baseResistance NONE
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      AQUATIC
                unknownWord   8208
                    
                unknownByte 60          ; 60: ARROW LAUNCHER
                spellPower REGULAR
                level    17
                maxHp    33
                maxMp    0
                baseAtt  15
                baseDef  24
                baseAgi  23
                baseMov  4
                baseResistance LIGHTNING_WEAKNESS|STATUS_MINOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    STEEL_ARROW|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      BRASS_GUNNER
                unknownWord   8208
                    
                unknownByte 61          ; 61: ROOK
                spellPower REGULAR
                level    19
                maxHp    40
                maxMp    0
                baseAtt  22
                baseDef  31
                baseAgi  27
                baseMov  4
                baseResistance LIGHTNING_WEAKNESS|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN16|COUNTER_1IN32
                items &
                    ROBIN_ARROW|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      BRASS_GUNNER
                unknownWord   8208
                    
                unknownByte 62          ; 62: DARK SNIPER
                spellPower ENHANCED
                level    24
                maxHp    38
                maxMp    0
                baseAtt  11
                baseDef  37
                baseAgi  35
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    HYPER_CANNON|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      STEALTH_ARCHER
                unknownWord   8208
                    
                unknownByte 63          ; 63: BOW MASTER
                spellPower ENHANCED
                level    30
                maxHp    46
                maxMp    0
                baseAtt  50
                baseDef  53
                baseAgi  40
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    ASSAULT_SHELL|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      ARCHER
                unknownWord   8208
                    
                unknownByte 64          ; 64: BOW RIDER
                spellPower ENHANCED
                level    33
                maxHp    61
                maxMp    0
                baseAtt  44
                baseDef  55
                baseAgi  44
                baseMov  7
                baseResistance NONE
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    HYPER_CANNON|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      CENTAUR_ARCHER
                unknownWord   8208
                    
                unknownByte 65          ; 65: DARK GUNNER
                spellPower ENHANCED
                level    38
                maxHp    60
                maxMp    0
                baseAtt  48
                baseDef  56
                baseAgi  45
                baseMov  4
                baseResistance LIGHTNING_WEAKNESS|STATUS_MAJOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN16|COUNTER_1IN32
                items &
                    BUSTER_SHOT|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      BRASS_GUNNER
                unknownWord   8208
                    
                unknownByte 66          ; 66: HORSEMAN
                spellPower ENHANCED
                level    41
                maxHp    67
                maxMp    0
                baseAtt  59
                baseDef  57
                baseAgi  55
                baseMov  7
                baseResistance NONE
                baseProwess    CRITICAL150_1IN8|DOUBLE_1IN16|COUNTER_1IN32
                items &
                    BUSTER_SHOT|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      CENTAUR_ARCHER
                unknownWord   8208
                    
                unknownByte 67          ; 67: GALAM MAGE
                spellPower REGULAR
                level    3
                maxHp    14
                maxMp    5
                baseAtt  8
                baseDef  9
                baseAgi  11
                baseMov  5
                baseResistance FIRE_MINOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    SHORT_ROD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BLAZE, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   8208
                    
                unknownByte 68          ; 68: WITCH
                spellPower REGULAR
                level    7
                maxHp    21
                maxMp    10
                baseAtt  9
                baseDef  12
                baseAgi  15
                baseMov  6
                baseResistance ICE_MINOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    BRONZE_ROD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FREEZE, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   8208
                    
                unknownByte 69          ; 69: MASTER MAGE
                spellPower REGULAR
                level    14
                maxHp    28
                maxMp    14
                baseAtt  11
                baseDef  18
                baseAgi  22
                baseMov  5
                baseResistance FIRE_MINOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    IRON_ROD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BLAZE|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   8208
                    
                unknownByte 70          ; 70: DARK MADAM
                spellPower REGULAR
                level    17
                maxHp    29
                maxMp    17
                baseAtt  19
                baseDef  31
                baseAgi  29
                baseMov  6
                baseResistance ICE_MINOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    POWER_STICK|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FREEZE|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   8208
                    
                unknownByte 71          ; 71: QUEEN
                spellPower ENHANCED
                level    20
                maxHp    30
                maxMp    26
                baseAtt  25
                baseDef  36
                baseAgi  35
                baseMov  6
                baseResistance ICE_MINOR|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    POWER_STICK|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FREEZE|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   8208
                    
                unknownByte 72          ; 72: WIZARD
                spellPower ENHANCED
                level    26
                maxHp    37
                maxMp    37
                baseAtt  32
                baseDef  40
                baseAgi  44
                baseMov  5
                baseResistance FIRE_MINOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    FLAIL|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BLAZE|LV3, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   8208
                    
                unknownByte 73          ; 73: NECROMANCER
                spellPower ENHANCED
                level    30
                maxHp    47
                maxMp    42
                baseAtt  45
                baseDef  44
                baseAgi  51
                baseMov  6
                baseResistance LIGHTNING_MINOR|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    FLAIL|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FREEZE|LV3, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   8208
                    
                unknownByte 74          ; 74: CHAOS WIZARD
                spellPower ENHANCED
                level    36
                maxHp    53
                maxMp    49
                baseAtt  47
                baseDef  48
                baseAgi  59
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    GREAT_ROD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BLAZE|LV4, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   8208
                    
                unknownByte 75          ; 75: DEMON MASTER
                spellPower ENHANCED
                level    42
                maxHp    73
                maxMp    68
                baseAtt  48
                baseDef  50
                baseAgi  65
                baseMov  6
                baseResistance LIGHTNING_MINOR|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    MYSTERY_STAFF|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FREEZE|LV4, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   8192
                    
                unknownByte 76          ; 76: DARK CLERIC
                spellPower REGULAR
                level    3
                maxHp    15
                maxMp    7
                baseAtt  11
                baseDef  11
                baseAgi  13
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    SHORT_ROD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    HEAL, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HEALER
                unknownWord   12288
                    
                unknownByte 77          ; 77: DEATH MONK
                spellPower REGULAR
                level    8
                maxHp    23
                maxMp    13
                baseAtt  22
                baseDef  14
                baseAgi  18
                baseMov  6
                baseResistance NONE
                baseProwess    CRITICAL150_1IN4|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    HEAL|LV2, &
                    BLAST, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HEALER
                unknownWord   12288
                    
                unknownByte 78          ; 78: BLACK MONK
                spellPower REGULAR
                level    14
                maxHp    30
                maxMp    19
                baseAtt  27
                baseDef  18
                baseAgi  21
                baseMov  6
                baseResistance NONE
                baseProwess    CRITICAL150_1IN4|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    HEAL|LV2, &
                    BLAST, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HEALER
                unknownWord   12288
                    
                unknownByte 79          ; 79: HIGH PRIEST
                spellPower REGULAR
                level    17
                maxHp    30
                maxMp    29
                baseAtt  20
                baseDef  31
                baseAgi  23
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    POWER_STICK|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    HEAL|LV3, &
                    BLAST|LV2, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HEALER
                unknownWord   12288
                    
                unknownByte 80          ; 80: EVIL BISHOP
                spellPower ENHANCED
                level    19
                maxHp    33
                maxMp    36
                baseAtt  26
                baseDef  37
                baseAgi  25
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    POWER_STICK|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    HEAL|LV3, &
                    BLAST|LV2, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HEALER
                unknownWord   12288
                    
                unknownByte 81          ; 81: DARK BISHOP
                spellPower ENHANCED
                level    23
                maxHp    39
                maxMp    38
                baseAtt  28
                baseDef  38
                baseAgi  27
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    FLAIL|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    AURA, &
                    BLAST|LV3, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HEALER
                unknownWord   12288
                    
                unknownByte 0           ; 82: MASTER MONK
                spellPower ENHANCED
                level    28
                maxHp    47
                maxMp    39
                baseAtt  22
                baseDef  45
                baseAgi  31
                baseMov  6
                baseResistance NONE
                baseProwess    CRITICAL125_1IN4|DOUBLE_1IN8|COUNTER_1IN16
                items &
                    BRASS_KNUCKLES|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    HEAL|LV4, &
                    DISPEL, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HEALER
                unknownWord   12288
                    
                unknownByte 0           ; 83: SHAMAN
                spellPower ENHANCED
                level    32
                maxHp    56
                maxMp    46
                baseAtt  45
                baseDef  42
                baseAgi  40
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL_MAGIC_DRAIN|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    WISH_STAFF|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    AURA|LV2, &
                    BLAST|LV3, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HEALER
                unknownWord   12288
                    
                unknownByte 0           ; 84: EVIL BISHOP
                spellPower ENHANCED
                level    38
                maxHp    64
                maxMp    51
                baseAtt  54
                baseDef  48
                baseAgi  46
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    GREAT_ROD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    AURA|LV2, &
                    BLAST|LV3, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HEALER
                unknownWord   12288
                    
                unknownByte 0           ; 85: BLUE SHAMAN
                spellPower ENHANCED
                level    42
                maxHp    72
                maxMp    60
                baseAtt  64
                baseDef  54
                baseAgi  51
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL_SILENCE|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    HOLY_STAFF|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    AURA|LV3, &
                    BLAST|LV4, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HEALER
                unknownWord   12288
                    
                unknownByte 0           ; 86: DARK SMOKE
                spellPower REGULAR
                level    7
                maxHp    18
                maxMp    20
                baseAtt  18
                baseDef  13
                baseAgi  141
                baseMov  6
                baseResistance WIND_WEAKNESS|ICE_MAJOR|FIRE_WEAKNESS|STATUS_MAJOR
                baseProwess    CRITICAL_SILENCE|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    DISPEL, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HOVERING
                unknownWord   0
                    
                unknownByte 0           ; 87: KRAKEN HEAD
                spellPower REGULAR
                level    18
                maxHp    35
                maxMp    0
                baseAtt  40
                baseDef  29
                baseAgi  153
                baseMov  5
                baseResistance LIGHTNING_WEAKNESS|ICE_WEAKNESS|FIRE_MINOR|STATUS_MAJOR
                baseProwess    CRITICAL150_1IN4|DOUBLE_1IN8|COUNTER_1IN8
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    AQUA, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      AQUATIC
                unknownWord   4096
                    
                unknownByte 0           ; 88: TAROS
                spellPower REGULAR
                level    20
                maxHp    49
                maxMp    0
                baseAtt  9
                baseDef  32
                baseAgi  151
                baseMov  0
                baseResistance WIND_MAJOR|LIGHTNING_MAJOR|ICE_MAJOR|FIRE_MAJOR|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN4|DOUBLE_1IN16|COUNTER_1IN8
                items &
                    TAROS_SWORD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   4096
                    
                unknownByte 0           ; 89: KING
                spellPower ENHANCED
                level    24
                maxHp    55
                maxMp    28
                baseAtt  29
                baseDef  40
                baseAgi  161
                baseMov  6
                baseResistance WIND_MINOR|LIGHTNING_MINOR|ICE_MINOR|FIRE_MINOR|STATUS_IMMUNITY
                baseProwess    CRITICAL125_1IN4|DOUBLE_1IN8|COUNTER_1IN16
                items &
                    FLAIL|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BLAZE|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   4096
                    
                unknownByte 0           ; 90: WILLARD
                spellPower ENHANCED
                level    25
                maxHp    50
                maxMp    0
                baseAtt  50
                baseDef  36
                baseAgi  165
                baseMov  6
                baseResistance STATUS_MAJOR
                baseProwess    CRITICAL150_1IN4|DOUBLE_1IN16|COUNTER_1IN16
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      STEALTH
                unknownWord   0
                    
                unknownByte 0           ; 91: ZALBARD
                spellPower ENHANCED
                level    40
                maxHp    80
                maxMp    65
                baseAtt  73
                baseDef  50
                baseAgi  180
                baseMov  5
                baseResistance WIND_MINOR|LIGHTNING_MINOR|FIRE_MAJOR|STATUS_IMMUNITY
                baseProwess    CRITICAL125_1IN4|DOUBLE_1IN8|COUNTER_1IN4
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BOLT|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   4096
                    
                unknownByte 0           ; 92: CAMEELA
                spellPower ENHANCED
                level    50
                maxHp    99
                maxMp    0
                baseAtt  42
                baseDef  52
                baseAgi  186
                baseMov  6
                baseResistance WIND_MINOR|LIGHTNING_MINOR|ICE_MINOR|FIRE_MINOR|STATUS_IMMUNITY
                baseProwess    CRITICAL125_1IN4|DOUBLE_1IN4|COUNTER_1IN4
                items &
                    IRON_BALL|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   4096
                    
                unknownByte 0           ; 93: PRISM FLOWER
                spellPower ENHANCED
                level    40
                maxHp    62
                maxMp    0
                baseAtt  16
                baseDef  55
                baseAgi  44
                baseMov  0
                baseResistance ICE_MAJOR|FIRE_WEAKNESS|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    LASER, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   4096
                    
                unknownByte 0           ; 94: RED BARON
                spellPower ENHANCED
                level    60
                maxHp    150
                maxMp    0
                baseAtt  42
                baseDef  59
                baseAgi  190
                baseMov  6
                baseResistance WIND_MINOR|LIGHTNING_MINOR|ICE_MINOR|FIRE_MINOR|STATUS_IMMUNITY
                baseProwess    CRITICAL125_1IN4|DOUBLE_1IN4|COUNTER_1IN4
                items &
                    DARK_SWORD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   4096
                    
                unknownByte 0           ; 95: GESHP
                spellPower ENHANCED
                level    70
                maxHp    180
                maxMp    120
                baseAtt  78
                baseDef  51
                baseAgi  191
                baseMov  6
                baseResistance WIND_MAJOR|LIGHTNING_MAJOR|ICE_MAJOR|FIRE_MAJOR|STATUS_IMMUNITY
                baseProwess    CRITICAL125_1IN4|DOUBLE_1IN8|COUNTER_1IN8
                items &
                    FLAIL|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FREEZE|LV4, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   4096
                    
                unknownByte 0           ; 96: ODD EYE
                spellPower ENHANCED
                level    80
                maxHp    200
                maxMp    160
                baseAtt  64
                baseDef  54
                baseAgi  195
                baseMov  6
                baseResistance WIND_MINOR|LIGHTNING_MINOR|ICE_MINOR|FIRE_MINOR|STATUS_IMMUNITY
                baseProwess    CRITICAL_SLEEP|DOUBLE_1IN8|COUNTER_1IN4
                items &
                    COUNTER_SWORD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    ODDEYE, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   4096
                    
                unknownByte 0           ; 97: GALAM
                spellPower ENHANCED
                level    99
                maxHp    240
                maxMp    180
                baseAtt  49
                baseDef  50
                baseAgi  208
                baseMov  6
                baseResistance WIND_MAJOR|LIGHTNING_MAJOR|ICE_MAJOR|FIRE_MAJOR|STATUS_IMMUNITY
                baseProwess    CRITICAL125_1IN4|DOUBLE_1IN8|COUNTER_1IN4
                items &
                    DEMON_ROD|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    DEMON, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   4096
                    
                unknownByte 0           ; 98: ZEON
                spellPower ENHANCED
                level    99
                maxHp    500
                maxMp    180
                baseAtt  102
                baseDef  50
                baseAgi  203
                baseMov  0
                baseResistance STATUS_IMMUNITY
                baseProwess    CRITICAL125_1IN4|DOUBLE_1IN4|COUNTER_1IN4
                items &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    DEMON|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      REGULAR
                unknownWord   4096
                    
                unknownByte 0           ; 99: JAR
                spellPower ENHANCED
                level    12
                maxHp    59
                maxMp    0
                baseAtt  35
                baseDef  44
                baseAgi  46
                baseMov  7
                baseResistance WIND_MAJOR|LIGHTNING_MAJOR|ICE_MAJOR|FIRE_MAJOR|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    CHROME_LANCE|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    NOTHING, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      FLYING
                unknownWord   8192
                    
                unknownByte 0           ; 100: MASTER MAGE
                spellPower REGULAR
                level    14
                maxHp    28
                maxMp    14
                baseAtt  11
                baseDef  18
                baseAgi  22
                baseMov  5
                baseResistance FIRE_MINOR
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    POWER_STICK|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    BLAZE|LV2, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   8192
                    
                unknownByte 0           ; 101: NECROMANCER
                spellPower ENHANCED
                level    30
                maxHp    47
                maxMp    42
                baseAtt  45
                baseDef  44
                baseAgi  51
                baseMov  6
                baseResistance LIGHTNING_MINOR|STATUS_IMMUNITY
                baseProwess    CRITICAL150_1IN32|DOUBLE_1IN32|COUNTER_1IN16
                items &
                    MAGE_STAFF|EQUIPPED, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                spells &
                    FREEZE|LV3, &
                    NOTHING, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      MAGE
                unknownWord   8192
                    
                unknownByte 0           ; 102: BLUE SHAMAN
                spellPower ENHANCED
                level    42
                maxHp    72
                maxMp    60
                baseAtt  64
                baseDef  54
                baseAgi  51
                baseMov  5
                baseResistance NONE
                baseProwess    CRITICAL_SILENCE|DOUBLE_1IN32|COUNTER_1IN32
                items &
                    HOLY_STAFF|EQUIPPED, &
                    HEALING_RAIN, &
                    NOTHING, &
                    NOTHING
                spells &
                    AURA|LV3, &
                    BLAST|LV4, &
                    NOTHING, &
                    NOTHING
                initialStatus NONE
                moveType      HEALER
                unknownWord   12288
                    
