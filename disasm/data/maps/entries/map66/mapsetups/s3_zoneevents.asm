
; ASM FILE data\maps\entries\map66\mapsetups\s3_zoneevents.asm :
; 0x4FA90..0x4FAE0 : 
ms_map66_ZoneEvents:
                msZoneEvent 255, 9, Map66_ZoneEvent0-ms_map66_ZoneEvents
                msZoneEvent 255, 10, Map66_ZoneEvent0-ms_map66_ZoneEvents
                msZoneEvent 255, 28, Map66_ZoneEvent2-ms_map66_ZoneEvents
                msDefaultZoneEvent Map66_DefaultZoneEvent-ms_map66_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map66_ZoneEvent0:
                
                 
                chkFlg  537             ; Battle 37 completed - BATTLE_VERSUS_RED_BARON            
                beq.s   return_4FAB8
                chkFlg  538             ; Battle 38 completed - BATTLE_VERSUS_GESHP                
                bne.s   return_4FAB8
                setFlg  438             ; Battle 38 unlocked - BATTLE_VERSUS_GESHP              
                move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_4FAB8:
                
                rts

    ; End of function Map66_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map66_ZoneEvent2:
                
                 
                chkFlg  538             ; Battle 38 completed - BATTLE_VERSUS_GESHP                
                beq.s   return_4FAD2
                chkFlg  539             ; Battle 39 completed - BATTLE_TO_ANCIENT_SHRINE           
                bne.s   return_4FAD2
                setFlg  439             ; Battle 39 unlocked - BATTLE_TO_ANCIENT_SHRINE         
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

