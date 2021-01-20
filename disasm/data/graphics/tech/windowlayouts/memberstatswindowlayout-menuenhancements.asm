
; ASM FILE data\graphics\tech\windowlayouts\memberstatswindowlayout-menuenhancements.asm :
; Member stats window layout : Included when patch THREE_DIGITS_STATS or FULL_CLASS_NAMES is enabled.
                module
                
MemberStatusWindowLayout:
                
; Syntax        vdpBaseTile [VDPTILE_]index[|mirror|flip]
                
@spacerLine:    macro
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
                vdpBaseTile V_BORDER|MIRROR
                endm
; ---------------------------------------------------------------------------

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
                vdpBaseTile CORNER|MIRROR
                
                @spacerLine ; 2nd line
                @spacerLine ; 3rd line
                
MemberStatusWindowLayout_Body:
; 4th line
                if (THREE_DIGITS_STATS=0)
                ; Original layout
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_L
                vdpBaseTile UPPERCASE_V
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_T
                vdpBaseTile UPPERCASE_T
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                else
                ; Three digits stats (HP and MP on single line)
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_L
                vdpBaseTile UPPERCASE_V
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_T
                vdpBaseTile UPPERCASE_T
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile V_BORDER|MIRROR
                endif
                
                @spacerLine ; 5th line
                
; 6th line
                if (THREE_DIGITS_STATS=0)
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_H
                vdpBaseTile UPPERCASE_P
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SLASH
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_D
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_F
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                else
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_H
                vdpBaseTile UPPERCASE_P
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SLASH
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_D
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_F
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile V_BORDER|MIRROR
                endif
                
                @spacerLine ; 7th line
                
; 8th line
                if (THREE_DIGITS_STATS=0)
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_M
                vdpBaseTile UPPERCASE_P
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SLASH
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_G
                vdpBaseTile UPPERCASE_I
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                else
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_M
                vdpBaseTile UPPERCASE_P
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SLASH
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_G
                vdpBaseTile UPPERCASE_I
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile V_BORDER|MIRROR
                endif
                
                @spacerLine ; 9th line
                
; 10th line
                if (THREE_DIGITS_STATS=0)
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_X
                vdpBaseTile UPPERCASE_P
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_M
                vdpBaseTile UPPERCASE_O
                vdpBaseTile UPPERCASE_V
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                else
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_X
                vdpBaseTile UPPERCASE_P
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_M
                vdpBaseTile UPPERCASE_O
                vdpBaseTile UPPERCASE_V
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile QUESTION_MARK
                vdpBaseTile V_BORDER|MIRROR
                endif
                
                @spacerLine ; 11th line
                
MemberStatusWindowLayout_Tail:
                @spacerLine ; 12th line
                
; 13th line
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_M
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_G
                vdpBaseTile UPPERCASE_I
                vdpBaseTile UPPERCASE_C
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile UPPERCASE_I
                vdpBaseTile UPPERCASE_T
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_M
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
                @spacerLine ; 14th line
                @spacerLine ; 15th line
                @spacerLine ; 16th line
                @spacerLine ; 17th line
                @spacerLine ; 18th line
                @spacerLine ; 19th line
                @spacerLine ; 20th line
                @spacerLine ; 21th line
                @spacerLine ; 22th line
                @spacerLine ; 23th line
                @spacerLine ; 24th line
                @spacerLine ; 25th line
                
; 26th line
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
                vdpBaseTile CORNER|MIRROR|FLIP
                
                modend
