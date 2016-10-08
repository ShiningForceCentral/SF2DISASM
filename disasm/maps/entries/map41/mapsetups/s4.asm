
; SCRIPT SECTION maps\entries\map41\mapsetups\s4 :
; 

; =============== S U B R O U T I N E =======================================

ms_map41_AreaDescriptions:
										
										move.w  #$DB7,d3
										lea     word_5F41E(pc), a0
										nop
										jmp     DisplayAreaDescription

	; End of function ms_map41_AreaDescriptions

word_5F41E:         dc.w $607
										dc.b $FF
										dc.b 1
										dc.w sub_5F42C-word_5F41E
										dc.w $607
										dc.b 0
										dc.b 1
										dc.w sub_5F456-word_5F41E
										dc.w $FD00

; =============== S U B R O U T I N E =======================================

sub_5F42C:
										
										trap    #CHECK_FLAG
										dc.w $3A2
										bne.s   loc_5F44C
										moveq   #$43,d1 
										jsr     j_sub_9146
										cmpi.w  #$FFFF,d0
										bne.s   loc_5F446
										trap    #TEXTBOX
										dc.w $DB7               ; "A statue of a devil's head.{N}It looks ready to bite you.{W1}"
										bra.s   loc_5F44A
loc_5F446:
										
										trap    #TEXTBOX
										dc.w $DB8               ; "A statue of a fierce{N}devil's head.  There's a{N}slit at its mouth.{W1}"
loc_5F44A:
										
										bra.s   return_5F454
loc_5F44C:
										
										trap    #TEXTBOX
										dc.w $1A7               ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
										trap    #TEXTBOX
										dc.w $19C               ; "Nothing was there.{W1}"
return_5F454:
										
										rts

	; End of function sub_5F42C


; =============== S U B R O U T I N E =======================================

sub_5F456:
										
										trap    #CHECK_FLAG
										dc.w $3A2
										bne.s   loc_5F462
										trap    #TEXTBOX
										dc.w $DB7               ; "A statue of a devil's head.{N}It looks ready to bite you.{W1}"
										bra.s   return_5F46A
loc_5F462:
										
										trap    #TEXTBOX
										dc.w $1A7               ; "{NAME} investigated{N}the area.{W2}{CLEAR}"
										trap    #TEXTBOX
										dc.w $19C               ; "Nothing was there.{W1}"
return_5F46A:
										
										rts

	; End of function sub_5F456

