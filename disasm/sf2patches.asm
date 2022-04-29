off = 0
on = 1

; ROM expansions
EXPANDED_ROM:                       equ on      ; Build a 4MB ROM and manage SRAM mapping.
EXTENDED_SSF_MAPPER:                equ off     ; Build a 6MB ROM and manage ROM and SRAM mapping.
EXPANDED_SRAM:                      equ on      ; Expand SRAM from 8KB to 32KB.
RELOCATED_SAVED_DATA_TO_SRAM:       equ off     ; Relocate currently loaded saved data from system RAM to cartridge SRAM.
EXPANDED_ITEMS_AND_SPELLS:          equ on      ; Expand number of items from 127 to 255, and number of spells from 44 to 63. Forces build of 4MB ROM with 32KB SRAM.
OPTIMIZED_ROM_LAYOUT:               equ on      ; Align ROM sections to next word boundary to consolidate free space.

; Assembler optimizations
OPTIMIZED_PC_RELATIVE_ADDRESSING:   equ on      ; Optimize to PC relative addressing.
OPTIMIZED_SHORT_BRANCHES:           equ on      ; Optimize short branches.
OPTIMIZED_ABSOLUTE_LONG_ADDRESSING: equ on      ; Optimize absolute long addressing.
OPTIMIZED_ZERO_DISPLACEMENTS:       equ on      ; Optimize zero displacements.
OPTIMIZED_ADDS_TO_QUICK_FORM:       equ on      ; Optimize adds to quick form.
OPTIMIZED_SUBS_TO_QUICK_FORM:       equ on      ; Optimize subtract to quick form.
OPTIMIZED_MOVE_TO_QUICK_FORM:       equ on      ; Optimize move to quick form.


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
