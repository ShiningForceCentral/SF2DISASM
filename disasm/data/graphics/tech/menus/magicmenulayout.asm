
; ASM FILE data\graphics\tech\menus\magicmenulayout.asm :
; 0x10EF4..0x10FCC : Magic menu layout
MagicMenuLayout:
; Syntax        vdpTile [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 1st line
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile MENU1|PALETTE3|PRIORITY
                vdpTile MENU2|PALETTE3|PRIORITY
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
                vdpTile 0
                
; 2nd line
                vdpTile 0
                vdpTile MENU7|PALETTE3|PRIORITY
                vdpTile MENU8|PALETTE3|PRIORITY
                vdpTile MENU3|PALETTE3|PRIORITY
                vdpTile MENU4|PALETTE3|PRIORITY
                vdpTile MENU21|PALETTE3|PRIORITY
                vdpTile MENU22|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile CORNER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile 0
                
; 3rd line
                vdpTile 0
                vdpTile MENU9|PALETTE3|PRIORITY
                vdpTile MENU10|PALETTE3|PRIORITY
                vdpTile MENU5|PALETTE3|PRIORITY
                vdpTile MENU6|PALETTE3|PRIORITY
                vdpTile MENU23|PALETTE3|PRIORITY
                vdpTile MENU24|PALETTE3|PRIORITY
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
                
; 4th line
                vdpTile 0
                vdpTile MENU11|PALETTE3|PRIORITY
                vdpTile MENU12|PALETTE3|PRIORITY
                vdpTile MENU15|PALETTE3|PRIORITY
                vdpTile MENU16|PALETTE3|PRIORITY
                vdpTile MENU25|PALETTE3|PRIORITY
                vdpTile MENU26|PALETTE3|PRIORITY
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
                
; 5th line
                vdpTile 0
                vdpTile MENU13|PALETTE3|PRIORITY
                vdpTile MENU14|PALETTE3|PRIORITY
                vdpTile MENU17|PALETTE3|PRIORITY
                vdpTile MENU18|PALETTE3|PRIORITY
                vdpTile MENU27|PALETTE3|PRIORITY
                vdpTile MENU28|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile V_BORDER|PALETTE3|PRIORITY
                vdpTile UPPERCASE_M|PALETTE3|PRIORITY
                vdpTile UPPERCASE_P|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile V_BORDER|MIRROR|PALETTE3|PRIORITY
                vdpTile 0
                vdpTile 0
                
; 6th line
                vdpTile 0
                vdpTile 0
                vdpTile 0
                vdpTile MENU19|PALETTE3|PRIORITY
                vdpTile MENU20|PALETTE3|PRIORITY
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
                vdpTile 0
                vdpTile 0
