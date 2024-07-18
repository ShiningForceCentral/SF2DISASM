
; ASM FILE data\graphics\tech\windowlayouts\allykilldefeatwindowlayout-menuenhancements.asm :
; 0x1278E..0x1284E : Member screen kills and defeat window layout
layout_AllyKillDefeatWindow:
                
; Syntax        vdpBaseTile [VDPTILE_]index[|mirror|flip]
                
; Notes: PALETTE3 and PRIORITY bits are always set.
;        Constant names ("enums"), shorthands (defined by macro), and numerical indexes are interchangeable.

                module
                
@spacerLine: macro
                vdpBaseTile V_BORDER
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
                vdpBaseTile CORNER|MIRROR
                
; lines 2-6
            rept 5
                @spacerLine
            endr
                
; 7th line
            if (EXTENDED_STATUS=1)
                ; "CRT   "
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_C
                vdpBaseTile UPPERCASE_R
                vdpBaseTile UPPERCASE_T
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
            else
                ; "KILLS "
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_K
                vdpBaseTile UPPERCASE_I
                vdpBaseTile UPPERCASE_L
                vdpBaseTile UPPERCASE_L
                vdpBaseTile UPPERCASE_S
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
            endif
                
; 8th line
            if (EXTENDED_STATUS=1)
                ; "  1/ ?"
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_1
                vdpBaseTile SLASH
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile V_BORDER|MIRROR
            else
                ; "     ?"
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile V_BORDER|MIRROR
            endif
                
; 9th line
            if (EXTENDED_STATUS=0)
                @spacerLine
            endif
                
; 10th line
            if (EXTENDED_STATUS=1)
                ; "DBL   "
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_D
                vdpBaseTile UPPERCASE_B
                vdpBaseTile UPPERCASE_L
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
            else
                ; "DEFEAT"
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_D
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_F
                vdpBaseTile UPPERCASE_E
                vdpBaseTile UPPERCASE_A
                vdpBaseTile UPPERCASE_T
                vdpBaseTile V_BORDER|MIRROR
            endif
                
; 11th line
            if (EXTENDED_STATUS=1)
                ; "  1/ ?"
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_1
                vdpBaseTile SLASH
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile V_BORDER|MIRROR
            else
                ; "     ?"
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile V_BORDER|MIRROR
            endif
                
; 12th line
            if (EXTENDED_STATUS=1)
                ; "CTR   "
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_C
                vdpBaseTile UPPERCASE_T
                vdpBaseTile UPPERCASE_R
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile V_BORDER|MIRROR
                
; 13th line     "  1/ ?"
                vdpBaseTile V_BORDER
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile NUMBER_1
                vdpBaseTile SLASH
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile V_BORDER|MIRROR
                
; 14th line
                @spacerLine
                
; 15th line     "K    ?"
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_K
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile V_BORDER|MIRROR
                
; 16th line     "D    ?"
                vdpBaseTile V_BORDER
                vdpBaseTile UPPERCASE_D
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile SPACE
                vdpBaseTile QUESTION_MARK
                vdpBaseTile V_BORDER|MIRROR
            endif
layout_AllyKillDefeatWindowTailForEnemy:
                
; 14th line
                vdpBaseTile CORNER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile H_BORDER|FLIP
                vdpBaseTile CORNER|MIRROR|FLIP
                
; lines 15-17
            rept 3
              rept 8
                vdpBaseTile 0
              endr
            endr
                
                modend
