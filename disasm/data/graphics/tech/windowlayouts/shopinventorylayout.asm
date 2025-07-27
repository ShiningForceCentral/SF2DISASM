
; ASM FILE data\graphics\tech\windowlayouts\shopinventorylayout.asm :
; 0x1505C..0x151D6 : Shop inventory window layout
layout_ShopInventoryWindow:
                
; Syntax        vdpBaseTile [VDPTILE_]enum[|MIRROR|FLIP]
;
; Notes: PALETTE3 and PRIORITY bits are always set.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 1st line
                vdpBaseTile CORNER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile CORNER|MIRROR
                
; 2nd line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile DOLLAR_SIGN
                vdpBaseTile MENUTILE7
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE17
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE27
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE37
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE47
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE57
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 3rd line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE1
                vdpBaseTile MENUTILE2
                vdpBaseTile MENUTILE8
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE11
                vdpBaseTile MENUTILE12
                vdpBaseTile MENUTILE18
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE21
                vdpBaseTile MENUTILE22
                vdpBaseTile MENUTILE28
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE31
                vdpBaseTile MENUTILE32
                vdpBaseTile MENUTILE38
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE41
                vdpBaseTile MENUTILE42
                vdpBaseTile MENUTILE48
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE51
                vdpBaseTile MENUTILE52
                vdpBaseTile MENUTILE58
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 4th line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE3
                vdpBaseTile MENUTILE4
                vdpBaseTile MENUTILE9
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE13
                vdpBaseTile MENUTILE14
                vdpBaseTile MENUTILE19
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE23
                vdpBaseTile MENUTILE24
                vdpBaseTile MENUTILE29
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE33
                vdpBaseTile MENUTILE34
                vdpBaseTile MENUTILE39
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE43
                vdpBaseTile MENUTILE44
                vdpBaseTile MENUTILE49
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE53
                vdpBaseTile MENUTILE54
                vdpBaseTile MENUTILE59
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 5th line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE5
                vdpBaseTile MENUTILE6
                vdpBaseTile MENUTILE10
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE15
                vdpBaseTile MENUTILE16
                vdpBaseTile MENUTILE20
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE25
                vdpBaseTile MENUTILE26
                vdpBaseTile MENUTILE30
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE35
                vdpBaseTile MENUTILE36
                vdpBaseTile MENUTILE40
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE45
                vdpBaseTile MENUTILE46
                vdpBaseTile MENUTILE50
                vdpBaseTile SPACE
                vdpBaseTile MENUTILE55
                vdpBaseTile MENUTILE56
                vdpBaseTile MENUTILE60
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 6th line
                vdpBaseTile CORNER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile CORNER|MIRROR|FLIP
layout_ShopInventoryWindowLayoutSpacer:
                
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
