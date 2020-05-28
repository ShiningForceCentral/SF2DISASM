
; ASM FILE data\maps\entries\map03\mapsetups\s3_zoneevents_261.asm :
; 0x50EEA..0x50F0C : 
ms_map3_flag261_ZoneEvents:
                msZoneEvent 2, 23, Map3_261_ZoneEvent0-ms_map3_flag261_ZoneEvents
                msZoneEvent 2, 255, Map3_261_ZoneEvent1-ms_map3_flag261_ZoneEvents
                msDefaultZoneEvent (Map3_DefaultZoneEvent-ms_map3_flag261_ZoneEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

Map3_261_ZoneEvent1:
                
                 
                chkFlg  $3              ; Jaha joined
                bne.s   Map3_261_ZoneEvent0
                script  cs_516A8
                setFlg  $192            ; Battle 2 unlocked
                clrFlg  $42             ; Sarah + Chester are followers
Map3_261_ZoneEvent0:
                
                rts

    ; End of function Map3_261_ZoneEvent1

