
; ASM FILE data\maps\global\savepointmapcoords.asm :
; 0x7B71..0x7BCE : Save point map coords
SavepointMapCoordinates:
                ; Map, X, Y, Facing
                savePointMapCoords MAP_GRANSEAL, 32, 13, UP
                savePointMapCoords MAP_GRANSEAL_EARTHQUAKE, 29, 2, DOWN
                savePointMapCoords MAP_YEEL, 11, 6, UP
                savePointMapCoords MAP_GALAM_CASTLE, 27, 7, UP
                savePointMapCoords MAP_NEW_GRANSEAL, 11, 22, UP
                savePointMapCoords MAP_RIBBLE, 22, 22, UP
                savePointMapCoords MAP_POLCA, 18, 25, UP
                savePointMapCoords MAP_MOUNT_VOLCANON, 27, 35, UP
                savePointMapCoords MAP_SHIP_DAMAGED, 45, 7, DOWN
                savePointMapCoords MAP_KETTO, 12, 11, UP
                savePointMapCoords MAP_HASSAN, 8, 9, UP
                savePointMapCoords MAP_MOUN, 20, 8, UP
                savePointMapCoords MAP_TRISTAN, 12, 16, UP
                savePointMapCoords MAP_HAWEL_HOUSE, 7, 5, DOWN
                savePointMapCoords MAP_DOJO, 12, 25, UP
                savePointMapCoords MAP_CREED_FLOOR_WORLD, 4, 36, UP
                savePointMapCoords MAP_SECRET_MONK_FOREST, 61, 4, UP
                savePointMapCoords MAP_ROFT, 21, 27, RIGHT
                savePointMapCoords MAP_ANCIENT_TOWER_CLIMB, 42, 38, DOWN
                savePointMapCoords MAP_CREED_DESKTOP_WORLD, 5, 8, UP
                savePointMapCoords MAP_SECRET_DWARVEN_VILLAGE_OUTSIDE, 55, 10, UP
                savePointMapCoords MAP_PACALON, 41, 10, UP
                savePointMapCoords MAP_PACALON_CASTLE, 40, 5, UP
                dc.b $FF
