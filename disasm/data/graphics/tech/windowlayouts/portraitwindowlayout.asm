
; ASM FILE data\graphics\tech\windowlayouts\portraitwindowlayout.asm :
; 0x126EE..0x1278E : Member screen portrait window layout
PortraitWindowLayout:
                
; Syntax        vdpTile [VDPTILE_]enum[|MIRROR|FLIP|palette|PRIORITY]
;
;      palette: PALETTE1 = 0 (default when omitted)
;               PALETTE2 = $2000
;               PALETTE3 = $4000
;               PALETTE4 = $6000
;
; Note: Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 1st line
                vdpTile PORTRAIT_CORNER|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT_CORNER|MIRROR|PALETTE3|PRIORITY
                
; 2nd line
                vdpTile PORTRAIT_V_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT6|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT5|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT4|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT3|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT2|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT1|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT_V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 3rd line
                vdpTile PORTRAIT_V_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT14|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT13|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT12|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT11|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT10|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT9|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT_V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 4th line
                vdpTile PORTRAIT_V_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT22|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT21|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT20|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT19|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT18|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT17|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT_V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 5th line
                vdpTile PORTRAIT_V_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT30|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT29|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT28|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT27|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT26|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT25|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT_V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 6th line
                vdpTile PORTRAIT_V_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT38|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT37|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT36|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT35|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT34|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT33|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT_V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 7th line
                vdpTile PORTRAIT_V_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT46|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT45|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT44|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT43|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT42|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT41|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT_V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 8th line
                vdpTile PORTRAIT_V_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT54|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT53|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT52|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT51|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT50|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT49|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT_V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 8th line
                vdpTile PORTRAIT_V_BORDER|PALETTE3|PRIORITY
                vdpTile PORTRAIT62|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT61|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT60|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT59|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT58|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT57|MIRROR|PALETTE2|PRIORITY
                vdpTile PORTRAIT_V_BORDER|MIRROR|PALETTE3|PRIORITY
                
; 9th line
                vdpTile PORTRAIT_CORNER|FLIP|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile PORTRAIT_H_BORDER|FLIP|PALETTE3|PRIORITY
                vdpTile PORTRAIT_CORNER|MIRROR|FLIP|PALETTE3|PRIORITY
