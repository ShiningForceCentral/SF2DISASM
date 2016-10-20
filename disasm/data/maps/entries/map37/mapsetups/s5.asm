
; ASM FILE data\maps\entries\map37\mapsetups\s5.asm :
; 0x5FA2A..0x5FA88 : 
ms_map37_Section5:
		dc.b 8
		dc.b $B
		dc.b 2
		dc.b $71
		dc.w sub_5FA38-ms_map37_Section5
		dc.b $FD
		dc.b 0
		dc.b 0
		dc.b 0
		dc.w nullsub_68-ms_map37_Section5

; =============== S U B R O U T I N E =======================================

nullsub_68:
		
		rts

	; End of function nullsub_68


; =============== S U B R O U T I N E =======================================

sub_5FA38:
		
		trap    #CHECK_FLAG
		dc.w $3E7
		bne.s   return_5FA86
		move.w  #$71,((TEXT_NAME_INDEX_1-$1000000)).w 
		trap    #CHECK_FLAG
		dc.w $344
		bne.s   loc_5FA76
		trap    #TEXTBOX
		dc.w $D2D               
						; "{LEADER} tries to use{N}the {ITEM}.{W2}{N}But, he doesn't know how.{W1}"
		trap    #TEXTBOX
		dc.w $FFFF
		move.w  ((CURRENT_SPEAK_SOUND-$1000000)).w,((word_FFB09E-$1000000)).w
		move.w  #$80,d0 
		jsr     GetEntityPortraitAndSpeechSfx
		move.w  d1,((CURRENT_PORTRAIT-$1000000)).w
		move.w  d2,((CURRENT_SPEAK_SOUND-$1000000)).w
		jsr     LoadAndDisplayCurrentPortrait
		trap    #TEXTBOX
		dc.w $D2E               
						; "Well, {LEADER}.  Let's go{N}back to look for someone{N}who knows about this ship.{W1}"
		bra.s   loc_5FA84
loc_5FA76:
		
		trap    #TEXTBOX
		dc.w $D2F               
						; "{LEADER} fit the {ITEM}{N}into the cockpit.{W1}"
		trap    #TEXTBOX
		dc.w $FFFF
		lea     cs_5FB6A(pc), a0
		trap    #6
loc_5FA84:
		
		moveq   #$FFFFFFFF,d6
return_5FA86:
		
		rts

	; End of function sub_5FA38

