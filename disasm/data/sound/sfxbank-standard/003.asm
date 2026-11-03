Sfx_003:
    db 1
    dw Sfx_003_Channel_0
    dw Sfx_003_Channel_0
    dw Sfx_003_Channel_0
    dw Sfx_003_Channel_0
    dw Sfx_003_Channel_0
    dw Sfx_003_Channel_0
    dw Sfx_003_Channel_0
    dw Sfx_003_Channel_0
    dw Sfx_003_Channel_8
    dw Sfx_003_Channel_0
Sfx_003_Channel_0:
    channel_end
Sfx_003_Channel_8:
      psgInst 02eh
      setRelease 0
      vibrato 00h
            psgNoteL B6, 2
            psgNoteL E7, 6
      psgInst 02ah
            psgNoteL B6, 2
            psgNoteL E7, 6
      psgInst 027h
            psgNoteL B6, 2
            psgNoteL E7, 6
      psgInst 024h
            psgNoteL B6, 2
            psgNoteL E7, 6
    channel_end