
; ASM FILE data\graphics\tech\windowlayouts\fighterministatuswindowlayout.asm :
; 0x11AEC..0x11B46 : Fighter mini status window layout
FighterMiniStatusWindowLayout:
                
; Syntax        vdpBaseTile [VDPTILE_]index[|mirror|flip]
                
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
FighterMiniStatusWindowLayout_Body:
                
; 4th column
                vdpBaseTile H_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile H_BORDER|FLIP
FighterMiniStatusWindowLayout_Tail:
                
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
