EXPANDED_SRAM: equ 1                    ; 0 = OFF, 1 = ON. Expands SRAM from 8KB to 32KB.
RELOCATED_SAVED_DATA_TO_SRAM: equ 0     ; 0 = OFF, 1 = ON. Relocates currently loaded saved data from system RAM to cartridge SRAM.


    ; If either EXPANDED_SRAM or RELOCATED_SAVED_DATA_TO_SRAM are enabled, expand SRAM.
    if (EXPANDED_SRAM!RELOCATED_SAVED_DATA_TO_SRAM=1)
expandedSram = 1
    else
expandedSram = 0
    endif
