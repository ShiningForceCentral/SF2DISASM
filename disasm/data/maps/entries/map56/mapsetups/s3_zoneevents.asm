
; ASM FILE data\maps\entries\map56\mapsetups\s3_zoneevents.asm :
; 0x614D6..0x614FE : 
ms_map56_ZoneEvents:
                msZoneEvent 43, 40, Map56_ZoneEvent0-ms_map56_ZoneEvents
                msDefaultZoneEvent Map56_DefaultZoneEvent-ms_map56_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map56_ZoneEvent0:
                
                 
                chkFlg  $388            ; Will be set with the 0387, but only if the event isn't triggered by speaking
                bne.s   Map56_DefaultZoneEvent
                chkFlg  $387            ; Set after the first time you talk to Creed on path up Ancient Tower
                bne.s   byte_614F4      
                script  cs_6150A
                setFlg  $387            ; Set after the first time you talk to Creed on path up Ancient Tower
byte_614F4:
                
                setFlg  $1B9            ; Battle 41 unlocked
                setFlg  $388            ; Will be set with the 0387, but only if the event isn't triggered by speaking
Map56_DefaultZoneEvent:
                
                rts

    ; End of function Map56_ZoneEvent0

