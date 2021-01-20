
; ASM FILE data\maps\entries\map08\mapsetups\s3_zoneevents.asm :
; 0x561AE..0x561EC : 
ms_map8_ZoneEvents:
                msZoneEvent 15, 28, Map8_ZoneEvent0-ms_map8_ZoneEvents
                msZoneEvent 16, 28, Map8_ZoneEvent0-ms_map8_ZoneEvents
                msZoneEvent 14, 8, Map8_ZoneEvent2-ms_map8_ZoneEvents
                msDefaultZoneEvent Map8_DefaultZoneEvent-ms_map8_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map8_ZoneEvent0:
                
                 
                chkFlg  708             ; Set after the scene in Ribble where the mayor confronts Bowie
                bne.s   return_561D8
                chkFlg  258             ; TEMP FLAG #02
                bne.s   return_561D8
                script  cs_563B2
                setFlg  703             ; Set after the scene where Bowie brings the plank above deck, also set after the initial Ribble scene, where the guy runs away
                setFlg  258             ; TEMP FLAG #02
return_561D8:
                
                rts

    ; End of function Map8_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map8_ZoneEvent2:
                
                 
                chkFlg  708             ; Set after the scene in Ribble where the mayor confronts Bowie
                bne.s   Map8_DefaultZoneEvent
                script  cs_56422
                setFlg  708             ; Set after the scene in Ribble where the mayor confronts Bowie
Map8_DefaultZoneEvent:
                
                rts

    ; End of function Map8_ZoneEvent2

