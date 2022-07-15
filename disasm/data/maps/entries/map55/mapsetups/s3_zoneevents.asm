
; ASM FILE data\maps\entries\map55\mapsetups\s3_zoneevents.asm :
; 0x5E248..0x5E25E : 
ms_map55_ZoneEvents:
                msZoneEvent 7, 7, Map55_ZoneEvent0-ms_map55_ZoneEvents
                msDefaultZoneEvent Map55_DefaultZoneEvent-ms_map55_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map55_ZoneEvent0:
                
                 
                chkFlg  534             ; Battle 34 completed - BATTLE_VERSUS_CAMEELA              
                beq.s   Map55_DefaultZoneEvent
                script  cs_5E27C
Map55_DefaultZoneEvent:
                
                rts

    ; End of function Map55_ZoneEvent0

