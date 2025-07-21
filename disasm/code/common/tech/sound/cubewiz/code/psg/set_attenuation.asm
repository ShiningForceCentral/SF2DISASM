


SetPsgChannelAttenuation:
    and  0Fh
    ld  h, a
    ld  a, (CURRENT_PSG_CHANNEL)
    or  h
    or  90h       ; attenuation command
    ld  (PSG_PORT), a
    ret