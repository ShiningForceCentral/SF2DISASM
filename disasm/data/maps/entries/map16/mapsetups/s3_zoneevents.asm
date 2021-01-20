
; ASM FILE data\maps\entries\map16\mapsetups\s3_zoneevents.asm :
; 0x51EE4..0x51F2A : 
ms_map16_ZoneEvents:
                msZoneEvent 17, 255, Map16_ZoneEvent0-ms_map16_ZoneEvents
                msZoneEvent 3, 255, Map16_ZoneEvent1-ms_map16_ZoneEvents
                msDefaultZoneEvent Map16_DefaultZoneEvent-ms_map16_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map16_ZoneEvent0:
                
                 
                chkFlg  663             ; Set after Galam and Lemon leave with their army
                bne.s   return_51F00
                script  cs_51F88
                setFlg  663             ; Set after Galam and Lemon leave with their army
return_51F00:
                
                rts

    ; End of function Map16_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map16_ZoneEvent1:
                
                 
                chkFlg  505             ; Battle 5 completed - BATTLE_GALAM_CASTLE                 
                bne.s   return_51F26
                move.b  #$10,((EGRESS_MAP_INDEX-$1000000)).w
                chkFlg  664             ; Set after the Galam guards catch you sneaking around, but before battle
                bne.s   byte_51F20
                script  cs_521BA
                setFlg  664             ; Set after the Galam guards catch you sneaking around, but before battle
                bra.s   return_51F26
byte_51F20:
                
                script  cs_5227C
return_51F26:
                
                rts

    ; End of function Map16_ZoneEvent1


; =============== S U B R O U T I N E =======================================


Map16_DefaultZoneEvent:
                
                rts

    ; End of function Map16_DefaultZoneEvent

