
; ASM FILE data\graphics\tech\windowlayouts\ministatuswindowlayout.asm :
; 0x11AEC..0x11B46 : Mini status window layout
layout_MiniStatusWindow:
                
; Syntax        vdpBaseTile [VDPTILE_]enum[|MIRROR|FLIP]
;
; Notes: PALETTE3 and PRIORITY bits are always set.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.
                
; 1st column
                vdpBaseTile CORNER
                vdpBaseTile V_BORDER
                vdpBaseTile V_BORDER
                vdpBaseTile V_BORDER
                vdpBaseTile CORNER|FLIP
                
; 2nd column
                vdpBaseTile H_BORDER
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_H
                vdpBaseTile UPPERCASE_M
                vdpBaseTile H_BORDER|FLIP
                
; 3rd column
                vdpBaseTile H_BORDER
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_P
                vdpBaseTile UPPERCASE_P
                vdpBaseTile H_BORDER|FLIP
layout_MiniStatusWindowBody:
                
; 4th column
                vdpBaseTile H_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile H_BORDER|FLIP
layout_MiniStatusWindowTail:
                
; 5th column
                vdpBaseTile H_BORDER
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_0
                vdpBaseTile NUMBER_0
                vdpBaseTile H_BORDER|FLIP
                
; 6th column
                vdpBaseTile H_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SLASH
                vdpBaseTile SLASH
                vdpBaseTile H_BORDER|FLIP
                
; 7th column
                vdpBaseTile H_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile H_BORDER|FLIP
                
; 8th column
                vdpBaseTile H_BORDER
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_0
                vdpBaseTile NUMBER_0
                vdpBaseTile H_BORDER|FLIP
                
; 9th column
                vdpBaseTile CORNER|MIRROR
                vdpBaseTile V_BORDER|MIRROR
                vdpBaseTile V_BORDER|MIRROR
                vdpBaseTile V_BORDER|MIRROR
                vdpBaseTile CORNER|MIRROR|FLIP
