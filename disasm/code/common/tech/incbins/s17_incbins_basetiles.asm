
; ASM FILE code\common\tech\pointers\s17_incbins_basetiles.asm :
; 0x29002..0x2C576 : Game Section 17 Incbin Directives
unused_BasePalettes:
                incbinIfVanilla "data/graphics/tech/unusedbasepalettes.bin" ; two almost identical palettes which look like UI/sprites palette
BaseTiles:      incbin "data/graphics/tech/basetiles.bin"
