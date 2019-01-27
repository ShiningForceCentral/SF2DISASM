
; ASM FILE data\maps\entries\map20\mapsetups\s3_1F5.asm :
; 0x53766..0x537AC : 
ms_map20_flag1F5_ZoneEvents:
		dc.b $1B
		dc.b $34
		dc.w sub_5376E-ms_map20_flag1F5_ZoneEvents
		dc.w $FD00
		dc.w nullsub_84-ms_map20_flag1F5_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5376E:
		moveq   #1,d0
		jsr     j_GetMaxHP
		jsr     j_SetCurrentHP
		jsr     j_GetMaxMP
		jsr     j_SetCurrentMP
		moveq   #2,d0
		jsr     j_GetMaxHP
		jsr     j_SetCurrentHP
		jsr     j_GetMaxMP
		jsr     j_SetCurrentMP
		script  cs_53B66
		rts

	; End of function sub_5376E


; =============== S U B R O U T I N E =======================================

nullsub_84:
		rts

	; End of function nullsub_84

