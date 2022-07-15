
; ASM FILE data\maps\entries\map06\mapsetups\s3_zoneevents.asm :
; 0x54CD0..0x54D3C : 
ms_map6_ZoneEvents:
                msZoneEvent 10, 9, Map6_ZoneEvent0-ms_map6_ZoneEvents
                msZoneEvent 11, 9, Map6_ZoneEvent0-ms_map6_ZoneEvents
                msZoneEvent 19, 23, Map6_ZoneEvent2-ms_map6_ZoneEvents
                msZoneEvent 19, 29, Map6_ZoneEvent3-ms_map6_ZoneEvents
                msZoneEvent 20, 29, Map6_ZoneEvent3-ms_map6_ZoneEvents
                msDefaultZoneEvent Map6_DefaultZoneEvent-ms_map6_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map6_ZoneEvent0:
                
                 
                chkFlg  706             ; Set after the scene with the sailor and soldier in New Granseal (Peter intro)
                bne.s   byte_54CFA      
                script  cs_54E86
                setFlg  706             ; Set after the scene with the sailor and soldier in New Granseal (Peter intro)
                bra.s   return_54D10
byte_54CFA:
                
                chkFlg  802             ; Set after the event in the basement of Creed's Mansion
                beq.s   return_54D10
                chkFlg  803             ; Set after returning to New Granseal, when the soldier greets you
                bne.s   return_54D10
                script  cs_55242
                setFlg  803             ; Set after returning to New Granseal, when the soldier greets you
return_54D10:
                
                rts

    ; End of function Map6_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map6_ZoneEvent2:
                
                 
                chkFlg  701             ; Set after the scene with Peter and the kids in New Granseal
                bne.s   return_54D22
                script  cs_54F26
                setFlg  701             ; Set after the scene with Peter and the kids in New Granseal
return_54D22:
                
                rts

    ; End of function Map6_ZoneEvent2


; =============== S U B R O U T I N E =======================================


Map6_ZoneEvent3:
                
                 
                chkFlg  805             ; Set after coming back to New Granseal after Creed's Mansion,when Astral joins
                beq.s   Map6_DefaultZoneEvent
                chkFlg  806             ; Set after the scene with Janet, when you go to leave New Granseal
                bne.s   Map6_DefaultZoneEvent
                script  cs_55288
                setFlg  806             ; Set after the scene with Janet, when you go to leave New Granseal
Map6_DefaultZoneEvent:
                
                rts

    ; End of function Map6_ZoneEvent3

