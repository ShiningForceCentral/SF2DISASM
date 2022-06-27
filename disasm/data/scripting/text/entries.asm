
; ASM FILE data\scripting\text\entries.asm :
; 0x2EB34..0x4201E : Textbank entries
TextBank00:     incbin "data/scripting/text/textbank00.bin"
TextBank01:     incbin "data/scripting/text/textbank01.bin"
TextBank02:     incbin "data/scripting/text/textbank02.bin"
TextBank03:     incbin "data/scripting/text/textbank03.bin"
TextBank04:     incbin "data/scripting/text/textbank04.bin"
TextBank05:     incbin "data/scripting/text/textbank05.bin"
TextBank06:     incbin "data/scripting/text/textbank06.bin"
TextBank07:     incbin "data/scripting/text/textbank07.bin"
TextBank08:     incbin "data/scripting/text/textbank08.bin"
TextBank09:     incbin "data/scripting/text/textbank09.bin"
TextBank10:     incbin "data/scripting/text/textbank10.bin"
TextBank11:     incbin "data/scripting/text/textbank11.bin"
TextBank12:     incbin "data/scripting/text/textbank12.bin"
TextBank13:     incbin "data/scripting/text/textbank13.bin"
TextBank14:     incbin "data/scripting/text/textbank14.bin"
TextBank15:     incbin "data/scripting/text/textbank15.bin"
TextBank16:     incbin "data/scripting/text/textbank16.bin"
                align 2                 ; added align $2 to make sure we're on an even address
pt_TextBanks:   dc.l TextBank00
                dc.l TextBank01
                dc.l TextBank02
                dc.l TextBank03
                dc.l TextBank04
                dc.l TextBank05
                dc.l TextBank06
                dc.l TextBank07
                dc.l TextBank08
                dc.l TextBank09
                dc.l TextBank10
                dc.l TextBank11
                dc.l TextBank12
                dc.l TextBank13
                dc.l TextBank14
                dc.l TextBank15
                dc.l TextBank16
