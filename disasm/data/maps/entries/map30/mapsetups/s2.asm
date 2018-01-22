
; ASM FILE data\maps\entries\map30\mapsetups\s2.asm :
; 0x5A20C..0x5A2C2 : 
ms_map30_EntityEvents:
		dc.b $80
		dc.b 1
		dc.w sub_5A224-ms_map30_EntityEvents
		dc.b $81
		dc.b 3
		dc.w sub_5A236-ms_map30_EntityEvents
		dc.b $82
		dc.b 0
		dc.w sub_5A240-ms_map30_EntityEvents
		dc.b $83
		dc.b 3
		dc.w sub_5A25C-ms_map30_EntityEvents
		dc.b $84
		dc.b 3
		dc.w sub_5A272-ms_map30_EntityEvents
		dc.w $FD00
		dc.w return_5A276-ms_map30_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5A224:
		trap    #CHECK_FLAG
		dc.w $2F8
		bne.s   loc_5A230
		trap    #TEXTBOX
		dc.w $6A9               ; "We came from Grans to look{N}for Mithril.{W1}"
		bra.s   return_5A234
loc_5A230:
		bsr.w   sub_5A278
return_5A234:
		rts

	; End of function sub_5A224


; =============== S U B R O U T I N E =======================================

sub_5A236:
		trap    #TEXTBOX
		dc.w $6AA               ; "Recent earthquakes have{N}buried the tunnel.{W2}{N}My friend is sick now, and{N}we can't dig out the tunnel{N}without him.{W1}"
		trap    #SET_FLAG
		dc.w $2F7               ; set after talking to one of the dwarves in the mine near the Fairy Woods
		rts

	; End of function sub_5A236


; =============== S U B R O U T I N E =======================================

sub_5A240:
		lea     cs_5A256(pc), a0
		trap    #6
		trap    #TEXTBOX
		dc.w $6AB               ; "(Shiver)...cold...{N}Oh...I'm so cold....{W1}"
		lea     cs_5A256(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $2F7               ; set after talking to one of the dwarves in the mine near the Fairy Woods
		rts

	; End of function sub_5A240

cs_5A256:       entityShiver $82
		csc_end

; =============== S U B R O U T I N E =======================================

sub_5A25C:
		trap    #1
		dc.w $2F9
		bne.s   loc_5A26C
		trap    #TEXTBOX
		dc.w $6AC               ; "One of us went to look for{N}the fairy.{W2}{N}I hope he's alright.{W1}"
		trap    #SET_FLAG
		dc.w $2F7               ; set after talking to one of the dwarves in the mine near the Fairy Woods
		bra.s   return_5A270
loc_5A26C:
		trap    #TEXTBOX
		dc.w $6AE               ; "Hey, visit us in the Dwarven{N}Village when you come to{N}Grans!{W1}"
return_5A270:
		rts

	; End of function sub_5A25C


; =============== S U B R O U T I N E =======================================

sub_5A272:
		trap    #TEXTBOX
		dc.w $6AD               ; "Dig, dig!{N}Hey hoo, hey hoo!{W2}{N}To Grans we are a diggin'!{N}Hey hoo, hey hoo!{W1}"
return_5A276:
		rts

	; End of function sub_5A272


; =============== S U B R O U T I N E =======================================

sub_5A278:
		trap    #TEXTBOX
		dc.w $6BE               ; "Thanks to you, he recovered.{W2}"
		trap    #TEXTBOX
		dc.w $6BF               ; "We all thank you.{N}Take this gift.{W1}"
		moveq   #0,d0
		moveq   #0,d1
		jsr     j_GetItemAndNumberOfItems
		cmpi.w  #4,d2
		bne.s   loc_5A296
		trap    #TEXTBOX
		dc.w $6C1               ; "Oh, your hands are full.{N}I'll give it to you later.{W1}"
		bra.s   return_5A2C0
loc_5A296:
		moveq   #0,d0
		moveq   #$72,d1 
		jsr     j_AddItem
		trap    #SOUND_COMMAND
		dc.w MUSIC_ITEM
		trap    #TEXTBOX
		dc.w $6C0               ; "{LEADER} is given a{N}Cannon.{W1}"
		moveq   #$64,d0 
		jsr     (Sleep).w       
		trap    #TEXTBOX
		dc.w $FFFF
		trap    #SET_FLAG
		dc.w $2F9               ; set after the dwarf gives Bowie the cannon
		trap    #SOUND_COMMAND
		dc.w SOUND_COMMAND_PLAY_PREVIOUS_MUSIC
		lea     cs_5A4FE(pc), a0
		trap    #6
return_5A2C0:
		rts

	; End of function sub_5A278

