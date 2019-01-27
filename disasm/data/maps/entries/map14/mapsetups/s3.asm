
; ASM FILE data\maps\entries\map14\mapsetups\s3.asm :
; 0x58E48..0x58EBA : 
ms_map14_ZoneEvents:
		dc.b $2D
		dc.b 5
		dc.w sub_58E50-ms_map14_ZoneEvents
		dc.w $FD00
		dc.w return_58E5A-ms_map14_ZoneEvents

; =============== S U B R O U T I N E =======================================

sub_58E50:
		lea     cs_58E5C(pc), a0
		trap    #6
		setFlg $101             ; Temporary map setup flag 01
return_58E5A:
		rts

	; End of function sub_58E50

cs_58E5C:       textCursor $8D5
		nextText $FF,$FF        ; "Bring up the plank?"
		yesNo
		jumpIfFlagClear $59,cs_58EB8; YES/NO prompt answer
		hideText
		entityActionsWait $0
		 moveDown 1
		endActions
		csWait 40
		setActscriptWait $83,eas_46172
		setActscriptWait $84,eas_46172
		setActscriptWait $85,eas_46172
		entityActions $0
		 moveDown 3
		endActions
		entityActions $83
		 moveDown 3
		endActions
		entityActions $84
		 moveDown 3
		endActions
		entityActionsWait $85
		 moveDown 3
		endActions
		warp $E,$D,$B,$3
cs_58EB8:       csc_end
