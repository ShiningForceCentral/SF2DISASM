
; ASM FILE data\graphics\tech\windowlayouts\timerwindowwindowlayout.asm :
; 0x16618..0x16658 : Timer window layout
TimerWindowLayout:
                
; Syntax        vdpTile [VDPTILE_]index[|MIRROR|FLIP]
                
                ; 1st line
                vdpTile CORNER
                vdpTile H_BORDER
                vdpTile H_BORDER
                vdpTile H_BORDER
                vdpTile H_BORDER
                vdpTile H_BORDER
                vdpTile H_BORDER
                vdpTile CORNER|MIRROR
                
                ; 2nd line
                vdpTile V_BORDER
                vdpTile UPPERCASE_T
                vdpTile UPPERCASE_I
                vdpTile UPPERCASE_M
                vdpTile UPPERCASE_E
                vdpTile SPACE
                vdpTile SPACE
                vdpTile V_BORDER|MIRROR
                
                ; 3rd line
                vdpTile V_BORDER
                vdpTile NUMBER_0
                vdpTile NUMBER_0
                vdpTile NUMBER_0
                vdpTile COLON
                vdpTile NUMBER_0
                vdpTile NUMBER_0
                vdpTile V_BORDER|MIRROR
                
                ; 4th line
                vdpTile CORNER|FLIP
                vdpTile H_BORDER|FLIP
                vdpTile H_BORDER|FLIP
                vdpTile H_BORDER|FLIP
                vdpTile H_BORDER|FLIP
                vdpTile H_BORDER|FLIP
                vdpTile H_BORDER|FLIP
                vdpTile CORNER|MIRROR|FLIP
