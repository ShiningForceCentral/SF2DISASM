
; ASM FILE data\graphics\tech\windowlayouts\memberstatswindowlayout.asm :
; 0x16A62..0x16EA6 : Member stats window layout
MemberStatsWindowLayout:
                
                ; 1st line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPLEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_TOPRIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 2nd line
                
@blankLine:     macro
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                endm
                
                @blankLine
                
                ; ---------------------------------------------------------------------------
                
                ; 3rd line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 4th line
                
@firstStatsLine:    macro
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                if (THREE_DIGITS_STATS=0)
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_L
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_V
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                if (THREE_DIGITS_STATS=1)
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND      ; LV
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_A
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_T
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_T
                if (THREE_DIGITS_STATS=0)
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                if (THREE_DIGITS_STATS=1)
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK            ; ATT
                else
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                endm
                
                if (FULL_CLASS_NAMES=1)
                @blankLine
                else
                @firstStatsLine
                endif
                
                ; ---------------------------------------------------------------------------
                
                ; 5th line
                
                if (FULL_CLASS_NAMES=1)
                @firstStatsLine
                else
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                endif
                
                ; ---------------------------------------------------------------------------
                
                ; 6th line
                
@secondStatsLine:   macro
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                if (THREE_DIGITS_STATS=0)
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_H
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_P
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                if (THREE_DIGITS_STATS=1)
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK            ; current HP
                endif
                dc.w VDPTILE_IDX_ASCII_SLASH
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                if (THREE_DIGITS_STATS=1)
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK            ; max HP
                endif
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_D
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_E
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_F
                if (THREE_DIGITS_STATS=0)
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                if (THREE_DIGITS_STATS=1)
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK            ; DEF
                else
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                endm
                
                if (FULL_CLASS_NAMES=1)
                @blankLine
                else
                @secondStatsLine
                endif
                
                ; ---------------------------------------------------------------------------
                
                ; 7th line
                
                if (FULL_CLASS_NAMES=1)
                @secondStatsLine
                else
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                endif
                
                ; ---------------------------------------------------------------------------
                
                ; 8th line
                
@thirdStatsLine:    macro
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                if (THREE_DIGITS_STATS=0)
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_M
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_P
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                if (THREE_DIGITS_STATS=1)
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK            ; current MP
                endif
                dc.w VDPTILE_IDX_ASCII_SLASH
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                if (THREE_DIGITS_STATS=1)
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK            ; max MP
                endif
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_A
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_G
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_I
                if (THREE_DIGITS_STATS=0)
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                if (THREE_DIGITS_STATS=1)
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK            ; AGI
                else
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                endm
                
                if (FULL_CLASS_NAMES=1)
                @blankLine
                else
                @thirdStatsLine
                endif
                
                ; ---------------------------------------------------------------------------
                
                ; 9th line
                
                if (FULL_CLASS_NAMES=1)
                @thirdStatsLine
                else
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                endif
                
                ; ---------------------------------------------------------------------------
                
                ; 10th line
                
@fourthStatsLine:   macro
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                if (THREE_DIGITS_STATS=0)
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_E
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_X
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_P
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                if (THREE_DIGITS_STATS=1)
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND      ; EXP
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_M
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_O
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_V
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                dc.w VDPTILE_IDX_ASCII_QUESTION_MARK
                if (THREE_DIGITS_STATS=0)
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                endif
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                endm
                
                if (FULL_CLASS_NAMES=1)
                @blankLine
                else
                @fourthStatsLine
                endif
                
                ; ---------------------------------------------------------------------------
                
                ; 11th line
                
                if (FULL_CLASS_NAMES=1)
                @fourthStatsLine
                else
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                endif
                
                ; ---------------------------------------------------------------------------
                
                ; 12th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 13th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_M
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_A
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_G
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_I
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_C
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_I
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_T
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_E
                dc.w VDPTILE_IDX_ASCII_UPPERCASE_M
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 14th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 15th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 16th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 17th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 18th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 19th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 20th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 21th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 22th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 23th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 24th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 25th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_LEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BACKGROUND
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_RIGHTBORDER
                
; ---------------------------------------------------------------------------
                
                ; 26th line
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMLEFTBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMBORDER
                dc.w VDPTILE_IDX_DIALOGUEWINDOW_BOTTOMRIGHTBORDER
