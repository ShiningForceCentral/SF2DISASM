
; ASM FILE data\maps\entries\map03\mapsetups\s2_21F.asm :
; 0x62738..0x62820 : 
ms_map3_flag21F_EntityEvents:
		msEntityEvent 128, DOWN, sub_6277A-ms_map3_flag21F_EntityEvents
		msEntityEvent 129, DOWN, sub_62784-ms_map3_flag21F_EntityEvents
		msEntityEvent 130, UP, sub_6278E-ms_map3_flag21F_EntityEvents
		msEntityEvent 131, UP, sub_62794-ms_map3_flag21F_EntityEvents
		msEntityEvent 132, UP, sub_6279A-ms_map3_flag21F_EntityEvents
		msEntityEvent 133, DOWN, sub_627A4-ms_map3_flag21F_EntityEvents
		msEntityEvent 134, DOWN, sub_627AA-ms_map3_flag21F_EntityEvents
		msEntityEvent 135, UP, sub_627B4-ms_map3_flag21F_EntityEvents
		msEntityEvent 136, UP, sub_627BC-ms_map3_flag21F_EntityEvents
		msEntityEvent 137, UP, sub_627C6-ms_map3_flag21F_EntityEvents
		msEntityEvent 138, UP, sub_627D0-ms_map3_flag21F_EntityEvents
		msEntityEvent 1, UP, sub_627F8-ms_map3_flag21F_EntityEvents
		msEntityEvent 2, UP, sub_62802-ms_map3_flag21F_EntityEvents
		msEntityEvent 3, UP, sub_6280C-ms_map3_flag21F_EntityEvents
		msEntityEvent 4, UP, sub_62816-ms_map3_flag21F_EntityEvents
		msDefaultEntityEvent 0, nullsub_111-ms_map3_flag21F_EntityEvents

; =============== S U B R O U T I N E =======================================

nullsub_111:
		rts

	; End of function nullsub_111


; =============== S U B R O U T I N E =======================================

sub_6277A:
		trap    #TEXTBOX
		dc.w $F4F               ; "{LEADER}, did you hear?{W2}"
		trap    #TEXTBOX
		dc.w $F50               ; "The Princess' face turned{N}pink!{W1}"
		rts

	; End of function sub_6277A


; =============== S U B R O U T I N E =======================================

sub_62784:
		trap    #TEXTBOX
		dc.w $F51               ; "Ah, {LEADER}!{N}I'm so happy!{W2}"
		trap    #TEXTBOX
		dc.w $F52               ; "I heard Princess Elis is{N}going to awaken today!{W1}"
		rts

	; End of function sub_62784


; =============== S U B R O U T I N E =======================================

sub_6278E:
		trap    #TEXTBOX
		dc.w $F53               ; "Thanks to Galam and{N}Pacalon, Granseal is{N}now the same as before!{W1}"
		rts

	; End of function sub_6278E


; =============== S U B R O U T I N E =======================================

sub_62794:
		trap    #TEXTBOX
		dc.w $F54               ; "Galam is making a statue of{N}{NAME;28} as a memorial.{W1}"
		rts

	; End of function sub_62794


; =============== S U B R O U T I N E =======================================

sub_6279A:
		trap    #TEXTBOX
		dc.w $F55               ; "{LEADER}, you...will...{N}kiss...her...?{W2}"
		trap    #TEXTBOX
		dc.w $F56               ; "I don't like you anymore.{N}(Sigh){W1}"
		rts

	; End of function sub_6279A


; =============== S U B R O U T I N E =======================================

sub_627A4:
		trap    #TEXTBOX
		dc.w $F57               ; "I'm so happy.  I'll get to{N}see Elis again!{W1}"
		rts

	; End of function sub_627A4


; =============== S U B R O U T I N E =======================================

sub_627AA:
		trap    #TEXTBOX
		dc.w $F58               ; "{NAME;2} had better not{N}be the one who kisses her.{W2}"
		trap    #TEXTBOX
		dc.w $F59               ; "If he kisses her, he'll have{N}my hoofprints on his rump!{W1}"
		rts

	; End of function sub_627AA


; =============== S U B R O U T I N E =======================================

sub_627B4:
		lea     cs_628C8(pc), a0
		trap    #6
		rts

	; End of function sub_627B4


; =============== S U B R O U T I N E =======================================

sub_627BC:
		trap    #TEXTBOX
		dc.w $F5A               ; "I heard a rumor!{N}Are you going to kiss her?{W2}"
		trap    #TEXTBOX
		dc.w $F5B               ; "Shucks, I wish I were as{N}young as you.{W1}"
		rts

	; End of function sub_627BC


; =============== S U B R O U T I N E =======================================

sub_627C6:
		trap    #TEXTBOX
		dc.w $F46               ; "Why am I here?{W2}"
		trap    #TEXTBOX
		dc.w $F47               ; "We have no more enemies.{W1}"
		rts

	; End of function sub_627C6


; =============== S U B R O U T I N E =======================================

sub_627D0:
		trap    #TEXTBOX
		dc.w $F5C               ; "Morning, {LEADER}.{W2}"
		trap    #TEXTBOX
		dc.w $F5D               ; "Are you ready to go to{N}the castle?{W1}"
		jsr     j_YesNoPrompt
		tst.w   d0
		bne.s   loc_627F2
		trap    #TEXTBOX
		dc.w $FC1               ; "Now, let's go see the King!{W1}"
		trap    #SET_FLAG
		dc.w $3D5
		lea     cs_6290C(pc), a0
		trap    #6
		bra.s   return_627F6
loc_627F2:
		trap    #TEXTBOX
		dc.w $FC2               ; "No?  You said NO?{N}We have no time to waste!{W1}"
return_627F6:
		rts

	; End of function sub_627D0


; =============== S U B R O U T I N E =======================================

sub_627F8:
		trap    #TEXTBOX
		dc.w $F5E               ; "I know somebody must kiss{N}her....{W2}"
		trap    #TEXTBOX
		dc.w $F5F               ; "Who will it be?{N}What will I do if...{N}it's...?{W1}"
		rts

	; End of function sub_627F8


; =============== S U B R O U T I N E =======================================

sub_62802:
		trap    #TEXTBOX
		dc.w $F60               ; "I don't think it's going to{N}be me 'cause I'm a centaur.{W2}"
		trap    #TEXTBOX
		dc.w $F61               ; "Who will it be?{N}Does Sir Astral know?{W1}"
		rts

	; End of function sub_62802


; =============== S U B R O U T I N E =======================================

sub_6280C:
		trap    #TEXTBOX
		dc.w $F62               ; "I will do anything for{N}Princess Elis!!{W2}"
		trap    #TEXTBOX
		dc.w $F63               ; "I hope Sir Astral chooses{N}me!{W1}"
		rts

	; End of function sub_6280C


; =============== S U B R O U T I N E =======================================

sub_62816:
		trap    #TEXTBOX
		dc.w $F64               ; "She's no longer poisoned,{N}but she's still asleep.{W2}"
		trap    #TEXTBOX
		dc.w $F65               ; "And Sir Astral called us{N}here!{N}Who's going to kiss her?{W1}"
		rts

	; End of function sub_62816

