
; ASM FILE data\maps\entries\map21\mapsetups\s3.asm :
; 0x53E8C..0x53E92 : 
ms_map21_ZoneEvents:
		dc.w $FD00
		dc.w byte_545B6-ms_map21_ZoneEvents
						; bug : points inside cutscene
		dc.b $4E 
		dc.b $75 
