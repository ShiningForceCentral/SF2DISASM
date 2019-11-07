
; ASM FILE data\graphics\tech\windowlayouts\memberstatswindowlayout.asm :
; 0x16A62..0x16EA6 : Member stats window layout
MemberStatsWindowLayout:
                dc.w $C060
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C061
                dc.w $C860
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                
                if (THREE_DIGITS_STATS=0)
                dc.w $C020
                endif
                
                dc.w $C04C
                dc.w $C056
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                
                if (THREE_DIGITS_STATS=1)
                dc.w $C020              ; LV
                dc.w $C020
                endif
                
                dc.w $C03F
                dc.w $C020
                dc.w $C020
                dc.w $C041
                dc.w $C054
                dc.w $C054
                
                if (THREE_DIGITS_STATS=0)
                dc.w $C020
                endif
                
                dc.w $C020
                dc.w $C03F
                dc.w $C03F
                
                if (THREE_DIGITS_STATS=1)
                dc.w $C03F              ; ATK
                else
                dc.w $C020
                endif
                
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                
                if (THREE_DIGITS_STATS=0)
                dc.w $C020
                endif
                
                dc.w $C048
                dc.w $C050
                dc.w $C020
                dc.w $C03F
                dc.w $C03F
                
                if (THREE_DIGITS_STATS=1)
                dc.w $C03F              ; current HP
                endif
                
                dc.w $C02F
                dc.w $C03F
                dc.w $C03F
                
                if (THREE_DIGITS_STATS=1)
                dc.w $C03F              ; max HP
                endif
                
                dc.w $C020
                dc.w $C020
                dc.w $C044
                dc.w $C045
                dc.w $C046
                
                if (THREE_DIGITS_STATS=0)
                dc.w $C020
                endif
                
                dc.w $C020
                dc.w $C03F
                dc.w $C03F
                
                if (THREE_DIGITS_STATS=1)
                dc.w $C03F              ; DEF
                else
                dc.w $C020
                endif
                
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                
                if (THREE_DIGITS_STATS=0)
                dc.w $C020
                endif
                
                dc.w $C04D
                dc.w $C050
                dc.w $C020
                dc.w $C03F
                dc.w $C03F
                
                if (THREE_DIGITS_STATS=1)
                dc.w $C03F              ; current MP
                endif
                
                dc.w $C02F
                dc.w $C03F
                dc.w $C03F
                
                if (THREE_DIGITS_STATS=1)
                dc.w $C03F              ; max MP
                endif
                
                dc.w $C020
                dc.w $C020
                dc.w $C041
                dc.w $C047
                dc.w $C049
                
                if (THREE_DIGITS_STATS=0)
                dc.w $C020
                endif
                
                dc.w $C020
                dc.w $C03F
                dc.w $C03F
                
                if (THREE_DIGITS_STATS=1)
                dc.w $C03F              ; AGI
                else
                dc.w $C020
                endif
                
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                
                if (THREE_DIGITS_STATS=0)
                dc.w $C020
                endif
                
                dc.w $C045
                dc.w $C058
                dc.w $C050
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                
                if (THREE_DIGITS_STATS=1)
                dc.w $C020              ; EXP
                dc.w $C020
                endif
                
                dc.w $C03F
                dc.w $C020
                dc.w $C020
                dc.w $C04D
                dc.w $C04F
                dc.w $C056
                
                if (THREE_DIGITS_STATS=0)
                dc.w $C020
                endif
                
                dc.w $C020
                dc.w $C03F
                dc.w $C03F
                
                if (THREE_DIGITS_STATS=1)
                dc.w $C03F              ; MOV
                else
                dc.w $C020
                endif
                
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C04D
                dc.w $C041
                dc.w $C047
                dc.w $C049
                dc.w $C043
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C049
                dc.w $C054
                dc.w $C045
                dc.w $C04D
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $C070
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C020
                dc.w $C870
                dc.w $D060
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D061
                dc.w $D860
