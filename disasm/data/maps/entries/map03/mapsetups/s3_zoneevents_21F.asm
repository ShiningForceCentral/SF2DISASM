
; ASM FILE data\maps\entries\map03\mapsetups\s3_zoneevents_21F.asm :
; 0x62820..0x62846 : 
ms_map3_flag21F_ZoneEvents:
                msZoneEvent 2, 255, Map3_21F_ZoneEvent0-ms_map3_flag21F_ZoneEvents
                msDefaultZoneEvent Map3_21F_DefaultZoneEvent-ms_map3_flag21F_ZoneEvents

; =============== S U B R O U T I N E =======================================

Map3_21F_DefaultZoneEvent:
                
                rts

    ; End of function Map3_21F_DefaultZoneEvent


; =============== S U B R O U T I N E =======================================

Map3_21F_ZoneEvent0:
                
                 
                script  cs_6283E
                txt     $F48            ; "Wait, wait!{W2}"
                txt     $F49            ; "Sir Astral told me not to{N}let you go out today!{W2}"
                txt     $F4A            ; "You have to be here.{W1}"
                rts

    ; End of function Map3_21F_ZoneEvent0

cs_6283E:       moveNextToPlayer 137,LEFT
                csc_end
