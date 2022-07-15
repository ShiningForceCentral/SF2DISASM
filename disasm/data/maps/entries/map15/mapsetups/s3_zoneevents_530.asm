
; ASM FILE data\maps\entries\map15\mapsetups\s3_zoneevents_530.asm :
; 0x5CFFE..0x5D020 : 
ms_map15_flag530_ZoneEvents:
                msZoneEvent 24, 18, Map15_212_ZoneEvent0-ms_map15_flag530_ZoneEvents
                msDefaultZoneEvent Map15_DefaultZoneEvent-ms_map15_flag530_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map15_DefaultZoneEvent:
                
                rts

    ; End of function Map15_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================


Map15_212_ZoneEvent0:
                
                 
                chkFlg  724             ; Set after the scene where Skreech falls in Bedoe
                beq.s   return_5D01E
                chkFlg  820             ; Set after Skreech's join scene has played in Tristan
                bne.s   return_5D01E
                script  cs_5D04E
                setFlg  820             ; Set after Skreech's join scene has played in Tristan
return_5D01E:
                
                rts

    ; End of function Map15_212_ZoneEvent0

