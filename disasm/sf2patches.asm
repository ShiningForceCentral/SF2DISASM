
; 0 = OFF, 1 = ON

; ROM expansions
EXPANDED_ROM:                       equ 1       ; Build a 4MB ROM and manage SRAM mapping.
EXTENDED_SSF_MAPPER:                equ 0       ; Build a 6MB ROM and manage ROM and SRAM mapping.
EXPANDED_SRAM:                      equ 1       ; Expand SRAM from 8KB to 32KB.
RELOCATED_SAVED_DATA_TO_SRAM:       equ 0       ; Relocate currently loaded saved data from system RAM to cartridge SRAM.
FORCE_MEMBERS_EXPANSION:            equ 0       ; Enable the use of 2 additional force members.
EXPANDED_ITEMS_AND_SPELLS:          equ 1       ; Expand number of items from 127 to 255, and number of spells from 44 to 63. Forces build of 4MB ROM with 32KB SRAM.
OPTIMIZED_ROM_LAYOUT:               equ 1       ; Align ROM sections to next word boundary to consolidate free space.

; Assembler optimizations
OPTIMIZED_PC_RELATIVE_ADDRESSING:   equ 1       ; Optimize to PC relative addressing.
OPTIMIZED_SHORT_BRANCHES:           equ 1       ; Optimize short branches.
OPTIMIZED_ABSOLUTE_LONG_ADDRESSING: equ 1       ; Optimize absolute long addressing.
OPTIMIZED_ZERO_DISPLACEMENTS:       equ 1       ; Optimize zero displacements.
OPTIMIZED_ADDS_TO_QUICK_FORM:       equ 1       ; Optimize adds to quick form.
OPTIMIZED_SUBS_TO_QUICK_FORM:       equ 1       ; Optimize subtract to quick form.
OPTIMIZED_MOVE_TO_QUICK_FORM:       equ 1       ; Optimize move to quick form.


    ; If standard build, and either EXPANDED_ROM, EXTENDED_SSF_MAPPER, or EXPANDED_ITEMS_AND_SPELLS
    ; are enabled, build an expanded ROM.
    if (STANDARD_BUILD&(EXPANDED_ROM!EXTENDED_SSF_MAPPER!EXPANDED_ITEMS_AND_SPELLS)=1)
expandedRom = 1
    else
expandedRom = 0
    endif
    
    ; If standard build, and either EXPANDED_SRAM, RELOCATED_SAVED_DATA_TO_SRAM, or EXPANDED_ITEMS_AND_SPELLS
    ; are enabled, expand SRAM.
    if (STANDARD_BUILD&(EXPANDED_SRAM!RELOCATED_SAVED_DATA_TO_SRAM!EXPANDED_ITEMS_AND_SPELLS)=1)
expandedSram = 1
    else
expandedSram = 0
    endif
    
    
    ; Apply optional assembler optimizations.
    if (STANDARD_BUILD&OPTIMIZED_PC_RELATIVE_ADDRESSING=1)
        opt op+     ; Switches to PC relative addressing from absolute long addressing if this is permissible in the current code context.
    endif
    if (STANDARD_BUILD&OPTIMIZED_SHORT_BRANCHES=1)
        opt os+     ; Backwards relative branches will use the short form if this is permissible in the current code context.
    endif
    if (STANDARD_BUILD&OPTIMIZED_ABSOLUTE_LONG_ADDRESSING=1)
        opt ow+     ; If the absolute long addressing mode is used but the address will only occupy a word, the Assembler will switch to the short form.
    endif
    if (STANDARD_BUILD&OPTIMIZED_ZERO_DISPLACEMENTS=1)
        opt oz+     ; If the address register is used with a zero displacement, the Assembler will switch to the address register indirect mode.
    endif
    
    ; When these options are enabled, provided that it is permissible in the current code context, all ADD, SUB and MOVE instructions are coded as quick forms.
    if (STANDARD_BUILD&OPTIMIZED_ADDS_TO_QUICK_FORM=1)
        opt oaq+
    endif
    if (STANDARD_BUILD&OPTIMIZED_SUBS_TO_QUICK_FORM=1)
        opt osq+
    endif
    if (STANDARD_BUILD&OPTIMIZED_MOVE_TO_QUICK_FORM=1)
        opt omq+
    endif
