
; ASM FILE data\maps\entries\map19\mapsetups\s3_zoneevents_507.asm :
; 0x52DA4..0x52E02 : 
ms_map19_flag507_ZoneEvents:
                msZoneEvent 16, 5, Map19_1FB_ZoneEvent0-ms_map19_flag507_ZoneEvents
                msZoneEvent 25, 13, Map19_1FB_ZoneEvent1-ms_map19_flag507_ZoneEvents
                msZoneEvent 25, 14, Map19_1FB_ZoneEvent1-ms_map19_flag507_ZoneEvents
                msDefaultZoneEvent Map19_DefaultZoneEvent-ms_map19_flag507_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map19_DefaultZoneEvent:
                
                rts

    ; End of function Map19_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================


Map19_1FA_ZoneEvent0:
                
                 
                chkFlg  620             ; Set after Astral talks Lemon into heading to the Ancient Tower
                bne.s   return_52DC6
                script  cs_534D2
                setFlg  620             ; Set after Astral talks Lemon into heading to the Ancient Tower
return_52DC6:
                
                rts

    ; End of function Map19_1FA_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map19_1FA_ZoneEvent1:
                
                 
                chkFlg  621             ; Set after stepping in front of the Minister
                bne.s   return_52DDC
                script  cs_535FA
                setFlg  83              ; King + Minister are followers
                setFlg  621             ; Set after stepping in front of the Minister
return_52DDC:
                
                rts

    ; End of function Map19_1FA_ZoneEvent1


; =============== S U B R O U T I N E =======================================


Map19_1FB_ZoneEvent0:
                
                 
                chkFlg  622             ; Set after Astral delivers an "oh crap, earthquake" line in the castle
                bne.s   return_52DEE
                script  cs_53620
                setFlg  622             ; Set after Astral delivers an "oh crap, earthquake" line in the castle
return_52DEE:
                
                rts

    ; End of function Map19_1FB_ZoneEvent0


; =============== S U B R O U T I N E =======================================


Map19_1FB_ZoneEvent1:
                
                 
                chkFlg  623             ; Set after Astral delivers his "should be safe" line in castle
                bne.s   return_52E00
                script  cs_5362A
                setFlg  623             ; Set after Astral delivers his "should be safe" line in castle
return_52E00:
                
                rts

    ; End of function Map19_1FB_ZoneEvent1

