
; SCRIPT SECTION mapsetups\map19\s3_1FB :
; 
ms_map19_flag1FB_Section3:
										dc.b $10
										dc.b 5
										dc.w sub_52DDE-ms_map19_flag1FB_Section3
										dc.b $19
										dc.b $D
										dc.w sub_52DF0-ms_map19_flag1FB_Section3
										dc.b $19
										dc.b $E
										dc.w sub_52DF0-ms_map19_flag1FB_Section3
										dc.w $FD00
										dc.w nullsub_82-ms_map19_flag1FB_Section3

; =============== S U B R O U T I N E =======================================

nullsub_82:
										
										rts

	; End of function nullsub_82


; =============== S U B R O U T I N E =======================================

sub_52DB6:
										
										trap    #1
										dc.w $26C
										bne.s   return_52DC6
										lea     cs_534D2(pc), a0
										trap    #6
										trap    #2
										dc.w $26C
return_52DC6:
										
										rts

	; End of function sub_52DB6


; =============== S U B R O U T I N E =======================================

sub_52DC8:
										
										trap    #1
										dc.w $26D
										bne.s   return_52DDC
										lea     cs_535FA(pc), a0
										trap    #6
										trap    #2
										dc.w $53
										trap    #2
										dc.w $26D
return_52DDC:
										
										rts

	; End of function sub_52DC8


; =============== S U B R O U T I N E =======================================

sub_52DDE:
										
										trap    #1
										dc.w $26E
										bne.s   return_52DEE
										lea     cs_53620(pc), a0
										trap    #6
										trap    #2
										dc.w $26E
return_52DEE:
										
										rts

	; End of function sub_52DDE


; =============== S U B R O U T I N E =======================================

sub_52DF0:
										
										trap    #1
										dc.w $26F
										bne.s   return_52E00
										lea     cs_5362A(pc), a0
										trap    #6
										trap    #2
										dc.w $26F
return_52E00:
										
										rts

	; End of function sub_52DF0

