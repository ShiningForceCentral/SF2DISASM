
; ASM FILE data\maps\entries\map30\mapsetups\s2.asm :
; 0x5A20C..0x5A2C2 : 
ms_map30_EntityEvents:
		msEntityEvent 128, UP, sub_5A224-ms_map30_EntityEvents
		msEntityEvent 129, DOWN, sub_5A236-ms_map30_EntityEvents
		msEntityEvent 130, RIGHT, sub_5A240-ms_map30_EntityEvents
		msEntityEvent 131, DOWN, sub_5A25C-ms_map30_EntityEvents
		msEntityEvent 132, DOWN, sub_5A272-ms_map30_EntityEvents
		msDefaultEntityEvent 0, entevdft_5A276-ms_map30_EntityEvents

; =============== S U B R O U T I N E =======================================

sub_5A224:
		 
		chkFlg $2F8             ; set after the fairy cures the sick dwarf in the mine
		bne.s   loc_5A230
		txt $6A9                ; "We came from Grans to look{N}for Mithril.{W1}"
		bra.s   return_5A234
loc_5A230:
		bsr.w   sub_5A278
return_5A234:
		rts

	; End of function sub_5A224


; =============== S U B R O U T I N E =======================================

sub_5A236:
		 
		txt $6AA                ; "Recent earthquakes have{N}buried the tunnel.{W2}{N}My friend is sick now, and{N}we can't dig out the tunnel{N}without him.{W1}"
		setFlg $2F7             ; set after talking to one of the dwarves in the mine near the Fairy Woods
		rts

	; End of function sub_5A236


; =============== S U B R O U T I N E =======================================

sub_5A240:
		 
		script  cs_5A256
		txt $6AB                ; "(Shiver)...cold...{N}Oh...I'm so cold....{W1}"
		script  cs_5A256
		setFlg $2F7             ; set after talking to one of the dwarves in the mine near the Fairy Woods
		rts

	; End of function sub_5A240

cs_5A256:       shiver $82
		csc_end

; =============== S U B R O U T I N E =======================================

sub_5A25C:
		 
		chkFlg $2F9             ; set after the dwarf gives Bowie the cannon
		bne.s   byte_5A26C      
		txt $6AC                ; "One of us went to look for{N}the fairy.{W2}{N}I hope he's alright.{W1}"
		setFlg $2F7             ; set after talking to one of the dwarves in the mine near the Fairy Woods
		bra.s   return_5A270
byte_5A26C:
		txt $6AE                ; "Hey, visit us in the Dwarven{N}Village when you come to{N}Grans!{W1}"
return_5A270:
		rts

	; End of function sub_5A25C


; =============== S U B R O U T I N E =======================================

sub_5A272:
		 
		txt $6AD                ; "Dig, dig!{N}Hey hoo, hey hoo!{W2}{N}To Grans we are a diggin'!{N}Hey hoo, hey hoo!{W1}"
entevdft_5A276:
		
		rts

	; End of function sub_5A272


; =============== S U B R O U T I N E =======================================

sub_5A278:
		 
		txt $6BE                ; "Thanks to you, he recovered.{W2}"
		txt $6BF                ; "We all thank you.{N}Take this gift.{W1}"
		moveq   #0,d0
		moveq   #0,d1
		jsr     j_GetItemAndNumberOfItems
		cmpi.w  #4,d2
		bne.s   loc_5A296
		txt $6C1                ; "Oh, your hands are full.{N}I'll give it to you later.{W1}"
		bra.s   return_5A2C0
loc_5A296:
		moveq   #0,d0
		moveq   #$72,d1 
		jsr     j_AddItem
		sndCom MUSIC_ITEM
		txt $6C0                ; "{LEADER} is given a{N}Cannon.{W1}"
		moveq   #$64,d0 
		jsr     (Sleep).w       
		clsTxt
		setFlg $2F9             ; set after the dwarf gives Bowie the cannon
		sndCom SOUND_COMMAND_PLAY_PREVIOUS_MUSIC
		script  cs_5A4FE
return_5A2C0:
		rts

	; End of function sub_5A278

