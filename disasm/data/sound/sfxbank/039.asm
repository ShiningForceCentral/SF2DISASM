Sfx_039:
    db 1
    dw Sfx_039_Channel_0
    dw Sfx_039_Channel_0
    dw Sfx_039_Channel_0
    dw Sfx_039_Channel_0
    dw Sfx_039_Channel_0
    dw Sfx_039_Channel_0
    dw Sfx_039_Channel_0
    dw Sfx_039_Channel_0
    dw Sfx_039_Channel_8
    dw Sfx_039_Channel_0
Sfx_039_Channel_0:
    channel_end
Sfx_039_Channel_8:
      psgInst 02eh
      setRelease 0
      vibrato 00h
            psgNoteL A2, 1
            psgNote A3
            psgNote A2
            psgNote A3
            psgNote Gs4
            psgNote Fs4
            psgNote Gs4
            psgNote Fs4
            psgNoteL Gs4, 4
      psgInst 02bh
            psgNoteL A3, 1
            psgNote Gs4
            psgNote Fs4
            psgNote Gs4
            psgNote Fs4
            psgNoteL Gs4, 4
      psgInst 027h
            psgNoteL A3, 1
            psgNote Gs4
            psgNote Fs4
            psgNote Gs4
            psgNote Fs4
            psgNoteL Gs4, 4
    channel_end