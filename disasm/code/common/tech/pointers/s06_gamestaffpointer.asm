
; ASM FILE code\common\tech\pointers\s06_gamestaffpointer.asm :
; 0x28040..0x28044 : Game Section 06 Game Staff Pointer
            if (STANDARD_BUILD&SCROLLING_TEXT_INTRODUCTION=1)
p_table_IntroText:
                dc.l table_IntroText
            endif
p_table_GameStaff:
                dc.l table_GameStaff    
