
; ASM FILE data\maps\entries\map42\mapsetups\s3_zoneevents.asm :
; 0x5FE04..0x5FE24 : 
ms_map42_ZoneEvents:
                msZoneEvent 19, 21, Map42_ZoneEvent0-ms_map42_ZoneEvents
                msDefaultZoneEvent Map42_DefaultZoneEvent-ms_map42_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map42_ZoneEvent0:
                
                 
                chkFlg  999             ; Set after the Nazca ship shootdown scene
                beq.s   Map42_DefaultZoneEvent
                chkFlg  901             ; Set after the you're pulled toward the Force Sword in the Jewel Cave
                bne.s   Map42_DefaultZoneEvent
                script  cs_5FE9A
                setFlg  901             ; Set after the you're pulled toward the Force Sword in the Jewel Cave
Map42_DefaultZoneEvent:
                
                rts

    ; End of function Map42_ZoneEvent0

