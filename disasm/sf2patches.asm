ITEMS_AND_SPELLS_EXPANSION: equ 0   ; 0 = OFF, 1 = ON. Requires 4MB expanded ROM layout! Also requires to increase save slot size by at least 64 bytes to accomodate doubled deals items list length.
EXPANDED_SRAM: equ 0                ; 0 = OFF, 1 = ON. Expands SRAM to 32KB.
EXPANDED_SAVE_SLOT_SIZE: equ 0      ; 0 = OFF, 1-1024 = Additional save slot bytes. 1024 is recommeneded as the max value. Requires EXPANDED_SRAM enabled.
