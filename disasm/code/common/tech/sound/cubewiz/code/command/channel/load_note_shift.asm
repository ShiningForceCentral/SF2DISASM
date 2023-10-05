


LoadNoteShift:
    inc  de
    ld  a, (de)
    and  8Fh
    bit  7, a
    jr  z, $$skipPadding
    or  0F0h
$$skipPadding:
    ld  (ix+NOTE_SHIFT), a  ; $0x or $Fx depending on byte 7 : value of note shift
    ld  a, (de)
    rrca
    rrca
    rrca
    and  0Eh                ; just keep bytes 6-5-4 multiplied by 2
    ld  (ix+FREQUENCY_SHIFT), a
    inc  de
    ret
