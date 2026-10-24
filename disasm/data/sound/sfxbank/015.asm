Sfx_015:
    db 1
    dw Sfx_015_Channel_0
    dw Sfx_015_Channel_0
    dw Sfx_015_Channel_0
    dw Sfx_015_Channel_0
    dw Sfx_015_Channel_0
    dw Sfx_015_Channel_0
    dw Sfx_015_Channel_0
    dw Sfx_015_Channel_0
    dw Sfx_015_Channel_8
    dw Sfx_015_Channel_0
Sfx_015_Channel_0:
    channel_end
Sfx_015_Channel_8:
      psgInst 02fh
      setRelease 4
      vibrato 00h
            psgNoteL D3, 5
            psgNote D4
      psgInst 02bh
            psgNote D3
            psgNote D4
      psgInst 028h
            psgNote D3
            psgNote D4
    channel_end