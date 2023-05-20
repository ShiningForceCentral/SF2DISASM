
; 0 = OFF, 1 = ON

; ROM optimizations
FORCE_OPTIMIZED_ROM_LAYOUT:         equ 1       ; Align ROM sections to next word boundary to consolidate free space.
FORCE_REGION_FREE_ROM:              equ 1       ; Skip checking system region, omit including related function, and update ROM header.

; Assembler optimizations
OPTIMIZED_PC_RELATIVE_ADDRESSING:   equ 1       ; Optimize to PC relative addressing.
OPTIMIZED_SHORT_BRANCHES:           equ 1       ; Optimize short branches.
OPTIMIZED_ABSOLUTE_LONG_ADDRESSING: equ 1       ; Optimize absolute long addressing.
OPTIMIZED_ZERO_DISPLACEMENTS:       equ 1       ; Optimize zero displacements.
OPTIMIZED_ADDS_TO_QUICK_FORM:       equ 1       ; Optimize adds to quick form.
OPTIMIZED_SUBS_TO_QUICK_FORM:       equ 1       ; Optimize subtract to quick form.
OPTIMIZED_MOVE_TO_QUICK_FORM:       equ 1       ; Optimize move to quick form.



    ; If standard build and FORCE_OPTIMIZED_ROM_LAYOUT is enabled.
optimizedRomLayout = 0
    if (STANDARD_BUILD&FORCE_OPTIMIZED_ROM_LAYOUT=1)
optimizedRomLayout = 1
    endif
OPTIMIZED_ROM_LAYOUT = optimizedRomLayout

    ; If standard build, and either OPTIMIZED_ROM_LAYOUT or FORCE_REGION_FREE_ROM are enabled,
    ; build a region free ROM to make space for relocated pointers in a non-expanded ROM.
regionFreeRom = 0
    if (STANDARD_BUILD&(OPTIMIZED_ROM_LAYOUT!FORCE_REGION_FREE_ROM)=1)
regionFreeRom = 1
    endif
REGION_FREE_ROM = regionFreeRom



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
