
; ASM FILE data\maps\entries\map74\mapsetups\s3_zoneevents.asm :
; 0x50984..0x509C6 : 
ms_map74_ZoneEvents:
                msZoneEvent 255, 61, Map74_ZoneEvent0-ms_map74_ZoneEvents
                msDefaultZoneEvent 0, return_509C4-ms_map74_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map74_ZoneEvent0:
                
                 
                chkFlg  $20F            ; Battle 27 completed
                bne.s   byte_509AC      
                setFlg  $1AB            ; Battle 27 unlocked
                move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
                setFlg  $1AC            ; Battle 28 unlocked
                setFlg  $1AD            ; Battle 29 unlocked
                setFlg  $1AE            ; Battle 30 unlocked
                bra.s   return_509C4
byte_509AC:
                
                chkFlg  $32B            ; set after Frayja asks to go to Moun with you
                beq.s   return_509C4
                chkFlg  $214            ; Battle 32 completed
                bne.s   return_509C4
                setFlg  $1B0            ; Battle 32 unlocked
                move.l  #$100FF,((MAP_EVENT_TYPE-$1000000)).w
return_509C4:
                
                rts

	; End of function Map74_ZoneEvent0

