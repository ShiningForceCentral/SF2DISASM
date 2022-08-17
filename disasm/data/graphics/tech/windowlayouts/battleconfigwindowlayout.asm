
; ASM FILE data\graphics\tech\windowlayouts\battleconfigwindowlayout.asm :
; 0x15A5A..0x15BB0 : Battle config window layout
BattleConfigWindowLayout:
                
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
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile H_BORDER
                vdpBaseTile CORNER|MIRROR
                
; 2nd line
                vdpBaseTile V_BORDER
                vdpBaseTile MINUS_SIGN
                vdpBaseTile MINUS_SIGN
                vdpBaseTile UPPERCASE_M
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_S
                vdpBaseTile UPPERCASE_S
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_G
                vdpBaseTile UPPERCASE_E
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_S
                vdpBaseTile UPPERCASE_P
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_D
                vdpBaseTile MINUS_SIGN
                vdpBaseTile MINUS_SIGN
                vdpBaseTile V_BORDER|MIRROR
                
; 3rd line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 4th line
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_S
                vdpBaseTile UPPERCASE_L
                vdpBaseTile UPPERCASE_O
                vdpBaseTile UPPERCASE_W
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_1
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_2
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_3
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_4
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_F
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_S
                vdpBaseTile UPPERCASE_T
                vdpBaseTile V_BORDER|MIRROR
                
; 5th line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 6th line
                vdpBaseTile V_BORDER
                vdpBaseTile MINUS_SIGN
                vdpBaseTile MINUS_SIGN
                vdpBaseTile UPPERCASE_B
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_T
                vdpBaseTile UPPERCASE_T
                vdpBaseTile UPPERCASE_L
                vdpBaseTile UPPERCASE_E
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_M
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_S
                vdpBaseTile UPPERCASE_S
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_G
                vdpBaseTile UPPERCASE_E
                vdpBaseTile MINUS_SIGN
                vdpBaseTile V_BORDER|MIRROR
                
; 7th line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 8th line
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_D
                vdpBaseTile UPPERCASE_I
                vdpBaseTile UPPERCASE_S
                vdpBaseTile UPPERCASE_P
                vdpBaseTile UPPERCASE_L
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_Y
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_N
                vdpBaseTile UPPERCASE_O
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_D
                vdpBaseTile UPPERCASE_I
                vdpBaseTile UPPERCASE_S
                vdpBaseTile UPPERCASE_P
                vdpBaseTile DOT
                vdpBaseTile V_BORDER|MIRROR
                
; 9th line
                vdpBaseTile CORNER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile CORNER|MIRROR|FLIP
