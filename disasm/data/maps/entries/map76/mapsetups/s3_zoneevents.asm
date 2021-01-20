
; ASM FILE data\maps\entries\map76\mapsetups\s3_zoneevents.asm :
; 0x50A24..0x50A3E : 
ms_map76_ZoneEvents:
                msDefaultZoneEvent Map76_DefaultZoneEvent-ms_map76_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map76_DefaultZoneEvent:
                
                 
                chkFlg  535             ; Battle 35 completed - BATTLE_TO_ROFT                     
                bne.s   return_50A3A
                setFlg  435             ; Battle 35 unlocked - BATTLE_TO_ROFT                   
                move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_50A3A:
                
                rts

    ; End of function Map76_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================


nullsub_50A3C:
                
                rts

    ; End of function nullsub_50A3C

