Sfx_038:
    db 1
    dw Sfx_038_Channel_0
    dw Sfx_038_Channel_0
    dw Sfx_038_Channel_0
    dw Sfx_038_Channel_0
    dw Sfx_038_Channel_0
    dw Sfx_038_Channel_0
    dw Sfx_038_Channel_0
    dw Sfx_038_Channel_0
    dw Sfx_038_Channel_8
    dw Sfx_038_Channel_0
Sfx_038_Channel_0:
    channel_end
Sfx_038_Channel_8:
      psgInst 01eh
      setRelease 0
      vibrato 00h
            psgNoteL D3, 2
            psgNote F3
            psgNote D4
            psgNote F4
            psgNote D5
            psgNoteL F5, 3
            psgNoteL G5, 5
      psgInst 01bh
            psgNoteL D4, 2
            psgNote F4
            psgNote D5
            psgNoteL F5, 3
            psgNoteL G5, 5
      psgInst 017h
            psgNoteL D4, 2
            psgNote F4
            psgNote D5
            psgNoteL F5, 3
            psgNoteL G5, 5
    channel_end