Sfx_001:
    db 2
    dw Sfx_001_Channel_0
    dw Sfx_001_Channel_1
    dw Sfx_001_Channel_0
Sfx_001_Channel_0:
    channel_end
Sfx_001_Channel_1:
      inst 64
      vol 14
      vibrato 00h
      setRelease 0
            noteL F3, 1
      sustain
      vibrato 010h
            note Fs4
            note A5
      setRelease 1
      vibrato 0f0h
            noteL B7, 12
    channel_end