
; ASM FILE data\maps\entries\map39\mapsetups\s3_zoneevents.asm :
; 0x5E0B2..0x5E0CE : 
ms_map39_ZoneEvents:
                msZoneEvent 18, 7, Map39_ZoneEvent0-ms_map39_ZoneEvents
                msDefaultZoneEvent Map39_DefaultZoneEvent-ms_map39_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map39_DefaultZoneEvent:
                
                rts

    ; End of function Map39_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================


Map39_ZoneEvent0:
                
                 
                chkFlg  830             ; Set after the Gyan join scene in the Moun underground
                bne.s   return_5E0CC
                script  cs_5E0F8
                setFlg  830             ; Set after the Gyan join scene in the Moun underground
return_5E0CC:
                
                rts

    ; End of function Map39_ZoneEvent0

