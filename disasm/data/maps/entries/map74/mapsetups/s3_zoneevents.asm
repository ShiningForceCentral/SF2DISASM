
; ASM FILE data\maps\entries\map74\mapsetups\s3_zoneevents.asm :
; 0x50984..0x509C6 : 
ms_map74_ZoneEvents:
                msZoneEvent 255, 61, Map74_ZoneEvent0-ms_map74_ZoneEvents
                msDefaultZoneEvent Map74_DefaultZoneEvent-ms_map74_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map74_ZoneEvent0:
                
                 
                chkFlg  527             ; Battle 27 completed - BATTLE_TO_TRISTAN                  
                bne.s   byte_509AC      
                setFlg  427             ; Battle 27 unlocked - BATTLE_TO_TRISTAN                
                move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
                setFlg  428             ; Battle 28 unlocked - BATTLE_PANGOAT_VALLEY_BRIDGE     
                setFlg  429             ; Battle 29 unlocked - BATTLE_OUTSIDE_MITULA_SHRINE     
                setFlg  430             ; Battle 30 unlocked - BATTLE_VERSUS_ZALBARD            
                bra.s   Map74_DefaultZoneEvent
byte_509AC:
                
                chkFlg  811             ; Set after Frayja asks to go to Moun with you
                beq.s   Map74_DefaultZoneEvent
                chkFlg  532             ; Battle 32 completed - BATTLE_TO_MOUN                     
                bne.s   Map74_DefaultZoneEvent
                setFlg  432             ; Battle 32 unlocked - BATTLE_TO_MOUN                   
                move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
Map74_DefaultZoneEvent:
                
                rts

    ; End of function Map74_ZoneEvent0

