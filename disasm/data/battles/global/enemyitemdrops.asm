
; ASM FILE data\battles\global\enemyitemdrops.asm :
; 0xBE52..0xBECC : Enemy item drops
table_EnemyItemDrops:
                
; Syntax        battle      [BATTLE_]enum (or index)
;               enemyEntity 0-31
;               item        [ITEM_]enum (or index)
;               droppedFlag 0-31
                
                battle      TO_HAWEL_HOUSE
                enemyEntity 2
                item        MEDICAL_HERB
                droppedFlag 0
                
                battle      AMBUSHED_BY_GALAM_SOLDIERS
                enemyEntity 2
                item        MEDICAL_HERB
                droppedFlag 1
                
                battle      AMBUSHED_BY_GALAM_SOLDIERS
                enemyEntity 3
                item        MEDICAL_HERB
                droppedFlag 2
                
                battle      GALAM_CASTLE
                enemyEntity 2
                item        SHORT_ROD
                droppedFlag 3
                
                battle      TO_THE_EAST
                enemyEntity 1
                item        POWER_RING
                droppedFlag 4
                
                battle      SOUTHEAST_DESERT
                enemyEntity 3
                item        POWER_STICK
                droppedFlag 5
                
                battle      OUTSIDE_ELVEN_VILLAGE
                enemyEntity 1
                item        SHINING_BALL
                droppedFlag 6
                
                battle      DEVIL_TAIL
                enemyEntity 7
                item        BROAD_SWORD
                droppedFlag 7
                
                battle      DEVIL_TAIL
                enemyEntity 1
                item        PROTECT_RING
                droppedFlag 8
                
                battle      TO_NORTH_PARMECIA
                enemyEntity 7
                item        BLIZZARD
                droppedFlag 9
                
                battle      OUTSIDE_KETTO
                enemyEntity 2
                item        BLACK_RING
                droppedFlag 10
                
                battle      INSIDE_MOUN
                enemyEntity 7
                item        MAGE_STAFF
                droppedFlag 11
                
                battle      VERSUS_CAMEELA
                enemyEntity 2
                item        WISH_STAFF
                droppedFlag 12
                
                battle      TO_ROFT
                enemyEntity 5
                item        HEAT_AXE
                droppedFlag 13
                
                battle      VERSUS_GESHP
                enemyEntity 9
                item        BUSTER_SHOT
                droppedFlag 14
                
                battle      TO_ANCIENT_SHRINE
                enemyEntity 2
                item        EVIL_RING
                droppedFlag 15
                
                battle      TO_ANCIENT_SHRINE
                enemyEntity 8
                item        HOLY_THUNDER
                droppedFlag 16
                
                battle      VERSUS_ODD_EYE
                enemyEntity 14
                item        FAIRY_TEAR
                droppedFlag 17
                
                battle      OUTSIDE_ANCIENT_TOWER
                enemyEntity 1
                item        HOLY_STAFF
                droppedFlag 18
                
                battle      VERSUS_ZEON
                enemyEntity 15
                item        HEALING_RAIN
                droppedFlag 19
                
                battle      TO_NORTH_PARMECIA
                enemyEntity 5
                item        MEDICAL_HERB
                droppedFlag 20
                
                battle      TO_NORTH_PARMECIA
                enemyEntity 12
                item        MEDICAL_HERB
                droppedFlag 21
                
                battle      NORTH_CAVE
                enemyEntity 5
                item        MEDICAL_HERB
                droppedFlag 22
                
                battle      NORTH_CAVE
                enemyEntity 14
                item        MEDICAL_HERB
                droppedFlag 23
                
                battle      VERSUS_TAROS
                enemyEntity 0
                item        TAROS_SWORD
                droppedFlag 24
                
                battle      VERSUS_PRISM_FLOWERS
                enemyEntity 0
                item        BATTLE_SWORD
                droppedFlag 25
                
                battle      VERSUS_CAMEELA
                enemyEntity 0
                item        IRON_BALL
                droppedFlag 26
                
                battle      VERSUS_ZALBARD
                enemyEntity 15
                item        MITHRIL
                droppedFlag 27
                
                battle      VERSUS_ODD_EYE
                enemyEntity 0
                item        COUNTER_SWORD
                droppedFlag 28
                
                battle      SHRINE_SOUTH_OF_RIBBLE
                enemyEntity 15
                item        POWER_WATER
                droppedFlag 29
                
                tableEnd.w


; Items that have a random chance to drop (x/256)
table_RandomItemDrops:
            if (STANDARD_BUILD=1)
                dc.b ITEM_TAROS_SWORD,8
                dc.b ITEM_IRON_BALL,8
                dc.b ITEM_COUNTER_SWORD,8
                    
                tableEnd.b
            endif
