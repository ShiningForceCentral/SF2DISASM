; ---------------------------------------------------------------------------
; Map Macros for map data sections
; ---------------------------------------------------------------------------

endWord:	macro
	dc.w $FFFF
	endm
	

; Tilesets

mapPalette:	macro
	dc.b \1
	endm
	
mapTileset1:	macro
	dc.b \1
	endm
	
mapTileset2:	macro
	dc.b \1
	endm
	
mapTileset3:	macro
	dc.b \1
	endm
	
mapTileset4:	macro
	dc.b \1
	endm
	
mapTileset5:	macro
	dc.b \1
	endm


; Areas

mainLayerStart:	macro
	dc.w \1
	dc.w \2
	endm

mainLayerEnd:	macro
	dc.w \1
	dc.w \2
	endm

scndLayerFgndStart:	macro
	dc.w \1
	dc.w \2
	endm

scndLayerBgndStart:	macro
	dc.w \1
	dc.w \2
	endm

mainLayerParallax:	macro
	dc.w \1
	dc.w \2
	endm

scndLayerParallax:	macro
	dc.w \1
	dc.w \2
	endm

mainLayerAutoscroll:	macro
	dc.b \1
	dc.b \2
	endm

scndLayerAutoscroll:	macro
	dc.b \1
	dc.b \2
	endm

mainLayerType:	macro 
	dc.b \1           ; Cleared=Map on background (Plane B), Set=Map on foreground (Plane A)
	endm

areaDefaultMusic:	macro
	dc.b \1
	endm
	

; Flag block copies

fbcFlag:	macro
	dc.w \1
	endm

fbcSource:	macro
	dc.b \1
	dc.b \2
	endm

fbcSize:	macro
	dc.b \1
	dc.b \2
	endm

fbcDest:	macro
	dc.b \1
	dc.b \2
	endm



; Step block copies

sbc:	macro
	dc.b \1
	dc.b \2
	endm

sbcSource:	macro
	dc.b \1
	dc.b \2
	endm

sbcSize:	macro
	dc.b \1
	dc.b \2
	endm

sbcDest:	macro
	dc.b \1
	dc.b \2
	endm


; Layer 2 block copies

slbc:	macro
	dc.b \1
	dc.b \2
	endm

slbcSource:	macro
	dc.b \1
	dc.b \2
	endm

slbcSize:	macro
	dc.b \1
	dc.b \2
	endm

slbcDest:	macro
	dc.b \1
	dc.b \2
	endm


; Warps

mWarp:	macro
	dc.b \1
	dc.b \2
	endm

warpNoScroll:	macro
	dc.b 0
	endm

warpScroll:	macro
	dc.b 0x10+\1
	endm

warpMap:	macro
	dc.b \1
	endm

warpDest:	macro
	dc.b \1
	dc.b \2
	endm

warpFacing:	macro
	dc.b \1
	dc.b 0
	endm


; Chest items, Other items

mapItem:	macro
	dc.b \1
	dc.b \2
	dc.b \3
	defineShorthand.b ITEM_,\4
	endm
	

; Animations

mapAnimation:	macro
	dc.w \1
	dc.w \2
	endm
	
mapAnimEntry:	macro
	dc.w \1
	dc.w \2
	dc.w \3
	dc.w \4
	endm



