
; ASM FILE data\maps\entries\map68\mapsetups\s3_zoneevents.asm :
; 0x4FD6C..0x4FD7C : 
ms_map68_ZoneEvents:
                msDefaultZoneEvent Map68_DefaultZoneEvent-ms_map68_ZoneEvents

; =============== S U B R O U T I N E =======================================


Map68_DefaultZoneEvent:
                
                move.w  #$13,d0
                jsr     CheckRandomBattle
                rts

    ; End of function Map68_DefaultZoneEvent

