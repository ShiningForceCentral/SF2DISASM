
; Frequency shift effects : vibratos and slides.

pt_PITCH_EFFECTS:
    dw PITCH_EFFECT_0
    dw PITCH_EFFECT_1
    dw PITCH_EFFECT_2
    dw PITCH_EFFECT_3
    dw PITCH_EFFECT_4
    dw PITCH_EFFECT_5
    dw PITCH_EFFECT_6
    dw PITCH_EFFECT_7
    dw PITCH_EFFECT_8
    dw PITCH_EFFECT_9
    dw PITCH_EFFECT_A
    dw PITCH_EFFECT_B
    dw PITCH_EFFECT_C
    dw PITCH_EFFECT_D
    dw PITCH_EFFECT_E
    dw PITCH_EFFECT_F
PITCH_EFFECT_0:  db  0, 80h
PITCH_EFFECT_1:  db -16, 16, 16, -16, 80h
PITCH_EFFECT_2:  db -3, -3, -1,  1,  3,  3,  3,  1, -1, -3, 80h
PITCH_EFFECT_3:  db -2, -2, -1,  1,  2,  2,  2,  1, -1, -2, 80h
PITCH_EFFECT_4:  db -1, -1,  0,  1,  1,  1,  1,  0, -1, -1, 80h
PITCH_EFFECT_5:  db -1,  0,  0,  1,  0,  1,  0,  0, -1,  0, 80h
PITCH_EFFECT_6:  db  2, 80h
PITCH_EFFECT_7:  db -2, 80h
PITCH_EFFECT_8:  db  4, 80h
PITCH_EFFECT_9:  db -4, 80h
PITCH_EFFECT_A:  db  8, 80h
PITCH_EFFECT_B:  db -8, 80h
PITCH_EFFECT_C:  db 16, 80h
PITCH_EFFECT_D:  db -16, 80h
PITCH_EFFECT_E:  db 32, 80h
PITCH_EFFECT_F:  db -32, 80h