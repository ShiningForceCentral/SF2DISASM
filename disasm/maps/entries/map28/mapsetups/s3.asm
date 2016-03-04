
; SCRIPT SECTION maps\entries\map28\mapsetups\s3 :
; 
ms_map28_Section3:  dc.w $FD00
										dc.w sub_5F370-ms_map28_Section3

; =============== S U B R O U T I N E =======================================

sub_5F370:
										
										trap    #9
										dc.w 4
										dc.l VInt_UpdateEntities
										clr.w   d0
										jsr     WaitForEntityToStopMoving
										tst.b   ((ENTITY_DATA_STRUCT_FACING-$1000000)).w
										bne.s   loc_5F38E
										lea     cs_5F3A2(pc), a0
										trap    #6
										bra.s   return_5F394
loc_5F38E:
										
										lea     cs_5F3C4(pc), a0
										trap    #6
return_5F394:
										
										rts

	; End of function sub_5F370

