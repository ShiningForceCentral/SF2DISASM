
; ASM FILE data\maps\entries\map44\mapsetups\s3.asm :
; 0x54458..0x5445E : 
ms_map44_ZoneEvents:
		dc.w $FD00
		dc.w byte_54868+4-ms_map44_ZoneEvents
						; bug : points inside cutscene entity list
		dc.b $4E 
		dc.b $75 
