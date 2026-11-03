Sfx_022:
    db 2
    dw Sfx_022_Channel_0
    dw Sfx_022_Channel_1
    dw Sfx_022_Channel_0
Sfx_022_Channel_0:
    channel_end
Sfx_022_Channel_1:
      inst 69
      vol 15
      setRelease 0
      vibrato 010h
            noteL B7, 1
            note B7
            noteL B7, 10
    channel_end