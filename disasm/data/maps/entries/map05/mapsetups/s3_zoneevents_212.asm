
; ASM FILE data\maps\entries\map05\mapsetups\s3_zoneevents_212.asm :
; 0x604C8..0x60548 : 
ms_map5_flag212_ZoneEvents:
                msZoneEvent 11, 8, Map5_212_ZoneEvent0-ms_map5_flag212_ZoneEvents
                msZoneEvent 255, 42, Map5_212_ZoneEvent1-ms_map5_flag212_ZoneEvents
                msDefaultZoneEvent Map5_212_DefaultZoneEvent-ms_map5_flag212_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map5_212_DefaultZoneEvent:
                
                rts

    ; End of function Map5_212_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================

Map5_212_ZoneEvent0:
                
                 
                chkFlg  $3AC            ; Set after playing the piano in Yeel (during the late game)
                beq.s   return_60500
                chkFlg  $3AD            ; Set after Chaz and the priest go downstars in Yeel
                bne.s   return_60500
                script  cs_6093A
                chkFlg  $3A2            ; Set after opening Devil's Head with the Force Sword
                beq.s   byte_604F6
                script  cs_60BA6
                bra.s   byte_604FC      
byte_604F6:
                
                script  cs_60B10
byte_604FC:
                
                setFlg  $3AD            ; Set after Chaz and the priest go downstars in Yeel
return_60500:
                
                rts

    ; End of function Map5_212_ZoneEvent0


; =============== S U B R O U T I N E =======================================

Map5_212_ZoneEvent1:
                
                 
                chkFlg  $1C             ; Lemon joined
                bne.s   return_6051C
                chkFlg  $1B             ; Chaz joined
                beq.s   return_6051C
                script  cs_60708
                setFlg  $47             ; Lemon is a follower
                setFlg  $3B1            ; Set after recruiting Lemon in Yeel
return_6051C:
                
                rts

    ; End of function Map5_212_ZoneEvent1


; =============== S U B R O U T I N E =======================================

; unused descriptions which look similar to the default ones for map 5

sub_6051E:
                
                move.w  #$FDD,d3
                lea     byte_6052E(pc), a0
                nop
                jmp     DisplayAreaDescription

    ; End of function sub_6051E

byte_6052E:     dc.b 9
                dc.b $F
                dc.b 0
                dc.b 0
                dc.b 6
                dc.b 0
                dc.b $A
                dc.b $10
                dc.b 0
                dc.b 0
                dc.b 4
                dc.b 1
                dc.b $B
                dc.b $10
                dc.b 0
                dc.b 0
                dc.b 4
                dc.b 2
                dc.b $16
                dc.b $B
                dc.b 0
                dc.b 0
                dc.b 1
                dc.b 3
                dc.b $FD
                dc.b 0
