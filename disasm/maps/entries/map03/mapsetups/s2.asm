
; SCRIPT SECTION maps\entries\map03\mapsetups\s2 :
; 
ms_map3_EntityEvents:
										dc.b 1
										dc.b 3
										dc.w sub_50F54-ms_map3_EntityEvents
										dc.b 2
										dc.b 0
										dc.w sub_50F98-ms_map3_EntityEvents
										dc.b $80
										dc.b 1
										dc.w sub_50FBA-ms_map3_EntityEvents
										dc.b $81
										dc.b 3
										dc.w sub_50FCC-ms_map3_EntityEvents
										dc.b $82
										dc.b 1
										dc.w sub_50FD6-ms_map3_EntityEvents
										dc.b $83
										dc.b 1
										dc.w sub_50FE4-ms_map3_EntityEvents
										dc.b $84
										dc.b 0
										dc.w sub_50FEA-ms_map3_EntityEvents
										dc.b $85
										dc.b 1
										dc.w sub_50FF0-ms_map3_EntityEvents
										dc.b $86
										dc.b 1
										dc.w sub_50FFE-ms_map3_EntityEvents
										dc.b $89
										dc.b 1
										dc.w sub_51004-ms_map3_EntityEvents
										dc.b $8A
										dc.b 1
										dc.w sub_5100E-ms_map3_EntityEvents
										dc.b $8B
										dc.b 1
										dc.w sub_51020-ms_map3_EntityEvents
										dc.b $8C
										dc.b 1
										dc.w sub_51032-ms_map3_EntityEvents
										dc.b $8D
										dc.b 1
										dc.w sub_5103C-ms_map3_EntityEvents
										dc.b $90
										dc.b 1
										dc.w sub_50FFE-ms_map3_EntityEvents
										dc.b $8E
										dc.b 3
										dc.w sub_51044-ms_map3_EntityEvents
										dc.w $FD00
										dc.w return_5105A-ms_map3_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_50F54:
										
										trap    #TRAP_CHECKFLAG
										dc.w $25B               ; set after the messenger scene
										bne.s   loc_50F8A
										trap    #TRAP_CHECKFLAG
										dc.w $25A               ; set after Astral's second basement line
										bne.s   loc_50F84
										trap    #TRAP_CHECKFLAG
										dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
										bne.s   loc_50F6A
										trap    #TRAP_TEXTBOX
										dc.w $200               ; "Hi, {LEADER}!{N}How are you?{W2}"
loc_50F6A:
										
										trap    #TRAP_TEXTBOX
										dc.w $1E0               ; "Sir Astral is in the{N}basement, but he looks{N}"
										trap    #TRAP_TEXTBOX
										dc.w $1E1               ; "strange today.{W1}"
										trap    #TRAP_CHECKFLAG
										dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
										bne.s   loc_50F82
										lea     cs_513D6(pc), a0
										trap    #6
										trap    #TRAP_SETFLAG
										dc.w $100               ; .0118=apparently reset on map load, usually used to skip some lines of entities
loc_50F82:
										
										bra.s   loc_50F88
loc_50F84:
										
										trap    #TRAP_TEXTBOX
										dc.w $1F6               ; "What's wrong with you?{N}Your seat is next to{N}{NAME;2}!{W1}"
loc_50F88:
										
										bra.s   return_50F96
loc_50F8A:
										
										trap    #TRAP_CHECKFLAG
										dc.w $42                ; Sarah + Chester are followers
										bne.s   return_50F96
										lea     cs_513E2(pc), a0
										trap    #6
return_50F96:
										
										rts

	; End of function sub_50F54


; =============== S U B R O U T I N E =======================================

sub_50F98:
										
										trap    #TRAP_CHECKFLAG
										dc.w $25B               ; set after the messenger scene
										bne.s   loc_50FB4
										trap    #TRAP_CHECKFLAG
										dc.w $25A               ; set after Astral's second basement line
										bne.s   loc_50FAA
										trap    #TRAP_TEXTBOX
										dc.w $1E2               ; "Hooo...I'm sleepy.{N}{NAME;3} must be sleeping{N}soundly about now.{W1}"
										bra.s   loc_50FB2
loc_50FAA:
										
										trap    #TRAP_TEXTBOX
										dc.w $1F7               ; "Zzzzz...zzzzz...{N}...ye...yes!{W1}"
										trap    #TRAP_TEXTBOX
										dc.w $1F8               ; "Oh, it's you, {LEADER}.{N}I thought it was Sir Astral!{W1}"
loc_50FB2:
										
										bra.s   return_50FB8
loc_50FB4:
										
										trap    #TRAP_TEXTBOX
										dc.w $1FB               ; "Yeah, I do want to go to{N}the castle, but {LEADER},{N}how about you?{W1}"
return_50FB8:
										
										rts

	; End of function sub_50F98


; =============== S U B R O U T I N E =======================================

sub_50FBA:
										
										trap    #TRAP_CHECKFLAG
										dc.w $25A               ; set after Astral's second basement line
										bne.s   loc_50FC6
										trap    #TRAP_TEXTBOX
										dc.w $1E3               ; "Hurry to school!{N}Sir Astral and {NAME;1} must{N}be waiting.{W1}"
										bra.s   return_50FCA
loc_50FC6:
										
										trap    #TRAP_TEXTBOX
										dc.w $1F9               ; "I'm busy!{N}The storm last night{N}messed up the house.{W1}"
return_50FCA:
										
										rts

	; End of function sub_50FBA


; =============== S U B R O U T I N E =======================================

sub_50FCC:
										
										trap    #TRAP_TEXTBOX
										dc.w $1E4               ; "He thinks of you as his own{N}grandson.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $1E5               ; "Sometimes he may badger{N}you, but that's because he{N}loves you.{W1}"
										rts

	; End of function sub_50FCC


; =============== S U B R O U T I N E =======================================

sub_50FD6:
										
										trap    #TRAP_TEXTBOX
										dc.w $1E6               ; "Hi, boy!  Good morning.{N}Are you going to school?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $1E7               ; "Say, Sir Astral certainly{N}is a great person.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $1E8               ; "He even teaches a{N}mischievous kid like you.{W1}"
										rts

	; End of function sub_50FD6


; =============== S U B R O U T I N E =======================================

sub_50FE4:
										
										trap    #TRAP_TEXTBOX
										dc.w $1E9               ; "Good morning {LEADER}!{N}It's a wonderful day,{N}isn't it?{W1}"
										rts

	; End of function sub_50FE4


; =============== S U B R O U T I N E =======================================

sub_50FEA:
										
										trap    #TRAP_TEXTBOX
										dc.w $1EA               ; "Zzzzz...zzzzz....{W1}"
										rts

	; End of function sub_50FEA


; =============== S U B R O U T I N E =======================================

sub_50FF0:
										
										trap    #TRAP_TEXTBOX
										dc.w $1EB               ; "Sir Astral is the wisest{N}person in Granseal.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $1EC               ; "He's such a great man, he{N}opened a school all{N}by himself.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $1ED               ; "You must realize how lucky{N}you are.{W1}"
										rts

	; End of function sub_50FF0


; =============== S U B R O U T I N E =======================================

sub_50FFE:
										
										trap    #TRAP_TEXTBOX
										dc.w $1EE               ; "Hi, would-be customer!{N}Sorry, we are not open yet.{W1}"
										rts

	; End of function sub_50FFE


; =============== S U B R O U T I N E =======================================

sub_51004:
										
										trap    #TRAP_TEXTBOX
										dc.w $1EF               ; "Granseal's harbor is behind{N}me.{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $1F0               ; "All ships left early this{N}morning.{W1}"
										rts

	; End of function sub_51004


; =============== S U B R O U T I N E =======================================

sub_5100E:
										
										trap    #TRAP_CHECKFLAG
										dc.w $25C               ; set after the guards have listened to Sarah and allowed you into the castle
										bne.s   loc_5101A
										trap    #TRAP_TEXTBOX
										dc.w $1F1               ; "You cannot enter the castle{N}of Granseal.  Go away!{W1}"
										bra.s   return_5101E
loc_5101A:
										
										trap    #TRAP_TEXTBOX
										dc.w $1FC               ; "To deliver him a package?{N}Really?{W1}"
return_5101E:
										
										rts

	; End of function sub_5100E


; =============== S U B R O U T I N E =======================================

sub_51020:
										
										trap    #TRAP_CHECKFLAG
										dc.w $25C               ; set after the guards have listened to Sarah and allowed you into the castle
										bne.s   loc_5102C
										trap    #TRAP_TEXTBOX
										dc.w $1F1               ; "You cannot enter the castle{N}of Granseal.  Go away!{W1}"
										bra.s   return_51030
loc_5102C:
										
										trap    #TRAP_TEXTBOX
										dc.w $1FD               ; "(Cough!)  Be good in the{N}castle, OK?{W1}"
return_51030:
										
										rts

	; End of function sub_51020


; =============== S U B R O U T I N E =======================================

sub_51032:
										
										trap    #TRAP_TEXTBOX
										dc.w $1F2               ; "You unruly boy!{N}Where on earth are you{N}going?{W2}"
										trap    #TRAP_TEXTBOX
										dc.w $1F3               ; "There is no school outside!{N}Go to school!{W1}"
										rts

	; End of function sub_51032


; =============== S U B R O U T I N E =======================================

sub_5103C:
										
										jsr     j_ChurchActions
										rts

	; End of function sub_5103C


; =============== S U B R O U T I N E =======================================

sub_51044:
										
										trap    #TRAP_CHECKFLAG
										dc.w $105
										bne.s   loc_51052
										trap    #TRAP_TEXTBOX
										dc.w $1F4               ; "Oh, morning {LEADER}.{N}When did you come in?{W2}"
										trap    #TRAP_SETFLAG
										dc.w $105
loc_51052:
										
										trap    #TRAP_TEXTBOX
										dc.w $1F5               ; "Is it time to start school?{N}OK, I'm coming up soon.{W1}"
										trap    #TRAP_SETFLAG
										dc.w $25A               ; set after Astral's second basement line
return_5105A:
										
										rts

	; End of function sub_51044

