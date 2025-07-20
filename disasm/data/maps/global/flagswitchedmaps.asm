
; ASM FILE data\maps\global\flagswitchedmaps.asm :
; 0x7988..0x799C : Flag-switched maps
table_FlagSwitchedMaps:
                flagSwitchedMap MAP_GRANSEAL, 640, MAP_GRANSEAL_EARTHQUAKE 
                                                        ; Set after the end of battle 7's long sequence, cleared at docks?
                flagSwitchedMap MAP_OVERWORLD_PACALON_KINGDOM_DROUGHT, 530, MAP_OVERWORLD_PACALON_KINGDOM 
                                                        ; Battle 30 completed - BATTLE_VERSUS_ZALBARD              
                flagSwitchedMap MAP_ANCIENT_TOWER_UNDERGROUND_ROOM, 999, MAP_ZEON_BATTLEFIELD 
                                                        ; Set after the Nazca ship shootdown scene
                flagSwitchedMapsEnd
