Sfx_055:
    db 2
    dw Sfx_055_Channel_0
    dw Sfx_055_Channel_1
    dw Sfx_055_Channel_0
Sfx_055_Channel_0:
    channel_end
Sfx_055_Channel_1:
      inst 68
      vol 15
      setRelease 0
      vibrato 02h
    countedLoopStart 0
            noteL B2, 2
            note Ds2
            note G2
            note D2
            note F2
            note C2
            note Fs2
    countedLoopEnd
      vol 14
            noteL B2, 2
      vol 13
            note Ds2
      vol 12
            note G2
      vol 11
            note D2
      vol 10
            note F2
      vol 9
            note C2
      vol 8
            note Fs2
    channel_end