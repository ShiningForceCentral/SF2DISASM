; ---------------------------------------------------------------------------
; Cutscene Macros
; One macro per cutscene command
; Maybe also aliases when needed for more efficiency in writing cutscenes
; ---------------------------------------------------------------------------


csWait:	macro
	dc.b $80
	dc.b \1
	endm

csc00:	macro
	dc.w $00
	dc.w \1
	endm

nextSingleText:	macro ;alias
	csc00 \1
	endm
	
csc01:	macro
	dc.w $01
	dc.w \1
	dc.w \2
	endm

nextSingleTextVar:	macro ;alias
	csc01 \1,\2 
	endm
	
csc02:	macro
	dc.w $02
	dc.w \1
	endm
	
nextText:	macro ;alias
	csc02 \1
	endm	
	
csc03:	macro
	dc.w $03
	dc.w \1
	dc.w \2
	dc.w \3
	endm

nextTextVar:	macro ;alias
	csc03 \1,\2,\3 
	endm
		
csc04:	macro
	dc.w $04
	dc.w \1
	endm
	
textCursor:	macro ;alias
	csc04 \1
	endm		
	
csc05:	macro
	dc.w $05
	dc.w \1
	endm
	
playSound:	macro ;alias
	csc05 \1
	endm		
	
csc06:	macro
	dc.w $06
	endm
	
csc07:	macro
	dc.w $07
	dc.l \1
	endm
	
mapSysEvent:	macro ;alias
	csc07 \1
	endm
	
csc08:	macro
	dc.w $08
	dc.w \1
	endm
	
join:	macro ;alias
	csc08 \1
	endm
	
csc09:	macro
	dc.w $09
	endm
	
hideText:	macro ;alias
	csc09
	endm	
	
csc0A:	macro
	dc.w $0A
	dc.l \1
	endm
	
executeSubroutine:	macro ;alias
	csc0A \1
	endm
	
csc0B:	macro
	dc.w $0B
	dc.l \1
	endm
	
jump:	macro ;alias
	csc0B \1
	endm	
	
csc0C:	macro
	dc.w $0C
	dc.w \1
	dc.l \2
	endm
	
jumpIfFlagSet:	macro ;alias
	csc0C \1,\2
	endm	
	
csc0D:	macro
	dc.w $0D
	dc.w \1
	dc.l \2
	endm
	
jumpIfFlagClear:	macro ;alias
	csc0D \1,\2
	endm	
	
csc0E:	macro
	dc.w $0E
	dc.w \1
	dc.l \2
	endm
	
jumpIfDead:	macro ;alias
	csc0E \1,\2
	endm	
	
csc0F:	macro
	dc.w $0F
	dc.w \1
	dc.l \2
	endm
	
jumpIfAlive:	macro ;alias
	csc0F \1,\2
	endm	
	
csc10:	macro
	dc.w $10
	dc.w \1
	dc.w \2
	endm
	
setFlag:	macro ;alias
	csc10 \1,$FFFF
	endm
	
clearFlag:	macro ;alias
	csc10 \1,0
	endm
	
csc11:	macro
	dc.w $11
	endm
	
yesNoPrompt:	macro ;alias
	csc11
	endm
	
csc12:	macro
	dc.w $12
	dc.w \1
	endm
	
contextualMenu:	macro ;alias
	csc12 \1
	endm
	
csc13:	macro
	dc.w $13
	endm
	
setStoryFlag:	macro ;alias
	csc13 \1-$190
	endm
	
csc14:	macro
	dc.w $14
	endm
	
csc15:	macro
	dc.w $15
	endm
	
csc16:	macro
	dc.w $16
	endm
	
csc17:	macro
	dc.w $17
	endm
	
csc18:	macro
	dc.w $18
	endm
	
csc19:	macro
	dc.w $19
	endm
	
csc1A:	macro
	dc.w $1A
	endm
	
csc1B:	macro
	dc.w $1B
	endm
	
csc1C:	macro
	dc.w $1C
	endm
	
csc1D:	macro
	dc.w $1D
	endm
	
csc1E:	macro
	dc.w $1E
	endm
	
csc1F:	macro
	dc.w $1F
	endm
	
csc20:	macro
	dc.w $20
	endm
	
csc21:	macro
	dc.w $21
	endm
	
csc22:	macro
	dc.w $22
	endm
	
csc23:	macro
	dc.w $23
	endm
	
csc24:	macro
	dc.w $24
	endm
	
csc25:	macro
	dc.w $25
	endm
	
csc26:	macro
	dc.w $26
	endm
	
csc27:	macro
	dc.w $27
	endm
	
csc28:	macro
	dc.w $28
	endm
	
csc29:	macro
	dc.w $29
	endm
	
csc2A:	macro
	dc.w $2A
	endm
	
csc2B:	macro
	dc.w $2B
	endm
	
csc2C:	macro
	dc.w $2C
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2D:	macro
	dc.w $2D
	endm
	
csc2F:	macro
	dc.w $2F
	endm
	
csc30:	macro
	dc.w $30
	endm
	
csc31:	macro
	dc.w $31
	endm
	
csc32:	macro
	dc.w $32
	endm
	
csc33:	macro
	dc.w $33
	endm
	
csc34:	macro
	dc.w $34
	endm
	
csc35:	macro
	dc.w $35
	endm
	
csc36:	macro
	dc.w $36
	endm
	
csc37:	macro
	dc.w $37
	endm
	
csc39:	macro
	dc.w $39
	endm
	
csc3A:	macro
	dc.w $3A
	endm
	
csc3B:	macro
	dc.w $3B
	endm
	
csc3C:	macro
	dc.w $3C
	endm
	
csc3D:	macro
	dc.w $3D
	endm
	
csc3E:	macro
	dc.w $3E
	endm
	
csc3F:	macro
	dc.w $3F
	endm
	
csc40:	macro
	dc.w $40
	endm
	
csc41:	macro
	dc.w $41
	endm
	
csc42:	macro
	dc.w $42
	endm
	
csc43:	macro
	dc.w $43
	endm
	
csc44:	macro
	dc.w $44
	endm
	
csc45:	macro
	dc.w $45
	endm
	
csc46:	macro
	dc.w $46
	endm
	
csc47:	macro
	dc.w $47
	endm
	
csc48:	macro
	dc.w $48
	endm
	
csc49:	macro
	dc.w $49
	endm
	
csc4A:	macro
	dc.w $4A
	endm
	
csc4B:	macro
	dc.w $4B
	endm
	
csc50:	macro
	dc.w $50
	endm
	
csc51:	macro
	dc.w $51
	endm
	
csc52:	macro
	dc.w $52
	endm
	
csc53:	macro
	dc.w $53
	endm
	
csc54:	macro
	dc.w $54
	endm
	
csc55:	macro
	dc.w $55
	endm
	
csc56:	macro
	dc.w $56
	endm
	
cscNop:	macro
	endm

csc_end:	macro
	dc.w $FFFF
	endm
