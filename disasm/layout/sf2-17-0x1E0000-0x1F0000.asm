
; GAME SECTION 17 :
; 0x1E0000..0x1F0000 : PCM Banks, YM Instruments, sound driver, char stats, witch screens
; FREE SPACE : 462 bytes.


                incbin "data/sound/pcmbank0.bin"
                incbin "data/sound/pcmbank1.bin"
                incbin "data/sound/yminst.bin"
SoundDriver:    
            if (STANDARD_BUILD&MUSIC_RESUMING=1)
                incbin "data/sound/cubewiz.bin"
            else
                incbin "data/sound/sounddriver.bin"
            endif
                includeIfVanillaLayout "code\common\tech\pointers\s17_pointers.asm"    ; Game Section 17 Pointers
                includeIfVanillaRom "data\stats\allies\growthcurves.asm"    ; Stat growth curves
                includeIfVanillaRom "data\stats\allies\stats\entries.asm"    ; Ally stats
                align
                includeIfVanillaRom "data\stats\allies\allystartdefs.asm"    ; Ally start definitions
                includeIfVanillaRom "data\stats\allies\classes\classdefs.asm"    ; Class definitions
            if (STANDARD_BUILD&FULL_CLASS_NAMES=1)
                includeIfVanillaRom "data\stats\allies\classes\fullclassnames.asm"
                align
            endif
                includeIfVanillaRom "code\specialscreens\jewelend\graphics.asm"    ; Jewel End Graphics
                includeIfVanillaRom "code\specialscreens\suspend\graphics.asm"    ; Suspend String Graphics
            if (STANDARD_BUILD&EXPANDED_ROM=1)
            else
unused_BasePalettes:
                incbin "data/graphics/tech/unusedbasepalettes.bin" ; two almost identical palettes which look like UI/sprites palette
BaseTiles:      incbin "data/graphics/tech/basetiles.bin"
            endif
                align $1F0000
