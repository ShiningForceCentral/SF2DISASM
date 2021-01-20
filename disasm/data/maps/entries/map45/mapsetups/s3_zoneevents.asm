
; ASM FILE data\maps\entries\map45\mapsetups\s3_zoneevents.asm :
; 0x60060..0x60078 : 
ms_map45_ZoneEvents:
                msZoneEvent 255, 17, Map45_ZoneEvent0-ms_map45_ZoneEvents
                msDefaultZoneEvent Map45_DefaultZoneEvent-ms_map45_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map45_DefaultZoneEvent:
                
                rts

    ; End of function Map45_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================


Map45_ZoneEvent0:
                
                 
                chkFlg  25              ; Shiela joined
                bne.s   return_60076
                script  cs_600CE
return_60076:
                
                rts

    ; End of function Map45_ZoneEvent0

