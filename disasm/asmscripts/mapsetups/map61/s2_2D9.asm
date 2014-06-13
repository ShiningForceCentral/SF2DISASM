
; SCRIPT SECTION mapsetups\map61\s2_2D9 :
; 
ms_map61_flag2D9_EntityEvents:
										dc.b $80
										dc.b 3
										dc.w off_5C67A-ms_map61_flag2D9_EntityEvents
										dc.w $FD00
										dc.w return_5C694-ms_map61_flag2D9_EntityEvents
off_5C67A:          dc.w word_612E8+1-ms_map52_flag200_EntityEvents
										dc.b 1
										dc.b 0
										dc.w byte_62AAC-ms_map52_flag200_EntityEvents
										trap    #5
										dc.w loc_5D2E0+5-ms_map52_flag200_EntityEvents
										trap    #5
										dc.w return_5D2E6-ms_map52_flag200_EntityEvents
										trap    #5
										dc.w return_5D2E6+1-ms_map52_flag200_EntityEvents
										trap    #5
										dc.w nullsub_131-ms_map52_flag200_EntityEvents
										trap    #2
										dc.w byte_5C5A8-ms_map52_flag200_EntityEvents
return_5C694:       rts
