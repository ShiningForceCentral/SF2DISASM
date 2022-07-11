
; 0 = OFF, 1 = ON

; Menu enhancements
THREE_DIGITS_STATS:                 equ 0       ; 
FULL_CLASS_NAMES:                   equ 0       ; 
EIGHT_CHARACTERS_MEMBER_NAMES:      equ 0       ; 
EXTENDED_SPELL_NAMES:               equ 0       ; 
ALTERNATE_JEWEL_ICONS_DISPLAY:      equ 0       ; 1 = small icons, 2 = no display
SHOW_ENEMY_LEVEL:                   equ 0       ; 
SHOW_ALL_SPELLS_IN_MEMBER_SCREEN:   equ 0       ; 


    ; If standard build, and either THREE_DIGITS_STATS or FULL_CLASS_NAMES
    ; are enabled, implement a second member list stats page.
    if (STANDARD_BUILD&(THREE_DIGITS_STATS|FULL_CLASS_NAMES)=1)
secondMemberListStatsPage = 1
    else
secondMemberListStatsPage = 0
    endif
