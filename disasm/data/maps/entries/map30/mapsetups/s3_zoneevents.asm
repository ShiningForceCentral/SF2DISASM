
; ASM FILE data\maps\entries\map30\mapsetups\s3_zoneevents.asm :
; 0x5A2C2..0x5A2E8 : 
ms_map30_ZoneEvents:
                msZoneEvent 7, 13, Map30_ZoneEvent0-ms_map30_ZoneEvents
                msDefaultZoneEvent Map30_DefaultZoneEvent-ms_map30_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map30_ZoneEvent0:
                
                 
                chkFlg  69              ; Fairy is a follower
                beq.s   Map30_DefaultZoneEvent
                chkFlg  760             ; Set after the fairy cures the sick dwarf in the mine
                bne.s   Map30_DefaultZoneEvent
                script  cs_5A33A
                bsr.s   sub_5A278
                setFlg  760             ; Set after the fairy cures the sick dwarf in the mine
                clrFlg  69              ; Fairy is a follower
Map30_DefaultZoneEvent:
                
                rts

    ; End of function Map30_ZoneEvent0

