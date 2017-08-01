
; ASM FILE data\maps\entries\map19\mapsetups\s2.asm :
; 0x52E02..0x52F60 : 
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
		
		trap    #CHECK_FLAG
		dc.w $100               
						; .0118=apparently reset on map load, usually used to skip some lines of entities
		bne.s   loc_52E48
		trap    #TEXTBOX
		dc.w $21F               
						; "I hate fighting.{W2}{N}But I've almost forgotten{N}how to fight fight in this{N}peaceful kingdom.{W1}"
		trap    #SET_FLAG
		dc.w $100               
						; .0118=apparently reset on map load, usually used to skip some lines of entities
loc_52E48:
		
		trap    #TEXTBOX
		dc.w $220               
						; "I'm going to the Ancient{N}Shrine in the south to{N}kill some rats.{W1}"
		rts

	; End of function sub_52E3A


; =============== S U B R O U T I N E =======================================

sub_52E4E:
		
		trap    #CHECK_FLAG
		dc.w $101
		bne.s   loc_52E5C
		trap    #TEXTBOX
		dc.w $221               
						; "Northern Galam is a country{N}on our border, but we are{N}allies.{W2}{N}Do we really need to guard{N}our country?{W2}"
		trap    #SET_FLAG
		dc.w $101
loc_52E5C:
		
		trap    #TEXTBOX
		dc.w $222               
						; "Some younger soldiers{N}think that peace is boring,{N}but they're wrong.{W1}"
		rts

	; End of function sub_52E4E


; =============== S U B R O U T I N E =======================================

sub_52E62:
		
		trap    #TEXTBOX
		dc.w $223               
						; "Zzzzz....{N}Zzzzz....{W1}"
		rts

	; End of function sub_52E62


; =============== S U B R O U T I N E =======================================

sub_52E68:
		
		trap    #TEXTBOX
		dc.w $224               
						; "Zz...huh...who are you?{N}I'm tired because I was{N}standing watch all night{W2}{N}long...zzzz....{W1}"
		rts

	; End of function sub_52E68


; =============== S U B R O U T I N E =======================================

sub_52E6E:
		
		trap    #CHECK_FLAG
		dc.w $102
		bne.s   loc_52E7C
		trap    #TEXTBOX
		dc.w $225               
						; "Weapons storage!{W2}"
		trap    #SET_FLAG
		dc.w $102
loc_52E7C:
		
		trap    #TEXTBOX
		dc.w $226               
						; "The weapons inside could{N}be rusty.  We haven't{N}opened the door for many{W2}{N}years.{W1}"
		rts

	; End of function sub_52E6E


; =============== S U B R O U T I N E =======================================

sub_52E82:
		
		trap    #CHECK_FLAG
		dc.w $103
		bne.s   loc_52E90
		trap    #TEXTBOX
		dc.w $227               
						; "This is King Granseal's{N}public room!{W2}{N}Oh, you must be pupils{N}of Sir Astral.{W2}{N}You look too young to work{N}for the King!{W2}"
		trap    #SET_FLAG
		dc.w $103
loc_52E90:
		
		trap    #TEXTBOX
		dc.w $228               
						; "Why don't you go back to{N}school?{W1}"
		rts

	; End of function sub_52E82


; =============== S U B R O U T I N E =======================================

sub_52E96:
		
		trap    #CHECK_FLAG
		dc.w $104
		bne.s   loc_52EA4
		trap    #TEXTBOX
		dc.w $229               
						; "I saw Sir Astral going into{N}the King's bedroom.{W2}"
		trap    #SET_FLAG
		dc.w $104
loc_52EA4:
		
		trap    #TEXTBOX
		dc.w $22A               
						; "He was in such a hurry.{N}Do you know why?{W1}"
		rts

	; End of function sub_52E96


; =============== S U B R O U T I N E =======================================

sub_52EAA:
		
		trap    #CHECK_FLAG
		dc.w $105
		bne.s   loc_52EB8
		trap    #TEXTBOX
		dc.w $22B               
						; "What's wrong with the{N}King?  He is usually{N}down here by now.{W2}"
		trap    #SET_FLAG
		dc.w $105
loc_52EB8:
		
		trap    #TEXTBOX
		dc.w $22C               
						; "I thought the King would{N}be the last person to{N}oversleep.{W1}"
		rts

	; End of function sub_52EAA


; =============== S U B R O U T I N E =======================================

sub_52EBE:
		
		trap    #CHECK_FLAG
		dc.w $106
		bne.s   loc_52ECC
		trap    #TEXTBOX
		dc.w $22D               
						; "How busy I am!  Soldiers{N}eat here everyday{N}without doing any work.{W2}"
		trap    #SET_FLAG
		dc.w $106
loc_52ECC:
		
		trap    #TEXTBOX
		dc.w $22E               
						; "But I think that's OK.{N}A soldier's job is fighting.{W1}"
		rts

	; End of function sub_52EBE


; =============== S U B R O U T I N E =======================================

sub_52ED2:
		
		trap    #TEXTBOX
		dc.w $22F               
						; "What is she doing now?{N}She brought the King his{N}breakfast over an hour ago.{W1}"
		rts

	; End of function sub_52ED2


; =============== S U B R O U T I N E =======================================

sub_52ED8:
		
		trap    #CHECK_FLAG
		dc.w $107
		bne.s   loc_52EE6
		trap    #TEXTBOX
		dc.w $230               
						; "I'm a messenger from Galam.{N}I came here to see the King.{W2}"
		trap    #SET_FLAG
		dc.w $107
loc_52EE6:
		
		trap    #TEXTBOX
		dc.w $231               
						; "But, he's still sleeping.{N}Did I arrive too early?{W1}"
		rts

	; End of function sub_52ED8


; =============== S U B R O U T I N E =======================================

sub_52EEC:
		
		trap    #TEXTBOX
		dc.w $232               
						; "The cook said that the{N}King didn't eat today.{N}I wonder why?{W1}"
		rts

	; End of function sub_52EEC


; =============== S U B R O U T I N E =======================================

sub_52EF2:
		
		trap    #CHECK_FLAG
		dc.w $25F               
						; set after talking to Astral about going to the tower
		bne.s   loc_52F04
		lea     cs_52F0C(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $25F               
						; set after talking to Astral about going to the tower
		bra.s   return_52F0A
loc_52F04:
		
		lea     cs_52F24(pc), a0
		trap    #6
return_52F0A:
		
		rts

	; End of function sub_52EF2

cs_52F0C:
		textCursor $23F         
						; Initial text line $23F : "I didn't want to involve{N}you, my children...but{N}this might be a good{W2}{N}opportunity for you to{N}learn how to properly{N}serve your King.{W2}{N}Are you ready, {LEADER}?{W1}"
		nextText $0,$8C         
						; "I didn't want to involve{N}you, my children...but{N}this might be a good{W2}{N}opportunity for you to{N}learn how to properly{N}serve your King.{W2}{N}Are you ready, {LEADER}?{W1}"
		yesNo                   
						; 0011 STORY YESNO PROMPT
		jumpIfFlagSet $59,cs_52F40
						; YES/NO prompt answer
		nextSingleText $0,$8C   
						; "Then, I'll wait for you here.{W2}{N}We have to hurry.{N}Come back when you're{N}ready.{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_52F24:
		textCursor $241         
						; Initial text line $241 : "Are you ready, {LEADER}?{W1}"
		nextText $0,$8C         
						; "Are you ready, {LEADER}?{W1}"
		yesNo                   
						; 0011 STORY YESNO PROMPT
		jumpIfFlagSet $59,cs_52F40
						; YES/NO prompt answer
		textCursor $240         
						; Initial text line $240 : "Then, I'll wait for you here.{W2}{N}We have to hurry.{N}Come back when you're{N}ready.{W1}"
		nextSingleText $0,$8C   
						; "Then, I'll wait for you here.{W2}{N}We have to hurry.{N}Come back when you're{N}ready.{W1}"
		csc_end                 
						; END OF CUTSCENE SCRIPT
cs_52F40:
		textCursor $242         
						; Initial text line $242 : "Good!{N}Let's go to the tower.{N}Follow me.{W1}"
		nextSingleText $0,$8C   
						; "Good!{N}Let's go to the tower.{N}Follow me.{W1}"
		moveEntity $8C,$FF,$1,$1
						; 002D MOVE ENTITY 8C FF 1 1
		moreMove $2,$8
		endMove $8080
		entityPosDir $8C,$3F,$3F,$2
						; 0019 SET ENTITY POS AND FACING 8C 3F 3F 2
		setF $260               
						; set after agreeing to go to the tower with Astral
		csc_end                 
						; END OF CUTSCENE SCRIPT
