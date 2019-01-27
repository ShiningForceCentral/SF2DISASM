
; ASM FILE data\maps\entries\map38\mapsetups\s3.asm :
; 0x5DCD0..0x5DD26 : 
ms_map38_ZoneEvents:
		dc.b $C
		dc.b 6
		dc.w sub_5DCDE-ms_map38_ZoneEvents
		dc.b $C
		dc.b 8
		dc.w sub_5DCF0-ms_map38_ZoneEvents
		dc.w $FD00
		dc.w nullsub_97-ms_map38_ZoneEvents

; =============== S U B R O U T I N E =======================================

nullsub_97:
		rts

	; End of function nullsub_97


; =============== S U B R O U T I N E =======================================

sub_5DCDE:
		 
		chkFlg $38F             ; set after the Petro death scene in Roft
		bne.s   return_5DCEE
		lea     cs_5DE2E(pc), a0
		trap    #6
		setFlg $38F             ; set after the Petro death scene in Roft
return_5DCEE:
		rts

	; End of function sub_5DCDE


; =============== S U B R O U T I N E =======================================

sub_5DCF0:
		 
		chkFlg $38F             ; set after the Petro death scene in Roft
		beq.s   return_5DD24
		chkFlg $4C              ; Zynk is a follower
		beq.s   byte_5DD08      
		lea     cs_5DE76(pc), a0
		trap    #6
		clrFlg $4C              ; Zynk is a follower
		bra.s   return_5DD24
byte_5DD08:
		chkFlg $399             ; set after Zynk leaves you at the Galam Drawbridge (for Roft/Petro death scene)
		beq.s   return_5DD24
		chkFlg $1A              ; Zynk joined
		bne.s   return_5DD24
		chkFlg $100             ; Temporary map setup flag 00
		beq.s   return_5DD24
		lea     cs_5DE76(pc), a0
		trap    #6
		clrFlg $4C              ; Zynk is a follower
return_5DD24:
		rts

	; End of function sub_5DCF0

