
; ASM FILE data\maps\entries\map22\mapsetups\s3_zoneevents.asm :
; 0x595DE..0x59602 : 
ms_map22_ZoneEvents:
                msZoneEvent 255, 16, Map22_ZoneEvent0-ms_map22_ZoneEvents
                msDefaultZoneEvent Map22_DefaultZoneEvent-ms_map22_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map22_DefaultZoneEvent:
                
                rts

    ; End of function Map22_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================


Map22_ZoneEvent0:
                
                 
                chkFlg  777             ; Set after the Desktop King tells you to fight on the chessboard
                beq.s   return_59600
                chkFlg  522             ; Battle 22 completed - BATTLE_CHESSBOARD                  
                bne.s   return_59600
                move.b  #$16,((EGRESS_MAP_INDEX-$1000000)).w
                script  cs_5994E
return_59600:
                
                rts

    ; End of function Map22_ZoneEvent0

