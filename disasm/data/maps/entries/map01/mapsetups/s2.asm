
; ASM FILE data\maps\entries\map01\mapsetups\s2.asm :
; 0x5E694..0x5E720 : 
ms_map1_EntityEvents:
		msEntityEvent 128, UP, sub_5E6BE-ms_map1_EntityEvents
		msEntityEvent 129, UP, sub_5E6C8-ms_map1_EntityEvents
		msEntityEvent 130, UP, sub_5E6D2-ms_map1_EntityEvents
		msEntityEvent 131, UP, sub_5E6DC-ms_map1_EntityEvents
		msEntityEvent 132, UP, sub_5E6E6-ms_map1_EntityEvents
		msEntityEvent 133, UP, sub_5E6F0-ms_map1_EntityEvents
		msEntityEvent 134, UP, sub_5E6FA-ms_map1_EntityEvents
		msEntityEvent 135, UP, sub_5E704-ms_map1_EntityEvents
		msEntityEvent 136, UP, sub_5E70E-ms_map1_EntityEvents
		msDefaultEntityEvent 0, nullsub_153-ms_map1_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_153:
		rts

	; End of function nullsub_153


; =============== S U B R O U T I N E =======================================

sub_5E6BE:
		 
		txt     $E51            ; "Arc Valley is a dark place{N}where evil gathers.{W2}"
		txt     $E52            ; "He who rules Arc Valley is{N}the King of the Devils.{W1}"
		rts

	; End of function sub_5E6BE


; =============== S U B R O U T I N E =======================================

sub_5E6C8:
		 
		txt     $E53            ; "Dark Sol, Dark Dragon and{N}Zeon fought desperately to{N}obtain Arc Valley.{W2}"
		txt     $E54            ; "The fighting of the devil{N}kings created a mighty storm.{W1}"
		rts

	; End of function sub_5E6C8


; =============== S U B R O U T I N E =======================================

sub_5E6D2:
		 
		txt     $E55            ; "Zeon won.  And every devil{N}named him the King of the{N}Devils.{W2}"
		txt     $E56            ; "The other two kings envied{N}Zeon.  They sealed his powers{N}inside the Jewel of Evil.{W1}"
		rts

	; End of function sub_5E6D2


; =============== S U B R O U T I N E =======================================

sub_5E6DC:
		 
		txt     $E57            ; "When Zeon lost his powers,{N}he fell to Earth, and created{N}a giant crater when he hit.{W2}"
		txt     $E58            ; "His moan destroyed the{N}mountains and the crater{N}was buried by the debris.{W1}"
		rts

	; End of function sub_5E6DC


; =============== S U B R O U T I N E =======================================

sub_5E6E6:
		 
		txt     $E59            ; "Grieving over the fight, the{N}God of Wisdom created the{N}Jewel of Light.{W2}"
		txt     $E5A            ; "The Jewel of Light chose a{N}brave man and gave him a{N}Holy Sword.{W1}"
		rts

	; End of function sub_5E6E6


; =============== S U B R O U T I N E =======================================

sub_5E6F0:
		 
		txt     $E5B            ; "With the Holy Sword in{N}hand, the brave man fought{N}against the two devil kings.{W2}"
		txt     $E5C            ; "The Holy Sword contained{N}holy power.  Thus, the two{N}devil kings were defeated.{W1}"
		rts

	; End of function sub_5E6F0


; =============== S U B R O U T I N E =======================================

sub_5E6FA:
		 
		txt     $E5D            ; "Evil Arc Valley was sealed{N}beneath the Ancient Tower.{W2}"
		txt     $E5E            ; "Never open the door to the{N}tower.  A great evil sleeps{N}inside.{W1}"
		rts

	; End of function sub_5E6FA


; =============== S U B R O U T I N E =======================================

sub_5E704:
		 
		txt     $E5F            ; "In the event of Zeon{N}awakening, the power of light{N}will choose another.{W2}"
		txt     $E60            ; "Believe us.  We lie not.{N}Attack the devil at his mouth{N}with the Holy Sword.{W1}"
		rts

	; End of function sub_5E704


; =============== S U B R O U T I N E =======================================

sub_5E70E:
		 
		chkFlg  $349            ; set after the Taya join scene has played inside the Mitula Shrine
		bne.s   return_5E71E
		script  cs_5E772
		setFlg  $349            ; set after the Taya join scene has played inside the Mitula Shrine
return_5E71E:
		rts

	; End of function sub_5E70E

