Sfx_041:
    db 2
    dw Sfx_041_Channel_0
    dw Sfx_041_Channel_1
    dw Sfx_041_Channel_0
Sfx_041_Channel_0:
    channel_end
Sfx_041_Channel_1:
      inst 70
      vol 12
      setRelease 1
      vibrato 00h
    countedLoopStart 12
            noteL C1, 2
            note C1
            waitL 3
    countedLoopEnd
    channel_end