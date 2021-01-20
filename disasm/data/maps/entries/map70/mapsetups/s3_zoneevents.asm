
; ASM FILE data\maps\entries\map70\mapsetups\s3_zoneevents.asm :
; 0x4FDFE..0x4FE32 : 
ms_map70_ZoneEvents:
                msZoneEvent 16, 255, Map70_ZoneEvent0-ms_map70_ZoneEvents
                msZoneEvent 17, 255, Map70_ZoneEvent0-ms_map70_ZoneEvents
                msZoneEvent 18, 255, Map70_ZoneEvent0-ms_map70_ZoneEvents
                msZoneEvent 19, 255, Map70_ZoneEvent0-ms_map70_ZoneEvents
                msDefaultZoneEvent Map70_DefaultZoneEvent-ms_map70_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map70_ZoneEvent0:
                
                move.w  #$E,d0
                jsr     CheckRandomBattle
                rts

    ; End of function Map70_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map70_DefaultZoneEvent:
                
                 
                chkFlg  510             ; Battle 10 completed - BATTLE_TO_THE_EAST                 
                bne.s   return_4FE30
                setFlg  410             ; Battle 10 unlocked - BATTLE_TO_THE_EAST               
                move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_4FE30:
                
                rts

    ; End of function Map70_DefaultZoneEvent

