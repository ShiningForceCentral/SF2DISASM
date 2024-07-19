
; ASM FILE data\graphics\tech\windowlayouts\memberstatswindowlayout-menuenhancements.asm :
; Member stats window layout : Included when patches EXTENDED_STATUS, or THREE_DIGITS_STATS, or FULL_CLASS_NAMES are enabled.
                module
                
layout_MemberStatusWindow:
                
; Syntax        vdpBaseTile [VDPTILE_]index[|mirror|flip]
                
@spacerLine: macro
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
                
layout_MemberStatusWindow_Body:
; 4th line
            if (THREE_DIGITS_STATS=1)
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
            else
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
            endif
                
            if (EXTENDED_STATUS=0)
                @spacerLine ; 5th line
            endif
                
; 6th line
            if (THREE_DIGITS_STATS=1)
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
            else
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
            endif
                
            if (EXTENDED_STATUS=0)
                @spacerLine ; 7th line
            endif
                
; 8th line
            if (THREE_DIGITS_STATS=1)
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
            else
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
            endif
                
            if (EXTENDED_STATUS=0)
                @spacerLine ; 9th line
            endif
                
; 10th line
            if (THREE_DIGITS_STATS=1)
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
            else
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
            endif
                
                @spacerLine ; 11th line
                
                ; 10th and 11th lines start here is member screen is extended.
            if (EXTENDED_STATUS=1)
                vdpBaseTile V_BORDER
                vdpBaseTile ELEMENT_WIND
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile ELEMENT_LIGHTNING
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile ELEMENT_STATUS
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
                
                vdpBaseTile V_BORDER
                vdpBaseTile ELEMENT_ICE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile ELEMENT_FIRE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile ELEMENT_HIDDEN ; hidden element (unused)
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
            endif
                
layout_MemberStatusWindow_Tail:
            if (EXTENDED_STATUS=1)
                @spacerLine
            endif
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
