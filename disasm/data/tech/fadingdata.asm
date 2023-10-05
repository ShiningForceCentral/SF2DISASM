
; ASM FILE data\tech\fadingdata.asm :
; 0xB1E..0xB96 : Fading data table
table_FadingData:
                ; 80 : end
                ; 8x : go x backward
                dc.b $FA, $FB, $FC, $FD, $FE, $FF, 0, $80
                dc.b $FF, $FE, $FD, $FC, $FB, $FA, $F9, $80
                dc.b 6, 5, 4, 3, 2, 1, 0, $80
                dc.b 1, 2, 3, 4, 5, 6, 7, $80
                dc.b 1, 1, 1, 0, $FF, $FE, $FE, $FE, $FF, 0, $88, 0, 0, 0, 0, 0, 5, $FE, 5, $FE, 5, $FE, 5, $FE, 0, $80
                dc.b 0, 0, 0, 0, 0, 0, $FF, $FE, $80
                dc.b 0, 0, 0, 0, 0, $FF, 0, $80
                dc.b 0, 0, 0, 0, 0, 6, $FE, 6, $FE, 6, $FE, $80
                dc.b 0, $F9, $80
                dc.b 0, 0, 0, 0, 0, 0, 0, $80
                dc.b 0, 0, 0, 0, 0, 0, $F9, $FA, $FB, $FC, $FD, $FE, $80
                dc.b 0, $FE, $FD, $FC, $FB, $FA, $F9, $80
                dc.b 0
