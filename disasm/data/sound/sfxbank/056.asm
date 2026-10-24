Sfx_056:
    db 1
    dw Sfx_056_Channel_0
    dw Sfx_056_Channel_0
    dw Sfx_056_Channel_0
    dw Sfx_056_Channel_0
    dw Sfx_056_Channel_0
    dw Sfx_056_Channel_0
    dw Sfx_056_Channel_0
    dw Sfx_056_Channel_0
    dw Sfx_056_Channel_8
    dw Sfx_056_Channel_0
Sfx_056_Channel_0:
    channel_end
Sfx_056_Channel_8:
      psgInst 01fh
      setRelease 0
      vibrato 00h
            psgNoteL E7, 2
            psgNote G7
            psgNoteL B7, 3
      psgInst 01ch
            psgNoteL E7, 2
            psgNote G7
            psgNoteL B7, 3
      psgInst 018h
            psgNoteL E7, 2
            psgNote G7
            psgNoteL B7, 3
      psgInst 016h
            psgNoteL E7, 2
            psgNote G7
            psgNoteL B7, 3
    channel_end