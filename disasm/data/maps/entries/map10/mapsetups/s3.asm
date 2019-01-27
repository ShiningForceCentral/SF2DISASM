
; ASM FILE data\maps\entries\map10\mapsetups\s3.asm :
; 0x56F8A..0x56FC0 : 
ms_map10_ZoneEvents:
		dc.b $1D
		dc.b $FF
		dc.w sub_56F9C-ms_map10_ZoneEvents
		dc.b $21
		dc.b $FF
		dc.w sub_56FAE-ms_map10_ZoneEvents
		dc.b $1F
		dc.b $35
		dc.w sub_56FAE-ms_map10_ZoneEvents
		dc.w $FD00
		dc.w nullsub_74-ms_map10_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_74:
		rts

	; End of function nullsub_74


; =============== S U B R O U T I N E =======================================

sub_56F9C:
		 
		chkFlg $2D0             ; set after the King of Bedoe speaks to his soldiers and they disperse
		bne.s   return_56FAC
		script  cs_573EC
		setFlg $2D0             ; set after the King of Bedoe speaks to his soldiers and they disperse
return_56FAC:
		rts

	; End of function sub_56F9C


; =============== S U B R O U T I N E =======================================

sub_56FAE:
		 
		chkFlg $2D1             ; set after you approach the King of Bedoe, starts with Luke speaking to Peter
		bne.s   return_56FBE
		script  cs_574A6
		setFlg $2D1             ; set after you approach the King of Bedoe, starts with Luke speaking to Peter
return_56FBE:
		rts

	; End of function sub_56FAE

