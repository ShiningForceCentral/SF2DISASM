
; ASM FILE data\maps\entries\map31\mapsetups\s3_zoneevents_830.asm :
; 0x5D556..0x5D574 : 
ms_map31_flag830_ZoneEvents:
                msZoneEvent 5, 2, Map31_33E_ZoneEvent0-ms_map31_flag830_ZoneEvents
                msDefaultZoneEvent Map31_DefaultZoneEvent-ms_map31_flag830_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map31_DefaultZoneEvent:
                
                rts

    ; End of function Map31_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================


Map31_33E_ZoneEvent0:
                
                 
                chkFlg  834             ; Set after making the Arm of Golem appear in Moun
                bne.s   return_5D570
                script  cs_5D644
                setFlg  834             ; Set after making the Arm of Golem appear in Moun
return_5D570:
                
                rts

    ; End of function Map31_33E_ZoneEvent0


; =============== S U B R O U T I N E =======================================


nullsub_5D572:
                
                rts

    ; End of function nullsub_5D572

