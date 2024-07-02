
; ASM FILE data\graphics\tech\windowlayouts\yesnopromptlayout.asm :
; 0x154A2..0x154F6 : Yes/No prompt window layout
layout_YesNoPromptMenu:
                
; Syntax        vdpTile [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 1st line
                vdpTile MENUTILE1|PALETTE3|PRIORITY
                vdpTile MENUTILE2|PALETTE3|PRIORITY
                vdpTile MENUTILE3|PALETTE3|PRIORITY
                vdpTile 
                vdpTile 
                vdpTile MENUTILE10|PALETTE3|PRIORITY
                vdpTile MENUTILE11|PALETTE3|PRIORITY
                vdpTile MENUTILE12|PALETTE3|PRIORITY
                vdpTile 
                vdpTile CORNER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile H_BORDER|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|PALETTE3|PRIORITY
                
; 2nd line
                vdpTile MENUTILE4|PALETTE3|PRIORITY
                vdpTile MENUTILE5|PALETTE3|PRIORITY
                vdpTile MENUTILE6|PALETTE3|PRIORITY
                vdpTile 
                vdpTile 
                vdpTile MENUTILE13|PALETTE3|PRIORITY
                vdpTile MENUTILE14|PALETTE3|PRIORITY
                vdpTile MENUTILE15|PALETTE3|PRIORITY
                vdpTile 
                vdpTile V_BORDER|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile SPACE|PALETTE3|PRIORITY
                vdpTile V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 3rd line
                vdpTile MENUTILE7|PALETTE3|PRIORITY
                vdpTile MENUTILE8|PALETTE3|PRIORITY
                vdpTile MENUTILE9|PALETTE3|PRIORITY
                vdpTile 
                vdpTile 
                vdpTile MENUTILE16|PALETTE3|PRIORITY
                vdpTile MENUTILE17|PALETTE3|PRIORITY
                vdpTile MENUTILE18|PALETTE3|PRIORITY
                vdpTile 
                vdpTile CORNER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile CORNER|MIRROR|FLIP|PALETTE3|PRIORITY
