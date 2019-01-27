
; ASM FILE data\maps\entries\map02\mapsetups\s2_212.asm :
; 0x5E9C8..0x5EA20 : 
ms_map2_flag212_EntityEvents:
		msEntityEvent 128, UP, sub_5E9F0-ms_map2_flag212_EntityEvents
		msEntityEvent 129, UP, sub_5E9FA-ms_map2_flag212_EntityEvents
		msEntityEvent 130, UP, sub_5EA00-ms_map2_flag212_EntityEvents
		msEntityEvent 131, UP, sub_5EA06-ms_map2_flag212_EntityEvents
		msEntityEvent 132, UP, sub_5EA10-ms_map2_flag212_EntityEvents
		msEntityEvent 133, UP, sub_5EA1A-ms_map2_flag212_EntityEvents
		msEntityEvent 134, UP, (sub_5E9A4-ms_map2_flag212_EntityEvents) & $FFFF
		msEntityEvent 135, UP, (sub_5E9B2-ms_map2_flag212_EntityEvents) & $FFFF
		msEntityEvent 136, UP, (sub_5E9C0-ms_map2_flag212_EntityEvents) & $FFFF
		msDefaultEntityEvent 0, (nullsub_154-ms_map2_flag212_EntityEvents) & $FFFF

; =============== S U B R O U T I N E =======================================

sub_5E9F0:
		 
		txt $E0B                ; "This is Pacalon, a kingdom{N}of fine centaurs.{W2}"
		txt $E0C                ; "We welcome you.{W1}"
		rts

	; End of function sub_5E9F0


; =============== S U B R O U T I N E =======================================

sub_5E9FA:
		 
		txt $E0D                ; "Rain!  This must be a{N}present from the gods!{W1}"
		rts

	; End of function sub_5E9FA


; =============== S U B R O U T I N E =======================================

sub_5EA00:
		 
		txt $E0E                ; "Thanks to the rain, I'm no{N}longer thirsty.{N}But, I'm still hungry.{W1}"
		rts

	; End of function sub_5EA00


; =============== S U B R O U T I N E =======================================

sub_5EA06:
		 
		txt $E0F                ; "Did you save Mitula?{W2}"
		txt $E10                ; "Then, why don't you defeat{N}those devils?{W1}"
		rts

	; End of function sub_5EA06


; =============== S U B R O U T I N E =======================================

sub_5EA10:
		 
		txt $E11                ; "Was Tristan occupied by{N}devils?{W2}"
		txt $E12                ; "That's why we've had no{N}rain lately.{W1}"
		rts

	; End of function sub_5EA10


; =============== S U B R O U T I N E =======================================

sub_5EA1A:
		 
		txt $E13                ; "I see Geshp frequently.{N}He always stares at the{N}castle.{W1}"
		rts

	; End of function sub_5EA1A

