
; ASM FILE data\maps\entries\map62\mapsetups\s3_zoneevents.asm :
; 0x5C820..0x5C86A : 
ms_map62_ZoneEvents:
                msZoneEvent 5, 15, Map62_ZoneEvent0-ms_map62_ZoneEvents
                msZoneEvent 6, 15, Map62_ZoneEvent0-ms_map62_ZoneEvents
                msZoneEvent 5, 16, Map62_ZoneEvent2-ms_map62_ZoneEvents
                msZoneEvent 6, 16, Map62_ZoneEvent2-ms_map62_ZoneEvents
                msDefaultZoneEvent Map62_DefaultZoneEvent-ms_map62_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map62_ZoneEvent0:
                
                 
                chkFlg  729             ; ???
                bne.s   return_5C84A
                chkFlg  256             ; TEMP FLAG #00
                bne.s   return_5C84A
                script  cs_5C876
                setFlg  256             ; TEMP FLAG #00
return_5C84A:
                
                rts

    ; End of function Map62_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map62_ZoneEvent2:
                
                 
                chkFlg  729             ; ???
                bne.s   Map62_DefaultZoneEvent
                chkFlg  256             ; TEMP FLAG #00
                beq.s   Map62_DefaultZoneEvent
                chkFlg  257             ; TEMP FLAG #01
                bne.s   Map62_DefaultZoneEvent
                script  cs_5C8FE
                setFlg  257             ; TEMP FLAG #01
Map62_DefaultZoneEvent:
                
                rts

    ; End of function Map62_ZoneEvent2

