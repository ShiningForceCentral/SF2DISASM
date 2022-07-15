
; ASM FILE data\maps\entries\map69\mapsetups\s3_zoneevents.asm :
; 0x4FDA2..0x4FDD2 : 
ms_map69_ZoneEvents:
                msZoneEvent 23, 255, Map69_ZoneEvent0-ms_map69_ZoneEvents
                msZoneEvent 24, 255, Map69_ZoneEvent0-ms_map69_ZoneEvents
                msZoneEvent 25, 255, Map69_ZoneEvent0-ms_map69_ZoneEvents
                msDefaultZoneEvent Map69_DefaultZoneEvent-ms_map69_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map69_ZoneEvent0:
                
                move.w  #$11,d0
                jsr     CheckRandomBattle
                rts

    ; End of function Map69_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map69_DefaultZoneEvent:
                
                 
                chkFlg  509             ; Battle 9 completed - BATTLE_TO_RIBBLE                    
                bne.s   return_4FDD0
                setFlg  409             ; Battle 9 unlocked - BATTLE_TO_RIBBLE                 
                move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_4FDD0:
                
                rts

    ; End of function Map69_DefaultZoneEvent

