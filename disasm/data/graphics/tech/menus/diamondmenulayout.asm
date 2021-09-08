
; ASM FILE data\graphics\tech\menus\diamondmenulayout.asm :
; 0x10E1C..0x10EF4 : Diamond menu layout
DiamondMenuLayout:
                
; Syntax        vdpTile [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
                vdpTile 0               ; tile layout for diamond menus
                vdpTile 0
                vdpTile 0
                vdpTile MENU1|PALETTE3|PRIORITY
                vdpTile MENU2|PALETTE3|PRIORITY
                vdpTile MENU3|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile MENU10|PALETTE3|PRIORITY
                vdpTile MENU11|PALETTE3|PRIORITY
                vdpTile MENU12|PALETTE3|PRIORITY
                vdpTile MENU4|PALETTE3|PRIORITY
                vdpTile MENU5|PALETTE3|PRIORITY
                vdpTile MENU6|PALETTE3|PRIORITY
                vdpTile MENU22|PALETTE3|PRIORITY
                vdpTile MENU23|PALETTE3|PRIORITY
                vdpTile MENU24|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile MENU13|PALETTE3|PRIORITY
                vdpTile MENU14|PALETTE3|PRIORITY
                vdpTile MENU15|PALETTE3|PRIORITY
                vdpTile MENU7|PALETTE3|PRIORITY
                vdpTile MENU8|PALETTE3|PRIORITY
                vdpTile MENU9|PALETTE3|PRIORITY
                vdpTile MENU25|PALETTE3|PRIORITY
                vdpTile MENU26|PALETTE3|PRIORITY
                vdpTile MENU27|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile MENU16|PALETTE3|PRIORITY
                vdpTile MENU17|PALETTE3|PRIORITY
                vdpTile MENU18|PALETTE3|PRIORITY
                vdpTile MENU34|PALETTE3|PRIORITY
                vdpTile MENU35|PALETTE3|PRIORITY
                vdpTile MENU36|PALETTE3|PRIORITY
                vdpTile MENU28|PALETTE3|PRIORITY
                vdpTile MENU29|PALETTE3|PRIORITY
                vdpTile MENU30|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile CORNER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|PALETTE3|PRIORITY
                vdpTile MENU19|PALETTE3|PRIORITY
                vdpTile MENU20|PALETTE3|PRIORITY
                vdpTile MENU21|PALETTE3|PRIORITY
                vdpTile MENU37|PALETTE3|PRIORITY
                vdpTile MENU38|PALETTE3|PRIORITY
                vdpTile MENU39|PALETTE3|PRIORITY
                vdpTile MENU31|PALETTE3|PRIORITY
                vdpTile MENU32|PALETTE3|PRIORITY
                vdpTile MENU33|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile V_BORDER|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile V_BORDER|MIRROR|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile MENU40|PALETTE3|PRIORITY
                vdpTile MENU41|PALETTE3|PRIORITY
                vdpTile MENU42|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile CORNER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|FLIP|PALETTE3|PRIORITY
