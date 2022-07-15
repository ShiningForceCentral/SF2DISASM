
; ASM FILE data\maps\entries\map77\mapsetups\s3_zoneevents.asm :
; 0x50A6A..0x50A84 : 
ms_map77_ZoneEvents:
                msDefaultZoneEvent Map77_DefaultZoneEvent-ms_map77_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map77_DefaultZoneEvent:
                
                 
                chkFlg  537             ; Battle 37 completed - BATTLE_VERSUS_RED_BARON            
                bne.s   return_50A80
                setFlg  437             ; Battle 37 unlocked - BATTLE_VERSUS_RED_BARON          
                move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_50A80:
                
                rts

    ; End of function Map77_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================


nullsub_50A82:
                
                rts

    ; End of function nullsub_50A82

