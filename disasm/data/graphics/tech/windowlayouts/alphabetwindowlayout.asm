
; ASM FILE data\graphics\tech\windowlayouts\alphabetwindowlayout.asm :
; 0x1607C..0x16204 : Alphabet window layout
AlphabetWindowLayout:
                
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
AlphabetWindowLayout_Start:
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_B
                vdpBaseTile UPPERCASE_C
                vdpBaseTile UPPERCASE_D
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_F
                vdpBaseTile UPPERCASE_G
                vdpBaseTile UPPERCASE_H
                vdpBaseTile UPPERCASE_I
                vdpBaseTile UPPERCASE_J
                vdpBaseTile UPPERCASE_K
                vdpBaseTile UPPERCASE_L
                vdpBaseTile UPPERCASE_M
                vdpBaseTile UPPERCASE_N
                vdpBaseTile UPPERCASE_O
                vdpBaseTile UPPERCASE_P
                vdpBaseTile UPPERCASE_Q
                vdpBaseTile UPPERCASE_R
                vdpBaseTile UPPERCASE_S
                vdpBaseTile UPPERCASE_T
                vdpBaseTile UPPERCASE_U
                vdpBaseTile UPPERCASE_V
                vdpBaseTile UPPERCASE_W
                vdpBaseTile UPPERCASE_X
                vdpBaseTile UPPERCASE_Y
                vdpBaseTile UPPERCASE_Z
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
                vdpBaseTile LOWERCASE_A
                vdpBaseTile LOWERCASE_B
                vdpBaseTile LOWERCASE_C
                vdpBaseTile LOWERCASE_D
                vdpBaseTile LOWERCASE_E
                vdpBaseTile LOWERCASE_F
                vdpBaseTile LOWERCASE_G
                vdpBaseTile LOWERCASE_H
                vdpBaseTile LOWERCASE_I
                vdpBaseTile LOWERCASE_J
                vdpBaseTile LOWERCASE_K
                vdpBaseTile LOWERCASE_L
                vdpBaseTile LOWERCASE_M
                vdpBaseTile LOWERCASE_N
                vdpBaseTile LOWERCASE_O
                vdpBaseTile LOWERCASE_P
                vdpBaseTile LOWERCASE_Q
                vdpBaseTile LOWERCASE_R
                vdpBaseTile LOWERCASE_S
                vdpBaseTile LOWERCASE_T
                vdpBaseTile LOWERCASE_U
                vdpBaseTile LOWERCASE_V
                vdpBaseTile LOWERCASE_W
                vdpBaseTile LOWERCASE_X
                vdpBaseTile LOWERCASE_Y
                vdpBaseTile LOWERCASE_Z
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
                vdpBaseTile NUMBER_0
                vdpBaseTile NUMBER_1
                vdpBaseTile NUMBER_2
                vdpBaseTile NUMBER_3
                vdpBaseTile NUMBER_4
                vdpBaseTile NUMBER_5
                vdpBaseTile NUMBER_6
                vdpBaseTile NUMBER_7
                vdpBaseTile NUMBER_8
                vdpBaseTile NUMBER_9
                vdpBaseTile COMMA
                vdpBaseTile DOT
                vdpBaseTile MINUS_SIGN
                vdpBaseTile EXCLAMATION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile NUMBER_SIGN
                vdpBaseTile APOSTROPHE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_D
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_L
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_N
                vdpBaseTile UPPERCASE_D
                vdpBaseTile V_BORDER|MIRROR
                
; 7th line
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
