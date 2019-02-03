
; ASM FILE data\maps\entries\map10\mapsetups\s3_zoneevents.asm :
; 0x56F8A..0x56FC0 : 
ms_map10_ZoneEvents:
                msZoneEvent 29, 255, Map10_ZoneEvent0-ms_map10_ZoneEvents
                msZoneEvent 33, 255, Map10_ZoneEvent1-ms_map10_ZoneEvents
                msZoneEvent 31, 53, Map10_ZoneEvent1-ms_map10_ZoneEvents
                msDefaultZoneEvent 0, nullsub_74-ms_map10_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_74:
                
                rts

	; End of function nullsub_74


; =============== S U B R O U T I N E =======================================

Map10_ZoneEvent0:
                
                 
                chkFlg  $2D0            ; set after the King of Bedoe speaks to his soldiers and they disperse
                bne.s   return_56FAC
                script  cs_573EC
                setFlg  $2D0            ; set after the King of Bedoe speaks to his soldiers and they disperse
return_56FAC:
                
                rts

	; End of function Map10_ZoneEvent0


; =============== S U B R O U T I N E =======================================

Map10_ZoneEvent1:
                
                 
                chkFlg  $2D1            ; set after you approach the King of Bedoe, starts with Luke speaking to Peter
                bne.s   return_56FBE
                script  cs_574A6
                setFlg  $2D1            ; set after you approach the King of Bedoe, starts with Luke speaking to Peter
return_56FBE:
                
                rts

	; End of function Map10_ZoneEvent1

