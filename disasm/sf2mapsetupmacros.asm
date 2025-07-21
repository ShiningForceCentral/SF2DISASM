; ---------------------------------------------------------------------------
; Cutscene Macros
; One macro per cutscene command
; Maybe also aliases when needed for more efficiency in writing cutscenes
; ---------------------------------------------------------------------------


msMap: macro
	dc.w \1 ; map index
	dc.l \2 ; address of map pointer table
	endm

msFlag:	macro
	dc.w \1 ; associated flag
	dc.l \2 ; address of variant pointer table
	endm

msMapEnd: macro
    dc.w $FFFD
    endm
    
msEnd: macro
    dc.w $FFFF
    endm

msFixedEntity:	macro x, y, facing, mapsprite, actionScript
	dc.b \x
	dc.b \y
    if (STANDARD_BUILD=1) ; EXPANDED_MAPSPRITES
    dc.w \facing
    dc.w \mapsprite
    else
    dc.b \facing
    dc.b \mapsprite
    endif
	dc.l \actionScript
	endm

msSequencedEntity: macro x, y, facing, mapsprite, actionScript
	dc.b \x
	dc.b \y
    if (STANDARD_BUILD=1) ; EXPANDED_MAPSPRITES
    dc.w \facing
    dc.w \mapsprite
    else
    dc.b \facing
    dc.b \mapsprite
    endif
    dc.l \actionScript+$FE000000
    endm
	
msWalkingEntity: macro x, y, facing, mapsprite, originX, originY, range
	dc.b \x
	dc.b \y
    if (STANDARD_BUILD=1) ; EXPANDED_MAPSPRITES
    dc.w \facing
    dc.w \mapsprite
    else
    dc.b \facing
    dc.b \mapsprite
    endif
	dc.b $FF
	dc.b \originX
	dc.b \originY
	dc.b \range
	endm
	
msEntitiesEnd:	macro
	dc.w $FFFF
	endm	
	
emsEnd:	macro
	dc.w $FFFF
	endm	
	
msEntityEvent:	macro
	dc.b \1 ; entity #
	dc.b \2 ; facing (does it matter?)
	dc.w \3 ; branch length to event
	endm
	
msDefaultEntityEvent:	macro
	dc.b $FD
	dc.b 0
	dc.w \1 ; branch length to event
	endm
	
msDftEntityEvent:	macro
	dc.b $FD
	dc.b \1 ; 
	dc.w \2 ; 
	endm
	
msZoneEvent:	macro
	dc.b \1 ; trigger X
	dc.b \2 ; trigger Y
	dc.w \3 ; branch length to event
	endm
	
msDefaultZoneEvent:	macro
	dc.b $FD
	dc.b 0
	dc.w \1 ; branch length to event
	endm

msDesc:	macro
	dc.b \1 ; search x
	dc.b \2 ; search y
	dc.b 0
	dc.b 0
	dc.b \3 ; search text (0-area, 1-, 2-sign, 3-wash basin, 4-bookshelf, 5-well, 6-paper, 7-closet, 8-sign, 9-statue, 10-door)
	dc.b \4 ; description text offset
	endm
	
msDescFunction:	macro
	dc.b \1 ; search x
	dc.b \2 ; search y
	dc.b 0
	dc.b 1
	dc.w \3 ; branch length to event
	endm
	
msDescFunctionD6:	macro
	dc.b \1 ; search x
	dc.b \2 ; search y
	dc.b \3 ; 
	dc.b 1
	dc.w \4 ; 
	endm
	
msDescEnd:	macro
	dc.w $FD00
	endm	
	
msItemEvent:	macro
	dc.b \1 ; player X
	dc.b \2 ; player Y
	dc.b \3 ; player facing
	dc.b \4 ; item
	dc.w \5 ; branch length to event
	endm
	
msDefaultItemEvent:	macro
	dc.l $FD000000
	dc.w \1 ; branch length to event
	endm
