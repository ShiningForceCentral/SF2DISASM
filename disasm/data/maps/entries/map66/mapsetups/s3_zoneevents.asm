
; ASM FILE data\maps\entries\map66\mapsetups\s3_zoneevents.asm :
; 0x4FA90..0x4FAE0 : 
ms_map66_ZoneEvents:
                msZoneEvent 255, 9, Map66_ZoneEvent0-ms_map66_ZoneEvents
                msZoneEvent 255, 10, Map66_ZoneEvent0-ms_map66_ZoneEvents
                msZoneEvent 255, 28, Map66_ZoneEvent2-ms_map66_ZoneEvents
                msDefaultZoneEvent Map66_DefaultZoneEvent-ms_map66_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map66_ZoneEvent0:
                
                 
                chkFlg  $219            ; Battle 37 completed
                beq.s   return_4FAB8
                chkFlg  $21A            ; Battle 38 completed
                bne.s   return_4FAB8
                setFlg  $1B6            ; Battle 38 unlocked
                move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_4FAB8:
                
                rts

    ; End of function Map66_ZoneEvent0


; =============== S U B R O U T I N E =======================================

Map66_ZoneEvent2:
                
                 
                chkFlg  $21A            ; Battle 38 completed
                beq.s   return_4FAD2
                chkFlg  $21B            ; Battle 39 completed
                bne.s   return_4FAD2
                setFlg  $1B7            ; Battle 39 unlocked
                move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_4FAD2:
                
                rts

    ; End of function Map66_ZoneEvent2


; =============== S U B R O U T I N E =======================================

Map66_DefaultZoneEvent:
                
                move.w  #3,d0           ; flag $1F7 : Battle 3 completed
                jsr     CheckRandomBattle
                rts

    ; End of function Map66_DefaultZoneEvent

