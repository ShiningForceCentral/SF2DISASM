
; ASM FILE data\maps\entries\map37\mapsetups\s2_3E7.asm :
; 0x5F9D2..0x5FA22 : 
ms_map37_flag3E7_EntityEvents:
		dc.b $1A
		dc.b 1
		dc.w sub_5F9F8-ms_map37_flag3E7_EntityEvents
byte_5F9D6:     dc.b $80
		dc.b 1
		dc.w sub_5F9FE-ms_map37_flag3E7_EntityEvents
		dc.b $81
		dc.b 0
		dc.w return_5F9F6-ms_map37_flag3E7_EntityEvents
		dc.b 7
		dc.b 1
		dc.w sub_5FA10-ms_map37_flag3E7_EntityEvents
		dc.w $FD00
		dc.w sub_5F9E6-ms_map37_flag3E7_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5F9E6:
		moveq   #(byte_5F9D6-ms_map37_flag3E7_EntityEvents),d6
		jsr     (UpdateRandomSeed).w
		move.w  #$EAC,d0
		add.w   d7,d0
		jsr     (DisplayText).w 
return_5F9F6:
		rts

	; End of function sub_5F9E6


; =============== S U B R O U T I N E =======================================

sub_5F9F8:
		trap    #TEXTBOX
		dc.w $D24               ; "Was it...too wild?{W1}"
		rts

	; End of function sub_5F9F8


; =============== S U B R O U T I N E =======================================

sub_5F9FE:
		trap    #CHECK_FLAG
		dc.w $101
		bne.s   return_5FA0E
		lea     cs_5FB30(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $101
return_5FA0E:
		rts

	; End of function sub_5F9FE


; =============== S U B R O U T I N E =======================================

sub_5FA10:
		trap    #CHECK_FLAG
		dc.w $101
		bne.s   loc_5FA1C
		trap    #TEXTBOX
		dc.w $D23               ; "{LEADER}, come on!{W1}"
		bra.s   return_5FA20
loc_5FA1C:
		trap    #TEXTBOX
		dc.w $D2A               ; "We must finish our{N}preparations before Geshp{N}finds us.{W1}"
return_5FA20:
		rts

	; End of function sub_5FA10

