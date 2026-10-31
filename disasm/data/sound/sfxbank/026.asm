Sfx_026:
    db 1
    dw Sfx_026_Channel_0
    dw Sfx_026_Channel_0
    dw Sfx_026_Channel_0
    dw Sfx_026_Channel_0
    dw Sfx_026_Channel_0
    dw Sfx_026_Channel_0
    dw Sfx_026_Channel_0
    dw Sfx_026_Channel_0
    dw Sfx_026_Channel_8
    dw Sfx_026_Channel_0
Sfx_026_Channel_0:
    channel_end
Sfx_026_Channel_8:
      psgInst 02fh
      setRelease 4
      vibrato 00h
            psgNoteL F4, 1
            psgNote A4
      psgInst 02eh
            psgNote B4
            psgNote D5
    channel_end