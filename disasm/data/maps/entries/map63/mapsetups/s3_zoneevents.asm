
; ASM FILE data\maps\entries\map63\mapsetups\s3_zoneevents.asm :
; 0x5C9E2..0x5CA24 : 
ms_map63_ZoneEvents:
                msZoneEvent 15, 55, Map63_ZoneEvent0-ms_map63_ZoneEvents
                msZoneEvent 13, 42, Map63_ZoneEvent0-ms_map63_ZoneEvents
                msZoneEvent 10, 21, Map63_ZoneEvent2-ms_map63_ZoneEvents
                msZoneEvent 8, 7, Map63_ZoneEvent3-ms_map63_ZoneEvents
                msDefaultZoneEvent Map63_DefaultZoneEvent-ms_map63_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map63_ZoneEvent0:
                
                 
                chkFlg  256             ; TEMP FLAG #00
                bne.s   byte_5CA08
                script  cs_5CA6E
                setFlg  256             ; TEMP FLAG #00
                bra.s   return_5CA12
byte_5CA08:
                
                script  cs_5CB34
                clrFlg  256             ; TEMP FLAG #00
return_5CA12:
                
                rts

    ; End of function Map63_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map63_ZoneEvent2:
                
                 
                script  cs_5CC26
                rts

    ; End of function Map63_ZoneEvent2


; =============== S U B R O U T I N E =======================================


Map63_ZoneEvent3:
                
                 
                script  cs_5CCF6
Map63_DefaultZoneEvent:
                
                rts

    ; End of function Map63_ZoneEvent3

