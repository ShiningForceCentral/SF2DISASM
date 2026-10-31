Sfx_002:
    db 1
    dw Sfx_002_Channel_0
    dw Sfx_002_Channel_0
    dw Sfx_002_Channel_0
    dw Sfx_002_Channel_0
    dw Sfx_002_Channel_0
    dw Sfx_002_Channel_0
    dw Sfx_002_Channel_0
    dw Sfx_002_Channel_0
    dw Sfx_002_Channel_8
    dw Sfx_002_Channel_0
Sfx_002_Channel_0:
    channel_end
Sfx_002_Channel_8:
      psgInst 02ch
      setRelease 0
      vibrato 00h
            psgNoteL B5, 2
            psgNoteL E6, 6
      psgInst 028h
            psgNoteL B5, 2
            psgNoteL E6, 6
    channel_end