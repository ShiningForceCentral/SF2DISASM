
; GAME SECTION 17 :
; 0x1E0000..0x1F0000 : PCM Banks, YM Instruments, sound driver, char stats, witch screens
; FREE SPACE : 462 bytes.


                incbin "data/sound/pcmbank0.bin"
                incbin "data/sound/pcmbank1.bin"
                incbin "data/sound/yminst.bin"
SoundDriver:    incbin "data/sound/sounddriver.bin"
                include "code\common\tech\pointers\s17_pointers.asm"    ; Game Section 17 Pointers
                include "data\stats\allies\growthcurves.asm"    ; Stat growth curves
                include "data\stats\allies\stats\entries.asm"    ; Ally stats
                align
                include "data\stats\allies\allystartdefs.asm"    ; Ally start definitions
                include "data\stats\allies\classes\classdefs.asm"    ; Class definitions
                if (STANDARD_BUILD&FULL_CLASS_NAMES=1)
                    include "data\stats\allies\classes\fullclassnames.asm"
                    align
                endif
                include "code\specialscreens\jewelend\graphics.asm"    ; Jewel End Graphics
                include "code\specialscreens\suspend\graphics.asm"    ; Suspend String Graphics
                include "data\graphics\tech\unusedbasepalettes\entries.asm"    ; Unused base palettes
                include "data\graphics\tech\basetilesentry.asm"    ; Base tiles
                align $1F0000
