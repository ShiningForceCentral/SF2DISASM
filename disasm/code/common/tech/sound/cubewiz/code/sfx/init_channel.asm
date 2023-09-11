
InitChannelDataForSFX:
    ld  (ix+DATA_CURSOR),  e
    ld  (ix+DATA_CURSOR+1),  d
    ld  a, 0C0h
    ld  (ix+STEREO_PANNING), a ; overwritten later below, to remove ?
    xor  a
    ld  (ix+TIME_COUNTER),  a
    ld  (ix+CHANNEL_FREE),  a
    ld  (ix+KEY_RELEASE),  a
    ld  (ix+NO_RELEASE),  a
    ld  (ix+INFINITE_LOOP_START_POINTER), a
    ld  (ix+INFINITE_LOOP_START_POINTER+1), a
    ld  (ix+NOTE_SHIFT), a
    ld  (ix+FREQUENCY_SHIFT), a
    ld  (ix+SLIDE_SPEED), a
    ld  a, 1
    ld  (ix+STEREO_PANNING), a
    ret