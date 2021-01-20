
; ASM FILE data\maps\entries\map14\mapsetups\s2_entityevents_458.asm :
; 0x58F3C..0x58F4C : 
ms_map14_flag458_EntityEvents:
                msEntityEvent 128, UP, Map14_1CA_EntityEvent0-ms_map14_flag458_EntityEvents
                msDftEntityEvent 1, (Map14_DefaultEntityEvent-ms_map14_flag458_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================


Map14_1CA_EntityEvent0:
                
                jsr     (MapTileset050+$3D6-ms_map14_flag458_EntityEvents)
                rts

    ; End of function Map14_1CA_EntityEvent0

