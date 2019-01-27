
; ASM FILE data\maps\entries\map44\mapsetups\s2_1FB.asm :
; 0x5448A..0x5455E : 
ms_map44_flag1FB_EntityEvents:
		msEntityEvent 128, UP, sub_544E6-ms_map44_flag1FB_EntityEvents
		msEntityEvent 129, UP, sub_544EC-ms_map44_flag1FB_EntityEvents
		msEntityEvent 130, UP, sub_544F2-ms_map44_flag1FB_EntityEvents
		msEntityEvent 134, UP, sub_544F8-ms_map44_flag1FB_EntityEvents
		msEntityEvent 135, UP, sub_544FE-ms_map44_flag1FB_EntityEvents
		msEntityEvent 136, UP, sub_54504-ms_map44_flag1FB_EntityEvents
		msEntityEvent 137, UP, sub_5450A-ms_map44_flag1FB_EntityEvents
		msEntityEvent 138, UP, sub_54510-ms_map44_flag1FB_EntityEvents
		msEntityEvent 139, UP, sub_54550-ms_map44_flag1FB_EntityEvents
		msEntityEvent 140, UP, sub_54556-ms_map44_flag1FB_EntityEvents
		msDefaultEntityEvent 0, nullsub_146-ms_map44_flag1FB_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_544B6:
		 
		txt     $271            ; "My husband rushed out{N}of here when he saw the{N}sun rise.{W2}{N}Yeah, maybe he'll make{N}a good haul today.{W1}"
		rts

	; End of function sub_544B6


; =============== S U B R O U T I N E =======================================

sub_544BC:
		 
		txt     $32A            ; "Meow!{W1}"
		rts

	; End of function sub_544BC


; =============== S U B R O U T I N E =======================================

sub_544C2:
		 
		txt     $26C            ; "Hang it all!{N}Where have all the fish gone?!{N}My boss was really upset.{W1}"
		rts

	; End of function sub_544C2


; =============== S U B R O U T I N E =======================================

sub_544C8:
		 
		txt     $26D            ; "It's strange...{N}The sea is so calm.{W2}{N}I have never seen such a{N}quiet sea before!{W1}"
		rts

	; End of function sub_544C8


; =============== S U B R O U T I N E =======================================

sub_544CE:
		 
		txt     $26E            ; "I'm so sorry.  I have no fish{N}for you today.{W2}{N}I don't know why, but we{N}made no haul.{W1}"
		rts

	; End of function sub_544CE


; =============== S U B R O U T I N E =======================================

sub_544D4:
		 
		txt     $26F            ; "Meow! {W1}"
		rts

	; End of function sub_544D4


; =============== S U B R O U T I N E =======================================

sub_544DA:
		 
		txt     $270            ; "Hey, you!{N}This ship is for{N}fishermen only!{W2}{N}Get out of here, you{N}silly kid!{W1}"
		rts

	; End of function sub_544DA


; =============== S U B R O U T I N E =======================================

sub_544E0:
		 
		txt     $272            ; "I heard that Galam invaded{N}this kingdom while I was{N}fishing.{W2}{N}What's going on in the{N}castle?{W1}"
		rts

	; End of function sub_544E0


; =============== S U B R O U T I N E =======================================

sub_544E6:
		 
		txt     $3E9            ; "The town was destroyed{N}by the earthquake....{W1}"
		rts

	; End of function sub_544E6


; =============== S U B R O U T I N E =======================================

sub_544EC:
		 
		txt     $3EA            ; "It was big enough to cause{N}a tsunami!{W1}"
		rts

	; End of function sub_544EC


; =============== S U B R O U T I N E =======================================

sub_544F2:
		 
		txt     $3EB            ; "Leave port now!{N}Right now!{W1}"
		rts

	; End of function sub_544F2


; =============== S U B R O U T I N E =======================================

sub_544F8:
		 
		txt     $3EC            ; "Who are you?{N}Don't push me.{N}The ship is full!{W1}"
		rts

	; End of function sub_544F8


; =============== S U B R O U T I N E =======================================

sub_544FE:
		 
		txt     $3ED            ; "Ouch...{N}I have bruises everywhere!{W1}"
		rts

	; End of function sub_544FE


; =============== S U B R O U T I N E =======================================

sub_54504:
		 
		txt     $3EE            ; "There is no room for you{N}here!{W1}"
		rts

	; End of function sub_54504


; =============== S U B R O U T I N E =======================================

sub_5450A:
		 
		txt     $3EF            ; "Oh, my!  Granseal is{N}collapsing....{W1}"
		rts

	; End of function sub_5450A


; =============== S U B R O U T I N E =======================================

sub_54510:
		 
		txt     $3F0            ; "Sire!  Sir Astral!{N}Glad to see you again!{N}Can we put out now?{W1}"
		clsTxt
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		move.w  #$1F,d0
		jsr     GetEntityPortraitAndSpeechSfx
		move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
		move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
		jsr     LoadAndDisplayCurrentPortrait
		txt     $3F1            ; "{LEADER}, are you ready{N}to leave port?{W1}"
		jsr     j_YesNoPrompt
		bne.s   byte_5454A      
		script  cs_54578
		bra.s   return_5454E
byte_5454A:
		txt     $3F2            ; "Then come back here very{N}soon.{W1}"
return_5454E:
		rts

	; End of function sub_54510


; =============== S U B R O U T I N E =======================================

sub_54550:
		 
		txt     $3F3            ; "King Granseal!{N}Sir Astral...oh,{N}Minister!{W1}"
		rts

	; End of function sub_54550


; =============== S U B R O U T I N E =======================================

sub_54556:
		 
		txt     $3F4            ; "Everything is ready!{N}We can go anytime!{W1}"
		rts

	; End of function sub_54556


; =============== S U B R O U T I N E =======================================

nullsub_146:
		rts

	; End of function nullsub_146

