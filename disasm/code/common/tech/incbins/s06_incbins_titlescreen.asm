
; ASM FILE code\common\tech\pointers\s06_incbins_titlescreen.asm :
; 0x2C7A0..0x2E10E : Game Section 06 Incbin Directives, part 2
UnusedCloudTiles:
                incbinIfVanilla "data/graphics/tech/unusedcloudtiles.bin" ; looks like compressed tiles but no idea of what they represent (32x8 tiles)
StaticWidthFont:incbin "data/graphics/tech/fonts/staticwidthfont.bin" 
                                                        ; used for title screen
TitleScreenPalettes:
                incbin "data/graphics/specialscreens/titlescreen/titlescreenpalettes.bin"
