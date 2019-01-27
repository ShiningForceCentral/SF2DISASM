
; ASM FILE data\maps\entries\map37\mapsetups\s2_3E7.asm :
; 0x5F9D2..0x5FA22 : 
ms_map37_flag3E7_EntityEvents:
		msEntityEvent 26, UP, sub_5F9F8-ms_map37_flag3E7_EntityEvents
byte_5F9D6:     msEntityEvent 128, UP, sub_5F9FE-ms_map37_flag3E7_EntityEvents
		msEntityEvent 129, RIGHT, entevt_5F9F6-ms_map37_flag3E7_EntityEvents
		msEntityEvent 7, UP, sub_5FA10-ms_map37_flag3E7_EntityEvents
		msDefaultEntityEvent 0, sub_5F9E6-ms_map37_flag3E7_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5F9E6:
		moveq   #(byte_5F9D6-ms_map37_flag3E7_EntityEvents),d6
		jsr     (UpdateRandomSeed).w
		move.w  #$EAC,d0
		add.w   d7,d0
		jsr     (DisplayText).w 
entevt_5F9F6:
		rts

	; End of function sub_5F9E6


; =============== S U B R O U T I N E =======================================

sub_5F9F8:
		 
		txt $D24                ; "Was it...too wild?{W1}"
		rts

	; End of function sub_5F9F8


; =============== S U B R O U T I N E =======================================

sub_5F9FE:
		 
		chkFlg $101             ; Temporary map setup flag 01
		bne.s   return_5FA0E
		script  cs_5FB30
		setFlg $101             ; Temporary map setup flag 01
return_5FA0E:
		rts

	; End of function sub_5F9FE


; =============== S U B R O U T I N E =======================================

sub_5FA10:
		 
		chkFlg $101             ; Temporary map setup flag 01
		bne.s   byte_5FA1C      
		txt $D23                ; "{LEADER}, come on!{W1}"
		bra.s   return_5FA20
byte_5FA1C:
		txt $D2A                ; "We must finish our{N}preparations before Geshp{N}finds us.{W1}"
return_5FA20:
		rts

	; End of function sub_5FA10

