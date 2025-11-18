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

sbc: macro triggerX, triggerY
    dc.b \triggerX
    dc.b \triggerY
    endm

sbcSource: macro x, y
    dc.b \x
    dc.b \y
    endm

sbcSize: macro width, height
    dc.b \width
    dc.b \height
    endm

sbcDest: macro x, y
    dc.b \x
    dc.b \y
    endm


; Layer 2 block copies

slbc: macro triggerX, triggerY
    dc.b \triggerX
    dc.b \triggerY
    endm

slbcSource: macro x, y ; (255, 255 = empty)
    dc.b \x
    dc.b \y
    endm

slbcSize: macro width, height
    dc.b \width
    dc.b \height
    endm

slbcDest: macro x, y
    dc.b \x
    dc.b \y
    endm


; Warps

mWarp: macro triggerX, triggerY
    dc.b \triggerX
    dc.b \triggerY
    endm

warpNoScroll: macro
    dc.b 0
    endm

warpScroll: macro ; retains X/Y coord; does not initialize entities
    dc.b 0x10+\1
    endm

warpMap: macro targetMap
    dc.b \targetMap
    endm

warpDest: macro targetX, targetY
    dc.b \targetX
    dc.b \targetY
    endm

warpFacing: macro targetFacing
    dc.b \targetFacing
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



