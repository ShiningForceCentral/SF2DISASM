; ---------------------------------------------------------------------------
; Align and pad
; input: length to align to, value to use as padding (default is $FF)
; ---------------------------------------------------------------------------

align:	macro
	if (narg=1)
	dcb.b \1-(*%\1),$FF
	else
	dcb.b \1-(*%\1),\2
	endc
	endm
	
	
declareRomEnd:	macro
	if (EXPANDED_ROM=0)
	dc.l $1FFFFF
	else
	dc.l $3FFFFF
	endc
	endm	

enableSram:	macro
	if (EXPANDED_ROM=1)
	move.b #$01,($a130f1).l
	endc
	endm
	
disableSram:	macro
	if (EXPANDED_ROM=1)
	move.b #$00,($a130f1).l
	endc
	endm	
