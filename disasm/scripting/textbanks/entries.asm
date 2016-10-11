
; SCRIPT SECTION scripting\textbanks\entries :
; Textbank entries
TextBank00:         incbin "scripting/textbanks/textbank00.bin"
TextBank01:         incbin "scripting/textbanks/textbank01.bin"
TextBank02:         incbin "scripting/textbanks/textbank02.bin"
TextBank03:         incbin "scripting/textbanks/textbank03.bin"
TextBank04:         incbin "scripting/textbanks/textbank04.bin"
TextBank05:         incbin "scripting/textbanks/textbank05.bin"
TextBank06:         incbin "scripting/textbanks/textbank06.bin"
TextBank07:         incbin "scripting/textbanks/textbank07.bin"
TextBank08:         incbin "scripting/textbanks/textbank08.bin"
TextBank09:         incbin "scripting/textbanks/textbank09.bin"
TextBank10:         incbin "scripting/textbanks/textbank10.bin"
TextBank11:         incbin "scripting/textbanks/textbank11.bin"
TextBank12:         incbin "scripting/textbanks/textbank12.bin"
TextBank13:         incbin "scripting/textbanks/textbank13.bin"
TextBank14:         incbin "scripting/textbanks/textbank14.bin"
TextBank15:         incbin "scripting/textbanks/textbank15.bin"
TextBank16:         incbin "scripting/textbanks/textbank16.bin"
										align 2                 ; added align $2 to make sure we're on an even address
pt_TextBanks:       dc.l TextBank00
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
