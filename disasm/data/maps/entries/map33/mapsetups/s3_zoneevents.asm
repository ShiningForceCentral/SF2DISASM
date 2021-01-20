
; ASM FILE data\maps\entries\map33\mapsetups\s3_zoneevents.asm :
; 0x5AA8A..0x5AAD8 : 
ms_map33_ZoneEvents:
                msZoneEvent 15, 21, Map33_ZoneEvent0-ms_map33_ZoneEvents
                msZoneEvent 12, 14, Map33_ZoneEvent1-ms_map33_ZoneEvents
                msDefaultZoneEvent Map33_DefaultZoneEvent-ms_map33_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map33_DefaultZoneEvent:
                
                rts

    ; End of function Map33_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================


Map33_ZoneEvent0:
                
                 
                chkFlg  774             ; Set after the first scene with Goliath at Creed's Mansion
                bne.s   byte_5AAAA      
                script  cs_5AC58
                setFlg  774             ; Set after the first scene with Goliath at Creed's Mansion
                bra.s   return_5AAC8
byte_5AAAA:
                
                chkFlg  785             ; Set after the fairy tags along at Creed's
                beq.s   return_5AAC8
                chkFlg  786             ; Set after Oddler elects to stay behind at Creed's Mansion
                bne.s   return_5AAC8
                script  cs_5B466
                setFlg  786             ; Set after Oddler elects to stay behind at Creed's Mansion
                setFlg  69              ; Fairy is a follower
                clrFlg  68              ; Oddler is a follower
return_5AAC8:
                
                rts

    ; End of function Map33_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map33_ZoneEvent1:
                
                 
                chkFlg  783             ; Set after the scene where Creed restores the Force and heads down the basement
                bne.s   return_5AAD6
                script  cs_5AF36
return_5AAD6:
                
                rts

    ; End of function Map33_ZoneEvent1

