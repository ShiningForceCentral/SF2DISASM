
; GAME SECTION 17 :
; 0x1E0000..0x1F0000 : PCM Banks, YM Instruments, sound driver, char stats, witch screens
; FREE SPACE : 462 bytes.


                incbin "data/sound/pcmbank0.bin"
                incbin "data/sound/pcmbank1.bin"
                incbin "data/sound/yminst.bin"
SoundDriver:
                
                incbinIfStandard "data/sound/cubewiz.bin"
                incbinIfStandard "data/sound/sfxbank.bin"
                
                incbinIfVanilla "data/sound/sounddriver.bin"
                includeIfVanilla "code\common\tech\pointers\s17_pointers.asm"    ; Game Section 17 Pointers
                includeIfVanilla "data\stats\allies\growthcurves.asm"    ; Stat growth curves
                includeIfVanilla "data\stats\allies\stats\entries.asm"    ; Ally stats
                alignIfVanilla
                includeIfVanilla "data\stats\allies\allystartdefs.asm"    ; Ally start definitions
                includeIfVanilla "data\stats\allies\classes\classdefs.asm"    ; Class definitions
                includeIfVanilla "code\specialscreens\jewelend\graphics.asm"    ; Jewel End Graphics
                includeIfVanilla "code\specialscreens\suspend\graphics.asm"    ; Suspend String Graphics
                includeIfVanilla "code\common\tech\incbins\s17_incbins_basetiles.asm"    ; Game Section 17 Incbin Directives
                alignIfVanilla $1F0000
