
; ASM FILE data\maps\entries\map27\mapsetups\s3_zoneevents.asm :
; 0x59F92..0x59FAC : 
ms_map27_ZoneEvents:
                msZoneEvent 255, 19, Map27_ZoneEvent0-ms_map27_ZoneEvents
                msDefaultZoneEvent Map27_DefaultZoneEvent-ms_map27_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map27_ZoneEvent0:
                
                 
                chkFlg  781             ; Set after the scene where you're surprised by Willard inside the wall
                bne.s   Map27_DefaultZoneEvent
                script  cs_59FB8
                setFlg  781             ; Set after the scene where you're surprised by Willard inside the wall
Map27_DefaultZoneEvent:
                
                rts

    ; End of function Map27_ZoneEvent0

