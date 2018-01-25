
; ASM FILE data\maps\entries\map51\mapsetups\s3.asm :
; 0x5C2D6..0x5C3C0 : 
ms_map51_ZoneEvents:
		dc.b 9
		dc.b 6
		dc.w sub_5C2F2-ms_map51_ZoneEvents
		dc.b 9
		dc.b 7
		dc.w sub_5C2F2-ms_map51_ZoneEvents
		dc.b 9
		dc.b 8
		dc.w sub_5C2F2-ms_map51_ZoneEvents
		dc.b 9
		dc.b 9
		dc.w sub_5C2F2-ms_map51_ZoneEvents
		dc.b 9
		dc.b $18
		dc.w sub_5C304-ms_map51_ZoneEvents
		dc.b $A
		dc.b $18
		dc.w sub_5C304-ms_map51_ZoneEvents
		dc.w $FD00
		dc.w return_5C310-ms_map51_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_5C2F2:
		trap    #CHECK_FLAG
		dc.w $1D6
		bne.s   return_5C302
		lea     cs_5C312(pc), a0
		trap    #6
		trap    #SET_FLAG
		dc.w $1D6               ; set after you approach the pond to rescue Elric at the Harpy Pond
return_5C302:
		rts

	; End of function sub_5C2F2


; =============== S U B R O U T I N E =======================================

sub_5C304:
		trap    #CHECK_FLAG
		dc.w $1D6
		bne.s   return_5C310
		lea     cs_5C3AA(pc), a0
		trap    #6
return_5C310:
		rts

	; End of function sub_5C304

cs_5C312:       textCursor $9FB
		setActscriptWait $7,eas_Init
		setActscriptWait $1F,eas_Init
		setPos $80,7,16,UP
		setPos $81,6,17,UP
		setPos $82,8,17,UP
		nextText $0,$D          ; "Did you come to help me?{N}Oh, thank you!{W2}"
		nextSingleText $0,$D    ; "I might have been eaten by{N}monsters if you hadn't come.{W1}"
		nextSingleText $C0,$80  ; "My dinner is escaping!{W1}"
		setActscript $1F,eas_Jump
		setActscriptWait $7,eas_Jump
		csWait 5
		setActscript $7,eas_461B6
		csWait 120
		nextSingleText $0,$7    ; "Who said that?{W1}"
		setCamDest 3,12
		nextText $C0,$80        ; "That pond catches my food.{N}Hey elf boy, good trap, huh?{W2}"
		nextSingleText $C0,$80  ; "Those who get stuck in the{N}pond are mine.  It's my{N}rule.{W1}"
		nextSingleText $0,$D    ; "Then, all the missing people{N}were eaten by you?{W1}"
		nextSingleText $C0,$80  ; "They were in my pond.{W1}"
		entityActionsWait $80
		 moveUp 2
		endActions
		nextSingleText $C0,$80  ; "And this elf is my dinner{N}for tonight.  Got it?{W1}"
		setFacing $80,DOWN
		nextSingleText $C0,$80  ; "Did you guys bring the{N}ketchup? No? Oh, well.{W1}"
		setActscript $81,eas_Jump
		setActscriptWait $82,eas_Jump
		setStoryFlag $14        ; Battle 20 unlocked
		mapSysEvent $33,$0,$0,$0
		csc_end
cs_5C3AA:       textCursor $A05
		nextSingleText $0,$7    ; "{LEADER}, we have to{N}save him!{W1}"
		entityNod $0
		entityActionsWait $0
		 moveUp 1
		endActions
		csc_end
