
; ASM FILE data\maps\global\flagswitchedmaps.asm :
; 0x7988..0x799C : Flag-switched maps
FlagSwitchedMaps:
                flagSwitchedMap MAP_GRANSEAL, $280, MAP_GRANSEAL_EARTHQUAKE 
                                                        ; Set after the end of battle 7's long sequence, cleared at docks?
                flagSwitchedMap MAP_OVERWORLD_AROUND_PACALON, $212, MAP_OVERWORLD_PACALON_2 
                                                        ; Battle 30 completed
                flagSwitchedMap MAP_ANCIENT_TOWER_UNDERGROUND_ROOM, $3E7, MAP_ZEON_ARENA 
                                                        ; Set after the Nazca ship shootdown scene
                flagSwitchedMapsEnd
