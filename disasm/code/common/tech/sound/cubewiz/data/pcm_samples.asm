
; Playback period (higher=slower), bank index, length, offset

PCM_SAMPLE_ENTRIES:
    dw  1, DAC_BANK_1, 011EFh, 08000h
    dw  1, DAC_BANK_1, 011EFh, 091EFh
    dw  1, DAC_BANK_1,  08E3h, 0F431h
    dw  1, DAC_BANK_2,  08E3h, 08000h
    dw  1, DAC_BANK_2,  08E3h, 088E3h
    dw  1, DAC_BANK_1, 011EFh, 0A3DEh
    dw  1, DAC_BANK_1, 011C1h, 0B5CDh
    dw  5, DAC_BANK_1, 011C1h, 0B5CDh
    dw  3, DAC_BANK_1,  0F00h, 0C78Eh
    dw  9, DAC_BANK_1,  0F00h, 0C78Eh
    dw  1, DAC_BANK_2, 01D29h, 091C6h
    dw 15, DAC_BANK_2, 01D29h, 091C6h
    dw  1, DAC_BANK_1, 01DA3h, 0D68Eh
    dw  5, DAC_BANK_1, 01DA3h, 0D68Eh
    dw  9, DAC_BANK_1, 01DA3h, 0D68Eh
    dw 15, DAC_BANK_1, 01DA3h, 0D68Eh
    dw 20, DAC_BANK_1, 01DA3h, 0D68Eh