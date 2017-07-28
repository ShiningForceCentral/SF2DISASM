
; ASM FILE data\maps\entries\map02\mapsetups\s2_212.asm :
; 0x5E9C8..0x5EA20 : 
ms_map2_flag212_EntityEvents:
		dc.b $80
		dc.b 1
		dc.w sub_5E9F0-ms_map2_flag212_EntityEvents
		dc.b $81
		dc.b 1
		dc.w sub_5E9FA-ms_map2_flag212_EntityEvents
		dc.b $82
		dc.b 1
		dc.w sub_5EA00-ms_map2_flag212_EntityEvents
		dc.b $83
		dc.b 1
		dc.w sub_5EA06-ms_map2_flag212_EntityEvents
		dc.b $84
		dc.b 1
		dc.w sub_5EA10-ms_map2_flag212_EntityEvents
		dc.b $85
		dc.b 1
		dc.w sub_5EA1A-ms_map2_flag212_EntityEvents
		dc.b $86
		dc.b 1
		dc.w (sub_5E9A4-ms_map2_flag212_EntityEvents) & $FFFF
		dc.b $87
		dc.b 1
		dc.w (sub_5E9B2-ms_map2_flag212_EntityEvents) & $FFFF
		dc.b $88
		dc.b 1
		dc.w (sub_5E9C0-ms_map2_flag212_EntityEvents) & $FFFF
		dc.w $FD00
		dc.w (nullsub_154-ms_map2_flag212_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_5E9F0:
		
		trap    #TEXTBOX
		dc.w $E0B               
						; "This is Pacalon, a kingdom{N}of fine centaurs.{W2}"
		trap    #TEXTBOX
		dc.w $E0C               
						; "We welcome you.{W1}"
		rts

	; End of function sub_5E9F0


; =============== S U B R O U T I N E =======================================

sub_5E9FA:
		
		trap    #TEXTBOX
		dc.w $E0D               
						; "Rain!  This must be a{N}present from the gods!{W1}"
		rts

	; End of function sub_5E9FA


; =============== S U B R O U T I N E =======================================

sub_5EA00:
		
		trap    #TEXTBOX
		dc.w $E0E               
						; "Thanks to the rain, I'm no{N}longer thirsty.{N}But, I'm still hungry.{W1}"
		rts

	; End of function sub_5EA00


; =============== S U B R O U T I N E =======================================

sub_5EA06:
		
		trap    #TEXTBOX
		dc.w $E0F               
						; "Did you save Mitula?{W2}"
		trap    #TEXTBOX
		dc.w $E10               
						; "Then, why don't you defeat{N}those devils?{W1}"
		rts

	; End of function sub_5EA06


; =============== S U B R O U T I N E =======================================

sub_5EA10:
		
		trap    #TEXTBOX
		dc.w $E11               
						; "Was Tristan occupied by{N}devils?{W2}"
		trap    #TEXTBOX
		dc.w $E12               
						; "That's why we've had no{N}rain lately.{W1}"
		rts

	; End of function sub_5EA10


; =============== S U B R O U T I N E =======================================

sub_5EA1A:
		
		trap    #TEXTBOX
		dc.w $E13               
						; "I see Geshp frequently.{N}He always stares at the{N}castle.{W1}"
		rts

	; End of function sub_5EA1A

