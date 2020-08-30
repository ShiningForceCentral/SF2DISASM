
; GAME SECTION 17 :
; 0x1E0000..0x1F0000 : PCM Banks, YM Instruments, sound driver, char stats, witch screens
; FREE SPACE : 462 bytes.


                incbin "data/sound/pcmbank0.bin"
                incbin "data/sound/pcmbank1.bin"
                incbin "data/sound/yminst.bin"
SoundDriver:    incbin "data/sound/sounddriver.bin"
p_tbl_StatGrowthCurves:
                dc.l tbl_StatGrowthCurves
p_pt_AllyStats: dc.l pt_AllyStats       
p_tbl_AllyStartDefs:
                dc.l tbl_AllyStartDefs  
p_tbl_ClassDefs:dc.l tbl_ClassDefs      
p_JewelEndScreenTiles:
                dc.l JewelsEndScreenTiles
p_JewelEndScreenLayout:
                dc.l JewelsEndScreenLayout
p_plt_JewelsEndScreen:
                dc.l plt_JewelsEndScreen
p_plt_SuspendString:
                dc.l plt_SuspendString
p_SuspendStringTiles:
                dc.l SuspendStringTiles
                dc.l unused_BasePalettes
p_BaseTiles:    dc.l BaseTiles
                include "data\stats\allies\growthcurves.asm"    ; Stat growth curves
                include "data\stats\allies\stats\entries.asm"    ; Ally stats
                include "data\stats\allies\allystartdefs.asm"    ; Ally start definitions
                include "data\stats\allies\classes\classdefs.asm"    ; Class definitions
                
                if (FULL_CLASS_NAMES=1)
                include "data\stats\allies\classes\fullclassnames.asm"
                wordAlign
                endif
                
                includeIfVanillaRom "code\specialscreens\jewelend\graphics.asm"    ; Jewel End Graphics
                includeIfVanillaRom "code\specialscreens\suspend\graphics.asm"    ; Suspend String Graphics
unused_BasePalettes:
                incbin "data/graphics/tech/unusedbasepalettes.bin" ; two almost identical palettes which look like UI/sprites palette
BaseTiles:      incbin "data/graphics/tech/basetiles.bin"
                align $1F0000
