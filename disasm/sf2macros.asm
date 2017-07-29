; ---------------------------------------------------------------------------
; Align and pad
; input: length to align to, value to use as padding (default is $FF)
; ---------------------------------------------------------------------------

	include "sf2cutscenemacros.asm"

align:	macro
	if (narg=1)
	dcb.b \1-(*%\1),$FF
	else
	dcb.b \1-(*%\1),\2
	endc
	endm
	
headerRegion:	macro
	if (EXPANDED_ROM=0)
	dc.b 'U               '
	else
	dc.b 'JUE             '
	endc
	endm
	
regionCheck:	macro
	if (EXPANDED_ROM=0)
	bsr.w   CheckRegion
	else
	nop
	nop
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
	move.b #$03,($a130f1).l
	endc
	endm
	
disableSram:	macro
	if (EXPANDED_ROM=1)
	move.b #$00,($a130f1).l
	endc
	endm	


conditionalRomExpand:	macro
	if (EXPANDED_ROM=1)
	include "layout\sf2-expanded-19-0x200000-0x400000.asm"
	endc
	endm
	
conditionalPc:	macro
	if (EXPANDED_ROM=0)
	\1 \2(pc),\3
	else
	\1 \2,\3
	endc
	endm
	
conditionalBsr:	macro
	if (EXPANDED_ROM=0)
	bsr.w \1
	else
	jsr \1
	endc
	endm
	
conditionalWordAddr:	macro
	if (EXPANDED_ROM=0)
	\1 (\2).w,\3
	else
	\1 (\2).l,\3
	endc
	endm	
	
alignIfVanillaRom:	macro
	if (EXPANDED_ROM=0)
	align \1
	endc
	endm
	
alignIfExpandedRom:	macro
	if (EXPANDED_ROM=1)
	align \1
	endc
	endm
	
includeIfVanillaRom:	macro
	if (EXPANDED_ROM=0)
	include \1
	endc
	endm
	
incbinIfVanillaRom:	macro
	if (EXPANDED_ROM=0)
	incbin \1
	endc
	endm

includeIfExpandedRom:	macro
	if (EXPANDED_ROM=1)
	include \1
	endc
	endm
	
incbinIfExpandedRom:	macro
	if (EXPANDED_ROM=1)
	incbin \1
	endc
	endm