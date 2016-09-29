
; SCRIPT SECTION maps\entries\map25\mapsetups\s2 :
; 
ms_map25_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_5D248-ms_map25_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_5D24E-ms_map25_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_5D25C-ms_map25_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_5D26A-ms_map25_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_5D274-ms_map25_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_5D27A-ms_map25_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_5D2D2-ms_map25_EntityEvents
										dc.b $87
										dc.b 3
										dc.w sub_5D2EA-ms_map25_EntityEvents
										dc.w $FD00
										dc.w nullsub_132-ms_map25_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5D248:
										
										trap    #TRAP_TEXTBOX
										dc.w $7A4               ; "Ketto is on the southern{N}edge of North Parmecia.{W1}"
										rts

	; End of function sub_5D248


; =============== S U B R O U T I N E =======================================

sub_5D24E:
										
										trap    #TRAP_TEXTBOX
										dc.w $7A5               ; "Where did you come from,{N}boy?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $7A6               ; "From South Parmecia?{N}Really?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $7A7               ; "The tunnel to the south is{N}blocked.{W1}"
										rts

	; End of function sub_5D24E


; =============== S U B R O U T I N E =======================================

sub_5D25C:
										
										trap    #TRAP_TEXTBOX
										dc.w $7A8               ; "From South Parmecia?{N}Why did you come here?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $7A9               ; "Pacalon has become isolated{N}since we opposed the devils.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $7AA               ; "If I were you, I'd leave.{W1}"
										rts

	; End of function sub_5D25C


; =============== S U B R O U T I N E =======================================

sub_5D26A:
										
										trap    #TRAP_TEXTBOX
										dc.w $7AB               ; "It's unusually hot!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $7AC               ; "Is Mitula as sick as I've{N}heard?{W1}"
										rts

	; End of function sub_5D26A


; =============== S U B R O U T I N E =======================================

sub_5D274:
										
										trap    #TRAP_TEXTBOX
										dc.w $7AD               ; "The devils forbade us to go{N}out. {W1}"
										rts

	; End of function sub_5D274


; =============== S U B R O U T I N E =======================================

sub_5D27A:
										
										trap    #1
										dc.w $320
										bne.s   loc_5D2C4
										move.b  ((MESSAGE_SPEED-$1000000)).w,d0
										movem.l d0,-(sp)
										move.b  #0,((MESSAGE_SPEED-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $7AE               ; "Blast!  I hate devils....{W1}"
										move.b  #1,((MESSAGE_SPEED-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $7AF               ; "Ah, are you a customer?{N}Wow!{W2}"
										move.b  #2,((MESSAGE_SPEED-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $7B0               ; "It's a secret, OK?{N}I have very good weapons.{N}Hee, hee.{W2}"
										move.b  #3,((MESSAGE_SPEED-$1000000)).w
										trap    #TRAP_TEXTBOX
										dc.w $7B1               ; "Do you want to buy one?{N}Oh, you do?!  OK, come to my{N}shop!{W1}"
										movem.l (sp)+,d0
										move.b  d0,((MESSAGE_SPEED-$1000000)).w
										trap    #TRAP_SETFLAG
										dc.w $320               ; set after the merchant in Ketto runs to his store
										lea     cs_5D3B8(pc), a0
										trap    #6
										bra.s   return_5D2D0
loc_5D2C4:
										
										move.b  #9,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
return_5D2D0:
										
										rts

	; End of function sub_5D27A


; =============== S U B R O U T I N E =======================================

sub_5D2D2:
										
										trap    #1
										dc.w $100
										bne.s   loc_5D2E0
										trap    #TRAP_TEXTBOX
										dc.w $7B3               ; "Sorry, I can't open my{N}church for you.{N}Please understand.{W1}"
										trap    #TRAP_SETFLAG
										dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
loc_5D2E0:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_5D2D2


; =============== S U B R O U T I N E =======================================

nullsub_131:
										
										rts

	; End of function nullsub_131


; =============== S U B R O U T I N E =======================================

sub_5D2EA:
										
										trap    #1
										dc.w $320
										bne.s   loc_5D32A
										trap    #1
										dc.w $101
										bne.s   loc_5D324
										trap    #TRAP_TEXTBOX
										dc.w $7B4               ; "Hey, listen to me.{W1}"
										jsr     j_YesNoPrompt
										trap    #TRAP_TEXTBOX
										dc.w $FFFF
										tst.w   d0
										bne.s   loc_5D316
										trap    #TRAP_TEXTBOX
										dc.w $7B5               ; "Pacalon was always a good{N}customer for us!{N}They bought a lot!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $7B6               ; "But, now we can't sell our{N}weapons because of the{N}devils!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $7B7               ; "Annoying devils!{W1}"
										bra.s   loc_5D31E
loc_5D316:
										
										trap    #TRAP_TEXTBOX
										dc.w $7B8               ; "Oh, sorry.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $7B9               ; "I don't want to bother you.{W1}"
loc_5D31E:
										
										trap    #TRAP_SETFLAG
										dc.w $101
										bra.s   loc_5D328
loc_5D324:
										
										trap    #TRAP_TEXTBOX
										dc.w $7BA               ; "You again?{N}Bye now.{W1}"
loc_5D328:
										
										bra.s   return_5D336
loc_5D32A:
										
										move.b  #$1B,((RAM_CurrentShopIdx-$1000000)).w
										jsr     j_ShopActions
return_5D336:
										
										rts

	; End of function sub_5D2EA


; =============== S U B R O U T I N E =======================================

nullsub_132:
										
										rts

	; End of function nullsub_132

