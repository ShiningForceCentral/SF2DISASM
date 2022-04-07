EXPANDED_ROM: equ 1             ; 0 = OFF, 1 = ON. Build a 4MB ROM and manage SRAM mapping.
EXTENDED_SSF_MAPPER: equ 0      ; 0 = OFF, 1 = ON. Build a 6MB ROM and manage ROM and SRAM mapping.
OPTIMIZED_ROM_LAYOUT: equ 1     ; 0 = OFF, 1 = ON. Word align ROM sections to consolidate free space.


    ; If either EXPANDED_ROM or EXTENDED_SSF_MAPPER are enabled, build an expanded ROM.
    if (EXPANDED_ROM!EXTENDED_SSF_MAPPER=1)
expandedRom = 1
    else
expandedRom = 0
    endif