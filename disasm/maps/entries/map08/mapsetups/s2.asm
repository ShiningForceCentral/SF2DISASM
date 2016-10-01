
; SCRIPT SECTION maps\entries\map08\mapsetups\s2 :
; 
ms_map8_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_56090-ms_map8_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_560AC-ms_map8_EntityEvents
										dc.w $FD00
										dc.w return_56144-ms_map8_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_56090:
										
										trap    #TRAP_CHECKFLAG
										dc.w $100
										bne.s   loc_560A6
										trap    #TRAP_SETFLAG
										dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
										trap    #TRAP_TEXTBOX
										dc.w $529               ; "Our ancestors came from{N}Rune, a southern island,{N}long ago.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $52A               ; "Since then, we've travelled{N}up here.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $52B               ; "The mountains to the north{N}block our journey.{W2}"
loc_560A6:
										
										trap    #TRAP_TEXTBOX
										dc.w $52C               ; "Are you going to{N}Mt. Volcano?{N}That's {NAME;7}'s hometown?{W1}"
										rts

	; End of function sub_56090


; =============== S U B R O U T I N E =======================================

sub_560AC:
										
										trap    #TRAP_TEXTBOX
										dc.w $52D               ; "We won't hide from you{N}anymore.  Ribble has many{N}ancient ruins.{W1}"
										rts

	; End of function sub_560AC


; =============== S U B R O U T I N E =======================================

sub_560B2:
										
										trap    #TRAP_TEXTBOX
										dc.w $52E               ; "Men are so selfish.{N}My husband has gone to the{N}east to work.  What about me?{W1}"
										rts

	; End of function sub_560B2


; =============== S U B R O U T I N E =======================================

j_j_ChurchActions:
										
										jmp     j_ChurchActions

	; End of function j_j_ChurchActions


; =============== S U B R O U T I N E =======================================

sub_560BE:
										
										trap    #TRAP_TEXTBOX
										dc.w $52F               ; "Keseran is a historian.{N}But Mr. {NAME;11} is smarter{N}than him!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $530               ; "I saw a strange hollow in a{N}tree.  Does something go{N}there?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $531               ; "Is what you're looking for in{N}Ribble?{W1}"
										rts

	; End of function sub_560BE


; =============== S U B R O U T I N E =======================================

sub_560CC:
										
										trap    #TRAP_CHECKFLAG
										dc.w $2DB
										bne.s   loc_560DC
										trap    #TRAP_TEXTBOX
										dc.w $532               ; "I can't find it!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $533               ; "The hidden door to the{N}ancient ruins must be near{N}this tree!{W1}"
										bra.s   return_560E0
loc_560DC:
										
										trap    #TRAP_TEXTBOX
										dc.w $545               ; "Wow, the ancient door!{N}I knew it was there!  I did!{W1}"
return_560E0:
										
										rts

	; End of function sub_560CC


; =============== S U B R O U T I N E =======================================

sub_560E2:
										
										move.b  #3,((RAM_CurrentShopIdx-$1000000)).w
										jmp     j_ShopActions

	; End of function sub_560E2


; =============== S U B R O U T I N E =======================================

sub_560EE:
										
										lea     cs_56172(pc), a0
										trap    #6
										rts

	; End of function sub_560EE


; =============== S U B R O U T I N E =======================================

sub_560F6:
										
										trap    #TRAP_TEXTBOX
										dc.w $539               ; "Paseran and I are pupils{N}of Mr. {NAME;11} of Hassan.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $53A               ; "The ancient ruins around here{N}are very interesting to us!{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $53B               ; "We're sure there are ruins{N}under Ribble, but we can't{N}find the door?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $53C               ; "I'll find it before Paseran!{N}I think that tree has{N}something to do with it.{W1}"
										rts

	; End of function sub_560F6


; =============== S U B R O U T I N E =======================================

sub_56108:
										
										trap    #TRAP_TEXTBOX
										dc.w $53D               ; "We recently came from Hassan.{N}Hassan is a port in the south.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $53E               ; "It was once very prosperous,{N}but now it's desolate.{W1}"
										rts

	; End of function sub_56108


; =============== S U B R O U T I N E =======================================

sub_56112:
										
										trap    #TRAP_TEXTBOX
										dc.w $53F               ; "My dad went to the cave in{N}the north.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $540               ; "But, I'm not worried!{N}He's very strong.{W1}"
										rts

	; End of function sub_56112


; =============== S U B R O U T I N E =======================================

sub_5611C:
										
										trap    #TRAP_TEXTBOX
										dc.w $541               ; "My dear husband never{N}returned from the cave.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $542               ; "The cave was somehow{N}blocked.  How can I explain{N}this to my son?{W1}"
										rts

	; End of function sub_5611C


; =============== S U B R O U T I N E =======================================

sub_56126:
										
										move.b  #3,((RAM_CurrentShopIdx-$1000000)).w
										move.b  #$12,((RAM_CurrentShopIdx-$1000000)).w
										jmp     j_ShopActions

	; End of function sub_56126


; =============== S U B R O U T I N E =======================================

sub_56138:
										
										trap    #TRAP_CHECKFLAG
										dc.w 8
										bne.s   return_56144
										lea     cs_56146(pc), a0
										trap    #6
return_56144:
										
										rts

	; End of function sub_56138

cs_56146:           dc.w $15                ; 0015 SET ACTSCRIPT 8 FF 460CE
										dc.b 8
										dc.b $FF
										dc.l eas_Init           
										dc.w $15                ; 0015 SET ACTSCRIPT 8 FF 461AA
										dc.b 8
										dc.b $FF
										dc.l eas_461AA          
										dc.w $52                ; 0052 RELATED TO TWO ENTITIES 8 0
										dc.w 8
										dc.w 0
										dc.w 4                  ; 0004 SET TEXT INDEX 543 : "The people in this village{N}are cowards!{W2}{N}When do they ever go{N}adventuring?{N}I can't take it anymore!{W2}{N}Hey, would you mind if I{N}joined you?{W1}"
										dc.w $543
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8 : "The people in this village{N}are cowards!{W2}{N}When do they ever go{N}adventuring?{N}I can't take it anymore!{W2}{N}Hey, would you mind if I{N}joined you?{W1}"
										dc.w 8
										dc.w 8                  ; 0008 JOIN FORCE 8
										dc.w 8
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8 : "Now, let's go!{W1}"
										dc.w 8
										dc.w $56                ; 0056 SOMETHING WITH AN ENTITY 8
										dc.w 8
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_56172:           dc.w 4                  ; 0004 SET TEXT INDEX 534 : "To Mt. Volcano?{W1}"
										dc.w $534
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "To Mt. Volcano?{W1}"
										dc.w $87
										dc.w $15                ; 0015 SET ACTSCRIPT 87 0 45E44
										dc.b $87
										dc.b 0
										dc.l eas_Jump           
										dc.w $15                ; 0015 SET ACTSCRIPT 86 FF 45E44
										dc.b $86
										dc.b $FF
										dc.l eas_Jump           
										dc.w $23                ; 0023 SET ENTITY FACING 86 0
										dc.b $86
										dc.b 0
										dc.w $23                ; 0023 SET ENTITY FACING 87 2
										dc.b $87
										dc.b 2
										dc.b $80                ; WAIT 39
										dc.b $39
										dc.w $23                ; 0023 SET ENTITY FACING 86 3
										dc.b $86
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 86 : "Go east and then go north{N}along the river.  A cave is{N}there.{W2}"
										dc.w $86
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 86 : "But, I don't recommend you{N}enter such a terrible place!{W1}"
										dc.w $86
										dc.w $23                ; 0023 SET ENTITY FACING 87 3
										dc.b $87
										dc.b 3
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 87 : "We call it the Cave of{N}Darkness.  You can't see{N}anything inside.{W2}"
										dc.w $87
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 87 : "The cave is the only way to{N}get to Mt. Volcano.{W1}"
										dc.w $87
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
