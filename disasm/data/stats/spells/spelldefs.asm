
; ASM FILE data\stats\spells\spelldefs.asm :
; 0x176A6..0x1796E : Spell definitions
SpellDefs:      ; index      enum Spells : SPELL_*
; mpCost     (0..255)
; animation  enum SpellAnims : SPELLANIMIDX_*
; properties enum SpellProps : SPELLPROPS_*
; range      Min, Max (0..3)
; radius     (0..2)
; power      (0..255)
    
                index HEAL              ; HEAL 1
                mpCost 3
                animation HEALING_FAIRY
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 1
                radius 0
                power 15
                    
                index HEAL|LV2          ; HEAL 2
                mpCost 5
                animation HEALING_FAIRY|LV2
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 2
                radius 0
                power 15
                    
                index HEAL|LV3          ; HEAL 3
                mpCost 10
                animation HEALING_FAIRY|LV3
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 3
                radius 0
                power 30
                    
                index HEAL|LV4          ; HEAL 4
                mpCost 20
                animation HEALING_FAIRY|LV4
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 1
                radius 0
                power 255
                    
                index AURA              ; AURA 1
                mpCost 7
                animation HEALING_FAIRY
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 3
                radius 1
                power 15
                    
                index AURA|LV2          ; AURA 2
                mpCost 11
                animation HEALING_FAIRY|LV2
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 3
                radius 2
                power 15
                    
                index AURA|LV3          ; AURA 3
                mpCost 15
                animation HEALING_FAIRY|LV3
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 3
                radius 2
                power 30
                    
                index AURA|LV4          ; AURA 4
                mpCost 20
                animation HEALING_FAIRY|LV4
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 0
                radius 0
                power 255
                    
                index DETOX             ; DETOX 1
                mpCost 3
                animation DETOX
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 1
                radius 0
                power 0
                    
                index DETOX|LV2         ; DETOX 2
                mpCost 6
                animation DETOX|LV2
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 2
                radius 0
                power 0
                    
                index DETOX|LV3         ; DETOX 3
                mpCost 10
                animation DETOX|LV3
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 2
                radius 0
                power 0
                    
                index DETOX|LV4         ; DETOX 4
                mpCost 16
                animation DETOX|LV4
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 3
                radius 2
                power 0
                    
                index BOOST             ; BOOST 1
                mpCost 2
                animation BUFF
                properties &
                    TYPE_STATUS|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 1
                radius 1
                power 15
                    
                index BOOST|LV2         ; BOOST 2
                mpCost 5
                animation BUFF|LV2
                properties &
                    TYPE_STATUS|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 2
                radius 2
                power 15
                    
                index SLOW              ; SLOW 1
                mpCost 3
                animation DEBUFF
                properties &
                    TYPE_STATUS|AFFECTEDBYSILENCE
                range 1, 1
                radius 1
                power 15
                    
                index SLOW|LV2          ; SLOW 2
                mpCost 6
                animation DEBUFF|LV2
                properties &
                    TYPE_STATUS|AFFECTEDBYSILENCE
                range 1, 2
                radius 2
                power 15
                    
                index ATTACK            ; ATTACK 1
                mpCost 7
                animation BUFF
                properties &
                    TYPE_STATUS|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 1, 3
                radius 0
                power 15
                    
                index DISPEL            ; DISPEL 1
                mpCost 5
                animation DEBUFF
                properties &
                    TYPE_STATUS|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 0
                    
                index MUDDLE            ; MUDDLE 1
                mpCost 6
                animation DEBUFF
                properties &
                    TYPE_STATUS|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 0
                    
                index MUDDLE|LV2        ; MUDDLE 2
                mpCost 11
                animation DEBUFF
                properties &
                    TYPE_STATUS|AFFECTEDBYSILENCE
                range 1, 2
                radius 2
                power 0
                    
                index DESOUL            ; DESOUL 1
                mpCost 8
                animation DESOUL
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 0
                    
                index DESOUL|LV2        ; DESOUL 2
                mpCost 13
                animation DESOUL|LV2
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 0
                    
                index SLEEP             ; SLEEP 1
                mpCost 4
                animation DEBUFF
                properties &
                    TYPE_STATUS|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 0
                    
                index EGRESS            ; EGRESS 1
                mpCost 8
                animation NONE
                properties &
                    TYPE_SPECIAL|TARGET_TEAMMATES|AFFECTEDBYSILENCE
                range 0, 0
                radius 0
                power 0
                    
                index BLAZE             ; BLAZE 1
                mpCost 2
                animation BLAZE
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 6
                    
                index BLAZE|LV2         ; BLAZE 2
                mpCost 6
                animation BLAZE|LV2
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 10
                    
                index BLAZE|LV3         ; BLAZE 3
                mpCost 10
                animation BLAZE|LV3
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 15
                    
                index BLAZE|LV4         ; BLAZE 4
                mpCost 10
                animation BLAZE|LV4
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 40
                    
                index FREEZE            ; FREEZE 1
                mpCost 3
                animation FREEZE
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 10
                    
                index FREEZE|LV2        ; FREEZE 2
                mpCost 7
                animation FREEZE|LV2
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 12
                    
                index FREEZE|LV3        ; FREEZE 3
                mpCost 12
                animation FREEZE|LV3
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 3
                radius 1
                power 18
                    
                index FREEZE|LV4        ; FREEZE 4
                mpCost 12
                animation FREEZE|LV4
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 3
                radius 0
                power 50
                    
                index BOLT              ; BOLT 1
                mpCost 8
                animation BOLT
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 14
                    
                index BOLT|LV2          ; BOLT 2
                mpCost 15
                animation BOLT|LV2
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 3
                radius 2
                power 16
                    
                index BOLT|LV3          ; BOLT 3
                mpCost 20
                animation BOLT|LV3
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 3
                radius 2
                power 25
                    
                index BOLT|LV4          ; BOLT 4
                mpCost 20
                animation BOLT|LV4
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 3
                radius 0
                power 60
                    
                index BLAST             ; BLAST 1
                mpCost 2
                animation BLAST
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 1
                radius 0
                power 6
                    
                index BLAST|LV2         ; BLAST 2
                mpCost 5
                animation BLAST|LV2
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 8
                    
                index BLAST|LV3         ; BLAST 3
                mpCost 8
                animation BLAST|LV3
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 12
                    
                index BLAST|LV4         ; BLAST 4
                mpCost 8
                animation BLAST|LV4
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 30
                    
                index SPOIT             ; SPOIT 1
                mpCost 0
                animation MAGIC_DRAIN
                properties &
                    TYPE_SPECIAL
                range 1, 2
                radius 0
                power 10
                    
                index HEALIN            ; HEALIN 1
                mpCost 0
                animation HEALING_FAIRY
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 10
                    
                index HEALIN|LV2        ; HEALIN 2
                mpCost 0
                animation HEALING_FAIRY|LV2
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 20
                    
                index HEALIN|LV3        ; HEALIN 3
                mpCost 0
                animation HEALING_FAIRY|LV3
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 30
                    
                index FLAME             ; FLAME 1
                mpCost 0
                animation FLAME_BREATH
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 16
                    
                index FLAME|LV2         ; FLAME 2
                mpCost 0
                animation FLAME_BREATH|LV2
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 24
                    
                index FLAME|LV3         ; FLAME 3
                mpCost 0
                animation FLAME_BREATH|LV3
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 34
                    
                index SNOW              ; SNOW 1
                mpCost 0
                animation SNOW_BREATH|LV2
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 20
                    
                index SNOW|LV2          ; SNOW 2
                mpCost 0
                animation SNOW_BREATH|LV3
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 28
                    
                index SNOW|LV3          ; SNOW 3
                mpCost 0
                animation SNOW_BREATH|LV4
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 35
                    
                index DEMON             ; DEMON 1
                mpCost 0
                animation DEMON_BREATH
                properties &
                    TYPE_ATTACK
                range 1, 2
                radius 1
                power 34
                    
                index DEMON|LV2         ; DEMON 2
                mpCost 0
                animation DEMON_BREATH|LV2
                properties &
                    TYPE_ATTACK
                range 1, 3
                radius 2
                power 38
                    
                index POWER             ; POWER 1
                mpCost 0
                animation NONE
                properties &
                    TYPE_SPECIAL|TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 4
                    
                index GUARD             ; GUARD 1
                mpCost 0
                animation NONE
                properties &
                    TYPE_SPECIAL|TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 4
                    
                index SPEED             ; SPEED 1
                mpCost 0
                animation NONE
                properties &
                    TYPE_SPECIAL|TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 4
                    
                index IDATEN            ; IDATEN 1
                mpCost 0
                animation NONE
                properties &
                    TYPE_SPECIAL|TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 2
                    
                index HEALTH            ; HEALTH 1
                mpCost 0
                animation NONE
                properties &
                    TYPE_SPECIAL|TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 4
                    
                index B_ROCK            ; B.ROCK 1
                mpCost 0
                animation BURST_ROCK
                properties &
                    TYPE_ATTACK
                range 0, 0
                radius 2
                power 18
                    
                index LASER             ; LASER 1
                mpCost 0
                animation NONE
                properties &
                    TYPE_ATTACK
                range 0, 0
                radius 3
                power 16
                    
                index KATON             ; KATON 1
                mpCost 6
                animation BLAZE|LV2
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 12
                    
                index KATON|LV2         ; KATON 2
                mpCost 10
                animation BLAZE|LV3
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 16
                    
                index KATON|LV3         ; KATON 3
                mpCost 12
                animation BLAZE|LV4
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 0
                power 42
                    
                index RAIJIN            ; RAIJIN 1
                mpCost 15
                animation BOLT|LV2
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 3
                radius 2
                power 18
                    
                index RAIJIN|LV2        ; RAIJIN 2
                mpCost 18
                animation BOLT|LV3
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 3
                radius 2
                power 26
                    
                index RAIJIN|LV3        ; RAIJIN 3
                mpCost 20
                animation BOLT|LV4
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 3
                radius 0
                power 58
                    
                index DAO               ; DAO 1
                mpCost 8
                animation DAO
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 18
                    
                index DAO|LV2           ; DAO 2
                mpCost 15
                animation DAO|LV2
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 40
                    
                index APOLLO            ; APOLLO 1
                mpCost 10
                animation APOLLO
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 23
                    
                index APOLLO|LV2        ; APOLLO 2
                mpCost 17
                animation APOLLO|LV2
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 50
                    
                index NEPTUN            ; NEPTUN 1
                mpCost 12
                animation NEPTUN
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 30
                    
                index NEPTUN|LV2        ; NEPTUN 2
                mpCost 19
                animation NEPTUN|LV2
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 61
                    
                index ATLAS             ; ATLAS 1
                mpCost 14
                animation ATLAS
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 2
                radius 1
                power 35
                    
                index ATLAS|LV2         ; ATLAS 2
                mpCost 23
                animation ATLAS|LV2
                properties &
                    TYPE_ATTACK|AFFECTEDBYSILENCE
                range 1, 3
                radius 1
                power 73
                    
                index POWDER            ; POWDER 1
                mpCost 0
                animation NONE
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 0
                    
                index G_TEAR            ; G.TEAR 1
                mpCost 0
                animation NONE
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 10
                    
                index G_TEAR|LV2        ; G.TEAR 2
                mpCost 0
                animation NONE
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES
                range 0, 1
                radius 0
                power 20
                    
                index HANNY             ; HANNY 1
                mpCost 0
                animation NONE
                properties &
                    TYPE_SPECIAL|TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 4
                    
                index BRAVE             ; BRAVE 1
                mpCost 0
                animation NONE
                properties &
                    TYPE_SPECIAL|TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 1
                    
                index FBALL             ; F.BALL 1
                mpCost 0
                animation BLAZE|LV3
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 20
                    
                index BREZAD            ; BREZAD 1
                mpCost 0
                animation FREEZE|LV3
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 33
                    
                index THUNDR            ; THUNDR 1
                mpCost 0
                animation BOLT|LV3
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 50
                    
                index AQUA              ; AQUA 1
                mpCost 0
                animation BUBBLE_BREATH
                properties &
                    TYPE_ATTACK
                range 1, 3
                radius 0
                power 13
                    
                index AQUA|LV2          ; AQUA 2
                mpCost 0
                animation BUBBLE_BREATH|LV2
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 15
                    
                index KIWI              ; KIWI 1
                mpCost 0
                animation FLAME_BREATH|LV3
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 28
                    
                index KIWI|LV2          ; KIWI 2
                mpCost 0
                animation FLAME_BREATH|LV3
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 36
                    
                index KIWI|LV3          ; KIWI 3
                mpCost 0
                animation FLAME_BREATH|LV3
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 45
                    
                index KIWI|LV4          ; KIWI 4
                mpCost 0
                animation FLAME_BREATH|LV3
                properties &
                    TYPE_ATTACK
                range 1, 1
                radius 0
                power 58
                    
                index SHINE             ; SHINE 1
                mpCost 0
                animation NONE
                properties &
                    TYPE_HEAL|TARGET_TEAMMATES
                range 0, 0
                radius 0
                power 255
                    
                index ODDEYE            ; ODDEYE 1
                mpCost 0
                animation ODD_EYE_BEAM
                properties &
                    TYPE_ATTACK
                range 1, 3
                radius 1
                power 20
                    
