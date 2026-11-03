
; GAME SECTION 17 :
; 0x1E0000..0x1F0000 : PCM Banks, YM Instruments, sound driver, char stats, witch screens
; FREE SPACE : 462 bytes.


                incbinIfVanilla "data/sound/pcmbank0.bin"
                incbinIfVanilla "data/sound/pcmbank1.bin"
                incbinIfVanilla "data/sound/yminst.bin"
                
                incbinIfStandard "data/sound/pcmbank0-standard.bin"
                incbinIfStandard "data/sound/pcmbank1-standard.bin"
                incbinIfStandard "data/sound/yminst-standard.bin"
                
SoundDriver:
                
                incbinIfStandard "data/sound/cubewiz.bin"	; MrCool: Cubewiz sound driver can be located at 0x1ED000 when viewing ROM in hex editor
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
