
; ASM FILE data\maps\entries\map34\mapsetups\s3_zoneevents.asm :
; 0x5B696..0x5B6B4 : 
ms_map34_ZoneEvents:
                msZoneEvent 255, 13, Map34_ZoneEvent0-ms_map34_ZoneEvents
                msDefaultZoneEvent Map34_DefaultZoneEvent-ms_map34_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map34_ZoneEvent0:
                
                 
                chkFlg  784             ; Set after the event in the basement of Creed's Mansion
                bne.s   Map34_DefaultZoneEvent
                script  cs_5B6C0
                setFlg  784             ; Set after the event in the basement of Creed's Mansion
                setFlg  802             ; Set after the event in the basement of Creed's Mansion
Map34_DefaultZoneEvent:
                
                rts

    ; End of function Map34_ZoneEvent0

