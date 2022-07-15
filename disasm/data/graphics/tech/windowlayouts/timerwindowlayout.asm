
; ASM FILE data\graphics\tech\windowlayouts\timerwindowlayout.asm :
; 0x16618..0x16658 : Timer window layout
TimerWindowLayout:
                
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
                vdpBaseTile CORNER|MIRROR
                
; 2nd line
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_T
                vdpBaseTile UPPERCASE_I
                vdpBaseTile UPPERCASE_M
                vdpBaseTile UPPERCASE_E
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 3rd line
                vdpBaseTile V_BORDER
                vdpBaseTile NUMBER_0
                vdpBaseTile NUMBER_0
                vdpBaseTile NUMBER_0
                vdpBaseTile COLON
                vdpBaseTile NUMBER_0
                vdpBaseTile NUMBER_0
                vdpBaseTile V_BORDER|MIRROR
                
; 4th line
                vdpBaseTile CORNER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile CORNER|MIRROR|FLIP
