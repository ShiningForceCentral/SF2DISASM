
; ASM FILE data\maps\entries\map52\mapsetups\s3_zoneevents.asm :
; 0x5C4AA..0x5C4CC : 
ms_map52_ZoneEvents:
                msZoneEvent 3, 23, Map52_ZoneEvent0-ms_map52_ZoneEvents
                msZoneEvent 4, 23, Map52_ZoneEvent0-ms_map52_ZoneEvents
                msDefaultZoneEvent Map52_DefaultZoneEvent-ms_map52_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map52_ZoneEvent0:
                
                 
                chkFlg  713             ; Set after the scene at the cliffs before Bedoe, where the devils are searching
                bne.s   Map52_DefaultZoneEvent
                lea     cs_5C4EE(pc), a0
                jsr     ExecuteMapScript
                setFlg  713             ; Set after the scene at the cliffs before Bedoe, where the devils are searching
Map52_DefaultZoneEvent:
                
                rts

    ; End of function Map52_ZoneEvent0

