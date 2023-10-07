
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
                includeIfVanillaRom "code\specialscreens\jewelend\graphics.asm"    ; Jewel End Graphics
                includeIfVanillaRom "code\specialscreens\suspend\graphics.asm"    ; Suspend String Graphics
                include "code\common\tech\incbins\s17_incbins_basetiles.asm"    ; Game Section 17 Incbin Directives
                align $1F0000
