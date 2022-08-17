
; ASM FILE data\maps\entries\map10\mapsetups\s3_zoneevents_722.asm :
; 0x56FC0..0x56FE0 : 
ms_map10_flag722_ZoneEvents:
                msZoneEvent 6, 23, Map10_2D2_ZoneEvent0-ms_map10_flag722_ZoneEvents
                msDefaultZoneEvent (Map10_DefaultZoneEvent-ms_map10_flag722_ZoneEvents) & $FFFF

; =============== S U B R O U T I N E =======================================


Map10_2D2_ZoneEvent0:
                
                 
                chkFlg  13              ; Elric joined
                bne.s   return_56FDE
                chkFlg  724             ; Set after the scene where Skreech falls in Bedoe
                bne.s   return_56FDE
                script  cs_5779C
                setFlg  724             ; Set after the scene where Skreech falls in Bedoe
return_56FDE:
                
                rts

    ; End of function Map10_2D2_ZoneEvent0

