
; ASM FILE data\maps\entries\map09\mapsetups\s3_zoneevents.asm :
; 0x56856..0x5687A : 
ms_map9_ZoneEvents:
                msZoneEvent 4, 57, Map9_ZoneEvent0-ms_map9_ZoneEvents
                msZoneEvent 4, 58, Map9_ZoneEvent0-ms_map9_ZoneEvents
                msZoneEvent 4, 59, Map9_ZoneEvent0-ms_map9_ZoneEvents
                msDefaultZoneEvent Map9_DefaultZoneEvent-ms_map9_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map9_ZoneEvent0:
                
                 
                chkFlg  726             ; Set after talking to the priest in upstairs Hassan
                bne.s   return_56876
                script  cs_568F6
                setFlg  726             ; Set after talking to the priest in upstairs Hassan
return_56876:
                
                rts

    ; End of function Map9_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map9_DefaultZoneEvent:
                
                rts

    ; End of function Map9_DefaultZoneEvent

