
; SCRIPT SECTION maps\entries\map19\mapsetups\s2 :
; 
ms_map19_EntityEvents:
										dc.b $80
										dc.b 1
										dc.w sub_52E3A-ms_map19_EntityEvents
										dc.b $81
										dc.b 1
										dc.w sub_52E4E-ms_map19_EntityEvents
										dc.b $82
										dc.b 0
										dc.w sub_52E62-ms_map19_EntityEvents
										dc.b $83
										dc.b 0
										dc.w sub_52E68-ms_map19_EntityEvents
										dc.b $84
										dc.b 1
										dc.w sub_52E6E-ms_map19_EntityEvents
										dc.b $85
										dc.b 3
										dc.w sub_52E82-ms_map19_EntityEvents
										dc.b $86
										dc.b 3
										dc.w sub_52E96-ms_map19_EntityEvents
										dc.b $87
										dc.b 1
										dc.w sub_52EAA-ms_map19_EntityEvents
										dc.b $88
										dc.b 3
										dc.w sub_52EBE-ms_map19_EntityEvents
										dc.b $89
										dc.b 3
										dc.w sub_52ED2-ms_map19_EntityEvents
										dc.b $8A
										dc.b 3
										dc.w sub_52ED8-ms_map19_EntityEvents
										dc.b $8B
										dc.b 3
										dc.w sub_52EEC-ms_map19_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_52EF2-ms_map19_EntityEvents
										dc.w $FD00
										dc.w return_52F0A-ms_map19_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_52E3A:
										
										trap    #1
										dc.w $100
										bne.s   loc_52E48
										trap    #TRAP_TEXTBOX
										dc.w $21F               ; "I hate fighting.{W2}{N}But I've almost forgotten{N}how to fight fight in this{N}peaceful kingdom.{W1}"
										trap    #2
										dc.w $100
loc_52E48:
										
										trap    #TRAP_TEXTBOX
										dc.w $220               ; "I'm going to the Ancient{N}Shrine in the south to{N}kill some rats.{W1}"
										rts

	; End of function sub_52E3A


; =============== S U B R O U T I N E =======================================

sub_52E4E:
										
										trap    #1
										dc.w $101
										bne.s   loc_52E5C
										trap    #TRAP_TEXTBOX
										dc.w $221               ; "Northern Galam is a country{N}on our border, but we are{N}allies.{W2}{N}Do we really need to guard{N}our country?{W2}"
										trap    #2
										dc.w $101
loc_52E5C:
										
										trap    #TRAP_TEXTBOX
										dc.w $222               ; "Some younger soldiers{N}think that peace is boring,{N}but they're wrong.{W1}"
										rts

	; End of function sub_52E4E


; =============== S U B R O U T I N E =======================================

sub_52E62:
										
										trap    #TRAP_TEXTBOX
										dc.w $223               ; "Zzzzz....{N}Zzzzz....{W1}"
										rts

	; End of function sub_52E62


; =============== S U B R O U T I N E =======================================

sub_52E68:
										
										trap    #TRAP_TEXTBOX
										dc.w $224               ; "Zz...huh...who are you?{N}I'm tired because I was{N}standing watch all night{W2}{N}long...zzzz....{W1}"
										rts

	; End of function sub_52E68


; =============== S U B R O U T I N E =======================================

sub_52E6E:
										
										trap    #1
										dc.w $102
										bne.s   loc_52E7C
										trap    #TRAP_TEXTBOX
										dc.w $225               ; "Weapons storage!{W2}"
										trap    #2
										dc.w $102
loc_52E7C:
										
										trap    #TRAP_TEXTBOX
										dc.w $226               ; "The weapons inside could{N}be rusty.  We haven't{N}opened the door for many{W2}{N}years.{W1}"
										rts

	; End of function sub_52E6E


; =============== S U B R O U T I N E =======================================

sub_52E82:
										
										trap    #1
										dc.w $103
										bne.s   loc_52E90
										trap    #TRAP_TEXTBOX
										dc.w $227               ; "This is King Granseal's{N}public room!{W2}{N}Oh, you must be pupils{N}of Sir Astral.{W2}{N}You look too young to work{N}for the King!{W2}"
										trap    #2
										dc.w $103
loc_52E90:
										
										trap    #TRAP_TEXTBOX
										dc.w $228               ; "Why don't you go back to{N}school?{W1}"
										rts

	; End of function sub_52E82


; =============== S U B R O U T I N E =======================================

sub_52E96:
										
										trap    #1
										dc.w $104
										bne.s   loc_52EA4
										trap    #TRAP_TEXTBOX
										dc.w $229               ; "I saw Sir Astral going into{N}the King's bedroom.{W2}"
										trap    #2
										dc.w $104
loc_52EA4:
										
										trap    #TRAP_TEXTBOX
										dc.w $22A               ; "He was in such a hurry.{N}Do you know why?{W1}"
										rts

	; End of function sub_52E96


; =============== S U B R O U T I N E =======================================

sub_52EAA:
										
										trap    #1
										dc.w $105
										bne.s   loc_52EB8
										trap    #TRAP_TEXTBOX
										dc.w $22B               ; "What's wrong with the{N}King?  He is usually{N}down here by now.{W2}"
										trap    #2
										dc.w $105
loc_52EB8:
										
										trap    #TRAP_TEXTBOX
										dc.w $22C               ; "I thought the King would{N}be the last person to{N}oversleep.{W1}"
										rts

	; End of function sub_52EAA


; =============== S U B R O U T I N E =======================================

sub_52EBE:
										
										trap    #1
										dc.w $106
										bne.s   loc_52ECC
										trap    #TRAP_TEXTBOX
										dc.w $22D               ; "How busy I am!  Soldiers{N}eat here everyday{N}without doing any work.{W2}"
										trap    #2
										dc.w $106
loc_52ECC:
										
										trap    #TRAP_TEXTBOX
										dc.w $22E               ; "But I think that's OK.{N}A soldier's job is fighting.{W1}"
										rts

	; End of function sub_52EBE


; =============== S U B R O U T I N E =======================================

sub_52ED2:
										
										trap    #TRAP_TEXTBOX
										dc.w $22F               ; "What is she doing now?{N}She brought the King his{N}breakfast over an hour ago.{W1}"
										rts

	; End of function sub_52ED2


; =============== S U B R O U T I N E =======================================

sub_52ED8:
										
										trap    #1
										dc.w $107
										bne.s   loc_52EE6
										trap    #TRAP_TEXTBOX
										dc.w $230               ; "I'm a messenger from Galam.{N}I came here to see the King.{W2}"
										trap    #2
										dc.w $107
loc_52EE6:
										
										trap    #TRAP_TEXTBOX
										dc.w $231               ; "But, he's still sleeping.{N}Did I arrive too early?{W1}"
										rts

	; End of function sub_52ED8


; =============== S U B R O U T I N E =======================================

sub_52EEC:
										
										trap    #TRAP_TEXTBOX
										dc.w $232               ; "The cook said that the{N}King didn't eat today.{N}I wonder why?{W1}"
										rts

	; End of function sub_52EEC


; =============== S U B R O U T I N E =======================================

sub_52EF2:
										
										trap    #1
										dc.w $25F
										bne.s   loc_52F04
										lea     cs_52F0C(pc), a0
										trap    #6
										trap    #2
										dc.w $25F
										bra.s   return_52F0A
loc_52F04:
										
										lea     cs_52F24(pc), a0
										trap    #6
return_52F0A:
										
										rts

	; End of function sub_52EF2

cs_52F0C:           dc.w 4                  ; 0004 SET TEXT INDEX 23F
										dc.w $23F
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 52F40
										dc.w $59                ; Unkown command : 59
										dc.l cs_52F40           ; 0005 PLAY SOUND 
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_52F24:           dc.w 4                  ; 0004 SET TEXT INDEX 241
										dc.w $241
										dc.w 2                  ; 0002 DISPLAY TEXT BOX 8C
										dc.w $8C
										dc.w $11                ; 0011 STORY YESNO PROMPT
										dc.w $C                 ; 000C JUMP IF SET FLAG 59 52F40
										dc.w $59
										dc.l cs_52F40           ; 0005 PLAY SOUND 
										dc.w 4                  ; 0004 SET TEXT INDEX 240
										dc.w $240
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
cs_52F40:           dc.w 4                  ; 0004 SET TEXT INDEX 242
										dc.w $242
										dc.w 0                  ; 0000 DISPLAY SINGLE TEXTBOX 8C
										dc.w $8C
										dc.w $2D                ; 002D MOVE ENTITY 8C FF 1 1
										dc.b $8C
										dc.b $FF
										dc.b 1
										dc.b 1
										dc.b 2
										dc.b 8
										dc.w $8080
										dc.w $19                ; 0019 SET ENTITY POS AND FACING 8C 3F 3F 2
										dc.b $8C
										dc.b $3F
										dc.b $3F
										dc.b 2
										dc.w $10                ; 0010 SET FLAG 260 FFFF
										dc.w $260
										dc.w $FFFF
										dc.w $FFFF              ; END OF CUTSCENE SCRIPT
