Sfx_049:
    db 2
    dw Sfx_049_Channel_0
    dw Sfx_049_Channel_1
    dw Sfx_049_Channel_2
Sfx_049_Channel_0:
      inst 55
      vol 15
      setRelease 1
      vibrato 00h
            noteL F5, 4
            note G5
            note A5
            note B5
            note C6
            note D6
            note E6
            noteL F6, 10
            waitL 12
    channel_end
Sfx_049_Channel_1:
      shifting 32
            waitL 6
      inst 55
      vol 13
      setRelease 1
      vibrato 00h
            noteL F5, 4
            note G5
            note A5
            note B5
            note C6
            note D6
            note E6
            noteL F6, 10
            waitL 12
    channel_end
Sfx_049_Channel_2:
    channel_end