Sfx_043:
    db 2
    dw Sfx_043_Channel_0
    dw Sfx_043_Channel_1
    dw Sfx_043_Channel_0
Sfx_043_Channel_0:
    channel_end
Sfx_043_Channel_1:
      inst 27
      vol 12
      sustain
      vibrato 010h
      noSlide
            noteL Cs3, 0
      setSlide 32
            noteL Gs3, 36
            noteL G3, 6
            note Fs3
      setRelease 1
            noteL Gs2, 5
    channel_end