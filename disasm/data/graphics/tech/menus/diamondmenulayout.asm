
; ASM FILE data\graphics\tech\menus\diamondmenulayout.asm :
; 0x10E1C..0x10EF4 : Diamond menu layout
layout_DiamondMenu:
                
; Syntax        vdpTile [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                vdpTile                 ; tile layout for diamond menus
                vdpTile 
                vdpTile 
                vdpTile MENUTILE1|PALETTE3|PRIORITY
                vdpTile MENUTILE2|PALETTE3|PRIORITY
                vdpTile MENUTILE3|PALETTE3|PRIORITY
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile MENUTILE10|PALETTE3|PRIORITY
                vdpTile MENUTILE11|PALETTE3|PRIORITY
                vdpTile MENUTILE12|PALETTE3|PRIORITY
                vdpTile MENUTILE4|PALETTE3|PRIORITY
                vdpTile MENUTILE5|PALETTE3|PRIORITY
                vdpTile MENUTILE6|PALETTE3|PRIORITY
                vdpTile MENUTILE22|PALETTE3|PRIORITY
                vdpTile MENUTILE23|PALETTE3|PRIORITY
                vdpTile MENUTILE24|PALETTE3|PRIORITY
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile MENUTILE13|PALETTE3|PRIORITY
                vdpTile MENUTILE14|PALETTE3|PRIORITY
                vdpTile MENUTILE15|PALETTE3|PRIORITY
                vdpTile MENUTILE7|PALETTE3|PRIORITY
                vdpTile MENUTILE8|PALETTE3|PRIORITY
                vdpTile MENUTILE9|PALETTE3|PRIORITY
                vdpTile MENUTILE25|PALETTE3|PRIORITY
                vdpTile MENUTILE26|PALETTE3|PRIORITY
                vdpTile MENUTILE27|PALETTE3|PRIORITY
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile MENUTILE16|PALETTE3|PRIORITY
                vdpTile MENUTILE17|PALETTE3|PRIORITY
                vdpTile MENUTILE18|PALETTE3|PRIORITY
                vdpTile MENUTILE34|PALETTE3|PRIORITY
                vdpTile MENUTILE35|PALETTE3|PRIORITY
                vdpTile MENUTILE36|PALETTE3|PRIORITY
                vdpTile MENUTILE28|PALETTE3|PRIORITY
                vdpTile MENUTILE29|PALETTE3|PRIORITY
                vdpTile MENUTILE30|PALETTE3|PRIORITY
                vdpTile 
                vdpTile CORNER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|PALETTE3|PRIORITY
                vdpTile MENUTILE19|PALETTE3|PRIORITY
                vdpTile MENUTILE20|PALETTE3|PRIORITY
                vdpTile MENUTILE21|PALETTE3|PRIORITY
                vdpTile MENUTILE37|PALETTE3|PRIORITY
                vdpTile MENUTILE38|PALETTE3|PRIORITY
                vdpTile MENUTILE39|PALETTE3|PRIORITY
                vdpTile MENUTILE31|PALETTE3|PRIORITY
                vdpTile MENUTILE32|PALETTE3|PRIORITY
                vdpTile MENUTILE33|PALETTE3|PRIORITY
                vdpTile 
                vdpTile V_BORDER|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile V_BORDER|MIRROR|PALETTE3|PRIORITY
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile MENUTILE40|PALETTE3|PRIORITY
                vdpTile MENUTILE41|PALETTE3|PRIORITY
                vdpTile MENUTILE42|PALETTE3|PRIORITY
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile CORNER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|FLIP|PALETTE3|PRIORITY
