; ---------------------------------------------------------------------------
; Align and pad
; input: length to align to, value to use as padding (default is $FF)
; ---------------------------------------------------------------------------

	include "sf2cutscenemacros.asm"
	include "sf2mapsetupmacros.asm"

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
	
sndCom:	macro
	trap #SOUND_COMMAND
	dc.w \1
	endm
	
chkFlg:	macro
	trap #CHECK_FLAG
	dc.w \1
	endm
	
setFlg:	macro
	trap #SET_FLAG
	dc.w \1
	endm
	
clrFlg:	macro
	trap #CLEAR_FLAG
	dc.w \1
	endm
	
checkFlg:	macro
	trap #4
	dc.w \1
	endm
	
txt:	macro
	trap #TEXTBOX
	dc.w \1
	endm
	
clsTxt:	macro
	trap #TEXTBOX
	dc.w $FFFF
	endm
	
script:	macro
	lea \1(pc), a0
	trap #MAPSCRIPT
	endm
	
flagSwitchedMap:	macro
	dc.w \1
	dc.w \2
	dc.w \3
	endm

flagSwitchedMapsEnd:	macro
	dc.w $FFFF
	endm
	
battleMapCoords:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.b \5
	dc.b \6
	dc.b \7
	endm
	
savePointMapCoords:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	endm
	
raftResetMapCoords:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	endm
	
allyBattleSprites:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.b \5
	dc.b \6
	dc.b \7
	dc.b \8
	dc.b \9
	endm
	
enemyBattleSprite:	macro
	dc.b \1
	dc.b \2
	endm
	
weaponSprite:	macro
	dc.b \1
	dc.b \2
	endm