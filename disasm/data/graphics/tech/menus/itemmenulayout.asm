
; ASM FILE data\graphics\tech\menus\itemmenulayout.asm :
; 0x10FCC..0x110A4 : Item menu layout
layout_ItemMenu:
; Syntax        vdpTile [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 1st line
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile MENUTILE1|PALETTE3|PRIORITY
                vdpTile MENUTILE2|PALETTE3|PRIORITY
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
                vdpTile 
                
; 2nd line
                vdpTile 
                vdpTile MENUTILE7|PALETTE3|PRIORITY
                vdpTile MENUTILE8|PALETTE3|PRIORITY
                vdpTile MENUTILE3|PALETTE3|PRIORITY
                vdpTile MENUTILE4|PALETTE3|PRIORITY
                vdpTile MENUTILE21|PALETTE3|PRIORITY
                vdpTile MENUTILE22|PALETTE3|PRIORITY
                vdpTile 
                vdpTile CORNER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|PALETTE3|PRIORITY
                
; 3rd line
                vdpTile 
                vdpTile MENUTILE9|PALETTE3|PRIORITY
                vdpTile MENUTILE10|PALETTE3|PRIORITY
                vdpTile MENUTILE5|PALETTE3|PRIORITY
                vdpTile MENUTILE6|PALETTE3|PRIORITY
                vdpTile MENUTILE23|PALETTE3|PRIORITY
                vdpTile MENUTILE24|PALETTE3|PRIORITY
                vdpTile 
                vdpTile V_BORDER|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 4th line
                vdpTile 
                vdpTile MENUTILE11|PALETTE3|PRIORITY
                vdpTile MENUTILE12|PALETTE3|PRIORITY
                vdpTile MENUTILE15|PALETTE3|PRIORITY
                vdpTile MENUTILE16|PALETTE3|PRIORITY
                vdpTile MENUTILE25|PALETTE3|PRIORITY
                vdpTile MENUTILE26|PALETTE3|PRIORITY
                vdpTile 
                vdpTile V_BORDER|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 5th line
                vdpTile 
                vdpTile MENUTILE13|PALETTE3|PRIORITY
                vdpTile MENUTILE14|PALETTE3|PRIORITY
                vdpTile MENUTILE17|PALETTE3|PRIORITY
                vdpTile MENUTILE18|PALETTE3|PRIORITY
                vdpTile MENUTILE27|PALETTE3|PRIORITY
                vdpTile MENUTILE28|PALETTE3|PRIORITY
                vdpTile 
                vdpTile V_BORDER|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 6th line
                vdpTile 
                vdpTile 
                vdpTile 
                vdpTile MENUTILE19|PALETTE3|PRIORITY
                vdpTile MENUTILE20|PALETTE3|PRIORITY
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
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|FLIP|PALETTE3|PRIORITY
                
