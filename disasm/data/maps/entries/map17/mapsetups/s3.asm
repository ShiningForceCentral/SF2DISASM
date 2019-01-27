
; ASM FILE data\maps\entries\map17\mapsetups\s3.asm :
; 0x523E4..0x52442 : 
ms_map17_ZoneEvents:
		dc.b $35
		dc.b 5
		dc.w sub_523F4-ms_map17_ZoneEvents
		dc.b $2B
		dc.b 9
		dc.w sub_52406-ms_map17_ZoneEvents
		dc.b $39
		dc.b 5
		dc.w sub_5242E-ms_map17_ZoneEvents
		dc.w $FD00
		dc.w nullsub_79-ms_map17_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_523F4:
		 
		chkFlg  $295            ; set after prison scene, ending in Slade unlocking/Sarah accusing
		bne.s   return_52404
		script  cs_52530
		setFlg  $295            ; set after prison scene, ending in Slade unlocking/Sarah accusing
return_52404:
		rts

	; End of function sub_523F4


; =============== S U B R O U T I N E =======================================

sub_52406:
		 
		chkFlg  $296            ; set after you try to go upstairs, and Slade opens the secret tunnel
		bne.s   byte_5241E      
		script  cs_528D4
		script  cs_528CA
		setFlg  $296            ; set after you try to go upstairs, and Slade opens the secret tunnel
		bra.s   return_5242C
byte_5241E:
		txt     $3B4            ; "You'll be captured if you go{N}that way.{W2}"
		txt     $3B7            ; "Now, go out through this{N}short cut!{W1}"
		script  cs_528CA
return_5242C:
		rts

	; End of function sub_52406


; =============== S U B R O U T I N E =======================================

sub_5242E:
		 
		chkFlg  $296            ; set after you try to go upstairs, and Slade opens the secret tunnel
		beq.s   return_5243E
		script  cs_52938
		setFlg  $49             ; Slade is a follower
return_5243E:
		rts

	; End of function sub_5242E


; =============== S U B R O U T I N E =======================================

nullsub_79:
		rts

	; End of function nullsub_79

