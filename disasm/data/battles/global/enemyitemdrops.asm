
; ASM FILE data\battles\global\enemyitemdrops.asm :
; 0xBE52..0xBECC : Enemy item drops
EnemyItemDrops: ; battle      enum Battles : BATTLE_*
                ; enemyEntity Enemy entity ID (Entity ID + 128)
                ; itemDrop    enum Items : ITEM_*
                ; dropFlag    Drop flag ID
                    
                battle TO_HAWEL_HOUSE
                enemyEntity 130
                itemDrop MEDICAL_HERB
                dropFlag 0
                    
                battle AMBUSHED_BY_GALAM_SOLDIERS
                enemyEntity 130
                itemDrop MEDICAL_HERB
                dropFlag 1
                    
                battle AMBUSHED_BY_GALAM_SOLDIERS
                enemyEntity 131
                itemDrop MEDICAL_HERB
                dropFlag 2
                    
                battle GALAM_CASTLE
                enemyEntity 130
                itemDrop SHORT_ROD
                dropFlag 3
                    
                battle TO_THE_EAST
                enemyEntity 129
                itemDrop POWER_RING
                dropFlag 4
                    
                battle SOUTHEAST_DESERT
                enemyEntity 131
                itemDrop POWER_STICK
                dropFlag 5
                    
                battle OUTSIDE_ELVEN_VILLAGE
                enemyEntity 129
                itemDrop SHINING_BALL
                dropFlag 6
                    
                battle DEVIL_TAIL
                enemyEntity 135
                itemDrop BROAD_SWORD
                dropFlag 7
                    
                battle DEVIL_TAIL
                enemyEntity 129
                itemDrop PROTECT_RING
                dropFlag 8
                    
                battle TO_NORTH_PARMECIA
                enemyEntity 135
                itemDrop BLIZZARD
                dropFlag 9
                    
                battle OUTSIDE_KETTO
                enemyEntity 130
                itemDrop BLACK_RING
                dropFlag 10
                    
                battle INSIDE_MOUN
                enemyEntity 135
                itemDrop MAGE_STAFF
                dropFlag 11
                    
                battle VERSUS_CAMEELA
                enemyEntity 130
                itemDrop WISH_STAFF
                dropFlag 12
                    
                battle TO_ROFT
                enemyEntity 133
                itemDrop HEAT_AXE
                dropFlag 13
                    
                battle VERSUS_GESHP
                enemyEntity 137
                itemDrop BUSTER_SHOT
                dropFlag 14
                    
                battle TO_ANCIENT_SHRINE
                enemyEntity 130
                itemDrop EVIL_RING
                dropFlag 15
                    
                battle TO_ANCIENT_SHRINE
                enemyEntity 136
                itemDrop HOLY_THUNDER
                dropFlag 16
                    
                battle VERSUS_ODD_EYE
                enemyEntity 142
                itemDrop FAIRY_TEAR
                dropFlag 17
                    
                battle OUTSIDE_ANCIENT_TOWER
                enemyEntity 129
                itemDrop HOLY_STAFF
                dropFlag 18
                    
                battle VERSUS_ZEON
                enemyEntity 143
                itemDrop HEALING_RAIN
                dropFlag 19
                    
                battle TO_NORTH_PARMECIA
                enemyEntity 133
                itemDrop MEDICAL_HERB
                dropFlag 20
                    
                battle TO_NORTH_PARMECIA
                enemyEntity 140
                itemDrop MEDICAL_HERB
                dropFlag 21
                    
                battle NORTH_CAVE
                enemyEntity 133
                itemDrop MEDICAL_HERB
                dropFlag 22
                    
                battle NORTH_CAVE
                enemyEntity 142
                itemDrop MEDICAL_HERB
                dropFlag 23
                    
                battle VERSUS_TAROS
                enemyEntity 128
                itemDrop TAROS_SWORD
                dropFlag 24
                    
                battle VERSUS_PRISM_FLOWERS
                enemyEntity 128
                itemDrop BATTLE_SWORD
                dropFlag 25
                    
                battle VERSUS_CAMEELA
                enemyEntity 128
                itemDrop IRON_BALL
                dropFlag 26
                    
                battle VERSUS_ZALBARD
                enemyEntity 143
                itemDrop MITHRIL
                dropFlag 27
                    
                battle VERSUS_ODD_EYE
                enemyEntity 128
                itemDrop COUNTER_SWORD
                dropFlag 28
                    
                battle SHRINE_SOUTH_OF_RIBBLE
                enemyEntity 143
                itemDrop POWER_WATER
                dropFlag 29
                    
                tableEnd
