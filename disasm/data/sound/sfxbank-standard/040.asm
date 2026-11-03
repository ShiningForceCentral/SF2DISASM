Sfx_040:
    db 1
    dw Sfx_040_Channel_0
    dw Sfx_040_Channel_0
    dw Sfx_040_Channel_0
    dw Sfx_040_Channel_0
    dw Sfx_040_Channel_0
    dw Sfx_040_Channel_0
    dw Sfx_040_Channel_0
    dw Sfx_040_Channel_0
    dw Sfx_040_Channel_8
    dw Sfx_040_Channel_0
Sfx_040_Channel_0:
    channel_end
Sfx_040_Channel_8:
      psgInst 02eh
      setRelease 0
      vibrato 0b0h
            psgNoteL A2, 1
            psgNote A3
            psgNote A2
            psgNote A3
            psgNote G4
            psgNoteL C5, 6
      psgInst 02bh
            psgNoteL A3, 1
            psgNote G4
            psgNoteL C5, 6
      psgInst 029h
            psgNoteL A3, 1
            psgNote G4
            psgNoteL C5, 6
      psgInst 026h
            psgNoteL A3, 1
            psgNote G4
            psgNoteL C5, 6
    channel_end