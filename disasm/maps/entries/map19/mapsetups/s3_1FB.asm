
; SCRIPT SECTION maps\entries\map19\mapsetups\s3_1FB :
; 
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
										
										trap    #CHECK_FLAG
										dc.w $26C               ; set after Astral talks Lemon into heading to the Ancient Tower
										bne.s   return_52DC6
										lea     cs_534D2(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $26C               ; set after Astral talks Lemon into heading to the Ancient Tower
return_52DC6:
										
										rts

	; End of function sub_52DB6


; =============== S U B R O U T I N E =======================================

sub_52DC8:
										
										trap    #CHECK_FLAG
										dc.w $26D               ; set after stepping in front of the Minister
										bne.s   return_52DDC
										lea     cs_535FA(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $53                ; King + Minister are followers
										trap    #SET_FLAG
										dc.w $26D               ; set after stepping in front of the Minister
return_52DDC:
										
										rts

	; End of function sub_52DC8


; =============== S U B R O U T I N E =======================================

sub_52DDE:
										
										trap    #CHECK_FLAG
										dc.w $26E               ; set after Astral delivers an "oh crap, earthquake" line in the castle
										bne.s   return_52DEE
										lea     cs_53620(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $26E               ; set after Astral delivers an "oh crap, earthquake" line in the castle
return_52DEE:
										
										rts

	; End of function sub_52DDE


; =============== S U B R O U T I N E =======================================

sub_52DF0:
										
										trap    #CHECK_FLAG
										dc.w $26F               ; set after Astral delivers his "should be safe" line in castle
										bne.s   return_52E00
										lea     cs_5362A(pc), a0
										trap    #6
										trap    #SET_FLAG
										dc.w $26F               ; set after Astral delivers his "should be safe" line in castle
return_52E00:
										
										rts

	; End of function sub_52DF0

