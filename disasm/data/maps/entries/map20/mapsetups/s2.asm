
; ASM FILE data\maps\entries\map20\mapsetups\s2.asm :
; 0x537AC..0x53830 : 
ms_map20_EntityEvents:
		msEntityEvent 128, RIGHT, sub_537E6-ms_map20_EntityEvents
		msEntityEvent 129, RIGHT, sub_537E0-ms_map20_EntityEvents
		msEntityEvent 131, DOWN, sub_537CC-ms_map20_EntityEvents
		msEntityEvent 132, DOWN, sub_537EC-ms_map20_EntityEvents
		msEntityEvent 133, DOWN, sub_537F2-ms_map20_EntityEvents
		msEntityEvent 134, DOWN, sub_537F8-ms_map20_EntityEvents
		msEntityEvent 135, DOWN, sub_537FE-ms_map20_EntityEvents
		msDefaultEntityEvent 0, return_53814-ms_map20_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_537CC:
		 
		chkFlg $100             ; Temporary map setup flag 00
		bne.s   byte_537DA      
		txt $23A                ; "Legend regarding the{N}tower?  Mmmm, do I have{N}"
		setFlg $100             ; Temporary map setup flag 00
byte_537DA:
		txt $23B                ; "to go to school again?{W1}"
		rts

	; End of function sub_537CC


; =============== S U B R O U T I N E =======================================

sub_537E0:
		 
		txt $23C                ; "Oh, father...are you{N}alright?{W1}"
		rts

	; End of function sub_537E0


; =============== S U B R O U T I N E =======================================

sub_537E6:
		 
		txt $23D                ; "Mmmmm....{N}Hmmmmmm....{W1}"
		rts

	; End of function sub_537E6


; =============== S U B R O U T I N E =======================================

sub_537EC:
		 
		txt $237                ; "How fine the view is!{N}I can see the eastern{N}continent from here.{W1}"
		rts

	; End of function sub_537EC


; =============== S U B R O U T I N E =======================================

sub_537F2:
		 
		txt $236                ; "This east tower was built{N}in order to watch for{N}invaders.{W1}"
		rts

	; End of function sub_537F2


; =============== S U B R O U T I N E =======================================

sub_537F8:
		 
		txt $233                ; "It has been very{N}warm lately.{W1}"
		rts

	; End of function sub_537F8


; =============== S U B R O U T I N E =======================================

sub_537FE:
		 
		chkFlg $101             ; Temporary map setup flag 01
		bne.s   byte_53810      
		lea     cs_53816(pc), a0
		trap    #6
		setFlg $101             ; Temporary map setup flag 01
		bra.s   return_53814
byte_53810:
		txt $235                ; "Boys are not allowed{N}to come into our dressing{N}room!!{W1}"
return_53814:
		rts

	; End of function sub_537FE

cs_53816:       textCursor $234
		setActscriptWait $87,eas_Jump
		setFacing $87,LEFT
		nextText $0,$87         ; "(Scream!)...who are you?!{N}Get out of here!{W2}"
		nextText $0,$87         ; "Boys are not allowed{N}to come into our dressing{N}room!!{W1}"
		csc_end
