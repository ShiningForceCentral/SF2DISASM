
; Attack-Release volume envelopes

pt_PSG_INSTRUMENTS:
    dw PSG_INSTRUMENT_0
    dw PSG_INSTRUMENT_1 
    dw PSG_INSTRUMENT_2 
    dw PSG_INSTRUMENT_3 
    dw PSG_INSTRUMENT_4 
    dw PSG_INSTRUMENT_5 
    dw PSG_INSTRUMENT_6 
    dw PSG_INSTRUMENT_7 
    dw PSG_INSTRUMENT_8 
    dw PSG_INSTRUMENT_9 
    dw PSG_INSTRUMENT_A 
    dw PSG_INSTRUMENT_B 
    dw PSG_INSTRUMENT_C 
    dw PSG_INSTRUMENT_D 
    dw PSG_INSTRUMENT_E 
    dw PSG_INSTRUMENT_F 
PSG_INSTRUMENT_0:  
    db 8Fh
    db 8Bh
PSG_INSTRUMENT_1:  
    db 0Fh, 0Fh, 0Eh, 0Dh, 0Ch, 0Bh, 0Ah,  9,  8,  7,  6,  5,  4,  3,  2,  1, 80h
    db 80h
PSG_INSTRUMENT_2:  
    db 0Fh, 0Eh, 0Eh, 0Dh, 0Dh, 0Dh, 0Ch, 0Ch, 0Ch, 0Ch, 8Bh
    db 0Ah, 0Ah, 89h
PSG_INSTRUMENT_3:
    db 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Fh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 8Dh
    db 0Bh, 0Bh, 0Bh, 8Ah
PSG_INSTRUMENT_4:
    db 0Fh, 0Fh, 8Eh
    db 0Bh, 0Bh, 0Bh, 8Ah
PSG_INSTRUMENT_5:
    db 0Fh, 0Eh, 8Dh
    db 0Bh,  9,  7,  5,  3,  2,  1, 80h
PSG_INSTRUMENT_6:
    db 0Dh, 0Eh, 0Fh, 8Eh
    db  4,  2,  1, 80h
PSG_INSTRUMENT_7:
    db 0Dh, 0Eh, 0Fh, 8Eh
    db 8Bh
PSG_INSTRUMENT_8:
    db 0Fh, 0Fh, 0Eh, 0Eh, 0Dh, 0Ch, 0Fh, 0Fh, 0Eh, 0Eh, 0Dh, 0Dh, 8Ch
    db 8Ah
PSG_INSTRUMENT_9:
    db 0Bh, 0Ch, 0Dh, 0Eh, 8Fh
    db 88h
PSG_INSTRUMENT_A:
    db 0Bh, 0Dh, 0Fh, 0Eh, 0Dh, 8Ch
    db 0Ah, 0Ah,  9,  9, 88h
PSG_INSTRUMENT_B:
    db 8Fh
    db 8Fh
PSG_INSTRUMENT_C:
    db 0Fh, 0Ah, 86h
    db 83h
PSG_INSTRUMENT_D:
    db 0Fh, 0Ch, 0Ah,  8, 86h
    db 83h
PSG_INSTRUMENT_E:
    db 0Fh, 0Dh, 0Bh,  9,  8,  7, 86h
    db 83h
PSG_INSTRUMENT_F:
    db 8Fh
    db 80h