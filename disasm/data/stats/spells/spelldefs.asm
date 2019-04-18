
; ASM FILE data\stats\spells\spelldefs.asm :
; 0x176A6..0x1796E : Spell definitions
SpellDefs:      index SPELL_HEAL        ; HEAL 1
                mpCost 3
                animation SPELLANIMIDX_FAIRY
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 1
                radius 0
                power 15
                    
                index SPELL_HEAL|SPELL_LV2 ; HEAL 2
                mpCost 5
                animation SPELLANIMIDX_FAIRY|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 2
                radius 0
                power 15
                    
                index SPELL_HEAL|SPELL_LV3 ; HEAL 3
                mpCost 10
                animation SPELLANIMIDX_FAIRY|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 3
                radius 0
                power 30
                    
                index SPELL_HEAL|SPELL_LV4 ; HEAL 4
                mpCost 20
                animation SPELLANIMIDX_FAIRY|SPELLANIMPARAM_3
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 1
                radius 0
                power 255
                    
                index SPELL_AURA        ; AURA 1
                mpCost 7
                animation SPELLANIMIDX_FAIRY
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 3
                radius 1
                power 15
                    
                index SPELL_AURA|SPELL_LV2 ; AURA 2
                mpCost 11
                animation SPELLANIMIDX_FAIRY|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 3
                radius 2
                power 15
                    
                index SPELL_AURA|SPELL_LV3 ; AURA 3
                mpCost 15
                animation SPELLANIMIDX_FAIRY|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 3
                radius 2
                power 30
                    
                index SPELL_AURA|SPELL_LV4 ; AURA 4
                mpCost 20
                animation SPELLANIMIDX_FAIRY|SPELLANIMPARAM_3
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 0
                radius 0
                power 255
                    
                index SPELL_DETOX       ; DETOX 1
                mpCost 3
                animation SPELLANIMIDX_DETOX
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 1
                radius 0
                power 0
                    
                index SPELL_DETOX|SPELL_LV2 ; DETOX 2
                mpCost 6
                animation SPELLANIMIDX_DETOX|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 2
                radius 0
                power 0
                    
                index SPELL_DETOX|SPELL_LV3 ; DETOX 3
                mpCost 10
                animation SPELLANIMIDX_DETOX|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 2
                radius 0
                power 0
                    
                index SPELL_DETOX|SPELL_LV4 ; DETOX 4
                mpCost 16
                animation SPELLANIMIDX_DETOX|SPELLANIMPARAM_3
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 3
                radius 2
                power 0
                    
                index SPELL_BOOST       ; BOOST 1
                mpCost 2
                animation SPELLANIMIDX_BUFF
                properties &
                    SPELLPROPS_TYPE_STATUS|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 1
                radius 1
                power 15
                    
                index SPELL_BOOST|SPELL_LV2 ; BOOST 2
                mpCost 5
                animation SPELLANIMIDX_BUFF|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_STATUS|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 2
                radius 2
                power 15
                    
                index SPELL_SLOW        ; SLOW 1
                mpCost 3
                animation SPELLANIMIDX_DEBUFF
                properties &
                    SPELLPROPS_TYPE_STATUS|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 1
                radius 1
                power 15
                    
                index SPELL_SLOW|SPELL_LV2 ; SLOW 2
                mpCost 6
                animation SPELLANIMIDX_DEBUFF|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_STATUS|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 2
                power 15
                    
                index SPELL_ATTACK      ; ATTACK 1
                mpCost 7
                animation SPELLANIMIDX_BUFF
                properties &
                    SPELLPROPS_TYPE_STATUS|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 3
                radius 0
                power 15
                    
                index SPELL_DISPEL      ; DISPEL 1
                mpCost 5
                animation SPELLANIMIDX_DEBUFF
                properties &
                    SPELLPROPS_TYPE_STATUS|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 0
                    
                index SPELL_MUDDLE      ; MUDDLE 1
                mpCost 6
                animation SPELLANIMIDX_DEBUFF
                properties &
                    SPELLPROPS_TYPE_STATUS|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 0
                    
                index SPELL_MUDDLE|SPELL_LV2 ; MUDDLE 2
                mpCost 11
                animation SPELLANIMIDX_DEBUFF
                properties &
                    SPELLPROPS_TYPE_STATUS|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 2
                power 0
                    
                index SPELL_DESOUL      ; DESOUL 1
                mpCost 8
                animation SPELLANIMIDX_DESOUL
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 0
                    
                index SPELL_DESOUL|SPELL_LV2 ; DESOUL 2
                mpCost 13
                animation SPELLANIMIDX_DESOUL|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 0
                    
                index SPELL_SLEEP       ; SLEEP 1
                mpCost 4
                animation SPELLANIMIDX_DEBUFF
                properties &
                    SPELLPROPS_TYPE_STATUS|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 0
                    
                index SPELL_EGRESS      ; EGRESS 1
                mpCost 8
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_SPECIAL|&
                    SPELLPROPS_TARGET_TEAMMATES|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 0, 0
                radius 0
                power 0
                    
                index SPELL_BLAZE       ; BLAZE 1
                mpCost 2
                animation SPELLANIMIDX_BLAZE
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 6
                    
                index SPELL_BLAZE|SPELL_LV2 ; BLAZE 2
                mpCost 6
                animation SPELLANIMIDX_BLAZE|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 10
                    
                index SPELL_BLAZE|SPELL_LV3 ; BLAZE 3
                mpCost 10
                animation SPELLANIMIDX_BLAZE|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 15
                    
                index SPELL_BLAZE|SPELL_LV4 ; BLAZE 4
                mpCost 10
                animation SPELLANIMIDX_BLAZE|SPELLANIMPARAM_3
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 40
                    
                index SPELL_FREEZE      ; FREEZE 1
                mpCost 3
                animation SPELLANIMIDX_FREEZE
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 10
                    
                index SPELL_FREEZE|SPELL_LV2 ; FREEZE 2
                mpCost 7
                animation SPELLANIMIDX_FREEZE|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 12
                    
                index SPELL_FREEZE|SPELL_LV3 ; FREEZE 3
                mpCost 12
                animation SPELLANIMIDX_FREEZE|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 3
                radius 1
                power 18
                    
                index SPELL_FREEZE|SPELL_LV4 ; FREEZE 4
                mpCost 12
                animation SPELLANIMIDX_FREEZE|SPELLANIMPARAM_3
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 3
                radius 0
                power 50
                    
                index SPELL_BOLT        ; BOLT 1
                mpCost 8
                animation SPELLANIMIDX_BOLT
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 14
                    
                index SPELL_BOLT|SPELL_LV2 ; BOLT 2
                mpCost 15
                animation SPELLANIMIDX_BOLT|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 3
                radius 2
                power 16
                    
                index SPELL_BOLT|SPELL_LV3 ; BOLT 3
                mpCost 20
                animation SPELLANIMIDX_BOLT|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 3
                radius 2
                power 25
                    
                index SPELL_BOLT|SPELL_LV4 ; BOLT 4
                mpCost 20
                animation SPELLANIMIDX_BOLT|SPELLANIMPARAM_3
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 3
                radius 0
                power 60
                    
                index SPELL_BLAST       ; BLAST 1
                mpCost 2
                animation SPELLANIMIDX_BLAST
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 1
                radius 0
                power 6
                    
                index SPELL_BLAST|SPELL_LV2 ; BLAST 2
                mpCost 5
                animation SPELLANIMIDX_BLAST|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 8
                    
                index SPELL_BLAST|SPELL_LV3 ; BLAST 3
                mpCost 8
                animation SPELLANIMIDX_BLAST|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 12
                    
                index SPELL_BLAST|SPELL_LV4 ; BLAST 4
                mpCost 8
                animation SPELLANIMIDX_BLAST|SPELLANIMPARAM_3
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 30
                    
                index SPELL_SPOIT       ; SPOIT 1
                mpCost 0
                animation SPELLANIMIDX_MAGIC_DRAIN
                properties &
                    SPELLPROPS_TYPE_SPECIAL
                range 1, 2
                radius 0
                power 10
                    
                index SPELL_HEALIN      ; HEALIN 1
                mpCost 0
                animation SPELLANIMIDX_FAIRY
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 10
                    
                index SPELL_HEALIN|SPELL_LV2 ; HEALIN 2
                mpCost 0
                animation SPELLANIMIDX_FAIRY|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 20
                    
                index SPELL_HEALIN|SPELL_LV3 ; HEALIN 3
                mpCost 0
                animation SPELLANIMIDX_FAIRY|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 30
                    
                index SPELL_FLAME       ; FLAME 1
                mpCost 0
                animation SPELLANIMIDX_FLAME_BREATH
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 16
                    
                index SPELL_FLAME|SPELL_LV2 ; FLAME 2
                mpCost 0
                animation SPELLANIMIDX_FLAME_BREATH|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 24
                    
                index SPELL_FLAME|SPELL_LV3 ; FLAME 3
                mpCost 0
                animation SPELLANIMIDX_FLAME_BREATH|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 34
                    
                index SPELL_SNOW        ; SNOW 1
                mpCost 0
                animation SPELLANIMIDX_SNOW_BREATH|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 20
                    
                index SPELL_SNOW|SPELL_LV2 ; SNOW 2
                mpCost 0
                animation SPELLANIMIDX_SNOW_BREATH|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 28
                    
                index SPELL_SNOW|SPELL_LV3 ; SNOW 3
                mpCost 0
                animation SPELLANIMIDX_SNOW_BREATH|SPELLANIMPARAM_3
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 35
                    
                index SPELL_DEMON       ; DEMON 1
                mpCost 0
                animation SPELLANIMIDX_DEMON_BREATH
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 2
                radius 1
                power 34
                    
                index SPELL_DEMON|SPELL_LV2 ; DEMON 2
                mpCost 0
                animation SPELLANIMIDX_DEMON_BREATH|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 3
                radius 2
                power 38
                    
                index SPELL_POWER       ; POWER 1
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_SPECIAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 4
                    
                index SPELL_GUARD       ; GUARD 1
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_SPECIAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 4
                    
                index SPELL_SPEED       ; SPEED 1
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_SPECIAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 4
                    
                index SPELL_IDATEN      ; IDATEN 1
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_SPECIAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 2
                    
                index SPELL_HEALTH      ; HEALTH 1
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_SPECIAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 4
                    
                index SPELL_B_ROCK      ; B.ROCK 1
                mpCost 0
                animation SPELLANIMIDX_BURST_ROCK
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 0, 0
                radius 2
                power 18
                    
                index SPELL_LASER       ; LASER 1
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 0, 0
                radius 3
                power 16
                    
                index SPELL_KATON       ; KATON 1
                mpCost 6
                animation SPELLANIMIDX_BLAZE|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 12
                    
                index SPELL_KATON|SPELL_LV2 ; KATON 2
                mpCost 10
                animation SPELLANIMIDX_BLAZE|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 16
                    
                index SPELL_KATON|SPELL_LV3 ; KATON 3
                mpCost 12
                animation SPELLANIMIDX_BLAZE|SPELLANIMPARAM_3
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 42
                    
                index SPELL_RAIJIN      ; RAIJIN 1
                mpCost 15
                animation SPELLANIMIDX_BOLT|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 3
                radius 2
                power 18
                    
                index SPELL_RAIJIN|SPELL_LV2 ; RAIJIN 2
                mpCost 18
                animation SPELLANIMIDX_BOLT|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 3
                radius 2
                power 26
                    
                index SPELL_RAIJIN|SPELL_LV3 ; RAIJIN 3
                mpCost 20
                animation SPELLANIMIDX_BOLT|SPELLANIMPARAM_3
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 3
                radius 0
                power 58
                    
                index SPELL_DAO         ; DAO 1
                mpCost 8
                animation SPELLANIMIDX_DAO
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 18
                    
                index SPELL_DAO|SPELL_LV2 ; DAO 2
                mpCost 15
                animation SPELLANIMIDX_DAO|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 40
                    
                index SPELL_APOLLO      ; APOLLO 1
                mpCost 10
                animation SPELLANIMIDX_APOLLO
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 23
                    
                index SPELL_APOLLO|SPELL_LV2 ; APOLLO 2
                mpCost 17
                animation SPELLANIMIDX_APOLLO|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 50
                    
                index SPELL_NEPTUN      ; NEPTUN 1
                mpCost 12
                animation SPELLANIMIDX_NEPTUN
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 30
                    
                index SPELL_NEPTUN|SPELL_LV2 ; NEPTUN 2
                mpCost 19
                animation SPELLANIMIDX_NEPTUN|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 61
                    
                index SPELL_ATLAS       ; ATLAS 1
                mpCost 14
                animation SPELLANIMIDX_ATLAS
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 35
                    
                index SPELL_ATLAS|SPELL_LV2 ; ATLAS 2
                mpCost 23
                animation SPELLANIMIDX_ATLAS|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK|&
                    SPELLPROPS_AFFECTEDBYSILENCE
                range 1, 3
                radius 1
                power 73
                    
                index SPELL_POWDER      ; POWDER 1
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 0
                    
                index SPELL_G_TEAR      ; G.TEAR 1
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 10
                    
                index SPELL_G_TEAR|SPELL_LV2 ; G.TEAR 2
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 20
                    
                index SPELL_HANNY       ; HANNY 1
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_SPECIAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 4
                    
                index SPELL_BRAVE       ; BRAVE 1
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_SPECIAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 1
                    
                index SPELL_FBALL       ; F.BALL 1
                mpCost 0
                animation SPELLANIMIDX_BLAZE|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 20
                    
                index SPELL_BREZAD      ; BREZAD 1
                mpCost 0
                animation SPELLANIMIDX_FREEZE|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 33
                    
                index SPELL_THUNDR      ; THUNDR 1
                mpCost 0
                animation SPELLANIMIDX_BOLT|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 50
                    
                index SPELL_AQUA        ; AQUA 1
                mpCost 0
                animation SPELLANIMIDX_BUBBLE_BREATH
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 3
                radius 0
                power 13
                    
                index SPELL_AQUA|SPELL_LV2 ; AQUA 2
                mpCost 0
                animation SPELLANIMIDX_BUBBLE_BREATH|SPELLANIMPARAM_1
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 15
                    
                index SPELL_KIWI        ; KIWI 1
                mpCost 0
                animation SPELLANIMIDX_FLAME_BREATH|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 28
                    
                index SPELL_KIWI|SPELL_LV2 ; KIWI 2
                mpCost 0
                animation SPELLANIMIDX_FLAME_BREATH|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 36
                    
                index SPELL_KIWI|SPELL_LV3 ; KIWI 3
                mpCost 0
                animation SPELLANIMIDX_FLAME_BREATH|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 45
                    
                index SPELL_KIWI|SPELL_LV4 ; KIWI 4
                mpCost 0
                animation SPELLANIMIDX_FLAME_BREATH|SPELLANIMPARAM_2
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 1
                radius 0
                power 58
                    
                index SPELL_SHINE       ; SHINE 1
                mpCost 0
                animation SPELLANIMIDX_NONE
                properties &
                    SPELLPROPS_TYPE_HEAL|&
                    SPELLPROPS_TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 255
                    
                index SPELL_ODDEYE      ; ODDEYE 1
                mpCost 0
                animation SPELLANIMIDX_ODD_EYE_BEAM
                properties &
                    SPELLPROPS_TYPE_ATTACK
                range 1, 3
                radius 1
                power 20
                    
