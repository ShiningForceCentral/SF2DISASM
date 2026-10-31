Sfx_050:
    db 1
    dw Sfx_050_Channel_0
    dw Sfx_050_Channel_0
    dw Sfx_050_Channel_0
    dw Sfx_050_Channel_0
    dw Sfx_050_Channel_0
    dw Sfx_050_Channel_0
    dw Sfx_050_Channel_0
    dw Sfx_050_Channel_0
    dw Sfx_050_Channel_8
    dw Sfx_050_Channel_9
Sfx_050_Channel_0:
    channel_end
Sfx_050_Channel_8:
      psgInst 00h
      setRelease 0
      vibrato 060h
            psgNoteL B7, 5
            psgNoteL G7, 5
    channel_end
Sfx_050_Channel_9:
      psgInst 07fh
      setRelease 3
            psgNoteL 07h, 6
      psgInst 01fh
      setRelease 0
            psgNoteL 07h, 6
    channel_end