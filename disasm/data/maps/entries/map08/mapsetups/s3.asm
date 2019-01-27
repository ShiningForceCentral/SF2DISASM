
; ASM FILE data\maps\entries\map08\mapsetups\s3.asm :
; 0x561AE..0x561EC : 
ms_map8_ZoneEvents:
		dc.b  $F
		dc.b $1C
		dc.w sub_561BE-ms_map8_ZoneEvents
		dc.b $10
		dc.b $1C
		dc.w sub_561BE-ms_map8_ZoneEvents
		dc.b $E
		dc.b 8
		dc.w sub_561DA-ms_map8_ZoneEvents
		dc.w $FD00
		dc.w return_561EA-ms_map8_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_561BE:
		 
		chkFlg $2C4             ; set after the scene in Ribble where the mayor confronts Bowie
		bne.s   return_561D8
		chkFlg $102             ; Temporary map setup flag 02
		bne.s   return_561D8
		lea     cs_563B2(pc), a0
		trap    #6
		setFlg $2BF             ; set after the scene where Bowie brings the plank above deck, also set after the initial Ribble scene, where the guy runs away
		setFlg $102             ; Temporary map setup flag 02
return_561D8:
		rts

	; End of function sub_561BE


; =============== S U B R O U T I N E =======================================

sub_561DA:
		 
		chkFlg $2C4             ; set after the scene in Ribble where the mayor confronts Bowie
		bne.s   return_561EA
		lea     cs_56422(pc), a0
		trap    #6
		setFlg $2C4             ; set after the scene in Ribble where the mayor confronts Bowie
return_561EA:
		rts

	; End of function sub_561DA

