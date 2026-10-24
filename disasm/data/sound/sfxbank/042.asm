Sfx_042:
    db 2
    dw Sfx_042_Channel_0
    dw Sfx_042_Channel_1
    dw Sfx_042_Channel_0
Sfx_042_Channel_0:
    channel_end
Sfx_042_Channel_1:
      inst 76
      vol 14
      setRelease 0
      vibrato 0f0h
            noteL E1, 2
            wait
            note A1
            note Ds2
            waitL 6
    channel_end