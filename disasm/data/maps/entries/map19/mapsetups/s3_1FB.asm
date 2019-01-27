
; ASM FILE data\maps\entries\map19\mapsetups\s3_1FB.asm :
; 0x52DA4..0x52E02 : 
ms_map19_flag1FB_ZoneEvents:
		dc.b $10
		dc.b 5
		dc.w sub_52DDE-ms_map19_flag1FB_ZoneEvents
		dc.b $19
		dc.b $D
		dc.w sub_52DF0-ms_map19_flag1FB_ZoneEvents
		dc.b $19
		dc.b $E
		dc.w sub_52DF0-ms_map19_flag1FB_ZoneEvents
		dc.w $FD00
		dc.w nullsub_82-ms_map19_flag1FB_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_82:
		rts

	; End of function nullsub_82


; =============== S U B R O U T I N E =======================================

sub_52DB6:
		 
		chkFlg $26C             ; set after Astral talks Lemon into heading to the Ancient Tower
		bne.s   return_52DC6
		script  cs_534D2
		setFlg $26C             ; set after Astral talks Lemon into heading to the Ancient Tower
return_52DC6:
		rts

	; End of function sub_52DB6


; =============== S U B R O U T I N E =======================================

sub_52DC8:
		 
		chkFlg $26D             ; set after stepping in front of the Minister
		bne.s   return_52DDC
		script  cs_535FA
		setFlg $53              ; King + Minister are followers
		setFlg $26D             ; set after stepping in front of the Minister
return_52DDC:
		rts

	; End of function sub_52DC8


; =============== S U B R O U T I N E =======================================

sub_52DDE:
		 
		chkFlg $26E             ; set after Astral delivers an "oh crap, earthquake" line in the castle
		bne.s   return_52DEE
		script  cs_53620
		setFlg $26E             ; set after Astral delivers an "oh crap, earthquake" line in the castle
return_52DEE:
		rts

	; End of function sub_52DDE


; =============== S U B R O U T I N E =======================================

sub_52DF0:
		 
		chkFlg $26F             ; set after Astral delivers his "should be safe" line in castle
		bne.s   return_52E00
		script  cs_5362A
		setFlg $26F             ; set after Astral delivers his "should be safe" line in castle
return_52E00:
		rts

	; End of function sub_52DF0

