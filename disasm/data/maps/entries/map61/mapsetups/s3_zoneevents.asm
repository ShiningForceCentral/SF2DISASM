
; ASM FILE data\maps\entries\map61\mapsetups\s3_zoneevents.asm :
; 0x5C696..0x5C6BE : 
ms_map61_ZoneEvents:
                msZoneEvent 4, 9, Map61_ZoneEvent0-ms_map61_ZoneEvents
                msZoneEvent 5, 9, Map61_ZoneEvent0-ms_map61_ZoneEvents
                msZoneEvent 6, 9, Map61_ZoneEvent0-ms_map61_ZoneEvents
                msDefaultZoneEvent Map61_DefaultZoneEvent-ms_map61_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map61_ZoneEvent0:
                
                 
                chkFlg  730             ; Set after the old man opens the door to the Woodel Panel shrine interior
                bne.s   Map61_DefaultZoneEvent
                chkFlg  77              ; Old man is a follower
                beq.s   Map61_DefaultZoneEvent
                script  cs_5C6CA
                setFlg  730             ; Set after the old man opens the door to the Woodel Panel shrine interior
Map61_DefaultZoneEvent:
                
                rts

    ; End of function Map61_ZoneEvent0

