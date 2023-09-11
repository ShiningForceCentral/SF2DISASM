
; 0 = OFF, 1 = ON

; Fixes
FIX_CARAVAN_FREE_REPAIR_EXPLOIT:equ 1       ; Preserve the broken bit when items are stored in the Caravan. (Inventory is reducded to 32 items unless SRAM is expanded.)


; Music resuming
MUSIC_RESUMING:                 equ 1       ; 
RESUME_BATTLEFIELD_MUSIC_ONLY:  equ 1       ; Do not resume battlescene music.
RESUME_MUSIC_AFTER_JOIN_JINGLE: equ 1       ; Resume background music after playing a "Joined the Force" jingle.

resumeBattlesceneMusic = 1
    if (RESUME_BATTLEFIELD_MUSIC_ONLY=1)
resumeBattlesceneMusic = 0
    endif
RESUME_BATTLESCENE_MUSIC: equ resumeBattlesceneMusic


; ROM expansions
ROM_EXPANSION:                  equ 1       ; 0 = 2 MB ROM, 1 = 4 MB ROM (default), 2 = 6 MB ROM
SRAM_EXPANSION:                 equ 1       ; Expand SRAM from 8KB to 32KB.
RELOCATED_SAVED_DATA_TO_SRAM:   equ 0       ; Relocate currently loaded saved data from system RAM to cartridge SRAM.
EXPANDED_FORCE_MEMBERS:         equ 1       ; Enable all 32 force members supported by the engine instead of 30.
EXPANDED_ITEMS_AND_SPELLS:      equ 1       ; Expand number of items from 127 to 255, and number of spells from 44 to 63. Forces build of 4MB ROM with 32KB SRAM.


; If standard build, and either EXPANDED_ROM or EXPANDED_ITEMS_AND_SPELLS are enabled, build an expanded ROM.
expandedRom = 0
    ;if (STANDARD_BUILD&(ROM_EXPANSION!EXPANDED_ITEMS_AND_SPELLS)=1)
    if (STANDARD_BUILD=1)
        if (ROM_EXPANSION>=1)
expandedRom = 1
        endif
    endif
EXPANDED_ROM: equ expandedRom


; If building a >= 6MB ROM, implement ROM and SRAM mapping management, supporting both SEGA and Extended SSF mappers.
memoryMapper = 0
    if (ROM_EXPANSION>=2)
memoryMapper = 1
    endif
MEMORY_MAPPER: equ memoryMapper
SSF_SYSTEM_ID: equ 0    ; Put "SEGA SSF" string in ROM header to activate memory mapper on Mega EverDrive cartridges.


; If standard build, and either EXPANDED_SRAM, RELOCATED_SAVED_DATA_TO_SRAM, or EXPANDED_ITEMS_AND_SPELLS
; are enabled, expand SRAM.
expandedSram = 0
    if (STANDARD_BUILD&(SRAM_EXPANSION!RELOCATED_SAVED_DATA_TO_SRAM!EXPANDED_ITEMS_AND_SPELLS)=1)
expandedSram = 1
    endif
EXPANDED_SRAM: equ expandedSram



; Assembler optimizations
OPTIMIZED_PC_RELATIVE_ADDRESSING:   equ 1       ; Optimize to PC relative addressing.
OPTIMIZED_SHORT_BRANCHES:           equ 1       ; Optimize short branches.
OPTIMIZED_ABSOLUTE_LONG_ADDRESSING: equ 1       ; Optimize absolute long addressing.
OPTIMIZED_ZERO_DISPLACEMENTS:       equ 1       ; Optimize zero displacements.
OPTIMIZED_ADDS_TO_QUICK_FORM:       equ 1       ; Optimize adds to quick form.
OPTIMIZED_SUBS_TO_QUICK_FORM:       equ 1       ; Optimize subtract to quick form.
OPTIMIZED_MOVE_TO_QUICK_FORM:       equ 1       ; Optimize move to quick form.



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
