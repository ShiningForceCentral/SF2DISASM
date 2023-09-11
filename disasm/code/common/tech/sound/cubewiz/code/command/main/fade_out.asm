 


FadeOut:
    ld  a, 12h    ; $12 YM timer overflows
    ld  (FADE_OUT_LENGTH), a
    ld  a, 1
    ld  (CURRENTLY_FADING_OUT),  a
    ld  a, (FADE_OUT_LENGTH)
    ld  (FADE_OUT_TIMER), a
    ret
