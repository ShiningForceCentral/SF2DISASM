
; ASM FILE data\maps\entries\map20\mapsetups\s2.asm :
; 0x537AC..0x53830 : 
ms_map20_EntityEvents:
		dc.b $80
		dc.b 0
		dc.w sub_537E6-ms_map20_EntityEvents
		dc.b $81
		dc.b 0
		dc.w sub_537E0-ms_map20_EntityEvents
		dc.b $83
		dc.b 3
		dc.w sub_537CC-ms_map20_EntityEvents
		dc.b $84
		dc.b 3
		dc.w sub_537EC-ms_map20_EntityEvents
		dc.b $85
		dc.b 3
		dc.w sub_537F2-ms_map20_EntityEvents
		dc.b $86
		dc.b 3
		dc.w sub_537F8-ms_map20_EntityEvents
		dc.b $87
		dc.b 3
		dc.w sub_537FE-ms_map20_EntityEvents
		dc.w $FD00
		dc.w return_53814-ms_map20_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_537CC:
		trap    #CHECK_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
		bne.s   loc_537DA
		trap    #TEXTBOX
		dc.w $23A               ; "Legend regarding the{N}tower?  Mmmm, do I have{N}"
		trap    #SET_FLAG
		dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
loc_537DA:
		trap    #TEXTBOX
		dc.w $23B               ; "to go to school again?{W1}"
		rts

	; End of function sub_537CC


; =============== S U B R O U T I N E =======================================

sub_537E0:
		trap    #TEXTBOX
		dc.w $23C               ; "Oh, father...are you{N}alright?{W1}"
		rts

	; End of function sub_537E0


; =============== S U B R O U T I N E =======================================

sub_537E6:
		trap    #TEXTBOX
		dc.w $23D               ; "Mmmmm....{N}Hmmmmmm....{W1}"
		rts

	; End of function sub_537E6


; =============== S U B R O U T I N E =======================================

sub_537EC:
		trap    #TEXTBOX
		dc.w $237               ; "How fine the view is!{N}I can see the eastern{N}continent from here.{W1}"
		rts

	; End of function sub_537EC


; =============== S U B R O U T I N E =======================================

sub_537F2:
		trap    #TEXTBOX
		dc.w $236               ; "This east tower was built{N}in order to watch for{N}invaders.{W1}"
		rts

	; End of function sub_537F2


; =============== S U B R O U T I N E =======================================

sub_537F8:
		trap    #TEXTBOX
		dc.w $233               ; "It has been very{N}warm lately.{W1}"
		rts

	; End of function sub_537F8


; =============== S U B R O U T I N E =======================================

sub_537FE:
		trap    #CHECK_FLAG
		dc.w $101
		bne.s   loc_53810
		lea     cs_53816(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $101
		bra.s   return_53814
loc_53810:
		trap    #TEXTBOX
		dc.w $235               ; "Boys are not allowed{N}to come into our dressing{N}room!!{W1}"
return_53814:
		rts

	; End of function sub_537FE

cs_53816:       textCursor $234
		setActscript $87,$FF,eas_Jump
		setFacing $87,2
		nextText $0,$87         ; "(Scream!)...who are you?!{N}Get out of here!{W2}"
		nextText $0,$87         ; "Boys are not allowed{N}to come into our dressing{N}room!!{W1}"
		csc_end
