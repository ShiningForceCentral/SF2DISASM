
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
		trap    #SET_FLAG
		dc.w $101
return_58E5A:
		rts

	; End of function sub_58E50

cs_58E5C:       textCursor $8D5
		nextText $FF,$FF        ; "Bring up the plank?"
		yesNo
		jumpIfFlagClear $59,cs_58EB8; YES/NO prompt answer
		hideText
		entityActions $0,$FF
		 moveDown 1
		endActions
		csWait 40
		setActscript $83,$FF,eas_46172
		setActscript $84,$FF,eas_46172
		setActscript $85,$FF,eas_46172
		entityActions $0,$0
		 moveDown 3
		endActions
		entityActions $83,$0
		 moveDown 3
		endActions
		entityActions $84,$0
		 moveDown 3
		endActions
		entityActions $85,$FF
		 moveDown 3
		endActions
		mapSysEvent $E,$D,$B,$3
cs_58EB8:       csc_end
