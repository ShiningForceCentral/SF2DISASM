Sfx_051:
    db 1
    dw Sfx_051_Channel_0
    dw Sfx_051_Channel_0
    dw Sfx_051_Channel_0
    dw Sfx_051_Channel_0
    dw Sfx_051_Channel_0
    dw Sfx_051_Channel_0
    dw Sfx_051_Channel_0
    dw Sfx_051_Channel_0
    dw Sfx_051_Channel_8
    dw Sfx_051_Channel_9
Sfx_051_Channel_0:
    channel_end
Sfx_051_Channel_8:
      psgInst 00h
      setRelease 0
      vibrato 063h
            psgNoteL C8, 19
    channel_end
Sfx_051_Channel_9:
      setRelease 0
      psgInst 07bh
            psgNoteL 07h, 4
      psgInst 07dh
            psgNoteL 07h, 4
      psgInst 07fh
            psgNoteL 07h, 5
      psgInst 01fh
            psgNote 07h
    channel_end