
; ASM FILE data\maps\entries\map17\mapsetups\s3_zoneevents.asm :
; 0x523E4..0x52442 : 
ms_map17_ZoneEvents:
                msZoneEvent 53, 5, Map17_ZoneEvent0-ms_map17_ZoneEvents
                msZoneEvent 43, 9, Map17_ZoneEvent1-ms_map17_ZoneEvents
                msZoneEvent 57, 5, Map17_ZoneEvent2-ms_map17_ZoneEvents
                msDefaultZoneEvent Map17_DefaultZoneEvent-ms_map17_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map17_ZoneEvent0:
                
                 
                chkFlg  661             ; Set after prison scene, ending in Slade unlocking/Sarah accusing
                bne.s   return_52404
                script  cs_52530
                setFlg  661             ; Set after prison scene, ending in Slade unlocking/Sarah accusing
return_52404:
                
                rts

    ; End of function Map17_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map17_ZoneEvent1:
                
                 
                chkFlg  662             ; Set after you try to go upstairs, and Slade opens the secret tunnel
                bne.s   byte_5241E      
                script  cs_528D4
                script  cs_528CA
                setFlg  662             ; Set after you try to go upstairs, and Slade opens the secret tunnel
                bra.s   return_5242C
byte_5241E:
                
                txt     948             ; "You'll be captured if you go{N}that way.{W2}"
                txt     951             ; "Now, go out through this{N}short cut!{W1}"
                script  cs_528CA
return_5242C:
                
                rts

    ; End of function Map17_ZoneEvent1


; =============== S U B R O U T I N E =======================================


Map17_ZoneEvent2:
                
                 
                chkFlg  662             ; Set after you try to go upstairs, and Slade opens the secret tunnel
                beq.s   return_5243E
                script  cs_52938
                setFlg  73              ; Slade is a follower
return_5243E:
                
                rts

    ; End of function Map17_ZoneEvent2


; =============== S U B R O U T I N E =======================================


Map17_DefaultZoneEvent:
                
                rts

    ; End of function Map17_DefaultZoneEvent

