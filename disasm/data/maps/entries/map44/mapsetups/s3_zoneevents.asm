
; ASM FILE data\maps\entries\map44\mapsetups\s3_zoneevents.asm :
; 0x54458..0x5445E : 
ms_map44_ZoneEvents:
                dc.w $FD00
                dc.w byte_54868+4-ms_map44_ZoneEvents ; bug : points inside cutscene entity list

; =============== S U B R O U T I N E =======================================


nullsub_5445C:
                
                rts

    ; End of function nullsub_5445C

