Sfx_031:
    db 1
    dw Sfx_031_Channel_0
    dw Sfx_031_Channel_0
    dw Sfx_031_Channel_0
    dw Sfx_031_Channel_0
    dw Sfx_031_Channel_0
    dw Sfx_031_Channel_0
    dw Sfx_031_Channel_0
    dw Sfx_031_Channel_0
    dw Sfx_031_Channel_8
    dw Sfx_031_Channel_0
Sfx_031_Channel_0:
    channel_end
Sfx_031_Channel_8:
      psgInst 07dh
      setRelease 6
      vibrato 080h
            psgNoteL G4, 9
      vibrato 0b0h
      psgInst 02dh
      setRelease 2
            psgNoteL Fs4, 8
      psgInst 07dh
      vibrato 080h
      setRelease 1
            psgNoteL B4, 4
    channel_end