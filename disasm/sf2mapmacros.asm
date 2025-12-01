; ---------------------------------------------------------------------------
; Map Macros for map data sections
; ---------------------------------------------------------------------------

endWord: macro
    dc.w $FFFF
    endm
    

; Tilesets

mapPalette: macro
    dc.b \1
    endm
    
mapTileset1: macro
    dc.b \1
    endm
    
mapTileset2: macro
    dc.b \1
    endm
    
mapTileset3: macro
    dc.b \1
    endm
    
mapTileset4: macro
    dc.b \1
    endm
    
mapTileset5: macro
    dc.b \1
    endm


; Areas

mainLayerStart: macro
    dc.w \1 ; 
    dc.w \2 ; 
    endm

mainLayerEnd: macro
    dc.w \1 ; 
    dc.w \2 ; 
    endm

scndLayerFgndStart: macro
    dc.w \1 ; 
    dc.w \2 ; 
    endm

scndLayerBgndStart: macro
    dc.w \1 ; 
    dc.w \2 ; 
    endm

mainLayerParallax: macro
    dc.w \1 ; 
    dc.w \2 ; 
    endm

scndLayerParallax: macro
    dc.w \1 ; 
    dc.w \2 ; 
    endm

mainLayerAutoscroll: macro
    dc.b \1 ; 
    dc.b \2 ; 
    endm

scndLayerAutoscroll: macro
    dc.b \1 ; 
    dc.b \2 ; 
    endm

mainLayerType: macro 
    dc.b \1     ; Cleared=Map on background (Plane B), Set=Map on foreground (Plane A)
    endm

areaDefaultMusic: macro
    dc.b \1 ; 
    endm
    

; Flag block copies

fbcFlag: macro
    dc.w \1 ; associated flag
    endm

fbcSource: macro
    dc.b \1 ; X
    dc.b \2 ; Y
    endm

fbcSize: macro
    dc.b \1 ; width
    dc.b \2 ; height
    endm

fbcDest: macro
    dc.b \1 ; X
    dc.b \2 ; Y
    endm



; Step block copies

sbc: macro
    dc.b \1 ; trigger X
    dc.b \2 ; trigger Y
    endm

sbcSource: macro
    dc.b \1 ; X
    dc.b \2 ; Y
    endm

sbcSize: macro
    dc.b \1 ; width
    dc.b \2 ; height
    endm

sbcDest: macro
    dc.b \1 ; X
    dc.b \2 ; Y
    endm


; Layer 2 block copies

slbc: macro
    dc.b \1 ; trigger X
    dc.b \2 ; trigger Y
    endm

slbcSource: macro ; (255, 255 = empty)
    dc.b \1 ; X
    dc.b \2 ; Y
    endm

slbcSize: macro
    dc.b \1 ; width
    dc.b \2 ; height
    endm

slbcDest: macro
    dc.b \1 ; X
    dc.b \2 ; Y
    endm


; Warps

mWarp: macro
    dc.b \1 ; trigger X
    dc.b \2 ; trigger Y
    endm

warpNoScroll: macro
    dc.b 0
    endm

warpScroll: macro ; retains X/Y coord; does not initialize entities
    dc.b 0x10+\1
    endm

warpMap: macro
    dc.b \1 ; target map
    endm

warpDest: macro
    dc.b \1 ; target X
    dc.b \2 ; target Y
    endm

warpFacing: macro
    dc.b \1 ; target facing
    dc.b 0
    endm


; Chest items, Other items

mapItem: macro
    dc.b \1 ; search x
    dc.b \2 ; search y
    dc.b \3 ; associated flag
    defineShorthand.b ITEM_,\4
    endm
    

; Animations

mapAnimation: macro
    dc.w \1 ; animation tileset
    dc.w \2 ; speed?
    endm
    
mapAnimEntry: macro
    dc.w \1 ; starting replacement tile
    dc.w \2 ; # of tiles
    dc.w \3 ; starting tile to replace; ($-tileset 1, $100-tileset 2, $200-tileset 3, $-tileset 4, $300-tileset 5; $0-line 1, $10-line 2, $20-line 3..$70-line 8)?
    dc.w \4 ; animation counter
    endm



