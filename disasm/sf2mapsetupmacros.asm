; ---------------------------------------------------------------------------
; Cutscene Macros
; One macro per cutscene command
; Maybe also aliases when needed for more efficiency in writing cutscenes
; ---------------------------------------------------------------------------


msMap:	macro
	dc.w \1
	dc.l \2
	endm

msFlag:	macro
	dc.w \1
	dc.l \2
	endm

msMapEnd:	macro
	dc.w $FFFD
	endm
	
msEnd:	macro
	dc.w $FFFF
	endm

msFixedEntity:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.l \5
	endm

msSequencedEntity:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.l \5+$FE000000
	endm
	
msWalkingEntity:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	dc.b \4
	dc.b $FF
	dc.b \5
	dc.b \6
	dc.b \7
	endm
	
msEntitiesEnd:	macro
	dc.w $FFFF
	endm	
	
emsEnd:	macro
	dc.w $FFFF
	endm	
	
	
