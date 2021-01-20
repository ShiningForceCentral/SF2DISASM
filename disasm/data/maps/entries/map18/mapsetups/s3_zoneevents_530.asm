
; ASM FILE data\maps\entries\map18\mapsetups\s3_zoneevents_530.asm :
; 0x6125A..0x61278 : 
ms_map18_flag530_ZoneEvents:
                msZoneEvent 255, 22, Map18_212_ZoneEvent0-ms_map18_flag530_ZoneEvents
                msDefaultZoneEvent Map18_212_DefaultZoneEvent-ms_map18_flag530_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map18_212_ZoneEvent0:
                
                 
                chkFlg  76              ; Zynk is a follower
                beq.s   Map18_212_DefaultZoneEvent
                script  cs_6143C
                clrFlg  76              ; Zynk is a follower
                setFlg  921             ; Set after Zynk leaves you at the Galam Drawbridge (for Roft/Petro death scene)
Map18_212_DefaultZoneEvent:
                
                rts

    ; End of function Map18_212_ZoneEvent0

