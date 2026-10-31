Sfx_021:
    db 1
    dw Sfx_021_Channel_0
    dw Sfx_021_Channel_0
    dw Sfx_021_Channel_0
    dw Sfx_021_Channel_0
    dw Sfx_021_Channel_0
    dw Sfx_021_Channel_0
    dw Sfx_021_Channel_0
    dw Sfx_021_Channel_0
    dw Sfx_021_Channel_8
    dw Sfx_021_Channel_9
Sfx_021_Channel_0:
    channel_end
Sfx_021_Channel_8:
      psgInst 00h
      setRelease 0
      vibrato 080h
            psgNoteL B7, 6
    channel_end
Sfx_021_Channel_9:
      psgInst 07fh
      setRelease 1
            psgNoteL 07h, 4
    channel_end