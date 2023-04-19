
; ASM FILE data\maps\entries\map20\mapsetups\s3_zoneevents_501.asm :
; 0x53766..0x537AC : 
ms_map20_flag501_ZoneEvents:
                msZoneEvent 27, 52, Map20_1F5_ZoneEvent0-ms_map20_flag501_ZoneEvents
                msDefaultZoneEvent Map20_DefaultZoneEvent-ms_map20_flag501_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map20_1F5_ZoneEvent0:
                
                moveq   #1,d0
                jsr     j_GetMaxHP
                jsr     j_SetCurrentHP
                jsr     j_GetMaxMP
                jsr     j_SetCurrentMP
                moveq   #2,d0
                jsr     j_GetMaxHP
                jsr     j_SetCurrentHP
                jsr     j_GetMaxMP
                jsr     j_SetCurrentMP
                script  cs_53B66
                rts

    ; End of function Map20_1F5_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map20_DefaultZoneEvent:
                
                rts

    ; End of function Map20_DefaultZoneEvent

