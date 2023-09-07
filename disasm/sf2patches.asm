
; 0 = OFF, 1 = ON

; Menu enhancements
THREE_DIGITS_STATS:                 equ 1       ; 
FULL_CLASS_NAMES:                   equ 1       ; 
EIGHT_CHARACTERS_MEMBER_NAMES:      equ 1       ; 
EXTENDED_SPELL_NAMES:               equ 1       ; 
ALTERNATE_JEWEL_ICONS_DISPLAY:      equ 1       ; 1 = small icons, 2 = no display
SHOW_ENEMY_LEVEL:                   equ 1       ; 
SHOW_ALL_SPELLS_IN_MEMBER_SCREEN:   equ 0       ; 
ACCURATE_LAND_EFFECT_DISPLAY:       equ 1       ; Read values to be displayed from a table. Damage multipliers are converted to reduction percent values during assembly through a macro.



; If standard build, and either THREE_DIGITS_STATS or FULL_CLASS_NAMES
; are enabled, implement a second member list stats page.
secondMembersListPage = 0
    if (STANDARD_BUILD&(THREE_DIGITS_STATS|FULL_CLASS_NAMES)=1)
secondMembersListPage = 1
    endif
SECOND_MEMBERS_LIST_PAGE: equ secondMembersListPage
