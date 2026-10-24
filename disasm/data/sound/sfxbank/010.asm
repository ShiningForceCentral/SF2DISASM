Sfx_010:
    db 1
    dw Sfx_010_Channel_0
    dw Sfx_010_Channel_0
    dw Sfx_010_Channel_0
    dw Sfx_010_Channel_0
    dw Sfx_010_Channel_0
    dw Sfx_010_Channel_0
    dw Sfx_010_Channel_0
    dw Sfx_010_Channel_0
    dw Sfx_010_Channel_8
    dw Sfx_010_Channel_0
Sfx_010_Channel_0:
    channel_end
Sfx_010_Channel_8:
      psgInst 0fh
      setRelease 0
      vibrato 0d1h
            psgNoteL G3, 4
    channel_end