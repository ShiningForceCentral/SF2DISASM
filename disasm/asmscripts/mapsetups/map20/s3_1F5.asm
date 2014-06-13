
; SCRIPT SECTION mapsetups\map20\s3_1F5 :
; 
ms_map20_flag1F5_Section3:
										dc.b $1B
byte_53767:         dc.b $34
										dc.w sub_5376E-ms_map20_flag1F5_Section3
										dc.w $FD00
										dc.w nullsub_84-ms_map20_flag1F5_Section3

; =============== S U B R O U T I N E =======================================

sub_5376E:
										
										moveq   #(byte_53767-ms_map20_flag1F5_Section3),d0
										jsr     j_GetMaxHP
										jsr     j_SetCurrentHP
										jsr     j_GetMaxMP
										jsr     j_SetCurrentMP
										moveq   #2,d0
										jsr     j_GetMaxHP
										jsr     j_SetCurrentHP
										jsr     j_GetMaxMP
										jsr     j_SetCurrentMP
										lea     cs_53B66(pc), a0
										trap    #6
										rts

	; End of function sub_5376E


; =============== S U B R O U T I N E =======================================

nullsub_84:
										
										rts

	; End of function nullsub_84

