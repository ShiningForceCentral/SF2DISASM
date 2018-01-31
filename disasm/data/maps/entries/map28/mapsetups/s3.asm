
; ASM FILE data\maps\entries\map28\mapsetups\s3.asm :
; 0x5F36C..0x5F396 : 
ms_map28_ZoneEvents:
		dc.w $FD00
		dc.w sub_5F370-ms_map28_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5F370:
		trap    #VINT_FUNCTIONS
		dc.w VINTS_ACTIVATE
		dc.l VInt_UpdateEntities
		clr.w   d0
		jsr     WaitForEntityToStopMoving
		tst.b   ((ENTITY_FACING-$1000000)).w
		bne.s   loc_5F38E
		lea     cs_5F3A2(pc), a0
		trap    #MAPSCRIPT
		bra.s   return_5F394
loc_5F38E:
		lea     cs_5F3C4(pc), a0
		trap    #MAPSCRIPT
return_5F394:
		rts

	; End of function sub_5F370

