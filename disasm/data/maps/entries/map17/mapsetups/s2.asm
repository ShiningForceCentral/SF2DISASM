
; ASM FILE data\maps\entries\map17\mapsetups\s2.asm :
; 0x5231C..0x523E4 : 
ms_map17_EntityEvents:
		dc.b $80
		dc.b 3
		dc.w sub_5237C-ms_map17_EntityEvents
		dc.b $81
		dc.b 1
		dc.w sub_52382-ms_map17_EntityEvents
		dc.b $82
		dc.b 3
		dc.w sub_52390-ms_map17_EntityEvents
		dc.b $83
		dc.b 1
		dc.w sub_523BA-ms_map17_EntityEvents
		dc.b $84
		dc.b 3
		dc.w sub_523A2-ms_map17_EntityEvents
		dc.b $85
		dc.b 3
		dc.w sub_523B4-ms_map17_EntityEvents
		dc.b $86
		dc.b 3
		dc.w sub_523D2-ms_map17_EntityEvents
		dc.b 2
		dc.b 3
		dc.w sub_52352-ms_map17_EntityEvents
		dc.b 3
		dc.b 3
		dc.w sub_5235E-ms_map17_EntityEvents
		dc.b 1
		dc.b 3
		dc.w nullsub_121-ms_map17_EntityEvents
		dc.b 4
		dc.b 3
		dc.w sub_5236A-ms_map17_EntityEvents
		dc.b 5
		dc.b 0
		dc.w sub_52376-ms_map17_EntityEvents
		dc.w $FD00
		dc.w nullsub_120-ms_map17_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_121:
		
		rts

	; End of function nullsub_121


; =============== S U B R O U T I N E =======================================

sub_52352:
		
		trap    #CHECK_FLAG
		dc.w $295               
						; set after prison scene, ending in Slade unlocking/Sarah accusing
		bne.s   return_5235C
		trap    #TEXTBOX
		dc.w $37D               
						; "We're talking about{N}Ground Seal.{N}Please, join in.{W1}"
return_5235C:
		
		rts

	; End of function sub_52352


; =============== S U B R O U T I N E =======================================

sub_5235E:
		
		trap    #CHECK_FLAG
		dc.w $295               
						; set after prison scene, ending in Slade unlocking/Sarah accusing
		bne.s   return_52368
		trap    #TEXTBOX
		dc.w $380               
						; "Hey!  Don't interrupt!{N}Sit down next to me!{W1}"
return_52368:
		
		rts

	; End of function sub_5235E


; =============== S U B R O U T I N E =======================================

sub_5236A:
		
		trap    #CHECK_FLAG
		dc.w $295               
						; set after prison scene, ending in Slade unlocking/Sarah accusing
		bne.s   return_52374
		trap    #TEXTBOX
		dc.w $37F               
						; "Hey, {LEADER}!{N}King Galam also knows about{N}Ground Seal!{W1}"
return_52374:
		
		rts

	; End of function sub_5236A


; =============== S U B R O U T I N E =======================================

sub_52376:
		
		trap    #TEXTBOX
		dc.w $3B1               
						; "I didn't mean to...{W1}"
		rts

	; End of function sub_52376


; =============== S U B R O U T I N E =======================================

sub_5237C:
		
		trap    #TEXTBOX
		dc.w $343               
						; "This is the treasure room!{N}You may not pass!{W1}"
		rts

	; End of function sub_5237C


; =============== S U B R O U T I N E =======================================

sub_52382:
		
		trap    #TEXTBOX
		dc.w $344               
						; "It's true that the messenger{N}met with an unnatural death.{W2}"
		trap    #TEXTBOX
		dc.w $345               
						; "But, that doesn't mean that{N}Granseal did it....{W2}"
		trap    #TEXTBOX
		dc.w $346               
						; "I don't understand.{N}Why is King Galam so{N}impatient?{W1}"
		rts

	; End of function sub_52382


; =============== S U B R O U T I N E =======================================

sub_52390:
		
		trap    #TEXTBOX
		dc.w $347               
						; "When the messenger was found{N}dead, the King suffured a{N}great deal of pain.{W2}"
		trap    #TEXTBOX
		dc.w $348               
						; "Thank goodness, he{N}recovered quickly.{W2}"
		trap    #TEXTBOX
		dc.w $349               
						; "It's Granseals fault!{W2}"
		trap    #TEXTBOX
		dc.w $34A               
						; "I believe in my King!{W1}"
		rts

	; End of function sub_52390


; =============== S U B R O U T I N E =======================================

sub_523A2:
		
		trap    #CHECK_FLAG
		dc.w $295               
						; set after prison scene, ending in Slade unlocking/Sarah accusing
		bne.s   loc_523AE
		trap    #TEXTBOX
		dc.w $37E               
						; "You got a raw deal, huh?{N}The same thing happened to{N}the rat next door.{W1}"
		bra.s   return_523B2
loc_523AE:
		
		trap    #TEXTBOX
		dc.w $381               
						; "There are a lot of Galam{N}soldiers upstairs.{N}You still want to go?{W1}"
return_523B2:
		
		rts

	; End of function sub_523A2


; =============== S U B R O U T I N E =======================================

sub_523B4:
		
		trap    #TEXTBOX
		dc.w $382               
						; "You're so brave.{N}Good luck!{W1}"
		rts

	; End of function sub_523B4


; =============== S U B R O U T I N E =======================================

sub_523BA:
		
		trap    #CHECK_FLAG
		dc.w $100               
						; .0118=apparently reset on map load, usually used to skip some lines of entities
		bne.s   loc_523CC
		lea     cs_52A3C(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $100               
						; .0118=apparently reset on map load, usually used to skip some lines of entities
		bra.s   return_523D0
loc_523CC:
		
		trap    #TEXTBOX
		dc.w $383               
						; "Don't tell anybody{N}that I neglected my work.{N}If you do{D1}.{D1}.{D1}.{D1}I'll kill you!{W1}"
return_523D0:
		
		rts

	; End of function sub_523BA


; =============== S U B R O U T I N E =======================================

sub_523D2:
		
		trap    #TEXTBOX
		dc.w $384               
						; "Oh, I'm so busy!{W1}"
		rts

	; End of function sub_523D2


; =============== S U B R O U T I N E =======================================

nullsub_120:
		
		rts

	; End of function nullsub_120


; =============== S U B R O U T I N E =======================================

sub_523DA:
		
		trap    #TEXTBOX
		dc.w $384               
						; "Oh, I'm so busy!{W1}"
		trap    #TEXTBOX
		dc.w $384               
						; "Oh, I'm so busy!{W1}"
		rts

	; End of function sub_523DA

