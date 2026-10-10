Sfx_004:
    db 2
    dw Sfx_004_Channel_0
    dw Sfx_004_Channel_1
    dw Sfx_004_Channel_0
Sfx_004_Channel_0:
    channel_end
Sfx_004_Channel_1:
      inst 65
      vol 15
      setRelease 0
      vibrato 00h
    countedLoopStart 2
            noteL D1, 1
            wait
    countedLoopEnd
            waitL 4
    countedLoopStart 10
            noteL D1, 1
            wait
    countedLoopEnd
    channel_end