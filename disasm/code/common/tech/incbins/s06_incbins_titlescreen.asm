
; ASM FILE code\common\tech\incbins\s06_incbins_titlescreen.asm :
; 0x2C7A0..0x2E10E : Game Section 06 Incbin Directives, part 2
tiles_UnusedCloud:
                incbin "data/graphics/tech/unusedcloudtiles.bin" ; looks like compressed tiles but no idea of what they represent (32x8 tiles)
font_TitleScreen:
                incbin "data/graphics/tech/fonts/titlescreenfont.bin" 
                                                        ; used for title screen
palette_TitleScreenFont:
                incbin "data/graphics/specialscreens/titlescreen/titlescreenfontpalette.bin"
