
; ASM FILE data\maps\entries\map11\mapsetups\s3_zoneevents.asm :
; 0x57A68..0x57A88 : 
ms_map11_ZoneEvents:
                msZoneEvent 39, 11, Map11_ZoneEvent0-ms_map11_ZoneEvents
                msDefaultZoneEvent Map11_DefaultZoneEvent-ms_map11_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map11_DefaultZoneEvent:
                
                rts

    ; End of function Map11_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================


Map11_ZoneEvent0:
                
                 
                chkFlg  722             ; Set after speaking with Volcanon
                bne.s   return_57A86
                script  cs_57AAA
                setFlg  722             ; Set after speaking with Volcanon
                setFlg  711             ; Set after you dislodge the turtle/fairy in Polca, also set after you speak to Volcanon
return_57A86:
                
                rts

    ; End of function Map11_ZoneEvent0

