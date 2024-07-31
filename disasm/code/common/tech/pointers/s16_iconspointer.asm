
; ASM FILE code\common\tech\pointers\s16_iconspointer.asm :
; 0x1D8000..0x1D8004 : Game Section 16 Icons Pointer

    if (STANDARD_BUILD=1)
p_ItemIcons:    dc.l ItemIcon000
p_SpellIcons:   dc.l SpellIcon000
p_OtherIcons:   dc.l OtherIcon000
    else
p_Icons:        dc.l ItemIcon000
    endif
