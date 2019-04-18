
; ASM FILE data\stats\enemies\enemydefs.asm :
; 0x1B1A66..0x1B30EE : Enemy definitions
EnemyDefs:      unknownByte 0           ; OOZE
                spellPower SPELLPOWER_REGULAR
                level 0
                maxHp 9
                maxMp 0
                baseAtk 9
                baseDef 6
                baseAgi 5
                baseMov 4
                baseResistance &
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 1           ; HUGE RAT
                spellPower SPELLPOWER_REGULAR
                level 0
                maxHp 10
                maxMp 0
                baseAtk 10
                baseDef 8
                baseAgi 7
                baseMov 6
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_STEALTH
                unknownWord 8224
                    
                unknownByte 2           ; GALAM SOLDIER
                spellPower SPELLPOWER_REGULAR
                level 2
                maxHp 11
                maxMp 0
                baseAtk 8
                baseDef 10
                baseAgi 8
                baseMov 6
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_SHORT_AXE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 3           ; GALAM KNIGHT
                spellPower SPELLPOWER_REGULAR
                level 3
                maxHp 16
                maxMp 0
                baseAtk 9
                baseDef 11
                baseAgi 12
                baseMov 7
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_SHORT_SPEAR|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_CENTAUR
                unknownWord 8224
                    
                unknownByte 4           ; GOBLIN
                spellPower SPELLPOWER_REGULAR
                level 6
                maxHp 18
                maxMp 0
                baseAtk 14
                baseDef 13
                baseAgi 13
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_SHORT_AXE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 5           ; GREEN OOZE
                spellPower SPELLPOWER_REGULAR
                level 5
                maxHp 17
                maxMp 0
                baseAtk 18
                baseDef 12
                baseAgi 12
                baseMov 4
                baseResistance &
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 6           ; DARK DWARF
                spellPower SPELLPOWER_REGULAR
                level 7
                maxHp 21
                maxMp 0
                baseAtk 18
                baseDef 17
                baseAgi 18
                baseMov 4
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_SHORT_AXE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 7           ; HOBGOBLIN
                spellPower SPELLPOWER_REGULAR
                level 9
                maxHp 21
                maxMp 0
                baseAtk 10
                baseDef 19
                baseAgi 19
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_MIDDLE_AXE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 8           ; ZOMBIE
                spellPower SPELLPOWER_REGULAR
                level 11
                maxHp 27
                maxMp 0
                baseAtk 26
                baseDef 20
                baseAgi 18
                baseMov 5
                baseResistance &
                    WIND_WEAKNESS|&
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL_POISON|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 9           ; GOLEM
                spellPower SPELLPOWER_REGULAR
                level 12
                maxHp 24
                maxMp 0
                baseAtk 28
                baseDef 24
                baseAgi 19
                baseMov 4
                baseResistance &
                    LIGHTNING_RESIST_MINOR|&
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 10          ; KRAKEN LEG
                spellPower SPELLPOWER_REGULAR
                level 14
                maxHp 24
                maxMp 0
                baseAtk 31
                baseDef 26
                baseAgi 19
                baseMov 6
                baseResistance &
                    LIGHTNING_WEAKNESS|&
                    ICE_WEAKNESS|&
                    FIRE_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN4|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_AQUATIC
                unknownWord 8224
                    
                unknownByte 11          ; SOULSOWER
                spellPower SPELLPOWER_REGULAR
                level 16
                maxHp 27
                maxMp 0
                baseAtk 35
                baseDef 32
                baseAgi 25
                baseMov 4
                baseResistance &
                    LIGHTNING_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL_STUN|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 12          ; ORC
                spellPower SPELLPOWER_REGULAR
                level 17
                maxHp 30
                maxMp 0
                baseAtk 22
                baseDef 37
                baseAgi 27
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_STEEL_LANCE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 13          ; PAWN
                spellPower SPELLPOWER_ENHANCED
                level 19
                maxHp 36
                maxMp 0
                baseAtk 26
                baseDef 37
                baseAgi 25
                baseMov 6
                baseResistance &
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_BATTLE_AXE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 14          ; KNIGHT
                spellPower SPELLPOWER_ENHANCED
                level 20
                maxHp 48
                maxMp 0
                baseAtk 25
                baseDef 34
                baseAgi 29
                baseMov 7
                baseResistance &
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN4|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_POWER_SPEAR|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 15          ; RAT
                spellPower SPELLPOWER_REGULAR
                level 22
                maxHp 41
                maxMp 0
                baseAtk 45
                baseDef 32
                baseAgi 30
                baseMov 6
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_STEALTH
                unknownWord 8224
                    
                unknownByte 16          ; BUBBLING OOZE
                spellPower SPELLPOWER_REGULAR
                level 21
                maxHp 32
                maxMp 0
                baseAtk 38
                baseDef 35
                baseAgi 26
                baseMov 4
                baseResistance &
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL_SILENCE|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_AQUA|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 17          ; SKELETON
                spellPower SPELLPOWER_ENHANCED
                level 21
                maxHp 30
                maxMp 0
                baseAtk 26
                baseDef 40
                baseAgi 30
                baseMov 6
                baseResistance &
                    WIND_WEAKNESS|&
                    LIGHTNING_RESIST_MINOR|&
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_BROAD_SWORD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 18          ; DARK SOLDIER
                spellPower SPELLPOWER_ENHANCED
                level 23
                maxHp 35
                maxMp 17
                baseAtk 31
                baseDef 46
                baseAgi 34
                baseMov 4
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_LARGE_AXE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_ATTACK, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8192
                    
                unknownByte 19          ; LIZARDMAN
                spellPower SPELLPOWER_ENHANCED
                level 24
                maxHp 40
                maxMp 0
                baseAtk 34
                baseDef 45
                baseAgi 38
                baseMov 6
                baseResistance &
                    ICE_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_LARGE_AXE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8192
                    
                unknownByte 20          ; WORM
                spellPower SPELLPOWER_ENHANCED
                level 25
                maxHp 45
                maxMp 0
                baseAtk 60
                baseDef 40
                baseAgi 34
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL_POISON|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_STEALTH
                unknownWord 8192
                    
                unknownByte 21          ; DARK KNIGHT
                spellPower SPELLPOWER_ENHANCED
                level 27
                maxHp 50
                maxMp 0
                baseAtk 36
                baseDef 48
                baseAgi 40
                baseMov 7
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN4|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_CHROME_LANCE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_CENTAUR
                unknownWord 8192
                    
                unknownByte 22          ; ORC LORD
                spellPower SPELLPOWER_ENHANCED
                level 27
                maxHp 46
                maxMp 13
                baseAtk 40
                baseDef 44
                baseAgi 37
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_HEAVY_LANCE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_DISPEL, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 23          ; DEVIL SOLDIER
                spellPower SPELLPOWER_ENHANCED
                level 29
                maxHp 60
                maxMp 16
                baseAtk 45
                baseDef 48
                baseAgi 43
                baseMov 6
                baseResistance &
                    STATUS_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_GREAT_AXE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BOOST|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 24          ; CERBERUS
                spellPower SPELLPOWER_ENHANCED
                level 30
                maxHp 51
                maxMp 0
                baseAtk 70
                baseDef 44
                baseAgi 45
                baseMov 6
                baseResistance &
                    ICE_WEAKNESS|&
                    FIRE_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FLAME, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_STEALTH
                unknownWord 8224
                    
                unknownByte 25          ; MUD MAN
                spellPower SPELLPOWER_ENHANCED
                level 31
                maxHp 55
                maxMp 0
                baseAtk 76
                baseDef 51
                baseAgi 41
                baseMov 4
                baseResistance &
                    LIGHTNING_RESIST_MINOR|&
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 26          ; DRAGONEWT
                spellPower SPELLPOWER_ENHANCED
                level 32
                maxHp 60
                maxMp 0
                baseAtk 44
                baseDef 42
                baseAgi 46
                baseMov 6
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_HEAT_AXE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 27          ; PURPLE WORM
                spellPower SPELLPOWER_ENHANCED
                level 32
                maxHp 58
                maxMp 0
                baseAtk 78
                baseDef 46
                baseAgi 43
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL_POISON|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_STEALTH
                unknownWord 8224
                    
                unknownByte 28          ; EXECUTIONER
                spellPower SPELLPOWER_ENHANCED
                level 33
                maxHp 64
                maxMp 0
                baseAtk 46
                baseDef 46
                baseAgi 45
                baseMov 6
                baseResistance &
                    WIND_RESIST_MINOR|&
                    LIGHTNING_RESIST_MINOR|&
                    STATUS_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL_SILENCE|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_BATTLE_SWORD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8192
                    
                unknownByte 29          ; HELL HOUND
                spellPower SPELLPOWER_ENHANCED
                level 35
                maxHp 62
                maxMp 0
                baseAtk 84
                baseDef 49
                baseAgi 50
                baseMov 6
                baseResistance &
                    ICE_WEAKNESS|&
                    FIRE_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FLAME|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_STEALTH
                unknownWord 8192
                    
                unknownByte 30          ; MINOTAUR
                spellPower SPELLPOWER_ENHANCED
                level 35
                maxHp 58
                maxMp 0
                baseAtk 51
                baseDef 51
                baseAgi 44
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_ATLAS_AXE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8192
                    
                unknownByte 31          ; CYCLOPS
                spellPower SPELLPOWER_ENHANCED
                level 36
                maxHp 64
                maxMp 0
                baseAtk 88
                baseDef 51
                baseAgi 46
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN4|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8192
                    
                unknownByte 32          ; BURST ROCK
                spellPower SPELLPOWER_ENHANCED
                level 38
                maxHp 45
                maxMp 0
                baseAtk 0
                baseDef 60
                baseAgi 43
                baseMov 4
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8224
                    
                unknownByte 33          ; HYDRA
                spellPower SPELLPOWER_ENHANCED
                level 39
                maxHp 70
                maxMp 0
                baseAtk 96
                baseDef 62
                baseAgi 50
                baseMov 4
                baseResistance &
                    ICE_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN8|&
                    PROWESS_COUNTER_1IN8
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_STEALTH
                unknownWord 8224
                    
                unknownByte 34          ; CHAOS WARRIOR
                spellPower SPELLPOWER_ENHANCED
                level 40
                maxHp 76
                maxMp 23
                baseAtk 92
                baseDef 50
                baseAgi 54
                baseMov 5
                baseResistance &
                    STATUS_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL_STUN|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_ATTACK, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8192
                    
                unknownByte 35          ; REAPER
                spellPower SPELLPOWER_ENHANCED
                level 41
                maxHp 82
                maxMp 31
                baseAtk 60
                baseDef 49
                baseAgi 57
                baseMov 6
                baseResistance &
                    STATUS_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL_MUDDLE|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_BATTLE_SWORD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_MUDDLE|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8192
                    
                unknownByte 36          ; EVIL BEAST
                spellPower SPELLPOWER_ENHANCED
                level 42
                maxHp 84
                maxMp 0
                baseAtk 98
                baseDef 51
                baseAgi 60
                baseMov 6
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL_SLEEP|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8192
                    
                unknownByte 37          ; PYROHYDRA
                spellPower SPELLPOWER_ENHANCED
                level 44
                maxHp 80
                maxMp 0
                baseAtk 101
                baseDef 53
                baseAgi 55
                baseMov 4
                baseResistance &
                    ICE_WEAKNESS|&
                    FIRE_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN8|&
                    PROWESS_COUNTER_1IN8
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FLAME|SPELL_LV3, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_STEALTH
                unknownWord 8192
                    
                unknownByte 38          ; ZEON GUARD
                spellPower SPELLPOWER_ENHANCED
                level 45
                maxHp 130
                maxMp 150
                baseAtk 109
                baseDef 54
                baseAgi 64
                baseMov 5
                baseResistance &
                    STATUS_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL_SLOW|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_DEMON, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 8192
                    
                unknownByte 39          ; GIZMO
                spellPower SPELLPOWER_REGULAR
                level 0
                maxHp 5
                maxMp 0
                baseAtk 7
                baseDef 5
                baseAgi 5
                baseMov 5
                baseResistance &
                    WIND_WEAKNESS|&
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS|&
                    STATUS_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HOVERING
                unknownWord 8192
                    
                unknownByte 40          ; HUGE BAT
                spellPower SPELLPOWER_REGULAR
                level 0
                maxHp 11
                maxMp 0
                baseAtk 12
                baseDef 8
                baseAgi 8
                baseMov 6
                baseResistance &
                    WIND_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL_SLEEP|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8192
                    
                unknownByte 41          ; VAMPIRE BAT
                spellPower SPELLPOWER_REGULAR
                level 7
                maxHp 20
                maxMp 8
                baseAtk 21
                baseDef 16
                baseAgi 16
                baseMov 6
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL_POISON|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BLAZE|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8192
                    
                unknownByte 42          ; EVIL CLOUD
                spellPower SPELLPOWER_REGULAR
                level 10
                maxHp 22
                maxMp 0
                baseAtk 24
                baseDef 18
                baseAgi 17
                baseMov 5
                baseResistance &
                    WIND_WEAKNESS|&
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS|&
                    STATUS_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HOVERING
                unknownWord 8192
                    
                unknownByte 43          ; GARGOYLE
                spellPower SPELLPOWER_REGULAR
                level 15
                maxHp 29
                maxMp 0
                baseAtk 31
                baseDef 23
                baseAgi 21
                baseMov 6
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8240
                    
                unknownByte 44          ; HARPY
                spellPower SPELLPOWER_REGULAR
                level 17
                maxHp 32
                maxMp 10
                baseAtk 39
                baseDef 38
                baseAgi 29
                baseMov 7
                baseResistance &
                    WIND_WEAKNESS|&
                    FIRE_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL_POISON|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_DISPEL, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8240
                    
                unknownByte 45          ; LESSER DEMON
                spellPower SPELLPOWER_ENHANCED
                level 22
                maxHp 40
                maxMp 21
                baseAtk 49
                baseDef 37
                baseAgi 32
                baseMov 6
                baseResistance &
                    STATUS_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BLAZE|SPELL_LV3, &
                    SPELL_BOOST|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8240
                    
                unknownByte 46          ; WYVERN
                spellPower SPELLPOWER_ENHANCED
                level 26
                maxHp 46
                maxMp 0
                baseAtk 58
                baseDef 39
                baseAgi 36
                baseMov 7
                baseResistance &
                    ICE_WEAKNESS|&
                    FIRE_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL_POISON|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FLAME, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8240
                    
                unknownByte 47          ; HARPY QUEEN
                spellPower SPELLPOWER_ENHANCED
                level 27
                maxHp 53
                maxMp 20
                baseAtk 65
                baseDef 39
                baseAgi 43
                baseMov 7
                baseResistance &
                    WIND_WEAKNESS|&
                    FIRE_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL_SILENCE|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FREEZE|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8208
                    
                unknownByte 48          ; PEGASUS KNIGHT
                spellPower SPELLPOWER_ENHANCED
                level 30
                maxHp 65
                maxMp 0
                baseAtk 40
                baseDef 37
                baseAgi 47
                baseMov 7
                baseResistance &
                    STATUS_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_CHROME_LANCE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8208
                    
                unknownByte 49          ; GRIFFIN
                spellPower SPELLPOWER_ENHANCED
                level 32
                maxHp 60
                maxMp 0
                baseAtk 77
                baseDef 45
                baseAgi 48
                baseMov 7
                baseResistance &
                    WIND_WEAKNESS|&
                    LIGHTNING_WEAKNESS|&
                    FIRE_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8208
                    
                unknownByte 50          ; MIST DEMON
                spellPower SPELLPOWER_ENHANCED
                level 36
                maxHp 68
                maxMp 28
                baseAtk 80
                baseDef 41
                baseAgi 51
                baseMov 6
                baseResistance &
                    WIND_WEAKNESS|&
                    ICE_RESIST_MAJOR|&
                    STATUS_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL_SILENCE|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_MUDDLE|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HOVERING
                unknownWord 8208
                    
                unknownByte 51          ; WHITE DRAGON
                spellPower SPELLPOWER_ENHANCED
                level 38
                maxHp 66
                maxMp 0
                baseAtk 85
                baseDef 50
                baseAgi 53
                baseMov 6
                baseResistance &
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_SNOW, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8208
                    
                unknownByte 52          ; DEMON
                spellPower SPELLPOWER_ENHANCED
                level 40
                maxHp 75
                maxMp 38
                baseAtk 90
                baseDef 50
                baseAgi 55
                baseMov 6
                baseResistance &
                    LIGHTNING_WEAKNESS|&
                    FIRE_RESIST_MINOR|&
                    STATUS_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL_MAGIC_DRAIN|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BOLT|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8208
                    
                unknownByte 53          ; CHAOS DRAGON
                spellPower SPELLPOWER_ENHANCED
                level 41
                maxHp 83
                maxMp 0
                baseAtk 93
                baseDef 48
                baseAgi 57
                baseMov 6
                baseResistance &
                    LIGHTNING_WEAKNESS
                baseProwess &
                    PROWESS_CRITICAL150_1IN4|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_SNOW|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8208
                    
                unknownByte 54          ; DEVIL GRIFFIN
                spellPower SPELLPOWER_ENHANCED
                level 42
                maxHp 89
                maxMp 0
                baseAtk 96
                baseDef 47
                baseAgi 59
                baseMov 7
                baseResistance &
                    WIND_WEAKNESS|&
                    ICE_WEAKNESS|&
                    FIRE_RESIST_MAJOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN8
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FLAME|SPELL_LV3, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8208
                    
                unknownByte 55          ; ARCH DEMON
                spellPower SPELLPOWER_ENHANCED
                level 44
                maxHp 99
                maxMp 65
                baseAtk 99
                baseDef 46
                baseAgi 61
                baseMov 6
                baseResistance &
                    LIGHTNING_WEAKNESS|&
                    FIRE_RESIST_MINOR|&
                    STATUS_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL_SLOW|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BOLT|SPELL_LV3, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8208
                    
                unknownByte 56          ; GALAM ARCHER
                spellPower SPELLPOWER_REGULAR
                level 3
                maxHp 15
                maxMp 0
                baseAtk 7
                baseDef 10
                baseAgi 10
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_WOODEN_ARROW|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_ARCHER
                unknownWord 8208
                    
                unknownByte 57          ; HUNTER GOBLIN
                spellPower SPELLPOWER_REGULAR
                level 7
                maxHp 24
                maxMp 0
                baseAtk 8
                baseDef 12
                baseAgi 14
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_IRON_ARROW|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_STEALTH_ARCHER
                unknownWord 8208
                    
                unknownByte 58          ; DEATH ARCHER
                spellPower SPELLPOWER_REGULAR
                level 10
                maxHp 27
                maxMp 0
                baseAtk 13
                baseDef 19
                baseAgi 20
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_IRON_ARROW|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_ARCHER
                unknownWord 8208
                    
                unknownByte 59          ; KRAKEN ARM
                spellPower SPELLPOWER_REGULAR
                level 16
                maxHp 30
                maxMp 0
                baseAtk 34
                baseDef 28
                baseAgi 22
                baseMov 6
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_AQUATIC
                unknownWord 8208
                    
                unknownByte 60          ; ARROW LAUNCHER
                spellPower SPELLPOWER_REGULAR
                level 17
                maxHp 33
                maxMp 0
                baseAtk 15
                baseDef 24
                baseAgi 23
                baseMov 4
                baseResistance &
                    LIGHTNING_WEAKNESS|&
                    STATUS_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_STEEL_ARROW|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_BRASS_GUNNER
                unknownWord 8208
                    
                unknownByte 61          ; ROOK
                spellPower SPELLPOWER_REGULAR
                level 19
                maxHp 40
                maxMp 0
                baseAtk 22
                baseDef 31
                baseAgi 27
                baseMov 4
                baseResistance &
                    LIGHTNING_WEAKNESS|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_ROBIN_ARROW|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_BRASS_GUNNER
                unknownWord 8208
                    
                unknownByte 62          ; DARK SNIPER
                spellPower SPELLPOWER_ENHANCED
                level 24
                maxHp 38
                maxMp 0
                baseAtk 11
                baseDef 37
                baseAgi 35
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_HYPER_CANNON|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_STEALTH_ARCHER
                unknownWord 8208
                    
                unknownByte 63          ; BOW MASTER
                spellPower SPELLPOWER_ENHANCED
                level 30
                maxHp 46
                maxMp 0
                baseAtk 50
                baseDef 53
                baseAgi 40
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_ASSAULT_SHELL|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_ARCHER
                unknownWord 8208
                    
                unknownByte 64          ; BOW RIDER
                spellPower SPELLPOWER_ENHANCED
                level 33
                maxHp 61
                maxMp 0
                baseAtk 44
                baseDef 55
                baseAgi 44
                baseMov 7
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_HYPER_CANNON|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_CENTAUR_ARCHER
                unknownWord 8208
                    
                unknownByte 65          ; DARK GUNNER
                spellPower SPELLPOWER_ENHANCED
                level 38
                maxHp 60
                maxMp 0
                baseAtk 48
                baseDef 56
                baseAgi 45
                baseMov 4
                baseResistance &
                    LIGHTNING_WEAKNESS|&
                    STATUS_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_BUSTER_SHOT|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_BRASS_GUNNER
                unknownWord 8208
                    
                unknownByte 66          ; HORSEMAN
                spellPower SPELLPOWER_ENHANCED
                level 41
                maxHp 67
                maxMp 0
                baseAtk 59
                baseDef 57
                baseAgi 55
                baseMov 7
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN8|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_BUSTER_SHOT|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_CENTAUR_ARCHER
                unknownWord 8208
                    
                unknownByte 67          ; GALAM MAGE
                spellPower SPELLPOWER_REGULAR
                level 3
                maxHp 14
                maxMp 5
                baseAtk 8
                baseDef 9
                baseAgi 11
                baseMov 5
                baseResistance &
                    FIRE_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_SHORT_ROD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BLAZE, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 8208
                    
                unknownByte 68          ; WITCH
                spellPower SPELLPOWER_REGULAR
                level 7
                maxHp 21
                maxMp 10
                baseAtk 9
                baseDef 12
                baseAgi 15
                baseMov 6
                baseResistance &
                    ICE_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_BRONZE_ROD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FREEZE, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 8208
                    
                unknownByte 69          ; MASTER MAGE
                spellPower SPELLPOWER_REGULAR
                level 14
                maxHp 28
                maxMp 14
                baseAtk 11
                baseDef 18
                baseAgi 22
                baseMov 5
                baseResistance &
                    FIRE_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_IRON_ROD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BLAZE|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 8208
                    
                unknownByte 70          ; DARK MADAM
                spellPower SPELLPOWER_REGULAR
                level 17
                maxHp 29
                maxMp 17
                baseAtk 19
                baseDef 31
                baseAgi 29
                baseMov 6
                baseResistance &
                    ICE_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_POWER_STICK|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FREEZE|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 8208
                    
                unknownByte 71          ; QUEEN
                spellPower SPELLPOWER_ENHANCED
                level 20
                maxHp 30
                maxMp 26
                baseAtk 25
                baseDef 36
                baseAgi 35
                baseMov 6
                baseResistance &
                    ICE_RESIST_MINOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_POWER_STICK|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FREEZE|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 8208
                    
                unknownByte 72          ; WIZARD
                spellPower SPELLPOWER_ENHANCED
                level 26
                maxHp 37
                maxMp 37
                baseAtk 32
                baseDef 40
                baseAgi 44
                baseMov 5
                baseResistance &
                    FIRE_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_FLAIL|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BLAZE|SPELL_LV3, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 8208
                    
                unknownByte 73          ; NECROMANCER
                spellPower SPELLPOWER_ENHANCED
                level 30
                maxHp 47
                maxMp 42
                baseAtk 45
                baseDef 44
                baseAgi 51
                baseMov 6
                baseResistance &
                    LIGHTNING_RESIST_MINOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_FLAIL|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FREEZE|SPELL_LV3, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 8208
                    
                unknownByte 74          ; CHAOS WIZARD
                spellPower SPELLPOWER_ENHANCED
                level 36
                maxHp 53
                maxMp 49
                baseAtk 47
                baseDef 48
                baseAgi 59
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_GREAT_ROD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BLAZE|SPELL_LV4, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 8208
                    
                unknownByte 75          ; DEMON MASTER
                spellPower SPELLPOWER_ENHANCED
                level 42
                maxHp 73
                maxMp 68
                baseAtk 48
                baseDef 50
                baseAgi 65
                baseMov 6
                baseResistance &
                    LIGHTNING_RESIST_MINOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_MYSTERY_STAFF|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FREEZE|SPELL_LV4, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 8192
                    
                unknownByte 76          ; DARK CLERIC
                spellPower SPELLPOWER_REGULAR
                level 3
                maxHp 15
                maxMp 7
                baseAtk 11
                baseDef 11
                baseAgi 13
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_SHORT_ROD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_HEAL, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HEALER
                unknownWord 12288
                    
                unknownByte 77          ; DEATH MONK
                spellPower SPELLPOWER_REGULAR
                level 8
                maxHp 23
                maxMp 13
                baseAtk 22
                baseDef 14
                baseAgi 18
                baseMov 6
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN4|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_HEAL|SPELL_LV2, &
                    SPELL_BLAST, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HEALER
                unknownWord 12288
                    
                unknownByte 78          ; BLACK MONK
                spellPower SPELLPOWER_REGULAR
                level 14
                maxHp 30
                maxMp 19
                baseAtk 27
                baseDef 18
                baseAgi 21
                baseMov 6
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN4|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_HEAL|SPELL_LV2, &
                    SPELL_BLAST, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HEALER
                unknownWord 12288
                    
                unknownByte 79          ; HIGH PRIEST
                spellPower SPELLPOWER_REGULAR
                level 17
                maxHp 30
                maxMp 29
                baseAtk 20
                baseDef 31
                baseAgi 23
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_POWER_STICK|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_HEAL|SPELL_LV3, &
                    SPELL_BLAST|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HEALER
                unknownWord 12288
                    
                unknownByte 80          ; EVIL BISHOP
                spellPower SPELLPOWER_ENHANCED
                level 19
                maxHp 33
                maxMp 36
                baseAtk 26
                baseDef 37
                baseAgi 25
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_POWER_STICK|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_HEAL|SPELL_LV3, &
                    SPELL_BLAST|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HEALER
                unknownWord 12288
                    
                unknownByte 81          ; DARK BISHOP
                spellPower SPELLPOWER_ENHANCED
                level 23
                maxHp 39
                maxMp 38
                baseAtk 28
                baseDef 38
                baseAgi 27
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_FLAIL|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_AURA, &
                    SPELL_BLAST|SPELL_LV3, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HEALER
                unknownWord 12288
                    
                unknownByte 0           ; MASTER MONK
                spellPower SPELLPOWER_ENHANCED
                level 28
                maxHp 47
                maxMp 39
                baseAtk 22
                baseDef 45
                baseAgi 31
                baseMov 6
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL125_1IN4|&
                    PROWESS_DOUBLE_1IN8|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_BRASS_KNUCKLES|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_HEAL|SPELL_LV4, &
                    SPELL_DISPEL, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HEALER
                unknownWord 12288
                    
                unknownByte 0           ; SHAMAN
                spellPower SPELLPOWER_ENHANCED
                level 32
                maxHp 56
                maxMp 46
                baseAtk 45
                baseDef 42
                baseAgi 40
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL_MAGIC_DRAIN|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_WISH_STAFF|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_AURA|SPELL_LV2, &
                    SPELL_BLAST|SPELL_LV3, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HEALER
                unknownWord 12288
                    
                unknownByte 0           ; EVIL BISHOP
                spellPower SPELLPOWER_ENHANCED
                level 38
                maxHp 64
                maxMp 51
                baseAtk 54
                baseDef 48
                baseAgi 46
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_GREAT_ROD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_AURA|SPELL_LV2, &
                    SPELL_BLAST|SPELL_LV3, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HEALER
                unknownWord 12288
                    
                unknownByte 0           ; BLUE SHAMAN
                spellPower SPELLPOWER_ENHANCED
                level 42
                maxHp 72
                maxMp 60
                baseAtk 64
                baseDef 54
                baseAgi 51
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL_SILENCE|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_HOLY_STAFF|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_AURA|SPELL_LV3, &
                    SPELL_BLAST|SPELL_LV4, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HEALER
                unknownWord 12288
                    
                unknownByte 0           ; DARK SMOKE
                spellPower SPELLPOWER_REGULAR
                level 7
                maxHp 18
                maxMp 20
                baseAtk 18
                baseDef 13
                baseAgi 141
                baseMov 6
                baseResistance &
                    WIND_WEAKNESS|&
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS|&
                    STATUS_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL_SILENCE|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_DISPEL, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HOVERING
                unknownWord 0
                    
                unknownByte 0           ; KRAKEN HEAD
                spellPower SPELLPOWER_REGULAR
                level 18
                maxHp 35
                maxMp 0
                baseAtk 40
                baseDef 29
                baseAgi 153
                baseMov 5
                baseResistance &
                    LIGHTNING_WEAKNESS|&
                    ICE_WEAKNESS|&
                    FIRE_RESIST_MINOR|&
                    STATUS_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN4|&
                    PROWESS_DOUBLE_1IN8|&
                    PROWESS_COUNTER_1IN8
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_AQUA, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_AQUATIC
                unknownWord 4096
                    
                unknownByte 0           ; TAROS
                spellPower SPELLPOWER_REGULAR
                level 20
                maxHp 49
                maxMp 0
                baseAtk 9
                baseDef 32
                baseAgi 151
                baseMov 0
                baseResistance &
                    WIND_RESIST_MAJOR|&
                    LIGHTNING_RESIST_MAJOR|&
                    ICE_RESIST_MAJOR|&
                    FIRE_RESIST_MAJOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN4|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN8
                items &
                    ITEM_TAROS_SWORD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 4096
                    
                unknownByte 0           ; KING
                spellPower SPELLPOWER_ENHANCED
                level 24
                maxHp 55
                maxMp 28
                baseAtk 29
                baseDef 40
                baseAgi 161
                baseMov 6
                baseResistance &
                    WIND_RESIST_MINOR|&
                    LIGHTNING_RESIST_MINOR|&
                    ICE_RESIST_MINOR|&
                    FIRE_RESIST_MINOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL125_1IN4|&
                    PROWESS_DOUBLE_1IN8|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_FLAIL|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BLAZE|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 4096
                    
                unknownByte 0           ; WILLARD
                spellPower SPELLPOWER_ENHANCED
                level 25
                maxHp 50
                maxMp 0
                baseAtk 50
                baseDef 36
                baseAgi 165
                baseMov 6
                baseResistance &
                    STATUS_RESIST_MAJOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN4|&
                    PROWESS_DOUBLE_1IN16|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_STEALTH
                unknownWord 0
                    
                unknownByte 0           ; ZALBARD
                spellPower SPELLPOWER_ENHANCED
                level 40
                maxHp 80
                maxMp 65
                baseAtk 73
                baseDef 50
                baseAgi 180
                baseMov 5
                baseResistance &
                    WIND_RESIST_MINOR|&
                    LIGHTNING_RESIST_MINOR|&
                    FIRE_RESIST_MAJOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL125_1IN4|&
                    PROWESS_DOUBLE_1IN8|&
                    PROWESS_COUNTER_1IN4
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BOLT|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 4096
                    
                unknownByte 0           ; CAMEELA
                spellPower SPELLPOWER_ENHANCED
                level 50
                maxHp 99
                maxMp 0
                baseAtk 42
                baseDef 52
                baseAgi 186
                baseMov 6
                baseResistance &
                    WIND_RESIST_MINOR|&
                    LIGHTNING_RESIST_MINOR|&
                    ICE_RESIST_MINOR|&
                    FIRE_RESIST_MINOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL125_1IN4|&
                    PROWESS_DOUBLE_1IN4|&
                    PROWESS_COUNTER_1IN4
                items &
                    ITEM_IRON_BALL|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 4096
                    
                unknownByte 0           ; PRISM FLOWER
                spellPower SPELLPOWER_ENHANCED
                level 40
                maxHp 62
                maxMp 0
                baseAtk 16
                baseDef 55
                baseAgi 44
                baseMov 0
                baseResistance &
                    ICE_RESIST_MAJOR|&
                    FIRE_WEAKNESS|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_LASER, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 4096
                    
                unknownByte 0           ; RED BARON
                spellPower SPELLPOWER_ENHANCED
                level 60
                maxHp 150
                maxMp 0
                baseAtk 42
                baseDef 59
                baseAgi 190
                baseMov 6
                baseResistance &
                    WIND_RESIST_MINOR|&
                    LIGHTNING_RESIST_MINOR|&
                    ICE_RESIST_MINOR|&
                    FIRE_RESIST_MINOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL125_1IN4|&
                    PROWESS_DOUBLE_1IN4|&
                    PROWESS_COUNTER_1IN4
                items &
                    ITEM_DARK_SWORD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 4096
                    
                unknownByte 0           ; GESHP
                spellPower SPELLPOWER_ENHANCED
                level 70
                maxHp 180
                maxMp 120
                baseAtk 78
                baseDef 51
                baseAgi 191
                baseMov 6
                baseResistance &
                    WIND_RESIST_MAJOR|&
                    LIGHTNING_RESIST_MAJOR|&
                    ICE_RESIST_MAJOR|&
                    FIRE_RESIST_MAJOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL125_1IN4|&
                    PROWESS_DOUBLE_1IN8|&
                    PROWESS_COUNTER_1IN8
                items &
                    ITEM_FLAIL|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FREEZE|SPELL_LV4, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 4096
                    
                unknownByte 0           ; ODD EYE
                spellPower SPELLPOWER_ENHANCED
                level 80
                maxHp 200
                maxMp 160
                baseAtk 64
                baseDef 54
                baseAgi 195
                baseMov 6
                baseResistance &
                    WIND_RESIST_MINOR|&
                    LIGHTNING_RESIST_MINOR|&
                    ICE_RESIST_MINOR|&
                    FIRE_RESIST_MINOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL_SLEEP|&
                    PROWESS_DOUBLE_1IN8|&
                    PROWESS_COUNTER_1IN4
                items &
                    ITEM_COUNTER_SWORD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_ODDEYE, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 4096
                    
                unknownByte 0           ; GALAM
                spellPower SPELLPOWER_ENHANCED
                level 99
                maxHp 240
                maxMp 180
                baseAtk 49
                baseDef 50
                baseAgi 208
                baseMov 6
                baseResistance &
                    WIND_RESIST_MAJOR|&
                    LIGHTNING_RESIST_MAJOR|&
                    ICE_RESIST_MAJOR|&
                    FIRE_RESIST_MAJOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL125_1IN4|&
                    PROWESS_DOUBLE_1IN8|&
                    PROWESS_COUNTER_1IN4
                items &
                    ITEM_DEMON_ROD|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_DEMON, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 4096
                    
                unknownByte 0           ; ZEON
                spellPower SPELLPOWER_ENHANCED
                level 99
                maxHp 500
                maxMp 180
                baseAtk 102
                baseDef 50
                baseAgi 203
                baseMov 0
                baseResistance &
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL125_1IN4|&
                    PROWESS_DOUBLE_1IN4|&
                    PROWESS_COUNTER_1IN4
                items &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_DEMON|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_REGULAR
                unknownWord 4096
                    
                unknownByte 0           ; JAR
                spellPower SPELLPOWER_ENHANCED
                level 12
                maxHp 59
                maxMp 0
                baseAtk 35
                baseDef 44
                baseAgi 46
                baseMov 7
                baseResistance &
                    WIND_RESIST_MAJOR|&
                    LIGHTNING_RESIST_MAJOR|&
                    ICE_RESIST_MAJOR|&
                    FIRE_RESIST_MAJOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_CHROME_LANCE|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_FLYING
                unknownWord 8192
                    
                unknownByte 0           ; MASTER MAGE
                spellPower SPELLPOWER_REGULAR
                level 14
                maxHp 28
                maxMp 14
                baseAtk 11
                baseDef 18
                baseAgi 22
                baseMov 5
                baseResistance &
                    FIRE_RESIST_MINOR
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_POWER_STICK|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_BLAZE|SPELL_LV2, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 8192
                    
                unknownByte 0           ; NECROMANCER
                spellPower SPELLPOWER_ENHANCED
                level 30
                maxHp 47
                maxMp 42
                baseAtk 45
                baseDef 44
                baseAgi 51
                baseMov 6
                baseResistance &
                    LIGHTNING_RESIST_MINOR|&
                    STATUS_IMMUNITY
                baseProwess &
                    PROWESS_CRITICAL150_1IN32|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN16
                items &
                    ITEM_MAGE_STAFF|ITEM_EQUIPPED, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_FREEZE|SPELL_LV3, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_MAGE
                unknownWord 8192
                    
                unknownByte 0           ; BLUE SHAMAN
                spellPower SPELLPOWER_ENHANCED
                level 42
                maxHp 72
                maxMp 60
                baseAtk 64
                baseDef 54
                baseAgi 51
                baseMov 5
                baseResistance 0
                baseProwess &
                    PROWESS_CRITICAL_SILENCE|&
                    PROWESS_DOUBLE_1IN32|&
                    PROWESS_COUNTER_1IN32
                items &
                    ITEM_HOLY_STAFF|ITEM_EQUIPPED, &
                    ITEM_HEALING_RAIN, &
                    ITEM_NOTHING, &
                    ITEM_NOTHING
                spells &
                    SPELL_AURA|SPELL_LV3, &
                    SPELL_BLAST|SPELL_LV4, &
                    SPELL_NOTHING, &
                    SPELL_NOTHING
                initialStatus 0
                moveType MOVETYPE_HEALER
                unknownWord 12288
                    
