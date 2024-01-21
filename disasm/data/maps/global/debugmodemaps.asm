
; ASM FILE data\maps\global\debugmodemaps.asm :
; 0x7186..0x71C0 : Debug mode maps
table_DebugModeAvailableMaps:
                
@declareAllMaps: macro
i: = 0
            rept MAPS_NUMBER
                dc.b i
i: = i+1
            endr
        endm
                
            if (STANDARD_BUILD&TEST_BUILD=1)
                @declareAllMaps
            else
                dc.b MAP_GRANSEAL
                dc.b MAP_GRANSEAL_EARTHQUAKE
                dc.b MAP_YEEL
                dc.b MAP_NEW_GRANSEAL
                dc.b MAP_NEW_GRANSEAL_CASTLE
                dc.b MAP_RIBBLE
                dc.b MAP_HASSAN
                dc.b MAP_MOUNT_VOLCANON
                dc.b MAP_VOLCANON_SHRINE
                dc.b MAP_TAROS_SHRINE
                dc.b MAP_POLCA
                dc.b MAP_SHIP_DAMAGED
                dc.b MAP_TRISTAN
                dc.b MAP_GALAM_CASTLE
                dc.b MAP_GALAM_CASTLE_INNER
                dc.b MAP_GALAM_CASTLE_EXIT
                dc.b MAP_GRANSEAL_CASTLE_2F
                dc.b MAP_GRANSEAL_CASTLE_1F
                dc.b MAP_GRANSEAL_CASTLE_3F
                dc.b MAP_CREED_DESKTOP_WORLD
                dc.b MAP_SECRET_MONK_FOREST
                dc.b MAP_KETTO
                dc.b MAP_CREED_FLOOR_WORLD
                dc.b MAP_CREED_WILLARD_CAVE
                dc.b MAP_GRANSEAL
                dc.b MAP_DEVILS_HEAD_LABYRINTH
                dc.b MAP_SECRET_DWARVEN_VILLAGE_OUTSIDE
                dc.b MAP_GRANSEAL
                dc.b MAP_SECRET_DWARVEN_VILLAGE_INSIDE
                dc.b MAP_MOUN
                dc.b MAP_UNDERGROUND_PATH_1
                dc.b MAP_CREED_MANSION
                dc.b MAP_EVIL_SPIRIT_SHRINE
                dc.b MAP_UNDERGROUND_PATH_2
                dc.b MAP_PACALON_CASTLE
                dc.b MAP_NAZCA_SHIP_INTERIOR
                dc.b MAP_ROFT
                dc.b MAP_MOUN_UNDERGROUND
                dc.b MAP_ANCIENT_TOWER_OUTSIDE
                dc.b MAP_DEVILS_HEAD
                dc.b MAP_FORCE_SWORD_SHRINE
                dc.b MAP_HAWEL_HOUSE
                dc.b MAP_GRANSEAL_DOCKS_AND_SHIP
                dc.b MAP_DOJO
                dc.b MAP_GRANSEAL
                dc.b MAP_GRANSEAL
                dc.b MAP_ANCIENT_TOWER_CLIMB
                dc.b MAP_ANCIENT_TOWER_FIRST_ROOM
                dc.b MAP_ANCIENT_TOWER_UNDERGROUND_ROOM
                dc.b MAP_ANCIENT_TOWER_UNDERGROUND_STAIRS
                dc.b MAP_HARPY_POOL
                dc.b MAP_OUTSIDE_MITULA
                dc.b MAP_INSIDE_MITULA
                dc.b MAP_PACALON
                dc.b MAP_OVERWORLD_GRANS_NORTH_SHORE
                dc.b MAP_ZEON_ARENA
                dc.b MAP_OVERWORLD_NEW_GRANSEAL_SHORE
            endif
