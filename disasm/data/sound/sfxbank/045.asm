Sfx_045:
    db 2
    dw Sfx_045_Channel_0
    dw Sfx_045_Channel_1
    dw Sfx_045_Channel_0
Sfx_045_Channel_0:
    channel_end
Sfx_045_Channel_1:
      inst 75
      vol 15
      vibrato 00h
      setRelease 0
            noteL Ds3, 1
      sustain
      vibrato 010h
            note E4
            note G5
      setRelease 1
      vibrato 0f0h
            note A7
      sustain
            note Ds3
      setRelease 1
            noteL A7, 6
      sustain
            noteL Ds3, 1
            note F4
            note A5
            note As5
      setRelease 1
            noteL A7, 4
    channel_end